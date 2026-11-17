/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea.upstream.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle

internal const val THEME_SETTINGS_CLASS = "Lapp/hxreborn/extension/ultimea/ThemeSettings;"

internal object FlutterInitFingerprint : app.morphe.patcher.Fingerprint(
    definingClass = "Lio/flutter/embedding/engine/FlutterJNI;",
    name = "init",
    parameters = listOf("Landroid/content/Context;", "[Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "J", "I"),
    returnType = "V",
)

internal val themeSettingsPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        FlutterInitFingerprint.matchSingle().method.addInstructions(0,
            "invoke-static { p1 }, $THEME_SETTINGS_CLASS->prepare(Landroid/content/Context;)V")
        val brightness = PlatformBrightnessFingerprint.matchSingle()
        val (_, putBrightness) = brightness.instructionMatches
        val brightnessRegister = brightness.method.getInstruction<com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction>(putBrightness.index).registerE
        brightness.method.addInstructions(putBrightness.index, "const-string v$brightnessRegister, \"dark\"")
        val systemBarStyle = SystemBarStyleFingerprint.matchSingle().method
        val jsonParameter = systemBarStyle.parameterTypes.indexOf("Lorg/json/JSONObject;")
        check(jsonParameter >= 0) { "The Flutter system bar parser has no JSON argument" }
        val parameter = jsonParameter + if (systemBarStyle.accessFlags and AccessFlags.STATIC.value != 0) 0 else 1
        systemBarStyle.addInstructions(0, "invoke-static { p$parameter }, $THEME_SETTINGS_CLASS->rewriteSystemBars(Lorg/json/JSONObject;)V")
        ActivityCreateFingerprint.matchSingle().method.addInstructions(
            0,
            "invoke-static { p0 }, $THEME_SETTINGS_CLASS->initialize(Landroid/app/Activity;)V",
        )
    }
}
