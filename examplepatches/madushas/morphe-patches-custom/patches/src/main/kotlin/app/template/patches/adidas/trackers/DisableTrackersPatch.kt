package app.template.patches.adidas.trackers

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.adidas.AdidasAdjustOnResumeFingerprint
import app.template.patches.adidas.AdidasAdjustTrackEventFingerprint
import app.template.patches.shared.Constants.ADIDAS_RUNNING_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Disables adidas Running's **Adjust** attribution/analytics SDK at the bytecode layer.
 *
 * Adjust is initialised by its `SystemLifecycleContentProvider` (disabled by
 * [adidasDisableTrackerComponentsPatch]); this patch additionally no-ops its event and
 * lifecycle entry points so nothing is buffered or dispatched even if the SDK is
 * started by another path.
 */
@Suppress("unused")
val adidasDisableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "No-ops the Adjust SDK's event/lifecycle entry points so no attribution " +
        "or analytics payload is buffered or sent.",
    default = true,
) {
    compatibleWith(ADIDAS_RUNNING_COMPATIBILITY)

    execute {
        AdidasAdjustTrackEventFingerprint.method.returnEarly()
        AdidasAdjustOnResumeFingerprint.method.returnEarly()
    }
}
