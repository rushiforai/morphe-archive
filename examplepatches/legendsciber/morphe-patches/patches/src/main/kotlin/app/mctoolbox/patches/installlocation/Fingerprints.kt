package app.mctoolbox.patches.installlocation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * MinecraftActivity.onCreate — first instruction of the method
 * (const-string "com.mojang.minecraftpe", index 0).
 *
 * Used as a stable anchor for the PlaySpoof patch to inject
 * pref-write at method start (index 0 is guaranteed, no drift risk).
 */
object McPackageLookupFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/mctoolbox/MinecraftActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("com.mojang.minecraftpe")
    )
)
