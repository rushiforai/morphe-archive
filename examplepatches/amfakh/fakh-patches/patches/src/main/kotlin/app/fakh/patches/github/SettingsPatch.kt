package app.fakh.patches.github

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION = "Lapp/fakh/extension/github/MaterialYou;"
private const val SETTINGS_ENTRY = "Lapp/fakh/extension/github/SettingsEntry;"
private const val SWITCH_PREFERENCE = "Landroidx/preference/SwitchPreferenceCompat;"
private const val SETTINGS_FRAGMENT = "Lcom/github/android/settings/SettingsFragment;"
private const val STYLED_CATEGORY = "Lcom/github/android/settings/preferences/StyledPreferenceCategory;"
private const val PREFERENCE_CATEGORY = "Landroidx/preference/PreferenceCategory;"
private const val PREFERENCE = "Landroidx/preference/Preference;"
private const val PREFERENCE_GROUP = "Landroidx/preference/PreferenceGroup;"

/** The instructions of the method's body. */
internal val Method.body: List<Instruction> get() = implementation!!.instructions.toList()

/** The method this instruction calls, or null. */
internal val Instruction.method get() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The type this instruction creates or checks, or null. */
internal val Instruction.typeReference get() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

/** The field this instruction reads or writes, or null. */
internal val Instruction.field get() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * The preference APIs that R8 renamed, read off the Theme row and the category divider that SettingsFragment builds
 * in its onCreatePreferences: setKey, setTitle, the call every row gets after its title and summary, the click
 * listener and default value fields, the context field, the layout field and divider layout, and
 * PreferenceGroup.addPreference.
 */
private class PreferenceApi(
    val setKey: MethodReference,
    val setTitle: MethodReference,
    val setSummary: MethodReference,
    val finish: MethodReference,
    val listener: FieldReference,
    val defaultValue: FieldReference,
    val context: FieldReference,
    val layout: FieldReference,
    val dividerLayout: Int,
    val addPreference: MethodReference,
    /** Index of the call that adds the Theme row to the General category, and the preference screen's register. */
    val themeAddedAt: Int,
    val screenRegister: Int,
)

