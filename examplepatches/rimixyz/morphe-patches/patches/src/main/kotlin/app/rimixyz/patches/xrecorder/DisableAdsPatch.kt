package app.rimixyz.patches.xrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_XRECORDER

/**
 * EXPERIMENTAL — nao testado em aparelho real.
 *
 * Mata anuncios no XRecorder 2.5.6.1. Pontos neutralizados:
 *  - `le.c` e `le.b`: app-open ads (AdMob e AppLovin);
 *  - `qe.h` e `qe.i`: load e show do AppOpenAd da AdMob.
 *
 * A inicializacao `u5.d` NAO e cortada: teste em aparelho mostrou que o splash
 * espera essa inicializacao e fica em tela branca se ela for antecipada.
 * O IProChecker entregue a `u5.d` le `w45.b("kmgJSgyY", false)`, entao o
 * Disable ads depende do Unlock Pro para calar os anuncios do SDK.
 *
 * ATENCAO: o app tem o evento `ProWindowExportClick_WatchAd`, indicando um fluxo
 * "assista para continuar". Se a bancada mostrar que o reward libera recurso,
 * sera preciso preservar o callback de recompensa em vez de cortar o show.
 */
@Suppress("unused")
val disableAdsInXRecorderPatch = patch(
    name = "Disable ads",
    description = "Blocks ads that appear when opening XRecorder.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_XRECORDER)

    execute {
        verifyXRecorderTarget()

        // NAO cortar u5.d: o splash espera a inicializacao do SDK. O flag Pro
        // (Unlock Pro) ja informa ao SDK que nao deve veicular anuncios.
        AppOpenShowFingerprint.method.addInstructions(0, "return-void")
        AppOpenByPositionFingerprint.method.addInstructions(0, "return-void")
        AppOpenLoadFingerprint.method.addInstructions(0, "return-void")
        AppOpenDisplayFingerprint.method.addInstructions(0, "return-void")
    }
}
