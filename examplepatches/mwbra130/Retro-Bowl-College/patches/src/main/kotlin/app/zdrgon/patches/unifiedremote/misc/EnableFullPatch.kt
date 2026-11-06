package app.zdrgon.patches.unifiedremote.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.unifiedremote.shared.Constants.COMPATIBILITY_UNIFIED_REMOTE

/**
 * Unified Remote — Enable Full.
 *
 * The free app sells "Unified Remote Full" two ways, both feeding the
 * same local license state: a RevenueCat entitlement ("full", over
 * Play Billing — subscriptions and the one-time purchase offered on
 * the Subscription page) and the legacy separate paid app
 * (com.Relmtech.RemotePaid, linked from that same page). Whichever
 * route a buyer takes, the result lands in ONE local value that every
 * feature in the app consults:
 *
 *   Lbh0;->c(Landroid/content/Context;)I — license status
 *     0 = Free, 1 = Locked, 2 = Full
 *
 * Its boolean form Lbh0;->i (isFull == status 2) gates all 70+
 * remotes, custom remotes and the editor, screen mirroring, floating
 * remotes, the extended keyboard, Widgets & Quick Actions, voice
 * commands (Ldd1;), IR actions and NFC actions (Ldp0;) — 19 call
 * sites in 16 files. The per-remote gate Lbh0;->h asks i() before
 * falling back to the free-remote list, and MainActivity only
 * initialises the ad SDK when the status is not Full, which is the
 * paywall's "No ads". Even the status label strings derive from c(),
 * so the app reports "Full" exactly like a bought copy.
 *
 * This patch pins that single reader to 2 (Full) at its entry — the
 * exact answer a completed purchase produces. It creates no
 * purchase, forges no receipt, and touches nothing in RevenueCat or
 * the billing library; it only changes the app's own answer to its
 * own question. Pinning the reader (rather than the stored
 * "License.Status" preference) also survives RevenueCat syncs, which
 * can rewrite the stored status after empty entitlement responses
 * but cannot change what the reader returns.
 *
 * No companion patch is needed: 3.25.1 has NO PairIP at all (no
 * PairIP application class, no LicenseActivity, no libpairipcore.so
 * — the APK ships no native libraries), and no live local installer
 * check in app code, so a re-signed build launches without an
 * installer-source spoof.
 *
 * Cosmetic note: the Subscription page itself talks to RevenueCat
 * directly for its purchase UI, so it may still display upgrade
 * offers/prices there. That page is display/purchase only — every
 * feature gate reads the pinned status and unlocks.
 */
@Suppress("unused")
val enableFullPatch = bytecodePatch(
    name = "Enable Full",
    description = "Unlocks Unified Remote Full for free, as if the one-time Full purchase were bought: 70+ remotes, no ads, screen mirroring, floating remotes, extended keyboard, widgets and quick actions, voice commands, custom remotes, IR and NFC actions.",
    default = true
) {
    compatibleWith(COMPATIBILITY_UNIFIED_REMOTE)

    execute {
        LicenseStatusFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x2
                return v0
            """.trimIndent()
        )
    }
}
