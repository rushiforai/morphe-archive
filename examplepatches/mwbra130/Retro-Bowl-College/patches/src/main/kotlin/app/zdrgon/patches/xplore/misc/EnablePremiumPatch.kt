package app.zdrgon.patches.xplore.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.xplore.shared.Constants.COMPATIBILITY_XPLORE
import java.util.logging.Logger

/**
 * X-plore — Enable Premium (the "Dinner" tier, without the dinner).
 *
 * X-plore is donation-ware. Its gift screen sells five items; the two
 * cheap ones (1 beer, 2 beers) only remove ads, the top three
 * (3 beers, Cake and coffee, Dinner at $17) "Remove Ads + Unlock all
 * premium features". All five feed one owned-items list in the static
 * hub Li60 (field h), rebuilt from the store backends; each item's
 * value is f() = e() + 1 (1 beer = 1, ..., Dinner = 5).
 *
 * Every consumer asks the hub, through exactly two readers:
 *
 *   Li60.c()Z      = !h.isEmpty()  — any donation at all; ad init is
 *                    a caller, so any donation turns ads off.
 *   Li60.k(Lby5;)Z — per-feature LOCK predicate over the PaidFunction
 *                    enum (WiFi, Video, Music, FileSync, Vault, FTP,
 *                    ID3, Sftp, Git, PDF, Voluntary; ~20 call sites).
 *                    TRUE = LOCKED (polarity branch-verified): the
 *                    stock body sums f() over h and returns false
 *                    (unlocked) once the sum reaches 3.
 *
 * A genuine Dinner (f = 5) therefore produces exactly c() = true and
 * k(anything) = false. This patch pins both readers to those values —
 * the state the top donation tier runs in. The pins are at the
 * readers, so the persisted license file and the launch-time store
 * refresh (which rebuild h and would find no purchases on a
 * re-signed build) are simply never consulted for an answer. Both
 * readers are pure in-memory reads in stock: nothing asks a server.
 *
 * Deliberately NOT pinned: the owned-items list h itself and the
 * donate-ask gate Li60.b()Z. The About/Donate status text reads the
 * real list, so it keeps showing the true (empty) donation state —
 * cosmetic only; the features and the ad switch read the pins.
 *
 * The patch creates no purchase and touches nothing in any billing
 * library; it only changes the app's own answers to its own
 * questions. Requires the "Bypass PairIP signature check" companion
 * (default on) for the re-signed build to start at all.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks all premium features and removes ads by enabling the app's top donation tier state (the Dinner tier) — no purchase is made.",
    default = true
) {
    compatibleWith(COMPATIBILITY_XPLORE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        HasDonationFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
        logger.info("X-plore: donation reader pinned (Li60.c() always reports a donation, so ads stay off).")

        FeatureLockFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
        logger.info("X-plore: feature lock predicate pinned (Li60.k(Lby5;) always reports unlocked — the Dinner-tier state).")
    }
}
