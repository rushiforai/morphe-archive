package anxyis.morphe.patches.pure.content

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import org.w3c.dom.Element

/**
 * Layout declutter (matches Tanryu's visible home/account hiding).
 *
 * FACTS (stock vs Tanryu res, 5.0.270):
 * 1. res/layout/activity_home_screen.xml: Tanryu zeroes the tutorial
 *    ImageButton (40dip/5dip padding -> 0dip) and adds a "TANRYU X ELITE"
 *    TextView. Pure hides the button (0dip, like Tanryu) WITHOUT the brand
 *    TextView. The buttonTutorial id + constraints stay (no code refs break).
 * 2. res/layout/activity_my_account.xml: Tanryu sets the scrollableContent
 *    LinearLayout (timedDiscountCard, creatorRankingCard, creatorProgramCard,
 *    licenseCardList, offlineText) to android:visibility="gone", plus flips
 *    busySpinner to indeterminate=false (spinner never spins; stock hides it
 *    at runtime anyway via setVisibility(4) in MyAccountActivity).
 *    Pure replicates the gone-visibility (server-driven promo/ranking cards
 *    hidden, like Tanryu's look). busySpinner flip also replicated (harmless,
 *    runtime-hidden either way).
 *
 * All edits are attribute-level on elements located by android:id; counts
 * asserted. No new resources, no id changes.
 */
private fun Element.setAndroid(name: String, value: String) {
    setAttribute("android:$name", value)
}

private fun Element.getAndroid(name: String) = getAttribute("android:$name")

private fun findById(
    doc: org.w3c.dom.Document,
    tag: String,
    id: String,
): Element {
    val nodes = doc.getElementsByTagName(tag)
    val hits = mutableListOf<Element>()
    for (i in 0 until nodes.length) {
        val el = nodes.item(i) as? Element ?: continue
        if (el.getAndroid("id") == id) hits.add(el)
    }
    if (hits.size != 1) {
        throw PatchException("Pure: $tag $id found x${hits.size}, expected 1")
    }
    return hits[0]
}

@Suppress("unused")
val layoutDeclutterPatch = resourcePatch(
    name = "Cleaner home screen",
    description = "Hides the tutorial button and promo cards.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        // 1. Home: zero the tutorial button.
        document("res/layout/activity_home_screen.xml").use { doc ->
            val btn = findById(doc, "ImageButton", "@id/buttonTutorial")
            btn.setAndroid("padding", "0.0dip")
            btn.setAndroid("layout_width", "0.0dip")
            btn.setAndroid("layout_height", "0.0dip")
        }
        // 2. Account: gone the cards container + calm the spinner.
        document("res/layout/activity_my_account.xml").use { doc ->
            // The LinearLayout wrapping the cards: the one whose children
            // include the creatorRankingCard ComposeView.
            val layouts = doc.getElementsByTagName("LinearLayout")
            var container: Element? = null
            for (i in 0 until layouts.length) {
                val el = layouts.item(i) as? Element ?: continue
                val views = el.getElementsByTagName("androidx.compose.ui.platform.ComposeView")
                for (j in 0 until views.length) {
                    val v = views.item(j) as? Element ?: continue
                    if (v.getAndroid("id") == "@id/creatorRankingCard") container = el
                }
            }
            val box = container
                ?: throw PatchException("Pure: cards container not found")
            box.setAndroid("visibility", "gone")
            val spinner = findById(doc, "ProgressBar", "@id/busySpinner")
            spinner.setAndroid("indeterminate", "false")
            spinner.setAndroid("indeterminateOnly", "false")
        }
    }
}
