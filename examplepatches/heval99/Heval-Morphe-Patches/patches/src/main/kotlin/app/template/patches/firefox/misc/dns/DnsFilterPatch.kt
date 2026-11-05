package app.template.patches.firefox.misc.dns

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.firefox.shared.SETTINGS
import app.template.patches.firefox.shared.concreteMethod
import app.template.patches.firefox.shared.fieldRef
import app.template.patches.firefox.shared.insns
import app.template.patches.firefox.shared.methodRef
import app.template.patches.firefox.shared.moveResultRegister
import app.template.patches.firefox.shared.readClass
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.dns.DNS_FILTER_DESCRIPTION
import app.template.patches.shared.misc.dns.DNS_FILTER_PATCH_NAME
import app.template.patches.shared.misc.dns.dnsFilterOptions
import app.template.patches.shared.misc.dns.forceGeckoViewDns
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val DOH_SETTINGS_MODE = "Lmozilla/components/concept/engine/Engine\$DohSettingsMode;"
private const val SETTINGS_FRAGMENT = "Lorg/mozilla/fenix/settings/SettingsFragment;"
private const val PREFERENCE = "Landroidx/preference/Preference;"
private const val SHOW_DOH_ENTRY_POINT = "showDohEntryPoint\$delegate"

// How far after the delegate read the setVisible(Z) call may sit (KProperty load, getValue,
// check-cast, booleanValue, move-result).
private const val SET_VISIBLE_WINDOW = 10

@Suppress("unused")
val dnsFilterPatch = bytecodePatch(
    name = DNS_FILTER_PATCH_NAME,
    description = DNS_FILTER_DESCRIPTION,
    default = false,
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    val options = dnsFilterOptions()

    execute {
        val url = options.url
        val strict = options.strict

        // ── 1. GeckoView: the TRR mode, resolver and exceptions are pinned (shared with Focus).
        forceGeckoViewDns(url, strict)

        // ── 2. Settings.getDohSettingsMode(): the stored choice reads as Max (TRR only) or Increased
        //  (TRR first) protection, so the engine settings and everything else Fenix derives from
        //  it agree with what Gecko really does.
        val level = if (strict) "MAX" else "INCREASED"
        val dohModes = readClass(DOH_SETTINGS_MODE)
        if (dohModes.fields.none { it.name == level && it.type == DOH_SETTINGS_MODE }) {
            throw PatchException("$DOH_SETTINGS_MODE has no $level")
        }
        val getMode = concreteMethod(SETTINGS, "getDohSettingsMode", emptyList())
        if (getMode.returnType != DOH_SETTINGS_MODE) {
            throw PatchException("$SETTINGS->getDohSettingsMode() returns ${getMode.returnType}")
        }
        getMode.addInstructionsChecked(
            0,
            """
                sget-object v0, $DOH_SETTINGS_MODE->$level:$DOH_SETTINGS_MODE
                return-object v0
            """,
        )

        // ── 3. Settings screen: the "DNS over HTTPS" entry is hidden. onResume sets its visibility
        //  from Settings.showDohEntryPoint; the boolean it passes to setVisible is forced false
        //  (the preference stays in the screen, so nothing that looks it up breaks).
        val onResume = concreteMethod(SETTINGS_FRAGMENT, "onResume", emptyList())
        val insns = onResume.insns()
        val reads = insns.indices.filter { i ->
            insns[i].opcode == Opcode.IGET_OBJECT &&
                insns[i].fieldRef()?.let { it.definingClass == SETTINGS && it.name == SHOW_DOH_ENTRY_POINT } == true
        }
        val read = reads.singleOrNull()
            ?: throw PatchException("$SETTINGS_FRAGMENT->onResume: expected one $SHOW_DOH_ENTRY_POINT read, found ${reads.size}")
        val setVisible = (read + 1..minOf(read + SET_VISIBLE_WINDOW, insns.lastIndex)).firstOrNull { i ->
            insns[i].methodRef()?.let { it.name == "setVisible" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") } == true
        } ?: throw PatchException("$SETTINGS_FRAGMENT->onResume: no setVisible(Z) after the $SHOW_DOH_ENTRY_POINT read")
        val owner = insns[setVisible].methodRef()!!.definingClass
        if (owner != PREFERENCE) throw PatchException("$SETTINGS_FRAGMENT->onResume: setVisible is on $owner, not $PREFERENCE")
        val visible = onResume.moveResultRegister(setVisible - 1)
        if ((insns[setVisible] as FiveRegisterInstruction).registerD != visible) {
            throw PatchException("$SETTINGS_FRAGMENT->onResume: setVisible does not take the $SHOW_DOH_ENTRY_POINT value")
        }
        onResume.requireNoBranchTargetAt(setVisible, "DoH entry visibility")
        onResume.addInstructionChecked(setVisible, if (visible < 16) "const/4 v$visible, 0x0" else "const/16 v$visible, 0x0")
    }
}
