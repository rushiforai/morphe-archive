package semicoloncolonel.mobilestream.patches.amc.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.amc.shared.Constants

private const val SPLASH_FRAGMENT = "Lcom/amcn/microapp/splash/SplashFragment;"
private const val VIEW_MODEL = "Lcom/amcn/microapp/splash/vm/a;"

// AMC+ 1.8.62.1 plays a 5-second AMC+ logo video (res/raw/amc_plus_logo.mp4)
// in a VideoView on SplashFragment before it reaches the welcome screen.
// SplashFragment.y(Params) sets the video up; the completion handler
// z(SplashFragment, MediaPlayer) stops the video, runs the logo transition,
// and calls the view-model's finish, which MainActivity observes to navigate.
// Firing the completion handler at the start of the setup skips the video and
// takes the app straight to the welcome screen. Names are R8-renamed, so the
// setup is found by its SplashFragment$Params parameter and the completion
// handler by its view-model finish call.
// Three SplashFragment methods take Params; only the video setup calls
// VideoView.setVideoURI, so match on that.
internal object SplashVideoSetupFingerprint : Fingerprint(
    definingClass = SPLASH_FRAGMENT,
    parameters = listOf("Lcom/amcn/microapp/splash/SplashFragment\$Params;"),
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == "Landroid/widget/VideoView;" && ref.name == "setVideoURI"
            } == true
        } == true
    },
)

internal object SplashVideoCompleteFingerprint : Fingerprint(
    definingClass = SPLASH_FRAGMENT,
    parameters = listOf(SPLASH_FRAGMENT, "Landroid/media/MediaPlayer;"),
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == VIEW_MODEL && ref.name == "f" && ref.parameterTypes.isEmpty()
            } == true
        } == true
    },
)

@Suppress("unused")
val skipLaunchVideoPatch = bytecodePatch(
    name = "Skip launch video",
    description = "Opens the AMC+ phone app without the AMC+ logo video that plays on launch, " +
        "so it reaches the home screen about five seconds sooner.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val complete = SplashVideoCompleteFingerprint.method
        SplashVideoSetupFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static {p0, v0}, $SPLASH_FRAGMENT->${complete.name}($SPLASH_FRAGMENT Landroid/media/MediaPlayer;)V
                return-void
            """,
        )
    }
}