private fun preferenceApi(build: Method): PreferenceApi {
    val body = build.body
    val themeKey = body.indexOfFirst { ((it as? Instruction21c)?.reference as? StringReference)?.string == "key_dark_mode" }
    if (themeKey < 0) throw PatchException("Theme row not found")
    /** Index of the first instruction from [from] that matches, or a PatchException naming [what]. */
    fun find(from: Int, what: String, predicate: (Instruction) -> Boolean) =
        (from until body.size).firstOrNull { predicate(body[it]) } ?: throw PatchException("$what not found")

    val setKeyAt = find(themeKey, "setKey") {
        it.method?.let { m -> m.definingClass == PREFERENCE && m.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") } == true
    }
    val row = (body[setKeyAt] as FiveRegisterInstruction).registerC
    /** The first call from [from] on the Theme row to a Preference method with [parameters]. */
    fun rowCall(from: Int, what: String, parameters: List<String>) = find(from, what) {
        val method = it.method ?: return@find false
        method.definingClass == PREFERENCE && method.parameterTypes.map(CharSequence::toString) == parameters &&
            (it as FiveRegisterInstruction).registerC == row
    }
    val setTitleAt = rowCall(setKeyAt + 1, "setTitle", listOf("Ljava/lang/String;"))
    val setSummaryAt = rowCall(setTitleAt + 1, "setSummary", listOf("Ljava/lang/CharSequence;"))
    val finishAt = rowCall(setSummaryAt + 1, "Row finish call", emptyList())
    val listener = body[find(themeKey, "Click listener field") {
        it.opcode == Opcode.IPUT_OBJECT && it.field?.definingClass == PREFERENCE && it.field?.type != "Ljava/lang/Object;"
    }].field!!
    val defaultValue = body[find(themeKey, "Default value field") {
        it.opcode == Opcode.IPUT_OBJECT && it.field?.definingClass == PREFERENCE && it.field?.type == "Ljava/lang/Object;"
    }].field!!
    val context = body[find(0, "Context field") {
        it.opcode == Opcode.IGET_OBJECT && it.field?.definingClass == PREFERENCE && it.field?.type == "Landroid/content/Context;"
    }].field!!
    val addedAt = find(finishAt, "addPreference of the Theme row") {
        val method = it.method ?: return@find false
        method.definingClass == PREFERENCE_GROUP && (it as FiveRegisterInstruction).registerD == row
    }
    val category = (body[addedAt] as FiveRegisterInstruction).registerC
    val categoryAddedAt = (addedAt downTo 0).firstOrNull { index ->
        body[index].method?.definingClass == PREFERENCE_GROUP && (body[index] as FiveRegisterInstruction).registerD == category
    } ?: throw PatchException("addPreference of the General category not found")
    val layoutAt = find(0, "Divider layout") {
        it.opcode == Opcode.IPUT && it.field?.definingClass == PREFERENCE && it.field?.type == "I"
    }
    val dividerLayout = (body[layoutAt - 1] as? NarrowLiteralInstruction)?.narrowLiteral
        ?: throw PatchException("Divider layout id not found")
    return PreferenceApi(
        setKey = body[setKeyAt].method!!,
        setTitle = body[setTitleAt].method!!,
        setSummary = body[setSummaryAt].method!!,
        finish = body[finishAt].method!!,
        listener = listener,
        defaultValue = defaultValue,
        context = context,
        layout = body[layoutAt].field!!,
        dividerLayout = dividerLayout,
        addPreference = body[addedAt].method!!,
        themeAddedAt = addedAt,
        screenRegister = (body[categoryAddedAt] as FiveRegisterInstruction).registerC,
    )
}
/** Smali reference of a method. */
internal val MethodReference.smali
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Smali reference of a field. */
internal val FieldReference.smali get() = "$definingClass->$name:$type"

/** The preference APIs of the screen being patched, read once by [githubSettingsPatch]. */
private var switchApi: PreferenceApi? = null

/**
 * Smali that adds the row for the setting [key] to the category in v3: a switch that persists to GitHub's settings
 * file, where the extension reads it, or with no [default] a plain row. Both report a click to the extension.
 */
private fun row(api: PreferenceApi, key: String, title: String, default: Boolean?, summary: String? = null): String {
    val type = if (default == null) PREFERENCE else SWITCH_PREFERENCE
    return """
    new-instance v1, $type
    const/4 v2, 0x0
    invoke-direct { v1, v0, v2 }, $type-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    const-string v2, "$key"
    invoke-virtual { v1, v2 }, ${api.setKey.smali}
    const-string v2, "$title"
    invoke-static { v2 }, Lapp/fakh/extension/shared/I18n;->tr(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, ${api.setTitle.smali}
    ${if (summary == null) "" else """
    const-string v2, "$summary"
    invoke-static { v2 }, Lapp/fakh/extension/shared/I18n;->tr(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, ${api.setSummary.smali}
    """}
    ${if (default != null) "" else """
    const-string v2, "$key"
    invoke-static { v2 }, $EXTENSION->summary(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, ${api.setSummary.smali}
    """}
    invoke-virtual { v1 }, ${api.finish.smali}
    ${if (default == null) "" else """
    sget-object v2, Ljava/lang/Boolean;->${if (default) "TRUE" else "FALSE"}:Ljava/lang/Boolean;
    iput-object v2, v1, ${api.defaultValue.smali}
    """}
    const-string v2, "$key"
    new-instance v4, $SETTINGS_ENTRY
    invoke-direct { v4, v2 }, $SETTINGS_ENTRY-><init>(Ljava/lang/String;)V
    iput-object v4, v1, ${api.listener.smali}
    invoke-virtual { v3, v1 }, ${api.addPreference.smali}
"""
}

/**
 * The Fakh Patches section of GitHub's Settings, shared by every patch that has a switch: this patch builds the
 * section and its click listener, and each patch adds its own switches with [addSwitch].
 */
internal val githubSettingsPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        // Settings: a Fakh Patches section with a switch per setting, right after General.
        val settings = mutableClassDefBy(SETTINGS_FRAGMENT)
        // onCreatePreferences, which builds the preference screen; other methods look the Theme row up by its key.
        val build = settings.methods.first { method ->
            val instructions = method.implementation?.instructions?.toList().orEmpty()
            instructions.any { ((it as? Instruction21c)?.reference as? StringReference)?.string == "key_dark_mode" } &&
                instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == "Landroidx/preference/PreferenceScreen;" }
        }
        val api = preferenceApi(build)
        switchApi = api

        settings.methods.add(
            ImmutableMethod(
                SETTINGS_FRAGMENT,
                "fakhAddPatchesSection",
                listOf(ImmutableMethodParameter(PREFERENCE_GROUP, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(6),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        iget-object v0, p0, ${api.context.smali}
                        new-instance v1, $PREFERENCE_CATEGORY
                        const/4 v2, 0x0
                        invoke-direct { v1, v0, v2 }, $PREFERENCE_CATEGORY-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
                        const v2, ${api.dividerLayout}
                        iput v2, v1, ${api.layout.smali}
                        invoke-virtual { p0, v1 }, ${api.addPreference.smali}
                        new-instance v3, $STYLED_CATEGORY
                        invoke-direct { v3, v0 }, $STYLED_CATEGORY-><init>(Landroid/content/Context;)V
                        const-string v2, "Fakh Patches"
                        invoke-virtual { v3, v2 }, ${api.setTitle.smali}
                        invoke-virtual { v3 }, ${api.finish.smali}
                        invoke-virtual { p0, v3 }, ${api.addPreference.smali}
                        return-void
                    """,
                )
            },
        )
        // The General category is already on the screen here, so the new section lands right after it.
        build.addInstructions(
            api.themeAddedAt + 1,
            "invoke-static/range { v${api.screenRegister} .. v${api.screenRegister} }, " +
                "$SETTINGS_FRAGMENT->fakhAddPatchesSection($PREFERENCE_GROUP)V",
        )

        // The switches' click listener implements the renamed listener interface. Preferences run it after the
        // switch has toggled and saved itself.
        val callback = classDefBy(api.listener.type).methods.single()
        if (callback.returnType != "V") throw PatchException("Unexpected click listener ${callback.returnType}")
        mutableClassDefBy(SETTINGS_ENTRY).apply {
            interfaces.add(api.listener.type)
            methods.add(
                ImmutableMethod(
                    type,
                    callback.name,
                    callback.parameters.map { ImmutableMethodParameter(it.type, null, null) },
                    callback.returnType,
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(4),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            iget-object v0, p1, ${api.context.smali}
                            iget-object v1, p0, $SETTINGS_ENTRY->key:Ljava/lang/String;
                            invoke-static { v0, v1, p1 }, $EXTENSION->toggled(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
                            return-void
                        """,
                    )
                },
            )
        }
        addChoiceSheets(api, build)
    }
}

