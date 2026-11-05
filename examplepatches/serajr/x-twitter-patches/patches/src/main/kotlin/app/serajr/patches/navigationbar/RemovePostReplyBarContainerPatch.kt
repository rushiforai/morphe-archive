package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val REPLY_CLASS = "Lcom/x/composer/minimal/b;"
private const val REPLY_CONTENT = "Lcom/x/composer/minimal/b;->c("

private const val HAZE_MODIFIER = "Lcom/x/compose/core/m0;->b("
private const val PADDING_MODIFIER =
    "Landroidx/compose/foundation/layout/e;->E("
private const val MIN_SIZE_MODIFIER =
    "Landroidx/compose/foundation/layout/n3;->a("

@Suppress("unused")
val removePostReplyContainerPatch = bytecodePatch(
    name = "Remove Post Reply Container (Experimental)",
    description = "Removes the post reply content and tests a 64.dp minimum Haze container height.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        // Locate the parent reply composable using its structural signature.
        var original: Method? = null

        classDefForEach { classDef ->
            if (classDef.type == REPLY_CLASS) {
                original = classDef.methods.singleOrNull { method ->
                    method.name == "h" &&
                        method.returnType == "V" &&
                        method.parameterTypes.map { it.toString() } == listOf(
                            "Lcom/x/composer/minimal/r;",
                            "Ldev/chrisbanes/haze/a1;",
                            "Landroidx/compose/ui/Modifier;",
                            "Z",
                            "Lkotlin/jvm/functions/Function1;",
                            "Landroidx/compose/runtime/Composer;",
                            "I",
                            "I"
                        )
                }
            }
        }

        val target = requireNotNull(original) {
            "D3-I2: parent reply composable not found."
        }

        val method = mutableClassDefBy(target.definingClass)
            .methods.first { it.toString() == target.toString() }

        val implementation = requireNotNull(method.implementation) {
            "D3-I2: missing method implementation."
        }

        val instructions = implementation.instructions.toList()

        fun referenceAt(index: Int): String? =
            (instructions[index] as? ReferenceInstruction)
                ?.reference
                ?.toString()

        // Locate the unique call that renders the reply content.
        val replyCalls = instructions.indices.filter { index ->
            instructions[index].opcode == Opcode.INVOKE_STATIC_RANGE &&
                referenceAt(index)?.startsWith(REPLY_CONTENT) == true
        }

        require(replyCalls.size == 1) {
            "D3-I2: expected one reply content call, found ${replyCalls.size}."
        }

        // Locate the original Haze modifier.
        val hazeCalls = instructions.indices.filter { index ->
            instructions[index].opcode == Opcode.INVOKE_STATIC_RANGE &&
                referenceAt(index)?.startsWith(HAZE_MODIFIER) == true
        }

        require(hazeCalls.size == 1) {
            "D3-I2: expected one Haze modifier call, found ${hazeCalls.size}."
        }

        val hazeIndex = hazeCalls.single()

        // Validate the exact instruction sequence observed in JADX/Smali.
        require(hazeIndex + 4 < instructions.size) {
            "D3-I2: incomplete Haze modifier sequence."
        }

        require(
            instructions[hazeIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                instructions[hazeIndex + 2].opcode == Opcode.MOVE_OBJECT_FROM16 &&
                instructions[hazeIndex + 3].opcode == Opcode.CONST_HIGH16 &&
                instructions[hazeIndex + 4].opcode == Opcode.INVOKE_STATIC
        ) {
            "D3-I2: unexpected instructions after Haze modifier."
        }

        require(
            referenceAt(hazeIndex + 4)?.startsWith(PADDING_MODIFIER) == true
        ) {
            "D3-I2: original padding modifier not found."
        }

        // Verify that the experimental size modifier exists in this APK.
        var sizeModifierFound = false

        classDefForEach { classDef ->
            if (classDef.type == "Landroidx/compose/foundation/layout/n3;") {
                sizeModifierFound = classDef.methods.any { candidate ->
                    candidate.name == "a" &&
                        candidate.returnType == "Landroidx/compose/ui/Modifier;" &&
                        candidate.parameterTypes.map { it.toString() } == listOf(
                            "Landroidx/compose/ui/Modifier;",
                            "F",
                            "F"
                        )
                }
            }
        }

        require(sizeModifierFound) {
            "D3-I2: minimum-size modifier is unavailable."
        }

        // The insertion point uses v7 as the modifier.
        // v8 is overwritten by the original 8.dp padding constant.
        // v9 is overwritten later in the original layout sequence.
        // Keep the original Haze call, padding, and insets unchanged.
        method.addInstructions(
            hazeIndex + 3,
            """
                const v8, 0x7fc00000
                const/high16 v9, 0x42800000
                invoke-static {v7, v8, v9}, $MIN_SIZE_MODIFIER Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;
                move-result-object v7
            """.trimIndent().replace(
                "$MIN_SIZE_MODIFIER ",
                MIN_SIZE_MODIFIER
            )
        )

        // Remove the reply content without removing its parent Compose layout.
        // The original instruction index remains valid because this edit
        // is applied after the Haze modifier insertion.
        val replyIndex = replyCalls.single()
        val adjustedReplyIndex =
            if (replyIndex >= hazeIndex + 3) replyIndex + 4 else replyIndex

        method.replaceInstruction(adjustedReplyIndex, "nop")
    }
}
