package io.github.jordanwoodson.patches.rumble.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.rumble.shared.clickableCall
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.rumble.shared.staticRangeCalls
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.apps.RUMBLE
import io.github.jordanwoodson.patches.shared.apps.lurkSettings
import io.github.jordanwoodson.patches.shared.settings.SETTINGS_CLASS

private const val STRING = "Ljava/lang/String;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

/** The Rumble entries on the Lurk settings screen. Each patch that can be switched adds its own. */
internal val rumbleSettings = RUMBLE.settings

/**
 * The Lurk settings screen, opened from a "Lurk" row in Rumble's Settings (App Info), the launcher shortcut or
 * the app settings link on Android's App info page. Every patch that can be switched on and off at runtime
 * depends on this one.
 */
val settingsPatch = bytecodePatch(
    description = "Adds Lurk to Rumble's settings, where the other patches can be turned off and on.",
) {
    lurkSettings(RUMBLE) { addLurkRow() }
}

/**
 * Adds a "Lurk" row after Send Feedback. App Info draws each row with
 * RowItemWithArrowView(Modifier.clickable(onClick), text, value, showArrow); the new row is drawn the
 * same way by a method added next to the section, with the extension's onClick.
 */
private fun BytecodePatchContext.addLurkRow() {
    val match = AppInfoSectionFingerprint.single("App Info settings section")
    val section = match.method
    val instructions = section.implementation!!.instructions.toList()

    val calls = section.staticRangeCalls()
    fun MethodReference.parameters() = parameterTypes.map { it.toString() }

    // (modifier, text, value, showArrow, composer, $changed, $default): Data Consent, Credits, Send Feedback.
    val rows = calls.filter { (_, method) ->
        val parameters = method.parameters()
        method.returnType == "V" && parameters.size == 7 && parameters[1] == STRING && parameters[2] == STRING &&
            parameters[3] == "Z" && parameters[5] == "I" && parameters[6] == "I"
    }
    val row = rows.map { it.second.toString() }.distinct().singleOrNull()
    if (row == null || rows.size != 3) {
        throw PatchException("Rumble: expected three rows from one composable in App Info, found ${rows.size}")
    }
    Locators.record("rumble.settings.app_info_section", section)
    Locators.record("rumble.settings.row", rows.first().second)
    val rowParameters = rows.first().second.parameters()
    val modifier = rowParameters[0]
    val composer = rowParameters[4]

    val clickable = section.clickableCall(modifier)
    // Modifier (the companion the rows start from).
    val modifierCompanion = instructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
        ((instruction as ReferenceInstruction).reference as FieldReference).takeIf { it.definingClass == modifier }
    } ?: throw PatchException("Rumble: no Modifier companion in App Info")

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
            // The same arguments as Rumble's rows: clickable with only onClick given (mask 0xf), then the
            // row with its value left at the default (mask 0x4) and the arrow shown.
            addInstructions(
                0,
                """
                    sget-object v0, $modifierCompanion
                    const/4 v1, 0x0
                    const/4 v2, 0x0
                    const/4 v3, 0x0
                    const/4 v4, 0x0
                    invoke-static { }, $SETTINGS_CLASS->openAction()Ljava/lang/Object;
                    move-result-object v5
                    check-cast v5, $FUNCTION0
                    const/16 v6, 0xf
                    const/4 v7, 0x0
                    invoke-static/range { v0 .. v7 }, $clickable
                    move-result-object v0
                    const-string v1, "Lurk"
                    const/4 v2, 0x0
                    const/4 v3, 0x1
                    move-object v4, p0
                    const/16 v5, 0xc00
                    const/4 v6, 0x4
                    invoke-static/range { v0 .. v6 }, $row
                    return-void
                """,
            )
        },
    )

    val (sendFeedback, _) = rows.last()
    val composerRegister = (instructions[sendFeedback] as RegisterRangeInstruction).startRegister + 4
    section.addInstruction(
        sendFeedback + 1,
        "invoke-static/range { v$composerRegister .. v$composerRegister }, " +
            "${section.definingClass}->$rowMethod($composer)V",
    )
}
