package app.template.patches.ninegag.ad

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ninegag.util.returnBoxedBooleanEarly
import app.template.patches.ninegag.util.returnEarly
import app.template.patches.ninegag.hosts.HostsBlocker
import app.template.patches.ninegag.hosts.HostsBlockerConfig
import app.template.patches.ninegag.hosts.baseHostsBlockerPatch
import app.template.patches.ninegag.shared.COMPATIBILITY_NINEGAG

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove 9GAG ads, promoted posts and trackers (8.23.0)",
    description = "Disables ad gates and bottom-banner initialization, filters promoted feed posts, and blocks listed ad/tracking hosts."
) {
    compatibleWith(COMPATIBILITY_NINEGAG)

    dependsOn(
        baseHostsBlockerPatch {
            HostsBlockerConfig(
                hostsBlocker = HostsBlocker.fromString(AD_HOSTS)
            )
        },
        hideAdContainersPatch,
        hidePromotedPostsPatch,
        hideBottomBannerPatch
    )

    execute {
        AdGateFingerprint.method.returnEarly(false)
        RuntimeAdGateFingerprint.method.returnBoxedBooleanEarly(false)
    }
}
