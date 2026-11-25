package patches.rainviewer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val fixIntegrity = bytecodePatch(
    name = "Fix integrity",
    description = "Uses RainViewer's no-attestation fallback and renews its anonymous app session once, preserving settings and purchase records. Includes original-certificate compatibility for Google services. Does not forge signed Google verdicts or hide publisher errors.",
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, startupCompatibility, googleCompatibility)
    execute {
        // The app explicitly supports a null token. Avoid the unavailable SDK's retry
        // path without fabricating a signed token or an accepted publisher response.
        exact("Ljz5;", "b", "Ljava/lang/Object;", "I", "Lft0;")
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // A previously reported/rejected anonymous credential stays blocked. Renew
        // only that credential once before DI reads it; retain all other preferences,
        // favorites, Firebase identities, cached data and Play purchase records.
        exact("Lcom/lucky_apps/rainviewer/RVApplication;", "onCreate", "V").apply {
            check(implementation!!.registerCount >= 5) { "Unexpected RainViewer startup locals" }
            check(getInstruction<ReferenceInstruction>(0).reference.toString() == "Landroid/app/Application;->onCreate()V") {
                "Unexpected RainViewer Application super call"
            }
            val clearCredentials = listOf("authorization_prefs", "com.lucky_apps.data.preferences").joinToString("\n") { prefs -> """
                const-string v0, "$prefs"
                const/4 v1, 0x0
                invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                move-result-object v0
                invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0
                const-string v1, "key_key"
                invoke-interface {v0, v1}, Landroid/content/SharedPreferences${'$'}Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                const-string v1, "sec_key"
                invoke-interface {v0, v1}, Landroid/content/SharedPreferences${'$'}Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->commit()Z
                move-result v3
                if-eqz v3, :originalStartup
            """.trimIndent() }
            addInstructionsWithLabels(1, """
                const-string v0, "morphe_rainviewer_integrity"
                const/4 v1, 0x0
                invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                move-result-object v2
                const-string v0, "morphe_integrity_session_reset_v1"
                invoke-interface {v2, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v0
                if-nez v0, :originalStartup
                $clearCredentials
                invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0
                const-string v1, "morphe_integrity_session_reset_v1"
                const/4 v2, 0x1
                invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->commit()Z
            """.trimIndent(), ExternalLabel("originalStartup", getInstruction(1)))
        }
    }
}
