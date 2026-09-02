package app.morphe.patches.aiplantdoctor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

object LicenseClientCheckLicenseFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;" &&
                method.name == "checkLicense"
    }
)

object LicenseActivityOnCreateFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseActivity;" &&
                method.name == "onCreate"
    }
)

object LicenseActivityExitMethodsFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseActivity;" &&
                (method.name == "closeApp" || method.name == "exitApp" ||
                 method.name == "showErrorDialog" || method.name == "showPaywallAndCloseApp")
    }
)

object ApplicationAttachBaseContextFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/application/Application;" &&
                method.name == "attachBaseContext"
    }
)

object PigeonInAppPurchaseHandlerFingerprint : Fingerprint(
    strings = listOf(
        "dev.flutter.pigeon.in_app_purchase_android.InAppPurchaseApi.queryPurchasesAsync",
        "subs",
        "inapp"
    )
)

object BillingClientQueryPurchasesFingerprint : Fingerprint(
    custom = { method, classDef ->
        (classDef.type.contains("billingclient") || classDef.type.contains("InAppPurchase")) &&
                (method.name == "queryPurchasesAsync" || method.name == "onPurchasesUpdated")
    }
)
