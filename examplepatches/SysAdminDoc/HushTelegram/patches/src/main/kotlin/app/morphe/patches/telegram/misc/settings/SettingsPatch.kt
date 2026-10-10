/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.patches.telegram.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.TELEGRAM_APPLICATION
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.RegisterKind
import app.morphe.util.RegisterKinds
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

internal const val ENTRY = "$EXTENSION_PACKAGE/settings/SettingsEntry;"

/** The activity Telegram's launcher opens. A manifest name is never obfuscated. */
internal const val MAIN_ACTIVITY = "Lorg/telegram/ui/LaunchActivity;"

/** [MAIN_ACTIVITY] as the manifest writes it. */
internal const val MAIN_ACTIVITY_NAME = "org.telegram.ui.LaunchActivity"

/**
 * The activity alias the settings patch adds for Android's App info page. Its name sits in the
 * extension's package, so it can't meet a component of Telegram's own.
 */
internal const val SETTINGS_ALIAS_NAME = "app.hushtelegram.extension.telegram.settings.OpenSettings"

/** The intent Android's App info page sends to "Additional settings in the app". */
internal const val APPLICATION_PREFERENCES = "android.intent.action.APPLICATION_PREFERENCES"

/**
 * The first class in [type]'s hierarchy, as far as the APK carries it, that declares this
 * method with a body.
 */
internal fun BytecodePatchContext.declaredInHierarchy(
    type: String,
    name: String,
    vararg parameters: String,
): MutableMethod = superclassChain(type)
    .mapNotNull { mutableClassDefByOrNull(it) }
    .firstNotNullOfOrNull { classDef ->
        classDef.methods.singleOrNull { method ->
            method.name == name && method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.map { it.toString() } == parameters.toList()
        }
    } ?: throw PatchException("No class of $type's hierarchy declares $name(${parameters.joinToString("")})V")

/**
 * Adds an alias of [MAIN_ACTIVITY] that answers [APPLICATION_PREFERENCES], which is what makes
 * Android's App info page for Telegram show "Additional settings in the app". The alias opens
 * Telegram's own launcher activity with that action, and the extension opens the settings from there.
 * The settings extension needs API 28, so the patched APK also declares that floor, preserving any
 * higher minimum Telegram already requires.
 */
internal val settingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no application element")
            val activities = document.getElementsByTagName("activity")
            val main = (0 until activities.length).map { activities.item(it) as Element }
                .singleOrNull { it.getAttribute("android:name") == MAIN_ACTIVITY_NAME }
                ?: throw PatchException("AndroidManifest.xml doesn't declare $MAIN_ACTIVITY_NAME")
            if (main.getAttribute("android:exported") != "true") {
                throw PatchException("$MAIN_ACTIVITY_NAME isn't exported, so Android's App info page couldn't open it")
            }
            val aliases = document.getElementsByTagName("activity-alias")
            if ((0 until aliases.length).any { (aliases.item(it) as Element).getAttribute("android:name") == SETTINGS_ALIAS_NAME }) {
                throw PatchException("AndroidManifest.xml already has $SETTINGS_ALIAS_NAME")
            }

            val sdkElements = document.getElementsByTagName("uses-sdk")
            if (sdkElements.length > 1) throw PatchException("AndroidManifest.xml has more than one uses-sdk element")
            val sdk = sdkElements.item(0) as? Element ?: document.createElement("uses-sdk").also {
                document.documentElement.insertBefore(it, document.documentElement.firstChild)
            }
            val stockMinSdk = if (!sdk.hasAttribute("android:minSdkVersion")) {
                1 // Android's default when a manifest declares no minimum.
            } else {
                sdk.getAttribute("android:minSdkVersion").toIntOrNull()?.takeIf { it > 0 }
                    ?: throw PatchException("AndroidManifest.xml has an invalid minSdkVersion")
            }
            sdk.setAttribute("android:minSdkVersion", maxOf(stockMinSdk, 28).toString())

            val alias = document.createElement("activity-alias").apply {
                setAttribute("android:name", SETTINGS_ALIAS_NAME)
                setAttribute("android:targetActivity", MAIN_ACTIVITY_NAME)
                setAttribute("android:exported", "true")
            }
            val filter = document.createElement("intent-filter")
            filter.appendChild(document.createElement("action").apply { setAttribute("android:name", APPLICATION_PREFERENCES) })
            filter.appendChild(
                document.createElement("category").apply { setAttribute("android:name", "android.intent.category.DEFAULT") },
            )
            alias.appendChild(filter)
            application.appendChild(alias)
        }
    }
}

internal const val NATIVE_ROW_BRIDGE = "hushTelegramAddSettingsRow"
internal const val NATIVE_ROW_ID = 0x48544753
private const val NATIVE_LIST = "Ljava/util/ArrayList;"
private const val NATIVE_APPEND = "$NATIVE_LIST->add(Ljava/lang/Object;)Z"
private const val NATIVE_STRING = "Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;"
private val NATIVE_ROW_PARAMS = List(4) { "I" } + List(3) { "Ljava/lang/CharSequence;" }
private val NATIVE_ROWS = listOf(
    Triple(1, "Account", "account"), Triple(2, "Chat", "chat"), Triple(3, "PrivacySecurity", "privacy"),
    Triple(5, "Notifications", "sounds"), Triple(6, "Data", "data"), Triple(7, "Folders", "folders"),
    Triple(8, "Devices", "devices"), Triple(9, "PowerSaving", "power"), Triple(10, "Language", "language"),
)
private fun nativeLabel(name: String) = "Lorg/telegram/messenger/R\$string;->Settings$name:I"
private fun nativeIcon(name: String) = "Lorg/telegram/messenger/R\$drawable;->settings_$name:I"
private fun Instruction.nativeRef() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.nativeCall() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.nativeField() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.nativeInt() = (this as? NarrowLiteralInstruction)?.narrowLiteral
private fun Method.nativeBody() = implementation?.instructions?.toList().orEmpty()
private fun Method.nativeFlow(): ControlFlow = try {
    ControlFlow.of(this)
} catch (_: IllegalArgumentException) {
    throw PatchException("HushTelegram settings: native self-settings control flow changed (before editing)")
} catch (_: ClassCastException) {
    throw PatchException("HushTelegram settings: native self-settings switch payload changed (before editing)")
}
private fun MethodReference.nativeShape(parameters: List<String>, result: String) =
    parameterTypes.map { it.toString() } == parameters && returnType == result
