package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstStringInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Adds an "AIO Mods" toggle to the app's own settings screens, both forms.
 * No new activity/activity-extension is involved: the app ships a custom
 * phone settings fragment (`er5`, rows built in code via J0/K0 helpers) and
 * a TV guided-step settings fragment (`ua8`, actions built in Q0/T0).
 * Both store prefs in the shared `ka1.j` = getSharedPreferences("settings", 0),
 * so the runtime hooks gated by these keys work on either side.
 *
 * Toggles exposed (values written by the app's own row handlers / guided
 * checkbox, read by the gating patches):
 *  - `morphe_hide_nav_pro`    (phone) hide account/PRO nav drawer links
 *  - `morphe_show_api_errors` (TV)    show the playback "Error occured" popup
 *
 * Both apply on next screen creation, hence the "restart"-style summaries.
 */
// Phone: er5.u0(View, Bundle) builds all setting sections.
object PhoneSettingsFingerprint : Fingerprint(
    definingClass = "Ler5;",
    name = "u0",
    returnType = "V"
)

// TV: ua8.Q0(ArrayList) builds the guided actions, T0(Ld53) handles clicks.
object TvSettingsActionsFingerprint : Fingerprint(
    definingClass = "Lua8;",
    name = "Q0",
    returnType = "V"
)

object TvSettingsClickFingerprint : Fingerprint(
    definingClass = "Lua8;",
    name = "T0",
    parameters = listOf("Ld53;")
)

private const val NAV_TITLE = "Hide account / PRO links"
private const val NAV_SUBTITLE = "Hide account and PRO-only side-menu entries; applies on restart"
private const val NAV_KEY = "morphe_hide_nav_pro"

private const val ERR_TITLE = "Show player errors"
private const val ERR_SUBTITLE = "Show the error popup when playback fails"
private const val ERR_KEY = "morphe_show_api_errors"

@Suppress("unused")
val modSettingsPatch = bytecodePatch(
    name = "Mod settings page",
    description = "Adds an 'AIO Mods' section with runtime toggles to the app's own settings screens (phone settings fragment and TV settings).",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        // --- Phone: add one switch row through the app's own J0/K0 helpers ---
        val phone = PhoneSettingsFingerprint.method
        // Anchor: the J0(...) row call for the "cutout" pref is the last row
        // of the "Design Settings" section; our section goes right after it.
        val cutoutIdx = phone.indexOfFirstStringInstructionOrThrow("cutout")
        val impl = phone.implementation!!
        val j0Idx = (cutoutIdx until impl.instructions.count()).first { i ->
            val ref = (impl.instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ler5;" && ref.name == "J0"
        }
        var idx = j0Idx
        phone.addInstruction(++idx, """const-string v1, "AIO Mods"""")
        phone.addInstruction(
            ++idx,
            "invoke-virtual {p0, v1}, Ler5;->K0(Ljava/lang/String;)Landroid/widget/LinearLayout;"
        )
        phone.addInstruction(++idx, "move-result-object v1")
        phone.addInstruction(++idx, "move-object v0, p0")
        phone.addInstruction(++idx, "const/4 v5, 0x0") // default off, matches pref default
        phone.addInstruction(++idx, "const/4 v6, 0x0") // no special listener (no biometric gate)
        phone.addInstruction(++idx, """const-string v2, "$NAV_TITLE"""")
        phone.addInstruction(++idx, """const-string v3, "$NAV_SUBTITLE"""")
        phone.addInstruction(++idx, """const-string v4, "$NAV_KEY"""")
        phone.addInstruction(
            ++idx,
            "invoke-virtual/range {v0 .. v6}, Ler5;->J0(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLar5;)V"
        )

        // --- TV: add one checkbox action to the guided settings ---
        val tv = TvSettingsActionsFingerprint.method
        // Insert after the first (checked) action is added, where p0 still
        // holds `this` and v1 still holds 0x0 (the default-value register).
        val tvImpl = tv.implementation!!
        val addIdx = tvImpl.instructions.indexOfFirst { ins: Instruction ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/util/ArrayList;" && ref.name == "add"
        }
        val action = """
            new-instance v0, Lc53;
            invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->A0()Landroid/content/Context;
            const/4 v1, 0x0
            invoke-direct {v0, v1}, Lc53;-><init>(I)V
            const-wide/16 v2, 0x40
            iput-wide v2, v0, Lc53;->a:J
            const-string v2, "$ERR_TITLE"
            iput-object v2, v0, Lc53;->b:Ljava/lang/CharSequence;
            const-string v2, "$ERR_SUBTITLE"
            iput-object v2, v0, Lc53;->d:Ljava/lang/String;
            const/4 v2, -0x1
            iput v2, v0, Lc53;->l:I
            const-string v2, "$ERR_KEY"
            sget-object v3, Lka1;->j:Landroid/content/SharedPreferences;
            invoke-interface {v3, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
            move-result v1
            iget v2, v0, Lc53;->f:I
            and-int/lit8 v2, v2, -0x2
            or-int/2addr v1, v2
            iput v1, v0, Lc53;->f:I
            invoke-virtual {v0}, Lc53;->a()Ld53;
            move-result-object v0
            invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        """.trimIndent()
        var aIdx = addIdx
        for (line in action.lines().filter { it.isNotBlank() }) {
            tv.addInstruction(++aIdx, line)
        }

        // --- TV click handler: save the toggle state for our action id ---
        val click = TvSettingsClickFingerprint.method
        click.addInstructionsWithLabels(
            0,
            """
                iget-wide v0, p1, Ld53;->a:J
                const-wide/16 v2, 0x40
                cmp-long v2, v0, v2
                if-nez v2, :cond_morphe_skip
                invoke-virtual {p1}, Ld53;->b()Z
                move-result v0
                const-string v1, "$ERR_KEY"
                invoke-static {v1, v0}, Lka1;->f0(Ljava/lang/String;Z)V
                return-void
                :cond_morphe_skip
            nop
            """.trimIndent()
        )
    }
}
