package app.mctoolbox.patches.installlocation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * MinecraftActivity.onCreate — metodun İLK talimatı
 * (const-string "com.mojang.minecraftpe", index 0).
 *
 * PlaySpoof yamasinin METOT BASINA pref-yazimi enjekte etmesi icin sabit
 * cipa olarak kullanilir (index 0 garanti, kayma riski yok).
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
