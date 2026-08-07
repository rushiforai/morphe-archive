/*
 * Copyright 2026 PetalAA.
 * https://github.com/petalaa/PetalMaps-AndroidAuto
 *
 * This file is part of the PetalAA patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3).
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 */

package dev.petalaa.patches.androidauto

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Fingerprint for [MapApplication.onCreate] — the application entry point.
 *
 * Method signature: `public void onCreate()`
 * Class is NOT obfuscated: `com.huawei.maps.launch.MapApplication`.
 *
 * Structurally unique: it is the only method in the APK that `invoke-super`s
 * `Lcom/huawei/maps/app/common/utils/BaseMapApplication;->onCreate()V`.
 * The match also pinpoints the exact index of that invoke-super instruction,
 * which is used as the injection anchor.
 */
internal object MapApplicationOnCreateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/huawei/maps/launch/MapApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/huawei/maps/app/common/utils/BaseMapApplication;",
            name = "onCreate",
            parameters = emptyList(),
            returnType = "V",
            opcode = Opcode.INVOKE_SUPER,
        )
    ),
)

/**
 * Bytecode patch that registers Petal Maps in Android Auto's allowlist on
 * startup, when root is available.
 *
 * Injects a call to `dev.petalaa.extension.AASelfTweaker.ensureRegistered(Context)`
 * right after `super.onCreate()` in [MapApplication.onCreate]. The extension
 * class (merged into the APK by [androidAutoPatch]) performs the root check
 * internally and is a no-op on non-rooted devices.
 *
 * ## Injection details (validated against classes9.dex of 4.7.0.322)
 * The method has `.registers 7` (v0–v5 + p0). At the injection point
 * (immediately after invoke-super, never before):
 * - v0 is NOT free: it holds `uf.a` and is used as receiver later.
 * - v1 IS free: its previous value is dead, and the next instruction
 *   (`move-result-wide v1`) overwrites it without an intervening read.
 */
@Suppress("unused")
val androidAutoAllowlistPatch = bytecodePatch(
    name = "Android Auto allowlist (root)",
    description = "Registers the app in Android Auto's allowlist on startup " +
            "when root is available; no-op without root.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    // Ensures dev.petalaa.extension.AASelfTweaker is present in the final dex
    // (androidAutoPatch merges extensions/extension.rve via extendWith).
    dependsOn(androidAutoPatch)

    execute {
        // The fingerprint guarantees exactly one match: the invoke-super of
        // super.onCreate(). Inject immediately AFTER it.
        val insertIndex = MapApplicationOnCreateFingerprint
            .instructionMatches
            .single()
            .index + 1

        MapApplicationOnCreateFingerprint.method.addInstructions(
            insertIndex,
            """
                move-object/from16 v1, p0
                invoke-static {v1}, Ldev/petalaa/extension/AASelfTweaker;->ensureRegistered(Landroid/content/Context;)V
            """
        )
    }
}
