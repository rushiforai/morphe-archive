package app.fakh.patches.dodo

import app.fakh.patches.dodo.shared.Constants.COMPATIBILITY_DODO
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * `com.pairip.application.Application.attachBaseContext(Context)`: the app's entry point, run before
 * anything else. The spoof is installed here so the original certificate is in place before any code
 * reads the app's signature.
 */
private val attachBaseContextFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/application/Application;" &&
            method.name == "attachBaseContext"
    },
)

/**
 * Songs are downloaded encrypted and decrypted on device by `TestJni.o2`, and every API request is
 * signed (`SignInterceptor` -> `SignManager`) with the app's own signing certificate. The server keys
 * the encrypted song payload to that certificate, so a resigned APK gets a payload it cannot decrypt
 * (`o2` returns null) and playback hangs on "loading" for every song, premium or not.
 *
 * The patch makes the app see its original Play App Signing certificate again through a reflective
 * PackageManager proxy (see the SignatureSpoof extension), so request signing and any signature read
 * match what the server expects. Without it the app installs and shows its library, but no song plays.
 */
@Suppress("unused")
val signatureSpoofPatch = bytecodePatch(
    name = "Fix song playback",
    description = "Lets songs play on the patched app. A patched app is signed with a different key, which the " +
        "server rejects when it hands out the encrypted song, so without this every song would hang on \"loading\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DODO)
    category("Premium")
    extendWith("extensions/extension.mpe")

    execute {
        attachBaseContextFingerprint.method.addInstructions(
            0,
            "invoke-static { }, Lapp/fakh/extension/dodo/SignatureSpoof;->install()V",
        )
    }
}
