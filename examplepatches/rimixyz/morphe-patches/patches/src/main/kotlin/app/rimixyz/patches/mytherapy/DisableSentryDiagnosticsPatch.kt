package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

/**
 * Impede a inicialização do Sentry pelo app, retornando antes da chamada a
 * `SentryApi.initWithPlatformOptions`.
 *
 * O relatório classifica este candidato como EXPERIMENTAL/FALTA EVIDÊNCIA porque não mediu
 * amostragem, replay, anexos nem os campos efetivamente enviados. A variante disponível e estável
 * é cortar a inicialização no ponto único identificado em `AndroidSentryInitializer.initialize`
 * (classes3.dex), sem remover providers, bibliotecas nativas ou o callback `BeforeSend`.
 *
 * Risco explícito: diagnóstico de falhas, inclusive de lembretes e sincronização, deixa de ser
 * enviado ao Sentry. Crashlytics e UXCam não foram confirmados nesta amostra e não são afetados.
 * Por isso o patch vem habilitado por padrão e deve ser acompanhado de medição com dados sintéticos.
 */
@Suppress("unused")
val disableSentryDiagnosticsInMyTherapyPatch = patch(
    name = "Disable Sentry diagnostics in MyTherapy",
    description = "Prevents Sentry initialization at the app's single entry point, without removing its providers or native libraries.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        SentryInitializeFingerprint.method.addInstructions(0, "return-void")
    }
}
