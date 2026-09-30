package app.template.patches.meesho.sortbyratingscount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import app.template.patches.shared.HELPER

@Suppress("unused")
val meeshoSortByRatingsCountPatch = bytecodePatch(
    name = "Sort by number of ratings",
    description = "Sorts Meesho catalog, search and collection feeds by number of ratings " +
        "(descending) and removes ad catalogs.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Bigger pages while "Most rated" is on: limit (p5) goes through the helper.
        CatalogsRequestBodyConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p5 .. p5}, $HELPER->meeshoPageLimit(I)I
                move-result p5
            """.trimIndent(),
        )

        // p1 = ResponseBody. v0/v1 are free at the top of the method (it is
        // reassigned before any use). Read the body, rewrite it, and hand the
        // converter a fresh body with the same content type.
        MoshiResponseBodyConverterFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p1}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;
                move-result-object v0
                invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;
                move-result-object v1
                invoke-static {v1}, $HELPER->processMeeshoResponse(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v1
                invoke-static {v0, v1}, Lokhttp3/ResponseBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/ResponseBody;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
