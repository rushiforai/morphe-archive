package app.rimixyz.patches.xrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_XRECORDER

/**
 * EXPERIMENTAL — nao testado em aparelho real.
 *
 * Concede o estado premium local do XRecorder 2.5.6.1.
 *
 * O app decide quase todos os recursos pagos com um unico booleano em
 * SharedPreferences: `w45.b("kmgJSgyY", false)`. A mesma flag alimenta:
 *  - o getter central `com.inshot.screenrecorder.application.a.a()`;
 *  - os cadeados do editor (`k43.u1`, `nn7.V3`, que devolvem `!flag`);
 *  - o `IProChecker` entregado ao SDK de anuncios (`t5.i()` -> `mx2.a()`);
 *  - o callback de compras `hu2.W/Z`, que a grava quando ha SKU valido.
 *
 * Tres pontos sao ajustados (combinacao validada em execucao no A15):
 *  1. `w45.b` passa a devolver `true` para qualquer chave. A versao condicional
 *     (somente `kmgJSgyY`) foi TESTADA e NAO liberou as features: o banner
 *     "Iniciar Teste Gratuito" e os cadeados permaneceram.
 *  2. O getter central `application.a.a` e o estado `hu2.T` devolvem `true`.
 *  3. `ProDetailActivity.N9` (lancador do paywall) nao faz nada.
 *
 * RISCO CONHECIDO: forcar `w45.b` afeta todas as chaves lidas por esse helper,
 * nao apenas a flag premium. A UI verificada (Ferramentas, Modificador de Voz,
 * Bola flutuante) ficou normal, mas outras preferencias podem mudar.
 *
 * Nao ha fabricacao de token, recibo ou resposta do servidor cast.inshot.cc.
 */
@Suppress("unused")
val unlockProInXRecorderPatch = patch(
    name = "Unlock Pro",
    description = "Unlocks local Pro tools and ad-free mode. AI and credits still require server validation. " +
        "Known issue: the Edit tab closed during testing on a Galaxy A15.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_XRECORDER)

    execute {
        verifyXRecorderTarget()

        PremiumPrefFingerprint.method.returnEarly(true)

        PremiumGetterFingerprint.method.returnEarly(true)

        IabFeatureGateFingerprint.method.returnEarly(true)
        IabProStateFingerprint.method.returnEarly(true)

        // N9 e o lancador central do paywall (nao checa pro, so escolhe a variante).
        PaywallLaunchFingerprint.method.addInstructions(0, "return-void")
    }
}
