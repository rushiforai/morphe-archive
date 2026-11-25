package dev.jason.gboardpatches.patches.gboard.features.ioslayout

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.elements
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Element

/*
 * How Gboard builds the Japanese 12-key keyboards:
 *
 * - The kana (prime), 12-key alphabet and number (tri_state_digit) keyboards are declared by the
 *   keyboard definitions below and all use the same body layout. That layout is made of three
 *   columns: the left function keys, the 3x4 character grid and the right function keys.
 * - A layout only holds empty SoftKeyViews. <key_mapping> elements assign a softkey to each view id,
 *   optionally per state such as COMPOSING. A view without a softkey keeps the visibility of the
 *   layout, and a mapping to a view id that is not in the layout is ignored.
 *
 * The patch replaces the two side columns, adds the mode keys and their mappings, and includes them
 * in the three keyboard definitions.
 *
 * iOS marks the mode key of the keyboard that is shown. The look of a key comes from the style of its
 * SoftKeyView in the layout, not from the softkey, and the three keyboards share one layout. So the
 * patch gives each keyboard its own copy of the body layout, down to the left column, and makes the
 * mode key of that keyboard pill-shaped there, like the globe key. The shape and colours are the ones
 * of the theme. An option of the patch turns this off.
 *
 * Ported from twelvehouse/gboard-ios-style-jp-en-morphe-patches (GPLv3).
 */

/** Left function column: undo, cursor left, symbol/emoji, kana/alphabet switch. */
private const val LAYOUT_LEFT_COLUMN = 0x7f0e0241L

/** Right function column: backspace, cursor right, space, enter. */
private const val LAYOUT_RIGHT_COLUMN = 0x7f0e0244L

/** Body of the three keyboards on a phone. It includes the three columns, which include the left one. */
private const val LAYOUT_BODY = 0x7f0e023bL

/** SoftKeyView styles of the left column: a dark function key, and the same key pill-shaped. */
private const val STYLE_FUNCTION_KEY = 0x7f150710L
private const val STYLE_PILL_FUNCTION_KEY = 0x7f150711L

/** The mode keys, as they are named in the placeholders of left_column.xml and in the layout names. */
private val MODES = listOf("digit", "alphabet", "kana")

/** Keyboard definitions of the kana, 12-key alphabet and number keyboards, with the mode of each. */
private val KEYBOARD_DEFINITIONS = mapOf(
    0x7f1706e7L to "kana",
    0x7f1706e6L to "alphabet",
    0x7f1706eeL to "digit",
)

/** Last include of each keyboard body. The new softkeys and mappings go after it, so they win. */
private const val XML_LAST_BODY_INCLUDE = 0x7f170c01L

/** Key mappings that put the globe key into the 小゛゜ slot when several languages are enabled. */
private val XML_LANGUAGE_SWITCH_MAPPINGS = listOf(0x7f170a57L, 0x7f170a5eL)

private const val BUNDLED_DIR = "flicklayout"
private const val SOFTKEYS_XML = "ios_flick_softkeys"
private const val KEY_MAPPING_XML = "ios_flick_key_mapping"

private val NEW_IDS = listOf(
    "ios_flick_key_pos_digit",
    "ios_flick_key_pos_alphabet",
    "ios_flick_key_pos_kana",
    "ios_flick_key_pos_globe",
    "ios_flick_key_digit",
    "ios_flick_key_alphabet",
    "ios_flick_key_kana",
)

