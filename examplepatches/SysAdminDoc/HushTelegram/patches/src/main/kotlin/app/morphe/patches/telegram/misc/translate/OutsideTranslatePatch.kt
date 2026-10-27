/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.messagemenu.messageMenuBuilder
import app.morphe.patches.telegram.misc.messagemenu.messageMenuBuilders
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val OUTSIDE_TRANSLATE = "$EXTENSION_PACKAGE/misc/OutsideTranslate;"
private const val SHOW = "$OUTSIDE_TRANSLATE->show(Ljava/lang/Object;)Z"
private const val FILL = "$OUTSIDE_TRANSLATE->fill(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V"
private const val CHOSEN = "$OUTSIDE_TRANSLATE->chosen(Ljava/lang/Object;I)V"
private const val HEADER_MENU = "$OUTSIDE_TRANSLATE->headerMenu(Ljava/lang/Object;)V"
private const val HEADER_CLICK = "$OUTSIDE_TRANSLATE->headerClick(Ljava/lang/Object;I)Z"
private const val UPDATE = "updateTranslation(Z)Z"
private const val TOGGLE = "$TRANSLATE_CONTROLLER->toggleTranslatingDialog(JZ)Z"
private const val DIALOG_TRANSLATABLE = "$TRANSLATE_CONTROLLER->isDialogTranslatable(J)Z"
private const val IS_TRANSLATABLE = "$TRANSLATE_CONTROLLER->isTranslatable($MESSAGE_OBJECT)Z"
/** Hide translate bar's stand-in for the chat screen's [BAR_HIDDEN] reads, with the same registers. */
internal const val BAR_HIDDEN_HOOK = "$TRANSLATE_BAR->hidden(Ljava/lang/Object;J)Z"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val TL_TEXT = "Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;"
private const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private const val ACCOUNT_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val LOCALES = "Lorg/telegram/messenger/LocaleController;"
private const val MESSAGES = "Lorg/telegram/messenger/MessagesController;"
private const val DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private const val LIST = "Ljava/util/ArrayList;"
private const val OBJECT = "Ljava/lang/Object;"
private const val NAME = "Translate with an outside service"

/** The extension's option numbers, which Telegram's own may never use. */
internal val TRANSLATE_NUMBERS = listOf(0x48545405, 0x48545406)

@Suppress("unused")
val outsideTranslatePatch = bytecodePatch(
    name = NAME,
    description = "Adds Translate here to a message's menu and Translate this chat to a chat's menu. Text you turn on goes " +
        "to Google's web translate, or to an AI service with your own key if you set one, one message at a time, and " +
        "nothing is sent before that. With an AI service, a How to translate box lets you say how you want it done. " +
        "Telegram's own translation and its Premium checks stay as they are. Starts off. " +
        "Turn it on in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveOutsideTranslate()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.insertShow(MutableMethod(ImmutableMethod.of(site.update)))
        site.insertFill(MutableMethod(ImmutableMethod.of(site.fill)))
        site.insertChosen(MutableMethod(ImmutableMethod.of(site.choose)))
        site.insertHeaderMenu(MutableMethod(ImmutableMethod.of(site.visibility)))
        site.insertHeaderClick(MutableMethod(ImmutableMethod.of(site.delegate)))
        writeOutsideTranslateStubs(site)
        site.insertShow(site.update)
        site.insertFill(site.fill)
        site.insertChosen(site.choose)
        site.insertHeaderMenu(site.visibility)
        site.insertHeaderClick(site.delegate)
        enableStatus("outsideTranslate")
    }
}

/**
 * Where Telegram works out what a message shows [update], builds a message's long-press menu
 * [fill] and handles its choice [choose], keeps the chat's own Translate item [visibility] and
 * handles the header's choices [delegate], with the fields and calls the stubs read.
 */
