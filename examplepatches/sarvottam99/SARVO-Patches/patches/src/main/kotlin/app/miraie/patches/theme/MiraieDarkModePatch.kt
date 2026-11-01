package app.miraie.patches.theme

import app.miraie.patches.shared.Constants.COMPATIBILITY_MIRAIE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val DARK_MODE_HELPER = "Lapp/morphe/extension/all/versioncode/MiraieDarkModeHelper;"

private fun Element.ensureStyleItem(document: Document, name: String, value: String): Boolean {
    val children = childNodes
    for (index in 0 until children.length) {
        val item = children.item(index) as? Element ?: continue
        if (item.tagName != "item" || item.getAttribute("name") != name) continue
        if (item.textContent == value) return false
        item.textContent = value
        return true
    }

    document.createElement("item").also {
        it.setAttribute("name", name)
        it.textContent = value
        appendChild(it)
    }
    return true
}

private fun Element.isThemeStyle(): Boolean {
    val name = getAttribute("name").lowercase()
    val parent = getAttribute("parent").lowercase()
    if ("theme" in name || "theme" in parent) return true

    val themeAttributes = setOf(
        "android:windowBackground",
        "android:colorBackground",
        "android:windowActionBar",
        "android:windowNoTitle",
        "android:statusBarColor"
    )
    val children = childNodes
    for (index in 0 until children.length) {
        val item = children.item(index) as? Element ?: continue
        if (item.tagName == "item" && item.getAttribute("name") in themeAttributes) return true
    }
    return false
}

private fun String.isValuesXmlPath(): Boolean {
    if (!endsWith(".xml", ignoreCase = true)) return false
    val directory = substringBeforeLast('/').substringAfterLast('/')
    return directory == "values" || directory.startsWith("values-")
}

private data class Rgba(val alpha: Int, val red: Int, val green: Int, val blue: Int) {
    val neutral: Boolean get() = maxOf(red, green, blue) - minOf(red, green, blue) <= 32
    val brightness: Int get() = (red + green + blue) / 3
}

private fun String.parseLiteralColor(): Rgba? {
    val value = trim().removePrefix("#")
    return when (value.length) {
        3 -> Rgba(255, value[0].digitToInt(16) * 17, value[1].digitToInt(16) * 17, value[2].digitToInt(16) * 17)
        4 -> Rgba(value[0].digitToInt(16) * 17, value[1].digitToInt(16) * 17, value[2].digitToInt(16) * 17, value[3].digitToInt(16) * 17)
        6 -> Rgba(255, value.substring(0, 2).toInt(16), value.substring(2, 4).toInt(16), value.substring(4, 6).toInt(16))
        8 -> Rgba(value.substring(0, 2).toInt(16), value.substring(2, 4).toInt(16), value.substring(4, 6).toInt(16), value.substring(6, 8).toInt(16))
        else -> null
    }
}

private fun String.universalNightColor(value: String): String? {
    val key = lowercase()
    val ignored = listOf(
        "accent", "button", "icon", "tint", "border", "stroke", "divider", "outline",
        "ripple", "gradient", "shadow", "progress", "error", "warning", "success",
        "disabled", "selected", "indicator", "scrim", "overlay"
    )
    if (ignored.any(key::contains)) return null

    val color = value.parseLiteralColor() ?: return null
    if (color.alpha < 224 || !color.neutral) return null

    val surfaceTokens = listOf("background", "surface", "canvas", "panel", "sheet", "card", "window", "screen", "white_bg", "white_background")
    if (surfaceTokens.any(key::contains) && color.brightness >= 215) {
        return if (listOf("screen", "window", "background", "canvas").any(key::contains)) {
            "#FF121212"
        } else {
            "#FF1E1E1E"
        }
    }

    val textTokens = listOf("text", "foreground", "title", "subtitle", "label", "hint", "caption")
    if (textTokens.any(key::contains) && color.brightness <= 95) {
        return if ("hint" in key || "secondary" in key || "subtitle" in key) {
            "#FFB0B0B0"
        } else {
            "#FFE8EAED"
        }
    }

    return null
}

