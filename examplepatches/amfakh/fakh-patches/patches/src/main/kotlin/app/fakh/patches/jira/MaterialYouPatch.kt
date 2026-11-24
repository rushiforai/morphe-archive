/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.jira

import app.fakh.patches.jira.shared.Constants.COMPATIBILITY_JIRA
import app.fakh.patches.jira.shared.Constants.MATERIAL_YOU
import app.fakh.patches.jira.shared.Constants.PITCH_BLACK
import app.fakh.patches.shared.atlassian.ATLASSIAN_RAMP_ACCENTS
import app.fakh.patches.shared.featuresPatch
import app.fakh.patches.shared.register
import app.fakhradio.patches.shared.writeColors
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/fakh/extension/jira/MaterialYou;"

/** The class of the floating Rovo button, found by its name since R8 keeps it. */
private val rovoFabFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith("/rovochat/RovoChatFloatingActionButtonKt;") && method.parameterTypes.size == 7
    },
)

/**
 * Compose's getNativeCanvas: casts Compose's canvas to its Android implementation and returns the Android canvas it
 * holds. Its parameter is the type of Compose's canvas.
 */
private val nativeCanvasFingerprint = Fingerprint(
    returnType = "Landroid/graphics/Canvas;",
    custom = { method, _ ->
        method.parameterTypes.size == 1 && AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.implementation?.instructions?.map { it.opcode } ==
            listOf(Opcode.INVOKE_VIRTUAL, Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT)
    },
)

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
 * light accent tone that dark mode uses for its main accent. The older B and SB ramps come from
 * [ATLASSIAN_RAMP_ACCENTS].
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
    "board_quick_filter_label_bg_selected_dark" to "system_accent1_700",
    "swipe_background_dark" to "system_accent1_700",
    "dialogButtonText" to "system_accent1_600",
    "dialogPinEditText" to "system_accent1_600",
    "dialogRadioButton" to "system_accent1_600",
    "dialogTitleText" to "system_accent1_600",
) + ATLASSIAN_RAMP_ACCENTS

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
private val materialYouResourcePatch = patch {
    execute {
        writeColors("values-round-v31", ACCENTS + SURFACES_V31 + ("alertButtonText" to "system_accent1_600"))
        writeColors("values-round-v34", SURFACES_V34)
        writeColors("values-round-night-v31", mapOf("alertButtonText" to "system_accent1_200"))
        writeColors("values-notlong-night-v31", PITCH_BLACK_V31)
        writeColors("values-notlong-night-v34", PITCH_BLACK_V34)
    }
}

