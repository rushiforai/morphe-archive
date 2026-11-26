package app.template.patches.siagatani

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object MockLocationCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Landroid/location/Location;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/location/Location;",
            name = "isMock",
        )
    )
)

object MockLocationCheckBridgeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.BRIDGE, AccessFlags.SYNTHETIC),
    returnType = "Z",
    parameters = listOf("Landroid/location/Location;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/location/Location;",
            name = "isMock",
        )
    )
)

object LicenseCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            name = "ordinal",
        )
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;"
    }
)

object LocalInstallerCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("Local install check failed due to wrong installer."),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;"
    }
)