private fun nativeShape(ok: Boolean, why: String) {
    if (!ok) throw PatchException("HushTelegram settings: native self-settings $why (before editing)")
}
private fun <T> List<T>.nativeSingle(what: String): T {
    nativeShape(size == 1, "$what is missing or ambiguous")
    return single()
}
private fun Method.nativeCallable(static: Boolean) =
    AccessFlags.PUBLIC.isSet(accessFlags) && AccessFlags.STATIC.isSet(accessFlags) == static &&
        !AccessFlags.ABSTRACT.isSet(accessFlags) && !AccessFlags.NATIVE.isSet(accessFlags) && nativeBody().isNotEmpty()

private fun BytecodePatchContext.requireSettingsEntry() {
    val owner = mutableClassDefBy(ENTRY)
    nativeShape(AccessFlags.PUBLIC.isSet(owner.accessFlags), "extension entry is inaccessible")
    for ((name, parameters, result) in listOf(
        Triple("onApplicationCreate", listOf("Landroid/content/Context;"), "V"),
        Triple("onActivityCreate", listOf("Landroid/app/Activity;"), "V"),
        Triple("onNewIntent", listOf("Landroid/app/Activity;", "Landroid/content/Intent;"), "V"),
        Triple("openFromNative", listOf("Landroid/app/Activity;"), "V"),
        Triple("nativeSettingsTitle", emptyList(), "Ljava/lang/String;"),
    )) {
        val method = owner.methods.filter { it.name == name }.nativeSingle("extension $name")
        nativeShape(method.nativeShape(parameters, result) && method.nativeCallable(true), "extension $name changed")
    }
}

internal data class NativeSettingsPlan(
    val builder: MutableMethod, val rowIndex: Int, val rowsRegister: Int,
    val click: MutableMethod, val clickIndex: Int, val bridge: MutableMethod,
    val patchedBuilder: MutableMethod, val patchedClick: MutableMethod,
)

/**
 * SettingsActivity owns these nine account settings rows and binds their builder and item-ID
 * dispatcher to the same UniversalRecyclerView. Names renamed by R8 are discovered from those
 * bindings, the kept resource pairs and the native factory's actual field stores.
 */
