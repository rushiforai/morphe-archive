package app.fakh.patches.smartlife

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** The Settings group above About that holds the Fakh Patches row. */
private const val GROUP = "fakh_settings_group"

/** The cell type of the Fakh Patches row, made from the About row's cell, which opens the switches' page. */
private const val ROW = "fakh_patches"

/** The page with the switches, from the extension. */
private const val PAGE = "app.fakh.extension.smartlife.FakhPatchesActivity"

/** The asset that lists the switches of the patches in the app, in the order the page shows them. */
private const val SWITCHES = "assets/fakh_switches.txt"

/** The switches in the order the page shows them, which groups them by where they act. */
private val ORDER = listOf(
    // Home
    "fakh_hide_plus", "fakh_hide_recommended", "fakh_hide_ai_bar",
    // Navigation bar
    "fakh_hide_explore", "fakh_hide_mall_tab",
    // Me tab
    "fakh_hide_rewards", "fakh_hide_orders", "fakh_hide_ai_web", "fakh_hide_me_banner", "fakh_hide_app_mall",
    // Appearance
    "fakh_liquid_glass", "fakh_dark_panels",
    // Ads
    "fakh_hide_ads",
)

private const val ABOUT_ENTRY =
    """{"name":"personal_setting_about","type":1,"clazz":"com.thingclips.smart.personal.setting.plug.cell.AboutCell"}"""

/**
 * Lists the switch [key] on the Fakh Patches page, and the first time adds that page: a Fakh Patches row in its own
 * group above About, made from the About row's cell, and the page's activity in the manifest.
 */
internal fun ResourcePatchContext.addSettingsSwitch(key: String) {
    val switches = get(SWITCHES)
    val listed = if (switches.exists()) switches.readLines().filter(String::isNotBlank) else emptyList()
    switches.writeText((listed + key).distinct().sortedBy(ORDER::indexOf).joinToString("\n"))
    if (listed.isNotEmpty()) return

    val cells = get("assets/thingarchercell_config.json")
    val cellsText = cells.readText()
    if (ABOUT_ENTRY !in cellsText) throw PatchException("Smart Life: the About cell was not found in thingarchercell_config.json")
    cells.writeText(cellsText.replace(ABOUT_ENTRY, "$ABOUT_ENTRY,${ABOUT_ENTRY.replace("personal_setting_about", ROW)}"))

    val settings = get("assets/personal_setting_config_list.json")
    val text = settings.readText()
    val about = Regex("""\{\s*"name"\s*:\s*"personal_setting_private_group"""").find(text)
        ?: throw PatchException("Smart Life: the About group was not found in personal_setting_config_list.json")
    settings.writeText(text.replaceRange(about.range, """{"name":"$GROUP","items":[{"cellType":"$ROW"}]}, ${about.value}"""))

    document("AndroidManifest.xml").use { manifest ->
        val activity = manifest.createElement("activity")
        activity.setAttribute("android:name", PAGE)
        activity.setAttribute("android:exported", "false")
        activity.setAttribute("android:theme", "@style/Default_Public_Theme")
        manifest.getElementsByTagName("application").item(0).appendChild(activity)
    }
}

private const val ABOUT_CELL = "Lcom/thingclips/smart/personal/setting/plug/cell/AboutCell;"

/**
 * `AboutCell` binding its row: its one other method with a single parameter, the view holder. R8 renames the method
 * and the view holder's class, differently in each app.
 */
private object AboutCellBindFingerprint : Fingerprint(
    definingClass = ABOUT_CELL,
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.size == 1 && method.name != "<init>" },
)

/** Turns the extra About row in Settings into the Fakh Patches row. */
internal val settingsSwitchesPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        AboutCellBindFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            if (returns.isEmpty()) throw PatchException("Smart Life: AboutCell.$name has no return")
            // From the last return up, so the earlier indexes stay valid. p0 and p1 are only read.
            returns.reversed().forEach {
                addInstructions(it.index, "invoke-static { p0, p1 }, Lapp/fakh/extension/smartlife/Switches;->bound(Ljava/lang/Object;Ljava/lang/Object;)V")
            }
        }
    }
}

/** A patch that lists the switch [key] on the Fakh Patches page in Settings. */
internal fun switchRow(key: String) = resourcePatch {
    execute {
        addSettingsSwitch(key)
    }
}

/** Smali that asks the extension whether the switch [key] is on, into [register]. */
internal fun switchOn(key: String, register: String) = """
    const-string $register, "$key"
    invoke-static { $register }, Lapp/fakh/extension/smartlife/Switches;->on(Ljava/lang/String;)Z
    move-result $register
"""

/**
 * Runs [smali] at the start of this method while the switch [key] is on, and the method as it was while it is off.
 * The check needs a register the method's own code doesn't read before writing: a local one when there is any, else
 * the last parameter when the method writes it before ever reading it. [smali] gets it as `v0`.
 */
internal fun MutableMethod.whenSwitchOn(key: String, smali: String) {
    val implementation = implementation!!
    val parameters = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2L else 1L }.toInt() +
        if (accessFlags and 0x8 == 0) 1 else 0
    val register = if (implementation.registerCount > parameters) 0 else (implementation.registerCount - 1).takeIf { last ->
        val first = implementation.instructions.firstOrNull { last in it.registers() }
        // The first instruction that touches it writes it, and reads nothing from it.
        first is OneRegisterInstruction && first.opcode.setsRegister() && first.registerA == last &&
            first.registers().drop(1).none { it == last }
    } ?: throw PatchException("Smart Life: $definingClass->$name has no free register")
    addInstructionsWithLabels(
        0,
        """
            ${switchOn(key, "v$register")}
            if-eqz v$register, :off
            ${smali.replace("v0", "v$register")}
        """,
        ExternalLabel("off", getInstruction(0)),
    )
}

/** The registers [this] instruction reads or writes. */
private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}
