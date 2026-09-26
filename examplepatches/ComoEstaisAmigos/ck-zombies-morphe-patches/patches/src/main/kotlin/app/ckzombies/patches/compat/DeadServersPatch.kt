package app.ckzombies.patches.compat

import app.ckzombies.patches.nativelib.deadServersNativePatch
import app.ckzombies.patches.nativelib.serverCheckStallPatch
import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val TAPJOY_CONNECT = "Lcom/tapjoy/TapjoyConnect;"

/**
 * Glu's Tapjoy wrapper. It stores the activity, then connects to Tapjoy. Every other method of
 * the wrapper first asks `TapjoyConnect.getTapjoyConnectInstance()` and does nothing without one.
 */
internal object TapjoyInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/glu/tools/tapjoy/TapjoyInterface;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = TAPJOY_CONNECT, name = "requestTapjoyConnect"),
    ),
)

/** Logs a three-line error each time it is asked before a connection was requested. */
internal object TapjoyConnectInstanceFingerprint : Fingerprint(
    definingClass = TAPJOY_CONNECT,
    name = "getTapjoyConnectInstance",
    returnType = TAPJOY_CONNECT,
    parameters = listOf(),
)

/**
 * Stops the requests the game still sends to servers that are gone, and the wait one of them
 * causes.
 *
 * Online, the loading screen waits about 30 seconds for gServe's version check, which only ends
 * on its own timeout; [serverCheckStallPatch] never starts it.
 *
 * The engine drives Tapjoy from its frame loop: the points balance about every five seconds in
 * the menus and on every resume, a banner and a featured app in the shop, and Tapjoy's offer page
 * behind "Get free Glu credits". All of it goes through Glu's wrapper, and only its `initialize`
 * connects, so dropping that one call leaves every request unsent while the wrapper keeps its
 * activity as before. The Tapjoy SDK logs an error whenever it is asked for an instance it never
 * made, several times a minute here, so that getter returns without the log.
 *
 * The native part stops Glu's own banner and the content update check, and takes out the Games
 * button, which opened Glu's deleted games page, and the Boards button, which opened OpenFeint's
 * leaderboards (see [deadServersNativePatch]).
 *
 * OpenFeint's servers closed in 2012, and [openFeintPatch] keeps the SDK from starting: every
 * call the game makes into it first checks a flag that only a finished `initialize()` sets. Its
 * 319 classes are then dead code, and one antivirus engine, AhnLab V3, flags them
 * (`PUP/Android.SmsReg`, already on Glu's own APK; OpenFeint sends no SMS). Each becomes an empty
 * shell (see [emptyClasses]). In the mode Morphe Manager patches with, the old bytes stay behind
 * in the original dex without their class definitions, and AhnLab no longer flags that either.
 */
@Suppress("unused")
val deadServersPatch = bytecodePatch(
    name = "Stop requests to dead servers",
    description = "Removes the 30 second wait on the loading screen and stops the game from contacting Tapjoy, " +
        "OpenFeint and Glu's dead servers.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(serverCheckStallPatch, deadServersNativePatch, openFeintPatch)

    execute {
        // Find everything first, so an APK that differs from Glu's is refused before any edit.
        val initialize = TapjoyInitializeFingerprint.method
        val connect = TapjoyInitializeFingerprint.instructionMatches.first().index
        val getter = TapjoyConnectInstanceFingerprint.method
        val openFeint = buildList { classDefForEach { if (it.type.startsWith(OPENFEINT_PACKAGE)) add(it.type) } }
        if (openFeint.size != OPENFEINT_CLASSES) {
            throw PatchException("Expected $OPENFEINT_CLASSES OpenFeint classes, found ${openFeint.size}")
        }

        initialize.removeInstruction(connect)
        initialize.addInstruction(connect, "nop")

        getter.addInstructions(
            0,
            """
                sget-object v0, $TAPJOY_CONNECT->tapjoyConnectInstance:$TAPJOY_CONNECT
                return-object v0
            """,
        )

        emptyClasses(openFeint.map { mutableClassDefBy(it) })
    }
}
