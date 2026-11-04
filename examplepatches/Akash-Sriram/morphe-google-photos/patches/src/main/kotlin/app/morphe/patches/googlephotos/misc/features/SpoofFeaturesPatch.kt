/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/features/SpoofFeaturesPatch.kt
 * SystemProperties spoofing ported from rushiranpise/morphe-patches (SpoofFeaturesPatch.kt)
 */
package app.morphe.patches.googlephotos.misc.features

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.all.misc.transformation.transformInstructionsPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.misc.mapping.ResourceType
import app.morphe.patches.shared.misc.mapping.getResourceId
import app.morphe.patches.shared.misc.mapping.resourceMappingPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Features cleanly hooked to resolve dynamically via DeviceSpoofHelper for unlimited backup tier.
private val BAKED_FEATURES_TO_ENABLE = setOf(
    "com.google.android.apps.photos.NEXUS_PRELOAD",
    "com.google.android.apps.photos.nexus_preload",
    "com.google.android.feature.PIXEL_2020_EXPERIENCE",
)

// Pixel XL system property overrides for native C/C++ checks.
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
    description = "Spoofs the device to enable Google Pixel exclusive features, including unlimited storage.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    val profileOption = stringOption(
        key = "profile",
        default = "auto",
        values = mapOf(
            "auto" to "Auto-Sync (dynamic Pixel XL / Pixel 5)",
            "pixel-xl" to "Pixel XL (Original Quality)",
            "pixel-5" to "Pixel 5 (Storage Saver)",
        ),
        title = "Default backup spoof profile",
        description = "Select the default device profile to spoof for unlimited backup. Used as initial setting and fallback when Flag Manager / Toolkit is not included.",
    )

    dependsOn(
        spoofBuildInfoPatch,
        app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch,
        resourceMappingPatch,
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

    execute {
        val selectedProfile = when (profileOption.value?.lowercase()) {
            "pixel-xl" -> "pixel-xl"
            "pixel-5" -> "pixel-5"
            else -> "auto"
        }
        val helperClassDef = classDefBy("Lapp/morphe/extension/shared/patches/DeviceSpoofHelper;")
        val mutableHelperClass = mutableClassDefBy(helperClassDef)
        val getDefaultProfileMethod = mutableHelperClass.methods.first { it.name == "getDefaultProfile" }
        getDefaultProfileMethod.returnEarly(selectedProfile)

        val idOq = getResourceId(ResourceType.STRING, "photos_backup_settings_quality_oq_desc")
        val idSaver = getResourceId(ResourceType.STRING, "photos_devicesetup_basicstoragepolicy_impl_high_quality_photo_resolution")
        val idExpress = getResourceId(ResourceType.STRING, "photos_devicesetup_basicstoragepolicy_impl_basic_quality_photo_resolution")

        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/morphe/")) return@classDefForEach
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach classLoop@{ method ->
                val implementation = method.implementation ?: return@classLoop
                val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                // 1. Hook Backup Quality row visibility in Google Photos settings (e.g. Lukm.<init>)
                if (method.name == "<init>" &&
                    method.parameterTypes.size == 7 &&
                    method.parameterTypes[0] == "Z" &&
                    method.parameterTypes[1] == "Z" &&
                    method.parameterTypes[2] == "Z" &&
                    method.returnType == "V"
                ) {
                    val iputIndex = implementation.instructions.indexOfFirst { it.opcode == Opcode.IPUT_BOOLEAN }
                    if (iputIndex != -1) {
                        val iputInstr = implementation.instructions.elementAt(iputIndex) as OneRegisterInstruction
                        val reg = iputInstr.registerA
                        mutableMethod.addInstructions(
                            iputIndex,
                            """
                                invoke-static { v$reg }, Lapp/morphe/extension/shared/patches/DeviceSpoofHelper;->shouldShowQualitySelector(Z)Z
                                move-result v$reg
                            """.trimIndent(),
                        )
                    }
                }

                val instructionList = implementation.instructions.toList()

                // 2. Hook Backup Quality option cards (device indicators & option disablement)
                val qualityOptionCalls = mutableListOf<Triple<Int, Int, Int>>() // invokeIndex, qualityType, descReg
                var currentQualityType: Int? = null
                var lastQualityIndex = -100

                for (index in instructionList.indices) {
                    val instr = instructionList[index]
                    val literal = (instr as? WideLiteralInstruction)?.wideLiteral
                    if (literal != null) {
                        when (literal) {
                            idOq -> { currentQualityType = 0; lastQualityIndex = index }
                            idSaver -> { currentQualityType = 1; lastQualityIndex = index }
                            idExpress -> { currentQualityType = 2; lastQualityIndex = index }
                        }
                    }

                    if (currentQualityType != null && (index - lastQualityIndex) in 1..25) {
                        if (instr.opcode == Opcode.INVOKE_STATIC || instr.opcode == Opcode.INVOKE_STATIC_RANGE) {
                            val methodRef = (instr as? ReferenceInstruction)?.reference as? MethodReference
                            if (methodRef != null &&
                                methodRef.parameterTypes.size == 6 &&
                                methodRef.parameterTypes[0] == "Ljava/lang/String;" &&
                                methodRef.parameterTypes[1] == "Z" &&
                                methodRef.parameterTypes[3] == "Ljava/util/List;" &&
                                methodRef.parameterTypes[5] == "I" &&
                                methodRef.returnType == "V"
                            ) {
                                val descReg = when (instr) {
                                    is Instruction35c -> instr.registerF
                                    is Instruction3rc -> instr.startRegister + 3
                                    else -> null
                                }
                                if (descReg != null) {
                                    qualityOptionCalls.add(Triple(index, currentQualityType, descReg))
                                    currentQualityType = null
                                }
                            }
                        }
                    }
                }

                if (qualityOptionCalls.isNotEmpty()) {
                    for ((invokeIndex, qType, descReg) in qualityOptionCalls.reversed()) {
                        val nextInstruction = mutableMethod.getInstruction(invokeIndex + 1)
                        mutableMethod.addInstructionsWithLabels(
                            invokeIndex,
                            """
                                move-object/from16 v1, v$descReg
                                const/4 v0, $qType
                                invoke-static { v0, v1 }, Lapp/morphe/extension/shared/patches/DeviceSpoofHelper;->getEnhancedQualityDescriptions(ILjava/util/List;)Ljava/util/List;
                                move-result-object v1
                                move-object/from16 v$descReg, v1
                                invoke-static { v0 }, Lapp/morphe/extension/shared/patches/DeviceSpoofHelper;->isQualityOptionEnabled(I)Z
                                move-result v0
                                if-eqz v0, :skip_opt_$invokeIndex
                            """.trimIndent(),
                            ExternalLabel("skip_opt_$invokeIndex", nextInstruction),
                        )
                    }
                }

                // 3. String features & reupload dialog suppression
                for (index in instructionList.indices.reversed()) {
                    val instruction = instructionList[index]
                    val string = ((instruction as? Instruction21c)?.reference as? StringReference)?.string
                        ?: continue

                    if (string in BAKED_FEATURES_TO_ENABLE) {
                        val reg = (instruction as OneRegisterInstruction).registerA
                        mutableMethod.addInstructions(
                            index + 1,
                            "invoke-static { v$reg }, Lapp/morphe/extension/shared/patches/DeviceSpoofHelper;->resolveSystemFeature(Ljava/lang/String;)Ljava/lang/String;\n" +
                            "move-result-object v$reg",
                        )
                    }

                    // Suppress "Upgrade existing backups?" popup when switching backup quality
                    if (string == "ConfirmReuploadDialogFragment") {
                        val nextIndex = index + 1
                        val nextInstr = instructionList.getOrNull(nextIndex)
                        if (nextInstr != null && (nextInstr.opcode == Opcode.INVOKE_VIRTUAL || nextInstr.opcode == Opcode.INVOKE_VIRTUAL_RANGE)) {
                            mutableMethod.replaceInstruction(nextIndex, "nop")
                        }
                    }
                }

                // 4. SystemProperties.get() callsites
                val hasSystemPropCall = implementation.instructions.any { instr ->
                    val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                    ref != null && ref.isSystemPropertiesStringGetter()
                }
                if (hasSystemPropCall) {
                    mutableMethod.patchSystemPropertyReads(SYSTEM_PROPERTY_OVERRIDES)
                }
            }
        }
    }
}


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
    for (index in instructionList.indices.reversed()) {
        val instruction = instructionList[index]
        val methodReference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: continue
        if (!methodReference.isSystemPropertiesStringGetter()) continue

        val keyRegister = (instruction as? ReferenceInstruction)?.firstInvokeRegister() ?: continue
        val key = instructionList.constStringValueBefore(index, keyRegister) ?: continue
        if (key !in overrides) continue
        val moveResult = instructionList.getOrNull(index + 1)
        if (moveResult?.opcode != Opcode.MOVE_RESULT_OBJECT) continue

        // Dynamically resolve system property through DeviceSpoofHelper so it respects Auto / Pixel XL / Pixel 5 / Stock
        replaceInstruction(
            index,
            "invoke-static { v$keyRegister }, Lapp/morphe/extension/shared/patches/DeviceSpoofHelper;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;",
        )
    }
}
