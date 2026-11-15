/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.addInstructionsAtControlFlowLabel
import app.template.patches.shared.getFreeRegisterProvider
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstInstructionOrThrow
import app.template.patches.shared.p0Register
import app.template.patches.shared.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/extension/InstagramHideNavigationButtonsPatch;"

private object InitializeNavigationButtonsListFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/instagram/common/session/UserSession;", "Z"),
    returnType = "Ljava/util/List;",
)

private object NavigationButtonsEnumClassFingerprint : Fingerprint(
    strings = listOf("FEED", "fragment_feed", "SEARCH", "fragment_search"),
)

private object NavigationButtonsEnumInitFingerprint : Fingerprint(
    name = "<init>",
    classFingerprint = NavigationButtonsEnumClassFingerprint,
)

private object NavigationButtonsEnumClinitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("SEARCH", "fragment_search"),
    filters = listOf(
        string("FEED"),
        string("fragment_feed", MatchAfterWithin(2)),
        methodCall(definingClass = "this", name = "<init>", location = MatchAfterWithin(2)),
    ),
)

@Suppress("unused")
val instagramHideNavigationButtonsPatch = bytecodePatch(
    name = "Hide navigation buttons",
    description = "Hides navigation bar buttons, such as the Reels and Create button. " +
        "Choose what button to hide using the patch options.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    val hideHome by booleanOption(
        key = "hideHome",
        default = false,
        title = "Hide Home",
        description = "Permanently hides the Home button. App starts at next available tab.",
    )

    val hideReels by booleanOption(
        key = "hideReels",
        default = true,
        title = "Hide Reels",
        description = "Permanently hides the Reels button.",
    )

    val hideDirect by booleanOption(
        key = "hideDirect",
        default = false,
        title = "Hide Direct",
        description = "Permanently hides the Direct button.",
    )

    val hideSearch by booleanOption(
        key = "hideSearch",
        default = false,
        title = "Hide Search",
        description = "Permanently hides the Search button.",
    )

    val hideProfile by booleanOption(
        key = "hideProfile",
        default = false,
        title = "Hide Profile",
        description = "Permanently hides the Profile button.",
    )

    val hideCreate by booleanOption(
        key = "hideCreate",
        default = true,
        title = "Hide Create",
        description = "Permanently hides the Create button.",
    )

    execute {
        val buttonsToRemove = buildList {
            if (hideHome == true) add("fragment_feed")
            if (hideReels == true) add("fragment_clips")
            if (hideDirect == true) add("fragment_direct_tab")
            if (hideSearch == true) add("fragment_search")
            if (hideCreate == true) add("fragment_share")
            if (hideProfile == true) add("fragment_profile")
        }

        if (buttonsToRemove.isEmpty()) {
            return@execute Logger.getLogger(this::class.java.name).warning(
                "No hide navigation buttons options are enabled. No changes made.",
            )
        }

        val enumNameField = resolveNavigationFragmentField()

        InitializeNavigationButtonsListFingerprint.method.apply {
            val returnIndex = indexOfFirstInstructionOrThrow(Opcode.RETURN_OBJECT)
            val buttonsListRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            if (buttonsListRegister <= 15) {
                val regs = getFreeRegisterProvider(returnIndex, 2, buttonsListRegister)
                val freeRegister = regs.getFreeRegister4Bit()
                val freeRegister2 = regs.getFreeRegister4Bit()

                val removalInstructions = buttonsToRemove.joinToString("\n") { buttonEnumName ->
                    """
                        const-string v$freeRegister, "$buttonEnumName"
                        const-string v$freeRegister2, "$enumNameField"
                        invoke-static { v$buttonsListRegister, v$freeRegister, v$freeRegister2 }, $EXTENSION_CLASS_DESCRIPTOR->removeNavigationButtonByName(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
                        move-result-object v$buttonsListRegister
                    """.trimIndent()
                }
                addInstructionsAtControlFlowLabel(returnIndex, removalInstructions)
            } else {
                val regs = getFreeRegisterProvider(returnIndex, 3, buttonsListRegister)
                val listTmp = regs.getFreeRegister4Bit()
                val freeRegister = regs.getFreeRegister4Bit()
                val freeRegister2 = regs.getFreeRegister4Bit()

                val removalInstructions = buildString {
                    appendLine("move-object/16 v$listTmp, v$buttonsListRegister")
                    for (buttonEnumName in buttonsToRemove) {
                        appendLine("""const-string v$freeRegister, "$buttonEnumName"""")
                        appendLine("""const-string v$freeRegister2, "$enumNameField"""")
                        appendLine(
                            "invoke-static { v$listTmp, v$freeRegister, v$freeRegister2 }, " +
                                "$EXTENSION_CLASS_DESCRIPTOR->removeNavigationButtonByName(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;",
                        )
                        appendLine("move-result-object v$listTmp")
                    }
                    append("move-object/16 v$buttonsListRegister, v$listTmp")
                }
                addInstructionsAtControlFlowLabel(returnIndex, removalInstructions)
            }
        }
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun resolveNavigationFragmentField(): String {
    val clinitMatch = NavigationButtonsEnumClinitFingerprint.matchOrNull()
    if (clinitMatch != null) {
        val literalRegister = clinitMatch.instructionMatches[1].getInstruction<OneRegisterInstruction>().registerA
        val constructorCall = clinitMatch.instructionMatches[2]
        val constructorRef = constructorCall.instruction.getReference<com.android.tools.smali.dexlib2.iface.reference.MethodReference>()
        val argIndex = constructorCall.instruction.registersUsed.indexOf(literalRegister)
        if (constructorRef != null && argIndex >= 0) {
            val constructor = Fingerprint(
                definingClass = constructorRef.definingClass,
                name = constructorRef.name,
                parameters = constructorRef.parameterTypes.map(CharSequence::toString),
            ).originalMethod
            val paramReg = constructor.p0Register + argIndex
            val fieldIdx = constructor.indexOfFirstInstructionOrThrow {
                opcode == Opcode.IPUT_OBJECT && (this as TwoRegisterInstruction).registerA == paramReg
            }
            return constructor.getInstruction(fieldIdx).getReference<FieldReference>()?.name
                ?: throw PatchException("Failed to resolve navigation enum fragment field from constructor")
        }
    }

    with(NavigationButtonsEnumInitFingerprint.method) {
        val targetParamReg = p0Register + 2
        val fieldIdx = indexOfFirstInstructionOrThrow {
            opcode == Opcode.IPUT_OBJECT && (this as TwoRegisterInstruction).registerA == targetParamReg
        }
        return getInstruction(fieldIdx).getReference<FieldReference>()!!.name
    }
}
