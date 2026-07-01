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
        stubReturnFalse(SamsungAccountUtilsIsAccountProviderSupportedFingerprint)
        stubReturnFalse(UtilGetSupportAccountManagerProviderFingerprint)
        stubReturnFalse(UtilIsAccountSignedInFromAccountManagerProviderFingerprint)

        SamsungAccountUtilsGetSamsungAccountIdFingerprint.let { fingerprint ->
            replaceMethodBody(
                fingerprint,
                """
            invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;
            move-result-object v0
            const-string v1, "$DEVICE_SAMSUNG_ACCOUNT_TYPE"
            invoke-virtual {v0, v1}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;
            move-result-object v0
            array-length v1, v0
            if-lez v1, :sa_no_account
            const/4 v1, 0x0
            aget-object v0, v0, v1
            iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;
            return-object v0
            :sa_no_account
            const/4 v0, 0x0
            return-object v0
            """.trimIndent(),
            )
        }

        replaceSigninPackageInDex()
    }
}
