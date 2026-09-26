package dev.bucek.affine.patches.stickwar

import app.morphe.patcher.Fingerprint

/** Google Play's PairIP application wrapper in Stick War: Legacy 2026.1.983. */
internal object PairIpApplicationAttachFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** Encrypted PairIP startup program invoked before Application.attachBaseContext(). */
internal object PairIpStartupLauncherFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    parameters = emptyList(),
)