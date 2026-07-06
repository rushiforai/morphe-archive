package app.pepper.patches.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.w3c.dom.Document
import org.w3c.dom.Element


private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val APP_NS = "http://schemas.android.com/apk/res-auto"

@Suppress("unused")
val compactDealCardsResourcePatch = resourcePatch(
    name = "Compact deal cards",
    description = "Shrinks Pepper deal-list cards and their loading skeletons " +
        "with targeted XML resource edits.",
    default = false,
) {
    compatibleWith(*PEPPER_FAMILY)

    execute {
        // AAPT2 strict-mode recompile (triggered when this resource patch is active)
        // strips the bitmap drawable reference from `smiley_placeholder_height_*dp.xml`,
        // leaving `<inset android:drawable="@null">` which crashes at runtime when the
        // deal-detail screen tries to inflate a smiley placeholder. Replace those files
        // with self-contained `<inset><shape/></inset>` so there is no external drawable
        // reference for AAPT2 to strip.
        normalizeSmileyInsets(get("res/drawable"))

        get("res/layout/item_deal_thread_card.xml").patchXml {
            compactDealCard()
        }
        get("res/layout/item_deal_voucher_placeholder_card.xml").patchXml {
            compactDealPlaceholder()
        }
        get("res/layout/item_sponsored_thread_placeholder_card.xml").patchXml {
            compactSponsoredPlaceholder()
        }
    }
}

private val smileyHeightRegex = Regex("""smiley_placeholder_height_(\d+)dp\.xml""")

