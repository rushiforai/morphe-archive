package anxyis.morphe.patches.pure.deprotect

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.clearBody
import anxyis.morphe.patches.pure.shared.matchSingle
import anxyis.morphe.patches.pure.shared.requireClass
import anxyis.morphe.patches.pure.shared.requireMethod
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * PairIP licensecheck3 kill (5.0.270: LicenseClientV3, NOT V1/V2).
 *
 * FACT (stock tree): com/pairip/licensecheck3/LicenseClientV3.smali has
 *   onActivityCreate(Activity)V (public static), initializeLicenseCheck()V,
 *   connectToLicensingService()V, processResponse(ILBundle;)V,
 *   showPaywall(PendingIntent;)V, showErrorDialog()V, handleError(...),
 *   retryOrThrow(...), checkLicenseInternal(IBinder;)V, onServiceConnected/
 *   Disconnected, createResultListener, populateInputData, 5 lambdas.
 * All 70 call sites (67× onCreate first-line + 3 extra) are stripped by
 * [licenseCallStripPatch]; here the client itself is neutralized so any
 * missed path still cannot phone home or show a paywall.
 *
 * Method: clearBody() (wipe try-blocks; LicenseClientV3 uses them) then
 * inject a bare `return-void` at index 0. No new registers needed.
 */
private object V3OnActivityCreate : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "onActivityCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/app/Activity;"),
)

private object V3Initialize : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf(),
)

private object V3Connect : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "connectToLicensingService",
    returnType = "V",
    parameters = listOf(),
)

private object V3ProcessResponse : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "processResponse",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
)

private object V3ShowPaywall : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "showPaywall",
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
)

private object V3ShowErrorDialog : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "showErrorDialog",
    returnType = "V",
    parameters = listOf(),
)

private object V3CheckInternal : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "checkLicenseInternal",
    returnType = "V",
    parameters = listOf("Landroid/os/IBinder;"),
)

private fun killV3() = bytecodePatch(
    name = "License check off",
    description = "Turns off the license check so pro features stay unlocked.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        // Direct class anchoring (exact obfuscated package of THIS build).
        // Fingerprints above pin the same methods; the explicit requireMethod
        // calls below are the enforced anchors (throw on mismatch).
        val v3 = "Lcom/pairip/licensecheck3/LicenseClientV3;"
        requireClass(v3)
        val methods = listOf(
            Triple("onActivityCreate", listOf("Landroid/app/Activity;"), "V"),
            Triple("initializeLicenseCheck", emptyList<String>(), "V"),
            Triple("connectToLicensingService", emptyList<String>(), "V"),
            Triple("processResponse", listOf("I", "Landroid/os/Bundle;"), "V"),
            Triple("showPaywall", listOf("Landroid/app/PendingIntent;"), "V"),
            Triple("showErrorDialog", emptyList<String>(), "V"),
            Triple("checkLicenseInternal", listOf("Landroid/os/IBinder;"), "V"),
        )
        for ((name, params, ret) in methods) {
            val m = requireMethod(v3, name, params, ret)
            m.clearBody()
            m.addInstructions(0, "return-void")
        }
        // Fingerprint cross-check: each must resolve (documents intent, fails
        // loudly if the class shape drifts under us).
        for (fp in listOf(
            V3OnActivityCreate, V3Initialize, V3Connect, V3ProcessResponse,
            V3ShowPaywall, V3ShowErrorDialog, V3CheckInternal,
        )) {
            fp.matchSingle()
        }
    }
}

@Suppress("unused")
val pairIpV3KillPatch = killV3()
