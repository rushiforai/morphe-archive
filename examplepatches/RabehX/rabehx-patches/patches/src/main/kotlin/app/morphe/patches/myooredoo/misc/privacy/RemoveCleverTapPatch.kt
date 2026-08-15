/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.privacy

import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Strips CleverTap (marketing/analytics SDK) initialization from the app
 * process and MainActivity.onCreate. CleverTap was configured to collect the
 * user's phone number as an identity key ("Identity,Phone").
 */
@Suppress("unused")
val removeCleverTapPatch = bytecodePatch(
    name = "Remove CleverTap tracking",
    description = "Removes CleverTap analytics initialization, stopping the app from " +
            "collecting the phone number as an identity key and from reporting usage data.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        // The manifest names CleverTap's Application subclass. It registers an
        // ActivityLifecycleCallback before Flutter starts, so stopping only
        // MainActivity.onCreate would still initialize the SDK.
        val applicationOnCreateFingerprint = object : Fingerprint(
            definingClass = "Lcom/clevertap/android/sdk/Application;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf(),
        ) {}

        runCatching { applicationOnCreateFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    invoke-super {p0}, Landroid/app/Application;->onCreate()V
                    return-void
                """
            )
        }

        // MainActivity.onCreate is the only foreground initialization path
        // that creates a CleverTap instance and saves "Identity,Phone".
        val onCreateFingerprint = object : Fingerprint(
            definingClass = "Lcom/example/ooredoo_selfcare_algeria/MainActivity;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
            strings = listOf("CleverTapAPI"),
        ) {}

        runCatching { onCreateFingerprint.method }.getOrNull()?.let { method ->
            // Keep the Activity lifecycle and deep-link handling, but skip the
            // entire CleverTap setup block. The original code remains after the
            // return and is unreachable.
            method.addInstructions(
                0,
                """
                    invoke-super {p0, p1}, Lio/flutter/embedding/android/FlutterFragmentActivity;->onCreate(Landroid/os/Bundle;)V
                    invoke-virtual {p0}, Lcom/example/ooredoo_selfcare_algeria/MainActivity;->getIntent()Landroid/content/Intent;
                    move-result-object p1
                    invoke-direct {p0, p1}, Lcom/example/ooredoo_selfcare_algeria/MainActivity;->handleAdjustDeeplink(Landroid/content/Intent;)V
                    return-void
                """
            )
        }
    }
}