private const val SINGLE_SHEET = "Lcom/github/android/settings/preferences/SingleChoiceBottomSheet;"
private const val MULTI_SHEET = "Lcom/github/android/settings/preferences/MultiChoiceBottomSheet;"
private const val DIALOG_FRAGMENT = "Landroidx/fragment/app/DialogFragment;"
private const val BUNDLE = "Landroid/os/Bundle;"
private const val STRING = "Ljava/lang/String;"

/** The strings a method loads. */
private fun Method.strings(): Set<String> = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet().orEmpty()

/** The parameter types of a method as strings. */
private val MethodReference.parameters get() = parameterTypes.map(CharSequence::toString)

/**
 * Every method, with its class, that [matches]: of [classes] when given (found through the patcher's indexes, much
 * faster), else of the whole app.
 */
private fun BytecodePatchContext.methodsWhere(
    classes: List<ClassDef>? = null,
    matches: (Method) -> Boolean,
): List<Pair<String, Method>> {
    val found = mutableListOf<Pair<String, Method>>()
    fun search(classDef: ClassDef) {
        if (classDef.type.startsWith("Lapp/fakh/extension/")) return
        for (method in classDef.methods) if (method.implementation != null && matches(method)) found += classDef.type to method
    }
    if (classes != null) classes.distinctBy { it.type }.forEach(::search) else classDefForEach(::search)
    return found
}

/**
 * The type of the item a choice sheet takes, a parcelable with a (value, title) constructor: the one class the sheet
 * reads back from its arguments.
 */
private fun BytecodePatchContext.itemType(sheet: String): String {
    val types = classDefBy(sheet).methods.filter { it.implementation != null }.flatMap { method ->
        method.body.filter { it.opcode == Opcode.CONST_CLASS }.mapNotNull { it.typeReference }
    }.distinct()
    return types.firstOrNull { type ->
        val definition = classDefBy(type)
        definition.interfaces.contains("Landroid/os/Parcelable;") && definition.methods.any {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(STRING, STRING)
        }
    } ?: throw PatchException("Item type of $sheet not found")
}

/**
 * The index of the call, after the string [anchor] of a method body, that reports a result: a virtual call taking a
 * String and a Bundle, or null when the method has no such call.
 */
