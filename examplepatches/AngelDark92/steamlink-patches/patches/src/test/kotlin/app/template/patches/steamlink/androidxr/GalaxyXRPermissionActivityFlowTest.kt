package app.template.patches.steamlink.androidxr

import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class GalaxyXRPermissionActivityFlowTest {
    private val activitySmali = requireNotNull(
        javaClass.getResource(
            "/steamlink/androidxr/smali/com/valvesoftware/steamlink/" +
                "GalaxyXRPermissionActivity.smali",
        ),
    ).readText()

    @Test
    fun `battery settings follow the overlay permission request`() {
        val continuation = method("private continueAfterPermissions()V")
        val overlayRequest = continuation.indexOf("GxrOverlayBridge;->requestPermission")
        val batterySettings = continuation.indexOf("android.settings.VIEW_ADVANCED_POWER_USAGE_DETAIL")

        assertTrue(overlayRequest >= 0)
        assertTrue(batterySettings > overlayRequest)
    }

    @Test
    fun `returning from overlay settings continues to battery settings`() {
        val activityResult = method("protected onActivityResult(IILandroid/content/Intent;)V")
        val overlayResult = activityResult
            .substringAfter("if-ne p1, v0, :battery")
            .substringBefore("\n    :battery")

        assertTrue(overlayResult.contains("->continueAfterPermissions()V"))
        assertFalse(overlayResult.contains("->launchSteamLink()V"))
    }

    @Test
    fun `each settings launch arms a fresh unpaused wait`() {
        val continuation = method("private continueAfterPermissions()V")
        val overlayLaunch = continuation
            .substringBefore("GxrOverlayBridge;->requestPermission")
            .substringAfter("if-nez v0, :battery")
        val batteryLaunch = continuation
            .substringBefore("->startActivityForResult")
            .substringAfterLast(":request_battery")

        assertArmsFreshWait(overlayLaunch, "v0")
        assertArmsFreshWait(batteryLaunch, "v1")
    }

    @Test
    fun `activity results consume settings state before continuation`() {
        val activityResult = method("protected onActivityResult(IILandroid/content/Intent;)V")
        val overlayResult = activityResult
            .substringAfter("if-ne p1, v0, :battery")
            .substringBefore("\n    :battery")
        val batteryResult = activityResult
            .substringAfter("if-ne p1, v0, :done")
            .substringBefore("\n    :done")

        assertConsumesStateBeforeContinuation(overlayResult)
        assertConsumesStateBeforeContinuation(batteryResult)
    }

    @Test
    fun `resume requires paused settings wait and consumes it`() {
        val onResume = method("protected onResume()V")
        val continuation = onResume.indexOf("->continueAfterPermissions()V")
        val beforeContinuation = onResume.substring(0, continuation)

        assertTrue(gatedByFalse("mSettingsRequestWaiting").containsMatchIn(beforeContinuation))
        assertTrue(gatedByFalse("mSettingsPauseObserved").containsMatchIn(beforeContinuation))
        assertConsumesStateBeforeContinuation(onResume)
        assertFalse(onResume.contains("mOverlayRequestLaunched:Z"))
        assertFalse(onResume.contains("mBatteryRequestLaunched:Z"))
    }

    private fun assertArmsFreshWait(launchPrefix: String, register: String) {
        val armsFreshWait = Regex(
            """const/4\s+$register,\s+0x1\s+""" +
                """(?:iput-boolean[^\r\n]*\s+)*""" +
                """iput-boolean\s+$register,\s+p0,\s+[^\s]+->mSettingsRequestWaiting:Z\s+""" +
                """const/4\s+$register,\s+0x0\s+""" +
                """iput-boolean\s+$register,\s+p0,\s+[^\s]+->mSettingsPauseObserved:Z""",
        )

        assertTrue(armsFreshWait.containsMatchIn(launchPrefix))
    }

    private fun assertConsumesStateBeforeContinuation(resultBranch: String) {
        val continuation = resultBranch.indexOf("->continueAfterPermissions()V")
        val beforeContinuation = resultBranch.substring(0, continuation)
        val consumesState = Regex(
            """const/4\s+v0,\s+0x0\s+""" +
                """iput-boolean\s+v0,\s+p0,\s+[^\s]+->mSettingsRequestWaiting:Z\s+""" +
                """iput-boolean\s+v0,\s+p0,\s+[^\s]+->mSettingsPauseObserved:Z""",
        )

        assertTrue(continuation >= 0)
        assertTrue(consumesState.containsMatchIn(beforeContinuation))
    }

    private fun gatedByFalse(field: String) = Regex(
        """iget-boolean\s+v0,\s+p0,\s+[^\s]+->$field:Z\s+if-eqz\s+v0,\s+:done""",
    )

    private fun method(signature: String): String = activitySmali
        .substringAfter(".method $signature")
        .substringBefore(".end method")
}
