package app.morphe.patches.pixiv.searchthreshold

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Gives search a bookmark-count floor.
 *
 * Pixiv's search API accepts `bookmark_num_min`, but a free account is answered with the same works
 * whether the filter is there or not - the gate is on the server. The keyword Pixiv's own suggestion
 * bar offers (`500users入り` and its larger cousins) survives that gate, but it is a tag Japanese
 * artists write by hand, so searching with it leaves out every work written in another language.
 *
 * The floor is applied to the response instead: search items carry `total_bookmarks`, and the
 * extension drops the ones below the chosen count from the page. The request is untouched, which is
 * what keeps the filter independent of the language the search is written in.
 *
 * The search endpoint answers thirty works per page no matter what `size` asks for, so a strict
 * floor would leave a quiet tag with a nearly empty page. The extension therefore borrows the
 * following pages when a page falls below half, and points the page's `next_url` past everything it
 * merged in.
 *
 * The response rewrite happens in an OkHttp interceptor installed from `OkHttpClient.<init>(Builder)`,
 * not from `Builder.build()`: Retrofit's default call factory is `new OkHttpClient()`, whose builder
 * never goes through `build()`. Every client passes through the constructor, so one hook covers
 * whatever the app ends up using.
 */
val pixivBookmarkThresholdPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Bookmark Threshold",
    description = "Drops works below the chosen bookmark count from search results on the device, " +
        "for illusts and novels alike, and tops a short page up from the following pages so it " +
        "does not turn blank. The request itself is left alone, so the floor works with search " +
        "words in any language. Adjustable in the Pixiv-Patched page.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)

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
            "invoke-static {p1}, Lapp/morphe/extension/pixiv/search/BookmarkThreshold;->install(Lokhttp3/OkHttpClient\$Builder;)V"
        )
    }
}
