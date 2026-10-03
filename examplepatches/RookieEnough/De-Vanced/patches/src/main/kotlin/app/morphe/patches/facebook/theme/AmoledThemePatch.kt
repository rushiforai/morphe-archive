/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.theme

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import org.w3c.dom.Document
import org.w3c.dom.Element

private data class AmoledResourceTargets(
    val themeAttribute: String,
    val lightTheme: String,
    val darkTheme: String,
    val darkerTheme: String,
    val darkestTheme: String,
    val darkModeAttribute: String,
    val darkerParent: String,
    val darkestParent: String,
    val baseColors: List<Pair<String, String>>,
    val nightReplacements: List<Triple<String, String, String>>,
)

private val FACEBOOK_576_RESOURCES = AmoledResourceTargets(
    themeAttribute = "attr_0x7f040646",
    lightTheme = "style.2_0x7f200229",
    darkTheme = "style.2_0x7f20022a",
    darkerTheme = "style.2_0x7f20022b",
    darkestTheme = "style.2_0x7f20022c",
    darkModeAttribute = "attr_0x7f0404ed",
    darkerParent = "@style.2/style.2_0x7f20022c",
    darkestParent = "@style.2/style.2_0x7f20022a",
    baseColors = listOf(
        "color_0x7f060158" to "#ff333334",
        "color_0x7f0601fe" to "#ff1c1c1d",
        "color_0x7f0601ff" to "#ff252728",
        "color_0x7f060228" to "#ff242526",
        "color_0x7f06029e" to "#242526",
    ),
    nightReplacements = listOf(
        Triple("color_0x7f060002", "#ff242526", "#ff000000"),
        Triple("color_0x7f060469", "#252728", "#ff000000"),
        Triple("color_0x7f06046b", "#3a3b3c", "#ff121212"),
    ),
)

private val FACEBOOK_578_RESOURCES = AmoledResourceTargets(
    themeAttribute = "attr_0x7f040641",
    lightTheme = "style.2_0x7f200228",
    darkTheme = "style.2_0x7f200229",
    darkerTheme = "style.2_0x7f20022b",
    darkestTheme = "style.2_0x7f20022c",
    darkModeAttribute = "attr_0x7f0404e8",
    darkerParent = "@style.2/style.2_0x7f200229",
    darkestParent = "@style.2/style.2_0x7f200229",
    baseColors = listOf(
        "color_0x7f06014e" to "#ff333334",
        "color_0x7f0601f4" to "#ff1c1c1d",
        "color_0x7f0601f5" to "#ff252728",
        "color_0x7f06021e" to "#ff242526",
        "color_0x7f060294" to "#242526",
    ),
    nightReplacements = listOf(
        Triple("color_0x7f060002", "#ff242526", "#ff000000"),
        Triple("color_0x7f06044d", "#252728", "#ff000000"),
        Triple("color_0x7f06044f", "#3a3b3c", "#ff121212"),
    ),
)

private fun Document.requireColor(
    name: String,
    expectedValue: String,
) {
    val colors = getElementsByTagName("color")
    val matches = buildList {
        for (index in 0 until colors.length) {
            val color = colors.item(index) as? Element ?: continue
            if (color.getAttribute("name") == name) add(color)
        }
    }
    check(
        matches.size == 1 &&
            matches.single().textContent.equals(expectedValue, true),
    ) {
        "Facebook 576 AMOLED base color '$name' did not match '$expectedValue'"
    }
}

private fun Document.requireReferenceAttribute(name: String) {
    val attributes = getElementsByTagName("attr")
    val matches = buildList {
        for (index in 0 until attributes.length) {
            val attribute = attributes.item(index) as? Element ?: continue
            if (attribute.getAttribute("name") == name) add(attribute)
        }
    }
    check(matches.size == 1) {
        "Facebook 576 AMOLED attribute '$name' resolved ${matches.size} times"
    }
    check(
        matches.single()
            .getAttribute("formats")
            .split('|')
            .map(String::trim)
            .contains("reference"),
    ) {
        "Facebook 576 AMOLED attribute '$name' is not a color reference"
    }
}

private fun Document.requireStyle(
    name: String,
    expectedParent: String,
): Element {
    val styles = getElementsByTagName("style.2")
    val matches = buildList {
        for (index in 0 until styles.length) {
            val style = styles.item(index) as? Element ?: continue
            if (style.getAttribute("name") == name) add(style)
        }
    }
    check(matches.size == 1) {
        "Facebook 576 AMOLED style '$name' resolved ${matches.size} times"
    }
    return matches.single().also { style ->
        check(style.getAttribute("parent") == expectedParent) {
            "Facebook 576 AMOLED style '$name' has an unexpected parent"
        }
    }
}

private fun Element.requireItem(name: String, expectedValue: String) {
    val items = getElementsByTagName("item")
    val matches = buildList {
        for (index in 0 until items.length) {
            val item = items.item(index) as? Element ?: continue
            if (item.getAttribute("name") == name) add(item)
        }
    }
    check(matches.size == 1 && matches.single().textContent == expectedValue) {
        "Facebook 576 AMOLED style item '$name' did not match '$expectedValue'"
    }
}

@Suppress("unused")
internal val amoledThemeResourcePatch = resourcePatch(
    description = "Validates Facebook dark-theme resources used by the runtime AMOLED hooks.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        if (packageMetadata.versionName == FacebookTargets.V580) {
            println(
                "[AmoledTheme] 580 runtime resource-color hook mode " +
                    "(toggle-safe)",
            )
            return@execute
        }

        val targets = if (
            packageMetadata.versionName == FacebookTargets.V578
        ) {
            FACEBOOK_578_RESOURCES
        } else {
            FACEBOOK_576_RESOURCES
        }
        document("res/values/attrs.xml").use { attributes ->
            attributes.requireReferenceAttribute(targets.themeAttribute)
        }
        document("res/values/colors.xml").use { colors ->
            targets.baseColors.forEach { (name, value) ->
                colors.requireColor(name, value)
            }
        }
        document("res/values-night/colors.xml").use { colors ->
            targets.nightReplacements.forEach { (name, value, _) ->
                colors.requireColor(name, value)
            }
        }
        document("res/values/style.2s.xml").use { styles ->
            styles.requireStyle(targets.lightTheme, "")
                .requireItem(targets.darkModeAttribute, "false")
            styles.requireStyle(
                targets.darkTheme,
                "@style.2/${targets.lightTheme}",
            ).apply {
                requireItem(targets.darkModeAttribute, "true")
                requireItem(
                    "android:navigationBarColor",
                    "@color/color_0x7f060013",
                )
            }
            styles.requireStyle(
                targets.darkerTheme,
                targets.darkerParent,
            )
            styles.requireStyle(
                targets.darkestTheme,
                targets.darkestParent,
            )
        }
    }
}

private fun isOpaqueDarkNeutral(value: String): Boolean {
    val hex = value.trim().removePrefix("#")
    if (hex.length !in setOf(3, 4, 6, 8)) return false
    if (!hex.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }) return false
    val wide = if (hex.length <= 4) {
        hex.map { "$it$it" }.joinToString("")
    } else {
        hex
    }
    if (wide.length == 8 && wide.take(2).toInt(16) != 0xFF) return false
    val red = wide.takeLast(6).substring(0, 2).toInt(16)
    val green = wide.takeLast(4).substring(0, 2).toInt(16)
    val blue = wide.takeLast(2).toInt(16)
    val high = maxOf(red, green, blue)
    return high <= 0x2A && high - minOf(red, green, blue) <= 8
}
