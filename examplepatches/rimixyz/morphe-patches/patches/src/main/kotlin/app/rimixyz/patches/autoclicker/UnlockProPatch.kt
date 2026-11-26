package app.rimixyz.patches.autoclicker

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_AUTOCLICKER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PREFS_HELPER = "Lo2/g;"

/**
 * Concede o estado pago local do Auto Clicker 2.3.0 sem compra.
 *
 * O app tem um único árbitro: `r2.f.a(Context)` lê a preferência booleana
 * `paid_premium_upgrade` de `share_prefs.xml` (default `false`), grava o valor
 * no campo estático `r2.f.f29148a` e devolve o boolean. Esse getter é chamado
 * somente por `MainActivity.onCreate`, e o campo estático é consumido por
 * `MainActivity.onResume` e pelo gate de intersticial em `p2.c.onCreate`.
 *
 * Em vez de substituir o método inteiro, o patch troca o `move-result` que
 * recebe `o2.g.a("paid_premium_upgrade", false)` por `const/4 vX, 0x1`. Assim
 * o código original continua executando: ele grava `true` no campo estático e
 * devolve `true`. Não é preciso conhecer o nome DEX do campo, não se mexe no
 * fluxo de compra `r2.e` e não se fabrica token, recibo ou resposta de servidor.
 *
 * Efeito confirmado em execução na bancada: ao gravar a preferência como
 * `true`, o título muda de "Auto Clicker * (Free)" para "Auto Clicker * (Pro)".
 */
@Suppress("unused")
val unlockProPatch = patch(
    name = "Unlock Pro",
    description = "Unlocks local Pro features and removes ads. Enable Auto Clicker in Accessibility. " +
        "On Android 17, use Allow restricted settings in the app info menu first if needed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AUTOCLICKER)

    execute {
        verifyAutoClickerTarget()

        val method = PremiumFlagFingerprint.method
        val instructions = method.instructions.toList()

        val callIndex = instructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref != null &&
                ref.definingClass == PREFS_HELPER &&
                ref.name == "a" &&
                ref.returnType == "Z" &&
                ref.parameterTypes.size == 2 &&
                ref.parameterTypes[0] == "Ljava/lang/String;"
        }
        check(callIndex >= 0) {
            "Unlock Pro: chamada a o2.g.a(String, boolean) não encontrada em r2.f.a"
        }

        val result = instructions.getOrNull(callIndex + 1) as? OneRegisterInstruction
        check(result != null && result.opcode == Opcode.MOVE_RESULT) {
            "Unlock Pro: move-result após o2.g.a não encontrado em r2.f.a"
        }

        // O restante do método (sput-boolean no campo estático + return) permanece.
        method.replaceInstruction(callIndex + 1, "const/4 v${result.registerA}, 0x1")
    }
}
