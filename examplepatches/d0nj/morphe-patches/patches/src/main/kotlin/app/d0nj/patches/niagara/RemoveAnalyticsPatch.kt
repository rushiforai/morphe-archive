package app.d0nj.patches.niagara

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.d0nj.patches.shared.clearBody

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
            targets = listOf(AppTarget(version = null)),
        ),
    )

    execute {
        val successStub = successResultStub(SingularFirstSessionWorkFingerprint.method)

        UsageReportUploadWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        RetentionEventsWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        GdprConsentSyncWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        SingularFirstSessionWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        SingularSessionWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
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
