/*
 * Copyright 2026 PetalAA.
 * https://github.com/petalaa/PetalMaps-NonHuawei
 *
 * This file is part of the PetalAA patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3).
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 */

package dev.petalaa.patches.androidauto

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * True when the method calls `Activity.setRequestedOrientation(int)`.
 */
private fun Method.callsSetRequestedOrientation(): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is MethodReference &&
            reference.definingClass == "Landroid/app/Activity;" &&
            reference.name == "setRequestedOrientation"
    } == true

/**
 * True when the class logs with the "HwMapDisplayUtils" tag, which identifies
 * the display/orientation helper that owns `g0`/`h0`.
 */
private fun orientationHelperClass(methods: Iterable<Method>): Boolean =
    methods.any { method ->
        method.implementation?.instructions?.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is StringReference && reference.string == "HwMapDisplayUtils"
        } == true
    }

/**
 * `HwMapDisplayUtils.g0(Activity)`: applies an orientation when the map screen
 * is shown (portrait on phones, unspecified on tablets/driving modes).
 */
internal object OrientationActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    custom = { method, classDef ->
        orientationHelperClass(classDef.methods) && method.callsSetRequestedOrientation()
    },
)

/**
 * `HwMapDisplayUtils.h0(Activity, boolean)`: applies an orientation after a
 * state change (for example when navigation starts/stops).
 */
internal object OrientationActivityFlagFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Z"),
    custom = { method, classDef ->
        orientationHelperClass(classDef.methods) && method.callsSetRequestedOrientation()
    },
)

/**
 * Bytecode patch that lets Petal Maps rotate freely at any time.
 *
 * ## Problem
 * The manifest declares `screenOrientation="unspecified"` (see
 * [mainActivityOrientationPatch]), but at runtime `HwMapDisplayUtils.g0/h0`
 * call `Activity.setRequestedOrientation(...)`: phones are locked to portrait
 * while browsing and only switch to landscape/sensor when navigation starts.
 *
 * ## Fix
 * Replace the body of both orientation methods with a single
 * `setRequestedOrientation(SCREEN_ORIENTATION_UNSPECIFIED)` call, so the system
 * decides the orientation from the sensor during the whole app session.
 */
@Suppress("unused")
val freeRotationPatch = bytecodePatch(
    name = "Free rotation",
    description = "Lets Petal Maps rotate freely at all times instead of locking the map " +
            "to portrait until navigation starts.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        listOf(OrientationActivityFingerprint, OrientationActivityFlagFingerprint).forEach { fingerprint ->
            val method = fingerprint.method
            val implementation = method.implementation ?: return@forEach
            val original = implementation.instructions.toList()
            val locals = implementation.registerCount - method.parameterTypes.size
            require(locals >= 1) {
                "${method.definingClass}->${method.name} has no spare register"
            }

            // The original "unspecified" branch also calls a helper that sets
            // layoutInDisplayCutoutMode (to draw under the notch in landscape).
            // Keep that call, resolving its obfuscated name from this APK.
            val displayHelper = original
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .firstOrNull {
                    it.definingClass == method.definingClass &&
                        it.returnType == "V" &&
                        it.parameterTypes.toList() == listOf("Landroid/app/Activity;")
                }

            // Prepend instead of replacing the body: the original code is kept
            // (unreachable) so the method's try/catch table stays valid — ART
            // rejects a method whose exception entry points past its code.
            method.addInstructions(
                0,
                buildString {
                    appendLine("const/4 v0, -0x1")
                    appendLine("invoke-virtual {p0, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V")
                    if (displayHelper != null) {
                        appendLine(
                            "invoke-static {p0}, ${displayHelper.definingClass}->" +
                                "${displayHelper.name}(Landroid/app/Activity;)V"
                        )
                    }
                    append("return-void")
                }
            )
        }
    }
}