/**
 * Resource-only techniques adapted from the collection's Amazon and Google
 * Photos dark-mode patches:
 * - enable Android's built-in Force Dark on theme styles, without relying on
 *   a particular values XML filename or a guessed application style name;
 * - recolor existing neutral surface/text resources in their original values
 *   files, while leaving brand, state, icon and control colors alone.
 *
 * IMPORTANT: this patch deliberately does not synthesize values-night entries.
 * ARSCLib can reject a new qualifier entry even when the name exists in the
 * default resource table. Existing resource values are edited in place instead.
 */
private val miraieUniversalDarkResourcePatch = resourcePatch(
    name = "MirAIe universal dark resources",
    description = "Enables Android Force Dark and safely recolors existing neutral surface and text resources without adding resource-table entries.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MIRAIE)

    execute {
        // Morphe decodes resources on demand. A directory listing only contains
        // files decoded so far, so walking get("res") before calling decode()
        // incorrectly returns no values XML files for an otherwise valid APK.
        // Decode the APK's values resources first, then process the returned paths.
        val valuesPaths = decode("res/values*/*.xml")
            .filter(String::isValuesXmlPath)

        if (valuesPaths.isEmpty()) {
            val available = listDecodableFiles("res/values*/*.xml")
            throw PatchException(
                "No values XML resources could be decoded. Matching APK entries: " +
                    (available.take(12).joinToString().ifEmpty { "none" })
            )
        }

        // Remove the file emitted by earlier revisions of this patch. It is not
        // part of the original APK and must never be passed to ARSCLib again.
        // Deleting a missing path is a no-op in Morphe Patcher 2.1.0.
        delete("res/values-night/miraie_universal_dark_colors.xml")

        var themeStyles = 0
        var forceDarkItems = 0
        var colorsUpdated = 0
        var colorCandidates = 0

        valuesPaths.forEach { path ->
            val source = get(path).readText()
            if (!source.contains("<style") && !source.contains("<color") && !source.contains("type=\"color\"")) {
                return@forEach
            }

            document(path).use { xml ->
                val styles = xml.getElementsByTagName("style")
                for (index in 0 until styles.length) {
                    val style = styles.item(index) as? Element ?: continue
                    if (!style.isThemeStyle()) continue
                    themeStyles++
                    if (style.ensureStyleItem(xml, "android:forceDarkAllowed", "true")) {
                        forceDarkItems++
                    }
                }

                // These elements already exist in this exact resource
                // configuration. Editing their values is safe: no new color
                // name, type entry, or values-night qualifier is introduced.
                val colors = xml.getElementsByTagName("color")
                for (index in 0 until colors.length) {
                    val color = colors.item(index) as? Element ?: continue
                    val name = color.getAttribute("name")
                    val replacement = name.universalNightColor(color.textContent) ?: continue
                    colorCandidates++
                    if (color.textContent.trim() != replacement) {
                        color.textContent = replacement
                        colorsUpdated++
                    }
                }

                // Also support the equivalent <item type="color" name="..."> form.
                val typedItems = xml.getElementsByTagName("item")
                for (index in 0 until typedItems.length) {
                    val item = typedItems.item(index) as? Element ?: continue
                    if (item.getAttribute("type") != "color") continue
                    val name = item.getAttribute("name")
                    val replacement = name.universalNightColor(item.textContent) ?: continue
                    colorCandidates++
                    if (item.textContent.trim() != replacement) {
                        item.textContent = replacement
                        colorsUpdated++
                    }
                }
            }
        }

        if (themeStyles == 0) {
            throw PatchException("No application theme styles were found in decoded values XML resources.")
        }

        println(
            "MirAIe dark resources: enabled Force Dark on $themeStyles theme style(s) " +
                "($forceDarkItems item(s) changed), evaluated $colorCandidates existing neutral color(s), " +
                "and recolored $colorsUpdated existing value(s) in place. No new resource entries were created."
        )
    }
}

