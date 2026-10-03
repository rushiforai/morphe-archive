/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.analytics

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

object FbHttpUploaderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/analytics2/uploader/fbhttp/FbHttpUploader;",
    name = "FDL",
    returnType = "V",
    parameters = listOf("L", "L", "L"),
)

object PrivacyControlledUploaderFingerprint : Fingerprint(
    definingClass =
        "Lcom/facebook/analytics2/logger/legacy/uploader/PrivacyControlledUploader;",
    name = "FDL",
    returnType = "V",
    parameters = listOf("L", "L", "L"),
)

object FalcoJobStartFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/falco/jobscheduler/FFJobService;",
    name = "onStartJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;"),
)

object FalcoJobStopFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/falco/jobscheduler/FFJobService;",
    name = "onStopJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;"),
)

object PapayaJobStartFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/papaya/fb/client/services/FBPapayaJobService;",
    name = "onStartJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;"),
)

object PapayaJobStopFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/papaya/fb/client/services/FBPapayaJobService;",
    name = "onStopJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;"),
)

object LacrimaUploadFingerprint : Fingerprint(
    definingClass =
        "Lcom/facebook/errorreporting/lacrima/sender/resumable/uploader/LacrimaReportUploader;",
    name = "A00",
    returnType = "V",
    parameters = emptyList(),
)

object QplDataProviderFingerprint : Fingerprint(
    definingClass =
        "Lcom/facebook/quicklog/reliability/httpheader/QPLDataProvider;",
    name = "listOpenFlowsString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

object XAnalyticsLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/xanalytics/XAnalyticsNative;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object XAnalyticsRealtimeEventFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/xanalytics/XAnalyticsNative;",
    name = "logRealtimeEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object XAnalyticsUploadRunnableFingerprint : Fingerprint(
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }
            ?: emptyList()
        references.any {
            it.definingClass == "Lcom/facebook/xanalytics/XAnalyticsNative;" &&
                it.name == "kickOffUpload"
        }
    },
)

object Facebook578AnalyticsHttpFingerprint : Fingerprint(
    definingClass = "LX/11R;",
    name = "A00",
    returnType = "I",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("AnalyticsHttpClient"),
)

object Facebook578AnalyticsUploadFingerprint : Fingerprint(
    definingClass = "LX/11i;",
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("upload_event_attempted", "AnalyticsUploader"),
)

object Facebook578AnalyticsEventFingerprint : Fingerprint(
    definingClass = "LX/11j;",
    name = "EW4",
    returnType = "V",
    parameters = listOf("LX/11L;"),
    strings = listOf("LOG_ANALYTICS_EVENTS"),
)

private fun componentClassFingerprint(definingClass: String) = Fingerprint(
    definingClass = definingClass,
    name = "<init>",
)

internal val telemetryComponentClassFingerprints = listOf(
    componentClassFingerprint(
        "Lcom/facebook/analytics2/fabric/onefabric/FFAlarmUploadJobService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/analytics2/fabric/onefabric/OneFabricUploadAlarmReceiver;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/analytics2/logger/GooglePlayUploadService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/analytics2/logger/service/LollipopUploadSafeService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/analytics2/logger/legacy/uploader/LollipopUploadService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/analytics2/logger/legacy/uploader/Analytics2UploadService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/analytics2/logger/legacy/uploader/AlarmBasedUploadService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/analytics2/logger/legacy/uploader/HighPriUploadRetryReceiver;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/profilo/upload/TraceUploadRetryJob;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/common/errorreporting/memory/service/jobschedulercompat/fbsvc/DumperUploadService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/reportaproblem/base/bugreport/BugReportUploadService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/googleplay/GooglePlayInstallReferrerReceiver;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/quicklog/filelogger/QPLFileLogBroadcastReceiver;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/bugreporter/core/scheduler/AlarmsBroadcastReceiver;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/bugreporter/core/scheduler/GCMBugReportService;",
    ),
    componentClassFingerprint(
        "Lcom/facebook/bugreporter/core/scheduler/LollipopBugReportService;",
    ),
    componentClassFingerprint(
        "Lcom/google/android/gms/analytics/AnalyticsReceiver;",
    ),
    componentClassFingerprint(
        "Lcom/google/android/gms/analytics/AnalyticsService;",
    ),
    componentClassFingerprint(
        "Lcom/google/android/gms/analytics/AnalyticsJobService;",
    ),
)
