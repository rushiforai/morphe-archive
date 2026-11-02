package mightymich.morphe.patches.universal

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

@Suppress("unused")
val changeAppNamePatch = resourcePatch(
    name = "Change app name",
    description = "Sets a custom application / launcher display name " +
        "(strings.xml + manifest labels).",
    default = false,
) {
    val appName by stringOption(
        key = "appName",
        default = "Patched App",
        title = "App name",
        description = "Display name shown under the launcher icon.",
    )

    execute {
        val name = appName?.trim().orEmpty()
        if (name.isEmpty()) return@execute

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
            "app_title",
        )

        val candidates = mutableListOf(
            "res/values/strings.xml",
            "res/values-en/strings.xml",
            "res/values-en-rUS/strings.xml",
            "res/values-en-rGB/strings.xml",
            "res/values-night/strings.xml",
        )
        val langs = listOf(
            "pl", "de", "fr", "es", "it", "pt", "ru", "uk", "tr", "ar",
            "ja", "ko", "zh", "zh-rCN", "zh-rTW", "hi", "nl", "sv", "cs", "ro",
        )
        for (lang in langs) {
            candidates += "res/values-$lang/strings.xml"
        }

        for (path in candidates) {
            try {
                document(path).use { document ->
                    val nodes = document.getElementsByTagName("string")
                    for (i in 0 until nodes.length) {
                        val el = nodes.item(i) as? Element ?: continue
                        if (el.getAttribute("name") in labelKeys) {
                            el.textContent = name
                        }
                    }
                }
            } catch (_: Exception) {
            }
        }

        try {
            document("AndroidManifest.xml").use { document ->
                fun setLiteralLabel(el: Element) {
                    if (!el.hasAttribute("android:label")) return
                    val label = el.getAttribute("android:label")
                    if (label.startsWith("@")) return
                    el.setAttribute("android:label", name)
                }

                val apps = document.getElementsByTagName("application")
                for (i in 0 until apps.length) {
                    val app = apps.item(i) as? Element ?: continue
                    setLiteralLabel(app)

                    val kids = app.getElementsByTagName("*")
                    for (j in 0 until kids.length) {
                        val child = kids.item(j) as? Element ?: continue
                        val tag = child.tagName
                        if (tag != "activity" && tag != "activity-alias") continue

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
    }
}
