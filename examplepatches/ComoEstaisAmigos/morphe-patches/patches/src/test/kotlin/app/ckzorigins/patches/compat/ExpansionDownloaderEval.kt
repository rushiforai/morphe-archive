package app.ckzorigins.patches.compat

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * What would have caught a patch that left the Play expansion downloader in place.
 *
 * VBA32 already labels Glu's 2.0.1 APK `Downloader.MSIL.gen.rexp`. The Java library under
 * `com.google.android.vending.expansion` is that OBB downloader: 66 classes, launcher
 * `DownloaderActivity`, `GDownloaderService`, `AlarmReceiver`. After [bundleObbPatch] the
 * OBB is inside the APK, so 64 of those classes are empty shells and the launcher is
 * `UnityLauncherActivity`. `Helpers` and `Helpers.Log` stay, because UnityLauncher still
 * reads `OBB_ENABLED` and the licensing client logs through them.
 *
 * A later scan that still hits `Downloader.MSIL.gen.rexp` is the generic MSIL heuristic
 * on Unity's `System.dll`, not the expansion download thread.
 */
class ExpansionDownloaderEval {
    @Test
    fun `the OBB copy is what kills the expansion downloader`() {
        assertNull(bundleObbPatch.name)
        assertEquals(64, EMPTIED_EXPANSION_CLASSES)
        assertEquals(2, KEPT_EXPANSION_TYPES.size)
        assertTrue(
            KEPT_EXPANSION_TYPES.containsAll(
                listOf(
                    "Lcom/google/android/vending/expansion/downloader/Helpers;",
                    "Lcom/google/android/vending/expansion/downloader/Helpers\$Log;",
                ),
            ),
        )
        assertEquals(
            "com.glu.plugins.AUnityInstaller.UnityLauncherActivity",
            ExpansionDownloaderManifest.UNITY_LAUNCHER,
        )
    }
}
