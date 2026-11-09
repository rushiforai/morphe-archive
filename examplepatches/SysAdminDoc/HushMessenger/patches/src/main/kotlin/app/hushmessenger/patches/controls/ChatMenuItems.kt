package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Hide chat menu items (#153): items picked in HushMessenger settings stay out of the menu you get when you press and
 * hold a chat in the chat list. The hook is the menu's row list, the same method Hide chosen chats adds its row to.
 */
internal const val CHAT_MENU_ITEMS = "chat_menu_items"
internal const val CHAT_MENU_ITEMS_CALL = "Lapp/hushmessenger/extension/ChatMenuItems;->rows(Ljava/util/ArrayList;Ljava/lang/String;)V"

private fun chatMenuChanged(): Nothing =
    throw PatchException("Messenger controls: the chat list menu's row list no longer matches the tested build")

/** The menu's row list out of what findHiddenChats found, so the menu class is looked for once. */
internal fun chatMenuRows(hiddenChats: Map<String, List<Method>>): List<Method> = hiddenChats[HIDDEN_CHAT_ROW].orEmpty()

internal fun MutableMethod.validateChatMenuItems() {
    hiddenRowSite() ?: chatMenuChanged()
}

/**
 * What the extension needs to build a throwaway row and learn which of the row's fields hold its name and its title:
 * the builder's factory, title setter, description field and build call, "|"-joined.
 */
internal fun HiddenRowBuilder.menuItemsRoute(): String = listOf(factory, title, description, build).joinToString("|")

/**
 * Just before the menu hands its list back, the extension takes out the items picked in settings. The register that's
 * free there carries the route. A branch onto the return lands on the route's load, so the padding loop's exit still
 * goes through the extension. With Hide chosen chats on the same list, either edit can come first.
 */
internal fun MutableMethod.injectChatMenuItems() {
    val site = hiddenRowSite() ?: chatMenuChanged()
    replaceInstruction(site.at, "const-string v${site.menu}, \"${site.builder.menuItemsRoute()}\"")
    addInstructions(site.at + 1, "invoke-static {v${site.rows}, v${site.menu}}, $CHAT_MENU_ITEMS_CALL\nreturn-object v${site.rows}")
}
