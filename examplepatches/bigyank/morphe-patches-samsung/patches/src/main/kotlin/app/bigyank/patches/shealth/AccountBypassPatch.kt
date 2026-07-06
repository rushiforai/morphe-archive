package app.bigyank.patches.shealth

import app.morphe.patcher.patch.bytecodePatch
import app.bigyank.patches.shared.Constants.COMPATIBILITY_SHEALTH

/**
 * Bypass Samsung Account provider signature checks on patched Health.
 *
 * Replaces `com.osp.app.signin` → `com.notsamsung.dummy` in dex const-strings and static
 * field defaults. Provider stubs stop Health from calling Samsung Account's signature-checked
 * AccountManagerProvider (logcat: `SignatureInfoDbHelper … mismatched`).
 *
 * Dex-only — does not decode resources (~300 MB APK), so Morphe Manager patches on-device
 * without OOM. Default Morphe keystore is fine; no custom JKS required.
 */
@Suppress("unused")
val bypassSamsungAccountSignatureCheckPatch = bytecodePatch(
    name = "Bypass Samsung Account provider checks",
    description = "Replaces com.osp.app.signin with com.notsamsung.dummy in dex and routes " +
        "account lookups through Android AccountManager instead of Samsung Account's provider.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SHEALTH)

    execute {
        // 6.3x no-arg vs 7.x Context arg — only one exists per APK.
        stubReturnFalseIfPresent(SamsungAccountUtilsIsAccountProviderSupportedFingerprint)
        stubReturnFalseIfPresent(SamsungAccountUtilsIsAccountProviderSupportedWithContextFingerprint)
        stubReturnFalseIfPresent(AccountCountryLookupIsAccountProviderSupportedFingerprint)

        stubReturnFalse(UtilGetSupportAccountManagerProviderFingerprint)
        stubReturnFalse(UtilIsAccountSignedInFromAccountManagerProviderFingerprint)

        // 6.3x direct provider call; 7.x uses SamsungAccountDataSourceImpl (content-scanned below).
        replaceMethodBodyIfPresent(
            SamsungAccountUtilsGetSamsungAccountIdFingerprint,
            accountManagerLookupBody("p1"),
        )

        stubAccountProviderFetchCalls()
        replaceSigninPackageInDex()
    }
}
