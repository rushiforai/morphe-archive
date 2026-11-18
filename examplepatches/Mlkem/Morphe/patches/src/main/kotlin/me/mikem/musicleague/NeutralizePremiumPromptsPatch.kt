package me.mikem.musicleague

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.nio.charset.Charset

private fun ByteArray.mlPremiumContainsBytes(needle: ByteArray): Boolean {
    if (needle.isEmpty() || needle.size > size) return false

    var i = 0
    while (i <= size - needle.size) {
        var matched = true

        for (j in needle.indices) {
            if (this[i + j] != needle[j]) {
                matched = false
                break
            }
        }

        if (matched) return true
        i++
    }

    return false
}

private fun ByteArray.mlPremiumReplaceBytes(search: ByteArray, replacement: ByteArray): Pair<ByteArray, Int> {
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

private fun ByteArray.mlPremiumReplaceText(
    search: String,
    replacement: String,
    charset: Charset,
): Pair<ByteArray, Int> {
    val searchBytes = search.toByteArray(charset)
    val replacementBytes = replacement.toByteArray(charset)

    require(searchBytes.size == replacementBytes.size) {
        "Replacement must be exactly the same encoded byte length. Search=$search Replacement=$replacement"
    }

    return mlPremiumReplaceBytes(searchBytes, replacementBytes)
}

private fun mlPremiumBlank(value: String): String = " ".repeat(value.length)

@Suppress("unused")
val neutralizePremiumPromptsPatch = resourcePatch(
    name = "Neutralize premium and reward-ad prompts",
    description = "Force-removes the remaining premium/reward banner strings from the bundled Hermes asset.",
    default = true,
) {
    compatibleWith(MUSIC_LEAGUE)

    execute {
        val requiredGone = listOf(
            "Unlock the Best Music League Experience",
            "Play Without Ads for hours, months or all year",
            "Premium subscriptions turn off all ads, provide league data and early access to new features",
            "Six hours of ad-free gameplay. ~90 seconds of ads",
            "Enjoy **Six** Hours with **Zero** Ads",
        )

        val optionalGone = listOf(
            "Go Premium",
            "GO PREMIUM",
            "SUBSCRIBE",
            "Subscribe NOW",
            "Zero ads",
            "ad-free gameplay",
            "~90 seconds",
            "Receive hours of ad-free gameplay as thanks for watching ~90 seconds of ads (usually less!)",
            "hours of uninterrupted, ad-free gameplay.",
            "Reward granted! Enjoy **Six** Hours with **Zero** Ads",
            "Watch Rewarded Ads",
            "WATCH REWARDED ADS",
            "WATCH ADS WITHOUT REWARD",
            "WATCH ADS without REWARD",
            "WATCH ADS FOR REWARD",
            "WATCH ADS for REWARD",
            "Download league-by-league data",
            "Early access to new features",
            "Monthly",
            "Annual",
            "Save 31%",
        )

        val replacements = (requiredGone + optionalGone).distinct()

        val bundleFile = get("assets/index.android.bundle")
        var data = bundleFile.readBytes()
        var total = 0

        for (search in replacements) {
            val replacement = mlPremiumBlank(search)

            val utf8Result = data.mlPremiumReplaceText(search, replacement, Charsets.UTF_8)
            data = utf8Result.first
            total += utf8Result.second

            val utf16Result = data.mlPremiumReplaceText(search, replacement, Charsets.UTF_16LE)
            data = utf16Result.first
            total += utf16Result.second
        }

        val stillPresent = requiredGone.filter { required ->
            data.mlPremiumContainsBytes(required.toByteArray(Charsets.UTF_8)) ||
                data.mlPremiumContainsBytes(required.toByteArray(Charsets.UTF_16LE))
        }

        if (stillPresent.isNotEmpty()) {
            throw PatchException(
                "Remaining banner strings are still present in assets/index.android.bundle: ${
                    stillPresent.joinToString()
                }"
            )
        }

        if (total > 0) {
            bundleFile.writeBytes(data)
        }
    }
}
