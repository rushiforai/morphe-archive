package app.fakh.patches.jira

import app.fakh.patches.jira.shared.Constants.COMPATIBILITY_JIRA
import app.fakhradio.patches.shared.writeColors
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION = "Lapp/fakh/extension/jira/MaterialYou;"

/** The Theme choices are built by a lambda that casts the screen's current theme, of this type. */



/**
 * Jira's Compose color palettes, which hold the blues (and the older Atlassian ramp) as packed colors set in their
 * static initializers, along with the neutral backgrounds. The tokens built from them read these fields later.
 */
private val PALETTES = listOf(
    "Lcom/atlassian/mobilekit/atlaskit/compose/theme/AdsColorPalette;",
    "Lcom/atlassian/jira/infrastructure/designsystem/foundation/color/extended/AdsColorPalette;",
    "Lcom/atlassian/mobilekit/module/atlaskit/theme/AtlasColorPalette;",
)

/**
 * Atlassian's blue ramp, which every brand token (buttons, links, selected states) and its dark twin point at, to the
 * accent tone of the same lightness. The dark tokens use the light end of the ramp, so 300 and 400 both land on the
 * light accent tone that dark mode uses for its main accent.
 */
private val ACCENTS = mapOf(
    "blue_100" to "system_accent1_50",
    "blue_200" to "system_accent1_100",
    "blue_300" to "system_accent1_200",
    "blue_400" to "system_accent1_200",
    "blue_500" to "system_accent1_500",
    "blue_600" to "system_accent1_600",
    "blue_700" to "system_accent1_600",
    "blue_800" to "system_accent1_700",
    "blue_900" to "system_accent1_800",
    "blue_1000" to "system_accent1_900",
    // The older Atlassian ramp (B*, SB*) that board filters, chips and legacy screens still read.
    "B50" to "system_accent1_50",
    "B75" to "system_accent1_100",
    "B100" to "system_accent1_200",
    "B200" to "system_accent1_500",
    "B300" to "system_accent1_600",
    "B400" to "system_accent1_600",
    "B500" to "system_accent1_700",
    "B1200" to "system_accent1_900",
    "B1300" to "system_accent1_900",
    "SB500" to "system_accent1_200",
    "SB600" to "system_accent1_500",
    "SB800" to "system_accent1_600",
    "board_quick_filter_label_bg_selected_dark" to "system_accent1_700",
    "swipe_background_dark" to "system_accent1_700",
    "dialogButtonText" to "system_accent1_600",
    "dialogPinEditText" to "system_accent1_600",
    "dialogRadioButton" to "system_accent1_600",
    "dialogTitleText" to "system_accent1_600",
)

/**
 * Surface tokens as Material 3 roles, like LinkedIn: the page canvas (sunken), the cards and bars on it, the
 * translucent neutral fill of pills and inputs, and borders. Light cards are brighter than the canvas; dark cards
 * are a step lighter than it.
 */
private val SURFACES_V34 = mapOf(
    "ads_token_light_surface_sunken" to "system_surface_container_low_light",
    "ads_token_light_surface" to "system_surface_light",
    "ads_token_light_background_neutral" to "system_surface_container_highest_light",
    "ads_token_light_border" to "system_surface_container_highest_light",
    "ads_token_dark_surface_sunken" to "system_surface_container_dark",
    "ads_token_dark_surface" to "system_surface_container_high_dark",
    "ads_token_dark_background_neutral" to "system_surface_container_high_dark",
    "ads_token_dark_border" to "system_surface_container_highest_dark",
    // The raw neutrals that screens read directly: cards, the canvas behind them, and borders.
    "neutral_0" to "system_surface_light",
    "neutral_100" to "system_surface_container_low_light",
    "neutral_200" to "system_surface_container_low_light",
    "neutral_300" to "system_surface_container_highest_light",
    "N0" to "system_surface_light",
    "N20" to "system_surface_container_low_light",
    "N30" to "system_surface_container_low_light",
    "dark_neutral_minus_100" to "system_surface_dark",
    "dark_neutral_0" to "system_surface_container_dark",
    "dark_neutral_100" to "system_surface_container_high_dark",
    "dark_neutral_200" to "system_surface_container_highest_dark",
)

