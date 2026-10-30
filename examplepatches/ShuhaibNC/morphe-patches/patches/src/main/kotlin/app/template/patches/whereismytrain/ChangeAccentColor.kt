package app.template.patches.whereismytrain

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.WHEREISMYTRAIN_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.w3c.dom.Element

private data class AccentColorMethod(
    val className: String,
    val methodName: String,
    val returnType: String,
    val parameterTypes: List<String>
)

@Suppress("unused")
val changeAccentColorBytecodePatch = bytecodePatch(
    name = "Change Accent Color (Bytecode Dependency)",
    description = "Applies the selected accent color to the app's bytecode."
) {
    compatibleWith(WHEREISMYTRAIN_COMPATIBILITY)

    val accentColor by colorOption(
        key = "accent_color",
        title = "Accent Color",
        default = "#1E90FF",
        description = "Choose the color to apply to the night theme."
    )

    execute {
        val colorHex = (accentColor
            ?: throw PatchException("An accent color must be selected."))
            .removePrefix("#")
        if (colorHex.length != 6 && colorHex.length != 8) {
            throw PatchException("Accent color must be in #RRGGBB or #AARRGGBB format.")
        }
        val colorValue = colorHex.toLongOrNull(16)
            ?: throw PatchException("Accent color contains invalid hexadecimal characters.")
        val argb = if (colorHex.length == 6) 0xFF000000L or colorValue else colorValue
        val packedColor = argb shl 32
        val smaliColor = if (packedColor < 0) {
            "-0x${(-packedColor).toString(16)}L"
        } else {
            "0x${packedColor.toString(16)}L"
        }

        val targetMethods = listOf(
            AccentColorMethod(
                "Ljfx;", "aV", "V",
                listOf("Z", "Lckr;", "J", "F", "J", "Lqmr;", "Lbzj;", "I", "I")
            ),
            AccentColorMethod(
                "Ljmh;", "al", "V",
                listOf("Ljava/lang/String;", "Lqmc;", "Z", "Lbzj;", "I")
            ),
            AccentColorMethod(
                "Lkax;", "I", "V",
                listOf(
                    "Lqmr;", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z",
                    "Lqmc;", "Lqmc;", "Lqmc;", "F", "Ldjf;", "J", "F", "Lxo;", "F", "F",
                    "Laji;", "Lbzj;", "I", "I", "I"
                )
            ),
            AccentColorMethod(
                "Lmjb;", "a", "Ljava/lang/Object;",
                listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
            ),
            AccentColorMethod(
                "Logb;", "a", "Ljava/lang/Object;",
                listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
            )
        )
        val originalColor = -0xe679c700000000L

        targetMethods.forEach { target ->
            val mutableClass = mutableClassDefByOrNull(target.className)
                ?: throw PatchException("Could not find bytecode class ${target.className}.")
            val method = mutableClass.methods.singleOrNull {
                it.name == target.methodName &&
                    it.returnType == target.returnType &&
                    it.parameterTypes.map { type -> type.toString() } == target.parameterTypes
            } ?: throw PatchException(
                "Could not find method ${target.className}->${target.methodName}."
            )
            val instructions = method.instructionsOrNull
                ?: throw PatchException(
                    "Method ${target.className}->${target.methodName} has no instructions."
                )
            var replaced = false

            for (index in instructions.indices) {
                val instruction = instructions[index]
                if (
                    instruction.opcode == Opcode.CONST_WIDE &&
                    instruction is WideLiteralInstruction &&
                    instruction.wideLiteral == originalColor
                ) {
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(
                        index,
                        "const-wide v$register, $smaliColor"
                    )
                    replaced = true
                }
            }

            if (!replaced) {
                throw PatchException(
                    "Could not find the expected accent color constant in " +
                        "${target.className}->${target.methodName}."
                )
            }
        }
    }

}

@Suppress("unused")
val changeAccentColorPatch = resourcePatch(
    name = "Change Accent Color",
    description = "Changes the accent color throughout the app."
) {
    compatibleWith(WHEREISMYTRAIN_COMPATIBILITY)
    dependsOn(changeAccentColorBytecodePatch)

    val accentColor by colorOption(
        key = "accent_color",
        title = "Accent Color",
        default = "#1E90FF",
        description = "Choose the color to apply throughout the app."
    )

    execute {
        val colorNames = setOf(
            "md_green_600",
            "wimt_tag_green",
            "gm3_ref_palette_tertiary50",
            "md_theme_tertiary_container",
            "tool_tip"
        )
        val changedColors = mutableSetOf<String>()

        listOf("res/values/colors.xml", "res/values-night/colors.xml").forEach { path ->
            document(path).use { document ->
                val colors = document.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val color = colors.item(i) as? Element ?: continue
                    val name = color.getAttribute("name")
                    if (name in colorNames) {
                        color.textContent = accentColor
                        changedColors.add(name)
                    }
                }
            }
        }

        val missingColors = colorNames - changedColors
        if (missingColors.isNotEmpty()) {
            throw PatchException(
                "Could not find color resource(s): ${missingColors.sorted().joinToString()}."
            )
        }
    }
}
