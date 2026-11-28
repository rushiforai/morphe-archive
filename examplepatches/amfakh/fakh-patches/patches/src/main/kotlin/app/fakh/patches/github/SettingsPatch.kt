/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.featuresPatch
import app.fakh.patches.shared.useStore
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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
private const val PATCH_MENU = "Lapp/fakh/extension/github/PatchMenu;"
private const val TOOLBAR_FRAGMENT = "Lcom/github/android/settings/ToolBarPreferenceFragmentCompat;"
private const val CONTEXT = "Landroid/content/Context;"
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

/**
 * Adds a static method to SettingsFragment.
 *
 * @param name The method's name.
 * @param parameters The types of its parameters.
 * @param registers The registers it uses, parameters included.
 * @param smali Its body.
 * @param returns Its return type.
 */
private fun addHelper(name: String, parameters: List<String>, registers: Int, smali: String, returns: String = "V") {
    mutableClassDefBy(SETTINGS_FRAGMENT).methods.add(
        ImmutableMethod(
            SETTINGS_FRAGMENT,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returns,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructionsWithLabels(0, smali) },
    )
}

/**
 * Adds `fakhRow(group, key, title, summary, default)`: a row that reports a click to the extension. With a default it
 * is a switch that saves itself in GitHub's settings file, where the extension reads it; otherwise a plain row.
 */
private fun addRowHelper(api: PreferenceApi) = addHelper(
    "fakhRow",
    listOf(OBJECT, STRING, STRING, CHAR_SEQUENCE, OBJECT),
    8,
    """
        check-cast p0, $PREFERENCE_GROUP
        iget-object v0, p0, ${api.context.smali}
        const/4 v2, 0x0
        if-eqz p4, :plain
        new-instance v1, $SWITCH_PREFERENCE
        invoke-direct { v1, v0, v2 }, $SWITCH_PREFERENCE-><init>(${CONTEXT}Landroid/util/AttributeSet;)V
        goto :built
        :plain
        new-instance v1, $PREFERENCE
        invoke-direct { v1, v0, v2 }, $PREFERENCE-><init>(${CONTEXT}Landroid/util/AttributeSet;)V
        :built
        invoke-virtual { v1, p1 }, ${api.setKey.smali}
        invoke-virtual { v1, p2 }, ${api.setTitle.smali}
        invoke-virtual { v1, p3 }, ${api.setSummary.smali}
        invoke-virtual { v1 }, ${api.finish.smali}
        if-eqz p4, :added
        iput-object p4, v1, ${api.defaultValue.smali}
        :added
        new-instance v2, $SETTINGS_ENTRY
        invoke-direct { v2, p1 }, $SETTINGS_ENTRY-><init>($STRING)V
        iput-object v2, v1, ${api.listener.smali}
        invoke-virtual { p0, v1 }, ${api.addPreference.smali}
        return-void
    """,
)

/**
 * Adds `fakhHeader(screen, title, divider)`: a header, after a divider if asked, which returns the group its rows go
 * into.
 */
private fun addHeaderHelper(api: PreferenceApi) = addHelper(
    "fakhHeader",
    listOf(OBJECT, STRING, "Z"),
    6,
    """
        check-cast p0, $PREFERENCE_GROUP
        iget-object v0, p0, ${api.context.smali}
        if-eqz p2, :header
        new-instance v1, $PREFERENCE_CATEGORY
        const/4 v2, 0x0
        invoke-direct { v1, v0, v2 }, $PREFERENCE_CATEGORY-><init>(${CONTEXT}Landroid/util/AttributeSet;)V
        const v2, ${api.dividerLayout}
        iput v2, v1, ${api.layout.smali}
        invoke-virtual { p0, v1 }, ${api.addPreference.smali}
        :header
        new-instance v1, $STYLED_CATEGORY
        invoke-direct { v1, v0 }, $STYLED_CATEGORY-><init>($CONTEXT)V
        invoke-virtual { v1, p1 }, ${api.setTitle.smali}
        invoke-virtual { v1 }, ${api.finish.smali}
        invoke-virtual { p0, v1 }, ${api.addPreference.smali}
        return-object v1
    """,
    OBJECT,
)

