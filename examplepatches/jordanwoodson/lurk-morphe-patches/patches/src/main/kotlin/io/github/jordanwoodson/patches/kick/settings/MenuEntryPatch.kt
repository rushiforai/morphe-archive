package io.github.jordanwoodson.patches.kick.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.HermesBundle
import io.github.jordanwoodson.patches.kick.shared.HermesOp.CALL2
import io.github.jordanwoodson.patches.kick.shared.HermesOp.JMP_FALSE
import io.github.jordanwoodson.patches.kick.shared.HermesOp.LOAD_CONST_STRING
import io.github.jordanwoodson.patches.kick.shared.HermesOp.LOAD_CONST_STRING_LONG_INDEX
import io.github.jordanwoodson.patches.kick.shared.HermesOp.MOV
import io.github.jordanwoodson.patches.kick.shared.HermesOp.NEW_OBJECT_WITH_BUFFER
import io.github.jordanwoodson.patches.kick.shared.HermesOp.NEW_OBJECT_WITH_BUFFER_LONG
import io.github.jordanwoodson.patches.kick.shared.HermesOp.PUT_OWN_BY_SLOT_IDX
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.requireLowParameterRegisters
import io.github.jordanwoodson.patches.shared.settings.SETTINGS_CLASS
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "lurk_menu_entry"

/** The link the Lurk row opens; Settings.openLink in the extension answers it. */
private const val LINK = "lurk://settings"

@Suppress("unused")
val lurkMenuEntryPatch = bytecodePatch(
    name = "Lurk in account menu",
    description = "Adds a Lurk row to Kick's account menu (tap your profile picture while signed in), which opens " +
        "Lurk settings. Pause Lurk leaves it on. Turn it off in Lurk settings > Advanced." + OTA_UPDATES_OFF,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch, kickHermesPatch)

    execute {
        kickHermes.addLurkRow()

        // The row's link reaches Linking.openURL, which would hand it to Android; Lurk's opens the settings instead.
        val openUrl = OpenUrlFingerprint.kickMatch("Linking.openURL").method
        Locators.record("kick.lurk_menu_entry.open_url", openUrl)
        openUrl.requireLowParameterRegisters("Lurk in account menu")
        if (openUrl.implementation!!.registerCount - 3 < 1) throw PatchException("Kick: openURL has no local register")
        openUrl.addInstructionsWithLabels(
            0,
            """
                ${invokeStatic("$SETTINGS_CLASS->openLink(Ljava/lang/String;)Z", openUrl.parameterRegister(1))}
                move-result v0
                if-eqz v0, :lurk_original
                const/4 v0, 0x1
                invoke-static { v0 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v0
                invoke-interface { p2, v0 }, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """,
            ExternalLabel("lurk_original", openUrl.getInstruction(0)),
        )

        kickSettings.add(
            SwitchSetting(
                KEY,
                "Lurk in account menu",
                "A Lurk row in Kick's account menu opens this screen.",
                Section.ADVANCED,
                restart = true,
                keepWhenPaused = true,
            ),
        )
    }
}

/**
 * Kick's account menu (AccountScreen) ends its list with a Developer settings row that only Kick staff see:
 * AccountMenuItem {href: '/dev-settings', icon, label: t('account.items.settings.message'), testID, gaEvent}
 * behind a check of the account's roles. The edits make that row the Lurk row, all equal-length:
 *
 * - the role check's JmpFalse becomes a Mov of the tested register onto itself, so the row is always drawn;
 * - the label's t(key) call becomes a load of the row's testID string, which reads "Lurk";
 * - the href's string ID in the literal buffer becomes that of a string reading "lurk://settings", which
 *   expo-router's Link sends to Linking.openURL as an external link.
 *
 * Hermes has no string to spare, so two strings only these places use are rewritten in the string table: the
 * row's own testID ('Account-Menu-Dev-Settings', 25 bytes, to "Lurk") and the "Enter valid JSON." message of the
 * developer feature-flag screen, which only the replaced row opened (to "lurk://settings").
 */
private fun HermesBundle.addLurkRow() {
    val screen = function("AccountScreen")
    val instructions = instructions(screen)
    val items = literals.filter { it.function.offset == screen.offset && it.keys == ROW_KEYS }
    val row = items.singleOrNull { literal ->
        literalValues(literal).first().let { it.type in STRING_TYPES && string(it.value.toInt()) == "/dev-settings" }
    } ?: throw PatchException("Kick Hermes: expected one developer settings row in the account menu")
    val values = literalValues(row)
    val href = values[0]
    val testId = values[3]
    if (href.type != LONG_STRING || testId.type !in STRING_TYPES) {
        throw PatchException("Kick Hermes: unexpected developer settings row values")
    }
    val create = instructions.indexOfFirst { it.offset == row.instruction.offset }

    // The role check: the one JmpFalse in the few instructions before the row (Fragment, jsx, AccountMenuItem),
    // jumping past it.
    val guards = (maxOf(0, create - 12) until create).filter { instructions[it].opcode == JMP_FALSE }
    val guard = guards.singleOrNull()?.let { instructions[it] }
        ?: throw PatchException("Kick Hermes: expected one role check before the developer settings row")
    if (guard.target()!! <= row.instruction.offset) throw PatchException("Kick Hermes: the role check doesn't skip the row")
    val tested = guard.bytes[2]
    replaceInstruction(screen, KEY, guard, byteArrayOf(MOV.toByte(), tested, tested))

    // label: LoadConstString rL, key; Call2 rL, t, this, rL; PutOwnBySlotIdx row, rL, 2.
    val load = instructions[create + 1]
    val call = instructions[create + 2]
    val put = instructions[create + 3]
    val register = load.u8(1)
    if (load.opcode != LOAD_CONST_STRING || string(load.u16(2)) != "account.items.settings.message" ||
        call.opcode != CALL2 || call.u8(1) != register || call.u8(4) != register ||
        put.opcode != PUT_OWN_BY_SLOT_IDX || put.u8(1) != row.instruction.u8(1) || put.u8(2) != register || put.u8(3) != 2) {
        throw PatchException("Kick Hermes: unexpected developer settings row label")
    }
    val label = testId.value.toInt()
    replaceInstructions(screen, KEY, listOf(load, call), byteArrayOf(
        LOAD_CONST_STRING_LONG_INDEX.toByte(), register.toByte(),
        label.toByte(), (label ushr 8).toByte(), (label ushr 16).toByte(), (label ushr 24).toByte(),
        MOV.toByte(), register.toByte(), register.toByte(),
    ))
    rewriteString(label, "Lurk", KEY, loads = emptyList(), readers = listOf(row))

    // One load: the value check of the developer feature-flag screen (a helper the compiler hoisted out of it).
    val link = stringId(SPARE_STRING)
    val developerFlags = stringLoads(link)
    if (developerFlags.size != 1) {
        throw PatchException("Kick Hermes: \"$SPARE_STRING\" is loaded ${developerFlags.size} times, expected once")
    }
    rewriteString(link, LINK, KEY, loads = developerFlags, readers = emptyList())
    dataSwitch(href.offset, KEY, literal(href.offset, 4), byteArrayOf(
        link.toByte(), (link ushr 8).toByte(), (link ushr 16).toByte(), (link ushr 24).toByte(),
    ), readers = listOf(row))
}

private val ROW_KEYS = listOf("href", "icon", "label", "testID", "gaEvent")
private const val LONG_STRING = 4
private val STRING_TYPES = setOf(LONG_STRING, 5)

/** A string only the developer feature-flag screen uses, long enough for [LINK]; see addLurkRow. */
private const val SPARE_STRING = "Enter valid JSON."
