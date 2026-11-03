package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.Fingerprint

/** Card row bind that loads Video.getThumbnail for each episode. */
object CardVideoItemBindFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/databinding/CardVideoItemBindingImpl;",
    name = "executeBindings",
    parameters = listOf(),
)

/** Header bind that loads Video.getOverview for the selected episode. */
object MetaDetailsBindFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/databinding/FragmentMetaDetailsBindingImpl;",
    name = "executeBindings",
    parameters = listOf(),
)

/** Episode list resume, used to redraw after returning from Settings. */
object VideosListOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/metadetails/videos/VideosListFragment;",
    name = "onResume",
    parameters = listOf(),
)

/** Episode list state observer that calls setItems after each load. */
object VideosListOnCreateObserverFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/metadetails/videos/VideosListFragment\$onCreate\$3;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
)

/** Episode label used by the header, the player and the episode dialog. */
object VideoLabelFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/extensions/VideoExtKt;",
    name = "getLabel",
    parameters = listOf("Lcom/stremio/core/types/resource/Video;"),
)

/** Episode label with date used by the header. */
object VideoLabelWithDateFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/extensions/VideoExtKt;",
    name = "getLabelWithDate",
    parameters = listOf("Lcom/stremio/core/types/resource/Video;"),
)

/**
 * Marker for the builds that have the MPV engine (1.10.4 and later, the Compose UI generation).
 * Absent in 1.6.12, which keeps only the legacy bind hooks.
 */
object SpoilerComposeMarkerFingerprint : Fingerprint(
    definingClass = "Ldev/jdtech/mpv/MPVLib;",
    name = "init",
    returnType = "V",
    parameters = listOf(),
)

/** stremio-core-kotlin Video.getThumbnail(): R8 keeps the name in every build. */
object VideoGetThumbnailFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/types/resource/Video;",
    name = "getThumbnail",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

/** stremio-core-kotlin Video.getOverview(). */
object VideoGetOverviewFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/types/resource/Video;",
    name = "getOverview",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

/** stremio-core-kotlin Video.getTitle(). */
object VideoGetTitleFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/types/resource/Video;",
    name = "getTitle",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)
