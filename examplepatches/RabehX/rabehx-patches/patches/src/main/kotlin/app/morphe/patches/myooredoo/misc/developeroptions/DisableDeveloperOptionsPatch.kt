/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.developeroptions

import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Neutralizes every path the app uses to detect that Developer Options /
 * USB debugging are enabled. The UI shows a blocking dialog
 * ("For your safety, please turn off developer settings on your phone.")
 * whenever any of these channels reports "enabled".
 *
 * The reads happen through `Settings$Secure.getInt` inside:
 *  - MainActivity's MethodChannel dispatcher ("isDeveloperOptionsOn"/"isUsbDebugOn")
 *  - com.xamdesign.safe_device (DevelopmentModeCheck)
 *  - com.example.root_checker_plus (isDeveloperMode)
 *  - com.emrys.rjsniffer (runprog3 adb gate)
 *
 * Strategy: zero the result of every `Settings$Secure.getInt` call for the
 * two security keys inside the flagged methods, and force the dedicated
 * boolean checks to return false.
 */
@Suppress("unused")
val disableDeveloperOptionsPatch = bytecodePatch(
    name = "Disable developer options detection",
    description = "Stops the app from detecting that Developer Options or USB debugging are " +
            "enabled on the device, removing the blocking security dialog.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        /**
         * Zero the result of `Settings$Secure.getInt(...)` instructions found in the method,
         * so both "development_settings_enabled" and "adb_enabled" always read as 0.
         */
        fun neutralizeSecureGetInt(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
            val implementation = method.implementation ?: return
            val insns = implementation.instructions.toList()
            val replacements = buildList {
                insns.forEachIndexed { index, instruction ->
                    if (instruction is ReferenceInstruction) {
                        val reference = instruction.reference
                        if (reference is MethodReference &&
                            reference.name == "getInt" &&
                            reference.definingClass == "Landroid/provider/Settings\$Secure;"
                        ) {
                            // Find the following move-result and zero its destination
                            // register. The previous implementation wrote to p0,
                            // which is the receiver/context register for these
                            // methods and left the actual result unchanged.
                            var cursor = index + 1
                            while (cursor < insns.size) {
                                if (insns[cursor].opcode == Opcode.MOVE_RESULT) {
                                    val resultRegister =
                                        (insns[cursor] as OneRegisterInstruction).registerA
                                    add(cursor to resultRegister)
                                    break
                                }
                                cursor++
                            }
                        }
                    }
                }
            }

            // Insert from the end so adding an instruction does not invalidate
            // the indexes collected from the original implementation.
            replacements.asReversed().forEach { (index, register) ->
                method.addInstruction(index + 1, "const/16 v$register, 0x0")
            }
        }

        // MainActivity channel dispatcher: reads "development_settings_enabled" and "adb_enabled"
        val mainActivitySettingsFingerprint = object : Fingerprint(
            definingClass = "Lcom/example/ooredoo_selfcare_algeria/MainActivity;",
            name = "configureFlutterEngine",
            returnType = "V",
            strings = listOf("development_settings_enabled"),
        ) {}
        // RjsnifferPlugin dispatcher: contains "runprog3" and the "adb_enabled" read
        val rjsnifferFingerprint = object : Fingerprint(
            definingClass = "Lcom/emrys/rjsniffer/rjsniffer/RjsnifferPlugin;",
            name = "onMethodCall",
            returnType = "V",
            parameters = listOf(
                "Lio/flutter/plugin/common/MethodCall;",
                "Lio/flutter/plugin/common/MethodChannel\$Result;",
            ),
            strings = listOf("runprog3"),
        ) {}
        // DevelopmentModeCheck.developmentModeCheck / usbDebuggingCheck
        val developmentModeCheckFingerprint = object : Fingerprint(
            definingClass = "Lcom/xamdesign/safe_device/DevelopmentMode/DevelopmentModeCheck;",
            returnType = "Z",
            parameters = listOf("Landroid/content/Context;"),
            strings = listOf("development_settings_enabled"),
        ) {}
        val usbDebuggingCheckFingerprint = object : Fingerprint(
            definingClass = "Lcom/xamdesign/safe_device/DevelopmentMode/DevelopmentModeCheck;",
            returnType = "Z",
            parameters = listOf("Landroid/content/Context;"),
            strings = listOf("adb_enabled"),
        ) {}
        // RootCheckerPlusPlugin.isDeveloperMode
        val rootCheckerDeveloperModeFingerprint = object : Fingerprint(
            definingClass = "Lcom/example/root_checker_plus/RootCheckerPlusPlugin;",
            name = "isDeveloperMode",
            returnType = "Z",
            parameters = listOf(),
            strings = listOf("isDeveloperMode"),
        ) {}

        listOf(
            mainActivitySettingsFingerprint,
            rjsnifferFingerprint,
        ).forEach { fingerprint ->
            runCatching { fingerprint.method }.getOrNull()?.let { method ->
                neutralizeSecureGetInt(method)
            }
        }

        listOf(
            developmentModeCheckFingerprint,
            usbDebuggingCheckFingerprint,
            rootCheckerDeveloperModeFingerprint,
        ).forEach { fingerprint ->
            runCatching { fingerprint.method }.getOrNull()?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """
                )
            }
        }

        // RjsnifferPlugin: the JS-injection bridge gate (returns injection availability).
        // Force the whole dispatcher to report "unavailable" so neither adb nor frida can
        // enable the bridge (and no security signal is ever derived from it).
        runCatching { rjsnifferFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """
            )
        }
    }
}
