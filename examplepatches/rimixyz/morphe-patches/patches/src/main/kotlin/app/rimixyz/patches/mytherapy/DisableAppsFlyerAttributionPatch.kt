package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

/**
 * Impede o start explícito do SDK AppsFlyer pelo app.
 *
 * O app já possui um caminho de opt-out (`StopAppsFlyerSdkUseCase.invoke` → `AppsFlyerLib.stop(true, context)`),
 * chamado quando o consentimento de analytics é recusado. Este patch torna o start um no-op,
 * usando o mesmo mecanismo oficial da biblioteca em vez de remover classes ou providers.
 *
 * Não toca em deep links, convites, login, `setConsentData`, nem no fluxo de revogação existente.
 * Risco documentado: a inicialização automática por provider/auto-init e os deep links podem
 * depender do start — o patch vem habilitado por padrão e exige validação em T3/T5.
 */
@Suppress("unused")
val disableAppsFlyerAttributionInMyTherapyPatch = patch(
    name = "Disable AppsFlyer attribution in MyTherapy",
    description = "Neutralizes the app's explicit AppsFlyer start while keeping its existing opt-out and consent paths intact.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        StartAppsFlyerFingerprint.method.addInstructions(0, "return-void")
    }
}
