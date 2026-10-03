/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.pip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val CONTROLLER =
    "Lapp/morphe/extension/facebook/media/VideoPictureInPictureController;"

@Suppress("unused")
val pictureInPicturePatch = bytecodePatch(
    name = "Picture-in-picture",
    description = "Extends Facebook picture-in-picture to every supported video surface.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        val playerViewMethod = GrootPlayerBindingFingerprint.method
        playerViewMethod.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p2}, $CONTROLLER->captureBoundPlayer(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        val eligibilityMethod = NativePipEligibilityFingerprint.method
        val eligibilityActivityParameter =
            if (AccessFlags.STATIC.isSet(eligibilityMethod.accessFlags)) "p0" else "p1"
        eligibilityMethod.addInstructions(
            0,
            """
                invoke-static {$eligibilityActivityParameter}, $CONTROLLER->isNativePipAvailable(Landroid/app/Activity;)Z
                move-result v0
                return v0
            """.trimIndent(),
        )

        val pauseMethod = GrootPlayerPauseFingerprint.method
        val pauseRegister = pauseMethod
            .getFreeRegisterProvider(0, 1)
            .getFreeRegister4Bit()
        pauseMethod.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p1}, $CONTROLLER->shouldIgnorePlayerPause(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v$pauseRegister
                if-eqz v$pauseRegister, :devanced_pip_pause_continue
                return-void
                :devanced_pip_pause_continue
            """.trimIndent(),
        )

        val leaveMethod = FbFragmentActivityLeaveFingerprint.method
        leaveMethod.addInstructions(
            0,
            """
                invoke-static {p0}, $CONTROLLER->onUserLeaveHint(Landroid/app/Activity;)V
            """.trimIndent(),
        )

        val modeMethod = FbFragmentActivityPipModeFingerprint.method
        modeMethod.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $CONTROLLER->onPictureInPictureModeChanged(Landroid/app/Activity;Z)V
            """.trimIndent(),
        )

        println(
            "[PictureInPicture] playerView=${GrootPlayerBindingFingerprint.classDef.type}" +
                " nativeEligibility=${NativePipEligibilityFingerprint.classDef.type}" +
                " nativeEligibilityActivity=$eligibilityActivityParameter" +
                " pause=${GrootPlayerPauseFingerprint.classDef.type}" +
                " lifecycle=FbFragmentActivity",
        )
    }
}

object GrootPlayerBindingFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/view/ViewGroup;",
        "L",
        "L",
        "L",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Z",
    ),
    strings = listOf(
        "FbGrootPlayer.attachPlayerViewInternal",
    ),
)

object NativePipEligibilityFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "Landroid/app/Activity;",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            val reference =
                (it as? ReferenceInstruction)?.reference
                    as? MethodReference
            reference?.definingClass ==
                "Landroid/content/pm/PackageManager;" &&
                reference.name == "hasSystemFeature" &&
                reference.returnType == "Z"
        } == true
    },
)

object GrootPlayerPauseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
    ),
    strings = listOf(
        "FbGrootPlayer.pause",
    ),
)

object FbFragmentActivityLeaveFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/base/activity/FbFragmentActivity;",
    name = "onUserLeaveHint",
    returnType = "V",
    parameters = emptyList(),
)

object FbFragmentActivityPipModeFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/base/activity/FbFragmentActivity;",
    name = "onPictureInPictureModeChanged",
    returnType = "V",
    parameters = listOf(
        "Z",
        "Landroid/content/res/Configuration;",
    ),
)
