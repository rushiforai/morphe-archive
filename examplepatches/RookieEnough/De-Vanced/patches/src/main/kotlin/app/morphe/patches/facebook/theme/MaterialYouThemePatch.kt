/*
* Copyright 2026 De-Vanced
* Copyright 2026 Hushfacebook contributors
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*
* Resource recolouring and surface rewrite adapted from Hushfacebook (GPL-3.0).
* [https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/patches/src/main/kotlin/app/morphe/patches/facebook/layout/theme/MaterialYouThemePatch.kt](https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/patches/src/main/kotlin/app/morphe/patches/facebook/layout/theme/MaterialYouThemePatch.kt)
*/

package app.morphe.patches.facebook.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import kotlin.math.abs
import kotlin.math.cbrt
import kotlin.math.pow
import org.w3c.dom.Document
import org.w3c.dom.Element

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val MATERIAL_YOU =
    "Lapp/morphe/extension/facebook/theme/MaterialYouTheme;"
private const val EXTENSION_PACKAGE = "Lapp/morphe/extension/"
private const val FDS_COLOR_SCHEME =
    "Lcom/facebook/mig/scheme/schemes/fds/FdsColorScheme;"
private const val MATERIAL_YOU_MIG =
    "$MATERIAL_YOU->mig(ILjava/lang/Object;)I"

private val SURFACE_FIELDS = listOf(
    0x101011,
    0x18191a,
    0x1c1c1d,
    0x242526,
    0x252728,
    0x3e4042,
).associate { rgb ->
    (rgb or -0x1000000) to "DARK_%06X".format(rgb)
}

private const val FALLBACK_PALETTE =
    "000000 00184A 192E60 324578 4A5C92 6375AC 7C8FC8 97AAE4 B3C5FF DBE1FF EEF0FF FEFBFF FFFFFF;" +
        "000000 1A1B21 2F3036 46464C 5D5E64 76767D 909097 ABAAB1 C6C6CD E3E2E9 F1F0F7 FEFBFF FFFFFF;" +
        "000000 191B23 2E3038 45464F 5C5E67 757680 8F909A AAAAB4 C5C6D0 E2E2EC F0F0FA FEFBFF FFFFFF"

private val TONES = listOf(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100)
private val SYSTEM_STEPS = listOf(1000, 900, 800, 700, 600, 500, 400, 300, 200, 100, 50, 10, 0)
private const val MAX_TONE_DISTANCE = 3.0

private data class NightTone(val accent: Boolean, val tone: Int) {
    val systemColor: String
        get() = "@android:color/system_" +
            (if (accent) "accent1_" else "neutral1_") +
            SYSTEM_STEPS[TONES.indexOf(tone)]

    val fallback: String
        get() = "#ff" + FALLBACK_PALETTE.split(";")[if (accent) 0 else 1]
            .trim()
            .split(" ")[TONES.indexOf(tone)]
            .lowercase()
}

private fun nightTone(value: String): NightTone? {
    val color = parseOpaque(value) ?: return null
    if (color == -0x1000000 || color == -1) return null
    val red = (color shr 16) and 0xff
    val green = (color shr 8) and 0xff
    val blue = color and 0xff
    val accent = when {
        maxOf(red, green, blue) - minOf(red, green, blue) <= 10 -> false
        isFacebookBlue(red, green, blue) -> true
        else -> return null
    }
    val lightness = lstar(red, green, blue)
    val tone = TONES.minBy { abs(it - lightness) }
    return if (abs(tone - lightness) <= MAX_TONE_DISTANCE) {
        NightTone(accent, tone)
    } else {
        null
    }
}

private fun parseOpaque(value: String): Int? {
    val hex = value.trim().removePrefix("#")
    if (hex.isEmpty() || !hex.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }) {
        return null
    }
    return when (hex.length) {
        6 -> hex.toLong(16).toInt() or -0x1000000
        8 -> if (hex.take(2).lowercase() == "ff") {
            hex.toLong(16).toInt()
        } else {
            null
        }
        else -> null
    }
}

private fun isFacebookBlue(red: Int, green: Int, blue: Int): Boolean {
    val delta = blue - minOf(red, green)
    if (blue < red || blue < green || blue < 77 || delta * 4 < blue) return false
    val turn = 60 * (red - green)
    return turn >= -40 * delta && turn <= -15 * delta
}

private fun lstar(red: Int, green: Int, blue: Int): Double {
    fun linear(channel: Int): Double {
        val value = channel / 255.0
        return if (value <= 0.04045) {
            value / 12.92
        } else {
            ((value + 0.055) / 1.055).pow(2.4)
        }
    }
    val luminance = 0.2126 * linear(red) +
        0.7152 * linear(green) +
        0.0722 * linear(blue)
    return if (luminance <= 216.0 / 24389.0) {
        luminance * 24389.0 / 27.0
    } else {
        116.0 * cbrt(luminance) - 16.0
    }
}