internal class OutsideTranslateSite(
    val chat: String, val update: MutableMethod, val fill: MutableMethod, val choose: MutableMethod, val visibility: MutableMethod,
    val delegate: MutableMethod, val selected: FieldReference, val translateItem: FieldReference, val headerItem: FieldReference,
    val lazyAdd: MethodReference, val setHeaderText: MethodReference, val dialogGetter: MethodReference, val outer: FieldReference,
    val accountGetter: String,
) {
    /** The extension answers first; a yes means the message shows its translation and Telegram's own check is skipped. */
    fun insertShow(target: MutableMethod) {
        val self = target.implementation!!.registerCount - 2
        target.addInstructionsWithLabels(0, """
            invoke-static/range {v$self .. v$self}, $SHOW
            move-result v0
            if-eqz v0, :hush_stock
            const/4 v0, 0x1
            return v0
        """, ExternalLabel("hush_stock", target.getInstruction(0)))
    }

    /** The extension adds its item as the builder returns; the branches to that return land on it too. */
    fun insertFill(target: MutableMethod) {
        val first = target.implementation!!.registerCount - 5
        target.addInstructionsAtControlFlowLabel(target.implementation!!.instructions.size - 1,
            "invoke-static/range {v$first .. v${first + 4}}, $FILL")
    }

    /** The extension sees the chosen number first; Telegram's switch passes the extension's number by. */
    fun insertChosen(target: MutableMethod) {
        val first = target.implementation!!.registerCount - 2
        target.addInstructions(0, "invoke-static/range {v$first .. v${first + 1}}, $CHOSEN")
    }

    /** The chat updates its Translate item when it's built, and the extension adds its own beside it. */
    fun insertHeaderMenu(target: MutableMethod) {
        val self = target.implementation!!.registerCount - 1
        target.addInstructions(0, "invoke-static/range {v$self .. v$self}, $HEADER_MENU")
    }

    /** The header's choices go to the extension first, and its own item stops there. */
    fun insertHeaderClick(target: MutableMethod) {
        val first = target.implementation!!.registerCount - 2
        target.addInstructionsWithLabels(0, """
            invoke-static/range {v$first .. v${first + 1}}, $HEADER_CLICK
            move-result v0
            if-eqz v0, :hush_stock
            return-void
        """, ExternalLabel("hush_stock", target.getInstruction(0)))
    }
}

/**
 * MessageObject.updateTranslation(force) decides between the original, Telegram's translation
 * and a summary, and is asked when a message is built and when the chat is told a translation
 * changed. The chat screen's menu builder and choice handler are found as the message menu family
 * finds them: by the Forward and Cancel sending labels, and by the switch that reads "hasInvoice".
 * The header's Translate item is built right before the chat updates it, and its choices go to a
 * delegate that calls Telegram's own toggle.
 */
