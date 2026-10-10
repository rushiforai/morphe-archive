/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireParameterIntact
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.methodsWithString
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.literalReads
import app.morphe.util.readsAfter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Long-press download"

/** The circular menu a long-press opens. Layouts inflate it by name, so the name is kept. */
internal const val CONTEXT_MENU = "Lcom/pinterest/ui/menu/ContextMenuView;"

/** One button of that menu, kept by name for the same reason. */
internal const val CONTEXT_MENU_ITEM = "Lcom/pinterest/ui/menu/ContextMenuItemView;"

internal const val LONG_PRESS = "$EXTENSION_PACKAGE/actions/LongPressDownload;"
internal const val LONG_PRESS_HOOK = "$LONG_PRESS->show(Ljava/lang/Object;Ljava/lang/Object;)V"

/** What the menu button model's toString starts with, the one class that writes it. */
internal const val MENU_BUTTON_MODEL = "ContextMenuItemIcon(iconResId="

/** The color Pinterest's button styler reads, and the only method taking a button that does. */
internal const val BUTTON_STYLE_COLOR = "themed_sema_color_icon_inverse"

/** Pinterest's own "Download" string, and a menu label that has to sit in the same strings class. */
internal const val DOWNLOAD_LABEL = "download"
internal const val MENU_LABEL = "contextmenu_share"

internal val LONG_PRESS_STUBS = listOf("eventPin", "menuModel", "modelId", "menuItems", "layoutItems", "downloadItem")

private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

private fun Method.instructionList(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)
private fun <T> List<T>.only(what: String): T = singleOrNull()
    ?: throw PatchException("$PATCH: $what: expected one exact target, found $size")

private fun Instruction.receiver(): Int? = when (this) {
    is FiveRegisterInstruction -> registerC.takeIf { registerCount > 0 }
    is RegisterRangeInstruction -> startRegister.takeIf { registerCount > 0 }
    else -> null
}

private fun isPublic(owner: ClassDef?) = owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags)

/**
 * Everything the long-press button uses, found by shape in both declared builds.
 *
 * @property list the menu's item list method, the only public final `void (List)` of the menu
 * @property items the menu's laid-out button list: the ArrayList field the list method adds to,
 *           its own origin marker first and the buttons it was handed after it
 * @property show the menu's show method, the only one taking two of Pinterest's own types
 * @property model the show event's field holding what was long-pressed, typed as the pin's interface
 * @property modelId the interface's only abstract String getter, the id the menu keeps
 * @property shown the menu's only String field, which the show method fills from [modelId]
 */
internal class LongPressMenu(
    val list: Method,
    val items: FieldReference,
    val show: Method,
    val event: String,
    val model: Field,
    val pin: String,
    val modelId: Method,
    val shown: Field,
    val buttonModel: ClassDef,
    val icon: String,
    val factory: Method,
    val styler: Method,
    val strings: String,
)

