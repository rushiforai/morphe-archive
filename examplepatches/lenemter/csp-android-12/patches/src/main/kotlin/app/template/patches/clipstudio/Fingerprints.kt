package app.template.patches.clipstudio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

object PWLegacyBuildFingerprint : Fingerprint(
    definingClass = "Lcom/celsys/pwlegacyandroidhelpers/PWLegacyJniBuildAndroid;",
    name = "getVersionSdkInt",
    returnType = "I"
)

object ProfileVerifierApi33Fingerprint : Fingerprint(
    definingClass = "Landroidx/profileinstaller/ProfileVerifier\$Api33Impl;",
    name = "getPackageInfo",
    returnType = "Landroid/content/pm/PackageInfo;",
    parameters = listOf("Landroid/content/pm/PackageManager;", "Landroid/content/Context;")
)

object AFg1fSDKFingerprint : Fingerprint(
    definingClass = "Lcom/appsflyer/internal/AFg1fSDK;",
    name = "w_",
    returnType = "Landroid/content/pm/PackageInfo;",
    parameters = listOf("Landroid/content/pm/PackageManager;", "Ljava/lang/String;")
)

object AFj1tSDKFingerprint : Fingerprint(
    definingClass = "Lcom/appsflyer/internal/AFj1tSDK;",
    name = "C_",
    returnType = "Landroid/content/pm/ProviderInfo;",
    parameters = listOf("Landroid/content/Context;")
)

object FirebaseProcessFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/FirebaseApp;",
    name = "getInstance",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/os/Process;",
            name = "myProcessName"
        )
    )
)
