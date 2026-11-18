package me.mikem.musicleague

import app.morphe.patcher.patch.resourcePatch
import java.nio.charset.Charset

private fun mlNeutralizeCaAppPubAdUnitId(value: String): String {
    require(value.contains("/")) {
        "Unsupported AdMob ad unit format: $value"
    }

    return value.mapIndexed { index, char ->
        if (index > "ca-app-pub-".length && char.isDigit()) '0' else char
    }.joinToString("")
}

private fun ByteArray.mlReplaceBytes(search: ByteArray, replacement: ByteArray): Pair<ByteArray, Int> {
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

private fun ByteArray.mlReplaceAscii(search: String, replacement: String): Pair<ByteArray, Int> {
    return mlReplaceBytes(search.toByteArray(Charsets.US_ASCII), replacement.toByteArray(Charsets.US_ASCII))
}

private fun ByteArray.mlReplaceEncodedText(
    search: String,
    replacement: String,
    charset: Charset,
): Pair<ByteArray, Int> {
    val searchBytes = search.toByteArray(charset)
    val replacementBytes = replacement.toByteArray(charset)

    require(searchBytes.size == replacementBytes.size) {
        "Replacement must be exactly the same encoded byte length. Search=$search Replacement=$replacement"
    }

    return mlReplaceBytes(searchBytes, replacementBytes)
}

private fun ByteArray.mlNeutralizeAllCaAppPubAdUnitIds(): Pair<ByteArray, Int> {
    val output = copyOf()
    val prefix = "ca-app-pub-".toByteArray(Charsets.US_ASCII)
    var count = 0
    var i = 0

    while (i <= output.size - prefix.size) {
        var matched = true

        for (j in prefix.indices) {
            if (output[i + j] != prefix[j]) {
                matched = false
                break
            }
        }

        if (!matched) {
            i++
            continue
        }

        var end = i + prefix.size

        while (end < output.size) {
            val char = output[end].toInt().toChar()
            val allowed = char.isDigit() || char == '/' || char == '-'

            if (!allowed) {
                break
            }

            end++
        }

        val foundBytes = output.copyOfRange(i, end)
        val found = foundBytes.toString(Charsets.US_ASCII)

        if (
            found.startsWith("ca-app-pub-") &&
            found.contains("/") &&
            !found.contains("~") &&
            found.length > "ca-app-pub-".length
        ) {
            val replacement = mlNeutralizeCaAppPubAdUnitId(found).toByteArray(Charsets.US_ASCII)

            if (replacement.size == foundBytes.size) {
                System.arraycopy(replacement, 0, output, i, replacement.size)
                count++
            }
        }

        i = end.coerceAtLeast(i + 1)
    }

    return output to count
}

private fun mlBlankSameLength(value: String): String = " ".repeat(value.length)

@Suppress("unused")
val neutralizeAdUnitIdsPatch = resourcePatch(
    name = "Neutralize bundled ad unit IDs and premium banners",
    description = "Replaces bundled ad unit IDs and premium/reward banner copy in the Hermes bundle with same-length non-serving/blank values while leaving the AdMob app ID intact.",
    default = true,
) {
    compatibleWith(MUSIC_LEAGUE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        var data = bundleFile.readBytes()
        var total = 0

        val caAppPubResult = data.mlNeutralizeAllCaAppPubAdUnitIds()
        data = caAppPubResult.first
        total += caAppPubResult.second

        val knownAdUnitReplacements = mapOf(
            "ca-app-pub-1063041944129884/3965053636" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-1063041944129884/7616846239" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-1063041944129884/3274808943" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-1063041944129884/3869172910" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-1063041944129884/6060221983" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-1063041944129884/7068576428" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-1063041944129884/8003062887" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/1033173712" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/1044960115" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/2247696110" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/5224354917" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/5354046379" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/6300978111" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/8691691433" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/9214589741" to "ca-app-pub-0000000000000000/0000000000",
            "ca-app-pub-3940256099942544/9257395921" to "ca-app-pub-0000000000000000/0000000000",
        )

        for ((search, replacement) in knownAdUnitReplacements) {
            val result = data.mlReplaceAscii(search, replacement)
            data = result.first
            total += result.second
        }

        val bannerAndPremiumReplacements = listOf(
            "Unlock the Best Music League Experience" to mlBlankSameLength("Unlock the Best Music League Experience"),
            "Unlock the Best Music League" to mlBlankSameLength("Unlock the Best Music League"),
            "Best Music League Experience" to mlBlankSameLength("Best Music League Experience"),
            "Play Without Ads for hours, months or all year" to mlBlankSameLength("Play Without Ads for hours, months or all year"),
            "Play Without Ads" to mlBlankSameLength("Play Without Ads"),
            "for hours, months or all year" to mlBlankSameLength("for hours, months or all year"),
            "Premium subscriptions turn off all ads, provide league data and early access to new features" to mlBlankSameLength("Premium subscriptions turn off all ads, provide league data and early access to new features"),
            "Premium subscriptions turn off all ads" to mlBlankSameLength("Premium subscriptions turn off all ads"),
            "provide league data" to mlBlankSameLength("provide league data"),
            "early access to new features" to mlBlankSameLength("early access to new features"),
            "GO PREMIUM" to mlBlankSameLength("GO PREMIUM"),
            "Go Premium" to mlBlankSameLength("Go Premium"),

            "Enjoy Six Hours with Zero Ads" to mlBlankSameLength("Enjoy Six Hours with Zero Ads"),
            "Enjoy six hours with zero ads" to mlBlankSameLength("Enjoy six hours with zero ads"),
            "enjoy six hours with zero ads" to mlBlankSameLength("enjoy six hours with zero ads"),
            "Six Hours with Zero Ads" to mlBlankSameLength("Six Hours with Zero Ads"),
            "Six Hours with Zero" to mlBlankSameLength("Six Hours with Zero"),
            "six hours with zero ads" to mlBlankSameLength("six hours with zero ads"),
            "six hours with zero" to mlBlankSameLength("six hours with zero"),
            "Zero Ads" to mlBlankSameLength("Zero Ads"),
            "zero ads" to mlBlankSameLength("zero ads"),
            "Six hours of ad-free gameplay. ~90 seconds" to mlBlankSameLength("Six hours of ad-free gameplay. ~90 seconds"),
            "Six hours of ad-free gameplay. ~90 seconds of ads" to mlBlankSameLength("Six hours of ad-free gameplay. ~90 seconds of ads"),
            "ad-free gameplay" to mlBlankSameLength("ad-free gameplay"),
            "~90 seconds" to mlBlankSameLength("~90 seconds"),

            "Receive hours of ad-free gameplay as thanks for watching ~90 seconds of ads (usually less!)" to mlBlankSameLength("Receive hours of ad-free gameplay as thanks for watching ~90 seconds of ads (usually less!)"),
            "hours of uninterrupted, ad-free gameplay." to mlBlankSameLength("hours of uninterrupted, ad-free gameplay."),
            "Reward granted! Enjoy **Six** Hours with **Zero** Ads" to mlBlankSameLength("Reward granted! Enjoy **Six** Hours with **Zero** Ads"),
            "Watch Rewarded Ads" to mlBlankSameLength("Watch Rewarded Ads"),
            "WATCH REWARDED ADS" to mlBlankSameLength("WATCH REWARDED ADS"),
            "WATCH ADS WITHOUT REWARD" to mlBlankSameLength("WATCH ADS WITHOUT REWARD"),
            "WATCH ADS without REWARD" to mlBlankSameLength("WATCH ADS without REWARD"),
            "WATCH ADS FOR REWARD" to mlBlankSameLength("WATCH ADS FOR REWARD"),
            "WATCH ADS for REWARD" to mlBlankSameLength("WATCH ADS for REWARD"),
            "Subscribe NOW" to mlBlankSameLength("Subscribe NOW"),
            "SUBSCRIBE" to mlBlankSameLength("SUBSCRIBE"),
            "Zero ads" to mlBlankSameLength("Zero ads"),
            "Download league-by-league data" to mlBlankSameLength("Download league-by-league data"),
            "Early access to new features" to mlBlankSameLength("Early access to new features"),
            "Monthly" to mlBlankSameLength("Monthly"),
            "Annual" to mlBlankSameLength("Annual"),
            "Save 31%" to mlBlankSameLength("Save 31%"),
            "Zero ads_card_description" to mlBlankSameLength("Zero ads_card_description"),
            "subscription_bullet_1" to mlBlankSameLength("subscription_bullet_1"),
            "subscription_bullet_2" to mlBlankSameLength("subscription_bullet_2"),
            "subscription_bullet_3" to mlBlankSameLength("subscription_bullet_3"),
        )

        for ((search, replacement) in bannerAndPremiumReplacements) {
            val utf8Result = data.mlReplaceEncodedText(search, replacement, Charsets.UTF_8)
            data = utf8Result.first
            total += utf8Result.second

            val utf16Result = data.mlReplaceEncodedText(search, replacement, Charsets.UTF_16LE)
            data = utf16Result.first
            total += utf16Result.second
        }

        if (total > 0) {
            bundleFile.writeBytes(data)
        }
    }
}