internal fun BytecodePatchContext.longPressMenu(): LongPressMenu {
    val menu = classDefByOrNull(CONTEXT_MENU) ?: throw PatchException("$PATCH: this build has no long-press menu")
    if (!isPublic(menu)) throw PatchException("$PATCH: the long-press menu isn't public")
    fun instance(method: Method) = !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null

    val list = menu.methods.filter {
        instance(it) && it.returnType == "V" && it.parameterNames() == listOf("Ljava/util/List;") &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags)
    }.only("the menu's item list method")
    val listBody = list.instructionList()
    // The button list is the ArrayList field whose value the list method calls add() on.
    val adds = mutableListOf<Pair<Int, FieldReference>>()
    listBody.forEachIndexed { at, instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return@forEachIndexed
        if (instruction.opcode != Opcode.IGET_OBJECT || field.definingClass != CONTEXT_MENU || field.type != ARRAY_LIST) return@forEachIndexed
        val register = (instruction as TwoRegisterInstruction).registerA
        for (read in list.literalReads(at)) {
            val call = (listBody[read] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if ("$call" == "$ARRAY_LIST->add(Ljava/lang/Object;)Z" && listBody[read].receiver() == register) adds += read to field
        }
    }
    val items = adds.map { it.second }.distinctBy { "$it" }.only("the menu's button list field")
    if (menu.fields.none { it.name == items.name && it.type == ARRAY_LIST && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags) }) {
        throw PatchException("$PATCH: the menu's button list isn't a public field of its own")
    }
    // The extension skips the first entry as the menu's origin marker, so the list method has to
    // add exactly one of its own before it reads the buttons it's handed.
    val handed = list.implementation!!.registerCount - 1
    val firstRead = (listOf(0).filter { listBody[0].namedRegistersOf().contains(handed) } + list.readsAfter(0, handed)).minOrNull()
        ?: throw PatchException("$PATCH: the list method never reads its button list")
    if (adds.count { it.first < firstRead } != 1) {
        throw PatchException("$PATCH: the list method no longer adds one origin marker before the buttons it's handed")
    }

    fun outside(type: String) = type.startsWith("L") && !type.startsWith("Ljava/") && !type.startsWith("Landroid/")
    val show = menu.methods.filter { instance(it) && it.parameterTypes.size == 2 && it.parameterNames().all(::outside) }
        .only("the menu's show method")
    if (show.returnType != "V" || !AccessFlags.PUBLIC.isSet(show.accessFlags)) {
        throw PatchException("$PATCH: the menu's show method no longer answers void")
    }
    val event = show.parameterNames()[0]
    val pinMenu = classDefByOrNull(PIN_MENU) ?: throw PatchException("$PATCH: this build has no pin overflow menu")
    val pin = pinMenu.fields.singleOrNull { it.name == "pin" && it.type.startsWith("Lcom/pinterest/api/model/") }?.type
        ?: throw PatchException("$PATCH: the overflow menu has no unique pin model field")
    val pinClass = classDefByOrNull(pin) ?: throw PatchException("$PATCH: no pin model class $pin")
    val eventClass = classDefByOrNull(event) ?: throw PatchException("$PATCH: no show event class $event")
    val model = eventClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type in pinClass.interfaces }
        .only("the show event's long-pressed model field")
    val face = classDefByOrNull(model.type)
    if (face == null || !AccessFlags.INTERFACE.isSet(face.accessFlags) || !isPublic(face) || !isPublic(eventClass) || !isPublic(pinClass) ||
        !AccessFlags.PUBLIC.isSet(model.accessFlags)) {
        throw PatchException("$PATCH: the show event's model ${model.type} isn't a public interface field")
    }
    val modelId = face.methods.filter {
        AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    }.only("the model's id getter")
    val shown = menu.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/lang/String;" }
        .only("the menu's shown model id field")
    // The click compares the pin's id with this field, so the show method has to fill it from that getter.
    val showBody = show.instructionList()
    val reads = showBody.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
        call.definingClass == face.type && call.name == modelId.name && call.parameterTypes.isEmpty() } == true }
    val writes = showBody.any { instruction -> instruction.opcode == Opcode.IPUT_OBJECT &&
        ((instruction as ReferenceInstruction).reference as FieldReference).let { it.definingClass == CONTEXT_MENU && it.name == shown.name } }
    if (!reads || !writes || !AccessFlags.PUBLIC.isSet(shown.accessFlags)) {
        throw PatchException("$PATCH: the show method no longer keeps the shown model's id in ${shown.name}")
    }

    val buttonModels = methodsWithString(MENU_BUTTON_MODEL).filter { it.name == "toString" && it.parameterTypes.isEmpty() }
        .map { it.definingClass }.distinct()
    val buttonModel = classDefByOrNull(buttonModels.only("the menu button model"))!!
    val constructor = buttonModel.methods.filter {
        it.name == "<init>" && it.parameterTypes.size == 4 && it.parameterNames().drop(1) == listOf("I", "I", FUNCTION0)
    }.only("the menu button model's constructor")
    val icon = constructor.parameterNames()[0]
    val iconClass = classDefByOrNull(icon)
    if (iconClass?.fields?.count { it.name == "DOWNLOAD" && it.type == icon && AccessFlags.STATIC.isSet(it.accessFlags) &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) } != 1 || !isPublic(iconClass) || !isPublic(buttonModel) ||
        !AccessFlags.PUBLIC.isSet(constructor.accessFlags)) {
        throw PatchException("$PATCH: the menu's icons have no public DOWNLOAD")
    }

    val factories = mutableListOf<Method>()
    val stylers = mutableListOf<Method>()
    val strings = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        val statics = owner.fields.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "I" }.map { it.name }
        if (DOWNLOAD_LABEL in statics && MENU_LABEL in statics) strings += owner
        for (method in owner.methods) {
            if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.implementation == null) continue
            val parameters = method.parameterNames()
            if (method.returnType == CONTEXT_MENU_ITEM && parameters == listOf("Landroid/content/Context;", buttonModel.type)) {
                factories += method
            }
            if (method.returnType == "V" && parameters == listOf(CONTEXT_MENU_ITEM) &&
                method.instructionList().any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == BUTTON_STYLE_COLOR }) {
                stylers += method
            }
        }
    }
    val factory = factories.only("the menu button factory")
    val styler = stylers.only("the menu button styler")
    val stringsClass = strings.only("the strings class with $DOWNLOAD_LABEL")
    for ((what, method) in listOf("button factory" to factory, "button styler" to styler)) {
        if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || !isPublic(classDefByOrNull(method.definingClass))) {
            throw PatchException("$PATCH: the menu $what isn't public")
        }
    }
    if (!isPublic(stringsClass) || stringsClass.fields.none { it.name == DOWNLOAD_LABEL && AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
        throw PatchException("$PATCH: Pinterest's $DOWNLOAD_LABEL string isn't public")
    }
    return LongPressMenu(list, items, show, event, model, pin, modelId, shown, buttonModel, icon, factory, styler, stringsClass.type)
}

