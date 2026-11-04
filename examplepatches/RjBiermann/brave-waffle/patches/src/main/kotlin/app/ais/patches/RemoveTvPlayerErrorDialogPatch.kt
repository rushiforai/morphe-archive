package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import util.assembleFirstMethod

/**
 * jf2.c(Context, String, Throwable) is the generic "Error occured" popup shown
 * on every caught APIException/CloudflareException (TV player fragment data
 * callbacks, its refetch runnable, etc.). Playback proceeds fine — the
 * failing calls are gated for anonymous accounts and non-fatal — so the
 * popup is pure noise.
 *
 * Runtime-gated by the pref `morphe_show_api_errors` (default off = popup
 * suppressed), the "Show player errors" action added to the TV settings
 * screen by ModSettingsPatch.
 *
 * The pref read needs three registers (prefs, key, default) but jf2.c only
 * declares .locals 2, and an injected instruction block cannot widen that —
 * so the read lives in a small static helper method added to the same class.
 */
// The helper is assembled as a full class: `.locals` is only allowed there.
private const val SHOW_ERRORS_SMALI = """
    .class public Ljf2;
    .super Ljava/lang/Object;

    .method public static morpheShowErrors()Z
        .locals 3
        sget-object v0, Lc34;->q:Landroid/content/SharedPreferences;
        const-string v1, "morphe_show_api_errors"
        const/4 v2, 0x0
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        return v0
    .end method
"""

@Suppress("unused")
val removeTvPlayerErrorDialogPatch = bytecodePatch(
    name = "Remove TV player error dialog",
    description = "Suppress the 'Error occured' popup on playback failures. Toggleable in the settings screens ('Show player errors' on TV).",
    default = true,
) {
    compatibleWith("com.streamdev.aiostreamer")

    execute {
        val c = object : Fingerprint(
            definingClass = "Ljf2;",
            name = "c",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/Throwable;")
        ) {}

        mutableClassDefByOrNull("Ljf2;")!!
            .directMethods
            .add(MutableMethod(assembleFirstMethod(SHOW_ERRORS_SMALI, "show-errors reader")))

        c.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, Ljf2;->morpheShowErrors()Z
                move-result v0
                if-nez v0, :cond_morphe_err_show
                return-void
                :cond_morphe_err_show
            nop
            """.trimIndent()
        )
    }
}
