package app.morphe.patches.pixiv.searchranking

import app.morphe.patches.pixiv.popularsearch.pixivPopularSearchPatch
import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Gives the Popular search tab something to show on accounts Pixiv will not rank for.
 *
 * `/v1/search/illust?sort=popular_desc` (and the novel equivalent) is answered with the plain date
 * order for a non-premium account, so the tab looks exactly like "Newest". Instead of fighting the
 * server, the extension intercepts that single request (all other traffic is untouched) and serves
 * Pixiv's free popularity preview of around thirty works.
 *
 * The interceptor is installed from `OkHttpClient.<init>(Builder)`, not from `Builder.build()`:
 * Retrofit's default call factory is `new OkHttpClient()`, whose builder never goes through
 * `build()`, and that is the client the app's API actually ends up with. Every OkHttpClient is built
 * through this constructor, so hooking it catches both paths. The switch lives in the
 * Pixiv-Patched page (off / on).
 */
val pixivSearchRankingPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Search Ranking",
    description = "Fills the Popular search tab on a free account with Pixiv's free popularity " +
        "preview (about 30 illusts or novels), for both illust and novel search. " +
        "Adjustable in the Pixiv-Patched page.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)

    // Without this the app never asks for `sort=popular_desc` on a free account: it quietly keeps
    // the newest-works request, so there is nothing for the interceptor to rewrite. The bookmark
    // threshold is installed by SearchRankingHelper itself, so it is not a patch dependency.
    dependsOn(pixivPopularSearchPatch)

    extendWith("extensions/pixiv.mpe")

    execute {
        val clientClass = mutableClassDefBy("Lokhttp3/OkHttpClient;")

        val constructor = clientClass.methods.first {
            it.name == "<init>" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0].toString() == "Lokhttp3/OkHttpClient\$Builder;"
        }

        val instructions = constructor.implementation?.instructions
            ?: error("OkHttpClient.<init>(Builder) has no body")

        val superCallIndex = instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference
                .let { it is MethodReference && it.name == "<init>" && it.definingClass == "Ljava/lang/Object;" }
        }
        check(superCallIndex >= 0) { "OkHttpClient.<init>(Builder): super() call not found" }

        constructor.addInstructions(
            superCallIndex + 1,
            "invoke-static {p1}, Lapp/morphe/extension/pixiv/search/SearchRankingHelper;->install(Lokhttp3/OkHttpClient\$Builder;)V"
        )
    }
}
