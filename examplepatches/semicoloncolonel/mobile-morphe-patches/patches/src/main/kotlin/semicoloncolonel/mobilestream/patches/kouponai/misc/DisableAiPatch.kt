package semicoloncolonel.mobilestream.patches.kouponai.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.enableWebFilter
import semicoloncolonel.mobilestream.patches.kouponai.shared.kouponWebFilterPatch

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Disable AI (OPT-IN, default OFF).
//
// A deal page (a web page in React Native's web view) asks
// /api/deal/ai-evaluation-enabled whether to show an AI evaluation of the
// deal ("Deal insights"), then loads it from /api/deal/ai-evaluation.
// KouponWebFilter answers both with an empty 404, so the page leaves the section out.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Removes the AI \"Deal insights\" verdict from deal pages.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibsPatch)

    dependsOn(kouponWebFilterPatch)

    execute {
        enableWebFilter("hideAi")
    }
}