private val MIRAIE_APPLICATION_ON_CREATE = Fingerprint(
    definingClass = "Lcom/panasonic/in/miraie/MiraieApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList()
)

// The legal/terms WebView is deliberately targeted by its own client. Do not
// touch PgoWebActivity (Panasonic Store) or AlexaLoginWebViewActivity.
private val MIRAIE_TERMS_WEBVIEW_ON_PAGE_FINISHED = Fingerprint(
    definingClass = "Lcom/panasonic/in/miraie/utils/TcAndPpWebClient;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")
)

private val ENERGY_CHART_PREPARE_BAR_CHART = Fingerprint(
    definingClass = "Lcom/panasonic/in/miraie/widgets/EnergyConsumption;",
    name = "prepareBarChart",
    returnType = "V",
    parameters = listOf("Lcom/panasonic/in/miraie/widgets/EnergyConsumption\$Type;")
)

@Suppress("unused")
val miraieDarkModePatch = bytecodePatch(
    name = "Dark mode",
    description = "Forces MirAIe into night mode, enables Android Force Dark, darkens its legal WebView, and keeps energy-chart labels readable.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MIRAIE)
    dependsOn(miraieUniversalDarkResourcePatch)
    extendWith("extensions/all/versioncode/change-version-code.mpe")

    execute {
        MIRAIE_APPLICATION_ON_CREATE.method.addInstructions(
            0,
            "invoke-static {p0}, $DARK_MODE_HELPER->forceDarkTheme(Landroid/content/Context;)V"
        )

        MIRAIE_TERMS_WEBVIEW_ON_PAGE_FINISHED.method.addInstructions(
            0,
            "invoke-static {p1}, $DARK_MODE_HELPER->enableWebViewDarkMode(Landroid/webkit/WebView;)V"
        )

        // MPAndroidChart draws its own text and axes, so Android Force Dark
        // cannot recolor these. Read the effective uiMode and set chart colors.
        ENERGY_CHART_PREPARE_BAR_CHART.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->uiMode:I
                and-int/lit8 v0, v0, 0x30
                const/16 v1, 0x20
                if-ne v0, v1, :miraie_chart_light
                const v1, -2039584
                const v2, -12303292
                goto :miraie_chart_colors_ready
                :miraie_chart_light
                const v1, -14540254
                const v2, -2236963
                :miraie_chart_colors_ready
                iget-object v0, p0, Lcom/panasonic/in/miraie/widgets/EnergyConsumption;->mBarChart:Lcom/github/mikephil/charting/charts/BarChart;
                invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/Chart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;
                move-result-object v3
                invoke-virtual {v3, v1}, Lcom/github/mikephil/charting/components/ComponentBase;->setTextColor(I)V
                invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/components/AxisBase;->setAxisLineColor(I)V
                invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/components/AxisBase;->setGridColor(I)V
                invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;
                move-result-object v3
                invoke-virtual {v3, v1}, Lcom/github/mikephil/charting/components/ComponentBase;->setTextColor(I)V
                invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/components/AxisBase;->setAxisLineColor(I)V
                invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/components/AxisBase;->setGridColor(I)V
                invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxisRight()Lcom/github/mikephil/charting/components/YAxis;
                move-result-object v3
                invoke-virtual {v3, v1}, Lcom/github/mikephil/charting/components/ComponentBase;->setTextColor(I)V
                invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/components/AxisBase;->setAxisLineColor(I)V
                invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/components/AxisBase;->setGridColor(I)V
                invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/Chart;->getLegend()Lcom/github/mikephil/charting/components/Legend;
                move-result-object v3
                invoke-virtual {v3, v1}, Lcom/github/mikephil/charting/components/ComponentBase;->setTextColor(I)V
            """.trimIndent()
        )
    }
}
