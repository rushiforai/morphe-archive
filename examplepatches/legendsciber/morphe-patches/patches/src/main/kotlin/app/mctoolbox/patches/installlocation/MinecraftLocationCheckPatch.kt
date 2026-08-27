package app.mctoolbox.patches.installlocation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mctoolbox.patches.shared.Constants.COMPATIBILITY_MCTOOLBOX

/**
 * Bypass Google Play Install Check — bypasses the installation source check.
 *
 * Writes test="0" pref directly at the start of MinecraftActivity.onCreate;
 * regardless of the installer name (null/packageinstaller/other market),
 * the app behaves as if it was installed from Google Play.
 *
 * Register safety: onCreate has .locals 14; v11/v12/v13 are not live
 * at the first instruction of the method.
 */
@Suppress("unused")
val mctoolboxPlaySpoofPatch = bytecodePatch(
    name = "Bypass Google Play Install Check",
    description = "App always behaves as if installed from Google Play, bypassing the install source check.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MCTOOLBOX)

    execute {
        val entryIdx = McPackageLookupFingerprint.instructionMatches[0].index
        McPackageLookupFingerprint.method.addInstructions(entryIdx, """
            invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
            move-result-object v11
            invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v11
            const-string v12, "test"
            const-string v13, "0"
            invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v11
            invoke-interface {v11}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
        """.trimIndent())
    }
}
