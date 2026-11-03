package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val AUTOPICK = "Lapp/tikkamasalla/stremio/introskip/StreamAutoPick;"
private const val AUTO_SETTINGS = "Lapp/tikkamasalla/stremio/introskip/IntroSkipSettings;"

private object StreamsObserverFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/metadetails/streams/StreamsListFragment\$onCreate\$3;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
)

private object EpisodeSelectedFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/metadetails/videos/VideosListFragment;",
    name = "onCreate\$lambda\$0",
    parameters = listOf(
        "Lcom/stremio/tv/views/metadetails/videos/VideosListFragment;",
        "Landroidx/leanback/widget/Presenter\$ViewHolder;",
        "Ljava/lang/Object;",
        "Landroidx/leanback/widget/RowPresenter\$ViewHolder;",
        "Ljava/lang/Object;",
    ),
)

private object AutoPrefsFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/settings/PreferencesFragment;",
    name = "onCreatePreferences",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
)

/** Skips the stream list and plays the top ranked stream. Default ON. */
val autoPickPatch = bytecodePatch(
    name = "Auto-pick best stream",
    description = "Skips the stream list and plays the top ranked stream. Enable Always show stream list to see every stream.",
    default = true,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Leanback stream list (1.6.12 and 1.10.x): hook its observer. Where that class is gone (Compose
        // list: TV 1.12.x, phone 2.x) the core model path below is used instead; never both.
        val legacyList = try {
            StreamsObserverFingerprint.method.addInstructions(
                0,
                "invoke-static {p0}, $AUTOPICK->onStreams(Ljava/lang/Object;)V",
            )
            true
        } catch (_: Exception) {
            false
        }
        if (!legacyList) {
            try {
                // Streams page opened/closed, player started/ended: Core.dispatch(Action, Field).
                CoreDispatchFingerprint.method.addInstructions(
                    0,
                    "invoke-static {p1, p2}, $AUTOPICK->onCoreDispatch(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
                // The streams of every addon: the decoded MetaDetails model.
                hookReturnObject(
                    MetaDetailsModelFingerprint.method,
                    "$AUTOPICK->onMetaDetails(Ljava/lang/Object;)V",
                    replace = false,
                )
            } catch (_: Exception) {
                java.util.logging.Logger.getLogger("AutoPickPatch").warning("Core hooks not found: auto-pick is off, the stream list stays")
            }
            // Activity for the launch and the Back/key watcher (TV and phone class; one exists per build).
            listOf(MainActivityOnCreateFingerprint, PhoneMainActivityOnCreateFingerprint).forEach { fingerprint ->
                try {
                    fingerprint.method.addInstructions(
                        0,
                        "invoke-static {p0}, $AUTOPICK->onMainActivity(Ljava/lang/Object;)V",
                    )
                } catch (_: Exception) {
                    // The other build's activity class.
                }
            }
        }
        try {
            // Long-press on an episode tile opens its stream list.
            EpisodeSelectedFingerprint.method.addInstructions(
                0,
                "invoke-static {p1, p2}, $AUTOPICK->onEpisodeSelected(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        } catch (_: Exception) {
            // Long-press stays off; the Always show stream list setting still works.
        }
        try {
            hookReturnVoidWithThis(AutoPrefsFingerprint.method, "$AUTO_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V")
        } catch (_: Exception) {
            // Settings screen moved; auto-pick still works with its default.
        }
    }
}
