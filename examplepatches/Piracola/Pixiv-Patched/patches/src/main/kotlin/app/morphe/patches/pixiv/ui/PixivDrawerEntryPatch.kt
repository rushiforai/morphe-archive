package app.morphe.patches.pixiv.ui

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

/**
 * Puts the Pixiv-Patched page in the app's home drawer.
 *
 * The settings screen is a single hand-written Compose screen, so nothing can be appended to its
 * list, while the drawer is a Material NavigationView whose menu can be extended at runtime.
 */
val pixivDrawerEntryPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv-Patched Drawer Entry",
    description = "Adds a Pixiv-Patched item to Pixiv's home drawer that opens a page with the state of every patch, the AI work settings and the browsing history kept on this device.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)

    extendWith("extensions/pixiv.mpe")

    execute {
        val navigationView = mutableClassDefBy("Lcom/google/android/material/navigation/NavigationView;")
        val setListener = navigationView.methods.firstOrNull {
            it.name == "setNavigationItemSelectedListener"
        } ?: throw IllegalStateException("NavigationView.setNavigationItemSelectedListener not found")

        setListener.addInstructions(
            0,
            "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/pixiv/ui/DrawerEntry;->install(Ljava/lang/Object;)V"
        )

        val presenter = mutableClassDefBy("Lg46;")
        val onItemClick = presenter.methods.firstOrNull {
            it.name == "o" && it.parameterTypes.size == 2 &&
                it.parameterTypes[1].toString() == "Landroid/view/MenuItem;"
        } ?: throw IllegalStateException("NavigationView presenter item click not found")

        onItemClick.addInstructions(
            0,
            "invoke-static/range {p2 .. p2}, Lapp/morphe/extension/pixiv/ui/DrawerEntry;->onItemClicked(Landroid/view/MenuItem;)V"
        )
    }
}
