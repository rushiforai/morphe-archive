package app.template.patches.netflix.misc.household

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.netflix.nativehook.bundleGadgetPatch
import app.template.patches.shared.Constants.NETFLIX_COMPATIBILITY

// ─────────────────────────────────────────────────────────────────────────────
// Suppress the Netflix household / "you're traveling" prompt (OPT-IN, default OFF).
//
// Netflix's living-room app enforces household/account-sharing via a redux-saga in
// the appboot JS: when the server returns a "misdetection" challenge, the saga
// stores it and then dispatches
//   put(setAccountSharingFlags({ isActiveMisdetectionSession: true }))
// to ACTIVATE the challenge. Traced downstream (killads.js HH block): the challenge
// UI is gated by  misdetectionAvailable = ("ready"===status) && isActiveMisdetectionSession,
// and the challenge-action callback guards on the same flag — so this single flag is
// the operative gate, set true in exactly one place. This patch flips the bundled
// script's HH_ENABLED, whose runtime pass rewrites the dispatched value true -> false
// (one byte, length-preserving), so the app receives the challenge but never activates
// the session and the full-screen prompt is not shown.
//
// HONEST SCOPE: this suppresses only the CLIENT-side prompt. It does NOT change what
// Netflix's servers detect (household detection is public-IP driven and server-side) —
// only a VPN/proxy changes that. It cannot be verified purely on-device unless the
// account is actually in a flagged/"misdetected" state; the patch self-reports that it
// APPLIED via the KILL log (PATCH HH / apply DONE … HH=true).
//
// Delivery: the pass lives in the gadget's bundled script (shipped OFF); this patch
// just turns it on, so it composes with the ad kills without a second script. Kept as
// its OWN opt-in (not folded into the ad kills or the privacy toggle) because it acts
// on an account/household control, a deliberate, separate choice.
//
// CREDIT: ported from ajstrick81/morphe-androidtv-patches (GPL-3.0). The household
// seam was originally identified with reference to Nikflix (github.com/YidirK/Nikflix,
// GPL-3.0); this implementation shares no code with it.
// ─────────────────────────────────────────────────────────────────────────────
@Suppress("unused")
val suppressHouseholdPromptPatch = resourcePatch(
    name = "Suppress Household Prompt",
    description = "Hides the Netflix \"you're traveling\" / update-your-household prompt by " +
        "keeping the client from activating the misdetection challenge session. Does NOT change " +
        "what Netflix's servers detect (that's driven by your public IP — use a VPN for that); " +
        "it only suppresses the on-screen prompt. Opt-in / experimental; only takes visible " +
        "effect when the account would otherwise be prompted.",
    default = false,
) {
    compatibleWith(NETFLIX_COMPATIBILITY)

    // The ad-kill gadget must have written the bundled script first.
    dependsOn(bundleGadgetPatch)

    execute {
        val script = get("lib/armeabi-v7a/libgadget.script.so")
        val text = script.readText()
        require(text.contains("HH_ENABLED=false")) {
            "suppressHouseholdPromptPatch: HH_ENABLED flag not found in bundled script — " +
                "killads.js/BundleGadgetPatch out of sync."
        }
        script.writeText(text.replaceFirst("HH_ENABLED=false", "HH_ENABLED=true"))
    }
}
