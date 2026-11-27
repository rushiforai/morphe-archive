package app.morphe.patches.kicktv.chatsplit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.patch
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/chatsplit/"

/**
 * `wc9` (UserRepositoryImpl) holds the chat display mode in a StateFlow.
 * Its constructor initialises that flow with `hw0.B` = OVERLAY_HALF, which is
 * why every stream opens with the small overlay chat.
 *
 * `hw0.D` is SIDE_PANEL — the video/chat split view. The enum field read is
 * unique in each of the two repository methods that set the default, so we
 * route it through the preference helper. A mode the user explicitly saves
 * later still overwrites the flow, keeping this a default-only change.
 */
private object ChatSplitDefaultFingerprint : Fingerprint(
    definingClass = "Lwc9;",
    name = "<init>",
    parameters = listOf("Lbo1;", "Lvu7;", "Lyu7;"),
    returnType = "V",
    filters = listOf(
        fieldAccess(definingClass = "Lhw0;", name = "B", type = "Lhw0;"),
    ),
)

private object ChatSplitFallbackFingerprint : Fingerprint(
    definingClass = "Lwc9;",
    name = "a",
    parameters = listOf("Log1;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        fieldAccess(definingClass = "Lhw0;", name = "B", type = "Lhw0;"),
    ),
)

/**
 * `sc9.h(Object, Continuation)` reads the stored `chatMode` string and maps it
 * to the enum. When there is no stored value (or it is unknown) it falls back
 * to `hw0.B` before pushing the result into the StateFlow. This is the actual
 * default seen on a fresh install, so it must be redirected as well.
 */
private object ChatSplitStoredReadFingerprint : Fingerprint(
    definingClass = "Lsc9;",
    name = "h",
    parameters = listOf("Ljava/lang/Object;", "Lmg1;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        fieldAccess(definingClass = "Lhw0;", name = "B", type = "Lhw0;"),
    ),
)

/** MainActivity.onCreate(), used to capture the application context. */
private object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kick/tv/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

/**
 * DEFAULT SPLIT VIEW tweak. Makes the video/chat split view the default chat
 * mode when enabled. The Settings menu is provided by the SEYTTINGS base patch.
 */
@Suppress("unused")
val chatSplitPatch = patch(
    name = "DEFAULT SPLIT VIEW",
    description = "Opens streams in the video/chat split view by default instead "
        + "of the small overlay chat. Toggle it in SEYTTINGS. Requires the "
        + "SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickChatSplit.mpe")

    execute {
        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, ${EXTENSION_CLASS}ChatSplitPrefs;->init(Landroid/content/Context;)V
            """,
        )

        for (fp in listOf(
            ChatSplitDefaultFingerprint,
            ChatSplitFallbackFingerprint,
            ChatSplitStoredReadFingerprint,
        )) {
            fp.apply {
                val index = instructionMatches[0].index
                val register = method.getInstruction<OneRegisterInstruction>(index).registerA
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static {v$register}, ${EXTENSION_CLASS}ChatSplitPrefs;->getDefaultMode(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, Lhw0;
                    """,
                )
            }
        }
    }
}