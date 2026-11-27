package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val COLOR_HELPER = "Ldev/brave/extension/ui/AmoledColorHelper;"

internal object SemanticColorUtilsGFingerprint : Fingerprint(
    definingClass = "Lg7b;",
    name = "g",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/TypedValue;")
)

internal object SemanticColorUtilsBFingerprint : Fingerprint(
    definingClass = "Lg7b;",
    name = "b",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I", "I")
)

internal object SemanticColorUtilsCFingerprint : Fingerprint(
    definingClass = "Lg7b;",
    name = "c",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I", "Ljava/lang/String;")
)

@Suppress("unused")
val amoledBlackThemePatch = patch(
    name = "AMOLED Black Theme",
    description = "Forces pure AMOLED black (#000000) backgrounds for dark mode surfaces, menus, omnibox, and settings."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    extendWith("extensions/brave.mpe")

    execute {
        // 1. Route Lg7b;->g(Context, TypedValue)I through AmoledColorHelper.getThemeColor
        SemanticColorUtilsGFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static {p0, p1}, $COLOR_HELPER->getThemeColor(Landroid/content/Context;Landroid/util/TypedValue;)I
                    move-result v0
                    return v0
                """.trimIndent()
            )
        }

        // 2. Also remap return value of Lg7b;->b(Context, I, I)I and Lg7b;->c(Context, I, String)I
        // using single-arg remapColor(I)I (since p0 is reused as a local inside b/c)
        listOf(SemanticColorUtilsBFingerprint, SemanticColorUtilsCFingerprint).forEach { fp ->
            fp.methodOrNull?.apply {
                val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN }
                for (retIdx in returnIndices.asReversed()) {
                    val reg = (instructions[retIdx] as OneRegisterInstruction).registerA
                    addInstructions(
                        retIdx,
                        """
                            invoke-static {v$reg}, $COLOR_HELPER->remapColor(I)I
                            move-result v$reg
                        """.trimIndent()
                    )
                }
            }
        }
    }
}
