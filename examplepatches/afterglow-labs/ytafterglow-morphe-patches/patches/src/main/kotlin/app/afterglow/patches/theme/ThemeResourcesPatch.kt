package app.afterglow.patches.theme

import app.afterglow.patches.settings.afterglowSettingsPatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Role-specific aliases keep shared constants (white/black/brand red) untouched. */
internal val themeResourcesPatch = resourcePatch {
    dependsOn(afterglowSettingsPatch)
    execute {
        val attributes = mapOf(
            "ytBaseBackground" to "BACKGROUND",
            "ytBrandBackgroundPrimary" to "BACKGROUND",
            "ytBrandBackgroundSecondary" to "BACKGROUND",
            "ytBrandBackgroundSolid" to "BACKGROUND",
            "ytRaisedBackground" to "ELEVATED_SURFACE",
            "ytMenuBackground" to "ELEVATED_SURFACE",
            "ytPivotBarBackground" to "NAVIGATION_SURFACE",
            "ytTextPrimary" to "PRIMARY_TEXT",
            "ytTextSecondary" to "SECONDARY_TEXT",
            "ytTextDisabled" to "SECONDARY_TEXT:0.3",
            "ytHeaderIcon" to "PRIMARY_TEXT",
            "ytIconActiveOther" to "PRIMARY_TEXT",
            "ytIconInactive" to "PRIMARY_TEXT:0.5",
            "ytIconDisabled" to "PRIMARY_TEXT:0.3",
            "ytCallToAction" to "ACCENT",
            "ytSelectedNavText" to "TAB_ICON",
            "ytSeparator" to "BORDER",
            "ytOutline" to "BORDER",
            "ytOverlayIconActiveOther" to "OVERLAY_CONTROL",
            "ytOverlayIconInactive" to "OVERLAY_CONTROL:0.7",
            "ytOverlayIconDisabled" to "OVERLAY_CONTROL:0.3",
            // 21.43's dark and Mainstage themes route the legacy attributes through these.
            "yt_sys_color_baseline_base_background" to "BACKGROUND",
            "yt_sys_color_baseline_raised_background" to "ELEVATED_SURFACE",
            "yt_sys_color_baseline_menu_background" to "ELEVATED_SURFACE",
            "yt_sys_color_baseline_text_primary" to "PRIMARY_TEXT",
            "yt_sys_color_baseline_text_secondary" to "SECONDARY_TEXT",
            "yt_sys_color_baseline_text_disabled" to "SECONDARY_TEXT:0.3",
            "yt_sys_color_baseline_call_to_action" to "ACCENT",
            "yt_sys_color_baseline_outline" to "BORDER",
        )
        val aliases = linkedMapOf<Pair<String, String>, String>()
        val bindings = linkedMapOf<String, String>()
        var rewritten = 0
        get("res").listFiles()!!.filter { it.isDirectory && it.name.startsWith("values") }
            .sortedBy { it.name }.forEach { directory ->
                val path = "res/${directory.name}/styles.xml"
                if (!get(path, true).exists()) return@forEach
                document(path).use { doc ->
                    val styles = doc.getElementsByTagName("style")
                    for (s in 0 until styles.length) {
                        val items = (styles.item(s) as Element).getElementsByTagName("item")
                        for (i in 0 until items.length) {
                            val item = items.item(i) as Element
                            val role = attributes[item.getAttribute("name")] ?: continue
                            val original = item.textContent.trim()
                            // Attribute references continue through their original theme chain.
                            if (!original.startsWith("@color/") && !original.startsWith("#")) continue
                            val alias = aliases.getOrPut(role to original) { "afterglow_role_${aliases.size}" }
                            bindings[alias] = role
                            item.textContent = "@color/$alias"
                            rewritten++
                        }
                    }
                }
            }
        if (rewritten < 20) throw PatchException("YouTube theme attributes changed: only $rewritten bindings")
        // Modern components also resolve these semantic resources directly, bypassing styles.
        document("res/values/colors.xml").use { doc ->
            val colors = doc.getElementsByTagName("color")
            for (i in 0 until colors.length) {
                val name = (colors.item(i) as Element).getAttribute("name")
                if (!name.startsWith("yt_sys_color_baseline_")) continue
                val role = when {
                    name.endsWith("_base_background") -> "BACKGROUND"
                    name.endsWith("_raised_background") || name.endsWith("_menu_background") -> "ELEVATED_SURFACE"
                    name.endsWith("_text_primary") && !name.contains("_overlay_") -> "PRIMARY_TEXT"
                    name.endsWith("_text_secondary") && !name.contains("_overlay_") -> "SECONDARY_TEXT"
                    name.endsWith("_call_to_action") -> "ACCENT"
                    else -> null
                }
                if (role != null) bindings[name] = role
            }
            // The 2.1 encoder allocates named value IDs from the canonical type file.
            aliases.forEach { (key, name) ->
                doc.documentElement.appendChild(doc.createElement("color").apply {
                    setAttribute("name", name)
                    textContent = key.second
                })
            }
        }
        // The 2.1 resource encoder recognizes overlay declarations by this exact filename.
        val overlayPath = "res/values/overlayable.xml"
        if (!get(overlayPath, true).exists()) get(overlayPath, false).writeText("<resources/>")
        document(overlayPath).use { doc ->
            val overlay = doc.createElement("overlayable").apply { setAttribute("name", "AfterglowTheme") }
            val policy = doc.createElement("policy").apply { setAttribute("type", "public") }
            bindings.keys.forEach { name ->
                policy.appendChild(doc.createElement("item").apply {
                    setAttribute("type", "color")
                    setAttribute("name", name)
                })
            }
            overlay.appendChild(policy)
            doc.documentElement.appendChild(overlay)
        }
        get("assets/afterglow-theme-colors.txt", false).apply {
            parentFile.mkdirs()
            writeText(bindings.entries.joinToString("\n", postfix = "\n") { "${it.key}=${it.value}" })
        }
        println("Afterglow theme: $rewritten style bindings, ${aliases.size} isolated aliases, ${bindings.size} overlay resources")
    }
}
