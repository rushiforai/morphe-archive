package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HAZE_SCOPE = "Ldev/chrisbanes/haze/"
private const val BOOLEAN_DESCRIPTOR = "Z"
private const val VOID_DESCRIPTOR = "V"

private const val BOOLEAN_VALUE_OF =
    "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"

private const val COLLECTION_CLASS =
    "Ljava/util/Collection;"

private fun Method.isHazeBlurRecorder(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags)) return false
    if (!AccessFlags.PUBLIC.isSet(accessFlags)) return false

    if (returnType != VOID_DESCRIPTOR) return false

    if (
        parameterTypes.size != 1 ||
        parameterTypes[0].toString() != BOOLEAN_DESCRIPTOR
    ) {
        return false
    }

    val implementation = implementation ?: return false
    val instructions = implementation.instructions.toList()

    /*
     * Em um método de instância com um único parâmetro:
     *
     * p0 = this
     * p1 = boolean
     *
     * Os parâmetros ocupam os últimos registradores do método.
     */
    val inputRegister = implementation.registerCount - 1

    if (inputRegister < 1) return false

    var booleanValueOfFound = false
    var collectionAddFound = false

    for (instruction in instructions) {

        if (instruction.opcode == Opcode.INVOKE_STATIC) {
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference

            if (reference?.toString() == BOOLEAN_VALUE_OF) {
                val invoke =
                    instruction as? Instruction35c
                        ?: continue

                /*
                 * Boolean.valueOf(Z) recebe o parâmetro boolean
                 * no primeiro registrador da chamada.
                 */
                if (invoke.registerC == inputRegister) {
                    booleanValueOfFound = true
                }
            }
        }

        if (instruction.opcode == Opcode.INVOKE_INTERFACE) {
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference

            if (
                reference != null &&
                reference.definingClass.toString() == COLLECTION_CLASS &&
                reference.name == "add"
            ) {
                collectionAddFound = true
            }
        }
    }

    return booleanValueOfFound && collectionAddFound
}

@Suppress("unused")
val disableBlurPatch = bytecodePatch(
    name = "Desativar Blur do X",
    description = "Desativa permanentemente os efeitos de desfoque da Haze no X 12.30+.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        val candidates = mutableListOf<Method>()

        classDefForEach { classDef ->

            if (!classDef.type.toString().startsWith(HAZE_SCOPE)) {
                return@classDefForEach
            }

            classDef.methods.forEach { method ->
                if (method.isHazeBlurRecorder()) {
                    candidates += method
                }
            }
        }

        if (candidates.isEmpty()) {
            println(
                "Morphe Patcher -> Nenhum Haze blur recorder encontrado."
            )

            /*
             * Diagnóstico:
             * mostra os métodos void existentes dentro do pacote Haze.
             */
            classDefForEach { classDef ->
                if (classDef.type.toString().startsWith(HAZE_SCOPE)) {
                    classDef.methods.forEach { method ->
                        if (
                            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                            method.returnType == VOID_DESCRIPTOR
                        ) {
                            println(
                                "Haze candidate: ${classDef.type} -> $method"
                            )
                        }
                    }
                }
            }

            return@execute
        }

        if (candidates.size != 1) {
            println(
                "Morphe Patcher -> Foram encontrados " +
                    "${candidates.size} possíveis Haze blur recorders:"
            )

            candidates.forEach {
                println("  -> $it")
            }

            throw IllegalStateException(
                "Esperado exatamente um Haze blur recorder, " +
                    "mas foram encontrados ${candidates.size}."
            )
        }

        val targetMethod = candidates.single()

        println(
            "Morphe Patcher -> Haze blur recorder encontrado!"
        )

        println(
            "Classe: ${targetMethod.definingClass}"
        )

        println(
            "Método: $targetMethod"
        )

        val mutableClass =
            mutableClassDefBy(targetMethod.definingClass)

        val mutableMethod =
            mutableClass.methods.firstOrNull {
                it.toString() == targetMethod.toString()
            }

        if (mutableMethod == null) {
            throw IllegalStateException(
                "Não foi possível obter a versão mutável do método Haze."
            )
        }

        val implementation =
            mutableMethod.implementation
                ?: throw IllegalStateException(
                    "Haze blur recorder não possui implementação."
                )

        /*
         * Em um método de instância com um parâmetro:
         *
         * v(registerCount - 2) = p0 / this
         * v(registerCount - 1) = p1 / boolean
         */
        val inputRegister = implementation.registerCount - 1

        if (inputRegister < 1) {
            throw IllegalStateException(
                "Registro inválido para o parâmetro boolean: v$inputRegister"
            )
        }

        println(
            "Morphe Patcher -> Forçando blurEnabled para false em v$inputRegister"
        )

        /*
         * Força o parâmetro boolean para false.
         *
         * Original:
         *
         *     p1 = true
         *
         * passa a ser:
         *
         *     p1 = false
         */
        mutableMethod.addInstructions(
            0,
            """
                const/4 v$inputRegister, 0x0
            """
        )

        println(
            "Morphe Patcher -> Blur Haze desativado com sucesso!"
        )
    }
}
