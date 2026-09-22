package app.worldsoccerchamps.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

object PurchaseFingerprint : Fingerprint(
    definingClass = "Liap/PurchaseManager;",
    name = "purchase",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/android/billingclient/api/BillingClient;",
            name = "launchBillingFlow"
        )
    )
)

object SignatureCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;")
)

object AntiHijackFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/g;",
    name = "d",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/app/Activity;")
)

object PlayStoreCheckFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/g;",
    name = "q",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/app/Activity;")
)

object AntiHookFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/g;",
    name = "e",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList()
)

object NativeFlagFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/g;",
    name = "j",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList()
)

object DexCrcFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/g;",
    name = "k",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;")
)

object AssetCrcFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/g;",
    name = "m",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;")
)

object InstalledAppsFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/g;",
    name = "a",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;")
)

object PlayIntegrityTokenFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/n;",
    name = "k",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList()
)

object PlayIntegrityVerdictFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/n;",
    name = "l",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList()
)

object PlayIntegrityStatusFingerprint : Fingerprint(
    definingClass = "Lorg/cocos2dx/cpp/n;",
    name = "m",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList()
)
