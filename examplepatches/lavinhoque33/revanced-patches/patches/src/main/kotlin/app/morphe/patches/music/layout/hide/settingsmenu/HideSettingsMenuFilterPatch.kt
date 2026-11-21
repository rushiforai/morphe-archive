/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2029
 *
 * Portions of this file are modified by anddea:
 * Copyright (C) 2026 anddea
 * https://github.com/anddea/revanced-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-20
 */

package app.morphe.patches.music.layout.hide.settingsmenu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.patch.PatchList.SETTINGS_MENU_FILTER
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils.addCustomPreference
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.music.utils.settings.settingsHeadersFragmentRegister
import app.morphe.patches.music.utils.settings.settingsHeadersOnCreatePreferencesMethod
import app.morphe.patches.shared.misc.settingsmenu.PreferenceGroupGetPreferenceFingerprint
import app.morphe.patches.shared.misc.settingsmenu.PreferenceSetTitleFingerprint
import app.morphe.patches.shared.misc.settingsmenu.PreferenceSetVisibleFingerprint
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.cloneMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/SettingsMenuFilterPatch;"

private const val SETTINGS_HEADERS_FRAGMENT_CLASS =
    "Lcom/google/android/apps/youtube/music/settings/fragment/SettingsHeadersFragment;"
private const val GET_SCREEN = "$SETTINGS_HEADERS_FRAGMENT_CLASS->getPreferenceScreen()" +
    "Landroidx/preference/PreferenceScreen;"
private const val GET_CONTEXT = "$SETTINGS_HEADERS_FRAGMENT_CLASS->getContext()Landroid/content/Context;"
private const val ON_TITLE_CHANGED = "$EXTENSION_CLASS->onTitleChanged" +
    "(Ljava/lang/Object;Ljava/lang/CharSequence;)V"
private const val ON_VISIBILITY_CHANGED = "$EXTENSION_CLASS->onVisibilityChanged(Ljava/lang/Object;Z)Z"
private const val FILTER_HEADERS = "$EXTENSION_CLASS->filterHeaders(Ljava/lang/Object;Landroid/content/Context;)V"
private const val PREFERENCE = "Landroidx/preference/Preference;"
private const val PREFERENCE_GROUP = "Landroidx/preference/PreferenceGroup;"

@Suppress("unused")
val hideSettingsMenuFilterPatch = bytecodePatch(
    SETTINGS_MENU_FILTER.title,
    SETTINGS_MENU_FILTER.summary,
) {
    dependsOn(
        settingsPatch,
        sharedExtensionPatch
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        if (!injectMusicSettingsFilter()) {
            printWarn("Could not locate the native Music settings rows; skipping Hide settings menu.")
            return@execute
        }

        addCustomPreference(
            CategoryType.GENERAL.value,
            "morphe_settings_menu_filter_screen",
            "app.morphe.extension.shared.patches.SettingsMenuFilterPickerPreference",
            "",
            true,
            "revanced_change_start_page"
        )

        updatePatchStatus(SETTINGS_MENU_FILTER)
    }
}

private fun BytecodePatchContext.injectMusicSettingsFilter(): Boolean {
    val group = PreferenceGroupGetPreferenceFingerprint.matchOrNull() ?: return false
    val keyLookup = MusicPreferenceFindByKeyFingerprint.matchOrNull() ?: return false
    val title = PreferenceSetTitleFingerprint.matchOrNull() ?: return false
    val visibility = PreferenceSetVisibleFingerprint.matchOrNull() ?: return false

    val listField = group.instructionMatches.last().fieldReference
    // findPreference compares this field against its key parameter; other String fields are not keys.
    val keyField = keyLookup.instructionMatches.first().fieldReference
    val visibilityField = visibility.instructionMatches.first().fieldReference
    val titleField = title.method.implementation!!.instructions
        .filter { it.opcode == Opcode.IPUT_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .singleOrNull { it.definingClass == PREFERENCE && it.type == "Ljava/lang/CharSequence;" }
        ?: return false

    if (!AccessFlags.PUBLIC.isSet(visibility.method.accessFlags) ||
        !group.classDef.hasPublicField(listField) ||
        listOf(keyField, titleField, visibilityField).any { !title.classDef.hasPublicField(it) }
    ) {
        return false
    }

    val extension = mutableClassDefBy(EXTENSION_CLASS)
    extension.implementBridge(
        "nativeChildren", 2,
        """
            instance-of v0, p0, $PREFERENCE_GROUP
            if-eqz v0, :not_group
            check-cast p0, $PREFERENCE_GROUP
            iget-object v0, p0, $listField
            return-object v0
            :not_group
            const/4 v0, 0x0
            return-object v0
        """,
    )
    extension.implementBridge("nativeKey", 1, preferenceFieldRead(keyField))
    extension.implementBridge("nativeTitle", 1, preferenceFieldRead(titleField))
    extension.implementBridge("nativeVisible", 1, preferenceFieldRead(visibilityField))
    extension.implementBridge(
        "nativeSetVisible", 2,
        """
            check-cast p0, $PREFERENCE
            invoke-virtual { p0, p1 }, ${visibility.method}
            return-void
        """,
    )

    title.method.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $ON_TITLE_CHANGED
        """.trimIndent(),
    )
    visibility.method.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $ON_VISIBILITY_CHANGED
            move-result p1
        """.trimIndent(),
    )

    // Music 6.20 has two returns after inflation; some newer versions branch to a single return.
    settingsHeadersOnCreatePreferencesMethod.apply {
        val fragment = settingsHeadersFragmentRegister
        val exits = implementation!!.instructions.indices.filter {
            implementation!!.instructions[it].opcode == Opcode.RETURN_VOID
        }
        for (index in exits.asReversed()) {
            addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-virtual/range { v$fragment .. v$fragment }, $GET_SCREEN
                    move-result-object v0
                    if-eqz v0, :ignore
                    invoke-virtual/range { v$fragment .. v$fragment }, $GET_CONTEXT
                    move-result-object v1
                    invoke-static { v0, v1 }, $FILTER_HEADERS
                    :ignore
                    nop
                """.trimIndent(),
            )
        }
    }
    return true
}

private fun ClassDef.hasPublicField(reference: FieldReference) = fields.any {
    it.name == reference.name && it.type == reference.type && AccessFlags.PUBLIC.isSet(it.accessFlags)
}

private fun MutableClass.implementBridge(name: String, registers: Int, instructions: String) {
    val original = methods.single { it.name == name }
    val bridge = original.cloneMutable(registerCount = registers, clearImplementation = true)

    bridge.addInstructionsWithLabels(0, instructions.trimIndent())
    methods.remove(original)
    methods.add(bridge)
}

private fun preferenceFieldRead(field: FieldReference): String {
    val opcode = if (field.type == "Z") "iget-boolean" else "iget-object"
    val returns = if (field.type == "Z") "return" else "return-object"
    return """
        check-cast p0, $PREFERENCE
        $opcode p0, p0, $field
        $returns p0
    """
}
