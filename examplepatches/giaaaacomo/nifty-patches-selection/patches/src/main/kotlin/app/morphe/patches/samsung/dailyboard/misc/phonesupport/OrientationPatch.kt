/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.samsung.dailyboard.misc.extension.sharedExtensionPatch
import app.morphe.patches.samsung.dailyboard.shared.Constants.COMPATIBILITY_DAILY_BOARD
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ORIENTATION_EXTENSION = "Lapp/morphe/extension/samsung/dailyboard/OrientationPatch;"


@Suppress("unused")
val dailyBoardOrientationPatch = bytecodePatch(
    name = "Customize orientation",
    description = "Adds portrait, landscape and sensor rotation independent of Android rotation lock. Includes Enable phone support.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DAILY_BOARD)
    dependsOn(enableDailyBoardOnPhonesPatch, sharedExtensionPatch)

    execute {
        HomeModeActivityOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $ORIENTATION_EXTENSION->applyToActivity(Landroid/app/Activity;)V"
        )
        HomeModeActivityOnResumeFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $ORIENTATION_EXTENSION->applyToActivity(Landroid/app/Activity;)V"
        )
        SettingsBaseActivityOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $ORIENTATION_EXTENSION->applyToActivity(Landroid/app/Activity;)V"
        )
        SettingsPreferencesFingerprint.method.apply {
            val preferencesLoadedIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.name == "setPreferencesFromResource"
            }
            addInstructions(
                preferencesLoadedIndex + 1,
                "invoke-static { p0 }, $ORIENTATION_EXTENSION->installOrientationPreferences(Ljava/lang/Object;)V"
            )
        }
        DreamServiceAttachedFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $ORIENTATION_EXTENSION->applyToDream(Landroid/service/dreams/DreamService;)V"
        )
    }
}
