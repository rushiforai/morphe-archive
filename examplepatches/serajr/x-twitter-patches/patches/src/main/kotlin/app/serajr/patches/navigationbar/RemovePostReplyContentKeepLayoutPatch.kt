package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val REPLY_CLASS = "Lcom/x/composer/minimal/b;"
private const val REPLY_CONTENT_CALL = "Lcom/x/composer/minimal/b;->e("

@Suppress("unused")
val removePostReplyContentKeepLayoutPatch = bytecodePatch(
    name = "Remove Post Reply Content (Keep Layout) - Experimental",
    description = "Removes the inner post reply composer while preserving its parent Compose layout and native Haze configuration.",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        // Find the parent reply composable using its full signature.
        var original: Method? = null

        classDefForEach { classDef ->
            if (classDef.type == REPLY_CLASS) {
                original = classDef.methods.singleOrNull { method ->
                    method.name == "c" &&
                        method.returnType == "V" &&
                        method.parameterTypes.map { it.toString() } ==
                        listOf(
                            "Ldev/chrisbanes/haze/a1;",
                            "Ljava/lang/String;",
                            "Lcom/x/composer/minimal/j0;",
                            "Lkotlinx/coroutines/channels/m;",
                            "Lkotlinx/coroutines/channels/m;",
                            "Lkotlin/jvm/functions/Function1;",
                            "Lkotlin/jvm/functions/Function1;",
                            "Lkotlin/jvm/functions/Function2;",
                            "Lkotlin/jvm/functions/Function1;",
                            "Lkotlin/jvm/functions/Function0;",
                            "Lkotlin/jvm/functions/Function0;",
                            "Lkotlin/jvm/functions/Function0;",
                            "Lkotlin/jvm/functions/Function0;",
                            "Lkotlin/jvm/functions/Function0;",
                            "Lkotlin/jvm/functions/Function1;",
                            "Lkotlin/jvm/functions/Function1;",
                            "Lkotlin/jvm/functions/Function1;",
                            "Landroidx/compose/ui/Modifier;",
                            "Landroidx/compose/runtime/Composer;",
                            "I",
                            "I"
                        )
                }
            }
        }

        val target = requireNotNull(original) {
            "D3-I3: parent reply composable not found."
        }

        val method = mutableClassDefBy(target.definingClass)
            .methods.first { it.toString() == target.toString() }

        val instructions = requireNotNull(method.implementation) {
            "D3-I3: missing method implementation."
        }.instructions.toList()

        // Locate the single inner reply composer invocation.
        val matches = instructions.indices.filter { index ->
            val instruction = instructions[index]

            instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                (instruction as? ReferenceInstruction)
                    ?.reference
                    ?.toString()
                    ?.startsWith(REPLY_CONTENT_CALL) == true
        }

        require(matches.size == 1) {
            "D3-I3: expected one inner reply composer call, found ${matches.size}."
        }

        // Keep the parent layout and Compose group boundaries.
        // Only suppress the inner reply composer invocation.
        method.replaceInstruction(matches.single(), "nop")
    }
}
