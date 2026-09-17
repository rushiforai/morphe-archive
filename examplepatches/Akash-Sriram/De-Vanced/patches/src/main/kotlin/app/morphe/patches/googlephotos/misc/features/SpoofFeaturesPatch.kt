/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/features/SpoofFeaturesPatch.kt
 * SystemProperties spoofing ported from rushiranpise/morphe-patches (SpoofFeaturesPatch.kt)
 */
package app.morphe.patches.googlephotos.misc.features

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.all.misc.transformation.transformInstructionsPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

// Pixel XL (marlin) system property overrides.
// These cover native C/C++ paths that read SystemProperties directly,
// bypassing the Java Build.* fields that baseSpoofBuildInfoPatch already overrides.
private val SYSTEM_PROPERTY_OVERRIDES = mapOf(
    "ro.product.model"                    to "Pixel XL",
    "ro.product.model_for_attestation"    to "Pixel XL",
    "ro.product.device"                   to "marlin",
    "ro.product.device_for_attestation"   to "marlin",
    "ro.product.name"                     to "marlin",
    "ro.product.name_for_attestation"     to "marlin",
    "ro.product.brand"                    to "google",
    "ro.product.manufacturer"             to "Google",
    "ro.build.fingerprint"                to "google/marlin/marlin:10/QP1A.191005.007.A3/5972272:user/release-keys",
)

@Suppress("unused")
val spoofFeaturesPatch = bytecodePatch(
    name = "Spoof features",
    description = "Spoofs the device to enable Google Pixel exclusive features, including unlimited storage and modern UI.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    dependsOn(
        spoofBuildInfoPatch,
        app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch,
        transformInstructionsPatch(
            filterMap = filterMap@{ classDef, _, instruction, instructionIndex ->
                if (classDef.type.startsWith("Lapp/morphe/extension/")) return@filterMap null
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return@filterMap null

                val methodRef = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@filterMap null

                if (methodRef.definingClass == "Landroid/media/MediaFormat;" &&
                    methodRef.name == "setInteger" &&
                    methodRef.returnType == "V" &&
                    methodRef.parameterTypes == listOf("Ljava/lang/String;", "I")) {
                    return@filterMap instructionIndex to instruction
                }

                null
            },
            transform = transform@{ mutableMethod, (index, instruction) ->
                val args = when (instruction) {
                    is Instruction35c -> with(instruction) {
                        arrayOf(registerC, registerD, registerE, registerF, registerG)
                            .take(registerCount).joinToString(", ") { "v$it" }
                    }
                    is Instruction3rc -> with(instruction) {
                        (startRegister until startRegister + registerCount).joinToString(", ") { "v$it" }
                    }
                    else -> return@transform
                }
                mutableMethod.replaceInstruction(
                    index,
                    "invoke-static { $args }, Lapp/morphe/extension/shared/patches/ExynosVideoFix;->setInteger(Landroid/media/MediaFormat;Ljava/lang/String;I)V",
                )
            },
        ),
    )

    val featuresToEnable by stringsOption(
        key = "featuresToEnable",
        default = listOf(
            "com.google.android.apps.photos.NEXUS_PRELOAD",
            "com.google.android.apps.photos.nexus_preload",
        ),
        title = "Features to enable",
        description = "Google Pixel exclusive features to enable.",
        required = true,
    )

    val featuresToDisable by stringsOption(
        key = "featuresToDisable",
        default = emptyList(),
        title = "Features to disable",
        description = "Google Pixel exclusive features to disable.",
        required = true,
    )

    execute {
        @Suppress("NAME_SHADOWING")
        val featuresToEnable = featuresToEnable!!.toSet()

        @Suppress("NAME_SHADOWING")
        val featuresToDisable = featuresToDisable!!.toSet()

        getAllClassesWithStrings().forEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach classLoop@{ method ->
                val implementation = method.implementation ?: return@classLoop
                val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                var didPatchFeatureFlag = false
                implementation.instructions.forEachIndexed { index, instruction ->
                    val string = ((instruction as? Instruction21c)?.reference as? StringReference)?.string
                        ?: return@forEachIndexed

                    val transformedString = when (string) {
                        in featuresToEnable -> "android.hardware.wifi"
                        in featuresToDisable -> "dummy"
                        else -> return@forEachIndexed
                    }

                    mutableMethod.replaceInstruction(
                        index,
                        BuilderInstruction21c(
                            Opcode.CONST_STRING,
                            (instruction as OneRegisterInstruction).registerA,
                            ImmutableStringReference(transformedString),
                        ),
                    )
                    didPatchFeatureFlag = true
                }

                // Also patch SystemProperties.get() callsites in any method that we touched,
                // and in methods that call SystemProperties.get() directly (to cover native paths).
                val implInstructions = implementation.instructions.toList()
                val hasSystemPropCall = implInstructions.any { instr ->
                    val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                    ref != null && ref.isSystemPropertiesStringGetter()
                }
                if (hasSystemPropCall) {
                    mutableMethod.patchSystemPropertyReads(SYSTEM_PROPERTY_OVERRIDES)
                }
            }
        }

        // Sweep remaining classes for SystemProperties.get() callsites not already covered above.
        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach classLoop@{ method ->
                val implementation = method.implementation ?: return@classLoop
                val implInstructions = implementation.instructions.toList()
                val hasSystemPropCall = implInstructions.any { instr ->
                    val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                    ref != null && ref.isSystemPropertiesStringGetter()
                }
                if (!hasSystemPropCall) return@classLoop
                val mutableMethod = mutableClass.findMutableMethodOf(method)
                mutableMethod.patchSystemPropertyReads(SYSTEM_PROPERTY_OVERRIDES)
            }
        }
    }
}

