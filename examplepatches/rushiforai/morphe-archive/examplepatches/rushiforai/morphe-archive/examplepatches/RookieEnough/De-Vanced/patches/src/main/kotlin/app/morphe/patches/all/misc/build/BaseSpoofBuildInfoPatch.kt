/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/all/misc/build/BaseSpoofBuildInfoPatch.kt
 */
package app.morphe.patches.all.misc.build

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.transformation.transformInstructionsPatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val BUILD_CLASS_DESCRIPTOR = "Landroid/os/Build;"

fun baseSpoofBuildInfoPatch(buildInfoSupplier: () -> BuildInfo) = bytecodePatch {
    // Lazy, so that patch options above are initialized before they are accessed.
    val replacements by lazy {
        with(buildInfoSupplier()) {
            buildMap {
                if (board != null) put("BOARD", "const-string" to "\"$board\"")
                if (bootloader != null) put("BOOTLOADER", "const-string" to "\"$bootloader\"")
                if (brand != null) put("BRAND", "const-string" to "\"$brand\"")
                if (cpuAbi != null) put("CPU_ABI", "const-string" to "\"$cpuAbi\"")
                if (cpuAbi2 != null) put("CPU_ABI2", "const-string" to "\"$cpuAbi2\"")
                if (device != null) put("DEVICE", "const-string" to "\"$device\"")
                if (display != null) put("DISPLAY", "const-string" to "\"$display\"")
                if (fingerprint != null) put("FINGERPRINT", "const-string" to "\"$fingerprint\"")
                if (hardware != null) put("HARDWARE", "const-string" to "\"$hardware\"")
                if (host != null) put("HOST", "const-string" to "\"$host\"")
                if (id != null) put("ID", "const-string" to "\"$id\"")
                if (manufacturer != null) put("MANUFACTURER", "const-string" to "\"$manufacturer\"")
                if (model != null) put("MODEL", "const-string" to "\"$model\"")
                if (odmSku != null) put("ODM_SKU", "const-string" to "\"$odmSku\"")
                if (product != null) put("PRODUCT", "const-string" to "\"$product\"")
                if (radio != null) put("RADIO", "const-string" to "\"$radio\"")
                if (serial != null) put("SERIAL", "const-string" to "\"$serial\"")
                if (sku != null) put("SKU", "const-string" to "\"$sku\"")
                if (socManufacturer != null) put("SOC_MANUFACTURER", "const-string" to "\"$socManufacturer\"")
                if (socModel != null) put("SOC_MODEL", "const-string" to "\"$socModel\"")
                if (tags != null) put("TAGS", "const-string" to "\"$tags\"")
                if (time != null) put("TIME", "const-wide" to "$time")
                if (type != null) put("TYPE", "const-string" to "\"$type\"")
                if (user != null) put("USER", "const-string" to "\"$user\"")
            }
        }
    }

    dependsOn(
        transformInstructionsPatch(
            filterMap = filterMap@{ _, _, instruction, instructionIndex ->
                val reference = instruction.getReference<FieldReference>() ?: return@filterMap null
                if (reference.definingClass != BUILD_CLASS_DESCRIPTOR) return@filterMap null

                return@filterMap replacements[reference.name]?.let { instructionIndex to it }
            },
            transform = { mutableMethod, entry ->
                val (index, replacement) = entry
                val (opcode, operand) = replacement
                val register = mutableMethod.getInstruction<OneRegisterInstruction>(index).registerA

                mutableMethod.replaceInstruction(index, "$opcode v$register, $operand")
            },
        ),
    )
}