internal fun BytecodePatchContext.resolveNativeSettings(): NativeSettingsPlan? {
    val classes = mutableMapOf<String, ClassDef>()
    classDefForEach { if (!it.type.startsWith(EXTENSION_ROOT)) classes[it.type] = it }
    val candidates = classes.values.flatMap { it.methods.toList() }.filter { method ->
        method.nativeShape(listOf(method.definingClass, NATIVE_LIST), "V") &&
            NATIVE_ROWS.any { (_, title, _) -> method.nativeBody().any { it.nativeRef() == nativeLabel(title) } }
    }
    val shells = classes.values.filter { type -> type.methods.any { method ->
        method.name == "createView" && method.nativeBody().any {
            it.nativeRef() == "Lorg/telegram/messenger/R\$string;->Settings:I"
        } && method.nativeBody().any { it.nativeCall()?.parameterTypes?.map { p -> p.toString() }?.drop(1) ==
            listOf("Lorg/telegram/messenger/Utilities\$Callback2;", "Lorg/telegram/messenger/Utilities\$Callback5;",
                "Lorg/telegram/messenger/Utilities\$Callback5Return;") }
    } }
    if (candidates.isEmpty() && shells.isEmpty()) return null
    val found = candidates.nativeSingle("row builder")
    val owner = classes.getValue(found.definingClass)
    nativeShape(shells.size == 1 && shells.single().type == owner.type, "view owner is missing or ambiguous")
    nativeShape(AccessFlags.PUBLIC.isSet(owner.accessFlags) && found.nativeCallable(true), "row owner is inaccessible")
    nativeShape(owner.methods.none { it.name == NATIVE_ROW_BRIDGE }, "row bridge already exists")
    val builder = mutableClassDefBy(owner.type).methods.filter { it.toString() == found.toString() }.nativeSingle("mutable builder")
    val body = builder.nativeBody()
    val flow = builder.nativeFlow()
    nativeShape(body.none { it.nativeInt() == NATIVE_ROW_ID }, "dedicated row identity collides")
    var factory: MethodReference? = null
    var rows = -1
    var previousEnd = -1
    var first = -1
    var top = 0
    var bottom = 0
    for ((identity, title, icon) in NATIVE_ROWS) {
        val at = body.indices.filter { body[it].nativeRef() == nativeLabel(title) }.nativeSingle("$title label")
        val start = at - 1
        val language = identity == 10
        val callAt = at + if (language) 8 else if (identity == 1) 10 else 9
        val args = body.getOrNull(callAt)?.namedRegisters().orEmpty()
        val idAt = callAt - 3
        val end = callAt + 2
        nativeShape(start >= 0 && end < body.size && (previousEnd < 0 || start == previousEnd + 1) &&
            body[start].opcode == Opcode.SGET && body[start].nativeRef() == nativeIcon(icon) &&
            body[at].opcode == Opcode.SGET && body[at + 1].opcode == Opcode.INVOKE_STATIC &&
            body[at + 1].nativeRef() == NATIVE_STRING && body[at].namedRegisters() == body[at + 1].namedRegisters() &&
            body[at + 2].opcode == Opcode.MOVE_RESULT_OBJECT &&
            body[callAt].opcode == Opcode.INVOKE_STATIC_RANGE &&
            body[callAt].nativeCall()?.parameterTypes?.map { it.toString() } == NATIVE_ROW_PARAMS &&
            args.size == 7 && args == (args.first()..args.last()).toList() &&
            body[start].namedRegisters() == listOf(args[3]) && body[at + 2].namedRegisters() == listOf(args[4]) &&
            body[idAt].nativeInt() == identity && body[idAt].namedRegisters() == listOf(args[0]) &&
            body[idAt + 1].opcode == Opcode.CONST && body[idAt + 1].namedRegisters() == listOf(args[1]) &&
            body[idAt + 2].opcode == Opcode.CONST && body[idAt + 2].namedRegisters() == listOf(args[2]) &&
            body[callAt + 1].opcode == Opcode.MOVE_RESULT_OBJECT && body[end].opcode == Opcode.INVOKE_VIRTUAL &&
            body[end].nativeRef() == NATIVE_APPEND &&
            body[end].namedRegisters().getOrNull(1) == body[callAt + 1].namedRegisters().singleOrNull(),
            "$title row operands changed")
        if (language) {
            nativeShape(body[at + 3].opcode == Opcode.INVOKE_STATIC &&
                body[at + 3].nativeRef() == "Lorg/telegram/messenger/LocaleController;->getCurrentLanguageName()Ljava/lang/String;" &&
                body[at + 4].opcode == Opcode.MOVE_RESULT_OBJECT &&
                body[at + 4].namedRegisters() == listOf(args[5]), "language subtitle changed")
        } else {
            nativeShape(body[at + 3].opcode == Opcode.SGET && body[at + 3].nativeRef() == nativeLabel(title + "Info") &&
                body[at + 4].opcode == Opcode.INVOKE_STATIC && body[at + 4].nativeRef() == NATIVE_STRING &&
                body[at + 3].namedRegisters() == body[at + 4].namedRegisters() &&
                body[at + 5].opcode == Opcode.MOVE_RESULT_OBJECT &&
                body[at + 5].namedRegisters() == listOf(args[5]), "$title subtitle changed")
        }
        nativeShape((start until end).all { flow.normal[it] == listOf(it + 1) && flow.exceptional[it].isEmpty() },
            "$title row no longer has one intact path")
        if (first < 0) {
            first = start
            factory = body[callAt].nativeCall()
            rows = body[end].namedRegisters().first()
            top = body[idAt + 1].nativeInt()!!
            bottom = body[idAt + 2].nativeInt()!!
            nativeShape(body[at + 6].opcode == Opcode.CONST_4 && body[at + 6].nativeInt() == 0 &&
                body[at + 6].namedRegisters() == listOf(args[6]), "account row value changed")
        } else nativeShape(body[callAt].nativeCall().toString() == factory.toString() &&
            body[end].namedRegisters().first() == rows && args[6] == body[first + 11].namedRegisters().last(),
            "$title row factory or list changed")
        previousEnd = end
    }
    nativeShape(body.indices.none { from -> flow.normal[from].any { it in first + 1..previousEnd && from != it - 1 } ||
        flow.exceptional[from].any { it in first..previousEnd } }, "row block can be bypassed or reentered")
    val alias = body.indices.filter { body[it].opcode == Opcode.MOVE_OBJECT_FROM16 &&
        body[it].namedRegisters() == listOf(rows, builder.parameterRegisterNumber(1)) }.nativeSingle("rows parameter binding")
    nativeShape(body.indices.none { it != alias && body[it].opcode.setsRegister() &&
        body[it].namedRegisters().firstOrNull()?.let { dest -> dest == rows ||
            (body[it].opcode.setsWideRegister() && dest + 1 == rows) } == true }, "rows parameter is overwritten")
    val rowFactory = factory!!
    val itemType = rowFactory.returnType
    val factoryOwner = classes[rowFactory.definingClass] ?: throw PatchException("HushTelegram settings: native self-settings factory is missing (before editing)")
    val make = factoryOwner.methods.filter { it.toString() == rowFactory.toString() }.nativeSingle("cell factory")
    val makeBody = make.nativeBody()
    nativeShape(AccessFlags.PUBLIC.isSet(factoryOwner.accessFlags) && make.nativeCallable(true) &&
        make.implementation!!.registerCount == 8 && makeBody.map { it.opcode } == listOf(
            Opcode.CONST_CLASS, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT, Opcode.IPUT,
            Opcode.IPUT_OBJECT, Opcode.IPUT_OBJECT, Opcode.IPUT_OBJECT, Opcode.INT_TO_LONG, Opcode.CONST_16,
            Opcode.SHL_LONG_2ADDR, Opcode.INT_TO_LONG, Opcode.CONST_WIDE, Opcode.AND_LONG_2ADDR,
            Opcode.OR_LONG_2ADDR, Opcode.IPUT_WIDE, Opcode.RETURN_OBJECT,
        ) && makeBody[0].nativeRef() == factoryOwner.type && makeBody[1].nativeCall()?.let {
            it.definingClass == itemType && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Class;") &&
                it.returnType == itemType
        } == true && makeBody.map { it.namedRegisters() } == listOf(listOf(0), listOf(0), listOf(0),
            listOf(1, 0), listOf(4, 0), listOf(5, 0), listOf(6, 0), listOf(7, 0), listOf(3, 3), listOf(1),
            listOf(3, 1), listOf(1, 2), listOf(5), listOf(1, 5), listOf(1, 3), listOf(1, 0), listOf(0)) &&
        makeBody[9].nativeInt() == 32 && (makeBody[12] as WideLiteralInstruction).wideLiteral == 0xffffffffL,
        "cell factory changed")
    val item = classes[itemType] ?: throw PatchException("HushTelegram settings: native self-settings item is missing (before editing)")
    nativeShape(AccessFlags.PUBLIC.isSet(item.accessFlags), "item type is inaccessible")
    for (index in listOf(3, 4, 5, 6, 7, 15)) {
        val field = makeBody[index].nativeField()!!
        val declared = item.fields.filter { it.toString() == field.toString() }.nativeSingle("cell field")
        nativeShape(field.definingClass == itemType && AccessFlags.PUBLIC.isSet(declared.accessFlags) &&
            !AccessFlags.STATIC.isSet(declared.accessFlags) && !AccessFlags.FINAL.isSet(declared.accessFlags) &&
            field.type == if (index in listOf(3, 4)) "I" else if (index == 15) "J" else "Ljava/lang/CharSequence;",
            "cell field type or access changed")
    }
    val render = factoryOwner.methods.filter { it.name == "bindView" }.nativeSingle("cell renderer")
    val painted = render.nativeBody()
    nativeShape(render.nativeCallable(false) && render.parameterTypes.take(3).map { it.toString() } ==
        listOf("Landroid/view/View;", itemType, "Z") && painted.size == 49 &&
        painted.take(10).map { it.opcode } == listOf(Opcode.IGET_WIDE, Opcode.LONG_TO_INT, Opcode.CONST_16,
            Opcode.USHR_LONG_2ADDR, Opcode.LONG_TO_INT, Opcode.CHECK_CAST, Opcode.IGET,
            Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT) &&
        listOf(0 to 15, 6 to 4, 7 to 5, 8 to 6, 9 to 7).all { (read, store) ->
            painted[read].nativeRef() == makeBody[store].nativeRef() &&
                painted[read].namedRegisters().getOrNull(1) == render.parameterRegisterNumber(1)
        } && painted[2].nativeInt() == 32, "cell renderer no longer reads the factory's values")
    val cell = classes[painted[5].nativeRef()]
        ?: throw PatchException("HushTelegram settings: native self-settings cell is missing (before editing)")
    val constructor = cell.methods.filter { it.name == "<init>" }.nativeSingle("cell constructor")
    val built = constructor.nativeBody()
    nativeShape(cell.superclass == "Landroid/widget/LinearLayout;" && constructor.nativeCallable(false) &&
        constructor.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;" &&
        constructor.implementation!!.registerCount == 14 && built.size > 52 &&
        built.subList(22, 53).map { it.opcode } == listOf(
            Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.NEW_INSTANCE,
            Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.CONST_HIGH16, Opcode.INVOKE_VIRTUAL,
            Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_4,
            Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT, Opcode.CONST_HIGH16, Opcode.INVOKE_VIRTUAL,
            Opcode.CONST_4, Opcode.CONST_HIGH16, Opcode.CONST_4, Opcode.CONST_4, Opcode.INVOKE_STATIC_RANGE,
            Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT,
            Opcode.INVOKE_VIRTUAL,
        ) && built.subList(22, 53).map { it.namedRegisters() } == listOf(
            listOf(0), listOf(12, 0), listOf(1), listOf(2), listOf(2, 12), listOf(2, 11), listOf(3), listOf(2, 0, 3),
            listOf(6), listOf(7), listOf(4), listOf(5), listOf(8), listOf(9), listOf(4, 5, 6, 7, 8, 9), listOf(4),
            listOf(1, 2, 4, 12), listOf(2), listOf(2, 11), listOf(4), listOf(2, 0, 4), listOf(8), listOf(6),
            listOf(9), listOf(10), listOf(5, 6, 7, 8, 9, 10), listOf(4), listOf(1, 2, 4, 12), listOf(12),
            listOf(12, 11), listOf(12, 0, 3),
        ) && built[22].nativeInt() == 1 && built[25].nativeRef() == "Landroid/widget/TextView;" &&
        built[26].nativeRef() == "Landroid/widget/TextView;-><init>(Landroid/content/Context;)V" &&
        listOf(29, 42, 52).all { built[it].nativeRef() == "Landroid/widget/TextView;->setTextSize(IF)V" } &&
        built[28].nativeInt() == java.lang.Float.floatToIntBits(16f) &&
        built[41].nativeInt() == java.lang.Float.floatToIntBits(13f) && built[38].nativeRef() == built[49].nativeRef(),
        "cell title and subtitle construction changed")
    val constructionFlow = constructor.nativeFlow()
    nativeShape((22..52).all { constructionFlow.normal[it] == listOf(it + 1) && constructionFlow.exceptional[it].isEmpty() } &&
        built.indices.none { from -> constructionFlow.normal[from].any { it in 23..52 && from != it - 1 } },
        "cell text construction can be bypassed")
    // R8 may move these helpers to unrelated packages. Prove their bodies, not their names.
    for (at in listOf(23, 38)) {
        val reference = built[at].nativeCall()!!
        val helper = classes[reference.definingClass]?.methods?.filter { it.toString() == reference.toString() }
            ?.nativeSingle("cell construction helper")
            ?: throw PatchException("HushTelegram settings: native self-settings cell helper is missing (before editing)")
        val code = helper.nativeBody()
        val column = at == 23
        nativeShape(helper.nativeCallable(true) && helper.nativeShape(
            if (column) listOf("Landroid/content/Context;", "I") else listOf("Landroid/widget/LinearLayout;",
                "Landroid/widget/TextView;", "Landroid/widget/LinearLayout\$LayoutParams;", "Landroid/content/Context;"),
            if (column) "Landroid/widget/LinearLayout;" else "Landroid/widget/TextView;") &&
            helper.implementation!!.registerCount == if (column) 3 else 4, "cell helper signature changed")
        nativeShape(code.map { it.opcode } == if (column)
            listOf(Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_OBJECT)
            else listOf(Opcode.INVOKE_VIRTUAL, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT),
            "cell helper operations changed")
        nativeShape(code.map { it.namedRegisters() } == if (column)
            listOf(listOf(0), listOf(0, 1), listOf(0, 2), listOf(0))
            else listOf(listOf(0, 1, 2), listOf(0), listOf(0, 3), listOf(0)), "cell helper operands changed")
        nativeShape(if (column) code[0].nativeRef() == "Landroid/widget/LinearLayout;" &&
            code[1].nativeRef() == "Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V" &&
            code[2].nativeRef() == "Landroid/widget/LinearLayout;->setOrientation(I)V"
            else code[0].nativeRef() == "Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup\$LayoutParams;)V" &&
                code[1].nativeRef() == "Landroid/widget/TextView;" &&
                code[2].nativeRef() == "Landroid/widget/TextView;-><init>(Landroid/content/Context;)V",
            "cell helper role changed")
    }
    val textFields = listOf(27, 40, 51).map { built[it].nativeField() }
    nativeShape(textFields.toSet().size == 3 && textFields.all { reference -> reference != null &&
        reference.definingClass == cell.type && reference.type == "Landroid/widget/TextView;" &&
        cell.fields.count { it.toString() == reference.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            AccessFlags.FINAL.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) } == 1 },
        "cell text fields changed")
    val viewParameter = render.parameterRegisterNumber(0)
    nativeShape(painted[5].namedRegisters() == listOf(viewParameter) && listOf(10, 11).all { index ->
        painted[index].opcode == Opcode.IGET_OBJECT && painted[index].nativeRef() == textFields[index - 10].toString() &&
            painted[index].namedRegisters().getOrNull(1) == viewParameter
    }, "cell title or subtitle receiver changed")
    val renderFlow = render.nativeFlow()
    val branches = mapOf(15 to listOf(16, 18), 17 to listOf(19), 22 to listOf(23, 27),
        26 to listOf(28), 29 to listOf(30, 33), 43 to listOf(44, 45), 48 to emptyList())
    nativeShape(painted.indices.all { renderFlow.normal[it].toSet() == (branches[it] ?: listOf(it + 1)).toSet() &&
        renderFlow.exceptional[it].isEmpty() }, "cell rendering can bypass its text bindings")
    for ((source, receiver, consumer) in listOf(Triple(7, 10, 38), Triple(8, 11, 46), Triple(9, 5, 47))) {
        val value = painted[source].namedRegisters().first()
        val viewRegister = painted[receiver].namedRegisters().first()
        nativeShape(painted[consumer].opcode == Opcode.INVOKE_VIRTUAL &&
            painted[consumer].namedRegisters() == listOf(viewRegister, value) &&
            painted[consumer].nativeCall()?.let { call ->
                call.nativeShape(listOf("Ljava/lang/CharSequence;"), "V") &&
                    if (consumer == 47) call.name == "setValue" && call.definingClass == painted[5].nativeRef()
                    else call.toString() == "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V"
            } == true && (source + 1 until consumer).none { index ->
                painted[index].opcode.setsRegister() && painted[index].namedRegisters().firstOrNull()?.let {
                    it == value || painted[index].opcode.setsWideRegister() && it + 1 == value
                } == true
            } && (receiver + 1 until consumer).none { index ->
                painted[index].opcode.setsRegister() && painted[index].namedRegisters().firstOrNull()?.let {
                    it == viewRegister || painted[index].opcode.setsWideRegister() && it + 1 == viewRegister
                } == true
            }, "cell title subtitle or value binding changed")
    }
    val idField = makeBody[3].nativeField()!!.toString()
    val dispatcher = owner.methods.filter { it.nativeShape(listOf(owner.type, itemType), "V") }.nativeSingle("item click dispatcher")
    nativeShape(dispatcher.nativeCallable(true), "click dispatcher is inaccessible")
    val click = mutableClassDefBy(owner.type).methods.filter { it.toString() == dispatcher.toString() }.nativeSingle("mutable click dispatcher")
    val clickBody = click.nativeBody()
    val idRead = clickBody.indices.filter { clickBody[it].nativeRef() == idField && clickBody[it].opcode == Opcode.IGET }
        .nativeSingle("click identity read")
    val clickAt = idRead + 1
    val idRegister = clickBody[idRead].namedRegisters().first()
    val string = clickBody.getOrNull(clickAt)?.let { (it as? ReferenceInstruction)?.reference as? StringReference }
    val scratch = clickBody.getOrNull(clickAt)?.namedRegisters()?.singleOrNull() ?: -1
    val clickFlow = click.nativeFlow()
    val inputs = setOf(click.parameterRegisterNumber(0), click.parameterRegisterNumber(1))
    val predecessors = clickBody.indices.map { mutableSetOf<Int>() }
    for (from in clickBody.indices) for (to in clickFlow.normal[from] + clickFlow.exceptional[from]) {
        predecessors[to].add(from)
    }
    val reaching = mutableSetOf<Int>()
    val pending = ArrayDeque(predecessors[idRead])
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (reaching.add(at)) pending.addAll(predecessors[at])
    }
    nativeShape(0 in reaching && idRead !in reaching && reaching.none { at ->
        val instruction = clickBody[at]
        instruction.opcode.setsRegister() && instruction.namedRegisters().firstOrNull()?.let { written ->
            written in inputs || instruction.opcode.setsWideRegister() && written + 1 in inputs
        } == true
    }, "incoming click item or owner can be overwritten")
    nativeShape(clickBody[idRead].namedRegisters().getOrNull(1) == click.parameterRegisterNumber(1) &&
        string?.string == "settings" && clickBody[clickAt].opcode == Opcode.CONST_STRING &&
        clickBody.getOrNull(clickAt + 1)?.opcode == Opcode.PACKED_SWITCH &&
        clickBody[clickAt + 1].namedRegisters() == listOf(idRegister) &&
        scratch in 0..15 && scratch !in RegisterLiveness.of(click).liveInto(clickAt) &&
        clickFlow.normal[idRead] == listOf(clickAt) && clickFlow.exceptional[clickAt].isEmpty() &&
        clickBody.indices.none { it != idRead && clickAt in clickFlow.normal[it] || clickAt in clickFlow.exceptional[it] },
        "click identity or scratch register changed")
    val payload = clickBody.filterIsInstance<SwitchPayload>().nativeSingle("click switch")
    nativeShape(payload.switchElements.map { it.key } == (1..24).toList(), "ordinary click identities changed")
    val addresses = IntArray(clickBody.size + 1)
    clickBody.indices.forEach { addresses[it + 1] = addresses[it] + clickBody[it].codeUnits }
    var present: String? = null
    val clickKinds = RegisterKinds.of(click)
    for ((key, type) in mapOf(1 to "UserInfoActivity", 2 to "ThemeActivity", 3 to "PrivacySettingsActivity",
        5 to "NotificationsSettingsActivity", 6 to "DataSettingsActivity", 7 to "FiltersSetupActivity",
        8 to "SessionsActivity", 9 to null, 10 to "LanguageSelectActivity")) {
        val route = payload.switchElements.single { it.key == key }
        val target = addresses.indexOf(addresses[clickAt + 1] + route.offset)
        nativeShape(target >= 0 && target + 3 < clickBody.size, "ordinary click route is truncated")
        val arm = clickBody.subList(target, target + 4)
        val allocation = arm[0].nativeRef()
        val construction = arm[1].nativeCall()
        val display = arm[2].nativeCall()
        nativeShape(arm.map { it.opcode } == listOf(Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT,
            Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) &&
            (type == null || allocation == "Lorg/telegram/ui/$type;") &&
            arm[0].namedRegisters() == listOf(idRegister) && construction?.name == "<init>" &&
            construction.definingClass == allocation && construction.returnType == "V" &&
            construction.parameterTypes.map { it.toString() } == (if (key == 2 || key == 8) listOf("I") else emptyList()) &&
            display?.definingClass == owner.type && display.nativeShape(listOf(owner.superclass!!), "V") &&
            arm[2].namedRegisters() == listOf(click.parameterRegisterNumber(0), idRegister),
            "ordinary account setting click changed")
        val constructorArguments = arm[1].namedRegisters()
        val constructorKinds = clickKinds.at(target + 1)
        nativeShape(constructorArguments.firstOrNull() == idRegister &&
            constructorArguments.size == if (key == 2 || key == 8) 2 else 1,
            "ordinary setting constructor operands changed")
        nativeShape(constructorKinds?.getOrNull(idRegister) == RegisterKind(RegisterKind.Tag.UNINIT, allocation, target) &&
            (constructorArguments.size == 1 || constructorKinds.getOrNull(constructorArguments[1]) == RegisterKind.ZERO),
            "ordinary setting constructor identity or mode changed")
        if (present == null) present = arm[2].nativeRef()
        else nativeShape(present == arm[2].nativeRef(), "ordinary setting presenter changed")
    }
    validateSettingsCallbacks(classes, owner, builder, click, itemType)
    val base = classes[owner.superclass] ?: throw PatchException("HushTelegram settings: native self-settings parent is missing (before editing)")
    val activityGetter = base.methods.filter { it.name == "getParentActivity" }.nativeSingle("parent activity reader")
    nativeShape(AccessFlags.PUBLIC.isSet(base.accessFlags) && activityGetter.nativeCallable(false) &&
        activityGetter.nativeShape(emptyList(), "Landroid/app/Activity;"), "parent activity reader changed")
    val activityRegister = click.parameterRegisterNumber(0)
    nativeShape(activityRegister <= 15 && rows in 0..15, "activity or list operand no longer fits")
    val iconReference = nativeIcon("account")
    val bridge = ImmutableMethod(owner.type, NATIVE_ROW_BRIDGE,
        listOf(ImmutableMethodParameter(NATIVE_LIST, null, null)), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null, null, MutableMethodImplementation(8)).toMutable().apply {
        addInstructionsWithLabels(0, """
            const v0, $NATIVE_ROW_ID
            const v1, $top
            const v2, $bottom
            sget v3, $iconReference
            invoke-static {}, $ENTRY->nativeSettingsTitle()Ljava/lang/String;
            move-result-object v4
            const/4 v5, 0x0
            const/4 v6, 0x0
            invoke-static/range {v0 .. v6}, $rowFactory
            move-result-object v0
            invoke-virtual {p0, v0}, $NATIVE_APPEND
            return-void
        """)
    }
    val rowIndex = previousEnd + 1
    val bridgeRef = owner.type + "->$NATIVE_ROW_BRIDGE($NATIVE_LIST)V"
    val patchedBuilder = ImmutableMethod.of(builder).toMutable().apply {
        addInstructionsAtControlFlowLabel(rowIndex, "invoke-static {v$rows}, $bridgeRef")
    }
    val patchedClick = ImmutableMethod.of(click).toMutable().apply {
        val resume = nativeBody()[clickAt]
        // Only the preceding ID read reaches this boundary. Keep the stock instruction's label
        // on that instruction so ordinary IDs resume after the guard, rather than re-enter it.
        addInstructionsWithLabels(clickAt, """
            const v$scratch, $NATIVE_ROW_ID
            if-ne v$idRegister, v$scratch, :stock_settings
            invoke-virtual {v$activityRegister}, $activityGetter
            move-result-object v$scratch
            invoke-static {v$scratch}, $ENTRY->openFromNative(Landroid/app/Activity;)V
            return-void
        """, ExternalLabel("stock_settings", resume))
    }
    return NativeSettingsPlan(builder, rowIndex, rows, click, clickAt, bridge, patchedBuilder, patchedClick)
}

