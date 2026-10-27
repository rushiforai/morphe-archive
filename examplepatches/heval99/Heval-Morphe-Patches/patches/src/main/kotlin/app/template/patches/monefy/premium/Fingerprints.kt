package app.template.patches.monefy.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Monefy's app code is R8-obfuscated (defpackage), so the anchors are the pref keys and the pro
// package id, which are stable strings, plus each method's shape. 1.22.11 names in brackets.

// The master "is pro" check [Lgh;->o()Z]: a static ()Z on the Application class (ClearCashApplication,
// R8-renamed; the manifest names its kept ClearCashApplication_ subclass) that tests the package
// name against the pro app id or reads the cached IAP flag. The pro id also appears in the main
// activity, but in a method of another shape.
object MasterProFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(string("com.monefy.app.pro", StringComparisonType.CONTAINS)),
    custom = { _, classDef -> classDef.superclass == "Landroid/app/Application;" },
)

// The cached IAP flag [GeneralSettingsProvider.F()Z]: the ()Z reader of the pref the RevenueCat
// callback writes (the writer J(ZJ)V has another shape). The class name is kept.
object ProBoughtFingerprint : Fingerprint(
    definingClass = "Lcom/monefy/helpers/GeneralSettingsProvider;",
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(string("KEY_GOOGLE_PLAY_MONEFY_PRO_IN_APP_BOUGHT", StringComparisonType.CONTAINS)),
)

// The subscription-expired state [Lzt;->p()Z, DefaultSettingsProviderImpl]: the ()Z reader of the
// pref (the writer j(Z)V has another shape; the interface declaration has no body or strings).
object SubscriptionExpiredFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(string("KEY_MONEFY_PRO_SUBSCRIPTION_EXPIRED", StringComparisonType.CONTAINS)),
)
