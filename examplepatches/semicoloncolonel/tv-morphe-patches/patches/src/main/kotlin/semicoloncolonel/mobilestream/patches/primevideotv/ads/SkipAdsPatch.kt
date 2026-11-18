package semicoloncolonel.mobilestream.patches.primevideotv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.primevideotv.nativehook.applicationClass
import semicoloncolonel.mobilestream.patches.primevideotv.nativehook.bundleAdStripHookPatch
import semicoloncolonel.mobilestream.patches.primevideotv.shared.Constants

// Removes the ads Prime Video plays in Android TV titles.
//
// The Android TV app runs its player inside a native engine (libignite),
// downloading its ad decisions at runtime, so there is no Java ad surface to
// hook. Instead a bundled native library (libpvhook.so) installs a PLT/GOT
// import hook on libignite's memcpy/memmove and, inside the copy, empties the
// regolith getVideoAds ad-decision response (TV-show mid-rolls) and blanks the
// movie intraTitlePlaylist Remote ad items. Playback continues through each
// break with no ad and no gap. Ads in live channels are server-stitched into
// the stream and are not removed.
//
// This injects the loader at the start of the Application's onCreate; the
// library's worker thread then polls for libignite and installs the hook before
// the first playback session. Native strip by ajstrick81 (GPL-3.0); see
// bundleAdStripHookPatch.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in Android TV titles. Ads in live channels still play.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(bundleAdStripHookPatch)

    extendWith("extensions/extension.mpe")

    execute {
        if (classDefByOrNull(applicationClass) == null) {
            throw PatchException("Application class $applicationClass not found")
        }
        val onCreate = mutableClassDefBy(applicationClass).methods.firstOrNull { method ->
            method.name == "onCreate" &&
                method.returnType == "V" &&
                method.parameterTypes.isEmpty() &&
                method.implementation != null
        } ?: throw PatchException("$applicationClass does not override onCreate")

        onCreate.addInstructions(
            0,
            "invoke-static {}, " +
                "Lsemicoloncolonel/mobilestream/extension/primevideotv/PrimeVideoHookLoader;->load()V",
        )
    }
}