internal fun BytecodePatchContext.resolveOutsideTranslate(): OutsideTranslateSite {
    requireStatusMethod("outsideTranslate")
    controlHook(OUTSIDE_TRANSLATE, "show", listOf(OBJECT), "Z")
    controlHook(OUTSIDE_TRANSLATE, "fill", listOf(OBJECT, OBJECT, LIST, LIST, LIST), "V")
    controlHook(OUTSIDE_TRANSLATE, "chosen", listOf(OBJECT, "I"), "V")
    controlHook(OUTSIDE_TRANSLATE, "headerMenu", listOf(OBJECT), "V")
    controlHook(OUTSIDE_TRANSLATE, "headerClick", listOf(OBJECT, "I"), "Z")
    controlHook(OUTSIDE_TRANSLATE, "selected", listOf(OBJECT), OBJECT)
    controlHook(OUTSIDE_TRANSLATE, "original", listOf(OBJECT), "Ljava/lang/String;")
    for (name in listOf("translatable", "isTranslated", "hasTranslateItem")) controlHook(OUTSIDE_TRANSLATE, name, listOf(OBJECT), "Z")
    for (name in listOf("messageType", "id")) controlHook(OUTSIDE_TRANSLATE, name, listOf(OBJECT), "I")
    for (name in listOf("dialog", "chatDialog", "owner", "chatOwner")) controlHook(OUTSIDE_TRANSLATE, name, listOf(OBJECT), "J")
    controlHook(OUTSIDE_TRANSLATE, "entities", listOf(OBJECT), LIST)
    controlHook(OUTSIDE_TRANSLATE, "applyTranslated", listOf(OBJECT, "Ljava/lang/String;", "Ljava/lang/String;"), "V")
    controlHook(OUTSIDE_TRANSLATE, "notifyTranslated", listOf(OBJECT), "V")
    controlHook(OUTSIDE_TRANSLATE, "notifyDialog", listOf("J"), "V")
    controlHook(OUTSIDE_TRANSLATE, "translateIcon", listOf(), "I")
    controlHook(OUTSIDE_TRANSLATE, "appLocale", listOf(), "Ljava/util/Locale;")
    controlHook(OUTSIDE_TRANSLATE, "dialogTarget", listOf(OBJECT), "Ljava/lang/String;")
    controlHook(OUTSIDE_TRANSLATE, "addHeaderItem", listOf(OBJECT, "I", "I", "Ljava/lang/String;"), OBJECT)
    controlHook(OUTSIDE_TRANSLATE, "setHeaderText", listOf(OBJECT, "Ljava/lang/String;"), "V")
    controlHook(OUTSIDE_TRANSLATE, "chatOf", listOf(OBJECT), OBJECT)

    // The message's own decision.
    val messageClass = mutableClassDefByOrNull(MESSAGE_OBJECT)
    controlShape(messageClass != null && AccessFlags.PUBLIC.isSet(messageClass.accessFlags), "MessageObject is missing")
    val update = messageClass!!.methods.filter { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == UPDATE }.controlSingle("updateTranslation")
    controlShape(AccessFlags.PUBLIC.isSet(update.accessFlags) && !AccessFlags.STATIC.isSet(update.accessFlags) &&
        update.implementation!!.registerCount >= 3 && update.controlBody().any { it.controlRef() == TRANSLATING },
        "updateTranslation no longer asks whether the dialog is being translated")
    controlShape(ControlFlow.of(update).normal.none { 0 in it }, "something jumps back to the start of updateTranslation")
    update.requireThisIntact(NAME, listOf(0))

    // The chat screen's menu builder.
    val (chat, chatClass, fill, built) = messageMenuBuilder(messageMenuBuilders(), NAME)

    // The selected message, as the builder reads it.
    val selected = built.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == chat && f.type == MESSAGE_OBJECT } == true }?.controlField()
    controlShape(selected != null, "the message menu builder no longer reads the selected message")
    val selectedField = chatClass.fields.filter { it.name == selected!!.name && it.type == selected.type }.controlSingle("${selected!!.name} field")
    controlShape(AccessFlags.PUBLIC.isSet(selectedField.accessFlags) && !AccessFlags.STATIC.isSet(selectedField.accessFlags), "${selected.name} is inaccessible")

    // The choice handler: a switch on the number that starts from the selected message.
    val choose = chatClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("I") &&
            m.controlBody().let { body -> body.any { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH } && body.any { it.controlString() == "hasInvoice" } }
    }.controlSingle("message menu choice")
    val chosen = choose.controlBody()
    controlShape(chosen.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.type == MESSAGE_OBJECT }?.controlField().toString() == selected.toString(),
        "the menu choice no longer starts from the selected message")
    val cases = chosen.filterIsInstance<SwitchPayload>().flatMap { it.switchElements.map { e -> e.key } }
    controlShape(cases.none { it in TRANSLATE_NUMBERS } && built.none { (it as? com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction)?.narrowLiteral in TRANSLATE_NUMBERS },
        "the message menu already uses the extension's numbers")
    controlShape(ControlFlow.of(choose).normal.none { 0 in it }, "something jumps back to the start of the menu choice")

    // The chat's own Translate item and the updater that follows its creation. Hide translate bar
    // may already have swapped the updater's hidden-bar read for its own, with the same registers.
    val asksHidden = { ref: String? -> ref == BAR_HIDDEN || ref == BAR_HIDDEN_HOOK }
    val visibility = chatClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.isEmpty() &&
            m.controlBody().map { it.controlRef() }.let { refs -> refs.any(asksHidden) && DIALOG_TRANSLATABLE in refs }
    }.controlSingle("translate item updater")
    val shown = visibility.controlBody()
    val translateItem = shown.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.definingClass == chat }?.controlField()
    controlShape(translateItem != null, "the translate item updater no longer reads the chat's translate item")
    val itemDeclared = chatClass.fields.filter { it.name == translateItem!!.name && it.type == translateItem.type }.controlSingle("${translateItem!!.name} field")
    controlShape(!AccessFlags.STATIC.isSet(itemDeclared.accessFlags), "${translateItem.name} is static")
    val askAt = shown.indexOfFirst { asksHidden(it.controlRef()) }
    val getter = shown.getOrNull(askAt - 2)?.call()
    controlShape(askAt >= 2 && shown[askAt - 1].opcode == Opcode.MOVE_RESULT_WIDE && shown[askAt - 2].opcode == Opcode.INVOKE_VIRTUAL &&
        getter != null && getter.parameterTypes.isEmpty() && getter.returnType == "J", "the chat's ID getter changed")
    val getterOwner = classDefByOrNull(getter!!.definingClass)
    controlShape(getterOwner != null && AccessFlags.PUBLIC.isSet(getterOwner.accessFlags) && getterOwner.methods.any {
        signature(it) == getter.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }, "the chat's ID getter is inaccessible")
    controlShape(visibility.implementation!!.registerCount >= 1 && ControlFlow.of(visibility).normal.none { 0 in it },
        "something jumps back to the start of the translate item updater")
    visibility.requireThisIntact(NAME, listOf(0))

    // The header menu the item was added to, read where the item is created.
    val creations = chatClass.methods.flatMap { m ->
        val body = m.controlBody()
        body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].controlField().toString() == translateItem.toString() }.map { m to it }
    }
    val (creator, put) = creations.controlSingle("the translate item's creation")
    val made = creator.controlBody()
    val lazyCall = made.getOrNull(put - 2)?.call()
    controlShape(put >= 3 && made[put - 1].opcode == Opcode.MOVE_RESULT_OBJECT && made[put - 2].opcode == Opcode.INVOKE_VIRTUAL && lazyCall != null &&
        lazyCall.returnType == translateItem.type && lazyCall.parameterTypes.map(CharSequence::toString).let {
            it.size == 3 && it[0] == "I" && it[1] == "I" && it[2] in setOf("Ljava/lang/String;", "Ljava/lang/CharSequence;")
        },
        "the translate item is no longer added with an ID, an icon and a label")
    val receiver = made[put - 2].namedRegisters().first()
    val sourceAt = (put - 3 downTo 0).firstOrNull { i -> made[i].opcode.setsRegister() && (made[i] as? OneRegisterInstruction)?.registerA == receiver }
    val header = sourceAt?.let { made[it].controlField() }
    controlShape(sourceAt != null && made[sourceAt].opcode == Opcode.IGET_OBJECT && header != null && header.definingClass == chat &&
        header.type == lazyCall!!.definingClass && (sourceAt + 1 until put - 2).none { branches(made[it].opcode) },
        "the header menu is no longer read right before the translate item is added")
    val headerDeclared = chatClass.fields.filter { it.name == header!!.name && it.type == header.type }.controlSingle("${header!!.name} field")
    controlShape(!AccessFlags.STATIC.isSet(headerDeclared.accessFlags), "${header.name} is static")
    val lazyOwner = classDefByOrNull(lazyCall!!.definingClass)
    controlShape(lazyOwner != null && AccessFlags.PUBLIC.isSet(lazyOwner.accessFlags) && lazyOwner.methods.any {
        signature(it) == lazyCall.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
    }, "the header menu's item adder is inaccessible")
    val itemOwner = classDefByOrNull(lazyCall.returnType)
    controlShape(itemOwner != null && AccessFlags.PUBLIC.isSet(itemOwner.accessFlags), "the header item's class is inaccessible")
    // R8 renames Item.setText, unlike the submenu view's TextView override. Bind the wrapper's
    // label setter by its argument and field write, then require it to update the visible text.
    val setHeaderText = itemOwner!!.methods.filter {
        it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") && it.returnType == "V" &&
            it.controlBody().any { instruction -> instruction.opcode == Opcode.IPUT_OBJECT && instruction.controlField()?.let { field ->
                field.definingClass == itemOwner.type && field.type == "Ljava/lang/CharSequence;"
            } == true }
    }.controlSingle("the header item's text setter in ${itemOwner.type}")
    controlShape(AccessFlags.PUBLIC.isSet(setHeaderText.accessFlags) && !AccessFlags.STATIC.isSet(setHeaderText.accessFlags) &&
        !AccessFlags.ABSTRACT.isSet(setHeaderText.accessFlags) && !AccessFlags.NATIVE.isSet(setHeaderText.accessFlags),
        "the header item's text setter is inaccessible")
    controlShape(setHeaderText.controlBody().any { instruction -> instruction.call()?.let { method ->
        method.name == "setText" && method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") && method.returnType == "V"
    } == true }, "the header item's text setter no longer updates its view")

    // The header's click delegate, the one that calls Telegram's own translate toggle.
    val delegates = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(TOGGLE)) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.type == TRANSLATE_CONTROLLER) return@forEachClassMentioning
        cls.methods.forEach { m ->
            if (!AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                m.controlBody().any { it.controlRef() == TOGGLE }) delegates += cls.type to signature(m)
        }
    }
    val (delegateType, delegateSignature) = delegates.controlSingle("header click delegate")
    val delegateClass = mutableClassDefBy(delegateType)
    controlShape(AccessFlags.PUBLIC.isSet(delegateClass.accessFlags), "the header click delegate is inaccessible")
    val delegate = delegateClass.methods.single { signature(it) == delegateSignature }
    controlShape(delegate.implementation!!.registerCount >= 3 && ControlFlow.of(delegate).normal.none { 0 in it },
        "something jumps back to the start of the header click delegate")
    delegate.requireThisIntact(NAME, listOf(0))
    delegate.requireParameterIntact(NAME, 0, listOf(0))
    val outer = delegateClass.fields.filter { it.type == chat && !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("the delegate's chat field")
    controlShape(AccessFlags.PUBLIC.isSet(outer.accessFlags), "the delegate's chat field is inaccessible")

    // The account the chat screen is in, from the public getter on Telegram's base screen class,
    // which R8 renames per build (s2 on the web build) but leaves this name on.
    val accountGetter = superclassChain(chat).mapNotNull { classDefByOrNull(it) }
        .flatMap { it.methods.asSequence() }
        .firstOrNull { it.name == "getCurrentAccount" && it.parameterTypes.isEmpty() && it.returnType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) }
    controlShape(accountGetter != null && AccessFlags.PUBLIC.isSet(accountGetter.accessFlags) &&
        classDefByOrNull(accountGetter.definingClass)?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } == true &&
        accountGetter.controlBody().any { it.opcode == Opcode.IGET && it.controlField()?.let { f -> f.name == "currentAccount" && f.type == "I" } == true },
        "the chat screen no longer says which account it's in")

    requireTranslateHostMembers()
    return OutsideTranslateSite(chat, update, fill, choose, visibility, delegate, selected, translateItem, header,
        lazyCall, setHeaderText, getter, outer, signature(accountGetter!!))
}

