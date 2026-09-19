package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * m72.a(Context, Throwable) is the generic "Error occured" popup shown on
 * every caught APIException/CloudflareException (TV player fragment data
 * callbacks, its refetch runnable zg2, etc.). Playback proceeds fine — the
 * failing calls are gated for anonymous accounts and non-fatal — so the
 * popup is pure noise.
 *
 * Runtime-gated: m72.a is left untouched (xj2.b error log still runs); its
 * dialog builder m72.c returns early unless the pref `morphe_show_api_errors`
 * is set (default off = popup suppressed). The pref is the "Show player
 * errors" action added to the TV settings screen by ModSettingsPatch. Gating
 * in m72.c (locals 3, both params still live in the fallback path) instead
 * of m72.a (locals 2, both params needed later) keeps the read inline —
 * no extension code needed.
 */
@Suppress("unused")
val removeTvPlayerErrorDialogPatch = bytecodePatch(
    name = "Remove TV player error dialog",
    description = "Suppress the 'Error occured' popup on playback failures. Toggleable in the settings screens ('Show player errors' on TV).",
    default = true,
) {
    compatibleWith("com.streamdev.aiostreamer")

    execute {
        val c = object : Fingerprint(
            definingClass = "Lm72;",
            name = "c",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/Throwable;")
        ) {}
        // Pref read needs prefs + key + default in registers v0/v1/v2 (locals
        // are free at method entry; params p0-p2 untouched).
        c.method.addInstructionsWithLabels(
            0,
            """
                sget-object v0, Lka1;->j:Landroid/content/SharedPreferences;
                const-string v1, "morphe_show_api_errors"
                const/4 v2, 0x0
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v0
                if-nez v0, :cond_morphe_err_show
                return-void
                :cond_morphe_err_show
            nop
            """.trimIndent()
        )
    }
}
