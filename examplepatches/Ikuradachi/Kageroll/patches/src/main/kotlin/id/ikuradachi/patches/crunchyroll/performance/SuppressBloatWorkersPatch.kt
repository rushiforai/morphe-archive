package id.ikuradachi.patches.crunchyroll.performance

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private fun returnSuccessInstructions(resultSuccessType: String) = """
    new-instance v0, $resultSuccessType
    invoke-direct {v0}, $resultSuccessType-><init>()V
    return-object v0
""".trimIndent()

@Suppress("unused")
val suppressBloatWorkersPatch = bytecodePatch(
    name = "Suppress bloat workers",
    description = "Forces Google Engage, Continue Watching, Datadog, and OneTrust CMP background workers to return success immediately without performing network requests, disk I/O, or image prefetching.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    execute {
        // Target 10: Datadog WorkManager upload worker execution
        val datadogUploadMethod = DatadogUploadWorkerDoWorkFingerprint.matchAll(1..1).single().method
        val returnType = datadogUploadMethod.returnType
        check(returnType.startsWith("Landroidx/work/") && returnType.endsWith(";")) {
            "Unexpected WorkManager Result return type: $returnType"
        }
        val returnSuccess = returnSuccessInstructions("${returnType.removeSuffix(";")}\$c;")

        datadogUploadMethod.addInstructions(0, returnSuccess)

        // Target 7: Google Engage service worker execution
        GoogleEngageWorkerDoWorkFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            returnSuccess,
        )

        // Target 8: Continue Watching recurring background worker execution
        ContinueWatchingWorkerDoWorkFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            returnSuccess,
        )

        // Target 9: Datadog WorkManager upload worker scheduler
        DatadogWorkManagerSchedulerFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 11: OneTrust CMP consent logging worker execution
        OneTrustConsentLoggingWorkerFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            returnSuccess,
        )
    }
}