private fun String.escapeSmali() = replace("\\", "\\\\").replace("\"", "\\\"")

private fun MethodReference.isSystemPropertiesStringGetter(): Boolean =
    definingClass == "Landroid/os/SystemProperties;" &&
        name == "get" &&
        returnType == "Ljava/lang/String;" &&
        parameterTypes.size in 1..2 &&
        parameterTypes.all { it == "Ljava/lang/String;" }

private fun ReferenceInstruction.firstInvokeRegister(): Int? =
    when (this) {
        is Instruction35c -> registerC
        is Instruction3rc -> startRegister
        else -> null
    }

private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>.constStringValueBefore(
    index: Int,
    register: Int,
): String? {
    val start = maxOf(0, index - 8)
    for (previousIndex in index - 1 downTo start) {
        val instruction = this[previousIndex]
        if (instruction.opcode !in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)) continue
        val oneRegisterInstruction = instruction as? OneRegisterInstruction ?: continue
        if (oneRegisterInstruction.registerA != register) continue
        return ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
    }
    return null
}

private fun MutableMethod.patchSystemPropertyReads(overrides: Map<String, String>) {
    if (overrides.isEmpty()) return

    val instructionList = instructions.toList()
    instructionList.forEachIndexed { index, instruction ->
        val methodReference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@forEachIndexed
        if (!methodReference.isSystemPropertiesStringGetter()) return@forEachIndexed

        val keyRegister = (instruction as? ReferenceInstruction)?.firstInvokeRegister() ?: return@forEachIndexed
        val key = instructionList.constStringValueBefore(index, keyRegister) ?: return@forEachIndexed
        val replacement = overrides[key] ?: return@forEachIndexed
        val moveResult = instructionList.getOrNull(index + 1)
        if (moveResult?.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEachIndexed

        val resultRegister = (moveResult as? OneRegisterInstruction)?.registerA ?: return@forEachIndexed
        replaceInstruction(index, "nop")
        replaceInstruction(index + 1, "const-string v$resultRegister, \"${replacement.escapeSmali()}\"")
    }
}
