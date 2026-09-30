package app.template.patches.flipkart.sortbyratingscount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.FLIPKART_COMPATIBILITY

private const val HELPER = "Lapp/template/extension/extension/SortByRatingsHelper;"

@Suppress("unused")
val flipkartSortByRatingsCountPatch = bytecodePatch(
    name = "Sort by number of ratings",
    description = "Sorts Flipkart search results by number of ratings (descending) " +
        "and removes ad/sponsored items across all listing pages.",
    default = false,
) {
    compatibleWith(FLIPKART_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Every NetworkCaller variant resolves the JS Promise from a
        // `OnSuccess(String)` callback.  Transform the raw JSON in place before
        // the original code resolves it (and, for the *AndCache variants,
        // before it is written to the disk cache).
        //
        // p0 = this (callback holding the Promise), p1 = raw JSON response.
        val sortCallback = """
            invoke-static {p1}, $HELPER->processFlipkartSearchResponse(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """.trimIndent()

        NetworkCallerResponseFingerprint.method.addInstructions(0, sortCallback)
        NetworkCallerAsyncResponseFingerprint.method.addInstructions(0, sortCallback)
        NetworkCallerResponseCacheFingerprint.method.addInstructions(0, sortCallback)
        NetworkCallerAsyncResponseCacheFingerprint.method.addInstructions(0, sortCallback)

        // Generic mapi Gson converter: wrap the response reader so every mapi
        // page (search, category, browse, PDP, ...) gets its product maps
        // sorted and ad entries removed before Gson builds the models.
        //
        // p1 = okhttp3 ResponseBody, p2 = java.io.Reader.  Replacing p2 at the
        // top of the method hands Gson the rewritten JSON.
        MapiGsonConvertFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p2}, $HELPER->processResponseReader(Ljava/io/Reader;)Ljava/io/Reader;
                move-result-object p2
            """.trimIndent(),
        )

        // Belt-and-braces: the raw response string is attached to
        // `mapi.model.o.m` in exactly one place, and that object is what the
        // NetworkCaller resolver reads.  Sort the field there as well so any
        // path that bypasses the four callbacks above is still covered.
        //
        // Just before `return-object p1`, p1 holds the mapi.model.o instance;
        // v0 is a free local register.
        MapiRawResponseConverterFingerprint.method.apply {
            addInstructions(
                implementation!!.instructions.lastIndex,
                """
                    iget-object v0, p1, Lcom/flipkart/mapi/model/o;->m:Ljava/lang/String;
                    invoke-static {v0}, $HELPER->processFlipkartSearchResponse(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                    iput-object v0, p1, Lcom/flipkart/mapi/model/o;->m:Ljava/lang/String;
                """.trimIndent(),
            )
        }
    }
}
