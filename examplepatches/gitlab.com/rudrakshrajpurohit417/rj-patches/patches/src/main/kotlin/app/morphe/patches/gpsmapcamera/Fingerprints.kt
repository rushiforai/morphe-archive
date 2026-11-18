package app.morphe.patches.gpsmapcamera

import app.morphe.patcher.Fingerprint

// --- PairIP Anti-Tamper & LicenseCheck Defenses ---

object PairIPLicenseContentProviderFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)

object PairIPCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

object PairIPScheduleAppShutdownFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "scheduleAppShutdown",
    returnType = "V",
    parameters = emptyList()
)

object PairIPStartPaywallFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startPaywallActivity",
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;")
)

object PairIPStartErrorDialogFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity",
    returnType = "V",
    parameters = emptyList()
)

object PairIPLocalCheckPassedFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "isLocalCheckPassed",
    returnType = "Z",
    parameters = emptyList()
)

object PairIPStartupLauncherFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = emptyList()
)

object PairIPVMRunnerFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;")
)

// --- In-App Billing & Pro State Hooks ---

object SPGetBoolean2Fingerprint : Fingerprint(
    definingClass = "Lcom/gpsmapcamera/geotagginglocationonphoto/helper/SP;",
    name = "getBoolean",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;")
)

object SPGetBoolean3Fingerprint : Fingerprint(
    definingClass = "Lcom/gpsmapcamera/geotagginglocationonphoto/helper/SP;",
    name = "getBoolean",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z")
)

object AllAdsApprovalIsProFingerprint : Fingerprint(
    definingClass = "Lcom/gpsmapcamera/geotagginglocationonphoto/helper/AllAdsApproval;",
    name = "isPro",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

object CommonFunctionIsAnyPackagePurchasedFingerprint : Fingerprint(
    definingClass = "Lcom/gpsmapcamera/geotagginglocationonphoto/helper/CommonFunction;",
    name = "isAnyPackagePurchased",
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf("Landroid/content/Context;")
)

object PurchaseModelGetPurchasedFingerprint : Fingerprint(
    definingClass = "Lcom/gpsmapcamera/geotagginglocationonphoto/model/PurchaseModel;",
    name = "getPurchased",
    returnType = "I",
    parameters = emptyList()
)
