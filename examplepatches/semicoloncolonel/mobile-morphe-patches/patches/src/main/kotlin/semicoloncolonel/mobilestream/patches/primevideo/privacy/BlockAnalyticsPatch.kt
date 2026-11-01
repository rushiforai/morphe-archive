/*
 * The Minerva hook is from ajstrick81's Prime Video Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/primevideo
 * ALL CREDIT FOR IT GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.primevideo.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Amazon's Minerva metrics client, unchanged from the TV app.
internal object MetricsTransporterTransmitFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/minerva/client/thirdparty/transport/MetricsTransporter;",
    name = "transmit",
    parameters = listOf("Lcom/amazon/minerva/client/thirdparty/transport/SerializedBatch;"),
    returnType = "Lcom/amazon/minerva/client/thirdparty/transport/UploadResult;",
    accessFlags = listOf(AccessFlags.PUBLIC),
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Amazon's Minerva metrics uploads and Firebase/Google Analytics in the " +
        "Prime Video phone app. Crash reporting, sign-in and playback are left alone. " +
        "Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Report every metrics batch as uploaded without sending it, as the
        // TV patch does. transmit has .locals 10.
        MetricsTransporterTransmitFingerprint.methodOrNull?.addInstructions(
            0,
            """
                new-instance v0, Lcom/amazon/minerva/client/thirdparty/transport/UploadResult;
                const-string v1, "SUCCESS"
                const-string v2, "ok"
                invoke-direct {v0, v1, v2}, Lcom/amazon/minerva/client/thirdparty/transport/UploadResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                return-object v0
            """.trimIndent(),
        )
        blockTrackers()
    }
}