private fun validateSettingsCallbacks(classes: Map<String, ClassDef>, owner: ClassDef, builder: Method, click: Method, item: String) {
    val view = owner.methods.filter { it.name == "createView" }.nativeSingle("self-settings view")
    nativeShape(view.nativeCallable(false) && view.nativeShape(listOf("Landroid/content/Context;"), "Landroid/view/View;") &&
        view.nativeBody().count { it.nativeRef() == "Lorg/telegram/messenger/R\$string;->Settings:I" } == 1,
        "self-settings view ownership changed")
    val body = view.nativeBody()
    val at = body.indices.filter { body[it].nativeCall()?.let { call -> call.name == "<init>" &&
        call.parameterTypes.map { it.toString() }.drop(1) == listOf(
            "Lorg/telegram/messenger/Utilities\$Callback2;", "Lorg/telegram/messenger/Utilities\$Callback5;",
            "Lorg/telegram/messenger/Utilities\$Callback5Return;") } == true }.nativeSingle("native list callback binding")
    nativeShape(at >= 8, "native list callback binding is truncated")
    val segment = body.subList(at - 8, at + 1)
    val args = body[at].namedRegisters()
    val viewFlow = view.nativeFlow()
    nativeShape(segment.map { it.opcode } == listOf(Opcode.NEW_INSTANCE, Opcode.NEW_INSTANCE, Opcode.CONST_16,
        Opcode.INVOKE_DIRECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.NEW_INSTANCE,
        Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT) && args.size == 5 &&
        segment[0].namedRegisters() == listOf(args[0]) && segment[0].nativeRef() == body[at].nativeCall()!!.definingClass &&
        segment[1].namedRegisters() == listOf(args[2]) &&
        segment[3].namedRegisters() == listOf(args[2], args[1], segment[2].namedRegisters().single()) &&
        segment[4].namedRegisters() == listOf(args[3]) && segment[5].namedRegisters() == listOf(args[3], args[1]) &&
        segment[6].namedRegisters() == listOf(args[4]) && segment[7].namedRegisters() == listOf(args[4], args[1]) &&
        segment[4].nativeRef() == segment[6].nativeRef() && args[1] == 0 &&
        body[0].opcode == Opcode.MOVE_OBJECT_FROM16 && body[0].namedRegisters() ==
            listOf(0, view.implementation!!.registerCount - 2) &&
        (1 until at).none { body[it].opcode.setsRegister() && body[it].namedRegisters().firstOrNull() == 0 } &&
        (0 until at).all { viewFlow.normal[it] == listOf(it + 1) && viewFlow.exceptional[it].isEmpty() },
        "native row and click callbacks are no longer paired")
    val fillType = segment[1].nativeRef()!!
    val clickType = segment[4].nativeRef()!!
    val fill = classes[fillType] ?: throw PatchException("HushTelegram settings: native self-settings fill callback missing (before editing)")
    val tap = classes[clickType] ?: throw PatchException("HushTelegram settings: native self-settings click callback missing (before editing)")
    nativeShape("Lorg/telegram/messenger/Utilities\$Callback2;" in fill.interfaces &&
        "Lorg/telegram/messenger/Utilities\$Callback5;" in tap.interfaces &&
        segment[3].nativeRef() == "$fillType-><init>(Ljava/lang/Object;I)V" &&
        segment[5].nativeRef() == "$clickType-><init>(" + owner.type + ")V" &&
        segment[7].nativeRef() == segment[5].nativeRef(), "native callback interface or constructor changed")
    val fillConstructor = fill.methods.filter { it.toString() == segment[3].nativeRef() }.nativeSingle("fill constructor")
    val constructor = fillConstructor.nativeBody()
    nativeShape(constructor.map { it.opcode } == listOf(Opcode.IPUT, Opcode.IPUT_OBJECT, Opcode.INVOKE_DIRECT, Opcode.RETURN_VOID) &&
        AccessFlags.PUBLIC.isSet(fill.accessFlags) && fillConstructor.nativeCallable(false) &&
        constructor.map { it.namedRegisters() } == listOf(listOf(2, 0), listOf(1, 0), listOf(0), emptyList()) &&
        constructor[2].nativeRef() == "Ljava/lang/Object;-><init>()V", "fill callback capture changed")
    val fillRun = fill.methods.filter { it.name == "run" && it.nativeShape(List(2) { "Ljava/lang/Object;" }, "V") }
        .nativeSingle("fill callback")
    val ops = fillRun.nativeBody()
    nativeShape(fillRun.nativeCallable(false), "fill callback is inaccessible")
    val switchAt = ops.indices.filter { ops[it].opcode == Opcode.PACKED_SWITCH }.nativeSingle("fill callback dispatch")
    nativeShape(ops[0].opcode == Opcode.MOVE_OBJECT_FROM16 && ops[0].namedRegisters() ==
        listOf(0, fillRun.implementation!!.registerCount - 3) && ops[1].opcode == Opcode.IGET &&
        ops[1].nativeRef() == constructor[0].nativeRef() && ops[1].namedRegisters() == listOf(1, 0) &&
        (2 until switchAt).all { ops[it].nativeInt() != null && ops[it].namedRegisters() != listOf(0) &&
            ops[it].namedRegisters() != listOf(1) } && ops[switchAt].namedRegisters() == listOf(1), "fill dispatch value changed")
    val offsets = IntArray(ops.size + 1)
    ops.indices.forEach { offsets[it + 1] = offsets[it] + ops[it].codeUnits }
    val table = ops[offsets.indexOf(offsets[switchAt] + (ops[switchAt] as OffsetInstruction).codeOffset)] as SwitchPayload
    val route = table.switchElements.filter { it.key == segment[2].nativeInt() }.nativeSingle("fill callback route")
    val target = offsets.indexOf(offsets[switchAt] + route.offset)
    nativeShape(target >= 0 && target + 8 <= ops.size, "fill callback route is truncated")
    val arm = ops.subList(target, target + 8)
    nativeShape(arm.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.MOVE_OBJECT_FROM16,
        Opcode.CHECK_CAST, Opcode.MOVE_OBJECT_FROM16, Opcode.CHECK_CAST, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID) &&
        arm[0].nativeRef() == constructor[1].nativeRef() && arm[0].namedRegisters() == listOf(1, 0) &&
        arm[1].nativeRef() == owner.type && arm[1].namedRegisters() == listOf(1) &&
        arm[2].namedRegisters() == listOf(2, fillRun.parameterRegisterNumber(0)) &&
        arm[3].nativeRef() == NATIVE_LIST && arm[3].namedRegisters() == listOf(2) &&
        arm[4].namedRegisters() == listOf(3, fillRun.parameterRegisterNumber(1)) &&
        arm[6].nativeRef() == builder.toString() && arm[6].namedRegisters() == listOf(1, 2), "fill callback no longer calls this builder")
    val tapRun = tap.methods.filter { it.name == "run" && it.nativeShape(List(5) { "Ljava/lang/Object;" }, "V") }
        .nativeSingle("click callback")
    val taps = tapRun.nativeBody()
    val tapConstructor = tap.methods.filter { it.toString() == segment[5].nativeRef() }.nativeSingle("click constructor")
    val captured = tapConstructor.nativeBody()
    nativeShape(tapRun.nativeCallable(false) && tapRun.implementation!!.registerCount == 6 &&
        AccessFlags.PUBLIC.isSet(tap.accessFlags) && tapConstructor.nativeCallable(false) &&
        captured.map { it.opcode } == listOf(Opcode.IPUT_OBJECT, Opcode.INVOKE_DIRECT, Opcode.RETURN_VOID) &&
        captured.map { it.namedRegisters() } == listOf(listOf(1, 0), listOf(0), emptyList()) &&
        captured[0].nativeRef() == taps[8].nativeRef() && captured[1].nativeRef() == "Ljava/lang/Object;-><init>()V" &&
        taps.map { it.opcode } == listOf(Opcode.CHECK_CAST, Opcode.CHECK_CAST, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL,
            Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL,
            Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID) &&
        taps[0].nativeRef() == item && taps[0].namedRegisters() == listOf(1) &&
        taps[1].nativeRef() == "Landroid/view/View;" && taps[1].namedRegisters() == listOf(2) &&
        taps[2].nativeRef() == "Ljava/lang/Integer;" && taps[2].namedRegisters() == listOf(3) &&
        taps[4].nativeRef() == "Ljava/lang/Float;" && taps[4].namedRegisters() == listOf(4) &&
        taps[6].nativeRef() == "Ljava/lang/Float;" && taps[6].namedRegisters() == listOf(5) &&
        listOf(3 to 3, 5 to 4, 7 to 5).all { (at, register) ->
            taps[at].nativeRef() == "Ljava/lang/Object;->getClass()Ljava/lang/Class;" &&
                taps[at].namedRegisters() == listOf(register)
        } &&
        taps[8].nativeField()?.type == owner.type && taps[8].namedRegisters() == listOf(2, 0) &&
        taps[9].nativeRef() == click.toString() && taps[9].namedRegisters() == listOf(2, 1),
        "click callback no longer calls this dispatcher")
}