private fun List<Instruction>.resultCallAfter(anchor: String): Int? {
    val anchorAt = indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == anchor }
    if (anchorAt < 0) return null
    return (anchorAt until size).firstOrNull { index ->
        val call = this[index].method
        (this[index].opcode == Opcode.INVOKE_VIRTUAL || this[index].opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
            call != null && call.returnType == "V" && call.parameters == listOf(STRING, BUNDLE)
    }
}

/**
 * Calls [EXTENSION]'s `chosen(requestKey, result)` right before a choice sheet reports its result to the fragment
 * manager: the call after the string [anchor] that takes a String and a Bundle. [strings] find the one method.
 */
private fun BytecodePatchContext.hookChoiceResult(strings: Set<String>, anchor: String) {
    val found = methodsWhere(classDefByStrings(anchor)) {
        it.strings().containsAll(strings) && it.body.resultCallAfter(anchor) != null
    }
    if (found.size != 1) throw PatchException("Choice result $strings found in ${found.map { it.first }}")
    val (type, original) = found.single()
    val method = mutableClassDefBy(type).methods.first {
        it.name == original.name && it.returnType == original.returnType &&
            it.parameterTypes.map(CharSequence::toString) == original.parameterTypes.map(CharSequence::toString)
    }
    val body = method.body
    val callAt = body.resultCallAfter(anchor)!!
    val (key, bundle) = when (val call = body[callAt]) {
        is FiveRegisterInstruction -> call.registerD to call.registerE
        is RegisterRangeInstruction -> call.startRegister + 1 to call.startRegister + 2
        else -> throw PatchException("Unexpected choice result call ${call.opcode}")
    }
    val arguments = when {
        key < 16 && bundle < 16 -> "invoke-static { v$key, v$bundle }"
        bundle == key + 1 -> "invoke-static/range { v$key .. v$bundle }"
        else -> throw PatchException("Registers $key and $bundle of the choice result call")
    }
    method.addInstructions(callAt, "$arguments, $EXTENSION->chosen(Ljava/lang/String;Landroid/os/Bundle;)V")
}

/**
 * Lets the extension disable a row of the multi-choice sheet. The sheet turns each item into a row model with an
 * enabled flag that its constructor defaults to true, through the default-argument constructor
 * (mask, value, title, subtitle, enabled); the mask is lowered so the flag is read, and the flag is set from
 * [EXTENSION]'s `enabled(value)`. The registers are the contiguous argument block the range call is made from.
 */
private fun BytecodePatchContext.hookChoiceRowEnabled() {
    fun Instruction.rowConstructor() = opcode == Opcode.INVOKE_DIRECT_RANGE && method?.let {
        it.name == "<init>" && it.parameters == listOf("I", STRING, STRING, STRING, "Z")
    } == true
    val casts = Fingerprint(filters = listOf(checkCast(MULTI_SHEET))).matchAllOrNull().orEmpty().map { it.originalClassDef }
    val found = methodsWhere(casts) { method ->
        method.body.any { it.opcode == Opcode.CHECK_CAST && it.typeReference == MULTI_SHEET } && method.body.any { it.rowConstructor() }
    }
    if (found.size != 1) throw PatchException("Multi-choice row constructor found in ${found.map { it.first }}")
    val (type, original) = found.single()
    val method = mutableClassDefBy(type).methods.first {
        it.name == original.name && it.returnType == original.returnType &&
            it.parameterTypes.map(CharSequence::toString) == original.parameterTypes.map(CharSequence::toString)
    }
    val callAt = method.body.indexOfFirst { it.rowConstructor() }
    val start = (method.body[callAt] as RegisterRangeInstruction).startRegister
    val (mask, value, enabled) = Triple(start + 1, start + 2, start + 5)
    method.addInstructions(
        callAt,
        """
            const/16 v$mask, 0x4
            invoke-static/range { v$value .. v$value }, $EXTENSION->enabled(Ljava/lang/String;)Z
            move-result v$enabled
        """,
    )
}

/**
 * Greys the checkbox of a disabled row of the choice sheet. The row composable (value, wide color, checked, enabled,
 * ..., changed, defaults) makes the row toggleable with the effective enabled flag and then draws a checkbox that
 * takes its own enabled flag from a default. The flag is recorded at the toggleable call, after the defaults are
 * applied, and handed to the checkbox with its default lowered so it is read.
 */
