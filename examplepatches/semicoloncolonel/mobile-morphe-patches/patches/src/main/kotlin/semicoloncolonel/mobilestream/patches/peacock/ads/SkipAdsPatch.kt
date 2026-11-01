/*
 * Ported from ajstrick81's Peacock Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/peacock
 * ALL CREDIT FOR THE SKY SDK SSAI SWITCHES GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.peacock.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants

// Peacock phone 7.10.20. The Sky player SDK is shared with the TV app, but
// the phone build renames most of it: PlayerEngineItemImpl, the FreeWheel DI
// module and the OkHttp client builders the TV patch hooks have no names
// left. Two of the TV patch's SSAI switches survive and are ported here.

// AdvertisingConfiguration.getSsaiConfigurationProvider(): the TV patch's
// Configuration getter lives on AdvertisingConfiguration in this build. Both
// callers (AddonManagerImpl, AdvertAddonsCreator) test it with if-eqz, so a
// null provider means no SSAI add-on is set up, as on TV.
internal object SsaiConfigurationProviderFingerprint : Fingerprint(
    returnType = "Lcom/sky/core/player/sdk/addon/SSAIConfigurationProvider;",
    custom = { method, _ ->
        method.name == "getSsaiConfigurationProvider" &&
            method.definingClass.endsWith("/AdvertisingConfiguration;")
    },
)

// The MediaTailor advertising-service builder (hfi.B in 7.10.20), anchored by
// its own error string as in the TV patch.
internal object MediaTailorAdServiceMethodFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("Could not build MT Advertising service"),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Turns off the Peacock player's server-side ad insertion (MediaTailor SSAI) in " +
        "the phone app, using the Sky player SDK's own switches. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // getSsaiConfigurationProvider has .locals 0, so p0 holds the null.
        SsaiConfigurationProviderFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """.trimIndent(),
        )
        // hfi.B has .locals 25.
        MediaTailorAdServiceMethodFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )
    }
}
