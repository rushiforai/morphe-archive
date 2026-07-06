package app.paresh.patches.mark.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// Finds j6.a class via mark_service_enabled string in method k()
object MarkPremiumClassFingerprint : Fingerprint(
    filters = listOf(
        string("mark_service_enabled")
    )
)

// Targets j6.a.g() — isPremiumPurchased check
object IsPremiumPurchasedFingerprint : Fingerprint(
    classFingerprint = MarkPremiumClassFingerprint,
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.name == "g" }
)

// Targets j6.a.f() — isAdsRemoved check
object IsAdsRemovedFingerprint : Fingerprint(
    classFingerprint = MarkPremiumClassFingerprint,
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ -> method.name == "f" }
)

// Targets LicenseContentProvider.onCreate() — the root entry point for pairip
object LicenseContentProviderFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
)

// Targets LicenseClient.handleError() — suppress error dialogs
object LicenseHandleErrorFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;" &&
                method.name == "handleError"
    }
)

// Targets LicenseClient.processResponse() — handles license response
object ProcessLicenseResponseFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;" &&
                method.name == "processResponse"
    }
)

// Targets LicenseClient.initializeLicenseCheck() — entry point
object InitializeLicenseCheckFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;" &&
                method.name == "initializeLicenseCheck"
    }
)

// Targets ResponseValidator/LicenseResponseHelper.validateResponse()
object ValidateLicenseResponseFingerprint : Fingerprint(
    custom = { method, classDef ->
        (classDef.type == "Lcom/pairip/licensecheck/ResponseValidator;" ||
                classDef.type == "Lcom/pairip/licensecheck/LicenseResponseHelper;") &&
                method.name == "validateResponse"
    }
)
