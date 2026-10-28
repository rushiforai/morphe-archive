package io.github.jordanwoodson.patches.twitch.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.apps.TWITCH
import io.github.jordanwoodson.patches.shared.apps.lurkSettings
import io.github.jordanwoodson.patches.shared.apps.reactNativeBundleLoader
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.SETTINGS_CLASS
import io.github.jordanwoodson.patches.twitch.shared.addInstruction
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

internal val twitchSettings = TWITCH.settings
internal const val TWITCH_BUNDLE = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchBundle;"
private const val SETTINGS_ROW = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchSettingsRow;"
private const val STRING = "Ljava/lang/String;"

internal val twitchSettingsPatch = bytecodePatch(
    description = "Adds Lurk settings to Twitch: a Lurk row in Twitch's own Settings, the Lurk settings " +
        "launcher shortcut and the app settings link on Android's App info page.",
) {
    lurkSettings(TWITCH) {
        addComposeRow()
        addListRow()
    }
}

/** Only Hermes consumers need this hook. Native-only patch combinations never read a manifest. */
internal val twitchBundleLoaderPatch = bytecodePatch {
    reactNativeBundleLoader(TWITCH, twitchSettingsPatch)
}

/**
 * Twitch's main Settings screen comes in two versions, and the settings activity picks one when it opens:
 * signed in, or signed out outside an experiment, the Compose version (MainSettingsFragmentV2); signed out in
 * the experiment, the list version (MainSettingsFragment). Each gets a "Lurk" row after Privacy Notice.
 *
 * The Compose version draws the section's rows with row(title, description, onClick, icon, ?, composer,
 * $changed, $default). The Lurk row is drawn the same way by a method added next to the section, with the
 * ghost icon and an onClick from the extension (Twitch's R8 renamed Kotlin's Function0, so the extension
 * implements the type the row takes).
 */
private fun BytecodePatchContext.addComposeRow() {
    val match = SettingsAboutSectionFingerprint.twitchMatch("Settings section with Privacy Notice")
    val section = match.method
    val instructions = section.implementation!!.instructions.toList()
    fun rowCall(index: Int) = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference

    // (title, description, onClick, icon, ?, composer, $changed, $default): the first call after the title.
    val privacy = match.instructionMatches.last().index
    val rowIndex = (privacy + 1 until instructions.size).firstOrNull { index ->
        instructions[index].opcode == Opcode.INVOKE_STATIC_RANGE && rowCall(index).let { call ->
            call != null && call.returnType == "V" && call.parameterTypes.map { it.toString() }.let {
                it.size == 8 && it[0] == STRING && it[1] == STRING && it[3] == "I" && it[6] == "I" && it[7] == "I"
            }
        }
    } ?: throw PatchException("Twitch: no Privacy Notice row in the Settings section")
    val row = rowCall(rowIndex)!!
    val rows = instructions.indices.count { rowCall(it) == row }
    if (rows < 5) throw PatchException("Twitch: the Settings section draws $rows rows with its row composable")
    Locators.record("twitch.settings.about_section", section)
    Locators.record("twitch.settings.row", row)
    val function0 = row.parameterTypes[2].toString()
    val composer = row.parameterTypes[5].toString()
    section.requireNotBranchTarget(rowIndex + 1, "the code after the Privacy Notice row")

    val rowMethod = "lurkSettingsRow"
    match.classDef.methods.add(
        ImmutableMethod(
            section.definingClass,
            rowMethod,
            listOf(ImmutableMethodParameter(composer, null, null)),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(9),
        ).toMutable().apply {
            // Like Twitch's own rows: no description and the fifth argument left at their defaults (0x12).
            addInstructions(
                0,
                """
                    const-string v0, "Lurk"
                    const/4 v1, 0x0
                    const-class v2, $function0
                    invoke-static { v2 }, $SETTINGS_CLASS->openAction(Ljava/lang/Class;)Ljava/lang/Object;
                    move-result-object v2
                    check-cast v2, $function0
                    const v3, ${resourceId(ResourceType.DRAWABLE, "ghost")}
                    const/4 v4, 0x0
                    move-object v5, p0
                    const/4 v6, 0x0
                    const/16 v7, 0x12
                    invoke-static/range { v0 .. v7 }, $row
                    return-void
                """,
            )
        },
    )
    val composerRegister = (instructions[rowIndex] as RegisterRangeInstruction).startRegister + 5
    section.addInstruction(
        rowIndex + 1,
        "invoke-static/range { v$composerRegister .. v$composerRegister }, " +
            "${section.definingClass}->$rowMethod($composer)V",
    )
}

