/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.stories.seen

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

private const val HOLD_BACK = "$EXTENSION_PACKAGE/stories/StorySeen;->holdBack()Z"

/**
 * Keeps the stories you view from being reported, which is what puts you on their viewer lists.
 * See StorySeenAnchors.kt for the report and how the sender is found.
 *
 * The hook goes first in the sender and returns before anything is built or sent, the way the
 * sender already returns when it has no cards. Only the viewing report stops: replies and
 * reactions are sent by another class.
 *
 * Off in the default selection, since it changes what other people see, and stories you've viewed
 * keep their unwatched ring: Facebook greys a ring only once the server has taken the report, and
 * a tray reloaded from the server still lists them as unwatched. Picked, its switch starts on.
 */
@Suppress("unused")
val viewStoriesAnonymouslyPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "View stories anonymously",
    description = "Keeps you off the viewer list of the stories you watch, because Facebook isn't told which ones " +
        "you've seen. Replying or reacting still shows you, and stories you've watched keep the ring that marks " +
        "them as new.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val mutations = classDefByStrings(SEEN_ROOT_FIELD, StringComparisonType.EQUALS).filter(::isSeenMutation)
        val mutation = mutations.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one query class whose constructor loads \"$SEEN_MUTATION\" and \"$SEEN_ROOT_FIELD\", " +
                "found ${mutations.size}",
        )
        val senders = classDefByStrings(STORY_IDS, StringComparisonType.EQUALS).mapNotNull { seenSender(it, mutation.type) }
        val sender = senders.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one class that builds $SEEN_MUTATION with \"$STORY_IDS\" and sends it from one void " +
                "method taking the set of story ids, found ${senders.size}",
        )
        mutableClassDefBy(sender.definingClass).methods.single {
            it.name == sender.name && it.returnType == sender.returnType &&
                it.parameterTypes.map(Any::toString) == sender.parameterTypes.map(Any::toString)
        }.holdBackViews()
        enableStatus("storySeen")
    }
}

/**
 * First thing in the sender: ask the extension, and return without sending when it says the views
 * stay here. Otherwise the sender runs from its own first instruction.
 */
internal fun MutableMethod.holdBackViews() {
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HOLD_BACK
            move-result v0
            if-eqz v0, :send
            return-void
        """,
        ExternalLabel("send", getInstruction(0)),
    )
}
