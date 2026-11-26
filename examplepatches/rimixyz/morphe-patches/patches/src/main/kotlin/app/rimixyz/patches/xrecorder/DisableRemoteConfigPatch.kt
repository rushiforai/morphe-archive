package app.rimixyz.patches.xrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_XRECORDER

/**
 * EXPERIMENTAL — nao testado em aparelho real.
 *
 * Congela o Firebase Remote Config do XRecorder 2.5.6.1:
 *  - `n12.k`: nao agenda fetch (rcgap=3600) nem dispara o listener;
 *  - `n12.p`: nao aplica o `ServerDomain` remoto em `yc`.
 *
 * Sem o fetch, `n12.o()` cai no ramo `!c` e mantem `AdCfg25` como JSONObject vazio.
 * `n12.e()` passa a devolver false para todas as flags remotas, incluindo
 * `ShowLimitedOfferAction` e `EnableShowLimitedTimeDialog`.
 *
 * Risco: experimentos A/B de paywall e a configuracao de ads deixam de variar.
 */
@Suppress("unused")
val disableRemoteConfigInXRecorderPatch = patch(
    name = "Disable remote config",
    description = "Blocks Firebase Remote Config overrides for ads and the server address.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_XRECORDER)

    execute {
        verifyXRecorderTarget()

        RemoteConfigFetchFingerprint.method.addInstructions(0, "return-void")
        RemoteConfigDomainFingerprint.method.addInstructions(0, "return-void")
    }
}
