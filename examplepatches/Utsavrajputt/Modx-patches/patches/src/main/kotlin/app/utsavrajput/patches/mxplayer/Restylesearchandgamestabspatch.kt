package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.patch.resourcePatch
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER

/**
 * Renames the repurposed Search->Tools and Games->About native tab labels.
 *
 * TabType.java (Lq7h;) stores a fixed R.string id per tab (confirmed via
 * direct resources.arsc parse, since no public.xml was available in this
 * build): search label -> R.string.search_bn ("Search"), games label ->
 * R.string.tab_game ("Games"). HomeTabHelper.java (Ley7;) falls back to
 * this string only when no server-provided JSON override exists for that
 * tab, which is the case here - so editing the string resource's text
 * value directly (via document() DOM edit on res/values/strings.xml) is
 * enough, no bytecode change needed for the label.
 *
 * Icon swap is handled separately in RestyleSearchAndGamesTabIconsPatch.kt
 * (bytecodePatch) — an earlier attempt to swap the icon via a resource
 * file replace here didn't reliably resolve through this build's resource
 * encoder (new @drawable reference wasn't picked up), so that logic was
 * dropped from this file in favor of a direct bytecode call into
 * IconAssets.
 */
@Suppress("unused")
val restyleSearchAndGamesTabsPatch = resourcePatch(
    name = "Restyle Search/Games tab labels to Tools/About",
    description = "Renames the native Search/Games tab labels to Tools/About.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)

    execute {
        document("res/values/strings.xml").use { document ->
            val stringNodes = document.getElementsByTagName("string")
            for (i in 0 until stringNodes.length) {
                val node = stringNodes.item(i)
                val nameAttr = node.attributes.getNamedItem("name")?.nodeValue
                if (nameAttr == "search_bn") {
                    node.textContent = "Tools"
                } else if (nameAttr == "tab_game") {
                    node.textContent = "About"
                }
            }
        }
    }
}