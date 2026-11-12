package app.morphe.patches.pixiv.searchranking

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

/**
 * Gives the Popular search tab something to show on accounts Pixiv will not rank for.
 *
 * `/v1/search/illust?sort=popular_desc` is answered with the plain date order for a non-premium
 * account, so the tab looks exactly like "Newest". Instead of fighting the server, the extension
 * intercepts that single request (all other traffic is untouched) and either serves Pixiv's free
 * popularity preview or re-sorts the returned page by bookmark count.
 *
 * The interceptor is installed from `OkHttpClient.Builder.build()` because the app builds several
 * clients through Hilt and only one of them is used for the API. The mode is picked in the
 * Pixiv-Patched page (off / preview / re-rank).
 */
val pixivSearchRankingPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Search Ranking",
    description = "Fills the Popular search tab on a free account: either with Pixiv's free " +
        "popularity preview (about 30 works) or by re-sorting the page by bookmark count. " +
        "Selected in the Pixiv-Patched page.",
    default = false
) {
    compatibleWith(PixivConstants.PIXIV)

    extendWith("extensions/pixiv.mpe")

    execute {
        val clientBuilderClass = mutableClassDefBy("Lokhttp3/OkHttpClient\$Builder;")

        val buildMethod = clientBuilderClass.methods.first {
            it.name == "build" &&
                it.returnType == "Lokhttp3/OkHttpClient;" &&
                it.parameterTypes.isEmpty()
        }

        buildMethod.addInstructions(
            0,
            "invoke-static {p0}, Lapp/morphe/extension/pixiv/search/SearchRankingHelper;->install(Lokhttp3/OkHttpClient\$Builder;)V"
        )
    }
}
