package io.agrokenga.patches.debug

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lio/agrokenga/extension/GameLogOverlay;"

/**
 * Adds a small log console over the bottom 30% of the game screen.
 *
 * The console is a normal Android view added to the activity's own content
 * view (no overlay permission). It tails logcat for this process only, so it
 * shows Unity's `Debug.Log`, native `__android_log_print`, and Java `Log`
 * output. The panel is touch-through, so it does not block game input.
 *
 * This is a diagnostic patch only: it does not read, change, or grant any
 * game state, currency, items, or purchases.
 */
@Suppress("unused")
val gameLogOverlayPatch = bytecodePatch(
    name = "On-screen Game Log",
    description = "Adds a touch-through, auto-scrolling log panel over the lower 30% of the " +
        "screen, with padding from the screen edges. It shows this process's logcat output " +
        "(Unity Debug.Log, native and Java logs). Diagnostic only; no game state is changed.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFD700,
            targets = listOf(AppTarget(version = "2.21.4")),
        ),
    )

    extendWith("extensions/extension.mpe")

    execute {
        // The Firebase messaging activity extends UnityPlayerActivity and calls
        // super.onCreate(), so patching the base class covers the real launcher.
        val onCreate = Fingerprint(
            definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method

        onCreate.addInstructions(
            0,
            "invoke-static {p0}, $EXTENSION_CLASS;->attach(Landroid/app/Activity;)V",
        )
    }
}