private fun recolourNightColours(night: Document, nightV31: Document): Int {
    val resources = nightV31.documentElement
    val present = mutableSetOf<String>()
    val existing = resources.getElementsByTagName("color")
    for (index in 0 until existing.length) {
        (existing.item(index) as? Element)?.let { present += it.getAttribute("name") }
    }

    var changed = 0
    val colors = night.getElementsByTagName("color")
    for (index in 0 until colors.length) {
        val color = colors.item(index) as? Element ?: continue
        val tone = nightTone(color.textContent) ?: continue
        val name = color.getAttribute("name")
        if (name in present) continue
        color.textContent = tone.fallback
        resources.appendChild(
            nightV31.createElement("color").also {
                it.setAttribute("name", name)
                it.textContent = tone.systemColor
            },
        )
        changed++
    }
    return changed
}

private const val NIGHT_COLORS = "res/values-night/colors.xml"
private const val NIGHT_V31_COLORS = "res/values-night-v31/colors.xml"

private val materialYouResourcePatch = resourcePatch(
    description = "Maps Facebook dark-theme resources to the phone wallpaper palette.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    finalize {
        if (packageMetadata.versionName != FacebookTargets.V580) {
            return@finalize
        }

        val night = this@finalize[NIGHT_COLORS]
        check(night.exists()) {
            "Facebook has no night colours, so text would keep its grey"
        }
        val dynamic = this@finalize[NIGHT_V31_COLORS]
        if (!dynamic.exists()) {
            dynamic.parentFile.mkdirs()
            dynamic.writeText(
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
                    "<resources>\n</resources>\n",
            )
        }
        val changed = document(NIGHT_COLORS).use { nightDocument ->
            document(NIGHT_V31_COLORS).use { dynamicDocument ->
                recolourNightColours(nightDocument, dynamicDocument)
            }
        }
        check(changed > 0) {
            "No night colour is near a palette tone, so text would keep its grey"
        }
        println("[MaterialYouTheme] recolouredNightColors=$changed")
    }
}

private fun Instruction.isSurface(): Boolean =
    opcode == Opcode.CONST &&
        this is NarrowLiteralInstruction &&
        narrowLiteral in SURFACE_FIELDS

private fun Method.writesSurface(): Boolean =
    implementation?.instructions?.any { it.isSurface() } == true

private fun MutableMethod.readSurfaceFields(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) -> instruction.isSurface() }
        .map { (index, instruction) ->
            Triple(
                index,
                (instruction as OneRegisterInstruction).registerA,
                (instruction as NarrowLiteralInstruction).narrowLiteral,
            )
        }
    sites.asReversed().forEach { (index, register, value) ->
        replaceInstruction(
            index,
            "sget v$register, $MATERIAL_YOU->${SURFACE_FIELDS.getValue(value)}:I",
        )
    }
    return sites.size
}

@Suppress("unused")
val materialYouThemePatch = bytecodePatch(
    name = "Material You theme",
    description = "Tints Facebook's dark theme with the phone's wallpaper palette.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch, amoledThemePatch, materialYouResourcePatch)

    execute {
        if (packageMetadata.versionName != FacebookTargets.V580) {
            return@execute
        }

        val owners = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) {
                return@classDefForEach
            }
            if (classDef.methods.any { it.writesSurface() }) {
                owners += classDef.type
            }
        }
        val rewritten = owners.sumOf { type ->
            mutableClassDefByOrNull(type)?.methods?.sumOf {
                it.readSurfaceFields()
            } ?: 0
        }
        check(rewritten > 0) {
            "No Facebook 580 dark surface literals found for Material You"
        }
        println("[MaterialYouTheme] rewrittenSurfaceLiterals=$rewritten")

        val fdsWrapper = FdsColorSchemeResolverFingerprint.method
        val wrapperReturns = fdsWrapper.implementation!!.instructions.withIndex()
            .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
            .map { (index, instruction) ->
                index to (instruction as OneRegisterInstruction).registerA
            }
        check(wrapperReturns.isNotEmpty()) {
            "Facebook 580 FDS scheme has no resolver return site"
        }
        wrapperReturns.asReversed().forEach { (index, register) ->
            check(register < 16) {
                "Facebook 580 FDS resolver return register is out of invoke-static range"
            }
            fdsWrapper.addInstructions(
                index,
                """
                    invoke-static {v$register, p1}, $MATERIAL_YOU_MIG
                    move-result v$register
                """.trimIndent(),
            )
        }
        println(
            "[MaterialYouTheme] hookedFdsWrapper=" +
                "${fdsWrapper.definingClass}->${fdsWrapper.name} " +
                "returns=${wrapperReturns.size}",
        )
    }
}

private object FdsColorSchemeResolverFingerprint : app.morphe.patcher.Fingerprint(
    definingClass = FDS_COLOR_SCHEME,
    name = "Eb2",
    returnType = "I",
    parameters = listOf("LX/GIc;"),
)
