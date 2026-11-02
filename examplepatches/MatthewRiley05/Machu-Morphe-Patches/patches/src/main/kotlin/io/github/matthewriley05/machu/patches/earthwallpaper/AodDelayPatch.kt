package io.github.matthewriley05.machu.patches.earthwallpaper

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intSliderOption
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.matthewriley05.machu.patches.earthwallpaper.Constants.COMPATIBILITY_EARTH_SUPER_WALLPAPER

private const val AOD_DELAY_HELPER =
    "Lcom/miui/miwallpaper/earth/superwallpaper/AodDelay;"

/**
 * Delays the AOD zoom-out when the screen turns off. Some devices, including
 * Pixel phones, run a closing animation; without the delay the wallpaper starts
 * its zoom-out while the animation is still playing.
 */
@Suppress("unused")
val earthSuperWallpaperAodDelayPatch = bytecodePatch(
    name = "Delay screen-off zoom-out",
    description = "Delays the AOD zoom-out on screen-off so the device's closing " +
        "animation can finish first. The delay is configurable (default 500 ms).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_EARTH_SUPER_WALLPAPER)

    val delayMs = intSliderOption(
        key = "delay_ms",
        title = "Zoom-out delay (ms)",
        description = "How long to wait before the AOD zoom-out starts when the screen turns off.",
        default = 500,
        min = 100,
        max = 1000,
        step = 50,
    )

    // The AodDelay helper is merged by the main patch.
    dependsOn(earthSuperWallpaperPatch)

    execute {
        if (classDefByOrNull(BASE_EARTH_SUPER_WALLPAPER) == null) {
            throw PatchException(
                "This patch requires the official Filament build (ALPHA-2.6.575 or newer).",
            )
        }

        val delay = delayMs.value ?: 500

        // AodDelay is in the same package, so package-private access is enough.
        val aodStateMatch = AodStateMethodFingerprint.matchOrNull()
            ?: throw PatchException("Failed to match $AodStateMethodFingerprint")

        val aodStateMethod = aodStateMatch.method
        aodStateMethod.setAccessFlags(
            aodStateMethod.accessFlags and AccessFlags.PRIVATE.value.inv(),
        )

        val callMatch = AodStateCallFingerprint.matchOrNull()
            ?: throw PatchException("Failed to match $AodStateCallFingerprint")

        val index = callMatch.instructionMatches.first().index
        val method = callMatch.method

        method.replaceInstruction(
            index,
            "iget-object v1, p0, $BASE_EARTH_ENGINE->this\$0:$BASE_EARTH_SUPER_WALLPAPER",
        )
        method.addInstructions(
            index + 1,
            """
                invoke-static { v1 }, $BASE_EARTH_SUPER_WALLPAPER->access${'$'}100($BASE_EARTH_SUPER_WALLPAPER)Landroid/os/Handler;
                move-result-object v1
                const-wide/16 v2, 0x${delay.toString(16)}
                invoke-static { v1, p0, v0, v2, v3 }, $AOD_DELAY_HELPER->post(Landroid/os/Handler;${BASE_EARTH_ENGINE}IJ)V
            """,
        )

        // The delayed transition must not run after the display wakes or after
        // the engine is torn down. Without this, pressing the power button twice
        // within the delay would apply the AOD frame on top of the lock screen.
        listOf(AodWakeUpFingerprint, AodDestroyFingerprint).forEach { fingerprint ->
            val match = fingerprint.matchOrNull()
                ?: throw PatchException("Failed to match $fingerprint")

            match.method.addInstruction(
                0,
                "invoke-static {}, $AOD_DELAY_HELPER->cancel()V",
            )
        }
    }
}
