package app.liquidmusic.patches.applemusic.layout.liquidglass

import app.liquidmusic.patches.applemusic.shared.Constants.COMPATIBILITY_APPLE_MUSIC
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/liquidmusic/extension/LiquidGlassPatch;"

@Suppress("unused")
val liquidGlassPatch = bytecodePatch(
    name = "Liquid Glass",
    description = "Native Android Liquid Glass for Apple Music: AGSL refraction, vibrancy, " +
        "specular rim highlights, draggable liquid tab bar, and live in-app settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_APPLE_MUSIC)

    extendWith("extensions/liquidglass.mpe")

    val blurRadius by intOption(
        key = "blurRadius",
        default = 0,
        values = mapOf(
            "Off" to 0,
            "Light" to 4,
            "Frosted" to 12,
        ),
        title = "Blur radius",
        description = "Blur of the content behind the glass, in dp. Off keeps the glass clear.",
        required = true,
    ) { it != null && it in 0..64 }

    val refractionHeight by intOption(
        key = "refractionHeight",
        default = 24,
        values = mapOf(
            "Off" to 0,
            "Thin" to 12,
            "Default" to 24,
            "Thick" to 32,
        ),
        title = "Refraction width",
        description = "Width of the refracted edge band in dp (Android 13+).",
        required = true,
    ) { it != null && it in 0..64 }

    val refractionAmount by intOption(
        key = "refractionAmount",
        default = 24,
        values = mapOf(
            "Subtle" to 12,
            "Default" to 24,
            "Strong" to 40,
        ),
        title = "Refraction strength",
        description = "Edge displacement strength in dp (Android 13+).",
        required = true,
    ) { it != null && it in 0..96 }

    val saturation by intOption(
        key = "saturation",
        default = 150,
        values = mapOf(
            "Unchanged" to 100,
            "Default" to 150,
            "Vivid" to 200,
        ),
        title = "Vibrancy",
        description = "Color saturation behind the glass, in percent.",
        required = true,
    ) { it != null && it in 0..300 }

    val tintOpacity by intOption(
        key = "tintOpacity",
        default = 40,
        values = mapOf(
            "Clear" to 0,
            "Default" to 40,
            "Apple default" to 100,
        ),
        title = "Tint opacity",
        description = "Opacity kept from Apple Music's translucent overlay, in percent.",
        required = true,
    ) { it != null && it in 0..100 }

    val highlight by intOption(
        key = "highlight",
        default = 100,
        values = mapOf(
            "Off" to 0,
            "Soft" to 50,
            "Default" to 100,
        ),
        title = "Edge highlight",
        description = "Intensity of the specular rim highlight, in percent.",
        required = true,
    ) { it != null && it in 0..100 }

    val chromaticAberration by booleanOption(
        key = "chromaticAberration",
        default = false,
        title = "Chromatic aberration",
        description = "Prism color dispersion on refracted edges (Android 13+).",
    )

    val applyToSearchBar by booleanOption(
        key = "applyToSearchBar",
        default = true,
        title = "Search bar",
        description = "Applies Liquid Glass to the floating search bar and tablet top bar.",
    )

    val applyToSidebar by booleanOption(
        key = "applyToSidebar",
        default = true,
        title = "Tablet sidebar",
        description = "Applies Liquid Glass to the sidebar on tablets.",
    )

    val liquidTabBar by booleanOption(
        key = "liquidTabBar",
        default = true,
        title = "Liquid tab bar",
        description = "Draws a draggable glass drop under the active tab. Long-press to open settings.",
    )

    val tabLabels by booleanOption(
        key = "tabLabels",
        default = true,
        title = "Tab labels",
        description = "Shows tab names below icons in the liquid tab bar.",
    )

    val hideNewTab by booleanOption(
        key = "hideNewTab",
        default = false,
        title = "Hide the New tab",
        description = "Hides the New tab from the liquid tab bar.",
    )

    val hideRadioTab by booleanOption(
        key = "hideRadioTab",
        default = false,
        title = "Hide the Radio tab",
        description = "Hides the Radio tab from the liquid tab bar.",
    )

    val startTab by stringOption(
        key = "startTab",
        default = "home",
        values = mapOf(
            "Home" to "home",
            "New" to "new",
            "Radio" to "radio",
            "Library" to "library",
            "Search" to "search",
        ),
        title = "Start tab",
        description = "Tab selected when the app opens.",
        required = true,
    ) { it in setOf("home", "new", "radio", "library", "search") }

    val tabHaptics by booleanOption(
        key = "tabHaptics",
        default = true,
        title = "Haptic feedback",
        description = "Light haptic tick when switching tabs.",
    )

    execute {
        BlurViewDrawFingerprint.let { fingerprint ->
            val superDraw = fingerprint.instructionMatches.last().methodReference.toSmali()

            fingerprint.method.apply {
                val registerCount = implementation!!.registerCount
                val thisRegister = registerCount - 2
                val canvasRegister = registerCount - 1
                val resultRegister = findFreeRegister(0, thisRegister, canvasRegister)

                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->drawBlurView(Landroid/view/View;Landroid/graphics/Canvas;)Z
                        move-result v$resultRegister
                        if-eqz v$resultRegister, :original
                        invoke-super/range { p0 .. p1 }, $superDraw
                        return-void
                    """,
                    ExternalLabel("original", getInstruction(0)),
                )
            }
        }

        mutableClassDefBy(EXTENSION_CLASS).methods.apply {
            fun method(name: String): MutableMethod = first { it.name == name }

            method("blurRadiusDp").returnEarly(blurRadius!!)
            method("refractionHeightDp").returnEarly(refractionHeight!!)
            method("refractionAmountDp").returnEarly(refractionAmount!!)
            method("saturationPercent").returnEarly(saturation!!)
            method("tintOpacityPercent").returnEarly(tintOpacity!!)
            method("highlightPercent").returnEarly(highlight!!)
            method("chromaticAberration").returnEarly(chromaticAberration == true)
            method("applyToSearchBar").returnEarly(applyToSearchBar != false)
            method("applyToSidebar").returnEarly(applyToSidebar != false)
            method("liquidTabBar").returnEarly(liquidTabBar != false)
            method("tabLabels").returnEarly(tabLabels != false)
            method("hideNewTab").returnEarly(hideNewTab == true)
            method("hideRadioTab").returnEarly(hideRadioTab == true)
            method("startTab").returnEarly(startTab ?: "home")
            method("tabHaptics").returnEarly(tabHaptics != false)
        }
    }
}

private fun MethodReference.toSmali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
