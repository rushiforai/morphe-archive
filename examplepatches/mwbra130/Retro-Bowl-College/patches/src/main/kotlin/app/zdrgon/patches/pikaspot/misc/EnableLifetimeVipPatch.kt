package app.zdrgon.patches.pikaspot.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.pikaspot.shared.Constants.COMPATIBILITY_PIKASPOT
import java.util.logging.Logger

/**
 * Pika Spot — Enable Lifetime VIP.
 *
 * The paywall sells the $79.99 Life Member product
 * ("com.pika.dynamicisland_svip") as the SVIP tier, above the
 * weekly/monthly/yearly subscription base plans. What a purchase
 * changes locally is not a boolean: at login and at every V-type
 * refresh the app ingests the account record (qf/b.a) and derives,
 * in the central state holder qf/a, a STATUS Boolean (from
 * User.status != 0) and a LEVEL Int (segment 1 of the decrypted
 * userVT2 token, written by qf/a.j). The level state is what every
 * gate reads — through the paid predicate Lm6/h.x (true iff the
 * level is 2 or 3) and through raw reads on the VIP screen, where
 * 2 renders "VIP" with an expiry date and 3 renders "SVIP" with
 * the fixed label "life member" (branch- and string-proven). The
 * derived "not VIP" state over the level is also the ad stack's
 * only membership input, and the animation apply decision is made
 * locally over the catalog beans the client already carries:
 * apply proceeds when the item's unlock flag is set, its price is
 * 0, or the level predicate is true — and applying then downloads
 * the item's own address field through the app's plain file
 * downloader, with no entitlement call in the path.
 *
 * The level state has exactly two production points: its factory
 * (qe/a case 6 builds it as c1(1), the free level) and the token
 * ingest qf/a.j — the sole post-construction writer, fed only by
 * qf/b.a and re-run at every login and V-type refresh. This patch
 * pins the ingest, plus the status reader. The factory point is
 * deliberately left alone: qe/a.invoke's three c1 constructions
 * take their constructor argument in pre-loaded registers (no
 * adjacent literal exists to pin), and the factory value is only
 * the pre-first-sync transient — before a launch's first account
 * sync lands, the level sits at 1, the same transient a genuine
 * Life Member account presents between process start and its
 * first sync completing (the app syncs user info at every
 * launch). From that first sync onward, re-asserted at every
 * login and refresh through the app's own state path, the app
 * holds exactly the state a genuine Life Member purchase
 * produces:
 *   - qf/a.j is replaced at entry: it ignores the token payload,
 *     writes LEVEL = 3 through the state's own setter, and feeds
 *     qf/a.k a 100-year validity, so the expiry String state (a
 *     display-only value the SVIP screen never renders) sits a
 *     century out, as a lifetime record implies;
 *   - User.getStatus() returns 1; its only consumer is the status
 *     derivation in qf/b.a, so the status state is always the
 *     active value a Life Member account carries.
 *
 * The patch creates no purchase, fabricates no server response
 * and no token, and touches nothing in billing or the network
 * layer; it only changes what the app's own state production
 * records for its readers.
 */
@Suppress("unused")
val enableLifetimeVipPatch = bytecodePatch(
    name = "Enable Lifetime VIP",
    description = "Turns on the lifetime Life Member (SVIP) state: no ads and every animated theme applies for free, with no expiry — the VIP screen reads Level: SVIP and Status: life member. Needs the stock Pika! Spot 1.4.5 XAPK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PIKASPOT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // 1) Steady state: the token ingest is the level state's
        //    only post-construction writer. Replace it at entry so
        //    every login / refresh re-records the lifetime values
        //    through the app's own setters, whatever the server's
        //    current record says.
        VipTokenIngestFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lqf/a;->i()Ls0/v0;
                move-result-object v0
                check-cast v0, Ls0/c1;
                const/4 v1, 0x3
                invoke-virtual {v0, v1}, Ls0/c1;->h(I)V
                const-wide v2, 0x2dec1f42c00L
                invoke-static {v2, v3}, Lqf/a;->k(J)V
                return-void
            """.trimIndent()
        )
        logger.info("Pika Spot: qf/a.j pinned — level state written as 3 (SVIP) with a 100-year expiry through the app's own state path.")

        // 2) Account status: getStatus()'s only consumer derives
        //    the status Boolean in qf/b.a; pin the reader so the
        //    derived state is the active value a Life Member
        //    account record carries.
        UserStatusFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
        logger.info("Pika Spot: User.getStatus pinned to 1 (account status always derives as active).")
    }
}
