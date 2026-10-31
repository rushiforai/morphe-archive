package app.aapam.patches.mygate.plan

import app.aapam.patches.mygate.shared.Constants
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val blockFlutterAdsPatch = rawResourcePatch(
    name = "Block Flutter Ads",
    description = "Removes home feed advertisements and sponsored community notice cards.",
) {
    compatibleWith(Constants.COMPATIBILITY_MYGATE)

    execute {
        val replacements = listOf(
            // --- Endpoints & Image CDN Sinkholes ---
            "https://cmp.mygate.com/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099//".toByteArray(Charsets.UTF_8),
            "https://classifieds-be.mygate.com/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099/blocked-ads/".toByteArray(Charsets.UTF_8),
            "https://cmp.mint-01.mgmaglev.xyz/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099/blocked/xyz".toByteArray(Charsets.UTF_8),
            "https://trill.mygate.com/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099//".toByteArray(Charsets.UTF_8),
            "/digital/campaign/".toByteArray(Charsets.UTF_8) to "/blocked/campaign/".toByteArray(Charsets.UTF_8),
            "/metrics/capture/campaign".toByteArray(Charsets.UTF_8) to "/blocked/capture/campaign".toByteArray(Charsets.UTF_8),

            // --- Feed Notice & Marketing Platform Sinkhole ---
            "mobile/noticeListing".toByteArray(Charsets.UTF_8) to "mobile/blockedNotice".toByteArray(Charsets.UTF_8),

            // --- Spotlight Dynamic Widget Ads & Staging Metrics Sinkholes ---
            "/spotlight".toByteArray(Charsets.UTF_8) to "/blocklite".toByteArray(Charsets.UTF_8),
            "https://metrics.kappa.mgmaglev.xyz/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099/blocked/abcd/".toByteArray(Charsets.UTF_8),

            // --- Logical Plan & Tier Ad Banners ---
            // Prevent Dart feed repository and ad stores from evaluating user as Free/Ad-supported
            "SOCIETY_FREE_PLAN".toByteArray(Charsets.UTF_8) to "SOCIETY_DISA_PLAN".toByteArray(Charsets.UTF_8),
            "shouldShowAdTierBanner".toByteArray(Charsets.UTF_8) to "shouldHideAdTierBanner".toByteArray(Charsets.UTF_8),
            "ad_tag_enabled".toByteArray(Charsets.UTF_8) to "ad_tag_disable".toByteArray(Charsets.UTF_8),

            // --- Feed Sponsored Notice Asset Neutralization ---
            "assets/images/svg/common/ic_notice_yellow.svg".toByteArray(Charsets.UTF_8) to "assets/images/svg/common/ic_notice_blockd.svg".toByteArray(Charsets.UTF_8),
        )

        listOf("lib/arm64-v8a/libapp.so", "lib/armeabi-v7a/libapp.so").forEach { entry ->
            try {
                val file = this[entry]
                if (file.exists()) {
                    val bytes = file.readBytes()
                    var modified = false
                    val newBytes = bytes.clone()

                    for ((target, replacement) in replacements) {
                        for (i in 0..(newBytes.size - target.size)) {
                            var match = true
                            for (j in target.indices) {
                                if (newBytes[i + j] != target[j]) {
                                    match = false
                                    break
                                }
                            }
                            if (match) {
                                for (j in replacement.indices) {
                                    newBytes[i + j] = replacement[j]
                                }
                                modified = true
                            }
                        }
                    }

                    if (modified) {
                        file.writeBytes(newBytes)
                    }
                }
            } catch (_: Exception) {
            }
        }
    }
}
