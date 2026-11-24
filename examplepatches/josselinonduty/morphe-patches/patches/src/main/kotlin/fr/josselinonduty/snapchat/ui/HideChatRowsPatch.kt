package fr.josselinonduty.snapchat.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import fr.josselinonduty.snapchat.SNAPCHAT
import fr.josselinonduty.snapchat.core.spoofSignaturePatch
import fr.josselinonduty.shared.prepend
import fr.josselinonduty.snapchat.snapBytecodePatch

private const val UI_CHAT = "Lfr/josselinonduty/snapchat/UiChatList;"

// Anchor (14.33.1.0: Lm0w;->H(Lu0w;)V): binder of one Chat-feed row (`ff_item`; row view Lfmw;).
// Lu0w;->n0 is the Lxcu; FriendsFeedView model whose toString() carries `feedDisplayName=`.
// Lm0w;->n0 is the row's container FrameLayout (the RecyclerView item).
// Obfuscated names: pinned to this build.
object ChatRowBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lu0w;"),
    custom = { method, classDef ->
        classDef.type == "Lm0w;" && method.name == "H"
    },
)

// Shared hook (hidden dependency): hides the row when its name is enabled by a patch below.
// p0/p1 are v16/v17 here: copy to v0/v1 (invoke-static cannot address them).
val chatRowHookPatch = bytecodePatch {
    compatibleWith(SNAPCHAT)
    dependsOn(spoofSignaturePatch)
    extendWith("extensions/snapchat.mpe")

    execute {
        ChatRowBindFingerprint.method.prepend(
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                invoke-static {v0, v1}, $UI_CHAT->bind(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )
    }
}

// Runs before the hook (prepended later => earlier in the method).
private fun enableRows(mask: Int) = ChatRowBindFingerprint.method.prepend(
    """
        const/4 v0, 0x$mask
        invoke-static {v0}, $UI_CHAT->enable(I)V
    """,
)

val hideMyAiPatch = snapBytecodePatch(
    name = "Hide My AI",
    description = "Hides the My AI row from the Chat list.",
) {
    dependsOn(chatRowHookPatch)
    execute { enableRows(1) }
}

val hideTeamSnapchatPatch = snapBytecodePatch(
    name = "Hide Team Snapchat",
    description = "Hides the Team Snapchat row from the Chat list.",
) {
    dependsOn(chatRowHookPatch)
    execute { enableRows(2) }
}