private fun branches(opcode: Opcode): Boolean {
    val name = opcode.name.lowercase()
    return name.startsWith("if") || name.startsWith("goto") || name.contains("switch")
}

/** Every Telegram member the stubs reach, with the access and kind each use needs. */
private fun BytecodePatchContext.requireTranslateHostMembers() {
    controlMembers(MESSAGE_OBJECT, "messageOwner:$TL_MESSAGE", "type:I", "currentAccount:I", "translated:Z", "summarized:Z",
        "getId()I", "getDialogId()J", "applyNewText(Ljava/lang/CharSequence;)V", "generateCaption()V")
    controlMembers(TL_MESSAGE, "message:Ljava/lang/String;", "entities:$LIST", "translatedText:$TL_TEXT", "translatedToLanguage:Ljava/lang/String;")
    controlMembers(TL_TEXT, "text:Ljava/lang/String;", "entities:$LIST")
    controlMembers(TRANSLATE_CONTROLLER, "static isTranslatable($MESSAGE_OBJECT)Z", "getDialogTranslateTo(J)Ljava/lang/String;")
    controlMembers(MESSAGES, "static getInstance(I)$MESSAGES", "getTranslateController()$TRANSLATE_CONTROLLER")
    controlMembers(NOTIFICATIONS, "static getInstance(I)$NOTIFICATIONS", "postNotificationName(I[Ljava/lang/Object;)V",
        "static messageTranslated:I", "static dialogTranslate:I")
    controlMembers(ACCOUNT_CONFIG, "static selectedAccount:I", "static getInstance(I)$ACCOUNT_CONFIG", "getClientUserId()J")
    controlMembers(LOCALES, "static getInstance()$LOCALES", "getCurrentLocale()Ljava/util/Locale;")
    controlMembers(DRAWABLES, "static msg_translate:I")
    // An empty list to start with, which the stub relies on for entities the text doesn't have.
    val text = classDefByOrNull(TL_TEXT)!!
    controlShape(text.methods.single { it.name == "<init>" && it.parameterTypes.isEmpty() }.controlBody().any { it.controlRef() == "Ljava/util/ArrayList;-><init>()V" },
        "$TL_TEXT no longer starts with an empty entity list")
}

