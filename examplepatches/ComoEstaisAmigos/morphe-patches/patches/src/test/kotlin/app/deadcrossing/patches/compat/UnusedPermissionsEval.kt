package app.deadcrossing.patches.compat

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/**
 * What would have caught a patch that stripped UnityPlayer / IOUtil permissions
 * because ad SDKs also call the same APIs.
 *
 * Orig classes.dex invoke sites:
 * - Vibrator: only UnityPlayer
 * - PowerManager WakeLock: UnityPlayer plus emptied AppLovin
 * - ConnectivityManager: UnityPlayer.getInternetReachability plus emptied ad SDKs
 * - Environment.getExternalStorageDirectory: UnityPlayer, IOUtil.readOldData /
 *   saveOldData (`/sdcard/.ftbackup`), NetUtils icon cache, plus emptied ad SDKs
 *
 * Mobclix has zero `Lcom/mobclix/` class_defs; the leftover activity and
 * APPLICATION_ID meta-data are dead manifest entries.
 */
class UnusedPermissionsEval {
    @Test
    fun `UnityPlayer APIs keep their permissions`() {
        val keepers = mapOf(
            "UnityPlayer.vibrate" to "android.permission.VIBRATE",
            "UnityPlayer.setWakeLock" to "android.permission.WAKE_LOCK",
            "UnityPlayer.getInternetReachability" to "android.permission.ACCESS_NETWORK_STATE",
            "UnityPlayer + IOUtil.getExternalStorageDirectory" to "android.permission.WRITE_EXTERNAL_STORAGE",
        )
        for (permission in keepers.values) {
            assertFalse(permission in REMOVED_PERMISSIONS, permission)
        }
        assertEquals(4, keepers.size)
        assertFalse("android.permission.INTERNET" in REMOVED_PERMISSIONS)
        assertFalse("com.android.vending.BILLING" in REMOVED_PERMISSIONS)
    }

    @Test
    fun `phone and wifi stay the only dropped permissions`() {
        assertEquals(
            listOf(
                "android.permission.READ_PHONE_STATE",
                "android.permission.ACCESS_WIFI_STATE",
            ),
            REMOVED_PERMISSIONS,
        )
    }

    @Test
    fun `Mobclix leftover is dropped without touching IAP_KEY`() {
        assertEquals(listOf("com.mobclix.APPLICATION_ID"), REMOVED_META)
        assertTrue(REMOVED_COMPONENTS.contains("activity" to "com.mobclix.android.sdk.MobclixBrowserActivity"))
        assertFalse("IAP_KEY" in REMOVED_META)
        assertFalse(REMOVED_COMPONENTS.any { it.second.contains("DeadCrossing") })
        assertFalse(REMOVED_COMPONENTS.any { it.second.contains("BillingService") })
    }
}
