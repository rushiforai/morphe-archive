package app.jofslash.patches.wikipedia.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext

private const val WIKIPEDIA_APP = "Lorg/wikipedia/WikipediaApp;"

/**
 * Makes the app set the boolean preferences [keys] (their values in preference_keys.xml) to true
 * each time it starts, before anything reads them. R8 inlines Prefs and most of the checks that read
 * these "already shown" flags into their callers, so writing the flag is steadier than patching
 * every check. The app keeps them in the default SharedPreferences file, which Prefs reads.
 */
internal fun BytecodePatchContext.setPrefsTrueAtStart(keys: List<String>) {
    val puts = keys.joinToString("\n") { key ->
        """
            const-string v1, "$key"
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v0
        """
    }
    methodOf(WIKIPEDIA_APP, "onCreate", emptyList()).addInstructions(
        0,
        """
            move-object/from16 v0, p0
            invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
            move-result-object v0
            invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v0
            const/4 v2, 0x1
            $puts
            invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
        """
    )
}
