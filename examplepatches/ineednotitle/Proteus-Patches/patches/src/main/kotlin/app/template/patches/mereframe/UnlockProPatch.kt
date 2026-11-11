package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.logUniversal

/**
 * Mereframe 0.8.4 introduced a Pro tier. The authoritative entitlement view
 * used by every feature gate (editing, RAW/DNG, Astro, looks, video, ...) is
 * the set returned by the licensing SDK's "owned feature" accessor:
 *
 *   LQu;->k(Landroid/content/Context;)Ljava/util/Set;
 *
 * `Qu.k()` normally combines three inputs: the billing-support verdict, the
 * purchased-entitlement map (`Uv`) and a native "legacy install" check. When
 * no Play purchase exists that set is empty, so every `Qu.e/o/p` call reports
 * the feature as locked and the UI opens the Pro paywall.
 *
 * The previous revision nop'ed a `contains` guard inside the low-level parser
 * `nv.e`. That parser only populates prefs while processing a *real* purchase
 * callback; with no purchase there is nothing to parse and the paywall remains.
 *
 * This revision patches the source of truth instead: `Qu.k` returns the full
 * registered feature set (`Llr.p`, the same set the vendor's own
 * "installed before Pro arrived" path grants). Consequently `Qu.o` (all Pro
 * features), `Qu.p` (single feature) and `Qu.e` (feature entitlement) all
 * resolve unlocked, without any billing/network/account interaction.
 *
 * Fail-closed on structure: the fingerprint pins the 0.8.4 (vc 118) method
 * signature, so any drift aborts patching instead of half-unlocking.
 *
 * Pair with "Allow re-signed/sideloaded installs": the stock APK checks the
 * installer signature; without that patch the app refuses to start at all.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro features",
    description = "Returns every registered feature from the entitlement accessor (Qu.k) so all " +
        "Pro gates resolve unlocked. LOCAL client-side effect only. " +
        "WARNING (kept off by default): on at least one device (realme/Android 16) enabling the " +
        "single registered Pro feature crashes capture - the Pro pipeline path is gated by this " +
        "flag and we cannot verify its safety side. Enable only if you specifically want the Pro " +
        "toolset; the app works fully (RAW capture incl.) with just 'Allow re-signed installs'.",
    default = false,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)

    execute {
        Fingerprint(
            definingClass = "LQu;",
            name = "k",
            returnType = "Ljava/util/Set;",
            parameters = listOf("Landroid/content/Context;"),
        ).method.apply {
            clearBody()
            addInstructions(
                0,
                """
                sget-object v0, Llr;->p:LAc;
                invoke-static {v0}, LN7;->G1(Ljava/util/Collection;)Ljava/util/Set;
                move-result-object v0
                return-object v0
                """,
            )
        }
        logUniversal("Unlock Pro: LQu;->k(Context)Set now returns the full registered feature set")
    }
}
