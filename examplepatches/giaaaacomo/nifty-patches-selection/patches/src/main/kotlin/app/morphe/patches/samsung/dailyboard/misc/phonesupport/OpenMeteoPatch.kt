/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.samsung.dailyboard.misc.extension.sharedExtensionPatch
import app.morphe.patches.samsung.dailyboard.shared.Constants.COMPATIBILITY_DAILY_BOARD
import app.morphe.util.returnEarly

private const val WEATHER_EXTENSION = "Lapp/morphe/extension/samsung/dailyboard/OpenMeteoWeatherPatch;"


@Suppress("unused")
val dailyBoardWeatherPatch = bytecodePatch(
    name = "Use Open-Meteo weather",
    description = "Replaces Samsung weather with Open-Meteo using approximate location. Includes Enable phone support.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DAILY_BOARD)
    dependsOn(enableDailyBoardOnPhonesPatch, sharedExtensionPatch)

    execute {
        WeatherRepositoryUpdateFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p0 }, $WEATHER_EXTENSION->updateWeather(Landroid/content/Context;)V
                return-void
            """
        )
        WeatherStateFingerprint.method.returnEarly()
        WeatherSourceFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1, p2 }, $WEATHER_EXTENSION->bindWeatherSource(Landroid/widget/TextView;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original_weather_source
                return-void

                :original_weather_source
                nop
            """
        )
    }
}
