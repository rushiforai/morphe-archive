package semicoloncolonel.mobilestream.patches.cbsnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News for Android TV 8.6.0 pauses a video after the timeout CBS's
// server sets for it and asks "Are you still watching?". The app looks up
// each video's timeout in a session object, which answers "none" while the
// prompt is turned off for the session. That lookup now always answers
// "none", so the prompt never appears and the stream keeps playing.

// The session's switch for the prompt, which logs its new value.
internal object PromptSessionSwitchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("Disable prompt changed: %s"),
)

@Suppress("unused")
val hideStillWatchingPromptPatch = bytecodePatch(
    name = "Hide \"Are you still watching?\"",
    description = "Stops the \"Are you still watching?\" prompt from pausing long viewing sessions.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    execute {
        // lookup(videoId): the video's prompt info, or null.
        val lookups = PromptSessionSwitchFingerprint.classDef.methods.filter { method ->
            method.implementation != null &&
                method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
                method.returnType.startsWith("L") && method.returnType != "Ljava/lang/String;"
        }
        if (lookups.size != 1) {
            throw PatchException("Hide \"Are you still watching?\": expected one lookup, found ${lookups.size}")
        }
        lookups.single().returnEarly("const/4 v0, 0x0\nreturn-object v0")
    }
}
