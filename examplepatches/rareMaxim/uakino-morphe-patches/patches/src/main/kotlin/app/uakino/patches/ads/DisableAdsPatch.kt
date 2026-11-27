package app.uakino.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.uakino.patches.shared.Constants.COMPATIBILITY_UAKINO
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Вимикає банери та рекламу перед відео (VAST preroll) в UAKino.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_UAKINO)

    execute {
        // 1. AdsTier.adFree = true завжди.
        //    Плеєр сам пропускає VAST preroll, коли adFree == true (1.15: uk/mt8).
        val tierClass = AdsTierToStringFingerprint.classDef
        val adFreeField = tierClass.fields.singleOrNull { it.type == "Z" }
            ?: throw PatchException("AdsTier: поле adFree (boolean) не знайдено")

        val constructors = tierClass.methods.filter { it.name == "<init>" }
        if (constructors.isEmpty()) throw PatchException("AdsTier: конструктори не знайдено")

        constructors.forEach { ctor ->
            val instructions = ctor.implementation!!.instructions.toList()
            // Записуємо true перед кожним return-void, тобто після того, як конструктор
            // уже присвоїв усі поля. Регістр p0 у конструкторі — це `this`, тому
            // беремо параметр останнього boolean-аргументу або, якщо його немає, v0.
            val register = freeRegisterFor(ctor.parameterTypes.map { it.toString() }, ctor.implementation!!.registerCount)
            instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .sortedDescending()
                .forEach { index ->
                    ctor.addInstructions(
                        index,
                        """
                            const/4 $register, 0x1
                            iput-boolean $register, p0, ${tierClass.type}->${adFreeField.name}:Z
                        """,
                    )
                }
        }

        // 2. Банери: List d(placement) → порожній список.
        BannersListFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """,
        )

        // 3. Банери: Flow c(placement) → делегуємо до вбудованої в додаток порожньої
        //    реалізації того ж інтерфейсу (1.15: object uk/f9, повертає flowOf(emptyList())).
        val adsClass = AdImpressionFingerprint.originalClassDef
        val flowMethod = BannersFlowFingerprint.originalMethod
        val flowParams = flowMethod.parameterTypes.map { it.toString() }

        val stub = Fingerprint(
            name = flowMethod.name,
            returnType = flowMethod.returnType,
            parameters = flowParams,
            custom = { _, classDef ->
                classDef.type != adsClass.type &&
                    classDef.interfaces.any { it in adsClass.interfaces } &&
                    classDef.staticFields.any { it.type == classDef.type }
            },
        )
        val stubClass = stub.originalClassDef
        val stubInstance = stubClass.staticFields.first { it.type == stubClass.type }

        BannersFlowFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, ${stubClass.type}->${stubInstance.name}:${stubClass.type}
                invoke-virtual {v0, p1}, ${stubClass.type}->${flowMethod.name}(${flowParams.joinToString("")})${flowMethod.returnType}
                move-result-object v0
                return-object v0
            """,
        )
    }
}

/**
 * Регістр, який можна безпечно перезаписати в кінці конструктора: v0, якщо в методі
 * є хоч один локальний регістр, інакше — регістр останнього параметра (не `this`).
 */
private fun freeRegisterFor(parameterTypes: List<String>, registerCount: Int): String {
    val paramRegisters = 1 + parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    if (registerCount > paramRegisters) return "v0"
    val lastParamWide = parameterTypes.lastOrNull()?.let { it == "J" || it == "D" } ?: false
    if (parameterTypes.isEmpty() || lastParamWide) {
        throw PatchException("AdsTier: немає вільного регістра в конструкторі")
    }
    return "p${paramRegisters - 1}"
}
