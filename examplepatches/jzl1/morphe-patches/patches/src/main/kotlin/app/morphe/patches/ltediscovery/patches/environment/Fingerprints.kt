package lab.ltediscovery.patches.environment

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The app's single "is this an emulator" predicate, R8-renamed. In 7.6.33 the
 * class was `kp0` / `d0()`; in 7.6.34 it is `np0` / `g0()`. It inspects the
 * cached `android.os.Build.*` fields (FINGERPRINT, MODEL, HARDWARE, BOARD,
 * BOOTLOADER, SUPPORTED_ABIS, ...) for `goldfish`, `ranchu`, `sdk_gphone`,
 * `generic_x86`, `qemu`, `genymotion` and friends.
 *
 * Callers all treat `true` as "emulator-like device": `MainActivity` uses it to
 * set the flag that shows the "Unsupported device" dialog, `App` skips
 * background initialization, and `SignalService` / `LtedMessagingService` /
 * `LiveModeBootReceiver` / `MapCacheVersionPollWorker` refuse to start.
 *
 * Anchored on a literal from the detection table rather than the obfuscated
 * class or method name, so it survives another R8 rename between versions.
 */
internal object EmulatorCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("android sdk built for"),
    ),
)
