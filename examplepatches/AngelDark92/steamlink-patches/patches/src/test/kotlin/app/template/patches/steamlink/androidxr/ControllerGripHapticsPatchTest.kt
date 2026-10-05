package app.template.patches.steamlink.androidxr

import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ControllerGripHapticsPatchTest {
    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private fun manifest(packageName: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            """
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$packageName">
                <uses-permission android:name="android.permission.INTERNET"/>
                <application android:label="Steam Link"/>
            </manifest>
            """.trimIndent().byteInputStream(),
        )

    private fun Document.elements(tag: String): List<Element> =
        getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

    @Test
    fun `bundled layer is the build from the extension source`() {
        val library = controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_LIBRARY")

        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), library.copyOfRange(0, 4))
        // extensions/controller-grip-haptics, NDK 28.2.13676358, arm64-v8a, Release.
        assertEquals("93d3700bda20d5bd90d664ff1c10dda18fcca7ede4911d4000415f468e5af0cb", sha256(library))
        val text = String(library, Charsets.ISO_8859_1)
        assertTrue("xrNegotiateLoaderApiLayerInterface" in text)
        // Called by the provider in the extension, and the interface of its user service.
        assertTrue("Java_gxr_haptic_HapticProvider_nativeSetBinder" in text)
        assertTrue("gxr.haptic.IHapticService" in text)
        assertTrue("debug.gxr.haptic" in text)
        assertTrue("debug.gxr.haptic.min" in text)
        assertTrue("debug.gxr.haptic.pcm" in text)
        assertTrue("debug.gxr.haptic.chunkms" in text)
        assertTrue("debug.gxr.haptic.gamma" in text)
        assertTrue("debug.gxr.haptic.max" in text)
        assertTrue("debug.gxr.haptic.freq" in text)
        assertTrue("debug.gxr.haptic.minms" in text)
        assertTrue("debug.gxr.haptic.streamms" in text)
    }

    @Test
    fun `manifest names the bundled library and its layer`() {
        val manifest = String(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_MANIFEST"),
        )
        val library = String(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_LIBRARY"),
            Charsets.ISO_8859_1,
        )

        assertTrue("\"library_path\": \"$CONTROLLER_GRIP_HAPTICS_LIBRARY\"" in manifest)
        assertTrue("\"name\": \"XR_APILAYER_local_GalaxyXR_haptic_main\"" in manifest)
        assertTrue("\"disable_environment\": \"GXR_DISABLE_HAPTIC_MAIN\"" in manifest)
        // The layer rejects negotiation under any other name.
        assertTrue("XR_APILAYER_local_GalaxyXR_haptic_main" in library)
    }

    @Test
    fun `extension adds only the haptic classes and the Shizuku API`() {
        val extension = controllerGripHapticsResource(CONTROLLER_GRIP_HAPTICS_EXTENSION)
        // extensions/controller-grip-haptics/java with dev.rikka.shizuku 13.1.5, d8 --min-api 29.
        assertEquals("012aa86ede864d12d33236f520b32343ad71431da6e7a43555253f490276c5de", sha256(extension))

        val types = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), extension.inputStream().buffered())
            .classes
            .map { it.type }
        assertTrue("Lgxr/haptic/HapticProvider;" in types)
        assertTrue("Lgxr/haptic/HapticService;" in types)
        assertTrue("Lrikka/shizuku/Shizuku;" in types)
        assertTrue("Lrikka/shizuku/ShizukuProvider;" in types)
        assertTrue(types.all {
            it.startsWith("Lgxr/haptic/") || it.startsWith("Lrikka/") || it.startsWith("Lmoe/shizuku/")
        })
    }

    @Test
    fun `manifest entries follow the package and are added once`() {
        val document = manifest("com.valvesoftware.steamlinkvr.gxr")

        addControllerGripHapticsManifestEntries(document)
        addControllerGripHapticsManifestEntries(document)

        val provider = document.elements("provider").single()
        assertEquals(CONTROLLER_GRIP_HAPTICS_PROVIDER, provider.getAttribute("android:name"))
        assertEquals("com.valvesoftware.steamlinkvr.gxr.shizuku", provider.getAttribute("android:authorities"))
        assertEquals("true", provider.getAttribute("android:exported"))
        assertEquals(
            "android.permission.INTERACT_ACROSS_USERS_FULL",
            provider.getAttribute("android:permission"),
        )
        assertEquals("application", provider.parentNode.nodeName)

        assertEquals(
            listOf("android.permission.INTERNET", "moe.shizuku.manager.permission.API_V23"),
            document.elements("uses-permission").map { it.getAttribute("android:name") },
        )
        assertEquals(
            listOf("moe.shizuku.privileged.api"),
            document.elements("package").map { it.getAttribute("android:name") },
        )
        val support = document.elements("meta-data").single()
        assertEquals("moe.shizuku.client.V3_SUPPORT", support.getAttribute("android:name"))
        assertEquals("true", support.getAttribute("android:value"))
    }

    @Test
    fun `layer does not share files with the other controller layers`() {
        assertFalse(CONTROLLER_GRIP_HAPTICS_LIBRARY == CONTROLLER_EXTRAPOLATION_LIBRARY)
        assertFalse(CONTROLLER_GRIP_HAPTICS_MANIFEST == CONTROLLER_EXTRAPOLATION_MANIFEST)
        assertFalse(CONTROLLER_GRIP_HAPTICS_LIBRARY == CONTROLLER_VELOCITY_FRAME_LIBRARY)
        assertFalse(CONTROLLER_GRIP_HAPTICS_MANIFEST == CONTROLLER_VELOCITY_FRAME_MANIFEST)
    }

    @Test
    fun `patch is opt-in and covers the legacy and native bases`() {
        assertFalse(controllerGripHapticsPatch.default)
        assertEquals("Controller grip haptics through Shizuku (experimental)", controllerGripHapticsPatch.name)

        val compatibilities = controllerGripHapticsPatch.compatibility.orEmpty()
        assertTrue(compatibilities.all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        assertEquals(
            setOf(5001712, 5001812, 5001968, 5002244, 5002363),
            compatibilities.flatMap { it.targets }.flatMap { it.versionCodes!!.values }.toSet(),
        )

        listOf("2.0.20" to "5001712", "2.0.20" to "5001812", "2.0.21" to "5001968", "2.0.22" to "5002244",
            "2.0.23" to "5002363")
            .forEach { (version, versionCode) ->
                assertTrue(isControllerGripHapticsBuild(version, versionCode), "$version/$versionCode")
            }
        listOf("2.0.23" to "5002364", "2.0.19" to "5001712", "2.0.24" to "5002363")
            .forEach { (version, versionCode) ->
                assertFalse(isControllerGripHapticsBuild(version, versionCode), "$version/$versionCode")
            }
    }
}
