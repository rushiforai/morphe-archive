/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.Feature
import app.fakh.patches.shared.featuresPatch
import app.fakh.patches.shared.register
import app.fakh.patches.shared.useStore
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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
internal val githubSettingsPatch = patch {
    extendWith("extensions/extension.mpe")
    dependsOn(featuresPatch)

    execute {
        // The switches are GitHub's own preferences, which save themselves in its settings file.
        useStore("settings_preferences")
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

private const val STRING = "Ljava/lang/String;"

/**
 * Lets the extension open its own sheets from the Fakh Patches rows and set the summary of a row. The extension is told
 * the Settings fragment that is being built; SettingsFragment gets a static helper that sets a row's summary, as the
 * preference API is renamed.
 */
private fun addChoiceSheets(api: PreferenceApi, build: MutableMethod) {
    mutableClassDefBy(SETTINGS_FRAGMENT).methods.add(
        ImmutableMethod(
            SETTINGS_FRAGMENT,
            "fakhSummary",
            listOf("Ljava/lang/Object;", STRING).map { ImmutableMethodParameter(it, null, null) },
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    check-cast p0, $PREFERENCE
                    invoke-virtual { p0, p1 }, ${api.setSummary.smali}
                    return-void
                """,
            )
        },
    )
    build.addInstructions(0, "invoke-static/range { p0 .. p0 }, $EXTENSION->settings(Ljava/lang/Object;)V")
}

/** Registers [feature] and adds its switch to the Fakh Patches section; run after [githubSettingsPatch] has built it. */
internal fun addSwitch(feature: Feature) {
    register(feature)
    addRow(feature.id, feature.title, feature.default, feature.description.ifEmpty { null })
}

/**
 * Adds a row to the Fakh Patches section; run after [githubSettingsPatch] has built it. A null [default] makes a
 * plain row that only reports its click, such as one that opens a sheet.
 */
internal fun addRow(key: String, title: String, default: Boolean? = null, summary: String? = null) {
    val api = switchApi ?: throw PatchException("The Fakh Patches section is not built yet")
    val section = mutableClassDefBy(SETTINGS_FRAGMENT).methods.first { it.name == "fakhAddPatchesSection" }
    section.addInstructions(section.implementation!!.instructions.count() - 1, row(api, key, title, default, summary))
}
