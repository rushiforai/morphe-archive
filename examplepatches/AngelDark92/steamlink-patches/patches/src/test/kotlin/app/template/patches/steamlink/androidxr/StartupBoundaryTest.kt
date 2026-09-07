package app.template.patches.steamlink.androidxr

import app.template.patches.shared.Constants.isEarlierStartupSteamLinkBuild
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class StartupBoundaryTest {
    @Test
    fun `earlier startup accepts only preserved exact version and build pairs`() {
        val supported = setOf(
            "2.0.20" to "5001712",
            "2.0.20" to "5001740",
            "2.0.22" to "5002244",
            "2.0.22" to "5002296",
            "2.0.22" to "5002313",
            "2.0.22" to "5002318",
        )
        val versions = listOf("2.0.20", "2.0.22", "2.0.23", "")
        val builds = supported.map { it.second } + listOf("5002322", "5002323", "5002243", "unknown")
        versions.forEach { version ->
            builds.forEach { build ->
                assertEquals((version to build) in supported,
                    isEarlierStartupSteamLinkBuild(version, build), "$version/$build")
            }
        }
        listOf(xrLauncherBootstrapPatch, xrStartupPermissionsPatch).forEach { patch ->
            val targets = patch.compatibility.orEmpty().flatMap { it.targets }.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it.toString() }
            }.toSet()
            assertEquals(supported, targets, patch.name)
            assertFalse(patch.default, patch.name)
        }
    }

    @Test
    fun `shared launcher helper leaves splash and runtime permission requests disabled`() {
        val smali = resource("GalaxyXRPermissionActivity")
        listOf("shouldShowSplash", "shouldRequestRuntimePermissions").forEach { flag ->
            val body = method(smali, "private static $flag()Z")
            assertTrue(Regex("const/4\\s+v0,\\s+0x0\\s+return v0").containsMatchIn(body), flag)
        }
        val create = method(smali, "protected onCreate(Landroid/os/Bundle;)V")
        val splashGuard = create.indexOf("if-eqz v0, :permissions")
        val splash = create.indexOf("Landroid/widget/TextView;")
        val permissions = create.indexOf("\n    :permissions")
        assertTrue(splashGuard >= 0 && splashGuard < splash && splash < permissions)
        val permissionGuard = create.substringAfter("->shouldRequestRuntimePermissions()Z")
            .substringBefore("\n    :runtime_permissions")
        assertTrue(permissionGuard.contains("if-nez v0, :runtime_permissions"))
        assertTrue(permissionGuard.contains("->continueAfterPermissions()V"))
        assertTrue(permissionGuard.contains("return-void"))
        assertFalse(permissionGuard.contains("->requestPermissions"))
    }

    @Test
    fun `native battery helper only opens battery settings and never owns startup UI`() {
        val smali = resource("GxrBatterySettings")
        assertTrue(smali.contains(".super Ljava/lang/Object;"))
        listOf("->requestPermissions", "->setContentView", "Landroid/widget/",
            "GalaxyXRPermissionActivity", "VRLink", "HAND_TRACKING", "EYE_TRACKING",
            "FACE_TRACKING", "RECORD_AUDIO", "BLUETOOTH", "SYSTEM_ALERT_WINDOW")
            .forEach { assertFalse(smali.contains(it), it) }
        val body = method(smali, "public static request(Landroid/app/Activity;Landroid/os/Bundle;)V")
        val launch = body.indexOf("->startActivity(")
        assertTrue(launch > 0)
        val beforeLaunch = body.substring(0, launch)
        assertTrue(beforeLaunch.contains("if-nez p1, :done"))
        assertTrue(beforeLaunch.contains("->isIgnoringBatteryOptimizations"))
        assertEquals(setOf(
            "android.settings.VIEW_ADVANCED_POWER_USAGE_DETAIL",
            "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS",
            "android.settings.APPLICATION_DETAILS_SETTINGS",
        ), Regex("android\\.settings\\.[A-Z_]+").findAll(body).map { it.value }.toSet())
        assertTrue(body.contains(".catch Landroid/content/ActivityNotFoundException;"))
        assertTrue(body.contains(".catch Ljava/lang/SecurityException;"))
    }

    private fun resource(name: String): String = requireNotNull(javaClass.getResource(
        "/steamlink/androidxr/smali/com/valvesoftware/steamlink/$name.smali",
    )).readText()

    private fun method(smali: String, signature: String): String {
        assertTrue(smali.contains(".method $signature"), signature)
        return smali.substringAfter(".method $signature").substringBefore(".end method")
    }
}
