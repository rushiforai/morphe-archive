package app.stayfree.patches.sync

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE

/**
 * MIUI "background pop-up" permission check (`Ln38;->b()Z` in 20.16.1, `Lt28;->b()Z` in 20.14.1).
 * On a Xiaomi/Redmi/Poco manufacturer it reflectively calls
 * `AppOpsManager.checkOpNoThrow(10021, myUid(), packageName)` — 10021 (0x2725) is MIUI's private
 * `OP_BACKGROUND_START_ACTIVITY` app-op. The method is unique: no other method loads both the
 * "checkOpNoThrow" string and the 0x2725 op literal.
 */
private object MiuiBackgroundPopupCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("checkOpNoThrow"),
        literal(0x2725),
    ),
)

/**
 * AlphaDroid (and other AOSP ROMs for Xiaomi devices) report `Build.MANUFACTURER` as Xiaomi/Redmi/
 * Poco but are plain AOSP, so MIUI's private app-op 10021 does not exist. StayFree's manufacturer
 * check then calls `AppOpsManager.checkOpNoThrow(10021, …)`, and the framework throws
 * `IllegalArgumentException: Bad operation #10021`. On the device-pairing path this exception is
 * raised in `MainActivity.onCreate` while handling the `android-connect-device` deep link, which
 * aborts the whole activity before the pairing request is sent — the extension's pairing panel then
 * only ever shows "Something went wrong" (see also [localDeviceSyncPatch]).
 *
 * Forcing the check to report "granted" skips the `checkOpNoThrow(10021)` call entirely. On real
 * AOSP there is no such background-pop-up restriction, so reporting the capability as present is the
 * correct behaviour; on real MIUI this method is never reached (those builds have the op).
 */
@Suppress("unused")
val miuiBackgroundPopupCheckPatch = bytecodePatch(
    name = "Fix MIUI permission check crash",
    description = "Stops the Xiaomi/Redmi/Poco \"background pop-up\" permission check from crashing " +
        "on AOSP-based ROMs (\"Bad operation #10021\"), which otherwise aborts device pairing with " +
        "\"Something went wrong\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        // Report the MIUI background-pop-up op as granted without ever calling checkOpNoThrow(10021).
        MiuiBackgroundPopupCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
