package patapon888.morphe.patches.bejeweled.language

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import org.w3c.dom.Element

// The languages the game ships text and voices for (soundeffects/locales in the OBB).
private val GAME_LANGUAGES = listOf("en", "fr", "de", "es", "it")

/**
 * The game picks its language from Locale.getDefault() (com.ea.blast.SystemAndroidDelegate).
 * Declaring a locale config makes Android 13+ offer a per-app language, which sets that default.
 */
@Suppress("unused")
val languageSettingPatch = resourcePatch(
    name = "Language setting",
    description = "Adds a language choice in Android settings (Apps > Bejeweled > Language, Android 13+). " +
        "Restart the game after changing it."
) {
    compatibleWith(BEJEWELED_3)

    execute {
        get("res/xml/morphe_locales_config.xml").apply { parentFile.mkdirs() }.writeText(
            buildString {
                appendLine("""<?xml version="1.0" encoding="utf-8"?>""")
                appendLine("""<locale-config xmlns:android="http://schemas.android.com/apk/res/android">""")
                GAME_LANGUAGES.forEach { appendLine("""    <locale android:name="$it" />""") }
                appendLine("</locale-config>")
            }
        )

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:localeConfig", "@xml/morphe_locales_config")
        }
    }
}