private fun BytecodePatchContext.hookChoiceRowStyle() {
    fun Instruction.rangeCall(parameters: Int, vararg booleans: Int): Boolean {
        val call = method
        return opcode == Opcode.INVOKE_STATIC_RANGE && call != null && call.parameters.size == parameters &&
            booleans.all { call.parameters[it] == "Z" } && call.parameters.last() == "I"
    }
    val found = methodsWhere { method ->
        val types = method.parameterTypes.map(CharSequence::toString)
        types.size == 9 && types[1] == "J" && types[2] == "Z" && types[3] == "Z" && types[7] == "I" && types[8] == "I" &&
            method.body.any { it.rangeCall(6, 1, 2) } && method.body.any { it.rangeCall(8, 1, 2) }
    }
    if (found.size != 1) throw PatchException("Choice row composable found in ${found.map { it.first }}")
    val (type, original) = found.single()
    val method = mutableClassDefBy(type).methods.first {
        it.name == original.name && it.returnType == original.returnType &&
            it.parameterTypes.map(CharSequence::toString) == original.parameterTypes.map(CharSequence::toString)
    }
    val body = method.body
    val toggleAt = body.indexOfFirst { it.rangeCall(6, 1, 2) }
    val checkboxAt = (toggleAt + 1 until body.size).first { body[it].rangeCall(8, 1, 2) }
    val toggle = (body[toggleAt] as RegisterRangeInstruction).startRegister
    val checkbox = (body[checkboxAt] as RegisterRangeInstruction).startRegister
    // The later call first, so the index of the earlier one holds.
    method.addInstructions(
        checkboxAt,
        """
            const/16 v${checkbox + 7}, 0x10
            invoke-static { }, $EXTENSION->rowEnabled()Z
            move-result v${checkbox + 2}
        """,
    )
    method.addInstructions(toggleAt, "invoke-static/range { v${toggle + 2} .. v${toggle + 2} }, $EXTENSION->rowEnabled(Z)V")
}

/**
 * Lets the extension open GitHub's own choice sheets, the ones its Theme and Language rows use, from the Fakh Patches
 * rows. The fragment API is renamed, so SettingsFragment gets static helpers that call it with the references read
 * off the code that opens those sheets: one to open the single-choice sheet, one the multi-choice sheet, one to make an
 * item of each, and one to set the summary of a row. The extension is told the fragment, and each result.
 */