private fun Instruction.namedRegistersOf(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is TwoRegisterInstruction -> listOf(registerB)
    else -> emptyList()
}

@Suppress("unused")
val longPressDownloadPatch = bytecodePatch(
    name = PATCH,
    description = "Adds a Download button to the round menu you get when you long-press a pin in a grid, so you can " +
        "save a pin without opening it. Slide onto the button and let go. Needs Download pins on too. Starts off. " +
        "Turn it on in HushPinterest settings > Pin actions.",
) {
    category("Downloads")
    dependsOn(settingsPatch, pinterestExtensionPatch, downloadPinsPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("longPressDownload")
        requireStatusMethod("longPressMenu")
        val found = longPressMenu()
        val extension = mutableClassDefBy(LONG_PRESS)
        for (name in LONG_PRESS_STUBS + "show") {
            if (extension.methods.count { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) } != 1) {
                throw PatchException("$PATCH: missing extension stub $name")
            }
        }
        val show = mutableClassDefBy(CONTEXT_MENU).methods.single {
            it.name == found.show.name && it.parameterNames() == found.show.parameterNames() && it.returnType == found.show.returnType
        }
        if ((show.implementation!!.instructions[0] as BuilderInstruction).location.labels.isNotEmpty()) {
            throw PatchException("$PATCH: the show method's first instruction is also a branch target")
        }
        // The hook reads the menu and its event where the method starts, borrowing nothing.
        show.requireThisIntact(PATCH, listOf(0))
        show.requireParameterIntact(PATCH, 0, listOf(0))
        val face = found.model.type
        writeStub(LONG_PRESS, "eventPin", 3, """
            if-eqz p0, :none
            check-cast p0, ${found.event}
            iget-object v0, p0, ${found.event}->${found.model.name}:$face
            instance-of v1, v0, ${found.pin}
            if-eqz v1, :none
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """)
        writeStub(LONG_PRESS, "menuModel", 2, """
            check-cast p0, $CONTEXT_MENU
            iget-object v0, p0, $CONTEXT_MENU->${found.shown.name}:Ljava/lang/String;
            return-object v0
        """)
        writeStub(LONG_PRESS, "modelId", 2, """
            check-cast p0, $face
            invoke-interface { p0 }, $face->${found.modelId.name}()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        writeStub(LONG_PRESS, "menuItems", 2, """
            check-cast p0, $CONTEXT_MENU
            iget-object v0, p0, $CONTEXT_MENU->${found.items.name}:$ARRAY_LIST
            return-object v0
        """)
        writeStub(LONG_PRESS, "layoutItems", 2, """
            check-cast p0, $CONTEXT_MENU
            invoke-virtual { p0, p1 }, $CONTEXT_MENU->${found.list.name}(Ljava/util/List;)V
            return-void
        """)
        // Pinterest's own label and description string, "Download", and a null click: the extension
        // sets its own click listener on the button the factory returns, in place of the factory's.
        writeStub(LONG_PRESS, "downloadItem", 5, """
            new-instance v0, ${found.buttonModel.type}
            sget-object v1, ${found.icon}->DOWNLOAD:${found.icon}
            sget v2, ${found.strings}->$DOWNLOAD_LABEL:I
            const/4 v3, 0x0
            invoke-direct { v0, v1, v2, v2, v3 }, ${found.buttonModel.type}-><init>(${found.icon}II$FUNCTION0)V
            invoke-static { p0, v0 }, ${found.factory.definingClass}->${found.factory.name}(Landroid/content/Context;${found.buttonModel.type})$CONTEXT_MENU_ITEM
            move-result-object v0
            invoke-static { v0 }, ${found.styler.definingClass}->${found.styler.name}($CONTEXT_MENU_ITEM)V
            return-object v0
        """)
        // The menu and its event, both untouched at the method's first instruction.
        show.addInstructions(0, "invoke-static/range { p0 .. p1 }, $LONG_PRESS_HOOK")
        enableCapability("longPressMenu")
        enableStatus("longPressDownload")
    }
}
