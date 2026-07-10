package app.template.patches.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

object PairIpProcessLicenseResponseFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;" &&
                method.name == "processResponse"
    }
)

object PairIpRepeatedCheckFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_BOOLEAN,
            name = "repeatedCheckEnabled"
        )
    )
)

object PairIpValidateLicenseResponseFingerprint : Fingerprint(
    custom = { method, classDef ->
        (classDef.type == "Lcom/pairip/licensecheck/ResponseValidator;" ||
                classDef.type == "Lcom/pairip/licensecheck/LicenseResponseHelper;") &&
                method.name == "validateResponse"
    }
)
