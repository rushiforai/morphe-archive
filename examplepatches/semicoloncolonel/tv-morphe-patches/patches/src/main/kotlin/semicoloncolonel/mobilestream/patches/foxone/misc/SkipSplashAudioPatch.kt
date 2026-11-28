package semicoloncolonel.mobilestream.patches.foxone.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants

// Fox One 1.21.0 added a World Cup splash: a Lottie animation with a bundled
// sound, assets/splash/foxone_splash.wav. SplashScreen renders it through
// SplashLottieWithAudio, which plays the WAV through a MediaPlayer that reads
// it with AssetManager.openFd. openFd only works on a STORED (uncompressed)
// asset, so once the app is rebuilt and re-signed the recompressed WAV plays
// as raw noise for the first few seconds, until the login screen appears.
// SplashScreen already ships a silent path: it chooses between
// SplashLottieWithAudio and the plain SplashLottie on a Boolean State, read by
// SplashScreen$lambda$3. When that Boolean is false the app shows the same
// Lottie splash without the sound. Forcing the gate false takes that shipped
// path and drops the audio while keeping the visual splash.
internal object SplashAudioGateFingerprint : Fingerprint(
    definingClass = "Lcom/fox/foxone/ui/onboarding/ui/compose/SplashScreenKt;",
    name = "SplashScreen\$lambda\$3",
    returnType = "Z",
)

@Suppress("unused")
val skipSplashAudioPatch = bytecodePatch(
    name = "Skip splash sound",
    description = "Opens the app with the silent splash animation, without the launch sound.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // 1.20.0 has no splash sound, so there is nothing to change there.
        val gate = SplashAudioGateFingerprint.methodOrNull ?: return@execute
        gate.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return p0
            """,
        )
    }
}
