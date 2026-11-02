package io.github.matthewriley05.machu.patches.earthwallpaper

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// The official builds since ALPHA-2.6.575 render with Filament. The Earth
// wallpaper extends this class.
internal const val BASE_EARTH_SUPER_WALLPAPER =
    "Lcom/miui/miwallpaper/earth/superwallpaper/BaseEarthSuperWallpaper;"
internal const val BASE_EARTH_ENGINE =
    "Lcom/miui/miwallpaper/earth/superwallpaper/BaseEarthSuperWallpaper\$SuperWallpaperEngine;"

private const val DISPLAY_UTILS =
    "Lcom/miui/miwallpaper/baselib/utils/DisplayUtils;"
private const val HANDLER = "Landroid/os/Handler;"

// MIUI framework dependencies that do not exist on AOSP.
private const val MIUI_WALLPAPER_MANAGER =
    "Lcom/miui/miwallpaper/MiuiWallpaperManager;"
private const val WALLPAPER_AUTHORITY_UTILS =
    "Lcom/miui/miwallpaper/baselib/utils/WallpaperAuthorityUtils;"
private const val COMMON_UTILS =
    "Lcom/miui/miwallpaper/baselib/utils/CommonUtils;"
private const val AOD_UTILS =
    "Lcom/miui/miwallpaper/baselib/utils/AodUtils;"
private const val MIUI_USER_HANDLE = "Lmiui/os/UserHandle;"
internal const val MIUI_BUILD = "Lmiui/os/Build;"
private const val MIUI_SETTINGS_SYSTEM = "Landroid/provider/MiuiSettings\$System;"
internal const val SETTINGS_GLOBAL = "Landroid/provider/Settings\$Global;"
private const val WEATHER_UTILS_ASYNC =
    "Lcom/miui/miwallpaper/baselib/utils/WeatherUtils\$1;"
private const val SUPER_WALLPAPER_UTILS =
    "Lcom/miui/miwallpaper/basesuperwallpaper/SuperWallpaperUtils;"
private const val CONTEXT = "Landroid/content/Context;"

private val ON_RECEIVE_PARAMETERS = listOf(
    "Landroid/content/Context;",
    "Landroid/content/Intent;",
)

// ---------------------------------------------------------------------------
// Official Filament builds (ALPHA-2.6.575 and newer)
// ---------------------------------------------------------------------------

/**
 * `BaseEarthSuperWallpaper.getDeskPauseDelay()` returns the 5 second delay used
 * before pausing the Filament renderer.
 */
internal object FilamentDeskPauseDelayFingerprint : Fingerprint(
    definingClass = BASE_EARTH_SUPER_WALLPAPER,
    name = "getDeskPauseDelay",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(literal(5000)),
)

/**
 * `BaseEarthSuperWallpaper.getWallPaperAod2LockPauseDelay()` returns the 5
 * second delay used before pausing the Filament renderer.
 */
internal object FilamentAod2LockPauseDelayFingerprint : Fingerprint(
    definingClass = BASE_EARTH_SUPER_WALLPAPER,
    name = "getWallPaperAod2LockPauseDelay",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(literal(5000)),
)

/**
 * `BaseEarthSuperWallpaper.getWallPaperOffsetDelay()` returns the 4 second
 * delay used before pausing the Filament renderer.
 */
internal object FilamentWallPaperOffsetDelayFingerprint : Fingerprint(
    definingClass = BASE_EARTH_SUPER_WALLPAPER,
    name = "getWallPaperOffsetDelay",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(literal(4000)),
)

/**
 * `BaseEarthSuperWallpaper`'s broadcast receiver posts the `"Desk"` Filament
 * message with a 100 ms delay.
 *
 * The receiver is an anonymous class, so match it by its superclass and the
 * call to the Filament build's `getDeskPauseDelay()` instead of the generated
 * `$8` class name.
 */
internal object FilamentDeskMessagePostFingerprint : Fingerprint(
    superclass = "Landroid/content/BroadcastReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = ON_RECEIVE_PARAMETERS,
    filters = listOf(
        string("Desk"),
        methodCall(
            definingClass = BASE_EARTH_SUPER_WALLPAPER,
            name = "getDeskPauseDelay",
            returnType = "I",
        ),
        methodCall(
            definingClass = HANDLER,
            name = "postDelayed",
            returnType = "Z",
        ),
    ),
)

/**
 * The `USER_PRESENT` branch of the Filament receiver returns early when
 * `mStateEvent` is `"Desk"` or when the engine thinks it is a preview. On AOSP
 * those states can be stale, so the unlock is silently dropped.
 */
