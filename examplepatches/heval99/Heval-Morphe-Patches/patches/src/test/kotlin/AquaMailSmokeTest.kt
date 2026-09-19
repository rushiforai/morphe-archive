import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "org.kman.AquaMail"
private const val LICENSE_MANAGER = "Lorg/kman/AquaMail/data/LicenseManager;"
private const val FEATURE = "Lorg/kman/AquaMail/coredefs/Feature;"

class AquaMailSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium patch unlocks the license level and feature locks`() {
        val root = repoRoot()
        val apk = File(root, "apks/aquamail/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.7.0",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val licenseManager = classes.firstOrNull { it.type == LICENSE_MANAGER }
            ?: error("LicenseManager not found in emitted dexes")

        // The UI consumes the numeric level directly.
        assertReturnsInt(licenseManager.method("getLicenseLevel"), expected = 40, label = "LicenseManager.getLicenseLevel()")
        assertReturnsMethodCall(
            licenseManager.method("getLicenseType"),
            targetClass = LICENSE_MANAGER,
            targetName = "getLicenseTypeInApp",
            label = "LicenseManager.getLicenseType()",
        )

        assertForcedBoolean(licenseManager.method("isPro"), expected = true, label = "LicenseManager.isPro()")
        assertForcedBoolean(licenseManager.method("isPremium"), expected = true, label = "LicenseManager.isPremium()")
        assertForcedBoolean(licenseManager.method("isLicensedVersion"), expected = true, label = "LicenseManager.isLicensedVersion()")
        assertForcedBoolean(licenseManager.method("isFree"), expected = false, label = "LicenseManager.isFree()")
        assertForcedBoolean(
            licenseManager.method("isFeatureLockedForLicense", listOf(FEATURE)),
            expected = false, label = "LicenseManager.isFeatureLockedForLicense(Feature)",
        )

        val lockFeatures = classes.firstOrNull { it.type == "Lorg/kman/AquaMail/data/LockFeatures;" }
            ?: error("LockFeatures not found in emitted dexes")
        assertForcedBoolean(
            lockFeatures.method("isFeatureLocked", listOf(FEATURE)),
            expected = false, label = "LockFeatures.isFeatureLocked(Feature)",
        )
    }
}
