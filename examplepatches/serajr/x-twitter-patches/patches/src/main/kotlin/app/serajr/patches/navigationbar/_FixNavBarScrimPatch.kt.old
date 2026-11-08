package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BOTTOM_BAR_CLASS = "Lcom/x/ui/common/h2;"
private const val BOTTOM_BAR_METHOD = "a"

private const val ANIMATED_VISIBILITY_CLASS =
    "Landroidx/compose/animation/p;"

private const val ANIMATED_VISIBILITY_METHOD = "h"

@Suppress("unused")
val fixNavBarScrimPatch = bytecodePatch(
    name = "Manter Barra Inferior Visível",
    description =
        "Mantém a barra inferior do X visível durante a rolagem da timeline.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        var targetMethod: Method? = null

        // Localiza o método original do X.
        classDefForEach { classDef ->
            if (classDef.type.toString() != BOTTOM_BAR_CLASS) {
                return@classDefForEach
            }

            val found = classDef.methods.firstOrNull { method ->
                method.name == BOTTOM_BAR_METHOD &&
                    method.returnType == "V" &&
                    method.parameterTypes.size == 10 &&
                    method.parameterTypes[0].toString() ==
                        "Landroidx/compose/runtime/internal/f;" &&
                    method.parameterTypes[1].toString() ==
                        "Ldev/chrisbanes/haze/w0;" &&
                    method.parameterTypes[2].toString() ==
                        "Lkotlin/jvm/functions/Function1;" &&
                    method.parameterTypes[3].toString() ==
                        "Landroidx/compose/ui/Modifier;" &&
                    method.parameterTypes[4].toString() ==
                        "Landroidx/compose/runtime/internal/f;" &&
                    method.parameterTypes[5].toString() == "Z" &&
                    method.parameterTypes[6].toString() == "Z" &&
                    method.parameterTypes[7].toString() ==
                        "Landroidx/compose/runtime/internal/f;" &&
                    method.parameterTypes[8].toString() ==
                        "Landroidx/compose/runtime/Composer;" &&
                    method.parameterTypes[9].toString() == "I"
            }

            if (found != null) {
                targetMethod = found
            }
        }

        val method = targetMethod
            ?: throw IllegalStateException(
                "Morphe Patcher -> Método h2.a da barra inferior não encontrado."
            )

        println(
            "Morphe Patcher -> Método da barra inferior encontrado: $method"
        )

        val mutableClass = mutableClassDefBy(method.definingClass)

        val mutableMethod = mutableClass.methods.firstOrNull {
            it.toString() == method.toString()
        } ?: throw IllegalStateException(
            "Morphe Patcher -> Não foi possível obter o método mutável h2.a."
        )

        val instructions =
            mutableMethod.implementation?.instructions?.toList()
                ?: throw IllegalStateException(
                    "Morphe Patcher -> Método h2.a não possui implementação."
                )

        // Localiza a chamada exata ao AnimatedVisibility.
        val matches = instructions.withIndex().filter { (_, instruction) ->

            if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) {
                return@filter false
            }

            val reference =
                (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference
                    ?: return@filter false

            reference.definingClass.toString() ==
                ANIMATED_VISIBILITY_CLASS &&
                reference.name == ANIMATED_VISIBILITY_METHOD &&
                reference.returnType == "V" &&
                reference.parameterTypes.size == 10
        }

        if (matches.size != 1) {
            throw IllegalStateException(
                "Morphe Patcher -> Esperada uma chamada ao AnimatedVisibility, " +
                    "mas foram encontradas ${matches.size}."
            )
        }

        val match = matches.single()
        val index = match.index

        val invokeInstruction = match.value as? Instruction3rc
            ?: throw IllegalStateException(
                "Morphe Patcher -> AnimatedVisibility não utiliza Instruction3rc."
            )

        // A chamada original utiliza v10..v19.
        if (
            invokeInstruction.startRegister != 10 ||
            invokeInstruction.registerCount != 10
        ) {
            throw IllegalStateException(
                "Morphe Patcher -> Registradores do AnimatedVisibility " +
                    "diferentes dos esperados."
            )
        }

        println(
            "Morphe Patcher -> AnimatedVisibility encontrado no índice $index."
        )

        /*
         * Chamada original:
         *
         * invoke-static/range {v10 .. v19},
         *     Landroidx/compose/animation/p;->h(...)V
         *
         * v10 = LayoutScope
         * v11 = visible (boolean)
         * v12 = Modifier
         * v13 = enter transition
         * v14 = exit transition
         * v15 = label
         * v16 = content
         * v17 = Composer
         * v18 = flags
         * v19 = default mask
         *
         * Forçamos somente o argumento visible para true.
         */
        mutableMethod.addInstructions(
            index,
            """
                const/4 v11, 0x1
            """.trimIndent()
        )

        println(
            "Morphe Patcher -> AnimatedVisibility da barra inferior " +
                "forçado para TRUE com sucesso!"
        )
    }
}
