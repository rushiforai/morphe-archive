package app.morphe.patches.reddit.customclients.sync.ads

import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

fun disableAdsPatch(block: BytecodePatchBuilder.() -> Unit = {}) = bytecodePatch(
    name = "Disable ads",
    description = "Removes the ads shown between posts.",
    default = true
) {
    execute {
        isAdsEnabledFingerprint.method.returnEarly(false)
    }

    block()
}
