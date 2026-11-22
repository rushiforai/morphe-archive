package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Faz o consentimento de analytics exigir uma escolha explícita.
 *
 * No bytecode original, `HasAnalyticsConsentUseCaseImpl.invoke` consulta `IsConsentStoredUseCase`;
 * quando não há registro, desvia para `Boxing.boxBoolean(v5)` com `v5 == 1` e devolve `true`.
 * `TrackEventUseCaseImpl$b.invokeSuspend` interpreta `false` como "não enviar evento".
 *
 * O patch insere `const/4 v5, 0x0` imediatamente antes do `boxBoolean`, de modo que apenas o
 * caminho "sem registro" passe a devolver `false`. Aceitação e recusa já registradas continuam
 * usando `IsConsentAcceptedUseCase` e não são alteradas; a máquina de estados da coroutine
 * também permanece intacta porque `v5` é redefinido depois de ter servido como marcador de estado.
 *
 * Risco registrado: a ordem entre onboarding, auto-init e primeiros eventos só pode ser medida
 * em aparelho (T4/T5); o patch vem habilitado por padrão.
 */
@Suppress("unused")
val requireExplicitAnalyticsConsentInMyTherapyPatch = patch(
    name = "Require explicit analytics consent in MyTherapy",
    description = "Treats an unregistered analytics consent as opt-out, while preserving recorded acceptance and refusal.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        // Substitui a própria instrução-alvo do branch (boxBoolean) por `const/4 v5, 0x0` e
        // reinsere `boxBoolean` logo em seguida, mantendo o salto `if-eqz v7` apontando para o zero.
        val invokeMethod = HasAnalyticsConsentFingerprint.method
        val boxIdx = invokeMethod.instructions.indexOfLast { ins ->
            ins.opcode == Opcode.INVOKE_STATIC &&
                ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Lkotlin/coroutines/jvm/internal/Boxing;" && it.name == "boxBoolean"
                } == true
        }
        check(boxIdx > 0) {
            "Require explicit analytics consent in MyTherapy: chamada Boxing.boxBoolean não encontrada"
        }
        invokeMethod.replaceInstruction(boxIdx, "const/4 v5, 0x0")
        invokeMethod.addInstructions(
            boxIdx + 1,
            "invoke-static {v5}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;",
        )
    }
}
