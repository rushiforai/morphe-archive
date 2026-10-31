package io.github.matthewriley05.machu.patches.earthwallpaper

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

private const val SUPER_WALLPAPER =
    "Lcom/miui/miwallpaper/basesuperwallpaper/SuperWallpaper;"
private const val SUPER_WALLPAPER_RECEIVER =
    "Lcom/miui/miwallpaper/basesuperwallpaper/SuperWallpaper\$8;"
private const val SUPER_WALLPAPER_ENGINE =
    "Lcom/miui/miwallpaper/basesuperwallpaper/SuperWallpaper\$SuperWallpaperEngine;"
private const val DESK_RUNNABLE =
    "Lcom/miui/miwallpaper/basesuperwallpaper/SuperWallpaper\$8\$1;"
private const val DISPLAY_UTILS =
    "Lcom/miui/miwallpaper/baselib/utils/DisplayUtils;"
private const val HANDLER = "Landroid/os/Handler;"

private val ON_RECEIVE_PARAMETERS = listOf(
    "Landroid/content/Context;",
    "Landroid/content/Intent;",
)

/**
 * `getDeskPauseDelay()` returns the 5 second delay used before pausing Unity.
 */
internal object DeskPauseDelayFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER,
    name = "getDeskPauseDelay",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(literal(5000)),
)

/**
 * `getWallPaperAod2LockPauseDelay()` returns the 5 second delay used before pausing Unity.
 */
internal object Aod2LockPauseDelayFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER,
    name = "getWallPaperAod2LockPauseDelay",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(literal(5000)),
)

/**
 * `getWallPaperOffsetDelay()` returns the 5 second delay used before pausing Unity.
 */
internal object WallPaperOffsetDelayFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER,
    name = "getWallPaperOffsetDelay",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(literal(5000)),
)

/**
 * `SuperWallpaper.onCreate()` registers the broadcast receiver. It registers
 * `USER_PRESENT` only when `USE_COMMAND_NOTIFICATION` is false.
 */
internal object IntentFilterRegistrationFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER,
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("miui.miwallpaper.action.AOD_PREVIEW"),
    ),
)

/**
 * The `USER_PRESENT` branch of `SuperWallpaper$8.onReceive()` returns early when
 * `access$1600()` is false.
 */
internal object UserPresentEarlyReturnFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER_RECEIVER,
    name = "onReceive",
    returnType = "V",
    parameters = ON_RECEIVE_PARAMETERS,
    filters = listOf(
        methodCall(
            definingClass = SUPER_WALLPAPER,
            name = "access\$1600",
            returnType = "Z",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
    ),
)

/**
 * `SuperWallpaper$8.onReceive()` posts the `"Desk"` Unity message with a 100 ms delay.
 */
internal object DeskMessagePostFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER_RECEIVER,
    name = "onReceive",
    returnType = "V",
    parameters = ON_RECEIVE_PARAMETERS,
    filters = listOf(
        string("Desk"),
        methodCall(
            definingClass = HANDLER,
            name = "postDelayed",
            returnType = "Z",
        ),
    ),
)

/**
 * `SuperWallpaper$8$1.run()` discards the `"Desk"` message unless the display
 * state is `DESK` (4).
 */
internal object DisplayStateCheckFingerprint : Fingerprint(
    definingClass = DESK_RUNNABLE,
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = DISPLAY_UTILS,
            name = "getDisplayState",
            returnType = "I",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        literal(4, location = MatchAfterImmediately()),
        opcode(Opcode.IF_EQ, MatchAfterImmediately()),
    ),
)

/**
 * `SuperWallpaper$SuperWallpaperEngine.goToAodState()` posts the AOD zoom-out
 * runnable immediately.
 */
internal object AodPostFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER_ENGINE,
    name = "goToAodState",
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(
            definingClass = HANDLER,
            name = "post",
            returnType = "Z",
        ),
    ),
)
