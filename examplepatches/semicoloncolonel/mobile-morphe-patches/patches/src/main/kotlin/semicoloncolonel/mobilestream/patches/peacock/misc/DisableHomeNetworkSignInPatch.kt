package semicoloncolonel.mobilestream.patches.peacock.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.AccessFlags.STATIC
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants

// Peacock 7.10.20 signs in on its own when it detects an Xfinity home network
// ("HBA", home-based authentication). HbaSignInUseCaseImpl (p5e in 7.10.20)
// runs that sign-in and returns Success or a failure: IdentityError,
// OnMobileData, or OutsideHbaNetwork. The app treats OutsideHbaNetwork as
// "nothing to do" and carries on signed out, exactly as it does on any
// non-Xfinity network.
//
// Every name here is R8-renamed, so the use case is found by its log tag and
// the result by its toString literal.
internal object HbaSignInUseCaseFingerprint : Fingerprint(
    strings = listOf("Hba: HbaSignInUseCase"),
)

internal object OutsideHbaNetworkToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("OutsideHbaNetwork"),
)

@Suppress("unused")
val disableHomeNetworkSignInPatch = bytecodePatch(
    name = "Disable Xfinity auto sign-in",
    description = "Stops the Peacock phone app from signing in on its own when it is on an " +
        "Xfinity home network. Signing in with your own Peacock account still works.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // The OutsideHbaNetwork object's singleton instance field.
        val outside = OutsideHbaNetworkToStringFingerprint.classDef
        val instance = outside.fields.firstOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.type == outside.type
        } ?: throw PatchException("OutsideHbaNetwork instance not found")

        // The use case's invoke entry point is its synthetic bridge, which
        // casts its two arguments and calls the real sign-in method.
        HbaSignInUseCaseFingerprint.classDef.methods
            .filter {
                AccessFlags.BRIDGE.isSet(it.accessFlags) &&
                    !STATIC.isSet(it.accessFlags) &&
                    it.parameterTypes.size == 2 &&
                    it.returnType == "Ljava/lang/Object;"
            }
            .ifEmpty { throw PatchException("HBA sign-in entry point not found") }
            .forEach {
                it.addInstructions(
                    0,
                    """
                        sget-object v0, ${outside.type}->${instance.name}:${outside.type}
                        return-object v0
                    """,
                )
            }
    }
}
