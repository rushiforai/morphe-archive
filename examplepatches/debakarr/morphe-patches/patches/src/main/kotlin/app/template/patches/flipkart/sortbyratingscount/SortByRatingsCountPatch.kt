package app.template.patches.flipkart.sortbyratingscount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.FLIPKART_COMPATIBILITY

private const val HELPER = "Lapp/template/extension/extension/SortByRatingsHelper;"

@Suppress("unused")
val flipkartSortByRatingsCountPatch = bytecodePatch(
    name = "Sort by number of ratings",
    description = "Sorts Flipkart search results by number of ratings (descending) " +
        "via native JSON interception of the React Native NetworkCaller bridge.",
    default = false,
) {
    compatibleWith(FLIPKART_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Hook the RN NetworkCaller callback: network.b.OnSuccess(String)V
        // p0 = this (network.b callback with Promise field "a")
        // p1 = JSON response string
        //
        // We transform p1 in-place (sort products by ratingCount) then let the
        // original code resolve the Promise with the modified string.  This is
        // safer than short-circuiting because it preserves the original Promise
        // resolution logic.
        NetworkCallerOnSuccessFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1}, $HELPER->processFlipkartSearchResponse(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """,
        )
    }
}
