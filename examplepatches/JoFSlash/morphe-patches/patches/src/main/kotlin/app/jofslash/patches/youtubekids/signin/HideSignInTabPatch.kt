package app.jofslash.patches.youtubekids.signin

import app.jofslash.patches.youtubekids.shared.Constants.COMPATIBILITY_YOUTUBE_KIDS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/youtubekids/SignInTab;"

// Builds the bottom bar's last tab: "Sign in" when signed out, the profile tab when signed in.
internal object ProfileTabFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "pivot_bar_signed_in_tab"),
        resourceLiteral(ResourceType.STRING, "pivot_bar_signed_out_tab"),
        string("profile"),
        methodCall(definingClass = "Ljava/util/List;", name = "add"),
    ),
)

@Suppress("unused")
val hideSignInTabPatch = bytecodePatch(
    name = "Hide Sign in tab",
    description = "Hides the Sign in tab at the bottom while signed out. Off by default: after the setup it " +
            "is the only way to sign in (Settings has no sign-in button), so with it on you can only sign in " +
            "by clearing the app's data and choosing Sign in during the setup.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_YOUTUBE_KIDS)

    extendWith("extensions/youtubekids.mpe")

    execute {
        ProfileTabFingerprint.let {
            val method = it.method
            val signedIn = it.instructionMatches[0].index
            val signedOut = it.instructionMatches[1].index
            val add = it.instructionMatches[3].index
            val call = method.getInstruction<FiveRegisterInstruction>(add)
            method.replaceInstruction(
                add,
                "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                        "$EXTENSION_CLASS->add(Ljava/util/List;Ljava/lang/Object;)Z"
            )
            // Later index first, so the earlier one stays right.
            method.addInstruction(signedOut, "invoke-static { }, $EXTENSION_CLASS->signedOut()V")
            method.addInstruction(signedIn, "invoke-static { }, $EXTENSION_CLASS->signedIn()V")
        }
    }
}