/** Adds the card of GitHub's Settings, headed Patches, whose one row opens the Fakh Patches pages. */
private fun addCardHelper(api: PreferenceApi) = addHelper(
    "fakhAddPatchesSection",
    listOf(PREFERENCE_GROUP),
    6,
    """
        iget-object v0, p0, ${api.context.smali}
        new-instance v1, $PREFERENCE_CATEGORY
        const/4 v2, 0x0
        invoke-direct { v1, v0, v2 }, $PREFERENCE_CATEGORY-><init>(${CONTEXT}Landroid/util/AttributeSet;)V
        const v2, ${api.dividerLayout}
        iput v2, v1, ${api.layout.smali}
        invoke-virtual { p0, v1 }, ${api.addPreference.smali}
        new-instance v1, $STYLED_CATEGORY
        invoke-direct { v1, v0 }, $STYLED_CATEGORY-><init>($CONTEXT)V
        const-string v2, "Patches"
        invoke-static { v2 }, Lapp/fakh/extension/shared/I18n;->tr($STRING)$STRING
        move-result-object v2
        invoke-virtual { v1, v2 }, ${api.setTitle.smali}
        invoke-virtual { v1 }, ${api.finish.smali}
        invoke-virtual { p0, v1 }, ${api.addPreference.smali}
        const-string v2, "fakh_page:"
        const-string v3, "Fakh Patches"
        const/4 v4, 0x0
        move-object v0, v4
        invoke-static { v1, v2, v3, v4, v0 }, $SETTINGS_FRAGMENT->fakhRow($OBJECT$STRING$STRING$CHAR_SEQUENCE$OBJECT)V
        return-void
    """,
)

/**
 * Has the screen ask the extension, once its empty preference screen exists, whether it is a Fakh Patches page. The
 * extension then fills the screen, which is shown without any of GitHub's rows.
 */
private fun MutableMethod.showPages(api: PreferenceApi) {
    val instructions = body
    val createdAt = instructions.indexOfFirst {
        it.opcode == Opcode.NEW_INSTANCE && it.typeReference == PREFERENCE_SCREEN
    }
    val screen = api.screenRegister
    // The call that attaches the new screen to the preference manager.
    val attachAt = (createdAt + 1 until instructions.size).firstOrNull { index ->
        val call = instructions[index].method
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL && call?.definingClass == PREFERENCE &&
            call.parameterTypes.size == 1 && (instructions[index] as FiveRegisterInstruction).registerC == screen
    } ?: throw PatchException("Attaching the preference screen not found")
    val show = instructions.mapNotNull { it.method }.lastOrNull {
        it.parameterTypes.map(CharSequence::toString) == listOf(PREFERENCE_SCREEN)
    } ?: throw PatchException("setPreferenceScreen not found")
    // The instruction after it creates an object, so its register is free here.
    val next = instructions[attachAt + 1]
    val free = (next as? OneRegisterInstruction)?.registerA
    if (next.opcode != Opcode.NEW_INSTANCE || free == null || free == screen || free > 15) {
        throw PatchException("No free register after the preference screen")
    }
    addInstructionsWithLabels(
        attachAt + 1,
        """
            iget-object v$free, v$screen, ${api.context.smali}
            invoke-static { v$screen, v$free }, $PATCH_MENU->build($OBJECT$CONTEXT)Z
            move-result v$free
            if-eqz v$free, :app
            invoke-virtual { p0, v$screen }, ${show.smali}
            return-void
        """,
        ExternalLabel("app", getInstruction(attachAt + 1)),
    )
}