/** The stubs' bodies, from the members [site] found. */
internal fun BytecodePatchContext.writeOutsideTranslateStubs(site: OutsideTranslateSite) {
    val chat = site.chat
    writeStub(OUTSIDE_TRANSLATE, "selected", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.selected}
        return-object v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "original", 2, """
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $MESSAGE_OBJECT->messageOwner:$TL_MESSAGE
        iget-object v0, v0, $TL_MESSAGE->message:Ljava/lang/String;
        return-object v0
    """)
    // Telegram's own check of what a message holds, with no Premium or availability in it.
    writeStub(OUTSIDE_TRANSLATE, "translatable", 2, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-static {p0}, $IS_TRANSLATABLE
        move-result v0
        return v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "messageType", 2, """
        check-cast p0, $MESSAGE_OBJECT
        iget v0, p0, $MESSAGE_OBJECT->type:I
        return v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "dialog", 3, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
        move-result-wide v0
        return-wide v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "id", 2, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $MESSAGE_OBJECT->getId()I
        move-result v0
        return v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "entities", 2, """
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $MESSAGE_OBJECT->messageOwner:$TL_MESSAGE
        iget-object v0, v0, $TL_MESSAGE->entities:$LIST
        return-object v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "isTranslated", 2, """
        check-cast p0, $MESSAGE_OBJECT
        iget-boolean v0, p0, $MESSAGE_OBJECT->translated:Z
        return v0
    """)
    // The translation goes in the fields Telegram's own layout reads, with the flag set while the text is laid out so its
    // entities are the translation's, which are none.
    writeStub(OUTSIDE_TRANSLATE, "applyTranslated", 5, """
        check-cast p0, $MESSAGE_OBJECT
        new-instance v0, $TL_TEXT
        invoke-direct {v0}, $TL_TEXT-><init>()V
        iput-object p1, v0, $TL_TEXT->text:Ljava/lang/String;
        iget-object v1, p0, $MESSAGE_OBJECT->messageOwner:$TL_MESSAGE
        iput-object v0, v1, $TL_MESSAGE->translatedText:$TL_TEXT
        iput-object p2, v1, $TL_MESSAGE->translatedToLanguage:Ljava/lang/String;
        const/4 v0, 0x1
        iput-boolean v0, p0, $MESSAGE_OBJECT->translated:Z
        const/4 v0, 0x0
        iput-boolean v0, p0, $MESSAGE_OBJECT->summarized:Z
        invoke-virtual {p0, p1}, $MESSAGE_OBJECT->applyNewText(Ljava/lang/CharSequence;)V
        invoke-virtual {p0}, $MESSAGE_OBJECT->generateCaption()V
        return-void
    """)
    // The chat listens for this and runs updateTranslation on the message it shows, then draws it again.
    writeStub(OUTSIDE_TRANSLATE, "notifyTranslated", 5, """
        check-cast p0, $MESSAGE_OBJECT
        iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
        invoke-static {v0}, $NOTIFICATIONS->getInstance(I)$NOTIFICATIONS
        move-result-object v0
        sget v1, $NOTIFICATIONS->messageTranslated:I
        const/4 v2, 0x1
        new-array v2, v2, [Ljava/lang/Object;
        const/4 v3, 0x0
        aput-object p0, v2, v3
        invoke-virtual {v0, v1, v2}, $NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V
        return-void
    """)
    writeStub(OUTSIDE_TRANSLATE, "notifyDialog", 7, """
        sget v0, $ACCOUNT_CONFIG->selectedAccount:I
        invoke-static {v0}, $NOTIFICATIONS->getInstance(I)$NOTIFICATIONS
        move-result-object v0
        sget v1, $NOTIFICATIONS->dialogTranslate:I
        invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v2
        const/4 v3, 0x1
        new-array v3, v3, [Ljava/lang/Object;
        const/4 v4, 0x0
        aput-object v2, v3, v4
        invoke-virtual {v0, v1, v3}, $NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V
        return-void
    """)
    writeStub(OUTSIDE_TRANSLATE, "translateIcon", 1, "sget v0, $DRAWABLES->msg_translate:I\nreturn v0")
    writeStub(OUTSIDE_TRANSLATE, "appLocale", 1, """
        invoke-static {}, $LOCALES->getInstance()$LOCALES
        move-result-object v0
        invoke-virtual {v0}, $LOCALES->getCurrentLocale()Ljava/util/Locale;
        move-result-object v0
        return-object v0
    """)
    // The language Telegram's own translate bar shows for the message's chat: its pick there, else the last one, else the app's.
    writeStub(OUTSIDE_TRANSLATE, "dialogTarget", 4, """
        check-cast p0, $MESSAGE_OBJECT
        iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
        invoke-static {v0}, $MESSAGES->getInstance(I)$MESSAGES
        move-result-object v0
        invoke-virtual {v0}, $MESSAGES->getTranslateController()$TRANSLATE_CONTROLLER
        move-result-object v0
        invoke-virtual {p0}, $MESSAGE_OBJECT->getDialogId()J
        move-result-wide v1
        invoke-virtual {v0, v1, v2}, $TRANSLATE_CONTROLLER->getDialogTranslateTo(J)Ljava/lang/String;
        move-result-object v0
        return-object v0
    """)
    // A null is no instance of anything, so a chat that built no item answers no.
    writeStub(OUTSIDE_TRANSLATE, "hasTranslateItem", 2, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.translateItem}
        instance-of v0, v0, ${site.translateItem.type}
        return v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "addHeaderItem", 5, """
        check-cast p0, $chat
        iget-object v0, p0, ${site.headerItem}
        invoke-virtual {v0, p1, p2, p3}, ${site.lazyAdd}
        move-result-object v0
        return-object v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "setHeaderText", 2, """
        check-cast p0, ${site.lazyAdd.returnType}
        invoke-virtual {p0, p1}, ${site.setHeaderText}
        return-void
    """)
    writeStub(OUTSIDE_TRANSLATE, "chatOf", 2, """
        check-cast p0, ${site.outer.definingClass}
        iget-object v0, p0, ${site.outer}
        return-object v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "chatDialog", 3, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${site.dialogGetter}
        move-result-wide v0
        return-wide v0
    """)
    // Each choice belongs to the account's user ID, which a slot signed into later doesn't share.
    writeStub(OUTSIDE_TRANSLATE, "owner", 3, """
        check-cast p0, $MESSAGE_OBJECT
        iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
        invoke-static {v0}, $ACCOUNT_CONFIG->getInstance(I)$ACCOUNT_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $ACCOUNT_CONFIG->getClientUserId()J
        move-result-wide v0
        return-wide v0
    """)
    writeStub(OUTSIDE_TRANSLATE, "chatOwner", 3, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${site.accountGetter}
        move-result v0
        invoke-static {v0}, $ACCOUNT_CONFIG->getInstance(I)$ACCOUNT_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $ACCOUNT_CONFIG->getClientUserId()J
        move-result-wide v0
        return-wide v0
    """)
}

private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