/** [SURFACES_V34] as the neutral tones closest to them, for Android 12 and 13. */
private val SURFACES_V31 = mapOf(
    "ads_token_light_surface_sunken" to "system_neutral2_100",
    "ads_token_light_surface" to "system_neutral2_50",
    "ads_token_light_background_neutral" to "system_neutral2_100",
    "ads_token_light_border" to "system_neutral2_200",
    "ads_token_dark_surface_sunken" to "system_neutral1_900",
    "ads_token_dark_surface" to "system_neutral2_800",
    "ads_token_dark_background_neutral" to "system_neutral2_800",
    "ads_token_dark_border" to "system_neutral2_700",
    "neutral_0" to "system_neutral2_50",
    "neutral_100" to "system_neutral2_100",
    "neutral_200" to "system_neutral2_100",
    "neutral_300" to "system_neutral2_200",
    "N0" to "system_neutral2_50",
    "N20" to "system_neutral2_100",
    "N30" to "system_neutral2_100",
    "dark_neutral_minus_100" to "system_neutral1_1000",
    "dark_neutral_0" to "system_neutral1_900",
    "dark_neutral_100" to "system_neutral2_800",
    "dark_neutral_200" to "system_neutral2_700",
)

/**
 * Pitch black for the dark canvas, as colors: the canvas behind cards turns black and the cards on it take the
 * lowest surface tone.
 */
private val PITCH_BLACK_V34 = mapOf(
    "dark_neutral_minus_100" to "black",
    "ads_token_dark_surface_sunken" to "black",
    "dark_neutral_0" to "system_surface_dark",
    "ads_token_dark_surface" to "system_surface_dark",
)

/** [PITCH_BLACK_V34] with the neutral tones closest to the roles, for Android 12 and 13. */
private val PITCH_BLACK_V31 = mapOf(
    "dark_neutral_minus_100" to "black",
    "ads_token_dark_surface_sunken" to "black",
    "dark_neutral_0" to "system_neutral1_1000",
    "ads_token_dark_surface" to "system_neutral1_1000",
)

/**
 * The colors live under the round qualifier, which the extension forces on only while the Material You switch is
 * on, so Jira's own colors come back when it is off. Pitch black sits under notlong, forced on only while its
 * switch is on; it outranks round, night and the API level.
 */
private val materialYouResourcePatch = resourcePatch {
    execute {
        writeColors("values-round-v31", ACCENTS + SURFACES_V31 + ("alertButtonText" to "system_accent1_600"))
        writeColors("values-round-v34", SURFACES_V34)
        writeColors("values-round-night-v31", mapOf("alertButtonText" to "system_accent1_200"))
        writeColors("values-notlong-night-v31", PITCH_BLACK_V31)
        writeColors("values-notlong-night-v34", PITCH_BLACK_V34)
    }
}

/** AppCompatActivity, which R8 renamed: the class overriding attachBaseContext, getMenuInflater and closeOptionsMenu. */
private fun BytecodePatchContext.appCompatActivity(): MutableClass {
    var found: MutableClass? = null
    classDefForEach { classDef ->
        if (classDef.methods.none { it.name == "attachBaseContext" } ||
            classDef.methods.none { it.name == "getMenuInflater" } ||
            classDef.methods.none { it.name == "closeOptionsMenu" }
        ) return@classDefForEach
        if (found != null) throw PatchException("More than one AppCompatActivity candidate")
        found = mutableClassDefBy(classDef)
    }
    return found ?: throw PatchException("AppCompatActivity not found")
}

@Suppress("unused")
val materialYouPatch = bytecodePatch(
    name = "Material You",
    description = "Uses your wallpaper's colors (Android 12+): the accent color instead of Jira blue and tinted " +
        "surfaces, in light and dark mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JIRA)
    category("Theme")
    dependsOn(materialYouResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Compose palettes: their blues become the accent and their neutral backgrounds surface roles, before the
        // tokens and components copy them.
        PALETTES.forEach { type ->
            val palette = mutableClassDefBy(type)
            val initializer = palette.methods.first { it.name == "<clinit>" }
            if (initializer.implementation!!.registerCount < 2) throw PatchException("$type has too few registers")
            val smali = palette.staticFields.filter { it.type == "J" }.joinToString("\n") { field ->
                """
                    sget-wide v0, $type->${field.name}:J
                    invoke-static/range { v0 .. v1 }, $EXTENSION->paletteColor(J)J
                    move-result-wide v0
                    sput-wide v0, $type->${field.name}:J
                """
            }
            initializer.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .reversed()
                .forEach { (index, _) -> initializer.addInstructions(index, smali) }
        }

        // Views: every activity picks the Material You and pitch black colors through its base context.
        appCompatActivity().methods.first { it.name == "attachBaseContext" }.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION->wrap(Landroid/app/Activity;Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
            """,
        )
    }
}
