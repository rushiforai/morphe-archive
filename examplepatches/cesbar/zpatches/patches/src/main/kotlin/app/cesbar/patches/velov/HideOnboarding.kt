package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

object checkHowToSeenFingerprint : Fingerprint(
    definingClass = "Lcom/jcdecaux/vls/app/navigation/NavigationFragment;",
    parameters = listOf(),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

@Suppress("unused")
val hideOnboardingPatch = bytecodePatch(
    name = "Hide onboarding screen",
    description = "Hide the onboarding \"Plan your journey\" screen"
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        checkHowToSeenFingerprint.method.returnEarly(true)
    }
}
