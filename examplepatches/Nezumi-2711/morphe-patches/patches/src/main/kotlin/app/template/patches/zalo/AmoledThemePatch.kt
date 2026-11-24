package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

// AMOLED palette. Base surfaces are true black; elevated surfaces stay slightly
// lifted so sheets, popups and bubbles remain distinguishable on black.
private const val BLACK = "#ff000000"
private const val ELEVATED = "#ff121212"

/** Shared by headers and the bottom navigation bar so both match. */
private const val BAR = ELEVATED
private const val ELEVATED_2 = "#ff1a1a1a"
private const val BUBBLE = "#ff1f1f1f"
private const val PRESSED = "#ff1c1c1c"
private const val SELECTED = "#ff171717"
private const val SELECTED_ALT = "#ff262626"
private const val DIVIDER_SUBTLE = "#1affffff"
private const val DIVIDER_REGULAR = "#24ffffff"

/** Legacy `Dark_*` colors, referenced by `ThemeDefault.Dark`. */
private val legacyDarkColors = mapOf(
    // Page, list and header surfaces.
    "Dark_PrimaryBackgroundColor" to BLACK,
    "Dark_StoryPrimaryBackgroundColor" to BLACK,
    "Dark_CSCPrimaryBackground" to BLACK,
    "Dark_TimelinePrimaryBackgroundColor" to BLACK,
    "Dark_TabBackgroundColor" to BLACK,
    "Dark_FooterBackgroundColor" to BLACK,
    "Dark_ChatBarBackgroundColor" to BLACK,
    "Dark_HeaderStartColor" to BAR,
    "Dark_HeaderEndColor" to BAR,
    "Dark_HeaderFormColor" to BAR,
    "Dark_HeaderFormChatThemeColor" to BAR,
    "Dark_ProfileHeaderSolidColor" to BAR,
    "Dark_ActionBarInAppBrowserColor" to BAR,
    "Dark_BgEmoji" to BLACK,
    "Dark_indicator_bg_color" to BLACK,
    "Dark_feed_ads_footer_bg_color" to BLACK,
    "Dark_bg_feed_link" to ELEVATED,
    // Elevated surfaces.
    "Dark_BottomNav" to BAR,
    "Dark_ItemBackgroundPinChat" to ELEVATED,
    "Dark_SearchBackgroundColor" to BUBBLE,
    "Dark_PopupBackgroundColor" to ELEVATED_2,
    "Dark_PopupBackgroundShadowColor" to ELEVATED,
    "Dark_CSCSecondaryBackground" to ELEVATED_2,
    "Dark_BannerBackgroundColor1" to ELEVATED_2,
    "Dark_BannerBackgroundColor2" to ELEVATED_2,
    "Dark_BannerRemindSetPassBackupBG" to ELEVATED_2,
    "Dark_bg_bottom_sheet_suggestion_sticker" to ELEVATED,
    // Received chat bubbles.
    "Dark_ReceiverBubbleChatNormal" to BUBBLE,
    "Dark_ReceiverBubbleChatAdmin" to BUBBLE,
    "Dark_ReceiverBubbleChatHighlight" to BUBBLE,
    "Dark_ReceiverBubbleChatJump" to BUBBLE,
    "Dark_ReceiverBubbleChatSearch" to BUBBLE,
    "Dark_ReceiverBubbleChatSecret" to BUBBLE,
    "Dark_ReceiverBubbleChatPressed" to PRESSED,
)

/** Z-design semantic tokens, defined in `BaseThemeDefault.Dark` only. */
private val zdesignDarkTokens = mapOf(
    "layer_background" to BLACK,
    "layer_background_subtle" to BLACK,
    "layer_background_pressed" to PRESSED,
    "layer_background_selected" to SELECTED,
    "layer_background_selected_alt" to SELECTED_ALT,
    "layer_container" to ELEVATED,
    "layer_container_selected" to SELECTED_ALT,
    "header_white_container" to BAR,
    "header_blue_container" to BAR,
    "zstyle_header_background" to BAR,
    "zstyle_header_tabs_background" to BAR,
    "popover_container" to ELEVATED_2,
    "popover_menu_background" to ELEVATED_2,
    "bgCSC_Background" to BLACK,
    "bgCSC_ReceivedBubble_Normal" to BUBBLE,
    "social_background" to BLACK,
    "divider_subtle" to DIVIDER_SUBTLE,
    "divider_regular" to DIVIDER_REGULAR,
)

