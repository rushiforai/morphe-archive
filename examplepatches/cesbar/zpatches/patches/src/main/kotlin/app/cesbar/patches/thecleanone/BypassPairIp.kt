package app.cesbar.patches.thecleanone

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags


object isIsolatedFingerprint : Fingerprint (
	definingClass = "Lcom/pairip/licensecheck/LicenseClient",
	accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
	returnType = "Z"

)


val bypassPairIpPatch = bytecodePatch (
    name = "Bypass PairIp",
    description = "Bypass the PairIp license check preventing app modification"
){
    compatibleWith(*Constants.COMPATIBILITY_PAIRIP)

    execute {
        isIsolatedFingerprint.method.returnEarly(true);
    }
}