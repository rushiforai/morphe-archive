/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.chatpreview

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.call
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CHAT_PREVIEW = "$EXTENSION_PACKAGE/misc/ChatPreview;"
internal const val CHAT_PREVIEW_MENU = "$CHAT_PREVIEW->menu(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val PREVIEW_MENU = "Lorg/telegram/ui/ActionBar/ActionBarPopupWindow\$ActionBarPopupWindowLayout;"
internal const val ACTION_BAR_LAYOUT = "Lorg/telegram/ui/ActionBar/ActionBarLayout;"
internal const val PRESENT_WITH_MENU = "presentFragmentAsPreviewWithMenu"
private const val PREVIEW_DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private const val PREVIEW_OBJECT = "Ljava/lang/Object;"
private const val CONTEXT = "Landroid/content/Context;"
private const val TEXT = "Ljava/lang/CharSequence;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val VIEW = "Landroid/view/View;"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"

@Suppress("unused")
val chatPreviewButtonsPatch = bytecodePatch(
    name = "Chat preview buttons",
    description = "Adds Open chat and Close preview to the menu under a chat you press and hold, so the preview opens fully or " +
        "goes away with one tap. Starts off. Turn it on in HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveChatPreview()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertChatPreviewMenu(MutableMethod(ImmutableMethod.of(site.present)))
        writeChatPreviewStubs(site)
        insertChatPreviewMenu(site.present)
        enableStatus("chatPreviewButtons")
    }
}

/**
 * The screens' base class [base] and its [present], which every preview with a menu under it goes
 * through; the layout's [menuField] holding that menu and its [expand], which opens a preview fully;
 * and Telegram's menu item class [item] with its [text] setter.
 */
internal class ChatPreviewSite(
    val base: String,
    val present: MutableMethod,
    val parentLayout: String,
    val finish: String,
    val menuField: String,
    val expand: String,
    val item: String,
    val text: String,
)

/** The screen, the screen it previews and the menu go to the extension before anything else runs. */
internal fun insertChatPreviewMenu(target: MutableMethod) {
    val self = target.implementation!!.registerCount - 3
    target.addInstructionsWithLabels(0, "invoke-static/range {v$self .. v${self + 2}}, $CHAT_PREVIEW_MENU")
}

private fun BytecodePatchContext.writeChatPreviewStubs(site: ChatPreviewSite) {
    writeStub(CHAT_PREVIEW, "item", 6, """
        new-instance v0, ${site.item}
        const/4 v1, 0x0
        invoke-direct {v0, p0, v1, p3}, ${site.item}-><init>(${CONTEXT}ZZ)V
        const/4 v1, 0x0
        invoke-virtual {v0, p1, p2, v1}, ${site.text}
        return-object v0
    """)
    writeStub(CHAT_PREVIEW, "finish", 1, """
        check-cast p0, ${site.base}
        invoke-virtual {p0}, ${site.finish}
        return-void
    """)
    // The layout opens a preview fully only once its menu is gone, the way it does for a preview without one.
    writeStub(CHAT_PREVIEW, "expand", 5, """
        check-cast p0, ${site.base}
        invoke-virtual {p0}, ${site.parentLayout}
        move-result-object v0
        instance-of v1, v0, $ACTION_BAR_LAYOUT
        if-eqz v1, :done
        check-cast v0, $ACTION_BAR_LAYOUT
        iget-object v1, v0, ${site.menuField}
        if-eqz v1, :open
        invoke-virtual {v1}, $VIEW->getParent()Landroid/view/ViewParent;
        move-result-object v2
        instance-of v3, v2, $VIEW_GROUP
        if-eqz v3, :clear
        check-cast v2, $VIEW_GROUP
        invoke-virtual {v2, v1}, $VIEW_GROUP->removeView($VIEW)V
        :clear
        const/4 v1, 0x0
        iput-object v1, v0, ${site.menuField}
        :open
        invoke-virtual {v0}, ${site.expand}
        :done
        return-void
    """)
    writeStub(CHAT_PREVIEW, "openIcon", 1, "sget v0, $PREVIEW_DRAWABLES->msg_message:I\nreturn v0")
    writeStub(CHAT_PREVIEW, "closeIcon", 1, "sget v0, $PREVIEW_DRAWABLES->msg_cancel:I\nreturn v0")
}

