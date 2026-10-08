import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.ztnstudio.notepad"

class ZtnNotepadSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `premium getters are forced and Calldorado never starts`() {
        val root = repoRoot()
        val apk = File(root, "apks/ztnnotepad/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "5.4.3.19019",
            patchNames = setOf("Enable Premium", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun klass(type: String) = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        val premiumData = klass("Lcom/ztnstudio/notepad/buy_ad_free/billing/model/UserPremiumData;")
        val premiumGetter = premiumData.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        assertForcedBoolean(premiumGetter, expected = true, label = "UserPremiumData.${premiumGetter.name}()")

        // The forced body no longer holds the pref key, so find the getter by shape only.
        val adFree = klass("Lcom/ztnstudio/notepad/buy_ad_free/BuyAdFreePreferenceHelper;")
        val adFreeGetter = adFree.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        assertForcedBoolean(adFreeGetter, expected = true, label = "BuyAdFreePreferenceHelper.${adFreeGetter.name}()")

        val calldorado = klass("Lcom/calldorado/Calldorado;").methods.filter {
            it.implementation != null && it.returnType == "V" &&
                (it.name == "start" || it.name == "startInAppAdManager")
        }
        assertTrue(calldorado.count { it.name == "start" } >= 3, "expected the Calldorado.start overloads")
        assertTrue(calldorado.any { it.name == "startInAppAdManager" }, "expected Calldorado.startInAppAdManager")
        calldorado.forEach { assertReturnsEarlyVoid(it, label = "Calldorado.${it.name}${it.parameterTypes}") }
    }
}
