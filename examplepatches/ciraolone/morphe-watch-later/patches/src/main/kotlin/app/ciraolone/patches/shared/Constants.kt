/*
 * Definisce con quale app e con quali versioni le patch di questo bundle sono compatibili.
 * L'unico contenuto e' COMPATIBILITY_YOUTUBE, che dichiara il package di YouTube, le firme
 * ufficiali dell'APK (servono a Morphe per rifiutare APK manomessi) e l'elenco delle versioni
 * su cui le patch sono state provate. Questo elenco e' ricopiato da morphe-patches ufficiale:
 * quando li' aggiungono una versione nuova va allineato anche qui, altrimenti Morphe Manager
 * considerera' la nostra patch incompatibile con le build piu' recenti di YouTube.
 */

package app.ciraolone.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_YOUTUBE = Compatibility(
        name = "YouTube",
        packageName = "com.google.android.youtube",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xFF0033,
        signatures = setOf(
            // Android 13+
            "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
            // Android 7+
            "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"
        ),
        targets = listOf(
            AppTarget(
                version = "21.29.366",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.28.204",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.26.360",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "21.05.265",
                minSdk = 28,
                isExperimental = true
            ),
            AppTarget(
                version = "21.04.223",
                minSdk = 28
            ),
            AppTarget(
                version = "20.51.39",
                minSdk = 28
            ),
            AppTarget(
                version = "20.31.42",
                minSdk = 28
            ),
            AppTarget(
                version = "20.21.37",
                minSdk = 26
            )
        )
    )
}