internal object FilamentUserPresentBranchFingerprint : Fingerprint(
    superclass = "Landroid/content/BroadcastReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = ON_RECEIVE_PARAMETERS,
    filters = listOf(
        methodCall(
            definingClass = BASE_EARTH_SUPER_WALLPAPER,
            name = "access\$1300",
            returnType = "Ljava/lang/String;",
        ),
        string("Desk"),
        opcode(Opcode.IF_NEZ),
        methodCall(
            definingClass = BASE_EARTH_SUPER_WALLPAPER,
            name = "access\$000",
            returnType = "Z",
        ),
        opcode(Opcode.IF_EQZ),
        opcode(Opcode.GOTO),
    ),
)

/**
 * The `Runnable` posted by the receiver discards the `"Desk"` message unless
 * the display state is `DESK` (4).
 *
 * The runnable is also an anonymous class. It is matched by `Runnable` and by
 * the Filament message it sends.
 */
internal object FilamentDisplayStateCheckFingerprint : Fingerprint(
    interfaces = listOf("Ljava/lang/Runnable;"),
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
        methodCall(
            definingClass = BASE_EARTH_SUPER_WALLPAPER,
            name = "sendFilamentMessage",
            returnType = "V",
        ),
    ),
)

// ---------------------------------------------------------------------------
// AOSP compatibility for the official Filament builds
// ---------------------------------------------------------------------------

/**
 * `MiuiWallpaperManager.<clinit>` calls `miui.os.UserHandle.myUserId()`. The
 * class does not exist on AOSP, so the wallpaper service dies while loading
 * `MiuiWallpaperManager`. Use the AOSP `android.os.UserHandle` equivalent.
 */
internal object MiuiUserHandleFingerprint : Fingerprint(
    definingClass = MIUI_WALLPAPER_MANAGER,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = MIUI_USER_HANDLE,
            name = "myUserId",
            returnType = "I",
        ),
    ),
)

/**
 * `WallpaperAuthorityUtils.<clinit>` reads `miui.os.Build.IS_INTERNATIONAL_BUILD`,
 * which crashes on AOSP. Use the non-international default.
 */
internal object IsInternationalBuildFingerprint : Fingerprint(
    definingClass = WALLPAPER_AUTHORITY_UTILS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = MIUI_BUILD,
            name = "IS_INTERNATIONAL_BUILD",
            type = "Z",
        ),
    ),
)

/**
 * `CommonUtils.getScreenSize()` reads `miui.os.Build.IS_TABLET`, which crashes
 * on AOSP. Treat non-MIUI devices as phones.
 */
internal object IsTabletFingerprint : Fingerprint(
    definingClass = COMMON_UTILS,
    name = "getScreenSize",
    returnType = "Landroid/graphics/Point;",
    parameters = listOf(CONTEXT),
    filters = listOf(
        fieldAccess(
            definingClass = MIUI_BUILD,
            name = "IS_TABLET",
            type = "Z",
        ),
    ),
)

/**
 * `MiuiWallpaperManager.getFitScreenWallpaperPreview()` also reads
 * `miui.os.Build.IS_TABLET`, which crashes on AOSP.
 */
internal object MiuiWallpaperManagerIsTabletFingerprint : Fingerprint(
    definingClass = MIUI_WALLPAPER_MANAGER,
    name = "getFitScreenWallpaperPreview",
    returnType = "Landroid/graphics/Bitmap;",
    parameters = listOf(CONTEXT, "I"),
    filters = listOf(
        fieldAccess(
            definingClass = MIUI_BUILD,
            name = "IS_TABLET",
            type = "Z",
        ),
    ),
)

/**
 * The official method calls `isVideo24Wallpaper()`, which reaches
 * `miui.os.Build.DEVICE`. Return true to avoid that path.
 */
internal object IsThemeLockLiveWallpaperFingerprint : Fingerprint(
    definingClass = WALLPAPER_AUTHORITY_UTILS,
    name = "isThemeLockLiveWallpaper",
    returnType = "Z",
    parameters = listOf(CONTEXT),
)

/**
 * The official method reads MIUI's AOD setting. On AOSP the key is absent and
 * the method returns false, so AOD is never treated as enabled.
 */
internal object IsAodOpenedFingerprint : Fingerprint(
    definingClass = AOD_UTILS,
    name = "isAodOpened",
    returnType = "Z",
    parameters = listOf(CONTEXT),
)

/**
 * The official method reads MIUI's `aod_using_super_wallpaper` setting. On AOSP
 * the key is absent and the method returns false.
 */
internal object IsAodUsingSuperWallpaperStyleFingerprint : Fingerprint(
    definingClass = AOD_UTILS,
    name = "isAodUsingSuperWallpaperStyle",
    returnType = "Z",
    parameters = listOf(CONTEXT),
)

