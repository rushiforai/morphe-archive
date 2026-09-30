package app.template.patches.myntra.sortbyratingscount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MYNTRA_COMPATIBILITY
import app.template.patches.shared.HELPER
import app.template.patches.shared.filterByteArrayResults
import app.template.patches.shared.filterStringResults

private const val PROCESS = "processMyntraResponse"

@Suppress("unused")
val myntraSortByRatingsCountPatch = bytecodePatch(
    name = "Sort by number of ratings",
    description = "Sorts Myntra search and listing results by number of ratings (descending) " +
        "and removes sponsored items.",
    default = false,
) {
    compatibleWith(MYNTRA_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Myntra's JS gets listings through several native paths; rewrite the body
        // on each before it crosses the bridge.
        ApiRequestResponseFingerprint.method.filterStringResults(PROCESS) {
            it.definingClass == "Lokhttp3/ResponseBody;" && it.parameterTypes.isEmpty()
        }
        ApiRequestPrefetchedFingerprint.method.filterStringResults(PROCESS) {
            it.name == "toString" && it.parameterTypes.isEmpty()
        }
        ReactNetworkingCallbackFingerprint.method.filterStringResults(PROCESS) {
            it.definingClass == "Lokhttp3/ResponseBody;" && it.parameterTypes.isEmpty()
        }
        // Layout engine pages (search / listing), p1 = page JSON.
        val rewritePage = """
            invoke-static {p1}, $HELPER->$PROCESS(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """.trimIndent()
        LayoutEngineBridgePageDataFingerprint.method.addInstructions(0, rewritePage)
        LayoutEngineProcessSuccessFingerprint.method.addInstructions(0, rewritePage)
        // fetch() / XHR blob responses: search and listing pages arrive here.
        BlobResponseHandlerFingerprint.method.filterByteArrayResults("processMyntraBytes") {
            it.definingClass == "Lokhttp3/ResponseBody;" && it.parameterTypes.isEmpty()
        }
    }
}
