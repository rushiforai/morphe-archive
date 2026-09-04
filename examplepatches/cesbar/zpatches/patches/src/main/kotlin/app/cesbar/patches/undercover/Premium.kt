package app.cesbar.patches.undercover

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

object appOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    definingClass = "Lcom/yanstarstudio/joss/undercover/app/MyApplication;"
)

val premiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlock Full Access Pack"
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {

        appOnCreateFingerprint.method.addInstructions(
            1,
            """
                const-string v0, "com.yanstarstudio.joss.undercover_preferences"
                const/4 v1, 0x0
                invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                move-result-object v0

                invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0

                const-string v1, "takanaka_940128"
                const/4 v2, 0x1
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0

                invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            """
        )
    }
}
