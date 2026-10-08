import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "ru.iptvremote.android.iptv"
private const val RESET_PIN_KEY = "access_control_reset_parental_control_pin_code"

class IptvSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.referencesString(value: String) = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    }

    private fun Method.signature() =
        Triple(name, parameterTypes.map(CharSequence::toString), returnType)

    @Test
    fun `ads switch to the no-ads provider and access control is unlocked`() {
        val root = repoRoot()
        val apk = File(root, "apks/iptv/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "9.1.25",
            patchNames = setOf("Enable Premium", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }

        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes")

        // Review-prompt cooldown check (the only no-arg boolean on the free app class).
        val freeApp = klass("Lru/iptvremote/android/iptv/IptvFreeApplication;")
        val reviewGate = freeApp.methods.firstOrNull {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        } ?: error("no no-arg boolean method on IptvFreeApplication")
        assertForcedBoolean(reviewGate, expected = true, label = "IptvFreeApplication.${reviewGate.name}()")

        // Ad provider: located the same way the patch does (instream lead-time getter).
        val provider: ClassDef = classes.firstOrNull { cls ->
            cls.methods.any {
                it.returnType == "J" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                    it.referencesString("instream_preload_lead_sec")
            }
        } ?: error("ad provider not found")
        val base = klass(provider.superclass!!)
        val noAds = classes.single { it.superclass == base.type && it.type != provider.type }

        val baseSignatures = base.methods
            .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.name != "<init>" }
            .map { it.signature() }
            .toSet()
        val overrides = provider.methods.filter {
            it.implementation != null &&
                (it.returnType.startsWith("L") || it.returnType == "Z") &&
                it.signature() in baseSignatures
        }
        // Placements, activity helper, interstitials, instream page/mode/devices, waterfall.
        assertTrue(overrides.size >= 6, "expected >= 6 provider overrides, found ${overrides.map { it.name }}")

        for (method in overrides) {
            val insns = method.instructions()
            val label = "${provider.type}.${method.name}"
            val newInstance = (insns.getOrNull(0) as? ReferenceInstruction)?.reference as? TypeReference
            assertTrue(
                insns.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE && newInstance?.type == noAds.type,
                "$label does not instantiate ${noAds.type}; first instruction is ${insns.getOrNull(0)?.opcode}"
            )
            val call = (insns.getOrNull(2) as? ReferenceInstruction)?.reference as? MethodReference
            assertTrue(
                insns.getOrNull(2)?.opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
                    call?.definingClass == noAds.type && call.name == method.name,
                "$label does not delegate to ${noAds.type}.${method.name}; got $call"
            )
            assertTrue(
                insns.getOrNull(4)?.opcode in setOf(Opcode.RETURN_OBJECT, Opcode.RETURN),
                "$label does not return the delegated result; got ${insns.getOrNull(4)?.opcode}"
            )
        }

        // Wortise SDK never initializes (every concrete overload).
        val wortiseInit = klass("Lcom/wortise/ads/WortiseSdk;").methods
            .filter { it.name == "initialize" && it.implementation != null }
        assertTrue(wortiseInit.isNotEmpty(), "no WortiseSdk.initialize found")
        wortiseInit.forEach { assertReturnsEarlyVoid(it, label = "WortiseSdk.initialize${it.parameterTypes}") }

        // Access control screen: the Pro stubs are swapped for the real preference classes.
        val screen = workDir.walkTopDown()
            .firstOrNull { it.isFile && it.extension == "xml" && it.readText().contains(RESET_PIN_KEY) }
            ?: error("decoded access control preference XML not found under $workDir")
        val xml = screen.readText()
        assertTrue(!xml.contains("ProPreferenceStub") && !xml.contains("ProCheckBoxPreferenceStub"),
            "${screen.name} still contains Pro stubs:\n$xml")
        assertTrue(xml.contains("ResetAccessControlPreference"),
            "${screen.name} does not use ResetAccessControlPreference:\n$xml")
        assertTrue(xml.contains("<CheckBoxPreference"),
            "${screen.name} has no real CheckBoxPreference:\n$xml")

        // The Playlists entry carries the key the "Lock playlist settings" locker looks up.
        val settings = workDir.walkTopDown()
            .firstOrNull {
                it.isFile && it.extension == "xml" &&
                    it.readText().let { text -> text.contains("ru.iptvremote.android.iptv.PlaylistsActivity") && text.contains("screen_access_control") }
            } ?: error("decoded main settings XML not found under $workDir")
        val playlistsEntry = Regex("<PreferenceScreen[^>]*>\\s*<intent[^>]*PlaylistsActivity", RegexOption.DOT_MATCHES_ALL)
            .find(settings.readText())?.value ?: error("Playlists entry not found in ${settings.name}")
        assertTrue(playlistsEntry.contains("android:key=\"screen_playlists\""),
            "Playlists settings entry has no screen_playlists key:\n$playlistsEntry")
    }
}