private fun BytecodePatchContext.addChoiceSheets(api: PreferenceApi, build: MutableMethod) {
    // Theme: SingleChoiceBottomSheet.Companion.a(title, selected, requestKey, items).v3(fragmentManager, tag).
    val theme = methodsWhere(classDefByStrings("key_single_choice_dialog_theme")) { method ->
        "key_single_choice_dialog_theme" in method.strings() &&
            method.body.any { it.opcode == Opcode.INVOKE_STATIC && it.method?.returnType == SINGLE_SHEET }
    }.firstOrNull() ?: throw PatchException("Theme sheet call not found")
    val themeBody = theme.second.body
    val factoryAt = themeBody.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC && it.method?.returnType == SINGLE_SHEET }
    val factory = themeBody[factoryAt].method!!
    val showAt = (factoryAt + 1 until themeBody.size).firstOrNull { index ->
        val call = themeBody[index].method
        themeBody[index].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.returnType == "V" &&
            call.parameters.size == 2 && call.parameters[1] == STRING
    } ?: throw PatchException("Sheet show call not found")
    val show = themeBody[showAt].method!!
    if (show.definingClass != DIALOG_FRAGMENT) throw PatchException("Sheet show call is on ${show.definingClass}")
    val manager = (factoryAt + 1 until showAt).firstNotNullOfOrNull { index ->
        themeBody[index].method?.takeIf {
            themeBody[index].opcode == Opcode.INVOKE_VIRTUAL && it.parameters.isEmpty() && it.returnType == show.parameters[0]
        }
    } ?: throw PatchException("Fragment manager call not found")

    // The Copilot home filter opens the multi-choice sheet from a bundle: setArguments is the first call taking only one.
    val multi = methodsWhere(classDefByStrings("key_sheet_title")) { method ->
        "key_sheet_title" in method.strings() && method.body.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == MULTI_SHEET }
    }.firstOrNull() ?: throw PatchException("Multi-choice sheet call not found")
    val multiBody = multi.second.body
    val newAt = multiBody.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == MULTI_SHEET }
    val arguments = multiBody.drop(newAt).firstNotNullOfOrNull { instruction ->
        instruction.method?.takeIf { instruction.opcode == Opcode.INVOKE_VIRTUAL && it.returnType == "V" && it.parameters == listOf(BUNDLE) }
    } ?: throw PatchException("setArguments call not found")

    val single = itemType(SINGLE_SHEET)
    val multiple = itemType(MULTI_SHEET)
    val fragment = mutableClassDefBy(SETTINGS_FRAGMENT)
    fun helper(name: String, parameters: List<String>, returnType: String, registers: Int, smali: String) {
        fragment.methods.add(
            ImmutableMethod(
                SETTINGS_FRAGMENT,
                name,
                parameters.map { ImmutableMethodParameter(it, null, null) },
                returnType,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(registers),
            ).toMutable().apply { addInstructions(0, smali) },
        )
    }
    val list = "Ljava/util/ArrayList;"
    val any = "Ljava/lang/Object;"
    helper("fakhSummary", listOf(any, STRING), "V", 2, """
        check-cast p0, $PREFERENCE
        invoke-virtual { p0, p1 }, ${api.setSummary.smali}
        return-void
    """)
    for ((name, type) in listOf("fakhSingleItem" to single, "fakhMultiItem" to multiple)) {
        helper(name, listOf(STRING, STRING), any, 3, """
            new-instance v0, $type
            invoke-direct { v0, p0, p1 }, $type-><init>(Ljava/lang/String;Ljava/lang/String;)V
            return-object v0
        """)
    }
    helper("fakhShowSingle", listOf(any, STRING, STRING, STRING, list), "V", 8, """
        check-cast p0, $SETTINGS_FRAGMENT
        invoke-static { p1, p2, p3, p4 }, ${factory.smali}
        move-result-object v0
        invoke-virtual { p0 }, ${manager.smali}
        move-result-object v1
        const-string v2, "SingeChoiceBottomSheet"
        invoke-virtual { v0, v1, v2 }, ${show.smali}
        return-void
    """)
    helper("fakhShowMulti", listOf(any, STRING, list, list, STRING), "V", 8, """
        check-cast p0, $SETTINGS_FRAGMENT
        new-instance v0, $MULTI_SHEET
        invoke-direct { v0 }, $MULTI_SHEET-><init>()V
        new-instance v1, $BUNDLE
        invoke-direct { v1 }, $BUNDLE-><init>()V
        const-string v2, "key_sheet_title"
        invoke-virtual { v1, v2, p1 }, $BUNDLE->putString(Ljava/lang/String;Ljava/lang/String;)V
        const-string v2, "key_selected_values"
        invoke-virtual { v1, v2, p2 }, $BUNDLE->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V
        const-string v2, "key_items"
        invoke-virtual { v1, v2, p3 }, $BUNDLE->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V
        const-string v2, "key_request_key"
        invoke-virtual { v1, v2, p4 }, $BUNDLE->putString(Ljava/lang/String;Ljava/lang/String;)V
        invoke-virtual { v0, v1 }, ${arguments.smali}
        invoke-virtual { p0 }, ${manager.smali}
        move-result-object v1
        const-string v2, "MultiChoiceBottomSheet"
        invoke-virtual { v0, v1, v2 }, ${show.smali}
        return-void
    """)

    hookChoiceRowEnabled()
    hookChoiceRowStyle()
    hookChoiceResult(setOf("key_request_key", "key_result_item"), "key_result_item")
    hookChoiceResult(setOf("key_result_value", "key_result_is_selected"), "key_result_is_selected")
    // The extension opens the sheets from the fragment that is being built.
    build.addInstructions(0, "invoke-static/range { p0 .. p0 }, $EXTENSION->settings(Ljava/lang/Object;)V")
}

/**
 * Adds a row to the Fakh Patches section; run after [githubSettingsPatch] has built it. A null [default] makes a
 * plain row that only reports its click, such as one that opens a sheet.
 */
internal fun BytecodePatchContext.addSwitch(key: String, title: String, default: Boolean?, summary: String? = null) {
    val api = switchApi ?: throw PatchException("The Fakh Patches section is not built yet")
    val section = mutableClassDefBy(SETTINGS_FRAGMENT).methods.first { it.name == "fakhAddPatchesSection" }
    section.addInstructions(section.implementation!!.instructions.count() - 1, row(api, key, title, default, summary))
}
