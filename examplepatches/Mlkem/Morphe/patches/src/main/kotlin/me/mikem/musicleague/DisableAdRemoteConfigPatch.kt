package me.mikem.musicleague

import app.morphe.patcher.patch.resourcePatch
import java.nio.charset.Charset

private fun ByteArray.mlRemoteReplaceBytes(search: ByteArray, replacement: ByteArray): Pair<ByteArray, Int> {
    require(search.size == replacement.size) {
        "Replacement must be exactly the same byte length."
    }

    val output = copyOf()
    var count = 0
    var i = 0

    while (i <= output.size - search.size) {
        var matched = true

        for (j in search.indices) {
            if (output[i + j] != search[j]) {
                matched = false
                break
            }
        }

        if (matched) {
            System.arraycopy(replacement, 0, output, i, replacement.size)
            count++
            i += search.size
        } else {
            i++
        }
    }

    return output to count
}

private fun ByteArray.mlRemoteReplaceText(
    search: String,
    replacement: String,
    charset: Charset,
): Pair<ByteArray, Int> {
    val searchBytes = search.toByteArray(charset)
    val replacementBytes = replacement.toByteArray(charset)

    require(searchBytes.size == replacementBytes.size) {
        "Replacement must be exactly the same encoded byte length. Search=$search Replacement=$replacement"
    }

    return mlRemoteReplaceBytes(searchBytes, replacementBytes)
}

private fun ByteArray.mlRemoteBlankEncodedText(
    search: String,
    charset: Charset,
): Pair<ByteArray, Int> {
    val searchBytes = search.toByteArray(charset)
    val replacementBytes = ByteArray(searchBytes.size) { 0x20.toByte() }
    return mlRemoteReplaceBytes(searchBytes, replacementBytes)
}

private fun mlRemoteBlackholeKey(value: String): String {
    return value.map { char ->
        when {
            char.isLetterOrDigit() -> 'x'
            else -> char
        }
    }.joinToString("")
}

private fun mlRemoteBlackholePosthogKey(value: String): String {
    return "phc_" + "0".repeat(value.length - 4)
}

@Suppress("unused")
val disableAdRemoteConfigPatch = resourcePatch(
    name = "Disable ad and promo remote config",
    description = "Blackholes ad/paywall/reward feature-flag keys and remote promo payload keys so the app cannot enable ad or upsell surfaces from remote config.",
    default = true,
) {
    compatibleWith(MUSIC_LEAGUE)

    execute {
        val appConfigFile = get("assets/app.config")
        val originalConfig = appConfigFile.readText()
        var patchedConfig = originalConfig

        val posthogKey = "phc_fuPSsHKZ0OubSkRrwv7Y0eH1ajcGlQHh3RgIRlCfEED"
        patchedConfig = patchedConfig.replace(posthogKey, mlRemoteBlackholePosthogKey(posthogKey))

        if (patchedConfig != originalConfig) {
            appConfigFile.writeText(patchedConfig)
        }

        val remoteKeys = listOf(
            "appopen_ads_enabled",
            "banner_ads_enabled",
            "interstitial_ads_enabled",
            "mrec_ads_enabled",
            "native_ads_enabled",
            "rewarded_ads_enabled",
            "paywall_feature_enabled",
            "paywall_modal_config_content",
            "paywall_icon_config",
            "ad_reward",
            "ad_reward_hours_0_ads",
            "ads_card_description",
            "ads_card_subtitle",
            "ads_card_subscribe_cta",
            "ads_card_rewarded_cta",
            "ads_card_rewarded_description",
            "subscription_headline",
            "subscription_subtitle",
            "subscription_cta",
            "subscription_bullet_1",
            "subscription_bullet_2",
            "subscription_bullet_3",
            "rewarded_headline",
            "rewarded_description",
            "rewarded_cta",
            "paywallFeatureEnabled",
            "showToFreeUsersOnly",
            "bannerEnabled",
            "bannerText",
            "bannerColor",
            "rewardedEnabled",
            "rewardedHeadline",
            "rewardedDescription",
            "rewardedCta",
            "rewardedProgressText",
            "rewardedCompletingText",
            "rewardedAdsCooldownHours",
            "adsCardTitle",
            "adsCardSubtitle",
            "adsCardDescription",
            "adsCardSubscribeCta",
            "adsCardRewardedCta",
            "adsCardRewardedDescription",
        ).distinct()

        val visiblePromoText = listOf(
            "Unlock the Best Music League Experience",
            "Play Without Ads for hours, months or all year",
            "Premium subscriptions turn off all ads, provide league data and early access to new features",
            "GO PREMIUM",
            "Go Premium",
            "Enjoy Six Hours with Zero Ads",
            "Six Hours with Zero Ads",
            "Enjoy **Six** Hours with **Zero** Ads",
            "Six hours of ad-free gameplay. ~90 seconds",
            "Six hours of ad-free gameplay. ~90 seconds of ads",
            "Receive hours of ad-free gameplay as thanks for watching ~90 seconds of ads (usually less!)",
            "No Ads, Early Feature Access, Downloadable Data",
            "Continue with Ads",
            "Watch Rewarded Ads",
            "WATCH REWARDED ADS",
            "WATCH ADS for REWARD",
            "WATCH ADS without REWARD",
            "Zero ads",
            "Download league-by-league data",
            "Early access to new features",
        ).distinct()

        val bundleFile = get("assets/index.android.bundle")
        var data = bundleFile.readBytes()
        var total = 0

        for (key in remoteKeys) {
            val replacement = mlRemoteBlackholeKey(key)

            val utf8Result = data.mlRemoteReplaceText(key, replacement, Charsets.UTF_8)
            data = utf8Result.first
            total += utf8Result.second

            val utf16Result = data.mlRemoteReplaceText(key, replacement, Charsets.UTF_16LE)
            data = utf16Result.first
            total += utf16Result.second
        }

        for (text in visiblePromoText) {
            val utf8Result = data.mlRemoteBlankEncodedText(text, Charsets.UTF_8)
            data = utf8Result.first
            total += utf8Result.second

            val utf16Result = data.mlRemoteBlankEncodedText(text, Charsets.UTF_16LE)
            data = utf16Result.first
            total += utf16Result.second
        }

        if (total > 0) {
            bundleFile.writeBytes(data)
        }
    }
}
