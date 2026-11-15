package app.heymelody.patches.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.Base64

private const val HEY_MELODY_APPLICATION =
    "Lcom/heytap/headset/HeyMelodyApplication;"
private const val APPCOMPAT_DELEGATE = "Landroidx/appcompat/app/k;"
private const val APP_MODE_GATE_CLASS = "LN8/c;"

private val COMPATIBILITY_HEY_MELODY = Compatibility(
    name = "HeyMelody",
    packageName = "com.heytap.headset",
    apkFileType = ApkFileType.APKM,
    targets = listOf(
        AppTarget(
            version = "117.6.6",
            isExperimental = false,
            minSdk = 29
        )
    )
)

private val HEY_MELODY_THEME_NAMES = setOf(
    "MelodyUiBaseTheme",
    "MelodyUiTheme",
    "MelodyUiTheme.Activity",
    "MelodyUiTheme.Activity.Combine",
    "MelodyUiTheme.ActivityGoldHearing",
    "MelodyUiTheme.CustomDressCrop",
    "MelodyUiTheme.NoTitle",
    "MelodyUiTheme.PreferenceFragment",
    "MelodyUiTheme.PreferenceFragmentMaterial",
    "MelodyUiTheme.QuickDialog",
    "MelodyUiTheme.SoundPlaying",
    "HeyMelodyAppTheme",
    "CombineMelodyActivityTheme",
    "AcOpenCoreNoneTitlebarTheme",
    "AppBaseTheme",
    "Theme.COUI",
    "Theme.COUI.Blue",
    "Theme.COUI.Main",
    "Theme.COUI.ActivityDialog"
)

private fun String.valuesDirectory(): String =
    substringBeforeLast('/').substringAfterLast('/')

private fun String.isValuesXmlPath(): Boolean =
    endsWith(".xml", ignoreCase = true) && valuesDirectory().startsWith("values")

private fun String.isDefaultValuesXmlPath(): Boolean {
    val directory = valuesDirectory()
    return directory == "values" ||
        (directory.startsWith("values-") &&
            directory != "values-night" &&
            !directory.startsWith("values-night-"))
}

private fun Element.setThemeItem(
    document: Document,
    name: String,
    value: String
): Boolean {
    val children = childNodes
    for (index in 0 until children.length) {
        val item = children.item(index) as? Element ?: continue
        if (item.tagName != "item" || item.getAttribute("name") != name) continue
        if (item.textContent.trim() == value) return false
        item.textContent = value
        return true
    }

    document.createElement("item").also { item ->
        item.setAttribute("name", name)
        item.textContent = value
        appendChild(item)
    }
    return true
}

private fun Element.setExistingColorValue(name: String, value: String): Boolean {
    var changed = false
    val colors = getElementsByTagName("color")
    for (index in 0 until colors.length) {
        val color = colors.item(index) as? Element ?: continue
        if (color.getAttribute("name") != name) continue
        if (color.textContent.trim() != value) {
            color.textContent = value
            changed = true
        }
    }

    val items = getElementsByTagName("item")
    for (index in 0 until items.length) {
        val item = items.item(index) as? Element ?: continue
        if (item.getAttribute("type") != "color" || item.getAttribute("name") != name) continue
        if (item.textContent.trim() != value) {
            item.textContent = value
            changed = true
        }
    }
    return changed
}

/**
 * AppCompat's night configuration makes Android select the app's existing
 * values-night/drawable-night resources. COUI also checks these theme flags
 * when choosing colors for its custom widgets.
 *
 * The inspected MelodyUiTheme.Activity explicitly sets android:windowBackground
 * to ?attr/coui_color_background_with_card. In the APK's night palette that
 * token resolves to WHITE, explaining the white content canvas even while the
 * bottom navigation is dark. Replace the activity/window surface with the
 * app's own melody_ui_common_window_background_color, whose native night value
 * is black. Keep all foreground/card resources on their original night values.
 */

private fun Element.replaceLiteralColorAttribute(
    attributeNames: List<String>,
    oldValues: Set<String>,
    newValue: String
): Boolean {
    val attributeName = attributeNames.firstOrNull { hasAttribute(it) } ?: return false
    val currentValue = getAttribute(attributeName).trim()
    if (oldValues.none { currentValue.equals(it, ignoreCase = true) }) return false
    setAttribute(attributeName, newValue)
    return true
}

