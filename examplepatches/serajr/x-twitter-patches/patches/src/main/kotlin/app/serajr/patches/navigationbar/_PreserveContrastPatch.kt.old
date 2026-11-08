package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val NAVBAR_CLASS = "Lcom/x/compose/navbars/h;"
private const val NAVBAR_METHOD = "f"

@Suppress("unused")
val forceNavigationBarContrastPatch = bytecodePatch(
    name = "Preservar contraste da Barra de Navegação",
    description =
        "Mantém permanentemente a proteção visual da barra de navegação sem alterar o edge-to-edge.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        var targetMethod: Method? = null

        classDefForEach { classDef ->
            if (classDef.type.toString() != NAVBAR_CLASS) {
                return@classDefForEach
            }

            val found = classDef.methods.firstOrNull { method ->
                method.name == NAVBAR_METHOD &&
                    method.returnType == "V" &&
                    method.parameterTypes.size == 3 &&
                    method.parameterTypes[0].toString() ==
                        "Lcom/x/compose/navbars/l;" &&
                    method.parameterTypes[1].toString() == "Z" &&
                    method.parameterTypes[2].toString() ==
                        "Landroid/app/Activity;"
            }

            if (found != null) {
                targetMethod = found
            }
        }

        val method = targetMethod
            ?: throw IllegalStateException(
                "Morphe Patcher -> Método de proteção da navigation bar do X não encontrado."
            )

        println(
            "Morphe Patcher -> Método de navigation bar encontrado: $method"
        )

        val mutableClass = mutableClassDefBy(method.definingClass)

        val mutableMethod =
            mutableClass.methods.firstOrNull {
                it.toString() == method.toString()
            }
                ?: throw IllegalStateException(
                    "Morphe Patcher -> Não foi possível obter o método mutável da navigation bar."
                )

        val instructions =
            mutableMethod.implementation?.instructions?.toList()
                ?: throw IllegalStateException(
                    "Morphe Patcher -> Método da navigation bar não possui implementação."
                )

        var patched = false

        /*
         * Procura especificamente:
         *
         * invoke-virtual {p1, p0},
         *     Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V
         *
         * e força p0 = true imediatamente antes da chamada.
         */
        instructions.forEachIndexed { index, instruction ->

            if (instruction.opcode != Opcode.INVOKE_VIRTUAL) {
                return@forEachIndexed
            }

            val reference =
                (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference
                    ?: return@forEachIndexed

            if (
                reference.definingClass.toString() ==
                    "Landroid/view/Window;" &&
                reference.name ==
                    "setNavigationBarContrastEnforced" &&
                reference.parameterTypes.size == 1 &&
                reference.parameterTypes[0].toString() == "Z" &&
                reference.returnType == "V"
            ) {
                println(
                    "Morphe Patcher -> setNavigationBarContrastEnforced encontrado no índice $index."
                )

                /*
                 * O X usa p0 como o boolean calculado:
                 *
                 * invoke-virtual {p1, p0},
                 *     Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V
                 *
                 * Forçamos p0 para true.
                 */
                mutableMethod.addInstructions(
                    index,
                    """
                        const/4 p0, 0x1
                    """
                )

                patched = true
            }
        }

        if (!patched) {
            throw IllegalStateException(
                "Morphe Patcher -> A chamada setNavigationBarContrastEnforced(Z) não foi encontrada."
            )
        }

        println(
            "Morphe Patcher -> Contraste da navigation bar forçado para TRUE com sucesso!"
        )
    }
}
