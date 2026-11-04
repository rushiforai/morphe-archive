/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/all/misc/build/BaseSpoofBuildInfoPatch.kt
 */
package app.morphe.patches.all.misc.build

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.transformation.transformInstructionsPatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val BUILD_CLASS_DESCRIPTOR = "Landroid/os/Build;"
private const val DEVICE_SPOOF_HELPER = "Lapp/morphe/extension/shared/patches/DeviceSpoofHelper;"

/**
 * Maps identity-critical Build field names to their DeviceSpoofHelper no-arg getter methods.
 *
 * WHY: The 1.17.7 release introduced DYNAMIC_BUILD_FIELDS which excluded MODEL, DEVICE,
 * FINGERPRINT, MANUFACTURER, BRAND, and PRODUCT from static smali replacement, delegating
 * them to runtime reflection via DeviceSpoofHelper.applyBuildSpoof(). On Android 12+
 * (API 31+), mutating static final fields via reflection throws IllegalAccessException,
 * which is silently swallowed — leaving the real device identity exposed and causing
 * Google's backup servers to charge quota (issue #63).
 *
 * FIX: Instead of reflection, replace every SGET of these fields at the smali callsite
 * with an invoke-static to the corresponding DeviceSpoofHelper getter. The result is
 * baked into the APK bytecode, requires no reflection, and works on all Android versions.
 */
private val DYNAMIC_FIELD_GETTERS = mapOf(
    "BRAND"        to "getBrand",
    "DEVICE"       to "getDevice",
    "FINGERPRINT"  to "getFingerprint",
    "MANUFACTURER" to "getManufacturer",
    "MODEL"        to "getModel",
    "PRODUCT"      to "getProduct",
)

/** Class-type prefixes where Build spoofing must be suppressed (codec / media stack). */
private val EXCLUDED_TYPE_PREFIXES = listOf(
    "Lapp/morphe/",
    "Landroidx/media",
    "Lcom/google/android/exoplayer2",
    "Lcom/google/android/apps/photos/videoplayer",
    "Lcom/google/android/apps/photos/photoeditor",
)
private val EXCLUDED_TYPE_SEGMENTS = listOf("/media/", "/video/", "/videoplayer/", "/codec/")

private fun String.isSpoofExcluded() =
    EXCLUDED_TYPE_PREFIXES.any { startsWith(it) } ||
    EXCLUDED_TYPE_SEGMENTS.any { contains(it) }

fun baseSpoofBuildInfoPatch(buildInfoSupplier: () -> BuildInfo) = bytecodePatch {
    val replacements by lazy {
        with(buildInfoSupplier()) {
            buildMap {
                if (board        != null) put("BOARD",        "const-string" to "\"$board\"")
                if (bootloader   != null) put("BOOTLOADER",   "const-string" to "\"$bootloader\"")
                if (cpuAbi       != null) put("CPU_ABI",      "const-string" to "\"$cpuAbi\"")
                if (cpuAbi2      != null) put("CPU_ABI2",     "const-string" to "\"$cpuAbi2\"")
                if (display      != null) put("DISPLAY",      "const-string" to "\"$display\"")
                if (hardware     != null) put("HARDWARE",     "const-string" to "\"$hardware\"")
                if (host         != null) put("HOST",         "const-string" to "\"$host\"")
                if (id           != null) put("ID",           "const-string" to "\"$id\"")
                if (odmSku       != null) put("ODM_SKU",      "const-string" to "\"$odmSku\"")
                if (radio        != null) put("RADIO",        "const-string" to "\"$radio\"")
                if (serial       != null) put("SERIAL",       "const-string" to "\"$serial\"")
                if (sku          != null) put("SKU",          "const-string" to "\"$sku\"")
                if (socManufacturer != null) put("SOC_MANUFACTURER", "const-string" to "\"$socManufacturer\"")
                if (socModel     != null) put("SOC_MODEL",    "const-string" to "\"$socModel\"")
                if (tags         != null) put("TAGS",         "const-string" to "\"$tags\"")
                if (time         != null) put("TIME",         "const-wide" to "$time")
                if (type         != null) put("TYPE",         "const-string" to "\"$type\"")
                if (user         != null) put("USER",         "const-string" to "\"$user\"")
                // BRAND, DEVICE, FINGERPRINT, MANUFACTURER, MODEL, PRODUCT are handled
                // by Pass 2 below — they route through DeviceSpoofHelper getters so the
                // active profile (Pixel XL / Pixel 5 / Auto) is respected at runtime.
            }
        }
    }

    dependsOn(
        // Pass 1: const-string replacement for non-dynamic Build fields (BOARD, TAGS, …)
        transformInstructionsPatch(
            filterMap = filterMap@{ classDef, _, instruction, instructionIndex ->
                if (classDef.type.isSpoofExcluded()) return@filterMap null

                val reference = instruction.getReference<FieldReference>() ?: return@filterMap null
                if (reference.definingClass != BUILD_CLASS_DESCRIPTOR) return@filterMap null
                if (reference.name in DYNAMIC_FIELD_GETTERS) return@filterMap null   // handled in Pass 2

                return@filterMap replacements[reference.name]?.let { instructionIndex to it }
            },
            transform = { mutableMethod, (index, replacement) ->
                val (opcode, operand) = replacement
                val register = mutableMethod.getInstruction<OneRegisterInstruction>(index).registerA
                mutableMethod.replaceInstruction(index, "$opcode v$register, $operand")
            },
        ),

        // Pass 2: Replace SGET of identity-critical Build fields with DeviceSpoofHelper calls.
        //
        // Before (1 instruction):
        //   sget-object vN, Landroid/os/Build;->MODEL:Ljava/lang/String;
        //
        // After (2 instructions, inserted at reversed index so offsets stay valid):
        //   invoke-static {}, DeviceSpoofHelper->getModel()Ljava/lang/String;
        //   move-result-object vN
        //
        // The transform receives indices in reversed order (largest index first) so inserting
        // an extra instruction at `index+1` does not invalidate earlier indices.
        transformInstructionsPatch(
            filterMap = filterMap@{ classDef, _, instruction, instructionIndex ->
                if (classDef.type.isSpoofExcluded()) return@filterMap null

                val reference = instruction.getReference<FieldReference>() ?: return@filterMap null
                if (reference.definingClass != BUILD_CLASS_DESCRIPTOR) return@filterMap null
                val getter = DYNAMIC_FIELD_GETTERS[reference.name] ?: return@filterMap null

                return@filterMap instructionIndex to getter
            },
            transform = { mutableMethod, (index, getter) ->
                val register = mutableMethod.getInstruction<OneRegisterInstruction>(index).registerA
                // Replace the sget-object with invoke-static and append move-result-object.
                mutableMethod.replaceInstruction(
                    index,
                    "invoke-static {}, $DEVICE_SPOOF_HELPER->$getter()Ljava/lang/String;",
                )
                mutableMethod.addInstructions(
                    index + 1,
                    "move-result-object v$register",
                )
            },
        ),
    )
}
