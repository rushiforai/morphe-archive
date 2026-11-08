package app.morphe.patches

import app.morphe.patches.all.misc.clone.resetTargetPackageName
import app.morphe.patches.all.misc.clone.setOrGetFallbackPackageName
import app.morphe.patches.shared.misc.settings.MORPHE_SETTINGS_INTENT
import app.morphe.patches.youtube.misc.settings.newIntent
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class SettingsIntentPackageTest {

    @BeforeTest
    @AfterTest
    fun cleanup() {
        resetTargetPackageName()
    }

    @Test
    fun testNonRootInstallFlow() {
        // Given a clean start
        resetTargetPackageName()

        // Phase 1: GmsCoreSupportPatch runs and registers the rebranded package
        val gmsCorePackage = setOrGetFallbackPackageName("app.morphe.android.youtube")
        assertEquals("app.morphe.android.youtube", gmsCorePackage)

        // Verify root/mounted check returns false for non-root
        val isMounted = setOrGetFallbackPackageName("com.google.android.youtube") == "com.google.android.youtube"
        assertFalse(isMounted, "Non-root install must NOT be detected as mounted install")

        // Phase 2: SettingsPatch builds the Morphe Settings intent
        val intent = newIntent(MORPHE_SETTINGS_INTENT)
        assertEquals("app.morphe.android.youtube", intent.targetPackageSupplier())
        assertEquals("com.google.android.gms.common.api.GoogleApiActivity", intent.targetClass)
        assertEquals(MORPHE_SETTINGS_INTENT, intent.data)
    }

    @Test
    fun testRootInstallFlow() {
        // Given a clean start
        resetTargetPackageName()

        // In a root install, GmsCoreSupportPatch does NOT execute.
        // Verify root/mounted check returns true
        val isMounted = setOrGetFallbackPackageName("com.google.android.youtube") == "com.google.android.youtube"
        assertTrue(isMounted, "Root install must be detected as mounted install")

        // Phase 2: SettingsPatch builds the Morphe Settings intent
        val intent = newIntent(MORPHE_SETTINGS_INTENT)
        assertEquals("com.google.android.youtube", intent.targetPackageSupplier())
        assertEquals("com.google.android.gms.common.api.GoogleApiActivity", intent.targetClass)
        assertEquals(MORPHE_SETTINGS_INTENT, intent.data)
    }

    @Test
    fun testJvmIsolationBetweenBuilds() {
        // Run 1: Non-root build
        resetTargetPackageName()
        setOrGetFallbackPackageName("app.morphe.android.youtube")
        val nonRootIntent = newIntent(MORPHE_SETTINGS_INTENT)
        assertEquals("app.morphe.android.youtube", nonRootIntent.targetPackageSupplier())

        // Run 2: Immediately followed by Root build in the same JVM
        // settingsResourcePatch.execute or cloneAppPatch.execute resets the state
        resetTargetPackageName()

        val rootIntent = newIntent(MORPHE_SETTINGS_INTENT)
        assertEquals(
            "com.google.android.youtube", rootIntent.targetPackageSupplier(),
            "Root build in same JVM must NOT leak previous non-root package name"
        )
        assertEquals(MORPHE_SETTINGS_INTENT, rootIntent.data)
    }
}