/**
 * Adds the native Settings row and retains both external entries. The launcher shortcut sends an
 * extra and Android's App info entry sends [APPLICATION_PREFERENCES]. Native rows and callbacks are
 * resolved structurally before any lifecycle hook is changed.
 */
@Suppress("unused")
val settingsPatch = bytecodePatch(
    name = "HushTelegram settings",
    description = "Adds a HushTelegram row to Telegram's Settings, where you turn features on or off, pause " +
        "HushTelegram, save your choices and export a report. You can also press and hold Telegram's app " +
        "icon. Works as soon as you patch it in, with no switch.",
    default = true,
) {
    category("Settings")
    dependsOn(telegramExtensionPatch, settingsManifestPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireSettingsEntry()
        // Resolve and compile native edits first. A changed row or callback never leaves lifecycle
        // hooks behind, and an absent native surface retains both external ways into settings.
        val native = resolveNativeSettings()
        val activityCreate = declaredInHierarchy(MAIN_ACTIVITY, "onCreate", "Landroid/os/Bundle;")
        val newIntent = declaredInHierarchy(MAIN_ACTIVITY, "onNewIntent", "Landroid/content/Intent;")
        // Before each return of the application's onCreate, after Telegram's own startup: the
        // extension registers activity lifecycle callbacks there, and that's only safe once Telegram
        // has set itself up.
        val applicationOnCreate = declaredInHierarchy(TELEGRAM_APPLICATION, "onCreate")
        val returns = applicationOnCreate.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("$TELEGRAM_APPLICATION.onCreate never returns")
        returns.asReversed().forEach { index ->
            applicationOnCreate.addInstruction(
                index,
                "invoke-static/range { p0 .. p0 }, $ENTRY->onApplicationCreate(Landroid/content/Context;)V",
            )
        }

        activityCreate.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $ENTRY->onActivityCreate(Landroid/app/Activity;)V",
        )
        newIntent.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, $ENTRY->onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V",
        )

        // Telegram pushes its own shortcuts at rank 0, and the newest push goes first, so the
        // shortcut above could end up last, where a launcher that shows only a few cuts it off.
        // Each of those calls now goes through the extension, which puts it back in front
        // afterwards. Framework names only, which the obfuscator keeps.
        rerouteShortcutCalls()
        if (native == null) {
            patchLog.warning("HushTelegram settings: native self-settings row is unavailable. " +
                "The launcher shortcut and Android App info entry remain available.")
        } else {
            val owner = mutableClassDefBy(native.builder.definingClass)
            owner.methods.remove(native.builder)
            owner.methods.remove(native.click)
            owner.methods.add(native.patchedBuilder)
            owner.methods.add(native.patchedClick)
            owner.methods.add(native.bridge)
        }
    }
}
