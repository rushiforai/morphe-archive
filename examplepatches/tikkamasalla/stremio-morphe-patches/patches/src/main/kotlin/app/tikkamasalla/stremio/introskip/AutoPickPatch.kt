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
        try {
            StreamsObserverFingerprint.method.addInstructions(
                0,
                "invoke-static {p0}, $AUTOPICK->onStreams(Ljava/lang/Object;)V",
            )
        } catch (_: Exception) {
            // Stream list keeps working manually on this build.
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
            AutoPrefsFingerprint.method.apply {
                val returns = implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                returns.reversed().forEach { index ->
                    addInstructions(
                        index,
                        "invoke-static {p0}, $AUTO_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V",
                    )
                }
            }
        } catch (_: Exception) {
            // Settings screen moved; auto-pick still works with its default.
        }
    }
}
