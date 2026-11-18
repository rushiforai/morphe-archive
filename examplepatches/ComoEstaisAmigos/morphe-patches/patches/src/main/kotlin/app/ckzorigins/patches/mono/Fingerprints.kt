package app.ckzorigins.patches.mono

import app.morphe.patcher.Fingerprint

internal object FlurryDeviceIdFingerprint : Fingerprint(
    definingClass = "Lcom/flurry/android/FlurryAgent;",
    name = "f",
    returnType = "[B",
    parameters = listOf("Landroid/content/Context;"),
)

internal object FlurryGluStartSessionFingerprint : Fingerprint(
    definingClass = "Lcom/glu/plugins/FlurryGlu;",
    name = "StartSession",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal object MobileAppTrackerGluInitFingerprint : Fingerprint(
    definingClass = "Lcom/glu/plugins/MobileAppTrackerGlu;",
    name = "Init",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object TapjoyGluInitFingerprint : Fingerprint(
    definingClass = "Lcom/glu/plugins/TapjoyGlu;",
    name = "Init",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

internal const val TAPJOY_CONNECT = "Lcom/tapjoy/TapjoyConnect;"

internal object TapjoyConnectInstanceFingerprint : Fingerprint(
    definingClass = TAPJOY_CONNECT,
    name = "getTapjoyConnectInstance",
    returnType = TAPJOY_CONNECT,
    parameters = listOf(),
)

internal object PlayHavenGluInitFingerprint : Fingerprint(
    definingClass = "Lcom/glu/plugins/PlayHavenGlu;",
    name = "Init",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object ChartBoostGluInitFingerprint : Fingerprint(
    definingClass = "Lcom/glu/plugins/ChartBoostGlu;",
    name = "Init",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object GWalletInitialiseFingerprint : Fingerprint(
    definingClass = "Lcom/glu/platform/gwallet/GWallet;",
    name = "onInitialise",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

internal object GWalletOutOfGameFingerprint : Fingerprint(
    definingClass = "Lcom/glu/platform/gwallet/outofgame/GWOutOfGameAPI;",
    name = "getOutOfGameNotifications",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/glu/platform/gwallet/outofgame/GWNotificationHandler;",
    ),
)

internal const val DOWNLOADER_ACTIVITY =
    "Lcom/google/android/vending/expansion/downloader_impl/DownloaderActivity;"

internal object ExpansionCheckPropertiesFingerprint : Fingerprint(
    definingClass = DOWNLOADER_ACTIVITY,
    name = "checkProperties",
    returnType = "V",
    parameters = listOf(),
)

internal object ExpansionCheckUpgradeFingerprint : Fingerprint(
    definingClass = DOWNLOADER_ACTIVITY,
    name = "checkUpgrade",
    returnType = "V",
    parameters = listOf(),
)

internal const val NOTIFICATION_RECEIVER = "Lcom/glu/plugins/NotificationReceiver;"

internal object NotificationReadFromS3Fingerprint : Fingerprint(
    definingClass = NOTIFICATION_RECEIVER,
    name = "readFromS3",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object NotificationReadGWalletFrequencyFingerprint : Fingerprint(
    definingClass = NOTIFICATION_RECEIVER,
    name = "readGWalletFrequency",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal const val AJT_BACKUP = "Lcom/glu/plugins/AJTBackup;"

internal object AjtBackupDataChangedFingerprint : Fingerprint(
    definingClass = AJT_BACKUP,
    name = "DataChanged",
    returnType = "V",
    parameters = listOf(),
)

internal object AjtBackupRequestRestoreFingerprint : Fingerprint(
    definingClass = AJT_BACKUP,
    name = "RequestRestore",
    returnType = "V",
    parameters = listOf(),
)

internal const val GLU_BACKUP_AGENT = "Lcom/glu/plugins/GluBackupAgent;"

internal object GluBackupAgentOnCreateFingerprint : Fingerprint(
    definingClass = GLU_BACKUP_AGENT,
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

internal object GluBackupAgentOnBackupFingerprint : Fingerprint(
    definingClass = GLU_BACKUP_AGENT,
    name = "onBackup",
    returnType = "V",
    parameters = listOf(
        "Landroid/os/ParcelFileDescriptor;",
        "Landroid/app/backup/BackupDataOutput;",
        "Landroid/os/ParcelFileDescriptor;",
    ),
)

internal object GluBackupAgentOnRestoreFingerprint : Fingerprint(
    definingClass = GLU_BACKUP_AGENT,
    name = "onRestore",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/backup/BackupDataInput;",
        "I",
        "Landroid/os/ParcelFileDescriptor;",
    ),
)
