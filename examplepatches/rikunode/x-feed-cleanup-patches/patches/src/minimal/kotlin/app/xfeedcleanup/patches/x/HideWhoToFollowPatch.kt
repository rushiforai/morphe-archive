package app.xfeedcleanup.patches.x

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

private object HideWhoToFollowExtensionFingerprint : Fingerprint(
    definingClass = FILTER_CLASS,
    name = "hideWhoToFollow",
)

@Suppress("unused")
val hideWhoToFollowPatch = bytecodePatch(
    name = "Hide Who to follow",
    description = "Hides Who to follow / recommended-account modules from timelines.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(recommendationFilterPatch)

    execute {
        HideWhoToFollowExtensionFingerprint.method.returnEarly(true)
    }
}