private val heyMelodyDarkThemeResourcePatch = resourcePatch(
    name = "HeyMelody native dark theme resources",
    description = "Enables HeyMelody native night mode, corrects dark window surfaces, and fixes hard-coded light text in the tutorial and supported-device screens.",
    default = false
) {
    compatibleWith(COMPATIBILITY_HEY_MELODY)

    execute {
        val allValuesPaths = decode("res/values*/*.xml")
            .filter(String::isValuesXmlPath)
        val valuesPaths = allValuesPaths.filter(String::isDefaultValuesXmlPath)

        if (valuesPaths.isEmpty()) {
            val available = listDecodableFiles("res/values*/*.xml")
            throw PatchException(
                "No default HeyMelody values XML resources could be decoded. Matching entries: " +
                    available.take(12).joinToString().ifEmpty { "none" }
            )
        }

        // These are existing app color entries. A few of them have no native
        // night counterpart, while coui_color_background_with_card is WHITE in
        // the APK's native night palette. Keep the root and common page surfaces
        // dark in every resource configuration without inventing resource IDs.
        val darkSurfaceOverrides = mapOf(
            "coui_color_background" to "#FF000000",
            "coui_color_background_with_card" to "#FF1E1E1E",
            "melody_ui_common_window_background_color" to "#FF000000",
            "melody_ui_detail_bg" to "#FF000000",
            "melody_ui_navigation_bar_bg" to "#FF1E1E1E",
            "melody_ui_find_device_preference_bg_color" to "#FF1E1E1E",
            "melody_ui_firmware_upgrade_bg" to "#FF1E1E1E",
            "heymelody_app_text_color_black" to "#D9FFFFFF",
            "heymelody_app_text_color_gray" to "#8CFFFFFF",
            "heymelody_app_brand_btn" to "#99FFFFFF",
            "melody_ui_control_guide_des_color" to "#8CFFFFFF"
        )
        var surfaceColorsUpdated = 0
        allValuesPaths.forEach { path ->
            val source = get(path).readText()
            if (!source.contains("<color") && !source.contains("type=\"color\"")) {
                return@forEach
            }
            document(path).use { xml ->
                darkSurfaceOverrides.forEach { (name, value) ->
                    if (xml.documentElement.setExistingColorValue(name, value)) {
                        surfaceColorsUpdated++
                    }
                }
            }
        }

        // The inactive OPPO/OnePlus filter chips use a dedicated drawable
        // with a low-opacity black outline. On a black page that outline
        // disappears, while the text color resource above was also black.
        val brandFilterBackgroundPath = "res/drawable/heymelody_app_bg_filter_brand_btn.xml"
        val brandLogoPaths = listOf(
            "res/drawable-xxhdpi-v4/heymelody_app_ic_brand_opo.webp",
            "res/drawable-xxhdpi-v4/heymelody_app_ic_brand_ops.webp"
        )
        // Decode only the XML selector drawable. The OPPO/OnePlus WebP files are
        // binary assets in base.apk, not XML resources, and ARSCLib's XML/resource
        // decoder may omit them from decode(). Replace them through get(copy=false)
        // below so their original bytes are never sent through the decoder.
        val decodedBrandFilterBackground = decode(brandFilterBackgroundPath)
        if (brandFilterBackgroundPath !in decodedBrandFilterBackground) {
            throw PatchException(
                "Could not decode HeyMelody brand-filter background: $brandFilterBackgroundPath"
            )
        }

        var brandButtonStrokesUpdated = 0
        document(brandFilterBackgroundPath).use { xml ->
            val strokes = xml.getElementsByTagName("stroke")
            if (strokes.length == 0) {
                throw PatchException("HeyMelody inactive brand-filter drawable has no stroke element")
            }
            for (index in 0 until strokes.length) {
                val stroke = strokes.item(index) as? Element ?: continue
                if (stroke.getAttribute("color").trim() != "#40FFFFFF") {
                    stroke.setAttribute("color", "#40FFFFFF")
                    brandButtonStrokesUpdated++
                }
            }
        }

        // The original OPPO/OnePlus marks are black WebP images with only
        // 15% maximum alpha. They are invisible on the dark row background.
        // Replace only those two exact existing resources with the same marks
        // rendered white at the corresponding light-mode contrast level.
        val brandLogoReplacements = mapOf(
            brandLogoPaths[0] to "UklGRtwDAABXRUJQVlA4TM8DAAAvx8ALEJDcSJIjSfpLbcB2kihUL7179L//ULZta+tu6VMYFCrqdCkUJgqFOgsV1YVCdaGijupCRXVFoaIwKFRXFAqFQQWCG0mKpKjjG8iChuongP+5TUN6NImSqpoFjsHhFBh3YxTMiiqJJo+kVYwz5yzvW7YoZt4bjUEpCKHnREl9HNBbI28CpkTLYkYcGmCFD7MGEO5NXbT5ppEB/NFmAEDjxrxoU1ksACL5zUleB73lJ71qCcxMdIq3zrViok3Vww3rR4aIeLQkJmAbzuVEm+wcegNasyU0b8hIrM2MjyhyKs4BmrDiU228s/tY978KHimSsNa58dZj5VvTmEwyMs6tCZLyKHQlZGWujuqAc4br8TTBHbRLEVmKxHGSYsX+R+w2ZEsoPQ5zzKNaxWg2DNpxiqBamHUbovPJAQj31rIMt0+lyFAYq7EymCbm8odVFc/A62Rnqi+bEdB1nnBT0+5sRKXWAYaJ9Z91AvBd07DOjAhbswVfxVS8tk4mM0NN8oQxcY9QS1yhAUWbTF5VtvZBXyS4Sbx3U4N8E6wIpyJFkFCuGfCdzWS6IgkfILJZWOoVBasPbOZ/+VFFLuKxJDJdR0tEsA52UkaGjrdQG1E0IQA4L6USVi1c5h3nF5EOZLe4MQ3xaHZSOngIJLWRYXzweJRI7h6Q5cEqhWk55o/GDFyEwxU1XkQNLRHig3W86pTRc/HuAvRBPuj4Bh0rVx7Qihmk6EsimkYsBS0F9SXCAiAfgRW+j18+wyW+33MJm8KWS64/CDoYKRa0P0h78iD28EGtRpA2QBQkA1FuPwgtftMH6684rb/wwfqrHdZf6yw00/pbgmQ4KHn16oaIq5vl5NNYAzLth7h8P8SDs/0QMi7fTJGgj2agJugmGqVKX4OD8lOB8nEjBtVwqFbz/pRex4bW9xgaSKw7RM3qu7HtuF7R9khurEanDW3vj6z9wthla+jWL5Bbv+CbGvsFwtgan6bXmVyj7ICOqWrNiYyCy0ao3XMD7dyapKa2S0CC/k3mGOektY4e2i7VOujfLIJHWkeQlJ5TLPtQcCb1Btabm+KksQuRXtCIYqIlNBYGE7E231owIUupOP3cT3OpNs4KvMAgN0qCqF3WLx0mJCgMtJxvhAclprVOSSlBIl9z3qTboqMaMAA2ANCyW5hF5zAACwAgtLhF2COapItYL+CsIfAiQwi9kTcrsmgylGO7neI5RnvjfcuKWeAcyrHdSq1Y0oETJEUSTQYKhU4OEnnfsuybNzI4DN5sCclsG3HL/nsHfux4pYeKOPDfnQEA",
            brandLogoPaths[1] to "UklGRq4DAABXRUJQVlA4TKIDAAAvx8ALEIDbSJIjyX+rQ2g227O4p0L/+0/z/z+rtj6nL40MDUVJFI1EUXRuUXTO8zxRNBItis4tip5bFG0aiaJzi6Lo3IY+E0ALLQCs9BX8b8R0mA16U+oTAKcpNXwyOMwFB+Y+/baQDiailCZS6vh0PKNnLQCs9Pn+JMm89rCYjVq2w/E8z3OVnOd5ZaLgp8og52uljKlYnud5rifneZ5nChnP8zxb8VrB7K1Rw16mEpFLFlnlGQCIlbcApMSBqSuY0ZVsmkwDANqetwBQGQBAkTBaB3K3gT2k1mq1zGOMGV3J6x60NwDwN7uMs6PrUp5xAeCeYm0YGnou9g6YdzEi+m7uhBwjjcFg0Ey8RXQIWp3JFaBpQTgjObviGahW6QBAMmtVnnn4DgDmA5w4O6lG1FNkzcHFtiTZEQeNEyUREad2BMcqGwBJRVHuAiCxA7nR4js2iEFPpRUADC1YthFxLgCQbXIBsFGuBQD1QIPyIR4AfGIqeXAxLfDryBTUmyQAngpWtNvtnl1hDHpq2gBAWdkBiPsMwbNNLgCSJssHKrvd7tNMoVKpFD0xsB1t0Fc6ANCu8zaoN9kQbVruVFTNLACsPTcAF3WVwVzxNgAudiY5m9oDnDvINnmWAHCYNOw1DACILS5YK5USAIRZ2+sWwzCMzDOfAMBOm8hSAJDMiku44O8WSQDEBnkLQJIt6Xu2izH6XgGwsFcwwdZiAMDW4dwALPvMtIuIMzobsF1BEgCfWopg6ZDXAKA0DRxckz0iGZl1RCTXW90ZdFf4BEBqqYNHi7EDsHpMaJy4U588GeWUbou8OfF0hRkAVB1T0LSIBwDLCiVNHxNOEKmD+wptsDZY3wFIbI/MAKSX8AjywtsgIzI6nU6fmIJElOsYNwAoKwMAWGjA+Y70DQzBs8IeGCIBANSVDYD7ChKCU56ppaCckP49VMHOJJ4BgIOIVEFkMrkEwNMdjAMAfBfkDKP0FtGDRoxj5DZ1PZ6ymWoPIsYFAA6NjFF6IApERE4AENUsEatzAYD+DlL4jqHIzEg1Gj7VJiJd6LrYoAkAfPcdqU/MAU6n0+nYp0jp6nli6QD5+zXI1POdp1SflW4FHTh4hjhzw3c9Q0dk0muQzt0QFVSqnR2zjO4hkguiU/LdJ6uOo1ohCIIgL0gjCIKQeC2Mg0YQBIEbyYVpQoxn3ooOp8Nm5KnLqL21uyW47SY50VUf58+E3fqs64Pa+BvDsdT0AQE="
        )
        brandLogoReplacements.forEach { (path, encoded) ->
            // copy=false is essential here: it stages an exact replacement for
            // this archive entry without attempting to decode the original WebP.
            val output = get(path, copy = false)
            output.parentFile?.mkdirs()
            output.writeBytes(Base64.getDecoder().decode(encoded))
        }

        var matchedStyles = 0
        var darkItemsUpdated = 0
        var lightItemsUpdated = 0
        var windowBackgroundsUpdated = 0
        var colorBackgroundsUpdated = 0
        var couiBackgroundAttributesUpdated = 0

        valuesPaths.forEach { path ->
            val source = get(path).readText()
            if (!source.contains("<style")) return@forEach

            document(path).use { xml ->
                val styles = xml.getElementsByTagName("style")
                for (index in 0 until styles.length) {
                    val style = styles.item(index) as? Element ?: continue
                    if (style.getAttribute("name") !in HEY_MELODY_THEME_NAMES) continue

                    matchedStyles++
                    if (style.setThemeItem(xml, "isCOUIDarkTheme", "true")) {
                        darkItemsUpdated++
                    }
                    if (style.setThemeItem(xml, "isCOUILightTheme", "false")) {
                        lightItemsUpdated++
                    }
                    if (style.setThemeItem(
                            xml,
                            "couiColorBackground",
                            "@color/melody_ui_common_window_background_color"
                        )) {
                        couiBackgroundAttributesUpdated++
                    }
                    if (style.setThemeItem(
                            xml,
                            "couiColorBackgroundWithCard",
                            "@color/melody_ui_detail_bg"
                        )) {
                        couiBackgroundAttributesUpdated++
                    }

                    // In the original APK MelodyUiTheme.Activity sets
                    // android:windowBackground to ?attr/coui_color_background_with_card.
                    // That COUI token resolves to #FFFFFF in the night palette.
                    // Use HeyMelody's own night-aware window background instead.
                    if (style.setThemeItem(
                            xml,
                            "android:windowBackground",
                            "@color/melody_ui_common_window_background_color"
                        )) {
                        windowBackgroundsUpdated++
                    }
                    if (style.setThemeItem(
                            xml,
                            "android:colorBackground",
                            "@color/melody_ui_common_window_background_color"
                        )) {
                        colorBackgroundsUpdated++
                    }
                }
            }
        }

        // These two parts of the UI still contain literal light-theme text colors
        // instead of theme attributes. In dark mode the literals remain black,
        // making tutorial copy and supported-device names disappear on black
        // backgrounds. Change only those known layouts; leave all other screens
        // and their colors untouched.
        val supportedDeviceLayouts = setOf(
            "res/layout/heymelody_app_fragment_supported_devices.xml",
            "res/layout/heymelody_app_item_devices_support.xml",
            "res/layout/heymelody_app_item_devices_support_tip.xml"
        )
        val guideLayoutPrefix = "res/layout/melody_ui_control_guide_"
        val layoutPaths = decode("res/layout/*.xml").filter { path ->
            path in supportedDeviceLayouts || path.startsWith(guideLayoutPrefix)
        }
        val missingSupportedLayouts = supportedDeviceLayouts - layoutPaths.toSet()
        if (missingSupportedLayouts.isNotEmpty()) {
            throw PatchException(
                "Could not decode HeyMelody supported-device layouts: ${missingSupportedLayouts.joinToString()}"
            )
        }
        val tutorialEntranceLayout = "res/layout/melody_ui_control_guide_entrance_layout.xml"
        if (tutorialEntranceLayout !in layoutPaths) {
            throw PatchException(
                "Could not decode HeyMelody's View tutorial layout: $tutorialEntranceLayout"
            )
        }

        var supportedPrimaryTextUpdated = 0
        var supportedSecondaryTextUpdated = 0
        var supportedDividersUpdated = 0
        var guidePrimaryTextUpdated = 0
        var guideSecondaryTextUpdated = 0

        layoutPaths.forEach { path ->
            document(path).use { xml ->
                val elements = xml.getElementsByTagName("*")
                for (index in 0 until elements.length) {
                    val element = elements.item(index) as? Element ?: continue
                    val textColorAttributes = listOf("android:textColor", "textColor")

                    if (path in supportedDeviceLayouts) {
                        when (path) {
                            "res/layout/heymelody_app_item_devices_support_tip.xml" -> {
                                if (element.replaceLiteralColorAttribute(
                                        textColorAttributes,
                                        setOf("#ff000000", "#000000"),
                                        "#8CFFFFFF"
                                    )) {
                                    supportedSecondaryTextUpdated++
                                }
                            }
                            else -> {
                                if (element.replaceLiteralColorAttribute(
                                        textColorAttributes,
                                        setOf("#ff000000", "#000000"),
                                        "#DEFFFFFF"
                                    )) {
                                    supportedPrimaryTextUpdated++
                                }
                            }
                        }

                        // The supported-devices divider is translucent black in
                        // the original layout and becomes invisible on a black page.
                        if (path == "res/layout/heymelody_app_fragment_supported_devices.xml" &&
                            element.replaceLiteralColorAttribute(
                                listOf("android:background", "background"),
                                setOf("#0f000000", "#0F000000"),
                                "#26FFFFFF"
                            )) {
                            supportedDividersUpdated++
                        }
                    } else {
                        // Preserve the original alpha values while changing the
                        // tutorial's hard-coded black title/body colors to white.
                        if (element.replaceLiteralColorAttribute(
                                textColorAttributes,
                                setOf("#d9000000"),
                                "#D9FFFFFF"
                            )) {
                            guidePrimaryTextUpdated++
                        }
                        if (element.replaceLiteralColorAttribute(
                                textColorAttributes,
                                setOf("#8c000000"),
                                "#8CFFFFFF"
                            )) {
                            guideSecondaryTextUpdated++
                        }
                    }
                }
            }
        }

        if (matchedStyles == 0) {
            throw PatchException(
                "Could not find HeyMelody's existing activity theme definitions in default values XML resources."
            )
        }

        println(
            "HeyMelody dark theme: updated $surfaceColorsUpdated existing surface/text color value(s), " +
                "matched $matchedStyles theme style(s), set $darkItemsUpdated COUI dark flag(s), " +
                "$lightItemsUpdated COUI light flag(s), $couiBackgroundAttributesUpdated COUI background " +
                "attribute(s), $windowBackgroundsUpdated windowBackground item(s), and " +
                "$colorBackgroundsUpdated colorBackground item(s); updated $supportedPrimaryTextUpdated supported-device " +
                "primary text color(s), $supportedSecondaryTextUpdated secondary text color(s), " +
                "$supportedDividersUpdated divider(s), $guidePrimaryTextUpdated tutorial title/body primary color(s), " +
                "and $guideSecondaryTextUpdated tutorial secondary color(s); updated $brandButtonStrokesUpdated " +
                "inactive brand-filter stroke(s) and replaced ${brandLogoReplacements.size} brand logo asset(s). " +
                "No resource IDs were added and no additional DEX instructions were changed."
        )
    }
}

