package app.jofslash.patches.googlehealth.theme

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/googlehealth/BlackThemePatch;"

/** A Material 3 color scheme has more than 30 colors; a constructor with fewer isn't its main one. */
private const val MIN_COLORS = 30

// Compose Material 3's ColorScheme, obfuscated. Its toString keeps the names of the colors.
internal object ColorSchemeToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("ColorScheme(primary="),
)

@Suppress("unused")
val blackThemePatch = bytecodePatch(
    name = "Black theme",
    description = "Makes the background and cards pure black instead of dark gray in the dark theme, " +
            "which saves battery on OLED screens. Buttons, charts and pop-ups keep their colors.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    extendWith("extensions/extension.mpe")

    execute {
        val colorScheme = ColorSchemeToStringFingerprint.classDef
        val constructors = colorScheme.methods.filter { method ->
            AccessFlags.CONSTRUCTOR.isSet(method.accessFlags) &&
                    method.parameterTypes.count { it.toString() == "J" } >= MIN_COLORS
        }
        if (constructors.isEmpty()) throw PatchException("Couldn't find the color scheme's constructor")

        constructors.forEach { constructor ->
            // Parameters come last in the registers, after p0 (this). A long takes two registers.
            var register = 1
            val smali = buildString {
                constructor.parameterTypes.forEach { type ->
                    val wide = type.toString() == "J" || type.toString() == "D"
                    if (type.toString() == "J") {
                        appendLine("invoke-static/range { p$register .. p${register + 1} }, $EXTENSION_CLASS->black(J)J")
                        appendLine("move-result-wide p$register")
                    }
                    register += if (wide) 2 else 1
                }
            }
            constructor.addInstructions(0, smali)
        }
    }
}
