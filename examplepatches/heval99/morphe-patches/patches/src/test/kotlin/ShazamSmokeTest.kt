import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.shazam.android"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

class ShazamSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun loadClasses(): List<ClassDef> {
        val root = repoRoot()
        val apk = File(root, "apks/shazam/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        return applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "16.62.0",
            patchNames = setOf("Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
    }

    @Test
    fun `Disable telemetry neuters Firebase Analytics and Crashlytics`() {
        val classes = loadClasses()
        val byType = classes.associateBy { it.type }

        // Firebase Analytics event logging.
        val analytics = byType[FIREBASE_ANALYTICS]
            ?: error("$FIREBASE_ANALYTICS not found in emitted dexes")
        val logEvent = analytics.method("logEvent", listOf("Ljava/lang/String;", "Landroid/os/Bundle;"))
        assertReturnsEarlyVoid(logEvent, label = "FirebaseAnalytics.logEvent()")

        // Crashlytics collection flag forced off.
        val crashlytics = byType[CRASHLYTICS]
            ?: error("$CRASHLYTICS not found in emitted dexes")
        assertForcedBoolean(
            crashlytics.method("isCrashlyticsCollectionEnabled", emptyList()),
            expected = false,
            label = "FirebaseCrashlytics.isCrashlyticsCollectionEnabled()",
        )

        // Every concrete recordException/log overload neutered.
        val reporting = crashlytics.methods.filter { method ->
            method.implementation != null &&
                (method.name == "recordException" || method.name == "log")
        }
        check(reporting.isNotEmpty()) { "no recordException/log methods found on $CRASHLYTICS" }
        for (method in reporting) {
            val first = method.instructions().firstOrNull()
            check(first?.opcode == Opcode.RETURN_VOID) {
                "${crashlytics.type}.${method.name} not neutered; first instruction is ${first?.opcode}"
            }
        }
    }
}
