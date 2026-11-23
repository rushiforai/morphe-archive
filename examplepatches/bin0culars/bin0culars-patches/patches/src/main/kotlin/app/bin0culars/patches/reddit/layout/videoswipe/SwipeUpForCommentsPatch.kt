package app.bin0culars.patches.reddit.layout.videoswipe

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.MEDIA
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/SwipeUpForCommentsPatch;"

@Suppress("unused")
val swipeUpForCommentsPatch =
    patch(
        name = "Swipe up for comments",
        description = "In the full-screen video player, swiping up opens the comments and the next video is a sideways swipe away. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "swipe_up_for_comments",
                    section = MEDIA,
                    title = "Swipe up for comments",
                    summary =
                    "In the full-screen video player, swiping up opens the comments instead of the next video. Swipe left or right to move to the next video. Restart Reddit after changing this.",
                    default = false,
                ),
            )

            val flagsType = VideoPlayerFlagsConstructorFingerprint.classDef.type

            val verticalMatch = ChainingModeChoiceFingerprint.instructionMatches.firstOrNull()
                ?: throw PatchException("Could not find ChainingMode.Vertical instruction match")
            val verticalIndex = verticalMatch.index

            val chainingInstructions = ChainingModeChoiceFingerprint.method.instructions
            var lazyField: FieldReference? = null
            for (i in verticalIndex - 1 downTo 0) {
                val instruction = chainingInstructions[i]
                if (instruction.opcode == Opcode.IGET_OBJECT) {
                    val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    if (fieldRef != null && fieldRef.definingClass == flagsType) {
                        lazyField = fieldRef
                        break
                    }
                }
            }
            val resolvedLazyField = lazyField
                ?: throw PatchException("Could not find iget-object for flags class $flagsType before ChainingMode.Vertical")

            val constructorMethod = VideoPlayerFlagsConstructorFingerprint.method
            val constructorInstructions = constructorMethod.instructions

            var iputIndex = -1
            for (i in constructorInstructions.indices) {
                val instruction = constructorInstructions[i]
                if (instruction.opcode == Opcode.IPUT_OBJECT) {
                    val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    if (fieldRef == resolvedLazyField) {
                        iputIndex = i
                        break
                    }
                }
            }
            if (iputIndex == -1) {
                throw PatchException("Could not find iput-object for lazy field ${resolvedLazyField.name} in flags constructor")
            }

            var lambdaType: String? = null
            var invokeDirectIndex = -1
            for (i in iputIndex - 1 downTo 0) {
                val instruction = constructorInstructions[i]
                if (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) {
                    val methodRef = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (methodRef != null &&
                        methodRef.name == "<init>" &&
                        methodRef.parameterTypes.map { it.toString() } == listOf(flagsType, "I")
                    ) {
                        lambdaType = methodRef.definingClass
                        invokeDirectIndex = i
                        break
                    }
                }
            }
            if (lambdaType == null || invokeDirectIndex == -1) {
                throw PatchException("Could not find invoke-direct <init>($flagsType, I) before iput-object in flags constructor")
            }

            var caseNumber: Int? = null
            for (i in invokeDirectIndex - 1 downTo 0) {
                val instruction = constructorInstructions[i]
                if ((instruction.opcode == Opcode.CONST_4 || instruction.opcode == Opcode.CONST_16) &&
                    instruction is NarrowLiteralInstruction
                ) {
                    caseNumber = instruction.narrowLiteral
                    break
                }
            }
            val resolvedCaseNumber = caseNumber
                ?: throw PatchException("Could not find const-4 or const-16 instruction before invoke-direct in flags constructor")

            val lambdaClass = mutableClassDefBy(lambdaType)
            val invokeMethod = lambdaClass.methods.firstOrNull { method ->
                method.name == "invoke" &&
                    method.parameterTypes.isEmpty() &&
                    method.returnType == "Ljava/lang/Object;"
            } ?: throw PatchException("Could not find invoke()Ljava/lang/Object; method in $lambdaType")

            val intFields = lambdaClass.fields.filter { it.type == "I" }
            if (intFields.size != 1) {
                throw PatchException("Expected exactly one field of type 'I' in $lambdaType, found ${intFields.size}")
            }
            val caseField = intFields.first().name

            val smali =
                """
                invoke-static {}, $EXTENSION_CLASS->isEnabled()Z
                move-result v0
                if-eqz v0, :original
                iget v0, p0, $lambdaType->$caseField:I
                const/16 v1, $resolvedCaseNumber
                if-ne v0, v1, :original
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
                :original
                nop
                """.trimIndent()

            invokeMethod.addInstructionsWithLabels(0, smali)
        }
    }
