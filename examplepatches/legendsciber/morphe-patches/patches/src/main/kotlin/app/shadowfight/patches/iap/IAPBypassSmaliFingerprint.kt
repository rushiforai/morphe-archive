package app.shadowfight.patches.iap

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * BillingClientImpl.launchBillingFlow — the base implementation that is
 * called at runtime when the game's C++ code (libil2cpp.so) invokes
 * launchBillingFlow via JNI. The zzcc subclass is only used when
 * BillingClient testing overrides are enabled in the manifest, which is
 * NOT the case in production builds.
 *
 * This is the actual entry point for Google Play billing. The JNI bridge
 * method launchBillingFlowCpp() calls this via virtual dispatch.
 *
 * Replacing this method body skips the Google Play billing flow entirely
 * and instead creates a fake Purchase, calls PurchasesUpdatedListener
 * directly, and returns OK — so the game's purchase completion flow
 * triggers naturally, delivering items without Google Play.
 */
object IAPBypassSmaliFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "launchBillingFlow",
    returnType = "Lcom/android/billingclient/api/BillingResult;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lcom/android/billingclient/api/BillingFlowParams;"
    )
)
