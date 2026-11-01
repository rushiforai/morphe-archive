package semicoloncolonel.mobilestream.patches.mgm.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants

// MGM+ plays a lion intro (res/raw/app_splash_video.mp4) after the system
// splash screen with the MGM+ logo. Whether it plays is decided by the
// GetShouldShowSplashSplashVideoImpl use case, a suspend function that
// returns a Boolean. When it returns false, SplashViewModel marks the
// "splashVideoEnded" task finished and carries on to the app, the same path
// it takes when the video ends. Returning false straight away, without
// suspending, keeps the logo splash and drops the lion.
internal object ShouldShowSplashVideoFingerprint : Fingerprint(
    definingClass = "Lcom/epix/domain/useCase/GetShouldShowSplashSplashVideoImpl;",
    name = "execute",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/Continuation;"),
    returnType = "Ljava/lang/Object;",
)

@Suppress("unused")
val skipSplashVideoPatch = bytecodePatch(
    name = "Skip lion intro",
    description = "Opens the MGM+ phone app after the MGM+ logo, without the lion intro video.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ShouldShowSplashVideoFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
    }
}
