package semicoloncolonel.mobilestream.patches.primevideo.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// Prime Video 3.0.477.1447 ships Alexa+ as an in-app AI chat ("Lighthouse"):
// a floating button, conversation starters, and a companion mode that can
// start playback. Every entry point asks LighthouseAIChatConfig whether it is
// on, and the class keeps its names. The public switches and the two private
// methods that compute them are made to return false, so the chat, its
// button and the companion never start, whatever the weblabs or server
// config say.
//
// X-Ray Recaps are not covered here. They live in the newer player, which
// Skip ads already replaces with the older one.
// ─────────────────────────────────────────────────────────────────────────────

private const val CHAT_CONFIG = "Lcom/amazon/avod/config/LighthouseAIChatConfig;"

private val SWITCHES = setOf(
    "isLighthouseAIChatEnabled",
    "isLighthouseAIChatEnabledT1",
    "isMobileCompanionEnabled",
    "computeLighthouseAIChatEnabled",
    "computeMobileCompanionEnabled",
)

// Present in 3.0.477.1447, removed in 3.0.480.457. Turned off when present.
private val OPTIONAL_SWITCHES = setOf(
    "isCompanionPlaybackInterceptionEnabled",
)

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off Alexa+, its floating button, and its companion mode.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val methods = mutableClassDefBy(CHAT_CONFIG).methods.filter {
            (it.name in SWITCHES || it.name in OPTIONAL_SWITCHES) &&
                it.returnType == "Z" && it.parameterTypes.isEmpty()
        }
        val missing = SWITCHES - methods.map { it.name }.toSet()
        if (missing.isNotEmpty()) {
            throw PatchException("Lighthouse chat switches not found: $missing")
        }
        methods.forEach { it.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
    }
}
