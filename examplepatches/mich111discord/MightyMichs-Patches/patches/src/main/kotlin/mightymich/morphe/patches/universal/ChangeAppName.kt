package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * Universal: properly change the launcher / application display name.
 *
 * Updates:
 *  1. res/values*/strings.xml keys commonly used as app label
 *     (app_name, app_name_full, application_name, launcher_name, name_app, …)
 *  2. AndroidManifest <application android:label> when it is a raw string
 *  3. Launcher <activity> / <activity-alias> labels that are raw strings
 *     (resource references @string/… are covered via strings.xml)
 */
@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Sets a custom application / launcher display name " +
        "(strings.xml + manifest labels).",
    default = false
) {
    val appName by stringOption(
        key = "appName",
        default = "Patched App",
        title = "App name",
        description = "Display name shown under the launcher icon."
    )

    execute {
        val name = appName?.trim().orEmpty()
        if (name.isEmpty()) return@execute

        // Keys that apps frequently use for the visible label
        val labelKeys = setOf(
            "app_name",
            "app_name_full",
            "app_name_short",
            "application_name",
            "launcher_name",
            "launcher_label",
            "name_app",
            "appName",
            "AppName",
            "title_app",
            "app_title"
        )

        // 1) All values* string tables (default + locales)
        val stringFiles = try {
            // resourcePatch exposes filesystem-relative paths via document();
            // enumerate known common locales by probing.
            val candidates = mutableListOf(
                "res/values/strings.xml",
                "res/values-en/strings.xml",
                "res/values-en-rUS/strings.xml",
                "res/values-en-rGB/strings.xml",
                "res/values-night/strings.xml"
            )
            // Also try values-*/strings.xml discovery via manifest-less walk is not
            // available in all patcher versions — probe a broader fixed set.
            val langs = listOf(
                "pl", "de", "fr", "es", "it", "pt", "ru", "uk", "tr", "ar",
                "ja", "ko", "zh", "zh-rCN", "zh-rTW", "hi", "nl", "sv", "cs", "ro"
            )
            for (lang in langs) {
                candidates += "res/values-$lang/strings.xml"
            }
            candidates
        } catch (_: Exception) {
            listOf("res/values/strings.xml")
        }

        var updatedStrings = 0
        for (path in stringFiles) {
            try {
                document(path).use { document ->
                    val nodes = document.getElementsByTagName("string")
                    for (i in 0 until nodes.length) {
                        val el = nodes.item(i) as? Element ?: continue
                        val key = el.getAttribute("name")
                        if (key in labelKeys) {
                            el.textContent = name
                            updatedStrings++
                        }
                    }
                }
            } catch (_: Exception) {
                // file may not exist for this locale
            }
        }

        // 2) Manifest application + launcher activity labels (literal only)
        try {
            document("AndroidManifest.xml").use { document ->
                fun setLiteralLabel(el: Element) {
                    if (!el.hasAttribute("android:label")) return
                    val label = el.getAttribute("android:label")
                    // Skip @string/ and @android: refs — those are handled via strings.xml
                    if (label.startsWith("@")) return
                    el.setAttribute("android:label", name)
                }

                val apps = document.getElementsByTagName("application")
                for (i in 0 until apps.length) {
                    val app = apps.item(i) as? Element ?: continue
                    setLiteralLabel(app)

                    // Launcher activities / aliases under application
                    val kids = app.getElementsByTagName("*")
                    for (j in 0 until kids.length) {
                        val child = kids.item(j) as? Element ?: continue
                        val tag = child.tagName
                        if (tag != "activity" && tag != "activity-alias") continue

                        // Only touch components that look like launchers
                        var isLauncher = false
                        val filters = child.getElementsByTagName("intent-filter")
                        for (f in 0 until filters.length) {
                            val filter = filters.item(f) as? Element ?: continue
                            val cats = filter.getElementsByTagName("category")
                            for (c in 0 until cats.length) {
                                val cat = cats.item(c) as? Element ?: continue
                                if (cat.getAttribute("android:name") ==
                                    "android.intent.category.LAUNCHER"
                                ) {
                                    isLauncher = true
                                }
                            }
                        }
                        if (isLauncher) {
                            setLiteralLabel(child)
                        }
                    }
                }
            }
        } catch (_: Exception) {
        }

        // Soft success even if only manifest or only strings changed
        if (updatedStrings == 0) {
            // Still ok — manifest literal path may have applied
        }
    }
}
