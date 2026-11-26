/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import app.nyandex.patches.yandexmusic.util.hasStringConstant
import app.nyandex.patches.yandexmusic.util.instructionsList
import app.nyandex.patches.yandexmusic.util.methodReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicNyandexSettings")

internal const val SETTINGS_EXTENSION = "extensions/settings.mpe"
internal const val NYANDEX_SETTINGS_CLASS = "Lapp/nyandex/extension/yandexmusic/settings/NyandexSettings;"
internal const val SETTINGS_ENTRY_CLASS = "Lapp/nyandex/extension/yandexmusic/settings/SettingsEntry;"
internal const val SETTINGS_ACTIVITY = "app.nyandex.extension.yandexmusic.settings.NyandexSettingsActivity"
internal const val SETTINGS_ROW_METHOD = "nyandexSettingsRow"

/** Makes `NyandexSettings.<name>()` return true, so the settings page shows that patch's section. */
internal fun enableSettingsSection(name: String) {
    mutableClassDefBy(NYANDEX_SETTINGS_CLASS).methods
        .single { it.name == name }
        .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}

/**
 * Compose test tags of settings blocks. The row goes on top of the first block found: "Offline and
 * downloads" opens the settings screen; the Collection block is the fallback.
 */
private val TOP_BLOCK_TAGS = listOf("offline_block", "collection_settings_block")

/** The Collection block draws a link row; its composables are reused for the Nyandex row. */
private const val COLLECTION_BLOCK_TAG = "collection_settings_block"

private const val STRING = "Ljava/lang/String;"
private const val INTEGER = "Ljava/lang/Integer;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

val nyandexSettingsPatch = patch(
    name = "Настройки Nyandex",
    description = "Добавляет страницу «Настройки Nyandex», которая открывается новой строкой вверху " +
        "настроек приложения. Там же показываются параметры патчей.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    extendWith(SETTINGS_EXTENSION)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements("application").first().appendChild("activity") {
                setAttribute("android:name", SETTINGS_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:label", "Nyandex")
            }
        }

        addSettingsRow()
    }
}

/** The app's settings composables the Nyandex row is drawn with. */
private class SettingsComposables(
    val composerType: String,
    val header: MethodReference,
    val row: MethodReference,
    val modifier: FieldReference,
    val icon: Int,
)

/**
 * The settings screen is a list of Compose blocks. Each block draws a section header with
 * `header(changed, composer, modifier, title)` and rows such as the link row
 * `row(title, subtitle, onClick, modifier, icon, composer, changed, default)`.
 *
 * A new static helper `nyandexSettingsRow(composer)` in the top block's class draws a "Nyandex"
 * header and a link row that opens the Nyandex settings page, with the app's own composables and
 * its own registers. The top block calls it right before drawing its own header, so the row is
 * the first item of the settings screen. The call only reads the composer register.
 */
private fun addSettingsRow() {
    val composables = findSettingsComposables()

    val (blockType, tag) = TOP_BLOCK_TAGS.firstNotNullOfOrNull { tag ->
        classDefByStrings(tag).singleOrNull()?.let { it.type to tag }
    } ?: throw PatchException("No settings block was found")

    val blockClass = mutableClassDefBy(blockType)
    val block = blockClass.methods.singleOrNull { it.hasStringConstant(tag) }
        ?: throw PatchException("Settings block method for $tag was not found")
    val instructions = block.instructionsList()

    val headerIndex = instructions.indexOfFirst { it.methodReference() == composables.header }
    if (headerIndex < 0) throw PatchException("The $tag settings block draws no section header")
    val composerRegister = (instructions[headerIndex] as FiveRegisterInstruction).registerD

    blockClass.methods.add(createRowHelper(blockType, composables))
    block.addInstructions(
        headerIndex,
        "invoke-static/range {v$composerRegister .. v$composerRegister}, " +
            "$blockType->$SETTINGS_ROW_METHOD(${composables.composerType})V",
    )

    logger.info("Added the Nyandex settings row to $blockType.${block.name} ($tag)")
}

