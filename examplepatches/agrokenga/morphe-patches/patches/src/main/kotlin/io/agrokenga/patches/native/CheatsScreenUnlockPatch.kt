package io.agrokenga.patches.native

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import java.util.logging.Logger

private val log = Logger.getLogger("CheatsScreenUnlockPatch")

/**
 * KoPP2 2.21.4 `SystemScreen.OpenCredits()`.
 *
 * The Settings screen has no code-referenced cheat button, but the Credits button
 * is bound to `OpenCredits`. Redirecting that method to `OpenCheats` makes the
 * existing Settings -> Credits button open the Cheats panel instead.
 *
 * `OpenCheats` closes Settings and calls `ScreenHelper.Trigger(PanelStates.Cheats)`.
 * `CheatsScreen.OnKeyPress` and `CheatsScreen.Close` remain intact, so the panel
 * can still be closed normally.
 *
 * RVA and file offset come from the matching Il2CppDumper output for each ABI:
 * - arm64:   OpenCredits RVA 0x24921E8, file offset 0x248E1E8
 *            OpenCheats  RVA 0x2492144
 * - armv7:   OpenCredits RVA 0x13F5AF8, file offset 0x13F5AF8
 *            OpenCheats  RVA 0x13F5A28
 *
 * These offsets are version-specific. Re-dump both ABIs before reusing them on a
 * different app version.
 */
private const val ARM64_OPEN_CREDITS_RVA = 0x24921E8L
private const val ARM64_OPEN_CREDITS_FILE_OFFSET = 0x248E1E8L
private const val ARMV7_OPEN_CREDITS_RVA = 0x13F5AF8L
private const val ARMV7_OPEN_CREDITS_FILE_OFFSET = 0x13F5AF8L

// ARM64 `B 0x2492144` from 0x24921E8.
private val ARM64_BRANCH_TO_OPEN_CHEATS = byteArrayOf(
    0xD7.toByte(), 0xFF.toByte(), 0xFF.toByte(), 0x17,
)

// ARMv7 ARM-mode `B 0x13F5A28` from 0x13F5AF8.
private val ARMV7_BRANCH_TO_OPEN_CHEATS = byteArrayOf(
    0xCA.toByte(), 0xFF.toByte(), 0xFF.toByte(), 0xEA.toByte(),
)

// First instruction of OpenCredits, used to detect an unexpected offset.
private val ARM64_OPEN_CREDITS_PROLOGUE = byteArrayOf(
    0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(),
)
private val ARMV7_OPEN_CREDITS_PROLOGUE = byteArrayOf(
    0x30, 0x48, 0x2D, 0xE9.toByte(),
)

val cheatsScreenUnlockPatch = resourcePatch(
    name = "Cheats Screen Unlock",
    description = "Makes the in-game Cheats screen reachable by redirecting the " +
        "Settings -> Credits button to SystemScreen.OpenCheats. Single-player UI only; " +
        "it does not grant items, currency, or purchases.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFD700,
            targets = listOf(AppTarget(version = "2.21.4")),
        ),
    )

    val enableUnlock = booleanOption(
        key = "cheatsScreenUnlockEnable",
        default = false,
        title = "Open Cheats from Settings -> Credits",
        description = "Patch SystemScreen.OpenCredits to jump to SystemScreen.OpenCheats. " +
            "The Credits button then opens the Cheats panel. Disabled by default.",
    )

    execute {
        log.info("=== Cheats screen unlock ===")

        if (enableUnlock.value != true) {
            log.info(
                "Disabled; set cheatsScreenUnlockEnable=true to make Settings -> Credits " +
                    "open the Cheats screen.",
            )
        } else {
            val arm64 = get("lib/arm64-v8a/libil2cpp.so")
            if (arm64.exists()) {
                patchMethod(
                    file = arm64,
                    abi = "arm64-v8a",
                    methodName = "SystemScreen.OpenCredits -> OpenCheats",
                    rva = ARM64_OPEN_CREDITS_RVA,
                    expectedOffset = ARM64_OPEN_CREDITS_FILE_OFFSET,
                    patch = ARM64_BRANCH_TO_OPEN_CHEATS,
                    expectedBefore = ARM64_OPEN_CREDITS_PROLOGUE,
                )
            } else {
                log.warning(
                    "MISSING lib/arm64-v8a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }

            val armv7 = get("lib/armeabi-v7a/libil2cpp.so")
            if (armv7.exists()) {
                patchMethod(
                    file = armv7,
                    abi = "armeabi-v7a",
                    methodName = "SystemScreen.OpenCredits -> OpenCheats",
                    rva = ARMV7_OPEN_CREDITS_RVA,
                    expectedOffset = ARMV7_OPEN_CREDITS_FILE_OFFSET,
                    patch = ARMV7_BRANCH_TO_OPEN_CHEATS,
                    expectedBefore = ARMV7_OPEN_CREDITS_PROLOGUE,
                )
            } else {
                log.warning(
                    "MISSING lib/armeabi-v7a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }
        }
    }
}
