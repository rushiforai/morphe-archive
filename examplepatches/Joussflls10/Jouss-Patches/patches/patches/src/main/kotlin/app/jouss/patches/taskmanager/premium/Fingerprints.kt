package app.jouss.patches.taskmanager.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// ProBridgeImpl.initApp — reads "is_pro" from SharedPreferences and sets proUnlocked state
object ProBridgeInitFingerprint : Fingerprint(
    definingClass = "Lcom/rk/taskmanager_pro/ProBridgeImpl;",
    name = "initApp",
    returnType = "V",
    filters = listOf(
        string("is_pro"),
    )
)

// Pairip license check — processResponse
object PairipProcessResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
)

// Pairip signature validation
object PairipValidateResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseResponseHelper;",
    name = "validateResponse",
    returnType = "V",
)

// ProBridgeImpl constructor — initializes proUnlocked with Boolean.FALSE
object ProBridgeConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/rk/taskmanager_pro/ProBridgeImpl;",
    name = "<init>",
    returnType = "V",
)

// BatteryScreen — checks proUnlocked and shows battery monitoring or purchase dialog
object BatteryScreenFingerprint : Fingerprint(
    definingClass = "Lcom/rk/taskmanager_pro/ProBridgeImpl;",
    name = "BatteryScreen",
    returnType = "V",
)

// DiskScreen — checks proUnlocked and shows disk monitoring or purchase dialog
object DiskScreenFingerprint : Fingerprint(
    definingClass = "Lcom/rk/taskmanager_pro/ProBridgeImpl;",
    name = "DiskScreen",
    returnType = "V",
)

// NetScreen — checks proUnlocked and shows network tools or purchase dialog
object NetScreenFingerprint : Fingerprint(
    definingClass = "Lcom/rk/taskmanager_pro/ProBridgeImpl;",
    name = "NetScreen",
    returnType = "V",
)
