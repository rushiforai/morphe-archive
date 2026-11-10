package app.morphe.patches.kicktv.chatexpand

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/chatexpand/"

/**
 * Chat panel composable. Its 7th parameter is the "expanded" flag: when it is
 * true the app skips the `tv_chat_join_button` footer and the message list
 * drops the 20 dp bottom padding reserved for that footer.
 *
 * The flag is only true in the overlay chat modes, so the side panel
 * (VIDEO/CHAT) view shows the footer. The patch replaces the parameter value
 * with {@link ChatExpandPrefs.expandChat(boolean)} at the start of the method,
 * which leaves the overlay modes alone and forces expansion in the side panel.
 */
private object ChatPanelFingerprint : Fingerprint(
    definingClass = "La79;",
    name = "a",
    parameters = listOf(
        "Lrw0;",
        "Ljava/util/List;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Ljava/util/List;",
        "Lvz2;",
        "Z",
        "Lp73;",
        "I",
    ),
    returnType = "V",
)

/**
 * EXPAND CHAT tweak. Hides the "Join the Chat" footer in the VIDEO/CHAT view
 * and lets the chat use the freed space. The toggle lives in the SEYTTINGS
 * menu provided by the base patch this patch depends on.
 */
@Suppress("unused")
val chatExpandPatch = patch(
    name = "EXPAND CHAT",
    description = "Hides the \"Join the Chat\" footer in the VIDEO/CHAT view and " +
        "lets the chat fill the freed space. Toggle it in SEYTTINGS. Requires " +
        "the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickChatExpand.mpe")

    execute {
        ChatPanelFingerprint.apply {
            method.addInstructions(
                0,
                """
                    invoke-static/range {p6 .. p6}, ${EXTENSION_CLASS}ChatExpandPrefs;->expandChat(Z)Z
                    move-result p6
                """,
            )
        }
    }
}