private fun createRowHelper(owner: String, composables: SettingsComposables): MutableMethod {
    val helper = ImmutableMethod(
        owner,
        SETTINGS_ROW_METHOD,
        listOf(ImmutableMethodParameter(composables.composerType, null, null)),
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(9),
    ).toMutable()

    // p0 (v8) is the composer. A new method starts at offset 0, so its own labels are safe.
    helper.addInstructions(
        0,
        """
            invoke-static {}, $SETTINGS_ENTRY_CLASS->header()$STRING
            move-result-object v0
            const/4 v1, 0x0
            const/4 v2, 0x0
            invoke-static {v1, p0, v2, v0}, ${composables.header}
            invoke-static {}, $SETTINGS_ENTRY_CLASS->onClick()Ljava/lang/Object;
            move-result-object v2
            if-eqz v2, :no_row
            check-cast v2, $FUNCTION0
            invoke-static {}, $SETTINGS_ENTRY_CLASS->title()$STRING
            move-result-object v0
            invoke-static {}, $SETTINGS_ENTRY_CLASS->subtitle()$STRING
            move-result-object v1
            sget-object v3, ${composables.modifier}
            const v4, ${composables.icon}
            invoke-static {v4}, $INTEGER->valueOf(I)$INTEGER
            move-result-object v4
            move-object v5, p0
            const/4 v6, 0x0
            const/4 v7, 0x0
            invoke-static/range {v0 .. v7}, ${composables.row}
            :no_row
            return-void
        """,
    )
    return helper
}

/** Resolve the header and link row composables, the empty modifier and the link icon. */
private fun findSettingsComposables(): SettingsComposables {
    val blockClass = classDefByStrings(COLLECTION_BLOCK_TAG).singleOrNull()
        ?: throw PatchException("Settings collection block was not found")
    val method = blockClass.methods.singleOrNull { it.hasStringConstant(COLLECTION_BLOCK_TAG) }
        ?: throw PatchException("Settings collection block method was not found")
    val instructions = method.implementation!!.instructions.toList()

    // The composer is the fourth parameter of a block composable.
    val composerType = method.parameterTypes.getOrNull(3)?.toString()
        ?: throw PatchException("Unexpected settings block signature")

    val header = instructions.firstNotNullOfOrNull { instruction ->
        instruction.methodReference()?.takeIf { reference ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                reference.parameterTypes.map(Any::toString).let {
                    it.size == 4 && it[0] == "I" && it[1] == composerType && it[3] == STRING
                }
        }
    } ?: throw PatchException("Settings section header composable was not found")

    val rowIndex = instructions.indexOfFirst { instruction ->
        instruction.methodReference()?.parameterTypes?.map(Any::toString)?.let {
            it.size == 8 && it[0] == STRING && it[1] == STRING && it[2] == FUNCTION0 &&
                it[4] == INTEGER && it[5] == composerType && it[6] == "I" && it[7] == "I"
        } == true
    }
    if (rowIndex < 0) throw PatchException("Settings link row composable was not found")
    val row = instructions[rowIndex].methodReference()!!
    val modifierType = row.parameterTypes[3].toString()

    // The icon of the existing link row: `const vX, icon` + `Integer.valueOf(vX)` before it.
    val valueOfIndex = (rowIndex - 1 downTo 0).first { index ->
        instructions[index].methodReference()?.let { it.definingClass == INTEGER && it.name == "valueOf" } == true
    }
    val iconRegister = (instructions[valueOfIndex] as FiveRegisterInstruction).registerC
    val icon = (valueOfIndex - 1 downTo 0).firstNotNullOfOrNull { index ->
        val instruction = instructions[index]
        if (instruction is NarrowLiteralInstruction &&
            (instruction as OneRegisterInstruction).registerA == iconRegister
        ) {
            instruction.narrowLiteral
        } else {
            null
        }
    } ?: throw PatchException("Settings row icon was not found")

    // The empty modifier: a singleton object `sget-object Lxpk;->a:Lxpk;` that implements it.
    val modifier = instructions.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
        (instruction as ReferenceInstruction).reference as? FieldReference
    }.firstOrNull { field ->
        field.definingClass == field.type && classDefBy(field.type).interfaces.contains(modifierType)
    } ?: throw PatchException("Empty Compose modifier was not found")

    return SettingsComposables(composerType, header, row, modifier, icon)
}
