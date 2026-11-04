package app.wordfeudwordfinder.patches.platform

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ROUTE_TAP = "Lapp/wordfeudwordfinder/extension/hooks/RouteTap;"

internal object HandlePlatformMessageFingerprint : Fingerprint(
    definingClass = "Lio/flutter/embedding/engine/FlutterJNI;",
    name = "handlePlatformMessage",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/nio/ByteBuffer;", "I", "J")
)

// Internal patch (no name): not shown in Morphe Manager or the CLI patch list. It is only applied through
// overlayPatch's dependsOn, which also supplies compatibleWith and the extension.
// Observes Flutter navigation, theme and banner messages for the word finder, and remembers the FlutterJNI
// instance (V4 refresh: send path via FlutterJNI.dispatchPlatformMessage).
val platformTapPatch = bytecodePatch {
    execute {
        // Instance method: p0 = this (the FlutterJNI, remembered for the V4 send path), p1 = channel,
        // p2 = message buffer. The range form works whatever register numbers p0..p2 map to (they are consecutive).
        HandlePlatformMessageFingerprint.method.addInstructions(
            0,
            "invoke-static/range {p0 .. p2}, $ROUTE_TAP->onPlatformMessage(" +
                "Ljava/lang/Object;Ljava/lang/String;Ljava/nio/ByteBuffer;)V"
        )
    }
}
