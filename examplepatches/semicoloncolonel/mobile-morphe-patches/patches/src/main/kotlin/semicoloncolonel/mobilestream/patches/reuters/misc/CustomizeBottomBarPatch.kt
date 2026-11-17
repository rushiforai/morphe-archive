package semicoloncolonel.mobilestream.patches.reuters.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.reuters.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// Reuters 7.51.0. RootBottomTabs builds the bottom bar as a React Navigation
// tab navigator whose children array holds Home (Today), Markets, MyNews,
// Media, and Menu, each stored with PutOwnByIndex r4, <element>, <index>. A
// hidden tab's store becomes LoadConstNull <element> twice, the same length,
// so its slot stays empty and React Navigation leaves the tab out. The element
// register is reloaded right after each store. Home and Menu always stay.

private const val VERSION = 96

private fun bytes(vararg values: Int) = values.map { it.toByte() }.toByteArray()

@Suppress("unused")
val customizeBottomBarPatch = rawResourcePatch(
    name = "Customize bottom bar",
    description = "Hides the bottom tabs you choose in the options. Home and Menu always stay.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    // Tab index in the children array, and the register that holds its element.
    val tabs = listOf(
        Triple(1 to 6, "hideMarkets", "Hide Markets"),
        Triple(2 to 5, "hideMyNews", "Hide My News"),
        Triple(3 to 5, "hideMedia", "Hide Media"),
    ).map { (slot, key, title) ->
        slot to booleanOption(
            key = key,
            default = false,
            title = title,
            description = "Removes this tab from the bottom bar.",
        )
    }

    execute {
        val chosen = tabs.filter { (_, option) -> option.value == true }.map { it.first }
        if (chosen.isEmpty()) return@execute
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        chosen.forEach { (index, register) ->
            bundle.replaceInstructions(
                "RootBottomTabs", listOf("Markets", "MyNews"), VERSION,
                bytes(68, 4, register, index),
                bytes(119, register, 119, register),
            )
        }
        file.writeBytes(bundle.toByteArray())
    }
}
