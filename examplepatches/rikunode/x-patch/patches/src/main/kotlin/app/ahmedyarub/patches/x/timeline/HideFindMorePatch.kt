package app.ahmedyarub.patches.x.timeline

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

private object HideFindMoreExtensionFingerprint : Fingerprint(
    definingClass = TIMELINE_FILTER_CLASS,
    name = "hideFindMore",
)

@Suppress("unused")
val hideFindMorePatch = bytecodePatch(
    name = "Hide Find more",
    description = "Hides the Find more / top people recommendation module from Search.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(timelineFilterPatch)

    execute {
        HideFindMoreExtensionFingerprint.method.returnEarly(true)
    }
}
