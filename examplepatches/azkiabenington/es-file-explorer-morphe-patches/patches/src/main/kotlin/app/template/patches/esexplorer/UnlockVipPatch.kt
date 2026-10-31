package app.template.patches.esexplorer

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ES_EXPLORER_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Unlocks Lifetime VIP / Premium features across all ES File Explorer versions.
 * Adapted and enhanced from rushiranpise/morphe-patches with dual-architecture
 * support for v4.4.2.2.1 and v4.4.3.x builds.
 */
@Suppress("unused")
val esExplorerUnlockVipPatch = bytecodePatch(
    name = "Unlock VIP Lifetime",
    description = "Unlocks VIP lifetime features, removes license restrictions, and suppresses signature falsification dialogs.",
    default = true,
) {
    compatibleWith(ES_EXPLORER_COMPATIBILITY)

    execute {
        // ── 1. v4.4.2.x & v4.4.3.x: Modern Subscription & VIP Gate ─────────

        // Main isVip gate (anchored on TestActivity.j boolean access)
        runCatching {
            IsVipFingerprint.method.returnEarly(true)
        }

        // Lifetime VIP flag ("wx_pay_forever")
        runCatching {
            IsLifetimeFingerprint.method.returnEarly(true)
        }

        // VIP expiry timestamp (Long.MAX_VALUE ensures no expiry countdown triggers)
        runCatching {
            VipExpireTimeFingerprint.method.returnEarly(Long.MAX_VALUE)
        }

        // Account-level VIP flag
        runCatching {
            AccountInfoIsVipFingerprint.method.returnEarly(true)
        }

        // v4.4.2.x: ESAccountManager isLogged()Z
        runCatching {
            ESAccountManagerIsLoggedFingerprint.method.returnEarly(true)
        }

        // v4.4.3.x: Obfuscated ESAccountManager b.t()Z
        runCatching {
            LegacyAccountLoginFingerprint.method.returnEarly(true)
        }

        // APK signing cert MD5 check (returns true to emulate official build)
        runCatching {
            SignatureCheckFingerprint.method.returnEarly(true)
        }

        // Suppress "unofficial version" / falsified alert dialog
        runCatching {
            SuppressAlertPrefFingerprint.method.returnEarly(true)
        }

        // ── 2. v4.2.1.3.a: Legacy IAP / Companion-APK Model ─────────────────

        runCatching {
            OldPremiumSkuSubscriptionFingerprint.method.returnEarly(true)
        }

        runCatching {
            OldPremiumSkuInAppFingerprint.method.returnEarly(true)
        }

        runCatching {
            OldSuppressAlertPrefFingerprint.method.returnEarly(true)
        }

        runCatching {
            OldFexApplicationKFingerprint.method.returnEarly(true)
        }
    }
}

