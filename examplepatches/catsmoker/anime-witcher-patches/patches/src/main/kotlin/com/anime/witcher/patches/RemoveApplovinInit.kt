package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch

val removeApplovinInitPatch = bytecodePatch(
    name = "Remove AppLovin initialization",
    description = "Removes AppLovin SDK initialization from the Application class. Original APK: https://www.animewitcher.com/",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    dependsOn(disableAdsPatch)

    execute {
        ApplicationClassOnCreateFingerprint.method.let { method ->
            val implementation = method.implementation!!

            val initApplovinIndex = implementation.instructions.indexOfFirst { instruction ->
                instruction.toString().contains("initApplovinAds")
            }

            if (initApplovinIndex >= 0) {
                method.removeInstruction(initApplovinIndex)
            }
        }
    }
}
