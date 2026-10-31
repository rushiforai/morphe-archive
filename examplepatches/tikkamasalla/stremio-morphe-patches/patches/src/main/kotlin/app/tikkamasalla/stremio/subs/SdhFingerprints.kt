package app.tikkamasalla.stremio.subs

import app.morphe.patcher.Fingerprint

/** Finds Media3 SubtitleView.setCues(List), the single funnel every cue passes through. */
object SubtitleViewSetCuesFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/ui/SubtitleView;",
    name = "setCues",
    parameters = listOf("Ljava/util/List;"),
)
