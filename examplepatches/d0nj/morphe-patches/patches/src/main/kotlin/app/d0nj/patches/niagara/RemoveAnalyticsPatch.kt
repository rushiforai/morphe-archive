package app.d0nj.patches.niagara

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.d0nj.patches.shared.clearBody

private const val WORKER_SUCCESS_STUB = """
    invoke-static {}, Lb/fwgiSA41qmPPy4aBT3Q;->szRaOYk1SsGxRkFQ2p()Lb/LuHTGp3sW7b9p7TVa6afWU;
    move-result-object v0
    return-object v0
"""

@Suppress("unused")
val removeAnalyticsPatch = bytecodePatch(
    name = "Remove analytics",
    description = "Disables all telemetry in Niagara Launcher: the weekly usage-report " +
        "upload (app launches, notification metadata, survey responses), retention " +
        "milestone events, GDPR consent sync, Singular attribution sessions and events " +
        "(advertising ID, app set ID, install referrer, FCM token) and the runtime " +
        "Firebase Analytics opt-in.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            packageName = "bitpit.launcher",
            name = "Niagara Launcher",
            appIconColor = 0x1E88E5,
            targets = listOf(AppTarget(version = "1.16.23")),
        ),
    )

    execute {
        UsageReportUploadWorkerFingerprint.method.apply {
            clearBody()
            addInstructions(0, WORKER_SUCCESS_STUB.trimIndent())
        }

        RetentionEventsWorkerFingerprint.method.apply {
            clearBody()
            addInstructions(0, WORKER_SUCCESS_STUB.trimIndent())
        }

        GdprConsentSyncWorkerFingerprint.method.apply {
            clearBody()
            addInstructions(0, WORKER_SUCCESS_STUB.trimIndent())
        }

        SingularFirstSessionReportWorkerFingerprint.method.apply {
            clearBody()
            addInstructions(0, WORKER_SUCCESS_STUB.trimIndent())
        }

        SingularSessionReportWorkerFingerprint.method.apply {
            clearBody()
            addInstructions(0, WORKER_SUCCESS_STUB.trimIndent())
        }

        AttributionPostFingerprint.method.apply {
            clearBody()
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }

        FirebaseCollectionToggleFingerprint.method.apply {
            clearBody()
            addInstructions(0, "return-void")
        }
    }
}