internal val gboardIosFlickLayoutPatch = resourcePatch(
    description = "Changes the Japanese 12-key keyboard to the layout of iOS with \"flick only\" enabled: " +
        "123, ABC and あいう keys and the globe key on the left, and backspace, space and a two-row " +
        "enter key on the right.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardKeyboardDefCacheRefreshPatch)

    val markActiveModeKey by booleanOption(
        key = "markActiveModeKey",
        default = true,
        title = "Mark the active mode key",
        description = "Makes the 123, ABC or あいう key of the keyboard that is shown pill-shaped, " +
            "like the globe key. Turn it off to keep all three keys rectangular.",
    )

    execute {
        val ids = GboardLayoutResourceIds.read()

        addIosFlickIds()
        // The stock left column is also used by layouts other than the phone body (the tablet one,
        // for example). There, no mode key is marked.
        writeBundledLayout(ids, BUNDLED_DIR, "left_column.xml", ids.path(LAYOUT_LEFT_COLUMN)) { text ->
            leftColumn(text, null)
        }
        writeBundledLayout(ids, BUNDLED_DIR, "right_column.xml", ids.path(LAYOUT_RIGHT_COLUMN))
        writeBundledLayout(ids, BUNDLED_DIR, "$SOFTKEYS_XML.xml", "res/xml/$SOFTKEYS_XML.xml")
        writeBundledLayout(ids, BUNDLED_DIR, "$KEY_MAPPING_XML.xml", "res/xml/$KEY_MAPPING_XML.xml")
        // A null value means the option was not set, so it counts as the default, which is on.
        val markActive = markActiveModeKey != false
        if (markActive) MODES.forEach { mode ->
            writeBundledLayout(ids, BUNDLED_DIR, "body.xml", "res/layout/ios_flick_body_$mode.xml") { text ->
                text.replace("%MODE%", mode)
            }
            writeBundledLayout(ids, BUNDLED_DIR, "columns.xml", "res/layout/ios_flick_columns_$mode.xml") { text ->
                text.replace("%MODE%", mode)
            }
            writeBundledLayout(ids, BUNDLED_DIR, "left_column.xml", "res/layout/ios_flick_left_column_$mode.xml") { text ->
                leftColumn(text, mode)
            }
        }

        val stockBody = ids.ref(LAYOUT_BODY)
        val lastInclude = ids.ref(XML_LAST_BODY_INCLUDE)
        KEYBOARD_DEFINITIONS.forEach { (definition, mode) ->
            document(ids.path(definition)).use { doc ->
                if (markActive) {
                    val bodies = doc.getElementsByTagName("view").elements()
                        .filter { view -> view.getAttribute("layout") == stockBody }
                        .toList()
                    check(bodies.isNotEmpty()) { "No body layout found in ${ids.path(definition)}" }
                    bodies.forEach { view -> view.setAttribute("layout", "@layout/ios_flick_body_$mode") }
                }

                val anchors = doc.getElementsByTagName("include").elements()
                    .filter { include -> include.getAttribute("href") == lastInclude }
                    .toList()
                check(anchors.isNotEmpty()) { "No body include found in ${ids.path(definition)}" }
                anchors.forEach { anchor ->
                    val parent = anchor.parentNode ?: error("Detached include in ${ids.path(definition)}")
                    val softkeys = doc.createElement("softkeys")
                    softkeys.setAttribute("href", "@xml/$SOFTKEYS_XML")
                    val mapping = doc.createElement("include")
                    mapping.setAttribute("href", "@xml/$KEY_MAPPING_XML")
                    parent.insertBefore(softkeys, anchor.nextSibling)
                    parent.insertBefore(mapping, anchor.nextSibling)
                }
            }
        }

        // The globe key now has its own slot in the left column.
        XML_LANGUAGE_SWITCH_MAPPINGS.forEach { mapping ->
            document(ids.path(mapping)).use { doc ->
                val switchMappings = doc.getElementsByTagName("key_mapping").elements()
                    .filter { keyMapping ->
                        keyMapping.getAttribute("state") == "SHOW_LANGUAGE_SWITCH_KEY"
                    }
                    .toList()
                switchMappings.forEach { keyMapping -> keyMapping.parentNode?.removeChild(keyMapping) }
            }
        }
    }
}

/** Fills in the styles of the mode keys in left_column.xml. The key of [activeMode] is pill-shaped. */
private fun leftColumn(template: String, activeMode: String?): String = MODES.fold(template) { text, mode ->
    val style = if (mode == activeMode) STYLE_PILL_FUNCTION_KEY else STYLE_FUNCTION_KEY
    text.replace("%STYLE_${mode.uppercase()}%", "{{0x${style.toString(16)}}}")
}

private fun addIosFlickIds() {
    document("res/values/ids.xml").use { doc ->
        val root: Element = doc.documentElement ?: error("No root element in res/values/ids.xml")
        NEW_IDS.forEach { name ->
            val item = doc.createElement("item")
            item.setAttribute("type", "id")
            item.setAttribute("name", name)
            root.appendChild(item)
        }
    }
}