private val amoledCompatibility = Compatibility(
    name = "Zalo",
    packageName = "com.zing.zalo",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x0068FF,
    targets = listOf(AppTarget(version = "26.11.01")),
)

private val amoledThemeResourcePatch = resourcePatch {
    compatibleWith(amoledCompatibility)

    execute {
        document("res/values/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")
            val found = mutableSetOf<String>()
            for (i in 0 until colors.length) {
                val color = colors.item(i) as Element
                val name = color.getAttribute("name")
                color.textContent = legacyDarkColors[name] ?: continue
                found += name
            }
            val missing = legacyDarkColors.keys - found
            check(missing.isEmpty()) { "Missing Zalo dark colors: $missing" }
        }

        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")
            val style = (0 until styles.length).map { styles.item(it) as Element }
                .single { it.getAttribute("name") == "BaseThemeDefault.Dark" }
            val items = style.getElementsByTagName("item")
            val found = mutableSetOf<String>()
            for (i in 0 until items.length) {
                val item = items.item(i) as Element
                val name = item.getAttribute("name")
                item.textContent = zdesignDarkTokens[name] ?: continue
                found += name
            }
            val missing = zdesignDarkTokens.keys - found
            check(missing.isEmpty()) { "Missing Zalo dark theme tokens: $missing" }
        }
    }
}

private const val ZOM_BACKGROUND = "Lcom/zing/zalo/zinstant/zom/properties/ZOMBackground;"
private val ZINSTANT_COLOR_FIELDS = setOf("mColor", "mPressedColor")

/** Native layout results deliver Zinstant backgrounds through this setter. */
private object ZinstantBackgroundUpdateFingerprint : Fingerprint(
    definingClass = ZOM_BACKGROUND,
    name = "updateData",
    returnType = "V",
)

/** Cached Zinstant layouts are restored through this deserializer. */
private object ZinstantBackgroundZarcelFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/zinstant/zom/properties/ZOMBackground__Zarcel;",
    name = "createFromSerialized",
    returnType = "V",
)

private const val REMAP = "$AMOLED_THEME->zinstantBackground(I)I"

@Suppress("unused")
val amoledThemePatch = bytecodePatch(
    name = "AMOLED dark theme",
    description = "Use true-black backgrounds in Zalo's dark mode, with slightly lifted popups, sheets and chat bubbles.",
    default = false,
) {
    compatibleWith(amoledCompatibility)
    dependsOn(nativeSignaturePatch, amoledThemeResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        // updateData(II...): p1 = color, p2 = pressed color. The method has no
        // spare locals, so remap the parameters in place before they are stored.
        val update = ZinstantBackgroundUpdateFingerprint.method
        check(update.parameterTypes.take(2).map { it.toString() } == listOf("I", "I"))
        update.addInstructions(0, """
            invoke-static {p1}, $REMAP
            move-result p1
            invoke-static {p2}, $REMAP
            move-result p2
        """)

        // createFromSerialized: remap the freshly read value before it is stored.
        // Later stores to the same fields only normalize a sentinel and are left alone.
        val zarcel = ZinstantBackgroundZarcelFingerprint.method
        val instructions = zarcel.implementation!!.instructions.toList()
        val stores = instructions.indices.filter { index ->
            val field = (instructions[index] as? ReferenceInstruction)?.reference as? FieldReference
            index > 0 && instructions[index - 1].opcode == Opcode.MOVE_RESULT &&
                instructions[index].opcode == Opcode.IPUT && field != null &&
                field.definingClass == ZOM_BACKGROUND && field.name in ZINSTANT_COLOR_FIELDS
        }
        check(stores.size == 2) { "Expected two Zinstant background color stores, found ${stores.size}" }
        stores.asReversed().forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            zarcel.addInstructions(index, """
                invoke-static {v$register}, $REMAP
                move-result v$register
            """)
        }
    }
}
