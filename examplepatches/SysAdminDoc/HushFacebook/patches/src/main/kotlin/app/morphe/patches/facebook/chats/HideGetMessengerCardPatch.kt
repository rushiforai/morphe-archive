/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val HIDE = "$EXTENSION_PACKAGE/chats/MessengerCard;->hide()Z"

/**
 * Has the Messenger card's show question answer no while Messenger is installed and the switch is
 * on. See MessengerCardAnchors.kt for what the question is and why a re-signed Facebook shows the
 * card. Only this plugin's answer changes: the list then takes the next top banner that says yes,
 * as it does on a Facebook that sees Messenger, and the chats, search and notes below stay.
 */
@Suppress("unused")
val hideGetMessengerCardPatch = bytecodePatch(
    name = "Hide the Get Messenger card",
    description = "Hides the \"Get the Messenger app\" card at the top of Chats while Messenger is installed. " +
        "Facebook only counts a Messenger signed with its own key, so a re-signed Facebook shows the card even " +
        "with Messenger right there. Without Messenger the card stays.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val questions = classDefByStrings(TOP_BANNER_TAG, StringComparisonType.EQUALS).mapNotNull(::cardQuestion)
        val question = questions.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one Chats plugin whose builder loads \"$TOP_BANNER_TAG\" and whose show question " +
                "takes ThreadListParams, found ${questions.size}",
        )
        mutableClassDefBy(question.definingClass).methods.single {
            it.name == question.name && it.parameterTypes.map(Any::toString) == question.parameterTypes.map(Any::toString)
        }.answerNoWhileHidden()
        enableStatus("messengerCard")
    }
}

/**
 * First thing in the card's show question: ask the extension, and answer no when it says the card
 * goes. Otherwise Facebook's own question runs from its first instruction.
 */
internal fun MutableMethod.answerNoWhileHidden() {
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HIDE
            move-result v0
            if-eqz v0, :facebook
            const/4 v0, 0x0
            return v0
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}
