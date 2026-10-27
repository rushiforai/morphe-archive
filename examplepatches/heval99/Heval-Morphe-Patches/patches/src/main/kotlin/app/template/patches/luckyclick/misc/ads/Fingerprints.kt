package app.template.patches.luckyclick.misc.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// The Play purchase restore, run from MainActivity.onResume (queryPurchasesAsync). It is the
// app's PurchasesResponseListener: it acknowledges or consumes each purchase, then stores
// "any ad-free purchase found" into the in-memory ad-free state (Boolean.valueOf + setValue) and
// "permanent purchase found" with its only putBoolean (the AD_FREE_PERMANENT key). With no
// purchase it resets the state to false. The listener method keeps its library name; the class
// is R8-renamed (i9.o in 3.28, i9.d0 in 4.8). Since 4.8 the prefs keys are no longer string
// literals (they are decoded at runtime), so the putBoolean call is the anchor, not the key.
internal object PurchasesRestoreFingerprint : Fingerprint(
    name = "onQueryPurchasesResponse",
    returnType = "V",
    parameters = listOf("Lcom/android/billingclient/api/BillingResult;", "Ljava/util/List;"),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "valueOf"),
        methodCall(definingClass = "Landroid/content/SharedPreferences\$Editor;", name = "putBoolean"),
    ),
    custom = { _, classDef -> !classDef.type.startsWith("Lcom/android/billingclient/") },
)
