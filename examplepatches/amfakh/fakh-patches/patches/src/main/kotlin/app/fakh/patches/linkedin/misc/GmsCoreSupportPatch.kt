package app.fakh.patches.linkedin.misc

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.mutableClass
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val LINKEDIN_PACKAGE = "com.linkedin.android"

/** SHA-1 of LinkedIn's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val LINKEDIN_SIGNATURE = "443cb997718d0ac5162888bae5e4724582862676"

/** Picks the Credential Manager provider: the system one on Android 14+, Play services' own below. */
private const val CREDENTIAL_PROVIDER_FACTORY = "Landroidx/credentials/CredentialProviderFactory;"

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Makes \"Continue with Google\" work in patched LinkedIn by signing in through microG RE " +
        "(GmsCore) instead of Google Play services. Needs microG RE installed and signed in to a Google account.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch, gmsCoreSupportResourcePatch(LINKEDIN_PACKAGE, LINKEDIN_SIGNATURE))

    execute {
        redirectToGmsCore()

        // The system Credential Manager asks the real Play services, which reject the patched app's signature.
        // Play services' own provider in the app goes through GmsCore instead.
        mutableClass(CREDENTIAL_PROVIDER_FACTORY).methods.first { it.name == "getBestAvailableProvider\$default" }
            .addInstructions(
                0,
                """
                    invoke-virtual { p0 }, $CREDENTIAL_PROVIDER_FACTORY->tryCreateClosedSourceProviderFromManifest()Landroidx/credentials/CredentialProvider;
                    move-result-object v0
                    return-object v0
                """
            )

        markIncluded("isGmsCoreSupportIncluded")
    }
}
