package app.ahmedyarub.patches.x.timeline

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

private object HideWhoToFollowExtensionFingerprint : Fingerprint(
    definingClass = TIMELINE_FILTER_CLASS,
    name = "hideWhoToFollow",
)

@Suppress("unused")
val hideWhoToFollowPatch = bytecodePatch(
    name = "Hide Who to follow",
    description = "Hides Who to follow / recommended-account modules from timelines.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(timelineFilterPatch)

    execute {
        HideWhoToFollowExtensionFingerprint.method.returnEarly(true)
    }
}