/**
 * `UIDarkModeHelper$1.onChange()` reads `android.provider.MiuiSettings.System`,
 * which does not exist on AOSP and kills the wallpaper service during
 * `UIDarkModeHelper` construction.
 */
internal object DarkModeMiuiSettingsFingerprint : Fingerprint(
    superclass = "Landroid/database/ContentObserver;",
    name = "onChange",
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(
            definingClass = MIUI_SETTINGS_SYSTEM,
            name = "getBoolean",
            returnType = "Z",
        ),
    ),
)

/**
 * Defensive stub for the `miui.os.Build.DEVICE` path reached from
 * `isVideo24Wallpaper()`. No MIUI device is a Video24 device.
 */
internal object SupportVideo24WallpaperFingerprint : Fingerprint(
    definingClass = WALLPAPER_AUTHORITY_UTILS,
    name = "supportVideo24Wallpaper",
    returnType = "Z",
    parameters = emptyList(),
)

// ---------------------------------------------------------------------------
// Weather/day-night settings
// ---------------------------------------------------------------------------

/**
 * `WeatherUtils$1.onPostExecute()` writes sunrise/sunset values to
 * `Settings.Global`, which throws `SecurityException` without the
 * signature-only `WRITE_SECURE_SETTINGS` permission.
 */
internal object WeatherSettingsWritesFingerprint : Fingerprint(
    definingClass = WEATHER_UTILS_ASYNC,
    name = "onPostExecute",
    returnType = "V",
    parameters = listOf("Landroid/util/Pair;"),
)

/**
 * `SuperWallpaperUtils.getSuperWallpaperHomePosition()` reads the desk position
 * from MIUI `Settings.Secure`. The position services derive their position from
 * the service class name instead.
 */
internal object SuperWallpaperHomePositionFingerprint : Fingerprint(
    definingClass = SUPER_WALLPAPER_UTILS,
    name = "getSuperWallpaperHomePosition",
    returnType = "I",
    parameters = listOf(CONTEXT, "Ljava/lang/String;"),
)

/**
 * `BaseEarthSuperWallpaper$SuperWallpaperEngine.goToAodState()` performs the
 * screen-off AOD zoom-out.
 */
internal object AodStateMethodFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "goToAodState",
    returnType = "V",
    parameters = listOf("I"),
)

/**
 * `BaseEarthSuperWallpaper$SuperWallpaperEngine.onCreate()` initializes the
 * Filament player. Preview engines are disabled so they can never compete with
 * the applied wallpaper engine for the shared service state.
 */
internal object EngineCreateFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/view/SurfaceHolder;"),
)

/**
 * Preview engine callbacks are skipped to avoid touching a player that was
 * never created for the preview.
 */
internal object EngineOnCommandFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onCommand",
    returnType = "Landroid/os/Bundle;",
    parameters = listOf(
        "Ljava/lang/String;",
        "I",
        "I",
        "I",
        "Landroid/os/Bundle;",
        "Z",
    ),
)

internal object EngineOnVisibilityChangedFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onVisibilityChanged",
    returnType = "V",
    parameters = listOf("Z"),
)

internal object EngineOnOffsetsChangedFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onOffsetsChanged",
    returnType = "V",
    parameters = listOf("F", "F", "F", "F", "I", "I"),
)

internal object EngineOnAmbientModeChangedFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onAmbientModeChanged",
    returnType = "V",
    parameters = listOf("Z", "J"),
)

internal object EngineOnTouchEventFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onTouchEvent",
    returnType = "V",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

internal object EngineOnSurfaceCreatedFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onSurfaceCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/SurfaceHolder;"),
)

internal object EngineOnSurfaceChangedFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onSurfaceChanged",
    returnType = "V",
    parameters = listOf("Landroid/view/SurfaceHolder;", "I", "I", "I"),
)

/**
 * `onGoingToSleep()` calls `goToAodState()` synchronously on screen-off.
 */
internal object AodStateCallFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onGoingToSleep",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = BASE_EARTH_ENGINE,
            name = "goToAodState",
            returnType = "V",
        ),
    ),
)

/**
 * `onWakeUp()` runs when the display turns back on. Any pending delayed AOD
 * transition is cancelled there so it cannot fire on an awake device.
 */
internal object AodWakeUpFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onWakeUp",
    returnType = "V",
    parameters = listOf(CONTEXT),
)

/**
 * `onDestroy()` tears down the engine. Cancel any scheduled AOD transition so
 * it cannot touch a released renderer.
 */
internal object AodDestroyFingerprint : Fingerprint(
    definingClass = BASE_EARTH_ENGINE,
    name = "onDestroy",
    returnType = "V",
    parameters = emptyList(),
)