/** AppCompatActivity, which R8 renamed: the class overriding attachBaseContext, getMenuInflater and closeOptionsMenu. */
private fun appCompatActivity(): MutableClass {
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
val materialYouPatch = patch(
    name = "Material You",
    description = "Uses your wallpaper's colors (Android 12+) in light and dark mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JIRA)
    category("Theme")
    dependsOn(materialYouResourcePatch, featuresPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(MATERIAL_YOU, PITCH_BLACK)
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

        // The floating Rovo button: its container and icon take accent tones. Both are arguments (the 4th and 5th) of the
        // button's Material component, which the button's composable calls once per code path.
        val rovoButton = mutableClassDefBy(rovoFabFingerprint.classDef.type).methods.first {
            it.returnType == "V" && it.parameterTypes.size == 9
        }
        val elevation = ((rovoButton.implementation!!.instructions.first {
            it.opcode == Opcode.INVOKE_STATIC_RANGE &&
                ((it as ReferenceInstruction).reference as MethodReference).parameterTypes.size == 10 &&
                it.reference.let { r -> (r as MethodReference).parameterTypes[3].toString() == "J" }
        } as ReferenceInstruction).reference as MethodReference).parameterTypes[5].toString()
        // The button's own shadow stays behind a see-through container as a ring, so its elevation is zero there.
        mutableClassDefBy(rovoFabFingerprint.classDef.type).methods.add(
            ImmutableMethod(
                rovoFabFingerprint.classDef.type,
                "fakhFlat",
                emptyList(),
                elevation,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $EXTENSION->rovoFlat()Z
                        move-result v0
                        if-eqz v0, :keep
                        new-instance v0, $elevation
                        const/4 v1, 0x0
                        invoke-direct { v0, v1, v1, v1, v1 }, $elevation-><init>(FFFF)V
                        return-object v0
                        :keep
                        const/4 v0, 0x0
                        return-object v0
                    """,
                )
            },
        )
        // The glass of the button: drawn on the canvas the button's draw node gets, before its icon. The draw node is the
        // method that takes the Compose draw scope last, after a boolean and a long.
        val rovoDraw = mutableClassDefBy(rovoFabFingerprint.classDef.type).methods.single {
            it.parameterTypes.size == 5 && it.parameterTypes[0].toString() == "Z" && it.parameterTypes[1].toString() == "J"
        }
        // R8 renames Compose's draw types every release, so they are read from the code: the draw scope is the interface
        // whose static drawCircle the node calls with itself first, its drawContext the one abstract getter that returns
        // an object, its size the default getter that only returns drawContext's size, and the canvas the drawContext
        // getter that returns the type getNativeCanvas takes.
        val drawScope = rovoDraw.implementation!!.instructions.firstNotNullOfOrNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
                instruction.opcode == Opcode.INVOKE_STATIC_RANGE && it.parameterTypes.firstOrNull()?.toString() == it.definingClass
            }?.definingClass
        } ?: throw PatchException("The Rovo button's draw scope not found")
        val drawScopeMethods = mutableClassDefBy(drawScope).methods
        val drawContext = drawScopeMethods.single {
            AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType.startsWith("L") &&
                it.name != "getLayoutDirection"
        }
        val size = drawScopeMethods.single {
            !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == "J" &&
                it.implementation?.instructions?.count() == 5
        }
        val nativeCanvas = nativeCanvasFingerprint.method
        val canvasType = nativeCanvas.parameterTypes.single().toString()
        val drawContextClass = mutableClassDefBy(drawContext.returnType)
        val canvas = drawContextClass.methods.single { it.parameterTypes.isEmpty() && it.returnType == canvasType }
        val drawContextInvoke = if (AccessFlags.INTERFACE.isSet(drawContextClass.accessFlags)) "invoke-interface" else "invoke-virtual"
        mutableClassDefBy(rovoFabFingerprint.classDef.type).methods.add(
            ImmutableMethod(
                rovoFabFingerprint.classDef.type,
                "fakhDrawGlass",
                listOf(ImmutableMethodParameter(drawScope, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(5),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-interface { p0 }, $drawScope->${size.name}()J
                        move-result-wide v0
                        invoke-interface { p0 }, $drawScope->${drawContext.name}()${drawContext.returnType}
                        move-result-object v2
                        $drawContextInvoke { v2 }, ${drawContext.returnType}->${canvas.name}()$canvasType
                        move-result-object v2
                        invoke-static { v2 }, ${nativeCanvas.definingClass}->${nativeCanvas.name}($canvasType)Landroid/graphics/Canvas;
                        move-result-object v2
                        invoke-static { v2, v0, v1 }, Lapp/fakh/extension/jira/GlassNavigationBar;->drawRovo(Landroid/graphics/Canvas;J)V
                        return-void
                    """,
                )
            },
        )
        // The draw scope is the last parameter: the boolean, the long's two registers and the two objects come first.
        rovoDraw.addInstructions(
            0,
            """
                invoke-static/range { p5 .. p5 }, ${rovoFabFingerprint.classDef.type}->fakhDrawGlass($drawScope)V
            """,
        )
        rovoButton.implementation!!.instructions.withIndex()
            .filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).parameterTypes.map(CharSequence::toString)
                        .let { it.size == 10 && it[3] == "J" && it[4] == "J" }
            }
            .reversed()
            .forEach { (index, instruction) ->
                val start = (instruction as RegisterRangeInstruction).startRegister
                rovoButton.addInstructionsWithLabels(
                    index,
                    """
                        invoke-static/range { v${start + 3} .. v${start + 4} }, $EXTENSION->rovoContainer(J)J
                        move-result-wide v${start + 3}
                        invoke-static/range { v${start + 5} .. v${start + 6} }, $EXTENSION->rovoContent(J)J
                        move-result-wide v${start + 5}
                        invoke-static { }, ${rovoFabFingerprint.classDef.type}->fakhFlat()$elevation
                        move-result-object v${start + 7}
                        if-eqz v${start + 7}, :keep
                        and-int/lit8 v${start + 11}, v${start + 11}, -33
                        :keep
                        nop
                    """,
                )
            }
        if (rovoButton.implementation!!.instructions.none {
                it.opcode == Opcode.INVOKE_STATIC_RANGE && (it as ReferenceInstruction).reference.toString().contains("rovoContainer")
            }) throw PatchException("The Rovo button's colors not found")

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
