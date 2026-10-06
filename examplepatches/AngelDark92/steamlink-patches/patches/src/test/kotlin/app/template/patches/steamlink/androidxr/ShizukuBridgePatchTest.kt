package app.template.patches.steamlink.androidxr

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.security.MessageDigest
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ShizukuBridgePatchTest {
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
    fun `extension adds only the bridge and the Shizuku API`() {
        val extension = shizukuBridgeResource(SHIZUKU_BRIDGE_EXTENSION)
        // extensions/shizuku-bridge/java with dev.rikka.shizuku 13.1.5, d8 --min-api 29.
        assertEquals("f03710766c1967df7297b1b64c99f6b6b7e394282b3022546b320c35b20902d5", sha256(extension))

        val types = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), extension.inputStream().buffered())
            .classes
            .map { it.type }
        assertTrue("Lgxr/shizuku/ShizukuBridge;" in types)
        assertTrue("Lrikka/shizuku/Shizuku;" in types)
        assertTrue("Lrikka/shizuku/ShizukuProvider;" in types)
        assertTrue(types.all {
            it.startsWith("Lgxr/shizuku/") || it.startsWith("Lrikka/") || it.startsWith("Lmoe/shizuku/")
        })
    }

    @Test
    fun `bridge names the feature classes the other extensions bring`() {
        val bridge = String(shizukuBridgeResource(SHIZUKU_BRIDGE_EXTENSION), Charsets.ISO_8859_1)
        val features = mapOf(
            CONTROLLER_GRIP_HAPTICS_EXTENSION to listOf("gxr.haptic.HapticService", "gxr.haptic.HapticBridge"),
            CONTROLLER_HAL_POSE_EXTENSION to listOf("gxr.pose.PoseService", "gxr.pose.PoseBridge"),
        )

        features.forEach { (extension, classes) ->
            val types = DexBackedDexFile
                .fromInputStream(Opcodes.getDefault(), shizukuBridgeResource(extension).inputStream().buffered())
                .classes
                .map { it.type }
            classes.forEach { name ->
                assertTrue(name in bridge, name)
                assertTrue("L${name.replace('.', '/')};" in types, name)
            }
        }
    }

    @Test
    fun `manifest entries follow the package and are added once`() {
        val document = manifest("com.valvesoftware.steamlinkvr.gxr")

        addShizukuBridgeManifestEntries(document)
        addShizukuBridgeManifestEntries(document)

        val provider = document.elements("provider").single()
        assertEquals(SHIZUKU_BRIDGE_PROVIDER, provider.getAttribute("android:name"))
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
    fun `bridge covers the legacy and native bases`() {
        listOf("2.0.20" to "5001712", "2.0.20" to "5001812", "2.0.21" to "5001968", "2.0.22" to "5002244",
            "2.0.23" to "5002363")
            .forEach { (version, versionCode) ->
                assertTrue(isShizukuBridgeBuild(version, versionCode), "$version/$versionCode")
            }
        listOf("2.0.23" to "5002364", "2.0.19" to "5001712", "2.0.24" to "5002363")
            .forEach { (version, versionCode) ->
                assertFalse(isShizukuBridgeBuild(version, versionCode), "$version/$versionCode")
            }
    }
}
