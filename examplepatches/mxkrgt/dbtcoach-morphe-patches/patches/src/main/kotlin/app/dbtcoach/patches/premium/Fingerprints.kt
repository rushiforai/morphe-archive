package app.dbtcoach.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal const val NITRO_IAP_CLASS = "Lcom/margelo/nitro/iap/HybridRnIap;"
internal const val OPTIONS_TYPE = "Lcom/margelo/nitro/iap/NitroAvailablePurchasesOptions;"
internal const val PROMISE_TYPE = "Lcom/margelo/nitro/core/Promise;"
internal const val PURCHASE_TYPE = "Lcom/margelo/nitro/iap/NitroPurchase;"

/**
 * Lecture des achats natifs, utilisée comme repli hors-ligne par
 * `initializePremiumContent()` côté bundle JS.
 *
 * Smali (classes4/com/margelo/nitro/iap/HybridRnIap.smali:5298) :
 *
 *   .method public getAvailablePurchases(
 *       Lcom/margelo/nitro/iap/NitroAvailablePurchasesOptions;
 *   )Lcom/margelo/nitro/core/Promise;
 *
 * La classe est une classe de bibliothèque non obfusquée, donc le nom et le
 * descripteur sont stables ; le filtre `async$default` confirme qu'il s'agit
 * bien de l'implémentation qui crée la Promise via la coroutine Nitro.
 */
internal object GetAvailablePurchasesFingerprint : Fingerprint(
    definingClass = NITRO_IAP_CLASS,
    name = "getAvailablePurchases",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = PROMISE_TYPE,
    parameters = listOf(OPTIONS_TYPE),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/margelo/nitro/core/Promise\$Companion;",
            name = "async\$default",
        ),
    ),
)