private fun normalizeSmileyInsets(drawableDir: File) {
    val files = drawableDir.listFiles() ?: return
    files.forEach { file ->
        val match = smileyHeightRegex.matchEntire(file.name) ?: return@forEach
        val heightDp = match.groupValues[1]
        file.writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<inset xmlns:android="http://schemas.android.com/apk/res/android"
    android:insetLeft="@dimen/smiley_inset_left"
    android:insetRight="@dimen/smiley_inset_right"
    android:insetBottom="@dimen/smiley_inset_bottom">
    <shape android:shape="rectangle">
        <size android:width="0dp" android:height="${heightDp}dp" />
        <solid android:color="@android:color/transparent" />
    </shape>
</inset>
""",
        )
    }
}

private fun XmlEditor.compactDealCard() {
    update("top_barrier") {
        setApp("barrierMargin", "@dimen/spacing_extra_small")
    }

    update("deal_thread_button_vote_negative") {
        size("32.0dip", "32.0dip")
    }
    update("deal_thread_button_vote_positive") {
        size("32.0dip", "32.0dip")
    }
    update("deal_thread_text_temperature") {
        setAndroid("textAppearance", "?textAppearanceCaptionBold")
        setAndroid("minHeight", "32.0dip")
        setApp("autoSizePresetSizes", "@array/auto_size_preset_sizes_text_appearance_caption")
    }

    update("thread_image") {
        size("92.0dip", "92.0dip")
        setAndroid("layout_marginTop", "@dimen/spacing_extra_small")
        setAndroid("layout_marginBottom", "@dimen/spacing_small")
    }

    update("thread_text_title") {
        // INTERMEDIATE: textAppearance — oryginalna (Body2Medium)
        setAndroid("layout_marginTop", "@dimen/spacing_extra_small")
        setAndroid("maxLines", "2")
        setApp("layout_constraintVertical_bias", "0.25")
    }

    update("thread_text_username") {
        setAndroid("layout_marginBottom", "@dimen/spacing_extra_small")
    }

    update("thread_button_comment_count") {
        size("32.0dip", "32.0dip")
        setApp("layout_constraintStart_toStartOf", "@id/guideline_start")
    }
    update("comment_count") {
        setAndroid("gravity", "center_vertical")
        setAndroid("layout_height", "32.0dip")
        setAndroid("maxWidth", "42.0dip")
        setAndroid("minEms", "1")
        removeAndroid("minHeight")
        removeAndroid("layout_marginStart")
        removeApp("layout_constraintEnd_toStartOf")
        removeApp("layout_constraintHorizontal_bias")
        removeApp("layout_constraintStart_toStartOf")
        setApp("layout_constraintBottom_toBottomOf", "@id/thread_button_comment_count")
        setApp("layout_constraintStart_toEndOf", "@id/thread_button_comment_count")
        setApp("layout_constraintTop_toTopOf", "@id/thread_button_comment_count")
    }

    listOf(
        "deal_thread_button_get_deal",
        "deal_thread_button_get_deal_outlined",
        "deal_thread_button_get_deal_small",
    ).forEach { id ->
        update(id) {
            setAndroid("minHeight", "40.0dip")
            removeApp("layout_constraintBaseline_toBaselineOf")
        }
    }
    update("deal_thread_code_textview") {
        removeApp("layout_constraintBaseline_toBaselineOf")
    }
}

private fun XmlEditor.compactDealPlaceholder() {
    compactPlaceholderBody()
}

private fun XmlEditor.compactSponsoredPlaceholder() {
    update("thread_header_text") {
        setAndroid("minHeight", "24.0dip")
    }
    compactPlaceholderBody()
}

private fun XmlEditor.compactPlaceholderBody() {
    update("deal_thread_placeholder_temperature_box") {
        size("92.0dip", "32.0dip")
        setAndroid("layout_marginTop", "@dimen/spacing_extra_small")
    }
    update("deal_thread_placeholder_image") {
        size("92.0dip", "92.0dip")
        setAndroid("layout_marginTop", "@dimen/spacing_extra_small")
    }
    update("deal_thread_placeholder_date") {
        setAndroid("layout_width", "80.0dip")
    }
    update("deal_thread_placeholder_text_title") {
        setAndroid("layout_height", "24.0dip")
        setAndroid("layout_marginTop", "@dimen/spacing_extra_small")
    }
    update("deal_thread_placeholder_text_merchant") {
        setAndroid("layout_width", "80.0dip")
    }
    update("deal_thread_placeholder_text_username") {
        setAndroid("layout_width", "80.0dip")
    }
    update("deal_thread_placeholder_button_get_deal") {
        // Real Material3 Button has insetTop/insetBottom=6dp by default — visible
        // orange area is 40-12=28dp. Skeleton must match the visible area, not
        // the View bounds, so the gray bar maps onto the real button's coloured
        // surface (not the invisible touch-target inset).
        setAndroid("layout_height", "28.0dip")
        setAndroid("layout_marginTop", "10.0dip")
        setAndroid("layout_marginBottom", "10.0dip")
    }
    update("deal_thread_placeholder_comment_and_share") {
        size("48.0dip", "32.0dip")
        setAndroid("layout_marginTop", "@dimen/spacing_extra_small")
        setAndroid("layout_marginBottom", "@dimen/spacing_extra_small")
    }
}

private fun File.patchXml(block: XmlEditor.() -> Unit) {
    val document = DocumentBuilderFactory.newInstance()
        .apply { isNamespaceAware = true }
        .newDocumentBuilder()
        .parse(this)

    XmlEditor(document).block()

    TransformerFactory.newInstance()
        .newTransformer()
        .apply {
            setOutputProperty(OutputKeys.ENCODING, "utf-8")
            setOutputProperty(OutputKeys.INDENT, "yes")
        }
        .transform(DOMSource(document), StreamResult(this))
}

private class XmlEditor(private val document: Document) {
    fun update(id: String, block: Element.() -> Unit) {
        byId(id).block()
    }

    private fun byId(id: String): Element {
        val expected = "@id/$id"
        val elements = document.getElementsByTagName("*")
        for (index in 0 until elements.length) {
            val element = elements.item(index) as? Element ?: continue
            if (element.getAttributeNS(ANDROID_NS, "id") == expected) return element
        }
        throw PatchException("Element with android:id=\"$expected\" not found")
    }
}

private fun Element.size(width: String, height: String) {
    setAndroid("layout_width", width)
    setAndroid("layout_height", height)
}

private fun Element.setAndroid(name: String, value: String) =
    setAttributeNS(ANDROID_NS, "android:$name", value)

private fun Element.removeAndroid(name: String) =
    removeAttributeNS(ANDROID_NS, name)

private fun Element.setApp(name: String, value: String) =
    setAttributeNS(APP_NS, "app:$name", value)

private fun Element.removeApp(name: String) =
    removeAttributeNS(APP_NS, name)
