package id.ikuradachi.patches.crunchyroll.ui.splash

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val skipAnimatedSplashPatch = bytecodePatch(
    name = "Skip animated splash",
    description = "Skips the animated startup splash video and its audio focus request, and skips cold-start checkout WebView preloading.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("UI")

    val skipAnimatedSplash = booleanOption(
        key = "skipAnimatedSplash",
        default = true,
        title = "Skip animated splash video",
        description = "Skips the 6-second animated splash video and AudioFocus request on startup.",
    )
    val skipRazorPayPreload = booleanOption(
        key = "skipRazorPayPreload",
        default = true,
        title = "Skip RazorPay WebView preload",
        description = "Skips preloading the RazorPay checkout WebView on the main thread during app startup.",
    )

    execute {
        if (skipAnimatedSplash.value == true) {
            val viewModelCtor = AnimatedSplashViewModelConstructorFingerprint.matchAll(1..1)
                .single()
                .originalMethod
            val providerInterfaceType = viewModelCtor.parameterTypes[2].toString()

            val playbackProviderMatch = createAnimatedSplashPlaybackProviderImplFingerprint(providerInterfaceType)
                .matchAll(1..1)
                .single()
            val impl = requireNotNull(playbackProviderMatch.method.implementation) {
                "Missing implementation for AnimatedSplashPlaybackProviderImpl.hasPlayed"
            }
            check(impl.registerCount >= 2) {
                "Unexpected register count in AnimatedSplashPlaybackProviderImpl.hasPlayed: ${impl.registerCount}"
            }

            playbackProviderMatch.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
            )
        }

        if (skipRazorPayPreload.value == true) {
            RazorPayPreloadFingerprint.matchAll(1..1)
                .single()
                .method
                .addInstruction(0, "return-void")
        }
    }
}
