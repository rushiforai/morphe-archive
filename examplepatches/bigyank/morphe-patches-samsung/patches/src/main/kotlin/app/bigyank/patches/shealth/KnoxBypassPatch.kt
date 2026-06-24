package app.bigyank.patches.shealth

import app.morphe.patcher.patch.bytecodePatch
import app.bigyank.patches.shared.Constants.COMPATIBILITY_SHEALTH

/**
 * Bypass Samsung Health Knox/root/warranty/SAK integrity checks.
 *
 * Stubs stable SDK methods (KnoxAdapter, KnoxControl, SakChecker, etc.) plus
 * OOBE popup/root gates and `$this$isRooted` file checks (content-scanned dex).
 */
@Suppress("unused")
val disableKnoxIntegrityChecksPatch = bytecodePatch(
    name = "Disable Knox integrity checks",
    description = "Bypass Knox, root, warranty bit, and SAK checks so Samsung Health runs on Knox-tripped devices (0x1) without root.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SHEALTH)

    execute {
        stubZeroReturn(KnoxAdapterCheckKnoxCompromisedExternalFingerprint, returnObject = true)
        stubZeroReturn(KnoxAdapterCheckKnoxCompromisedInternalFingerprint, returnObject = false)
        stubZeroReturn(KnoxAdapterCheckKnoxInitMigConditionFingerprint, returnObject = false)
        stubZeroReturn(KnoxAdapterIsKnoxAvailableFingerprint, returnObject = false)
        stubZeroReturn(KnoxAdapterIsKnoxAvailableCoreFingerprint, returnObject = false)
        stubZeroReturn(KnoxAdapterIsAksSakMandatoryFingerprint, returnObject = false)
        stubZeroReturn(KnoxAdapterIsLicenseActivatedFingerprint, returnObject = false)
        stubZeroReturn(KnoxAdapterShouldUseKnoxFingerprint, returnObject = false)
        stubZeroReturn(KnoxAdapterIsSupportedTimaVersionFingerprint, returnObject = false)
        stubZeroReturn(IcccAdapterCheckKnoxCompromisedFingerprint, returnObject = false)
        stubZeroReturn(KnoxControlIsKnoxAvailableFingerprint, returnObject = false)
        stubZeroReturn(KnoxControlCheckKnoxCompromisedFingerprint, returnObject = true)
        stubZeroReturn(KnoxControlCheckWarrantyBitFingerprint, returnObject = false)
        stubZeroReturn(IKnoxControlProxyIsKnoxAvailableFingerprint, returnObject = false)
        stubZeroReturn(IKnoxControlProxyRequestKeyInitForKnoxFingerprint, returnObject = false)
        stubZeroReturn(SakCheckerIsSupportedFingerprint, returnObject = false)
        stubZeroReturn(SamsungSakCheckerC6rFingerprint, returnObject = false)

        stubOobeKnoxGates()
    }
}
