package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.fakhradio.patches.shared.writeColors
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourcePatch

/** The app's accent getters (the green of buttons, icons and progress) with their dark-mode green as the fallback. */
private val accentFingerprints = mapOf("getNewDefaultThemeColor" to "0xff00db81", "getDefaultThemeColor" to "0xff0b9a44").map { (name, green) ->
    Fingerprint(definingClass = "Lcom/bitsmedia/android/base/util/AppThemeManager;", name = name, returnType = "I") to green
}

private fun colors(vararg names: String, value: String): Map<String, String> = names.associateWith { value }

/**
 * The app is dark only. Its greens become the wallpaper accent, and its teal backgrounds and cards the dark surface
 * roles (Android 14+) or the neutral tones of the wallpaper palette (Android 12 and 13). The night directories are
 * written too, because they win over the plain ones for the colors the app also defines for night.
 */
private val materialYouResourcePatch = resourcePatch {
    execute {
        val accent = colors(
            "color_0x7f060078", "color_0x7f0601ef", "color_0x7f060799", "color_0x7f060b58",
            "color_0x7f06085b", "color_0x7f060392", "color_0x7f060812", "color_0x7f060b63",
            value = "system_accent1_200",
        )
        fun surfaces(page: String, lowest: String, card: String, high: String) =
            colors(
                "color_0x7f060079", "color_0x7f06081c", "color_0x7f06085d", "color_0x7f060a68",
                value = page,
            ) + colors(
                "color_0x7f060be7", "color_0x7f0600dd", "color_0x7f060738", "color_0x7f06080e",
                "color_0x7f060afb", "color_0x7f060afe",
                value = lowest,
            ) + colors(
                "color_0x7f060a6d", "color_0x7f06007a", "color_0x7f060728", "color_0x7f06072d",
                "color_0x7f060a08", "color_0x7f060a10", "color_0x7f060a21", "color_0x7f060a29",
                value = card,
            ) + colors("color_0x7f060822", "color_0x7f060a6c", value = high)

        listOf("values-v31", "values-night-v31").forEach {
            writeColors(it, accent + surfaces("system_neutral1_1000", "system_neutral1_1000", "system_neutral1_900", "system_neutral2_800"))
        }
        listOf("values-v34", "values-night-v34").forEach {
            writeColors(it, accent + surfaces("system_surface_dark", "system_surface_container_lowest_dark", "system_surface_container_dark", "system_surface_container_high_dark"))
        }
    }
}

/** Compose's `Color(int)` and `Color(long)`, which the app's own palette goes through with the ARGB value. */
private val composeColorFingerprints = listOf("I", "J").map {
    Fingerprint(definingClass = "Landroidx/compose/ui/graphics/ColorKt;", name = "Color", parameters = listOf(it), returnType = "J")
}

/** Every Compose `Color` goes through this wrapper, including the ones built from floats (gradients, lerp, copy). */
private object ColorConstructorFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/graphics/Color;",
    name = "constructor-impl",
    parameters = listOf("J"),
    returnType = "J",
)

@Suppress("unused")
val materialYouPatch = patch(
    name = "Material You",
    description = "Uses your wallpaper's colors (Android 12+).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Theme")
    dependsOn(materialYouResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        composeColorFingerprints[0].method.addInstructions(
            0,
            """
                invoke-static { p0 }, Lapp/fakh/extension/muslimpro/MaterialYou;->map(I)I
                move-result p0
            """,
        )
        composeColorFingerprints[1].method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, Lapp/fakh/extension/muslimpro/MaterialYou;->map(J)J
                move-result-wide p0
            """,
        )
        ColorConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, Lapp/fakh/extension/muslimpro/MaterialYou;->mapPacked(J)J
                move-result-wide p0
            """,
        )
        accentFingerprints.forEach { (fingerprint, green) ->
            fingerprint.method.addInstructions(
                0,
                """
                    const v0, $green
                    invoke-static { p1, v0 }, Lapp/fakh/extension/muslimpro/MaterialYou;->accent(Landroid/content/Context;I)I
                    move-result p1
                    return p1
                """,
            )
        }
    }
}
