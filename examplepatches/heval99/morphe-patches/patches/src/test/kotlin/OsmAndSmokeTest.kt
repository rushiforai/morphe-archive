import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "net.osmand"
private const val HELPER = "Lnet/osmand/plus/inapp/InAppPurchaseHelper;"
private const val HELPER_IMPL = "Lnet/osmand/plus/inapp/InAppPurchaseHelperImpl;"

class OsmAndSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Enable Premium patch forces the local entitlement gates`() {
        val root = repoRoot()
        val apk = File(root, "apks/osmand/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "5.4.5",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        assertForcedBoolean(
            klass(HELPER).method("isPurchased", listOf("Ljava/lang/String;")),
            expected = true, label = "InAppPurchaseHelper.isPurchased(String)",
        )

        val gates = klass(HELPER_IMPL)
        for (name in listOf(
            "isPurchasedLocalFullVersion",
            "isPurchasedLocalDeepContours",
            "isSubscribedToLocalLiveUpdates",
            "isSubscribedToLocalMaps",
            "isSubscribedToLocalOsmAndPro",
        )) {
            assertForcedBoolean(gates.method(name), expected = true, label = "InAppPurchaseHelperImpl.$name()")
        }
    }
}
