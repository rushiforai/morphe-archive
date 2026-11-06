package app.zdrgon.patches.mp3tagger.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.mp3tagger.shared.Constants.COMPATIBILITY_SMART_MP3_TAGGER

/**
 * Smart MP3 Tagger — Enable Lifetime Pro.
 *
 * The app sells Pro four ways: three subscriptions (weekly / monthly /
 * yearly) and a one-time "Super Pro Forever" purchase ($49.99). All
 * four products feed a single local entitlement — there is no distinct
 * subscription state versus lifetime state.
 *
 * Every Pro question in the app funnels through one reader:
 *
 *   Lmr0;->a()Z
 *
 * POLARITY — read this before touching the pin. Despite checking
 * ownership, a() is the app's FREE-TIER predicate: it returns TRUE (1)
 * when the owned-products list contains NONE of the four SKUs, and
 * FALSE (0) as soon as any SKU is owned. All four SKU probes branch to
 * the "return 0" tail on a hit; the "return 1" fall-through is reached
 * only when nothing is owned. Every consumer confirms the reading:
 *
 *   - MainActivity.p shows the promotion/paywall popup only when
 *     a() == 1 (and launch count > 1).
 *   - MoreTabFragment.D adds the upgrade menu entries only when
 *     a() == 1.
 *   - The ad stack (Lq5;->a(Lq5;)Z = session flag && a(); the banner,
 *     interstitial, native-exit and app-open loaders in Lq5 / Lt5 /
 *     Lx5 / Lc5) loads ads only when a() == 1.
 *
 * So the state a "Super Pro Forever" buyer actually runs in is
 * a() == 0 at every call site. This patch pins the reader to 0 — the
 * owned value — which reproduces exactly the lifetime state, with
 * nothing that can expire. The pin is at the reader, so it does not
 * matter what the billing sync stores at startup; the stored value is
 * simply never consulted.
 *
 * HISTORY: v1.54.0 pinned this reader to 1 — the FREE value — which
 * forced the app to treat the user as unpaid forever (on-device:
 * "not unlocked"). The fingerprint and the funnel analysis were
 * right; the constant was inverted. Fixed 2026-11-03 after a full
 * branch-level re-audit of a() and all of its call sites.
 *
 * The patch creates no purchase and touches nothing in the billing
 * library; it only changes the app's own answer to its own question.
 * The paywall screen still opens if tapped, but the app already
 * believes Pro is active.
 */
@Suppress("unused")
val enableLifetimeProPatch = bytecodePatch(
    name = "Enable Lifetime Pro",
    description = "Turns on the app's Pro state (no ads, unlimited functions) as if the one-time \"Super Pro Forever\" purchase were owned — the lifetime state, with nothing to expire.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SMART_MP3_TAGGER)

    execute {
        IsFreeTierFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
    }
}
