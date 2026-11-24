/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo

import app.fakh.patches.fomo.shared.Constants.COMPATIBILITY_FOMO
import app.fakh.patches.shared.featuresPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/** FOMO's one activity; React Native draws every screen inside it. */
private object MainActivityCreateFingerprint : Fingerprint(
    definingClass = "Lid/anon/android/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** The Fakh Patches row in Settings that opens the switches of the applied patches. */
internal val settingsPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_FOMO)
    dependsOn(answerDecoyTextPatch, featuresPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val method = MainActivityCreateFingerprint.method
        val end = method.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        method.addInstruction(end, "invoke-static { p0 }, Lapp/fakh/extension/fomo/FomoSettings;->attach(Landroid/app/Activity;)V")
    }
}

private const val SETTINGS = "Lapp/fakh/extension/fomo/FomoSettings;"

/** React Native's default ReactHost factory, which gets the name of the bundle asset to load. */
private object ReactHostFingerprint : Fingerprint(
    definingClass = "Lexpo/modules/ExpoReactHostFactory;",
    name = "getDefaultReactHost",
    parameters = listOf(
        "Landroid/content/Context;", "Ljava/util/List;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
        "Lcom/facebook/react/runtime/JSRuntimeFactory;", "Z", "Lcom/facebook/react/runtime/BindingsInstaller;",
    ),
)

/** Lets the Hide ads switch pick the original bundle, which Hide ads keeps in the app, in place of the rewritten one. */
internal val hideAdsSwitchPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_FOMO)
    dependsOn(settingsPatch)

    execute {
        // The fourth argument is the name of the bundle in the assets.
        ReactHostFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p3 }, $SETTINGS->bundleAsset(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p3
            """,
        )
    }
}
