package app.gboardios.patches.qwerty

import app.gboardios.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.gboardios.patches.shared.ResourceIds
import app.gboardios.patches.shared.writeBundled
import app.gboardios.patches.defcache.keyboardDefCacheRefreshPatch
import app.gboardios.patches.signature.signatureCheckBypassPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

/*
 * Letter keyboards: their bottom row is layout 0x7f0e04ef, shared by the QWERTY-like layouts of
 * all languages. The patch replaces it so that the globe key sits at the left edge, where the
 * globe key of the Japanese 12-key keyboards is, and the row has iOS's proportions (globe, ?123,
 * space and enter at 1 : 1 : 4 : 2, extra keys such as "/" and "." only narrowing the space key).
 *
 * Symbol keyboard (0x7f170878, shared by all languages): its body layout has fixed key positions
 * (D01-D10, C01-C10, B01-B07, A02, A03, A08, ...) and the softkeys are assigned to them by
 * <key_mapping>, the second page being the SUB_CATEGORY_1 state. For English only, the patch
 * selects a body layout with five wide keys in the third row and [globe/emoji] [ABC] [space]
 * [enter] at the bottom, and maps the keys in the order of the iOS "123" and "#+=" pages.
 *
 * Gboard caches parsed keyboard definitions in its data, so an update of an already installed
 * patched app only shows the change after its data is cleared.
 */

/** Bottom row of the letter keyboards. */
private const val LAYOUT_LETTERS_BOTTOM_ROW = 0x7f0e04efL

/** Includes choosing the body layout of the symbol keyboard. */
private const val XML_SYMBOL_BODY_SELECTION = 0x7f17087eL

/** The symbol keyboard definition. */
private const val XML_SYMBOL_KEYBOARD = 0x7f170878L

/** Default phone body layout of the symbol keyboard. */
private const val LAYOUT_SYMBOL_BODY = 0x7f0e0516L

private const val ENGLISH = "en|en-US|en-GB|en-CA|en-AU|en-IN|en-PH|en-ZA|en-NG|en-KE|en-IE|en-NZ|en-SG"

private const val SYMBOL_BODY_LAYOUT = "ios_symbols_body"
private const val SYMBOL_KEY_MAPPING_XML = "ios_symbols_key_mapping"

@Suppress("unused")
val iosQwertyLayoutPatch = patch(
    name = "iOS QWERTY layout",
    description = "Puts the globe key of the letter keyboards at the bottom left, where it is on the " +
        "Japanese 12-key keyboards, and lays out the English symbol keyboard like the iOS \"123\" and " +
        "\"#+=\" pages. Gboard's number row setting keeps working.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(signatureCheckBypassPatch, keyboardDefCacheRefreshPatch)

    execute {
        val ids = ResourceIds.read()

        writeBundled(ids, "qwerty", "letters_bottom_row.xml", ids.path(LAYOUT_LETTERS_BOTTOM_ROW))
        writeBundled(ids, "qwerty", "$SYMBOL_BODY_LAYOUT.xml", "res/layout/$SYMBOL_BODY_LAYOUT.xml")
        writeBundled(ids, "qwerty", "$SYMBOL_KEY_MAPPING_XML.xml", "res/xml/$SYMBOL_KEY_MAPPING_XML.xml")

        // Use the new symbol body layout for English on phones in normal mode: the stock layout is
        // the last <else> of the selection, so an <else_if> goes right before it.
        resourceXml(ids.path(XML_SYMBOL_BODY_SELECTION)).use { xml ->
            val stockLayout = ids.ref(LAYOUT_SYMBOL_BODY)
            val stockElse = xml.elements("view")
                .single {
                    it.attribute("layout") == stockLayout &&
                        it.parent?.tag == "else" &&
                        it.parent?.parent?.tag == xml.root.tag
                }
                .parent!!
            xml.root.insertChild(stockElse.index, "else_if") {
                setAttribute("language", ENGLISH)
                appendChild("view") {
                    setAttribute("layout", "@layout/$SYMBOL_BODY_LAYOUT")
                    setAttribute("type", "body")
                }
            }
        }

        // The mappings go last in the body view so that they override the stock ones.
        resourceXml(ids.path(XML_SYMBOL_KEYBOARD)).use { xml ->
            val body = xml.elements("view").single { it.attribute("type") == "body" && it.children("include").isNotEmpty() }
            body.appendChild("if") {
                setAttribute("language", ENGLISH)
                appendChild("include") { setAttribute("href", "@xml/$SYMBOL_KEY_MAPPING_XML") }
            }
        }
    }
}
