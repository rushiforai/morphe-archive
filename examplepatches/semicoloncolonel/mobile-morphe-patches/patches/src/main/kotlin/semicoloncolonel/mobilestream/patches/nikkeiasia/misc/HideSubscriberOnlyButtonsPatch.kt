package semicoloncolonel.mobilestream.patches.nikkeiasia.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.nikkeiasia.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Nikkei Asia (build 8a14774d) is a web app in Capacitor. For a reader who
// does not subscribe, the Listen and Translate buttons in articles are
// teasers: tapping one opens a tooltip such as "Translation is exclusive for
// paid subscribers." with a Subscribe Now link. Each teaser is a call to the
// tooltip component with that text, so the call becomes `null&&` the call,
// which renders nothing. Subscribers never get the tooltip and keep the
// buttons.
//
// The article paywall ("You've reached your free limit of articles") is not
// touched.
// ─────────────────────────────────────────────────────────────────────────────

private const val BUNDLE_FOLDER = "assets/public/assets"

// <name>.jsx(<Tooltip>,{button:<x>,tooltipText:"... exclusive for ... subscribers."
private val TEASER = Regex("""(\w+\.jsx\(\w+,\{button:\w+,tooltipText:"[^"]*exclusive for[^"]*subscribers\.")""")

private val hideTeasersInBundlePatch = rawResourcePatch {
    execute {
        val bundles = get(BUNDLE_FOLDER).listFiles { file -> file.name.endsWith(".js") }.orEmpty()
        var hidden = 0
        bundles.forEach { file ->
            val text = file.readText()
            val count = TEASER.findAll(text).count()
            if (count > 0) {
                file.writeText(TEASER.replace(text) { "null&&" + it.groupValues[1] })
                hidden += count
            }
        }
        // Listen and Translate in the article, and the Translate button in the toolbar.
        if (hidden < 2) throw PatchException("Subscriber-only teasers not found ($hidden)")
    }
}

@Suppress("unused")
val hideSubscriberOnlyButtonsPatch = bytecodePatch(
    name = "Hide subscriber-only buttons",
    description = "Hides the Listen and Translate buttons, which only open a Subscribe Now prompt " +
        "unless you subscribe.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hideTeasersInBundlePatch)
}
