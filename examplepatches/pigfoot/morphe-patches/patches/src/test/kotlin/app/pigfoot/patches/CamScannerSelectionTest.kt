package app.pigfoot.patches

import app.pigfoot.patches.camscanner.*
import app.morphe.patcher.patch.OptionException
import org.junit.Assert.*
import org.junit.Test
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory

class CamScannerSelectionTest {
    private val publicPatches = listOf(camscannerSigningPatch, camscannerLocalFeaturesPatch,
        camscannerPrivacyPatch, camscannerAdsPatch, camscannerOfflinePatch)

    @Test fun productSurfaceHasFiveNamesAndNoScannerDebugOrWithdrawnFeature() {
        assertEquals(setOf("CamScanner restore trust on re-signed builds", "CamScanner local premium features",
            "CamScanner reduce telemetry and app logging", "CamScanner disable ads",
            "CamScanner offline mode"),
            publicPatches.map { it.name }.toSet())
        for (internal in listOf(camscannerSideloadStartupPatch, camscannerFirebasePatch, camscannerLoggingPatch,
                camscannerPolicyExtensionPatch)) assertNull(internal.name)
        assertTrue(camscannerPrivacyPatch.options.isEmpty())
        assertNotNull(camscannerAdsPatch.options["rewardedVideos"])
    }

    @Test fun qualifiedVersionsAreNonExperimentalWithoutWideningCompatibility() {
        val expected = mapOf("7.26.5.2609160000" to 72651, "7.27.0.2609220000" to 72701)
        for (patch in publicPatches) {
            val compatibility = patch.compatibility!!.single()
            assertEquals(CAM_PACKAGE, compatibility.packageName)
            assertEquals(app.morphe.patcher.patch.ApkFileType.APKM, compatibility.apkFileType)
            assertEquals(expected.keys, compatibility.targets.map { it.version }.toSet())
            for (target in compatibility.targets) {
                assertFalse(target.isExperimental)
                assertEquals(mapOf(
                    app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to expected.getValue(target.version!!),
                    app.morphe.patcher.patch.SupportedAbi.ARMEABI_V7A to expected.getValue(target.version!!)
                ), target.versionCodes)
            }
        }
    }

    @Test fun recommendedProfilePreservesAdsAndInternetWithoutForcedScannerEdits() {
        for (patch in listOf(camscannerSigningPatch, camscannerLocalFeaturesPatch, camscannerPrivacyPatch)) assertTrue(patch.default)
        for (patch in listOf(camscannerAdsPatch, camscannerOfflinePatch)) assertFalse(patch.default)
        for (patch in publicPatches.filter { it != camscannerSigningPatch })
            assertTrue(patch.dependencies.contains(camscannerSigningPatch))
        for (patch in listOf(camscannerSigningPatch, camscannerLocalFeaturesPatch, camscannerPrivacyPatch)) {
            assertFalse(patch.dependencies.contains(camscannerAdsPatch))
            assertFalse(patch.dependencies.contains(camscannerOfflinePatch))
        }
    }

    @Test fun privacyIsOneFixedPolicyAndOfflineDoesNotForceItOrPremium() {
        assertTrue(camscannerPrivacyPatch.dependencies.containsAll(listOf(camscannerFirebasePatch, camscannerLoggingPatch)))
        assertTrue(camscannerOfflinePatch.dependencies.contains(camscannerAdsPatch))
        assertFalse(camscannerOfflinePatch.dependencies.contains(camscannerPrivacyPatch))
        assertFalse(camscannerOfflinePatch.dependencies.contains(camscannerLocalFeaturesPatch))
        assertFalse(camscannerAdsPatch.dependencies.contains(camscannerOfflinePatch))
    }

    @Test fun folderOptionPreservesOriginalByDefaultAndRejectsInvalidLimits() {
        val limit = camscannerLocalFeaturesPatch.options["folderLimit"]
        try {
            assertEquals(0, limit.value)
            for (n in listOf(0, 5000)) camscannerLocalFeaturesPatch.options["folderLimit"] = n
            assertThrows(OptionException.ValueValidationException::class.java) { camscannerLocalFeaturesPatch.options["folderLimit"] = -1 }
        } finally { limit.reset() }
    }
    private fun document(xml: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray()))
    @Test fun offlineRemovesDuplicateInternetWithoutRemovingOtherPermissions() {
        val doc = document("""<manifest xmlns:android="http://schemas.android.com/apk/res/android"><uses-permission android:name="android.permission.INTERNET"/><uses-permission android:name="android.permission.CAMERA"/><uses-permission android:name="android.permission.INTERNET"/><application/></manifest>""")
        assertEquals(2, removeInternet(doc))
        assertEquals(1, doc.getElementsByTagName("uses-permission").length)
        assertEquals("android.permission.CAMERA", (doc.getElementsByTagName("uses-permission").item(0) as org.w3c.dom.Element).getAttribute("android:name"))
        assertThrows(IllegalArgumentException::class.java) { removeInternet(doc) }
    }
    @Test fun adsCleanupPreservesLoginBillingAndWorkManager() {
        val names = listOf("com.vungle.ads.VungleProvider", "com.vk.api.sdk.internal.VKInitProvider", "com.intsig.wxapi.WXEntryActivity", "com.android.billingclient.api.ProxyBillingActivity", "androidx.work.impl.background.systemalarm.ConstraintProxy\$NetworkStateProxy", "com.google.android.gms.measurement.AppMeasurementService")
        val doc = document("<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><application>" + names.joinToString("") { "<service android:name=\"$it\"/>" } + "</application></manifest>")
        assertEquals(1, removeAdComponents(doc))
        assertEquals(5, doc.getElementsByTagName("service").length)
    }
    @Test fun metadataUpdatesRatherThanDuplicatingAndRejectsAmbiguity() {
        val doc = document("""<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application><meta-data android:name="firebase_sessions_enabled" android:value="true"/></application></manifest>""")
        metadata(doc, "firebase_sessions_enabled", "false")
        metadata(doc, "firebase_sessions_enabled", "false")
        assertEquals(1, doc.getElementsByTagName("meta-data").length)
        assertEquals("false", (doc.getElementsByTagName("meta-data").item(0) as org.w3c.dom.Element).getAttribute("android:value"))
        val duplicate = document("""<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application><meta-data android:name="x"/><meta-data android:name="x"/></application></manifest>""")
        assertThrows(IllegalArgumentException::class.java) { metadata(duplicate, "x", "false") }
    }
}
