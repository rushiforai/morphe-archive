package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

/**
 * Neutraliza a checagem de licença do PairIP para que o APK re-assinado possa abrir.
 *
 * O manifesto declara `com.pairip.application.Application`, cujo `attachBaseContext` chama
 * `LicenseClient.checkLicense(Context)` antes de delegar à Application real do app. Essa é a única
 * referência ao PairIP fora do próprio `classes2.dex` (confirmada por varredura dos 17 DEX): uma
 * vez que `checkLicense` retorna sem fazer nada, `LicenseActivity` (declarada no manifesto apenas
 * para o caminho de falha) nunca é iniciada.
 *
 * Não removing classes, providers, bibliotecas ou a Application wrapper: a estrutura da aplicação
 * permanece idêntica; apenas a decisão de licença é ignorada. Isso é necessário porque a
 * re-assinatura exigida para sideload troca o certificado que a checagem validaria.
 *
 * Risco: o veredito real do PairIP em dispositivo não foi medido nesta análise estática. A
 * inicialização, alarmes e sincronização devem ser verificados no T1 com o conjunto completo
 * (base + arm64 + densidade + idioma) já montado e assinado.
 */
@Suppress("unused")
val disablePairIpLicenseCheckInMyTherapyPatch = patch(
    name = "Disable PairIP license check",
    description = "Neutralizes the PairIP license check so the re-signed APK can start, without removing its components.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        PairIpLicenseCheckFingerprint.method.addInstructions(0, "return-void")
    }
}
