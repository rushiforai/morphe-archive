package app.ffn.patches.debug

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.ffn.patches.shared.FrameParserFingerprint
import app.ffn.patches.shared.RequestFailureFingerprint
import app.ffn.patches.shared.enableRequestFeature
import app.ffn.patches.shared.requestHooksPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

private const val EXTENSION_CLASS = "Lapp/ffn/extension/DebugLog;"

@Suppress("unused")
val debugLoggingPatch = patch(
    name = "Enable debug logging",
    description = "Logs network requests, request failures, HTTP/2 frames and the app's internal debug " +
        "messages to logcat under the tag FFNTao. For troubleshooting only.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    // Request start, response and failure are logged through the shared request hooks.
    dependsOn(requestHooksPatch)

    execute {
        enableRequestFeature("isDebugLogEnabled")

        // The app's logger: two static (Object, String)V functions emptied by R8 in release builds.
        val loggerType = RequestFailureFingerprint.instructionMatches[1].methodReference.definingClass
        mutableClassDefBy(loggerType).methods
            .filter { it.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/String;") && it.returnType == "V" }
            .forEach { logger ->
                logger.addInstructions(
                    0,
                    """
                        invoke-static { p0, p1 }, $EXTENSION_CLASS->log(Ljava/lang/Object;Ljava/lang/String;)V
                        return-void
                    """,
                )
            }

        // Uses many registers, so the parameters must be passed with a range call.
        FrameParserFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p2 }, $EXTENSION_CLASS->frameReceived(Ljava/lang/Object;Ljava/lang/Object;[B)V",
        )
    }
}
