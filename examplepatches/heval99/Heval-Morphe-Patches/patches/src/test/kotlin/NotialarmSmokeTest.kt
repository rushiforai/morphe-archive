import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.soosu.notialarm"
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"
private const val APP_PREFERENCE = "Lcom/soosu/notialarm/data/local/AppPreference;"
private const val PREMIUM_KEY = "is_premium_user"

class NotialarmSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun com.android.tools.smali.dexlib2.iface.Method.hasString(value: String) = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    }

    @Test
    fun `license check is skipped and premium is unlocked`() {
        val root = repoRoot()
        val apk = File(root, "apks/notialarm/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.3.31",
            patchNames = setOf("Disable license check", "Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        val diagnostics = "emitted classes=${classes.size}"

        // 1. PairIP license check: no VM shield, so checkLicense returns at once.
        val licenseClient = byType[LICENSE_CLIENT] ?: error("$LICENSE_CLIENT not found in emitted dexes")
        assertReturnsEarlyVoid(
            licenseClient.method("checkLicense", listOf("Landroid/content/Context;")),
            label = "LicenseClient.checkLicense(Context)",
            diagnostics = diagnostics,
        )

        // 2. Premium: the local SharedPreferences getter answers true. The stock method reads the
        // "is_premium_user" key with a false default; the patched one returns true before it.
        val appPreference = byType[APP_PREFERENCE] ?: error("$APP_PREFERENCE not found in emitted dexes")
        val premium = appPreference.method("isPremiumUser", emptyList())
        assertForcedBoolean(premium, true, "AppPreference.isPremiumUser()", diagnostics)

        val stock = patchedApkClasses(apk).first { it.type == APP_PREFERENCE }
            .method("isPremiumUser", emptyList())
        assertTrue(
            stock.hasString(PREMIUM_KEY),
            "the stock AppPreference.isPremiumUser() does not read \"$PREMIUM_KEY\"",
        )
    }
}