private object HeyMelodyApplicationOnCreateFingerprint : Fingerprint(
    definingClass = HEY_MELODY_APPLICATION,
    name = "onCreate",
    returnType = "V",
    parameters = emptyList()
)

private fun ReferenceInstruction.fieldReferenceOrNull(): FieldReference? =
    reference as? FieldReference

private fun ReferenceInstruction.methodReferenceOrNull(): MethodReference? =
    reference as? MethodReference

/**
 * HeyMelody 117.6.6 contains a guarded AppCompat default-mode update in
 * Application.onCreate(). The requested value is 1 (MODE_NIGHT_NO), and the
 * method skips the update when its LN8/c.l feature gate is true. When skipped,
 * AppCompat remains at MODE_NIGHT_UNSPECIFIED and follows the device theme.
 *
 * Change the requested value to MODE_NIGHT_YES (2), then let the app's own
 * AppCompat code update its default-mode field and run its delegate refresh.
 * Force only the local result of that gate to false in this one method so the
 * native update path always runs. No UiModeManager API or Android Force Dark
 * is used.
 */
@Suppress("unused")
val heyMelodyDarkModePatch = bytecodePatch(
    name = "Dark mode",
    description = "Enables HeyMelody's native night mode.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HEY_MELODY)
    dependsOn(heyMelodyDarkThemeResourcePatch)

    execute {
        val method = HeyMelodyApplicationOnCreateFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("HeyMelodyApplication.onCreate() has no implementation")
        val instructions = implementation.instructions.toList()

        if (implementation.registerCount < 3) {
            throw PatchException(
                "Unexpected HeyMelodyApplication.onCreate() register layout; at least v0 and v1 are required"
            )
        }

        // In the inspected 117.6.6 APK, the first instruction is const/4 v0, 1
        // (AppCompat MODE_NIGHT_NO). Verify it rather than patching an unknown layout.
        val originalModeInstruction = instructions.firstOrNull()
            ?: throw PatchException("HeyMelodyApplication.onCreate() is empty")
        val originalModeRegister =
            (originalModeInstruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Unexpected register format for HeyMelody's initial mode constant")
        val originalModeValue =
            (originalModeInstruction as? NarrowLiteralInstruction)?.narrowLiteral
        if (originalModeInstruction.opcode != Opcode.CONST_4 ||
            originalModeRegister != 0 || originalModeValue != 1) {
            throw PatchException(
                "Unexpected HeyMelody onCreate() night-mode constant; expected const/4 v0, 1"
            )
        }

        val superCallIndex = instructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.INVOKE_SUPER) {
                false
            } else {
                val reference = (instruction as? ReferenceInstruction)
                    ?.methodReferenceOrNull()
                reference?.definingClass == "Landroid/app/Application;" &&
                    reference.name == "onCreate" &&
                    reference.returnType == "V" &&
                    reference.parameterTypes.isEmpty()
            }
        }
        if (superCallIndex != 1) {
            throw PatchException(
                "Unexpected HeyMelody onCreate() layout: Application.onCreate() must be the second instruction"
            )
        }

        // Find HeyMelody's existing gate around its AppCompat default-mode update.
        val gateIndex = instructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.SGET_BOOLEAN) {
                false
            } else {
                val reference = (instruction as? ReferenceInstruction)
                    ?.fieldReferenceOrNull()
                reference?.definingClass == APP_MODE_GATE_CLASS &&
                    reference.name == "l" &&
                    reference.type == "Z"
            }
        }
        if (gateIndex < 0) {
            throw PatchException("Could not find HeyMelody's AppCompat night-mode gate LN8/c->l")
        }

        val gateRead = instructions[gateIndex] as? OneRegisterInstruction
            ?: throw PatchException("Unexpected AppCompat night-mode gate register instruction")
        val gateBranch = instructions.getOrNull(gateIndex + 1)
        val gateBranchRegister = (gateBranch as? OneRegisterInstruction)?.registerA
        if (gateBranch?.opcode != Opcode.IF_NEZ ||
            gateBranchRegister != gateRead.registerA || gateRead.registerA > 15) {
            throw PatchException(
                "Unexpected HeyMelody AppCompat night-mode gate; expected sget-boolean followed by if-nez using the same register"
            )
        }

        val modeFieldReadIndex = instructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.SGET) {
                false
            } else {
                val reference = (instruction as? ReferenceInstruction)
                    ?.fieldReferenceOrNull()
                reference?.definingClass == APPCOMPAT_DELEGATE &&
                    reference.name == "b" &&
                    reference.type == "I"
            }
        }
        if (modeFieldReadIndex <= gateIndex + 1) {
            throw PatchException("AppCompatDelegate's mode field read was not found after the HeyMelody gate")
        }

        val modeRead = instructions[modeFieldReadIndex] as? OneRegisterInstruction
            ?: throw PatchException("Unexpected AppCompatDelegate mode-field read")
        val compare = instructions.getOrNull(modeFieldReadIndex + 1)
            as? TwoRegisterInstruction
        if (instructions.getOrNull(modeFieldReadIndex + 1)?.opcode != Opcode.IF_EQ ||
            compare == null ||
            compare.registerA != modeRead.registerA ||
            compare.registerB != originalModeRegister) {
            throw PatchException(
                "Unexpected AppCompatDelegate mode comparison; refusing to change an unverified constant"
            )
        }

        val modeFieldWrite = instructions.drop(modeFieldReadIndex + 2).firstOrNull { instruction ->
            if (instruction.opcode != Opcode.SPUT) {
                false
            } else {
                val reference = (instruction as? ReferenceInstruction)
                    ?.fieldReferenceOrNull()
                reference?.definingClass == APPCOMPAT_DELEGATE &&
                    reference.name == "b" &&
                    reference.type == "I"
            }
        } ?: throw PatchException("Could not find AppCompatDelegate's matching default-mode write")

        val modeWriteRegister = (modeFieldWrite as? OneRegisterInstruction)?.registerA
        if (modeWriteRegister != originalModeRegister) {
            throw PatchException(
                "AppCompatDelegate default-mode write does not use the verified mode constant register"
            )
        }

        // Replace the original requested value after Application.onCreate() has
        // returned, so v0 is 2 when HeyMelody's own AppCompat update block runs.
        method.addInstructions(
            superCallIndex + 1,
            "const/4 v$originalModeRegister, 0x2"
        )

        // Re-read the modified instruction list because the insertion above
        // shifted later instruction indices. Zero the local gate result so the
        // app's existing AppCompatDelegate update/refresh sequence always runs.
        val updatedInstructions = method.implementation!!.instructions.toList()
        val updatedGateIndex = updatedInstructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.SGET_BOOLEAN) {
                false
            } else {
                val reference = (instruction as? ReferenceInstruction)
                    ?.fieldReferenceOrNull()
                reference?.definingClass == APP_MODE_GATE_CLASS &&
                    reference.name == "l" &&
                    reference.type == "Z"
            }
        }
        if (updatedGateIndex < 0) {
            throw PatchException("AppCompat night-mode gate disappeared after mode insertion")
        }

        val updatedGateInstruction = updatedInstructions[updatedGateIndex] as? OneRegisterInstruction
            ?: throw PatchException("Updated AppCompat gate has an unexpected register format")
        val updatedBranch = updatedInstructions.getOrNull(updatedGateIndex + 1)
        if (updatedBranch?.opcode != Opcode.IF_NEZ ||
            (updatedBranch as? OneRegisterInstruction)?.registerA != updatedGateInstruction.registerA) {
            throw PatchException("Updated AppCompat gate no longer matches the verified branch layout")
        }

        method.addInstructions(
            updatedGateIndex + 1,
            "const/4 v${updatedGateInstruction.registerA}, 0x0"
        )

        println(
            "HeyMelody native AppCompat night mode: changed requested mode from MODE_NIGHT_NO (1) " +
                "to MODE_NIGHT_YES (2), and enabled the app's existing delegate refresh path."
        )
    }
}