/**
 * Pressing and holding a chat, a message thread or a profile's chat previews it through the screens'
 * base class's presentFragmentAsPreviewWithMenu, with a menu of Telegram's own items under it. The
 * base's movePreviewFragment opens a preview fully when it's dragged up far enough, but only when the
 * layout holds no menu, and that's where the layout's menu field and the call that opens it are read.
 */
internal fun BytecodePatchContext.resolveChatPreview(): ChatPreviewSite {
    requireStatusMethod("chatPreviewButtons")
    controlHook(CHAT_PREVIEW, "menu", listOf(PREVIEW_OBJECT, PREVIEW_OBJECT, PREVIEW_OBJECT), "V")
    controlHook(CHAT_PREVIEW, "item", listOf(CONTEXT, TEXT, "I", "Z"), VIEW)
    controlHook(CHAT_PREVIEW, "finish", listOf(PREVIEW_OBJECT), "V")
    controlHook(CHAT_PREVIEW, "expand", listOf(PREVIEW_OBJECT), "V")
    for (icon in listOf("openIcon", "closeIcon")) controlHook(CHAT_PREVIEW, icon, listOf(), "I")
    controlMembers(PREVIEW_DRAWABLES, "static msg_message:I", "static msg_cancel:I")

    val bases = mutableListOf<String>()
    val items = mutableListOf<MethodReference>()
    forEachClassMentioning(Mention.member(PRESENT_WITH_MENU)) { cls ->
        for (method in cls.methods) {
            val calls = method.controlBody().mapNotNull { it.call() }
            val presents = calls.filter { it.isPresentWithMenu() }
            if (presents.isEmpty()) continue
            bases += presents.map { it.parameterTypes[0].toString() }
            // The menu's items are built where the preview is asked for, from one class with a text and icon setter.
            val built = calls.filter { it.name == "<init>" && it.params() == listOf(CONTEXT, "Z", "Z") }.map { it.definingClass }.toSet()
            items += calls.filter { it.definingClass in built && it.params() == listOf(TEXT, "I", DRAWABLE) && it.returnType == "V" }
        }
    }
    val base = bases.distinct().controlSingle("the screens' base class")
    val baseClass = tgMutableClassDefBy(base)
    val present = baseClass.methods.filter {
        it.name == PRESENT_WITH_MENU && it.params() == listOf(base, PREVIEW_MENU) && it.returnType == "Z"
    }.controlSingle("the base's preview with a menu")
    controlShape(!AccessFlags.STATIC.isSet(present.accessFlags) && present.implementation!!.registerCount >= 3,
        "the base's preview with a menu changed")
    val finish = baseClass.methods.filter { it.name == "finishPreviewFragment" && it.params().isEmpty() && it.returnType == "V" }
        .controlSingle("the base's finishPreviewFragment").reference()
    val parentLayout = baseClass.methods.filter { it.name == "getParentLayout" && it.params().isEmpty() }
        .controlSingle("the base's getParentLayout").reference()
    val move = baseClass.methods.filter { it.name == "movePreviewFragment" && it.params() == listOf("F") && it.returnType == "V" }
        .controlSingle("the base's movePreviewFragment").controlBody()
    val menuField = move.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass == ACTION_BAR_LAYOUT && it.type == PREVIEW_MENU }
        .map { "${it.definingClass}->${it.name}:${it.type}" }.distinct().controlSingle("the layout's preview menu")
    val expand = move.mapNotNull { it.call() }
        .filter { it.definingClass == ACTION_BAR_LAYOUT && it.parameterTypes.isEmpty() && it.returnType == "V" }
        .map { "${it.definingClass}->${it.name}()V" }.distinct().controlSingle("the layout's call that opens a preview fully")
    val text = items.map { "${it.definingClass}->${it.name}(${TEXT}I$DRAWABLE)V" }.distinct().controlSingle("the preview menu's items")
    val item = text.substringBefore("->")

    for (reference in listOf(finish, parentLayout, menuField, expand, text, "$item-><init>(${CONTEXT}ZZ)V")) {
        requireReachable(reference, false)
    }
    return ChatPreviewSite(base, present, parentLayout, finish, menuField, expand, item, text)
}

private fun MethodReference.isPresentWithMenu() = name == PRESENT_WITH_MENU && returnType == "Z" &&
    parameterTypes.size == 2 && parameterTypes[1].toString() == PREVIEW_MENU

private fun MethodReference.params() = parameterTypes.map(CharSequence::toString)

private fun Method.params() = parameterTypes.map(CharSequence::toString)

private fun Method.reference() = "$definingClass->$name(${params().joinToString("")})$returnType"