/** Puts the page's title on the toolbar of a Fakh Patches page, where the screen sets its own. */
private fun titlePages(settings: MutableClass, context: MethodReference) {
    val toolbar = listOf(TOOLBAR_FRAGMENT, STRING)
    val method = settings.methods.singleOrNull { candidate ->
        candidate.parameterTypes.size == 2 &&
            candidate.implementation?.instructions?.any {
                it.opcode == Opcode.INVOKE_STATIC && it.method?.parameterTypes?.map(CharSequence::toString) == toolbar
            } == true
    } ?: throw PatchException("The settings toolbar title not found")
    val at = method.body.indexOfFirst {
        it.opcode == Opcode.INVOKE_STATIC && it.method?.parameterTypes?.map(CharSequence::toString) == toolbar
    }
    val title = (method.body[at] as FiveRegisterInstruction).registerD
    // v0 holds nothing yet this early in the method.
    if (title == 0 || method.body.take(at).any { it.opcode.setsRegister() && (it as OneRegisterInstruction).registerA == 0 }) {
        throw PatchException("No free register before the settings title")
    }
    method.addInstructions(
        at,
        """
            invoke-virtual { p0 }, $SETTINGS_FRAGMENT->${context.name}()$CONTEXT
            move-result-object v0
            invoke-static { v0, v$title }, $PATCH_MENU->title($CONTEXT$STRING)$STRING
            move-result-object v$title
        """,
    )
}

/**
 * The Fakh Patches entry of GitHub's Settings and the pages behind it, shared by every patch with a switch: this patch
 * builds the card, the pages and the click listener of their rows, and each patch registers its own switches.
 */
internal val githubSettingsPatch = patch {
    extendWith("extensions/extension.mpe")
    dependsOn(featuresPatch)

    execute {
        // The switches are GitHub's own preferences, which save themselves in its settings file.
        useStore("settings_preferences")
        val settings = mutableClassDefBy(SETTINGS_FRAGMENT)
        // onCreatePreferences, which builds the preference screen; other methods look the Theme row up by its key.
        val build = settings.methods.first { method ->
            val instructions = method.implementation?.instructions?.toList().orEmpty()
            instructions.any { ((it as? Instruction21c)?.reference as? StringReference)?.string == "key_dark_mode" } &&
                instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == PREFERENCE_SCREEN }
        }
        val api = preferenceApi(build)
        // The fragment's own context getter, the first call of the screen that returns one.
        val context = build.body.firstNotNullOfOrNull {
            it.method?.takeIf { call -> call.parameterTypes.isEmpty() && call.returnType == CONTEXT }
        } ?: throw PatchException("The settings context getter not found")

        addRowHelper(api)
        addHeaderHelper(api)
        addCardHelper(api)
        // From the end of the method to its start, so the places found above stay where they are. The General category
        // is on the screen at the first, so the new card lands right after it.
        build.addInstructions(
            api.themeAddedAt + 1,
            "invoke-static/range { v${api.screenRegister} .. v${api.screenRegister} }, " +
                "$SETTINGS_FRAGMENT->fakhAddPatchesSection($PREFERENCE_GROUP)V",
        )
        build.showPages(api)
        titlePages(settings, context)

        // The rows' click listener implements the renamed listener interface. Preferences run it after a switch has
        // toggled and saved itself.
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
                            iget-object v1, p0, $SETTINGS_ENTRY->key:$STRING
                            invoke-static { v0, v1, p1 }, $EXTENSION->toggled(${CONTEXT}${STRING}$OBJECT)V
                            return-void
                        """,
                    )
                },
            )
        }
        addChoiceSheets(api, build)
    }
}

private const val STRING = "Ljava/lang/String;"

private const val OBJECT = "Ljava/lang/Object;"

private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"

private const val PREFERENCE_SCREEN = "Landroidx/preference/PreferenceScreen;"

/**
 * Lets the extension open its own sheets from the Fakh Patches rows and set the summary of a row. The extension is told
 * the Settings fragment that is being built; SettingsFragment gets a static helper that sets a row's summary, as the
 * preference API is renamed.
 */
private fun addChoiceSheets(api: PreferenceApi, build: MutableMethod) {
    addHelper(
        "fakhSummary",
        listOf(OBJECT, STRING),
        2,
        """
            check-cast p0, $PREFERENCE
            invoke-virtual { p0, p1 }, ${api.setSummary.smali}
            return-void
        """,
    )
    build.addInstructions(0, "invoke-static/range { p0 .. p0 }, $EXTENSION->settings($OBJECT)V")
}