/**
 * The list version is a list of menu row models, each naming the settings destination a tap opens. The Lurk
 * row (made by the extension's bridged menuRow) names none, so Twitch's own tap handler would ignore it; the
 * handler first asks the extension, which opens Lurk settings for the Lurk row.
 */
private fun BytecodePatchContext.addListRow() {
    val match = SettingsMenuListFingerprint.twitchMatch("Settings menu list")
    val builder = match.method
    val instructions = builder.implementation!!.instructions.toList()
    val privacy = match.instructionMatches[4].index
    val add = match.instructionMatches[5]
    // The Privacy Notice row: Model(title, description, destination, $default), added to the screen's list.
    val init = (privacy + 1 until add.index).mapNotNull { index ->
        val instruction = instructions[index]
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        call?.takeIf { instruction.opcode == Opcode.INVOKE_DIRECT && it.name == "<init>" }
    }.singleOrNull() ?: throw PatchException("Twitch: no single Privacy Notice row model in the Settings list")
    val rowType = init.definingClass
    val destination = init.parameterTypes.getOrNull(2)?.toString()
        ?: throw PatchException("Twitch: unexpected Settings row model constructor")
    val rowClass = classDefBy(rowType)
    val rowConstructor = "(${STRING}Ljava/lang/CharSequence;$STRING${destination}Z)V"
    if (rowClass.methods.none { it.name == "<init>" && "(${it.parameterTypes.joinToString("")})V" == rowConstructor &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
        throw PatchException("Twitch: the Settings row model has no (title, description, text, destination, tappable)")
    }
    Locators.record("twitch.settings.menu_list", builder)
    Locators.record("twitch.settings.menu_row", rowType)

    val list = (add.instruction as FiveRegisterInstruction).registerC
    builder.requireNotBranchTarget(add.index + 1, "the code after the Privacy Notice row")
    builder.addInstruction(add.index + 1, invokeStatic("$SETTINGS_ROW->addMenuRow(Ljava/util/List;)V", list))

    bridge(
        SETTINGS_ROW,
        "menuRow",
        """
            new-instance v0, $rowType
            move-object v1, p0
            const/4 v2, 0x0
            const/4 v3, 0x0
            const/4 v4, 0x0
            const/4 v5, 0x1
            invoke-direct/range { v0 .. v5 }, $rowType-><init>$rowConstructor
            return-object v0
        """,
        locals = 6,
    )

    // The tap handler: reads the row's destination and hands it to the screen's presenter.
    val tap = Fingerprint(
        returnType = "V",
        parameters = listOf(rowType),
        filters = listOf(
            fieldAccess(definingClass = rowType, type = destination, opcode = Opcode.IGET_OBJECT),
            methodCall(parameters = listOf(destination), returnType = "V", opcode = Opcode.INVOKE_INTERFACE),
        ),
    ).twitchMatch("Settings menu row tap").method
    val free = tap.implementation!!.registerCount - tap.parameterTypes.size - 1
    if (free < 1) throw PatchException("Twitch: the Settings menu row tap has no local register")
    tap.addInstructionsWithLabels(
        0,
        """
            ${invokeStatic("$SETTINGS_ROW->menuRowClicked(Ljava/lang/Object;)Z", tap.parameterRegister(1))}
            move-result v0
            if-eqz v0, :lurk_original
            return-void
        """,
        ExternalLabel("lurk_original", tap.getInstruction(0)),
    )
}
