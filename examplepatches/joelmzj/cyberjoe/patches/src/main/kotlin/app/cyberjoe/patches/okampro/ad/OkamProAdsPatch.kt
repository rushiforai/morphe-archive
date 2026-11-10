package app.cyberjoe.patches.okampro.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// 1. Fingerprint para el Splash (el que ya teníamos)
private object SplashMethodCallFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("kakaopay============url==>")
)

// 2. Fingerprint para la inicialización de TopOn (AnyThink)
private object ATSDKInitFingerprint : Fingerprint(
    definingClass = "Lcom/secmtp/sdk/core/api/ATSDK;",
    name = "init",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/secmtp/sdk/core/api/ATNetworkConfig;",
        "Lcom/secmtp/sdk/core/api/ATSDKInitListener;"
    )
)

// 3. Fingerprint para la petición del Banner Nativo
private object ATNativeMakeRequestFingerprint : Fingerprint(
    definingClass = "Lcom/secmtp/sdk/nativead/api/ATNative;",
    name = "makeAdRequest",
    returnType = "V",
    parameters = listOf("Lcom/secmtp/sdk/core/api/ATAdRequest;")
)

@Suppress("unused")
val removeOkamProAdsPatch = bytecodePatch(
    name = "Remove O-KAM Pro Ads",
    description = "Blocks SplashAdActivity, disables TopOn initialization, and prevents native ad requests.",
    default = true
) {
    compatibleWith("com.okampro.oksmart")

    execute {
        // FASE 1: Bloquear el anuncio Splash
        SplashMethodCallFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )

        // FASE 2: Bloquear la inicialización de TopOn
        // Le decimos a la app que la inicialización fue exitosa (p4 es el listener)
        // pero evitamos que el SDK realmente haga la petición de red.
        ATSDKInitFingerprint.method.addInstructions(
            0,
            """
                if-eqz p4, :cond_null
                invoke-interface {p4}, Lcom/secmtp/sdk/core/api/ATSDKInitListener;->onSuccess()V
                :cond_null
                return-void
            """.trimIndent()
        )

        // FASE 3: Bloquear la petición del Banner Nativo
        ATNativeMakeRequestFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent()
        )
    }
}
