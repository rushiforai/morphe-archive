package semicoloncolonel.mobilestream.patches.justwatch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.OKHTTP_BODY_REWRITE_API
import semicoloncolonel.mobilestream.patches.shared.misc.missingMethods
import semicoloncolonel.mobilestream.patches.shared.privacy.OkHttpClientInitFingerprint

// JustWatch 26.43.10 shows its own sponsored titles (the "Sponsored" cards
// and sponsored pre-rolls), served by JustWatch's GraphQL API rather than an
// ad network. They come from the getSRCampaign field of the app's queries,
// which an OkHttp interceptor sets to null in every response.

private const val FILTER = "Lsemicoloncolonel/mobilestream/extension/justwatch/SponsoredFilter;"

@Suppress("unused")
val hideSponsoredTitlesPatch = bytecodePatch(
    name = "Hide sponsored titles",
    description = "Removes JustWatch's own sponsored title cards and sponsored trailers before videos.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // The filter calls OkHttp and okio by name; fail here, not in the app.
        missingMethods(OKHTTP_BODY_REWRITE_API).takeIf { it.isNotEmpty() }?.let {
            throw PatchException("OkHttp methods missing: ${it.joinToString()}")
        }
        OkHttpClientInitFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $FILTER->install(Lokhttp3/OkHttpClient\$Builder;)V",
        )
    }
}
