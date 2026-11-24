package app.ckzombies.patches.compat

import app.adebisi.patches.shared.rewriteOriginalDexThroughDexPool
import app.ckzombies.patches.nativelib.deadServersNativePatch
import app.ckzombies.patches.nativelib.networkAvailabilityPatch
import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch

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
 * on its own timeout; [networkAvailabilityPatch] makes the game's network availability check return
 * false, so the login flow never starts and the loading step finishes on its first frame.
 *
 * The engine drives Tapjoy from its frame loop: the points balance about every five seconds in
 * the menus and on every resume, a banner and a featured app in the shop, and Tapjoy's offer page
 * behind "Get free Glu credits". All of it goes through Glu's wrapper, and only its `initialize`
 * connects, so dropping that one call leaves every request unsent while the wrapper keeps its
 * activity as before. The Tapjoy SDK logs an error whenever it is asked for an instance it never
 * made, several times a minute here, so that getter returns without the log.
 *
 * The native part stops Glu's own banner and the content update check, takes out the Games
 * button, which opened Glu's deleted games page, and the Boards button, which opened OpenFeint's
 * leaderboards, and skips the "OFFLINE - NO DAILY BONUS" message that Glu's missing time server
 * brings up (see [deadServersNativePatch]).
 *
 * Without its OBB the game would ask Google Play and then Glu's `rpack.glu.com`, which no longer
 * resolves, for the file; [obbMessagePatch] shows what is wrong with the OBB instead. Every
 * patch depends on it, so the message is there whichever patch the player applies.
 *
 * OpenFeint's servers closed in 2012, and [openFeintPatch] keeps the SDK from starting: every
 * call the game makes into it first checks a flag that only a finished `initialize()` sets.
 * PlayHaven's two publisher requests are the same story ([deadServiceRequestsPatch]).
 *
 * The leftover SDK classes still carry their URL constants: Flurry, Tapjoy (except
 * [TAPJOY_CONNECT]), PlayHaven, Urban Airship, and OpenFeint. After the wrappers return,
 * those classes are empty shells ([emptyDeadSdks]). Urban Airship `takeOff` lives in
 * `GluApplication.onCreate`, which never calls `super.onCreate()`, so
 * returning there is enough. `GluPlatformActivity.onCreate` still reads the APID through
 * PushManager for JNI initialise, so that getter is put back as a stub.
 *
 * [rewriteOriginalDexThroughDexPool] so emptied URL constants do not stay in the
 * original DEX string pool.
 */
@Suppress("unused")
val deadServersPatch = patch(
    name = "Stop requests to dead servers",
    description = "Removes the 30 second wait on the loading screen and the daily offline message, and stops " +
        "the game from contacting Tapjoy, OpenFeint and Glu's dead servers.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(
        networkAvailabilityPatch,
        deadServersNativePatch,
        openFeintPatch,
        deadServiceRequestsPatch,
        obbMessagePatch,
    )

    execute {
        // Find everything first, so an APK that differs from Glu's is refused before any edit.
        val initialize = TapjoyInitializeFingerprint.method
        val connect = TapjoyInitializeFingerprint.instructionMatches.first().index
        val getter = TapjoyConnectInstanceFingerprint.method
        emptyDeadSdks()

        initialize.removeInstruction(connect)
        initialize.addInstruction(connect, "nop")

        getter.addInstructions(
            0,
            """
                sget-object v0, $TAPJOY_CONNECT->tapjoyConnectInstance:$TAPJOY_CONNECT
                return-object v0
            """,
        )
        rewriteOriginalDexThroughDexPool()
    }
}
