package app.linkedin.patches.download

import app.morphe.patcher.Fingerprint

private const val MEDIA_VIEWER = "Lcom/linkedin/android/media/pages/mediaviewer"

/**
 * `onBind(ViewData, ViewDataBinding)` of the full screen media viewer presenters.
 * These classes are not obfuscated.
 */
private fun onBindFingerprint(presenter: String) = Fingerprint(
    definingClass = "$MEDIA_VIEWER/$presenter;",
    name = "onBind",
    returnType = "V",
    parameters = listOf(
        "Lcom/linkedin/android/architecture/viewdata/ViewData;",
        "Landroidx/databinding/ViewDataBinding;",
    ),
)

internal val mediaViewerOnBindFingerprints = listOf(
    // Single image post.
    onBindFingerprint("MediaViewerImagePresenter"),
    // One page of a multi image post.
    onBindFingerprint("MultiPhotoImagePresenter"),
    // Video post.
    onBindFingerprint("MediaViewerVideoPresenter"),
)
