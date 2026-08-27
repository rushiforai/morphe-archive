package app.template.patches.rustore.permissions

import app.morphe.patcher.Fingerprint

object VerificationInitProviderFingerprint : Fingerprint(
    definingClass = "Lru/mail/libverify/utils/VerifyInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

val verificationReceiverClasses = listOf(
    "Lru/mail/libverify/notifications/ChangePushPermissionsReceiver;",
    "Lru/mail/libverify/sms/IncomingSmsReceiver;",
    "Lru/mail/libverify/sms/IncomingCallReceiver;",
    "Lru/mail/libverify/utils/NetworkStateReceiver;",
    "Lru/mail/libverify/utils/network/NetworkStateReceiver;",
    "Lru/mail/libverify/utils/ScreenStateReceiver;",
    "Lru/mail/libverify/utils/PackageStateReceiver;",
    "Lru/mail/libverify/utils/SystemRestartReceiver;",
    "Lru/mail/libverify/utils/AlarmReceiver;",
    "Lru/mail/libverify/utils/BatteryLevelReceiver;",
    "Lru/mail/verify/core/utils/network/NetworkStateReceiver;",
    "Lsid/sdk/global/utils/sms/SIDSMSBroadcastReceiver;",
    "Lru/mail/libverify/platform/firebase/sms/SmsRetrieverReceiver;",
)

val verificationReceiverFingerprints = verificationReceiverClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = "onReceive",
        returnType = "V",
        parameters = listOf(
            "Landroid/content/Context;",
            "Landroid/content/Intent;",
        ),
    )
}

val verificationServiceBindClasses = listOf(
    "Lru/mail/libverify/ipc/IpcMessageService;",
    "Lru/mail/libverify/ipc/IpcNotificationService;",
    "Lru/mail/libverify/fetcher/FetcherService;",
)

val verificationServiceBindFingerprints =
    verificationServiceBindClasses.map { definingClass ->
        Fingerprint(
            definingClass = definingClass,
            name = "onBind",
            returnType = "Landroid/os/IBinder;",
            parameters = listOf("Landroid/content/Intent;"),
        )
    }

val verificationServiceStartClasses = listOf(
    "Lru/mail/libverify/utils/network/NetworkCheckService;",
    "Lru/mail/libverify/fetcher/FetcherService;",
    "Lru/mail/verify/core/utils/VerificationService;",
    "Lru/mail/verify/core/gcm/GcmProcessService;",
    "Lru/mail/verify/core/utils/IntentProcessJobService;",
)

val verificationServiceStartFingerprints =
    verificationServiceStartClasses.map { definingClass ->
        Fingerprint(
            definingClass = definingClass,
            name = "onStartCommand",
            returnType = "I",
            parameters = listOf(
                "Landroid/content/Intent;",
                "I",
                "I",
            ),
        )
    }

val verificationIntentHandlerClasses = listOf(
    "Lru/mail/libverify/notifications/NotificationService;",
    "Lru/mail/verify/core/utils/VerificationService;",
    "Lru/mail/verify/core/utils/IntentProcessService;",
)

val verificationIntentHandlerFingerprints =
    verificationIntentHandlerClasses.map { definingClass ->
        Fingerprint(
            definingClass = definingClass,
            name = "onHandleIntent",
            returnType = "V",
            parameters = listOf("Landroid/content/Intent;"),
        )
    }

val verificationWorkHandlerClasses = listOf(
    "Lru/mail/libverify/sms/SmsHandlingService;",
    "Lru/mail/libverify/utils/network/NetworkCheckService;",
    "Lru/mail/verify/core/gcm/GcmProcessService;",
    "Lru/mail/verify/core/utils/IntentProcessJobService;",
)

val verificationWorkHandlerFingerprints =
    verificationWorkHandlerClasses.map { definingClass ->
        Fingerprint(
            definingClass = definingClass,
            name = "onHandleWork",
            returnType = "V",
            parameters = listOf("Landroid/content/Intent;"),
        )
    }

val verificationJobMethods = listOf(
    "Lru/mail/libverify/fetcher/FetcherJobService;" to "onStartJob",
    "Lru/mail/libverify/fetcher/FetcherJobService;" to "onStopJob",
    "Lru/mail/verify/core/utils/VerificationJobService;" to "onStartJob",
    "Lru/mail/verify/core/utils/VerificationJobService;" to "onStopJob",
)

val verificationJobFingerprints = verificationJobMethods.map { (definingClass, methodName) ->
    Fingerprint(
        definingClass = definingClass,
        name = methodName,
        returnType = "Z",
        parameters = listOf("Landroid/app/job/JobParameters;"),
    )
}

val verificationActivityClasses = listOf(
    "Lru/mail/libverify/notifications/SettingsActivity;",
    "Lru/mail/libverify/notifications/SmsCodeNotificationActivity;",
    "Lru/mail/libverify/utils/permissions/ShadowActivity;",
)

val verificationActivityFingerprints = verificationActivityClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = "onCreate",
        returnType = "V",
        parameters = listOf("Landroid/os/Bundle;"),
    )
}
