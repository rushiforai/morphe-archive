package app.template.patches.steamlink.androidxr

import app.template.patches.steamlink.binary.VideoOutputPrecision
import app.template.patches.steamlink.binary.patchNativeMicrophonePreset
import app.template.patches.steamlink.binary.patchVisualDelay
import app.template.patches.steamlink.binary.setProjectionSwapchainFormat
import org.junit.Assume.assumeTrue
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * Exact-base 2.0.24/5002527 adaptation of the five controller patches and the native battery hook.
 *
 * Portable cases run on a fresh checkout. Real-base cases read the decoded base tree and skip
 * with a BLOCKED message when that exact input is absent; a skip is not compatibility proof.
 */
class Controller5002527AdaptationTest {
    private val version = "2.0.24"
    private val code = "5002527"

    private fun sha256(bytes: ByteArray) =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private fun repositoryRoot(): File? =
        generateSequence(File(System.getProperty("user.dir")).canonicalFile) { it.parentFile }
            .firstOrNull { File(it, "patches/src/main/kotlin").isDirectory }

    private fun decoded(base: String, relative: String): File? =
        repositoryRoot()?.let { File(it, "android-steamlinkvr-release-base-$base/$relative") }?.takeIf { it.isFile }

    private fun scene(base: String = "$version-$code") = decoded(base, "lib/arm64-v8a/libvrlink_scene.so")

    // ---- portable ----

    @Test
    fun `only the velocity frame patch is recommended, the other four stay opt-in`() {
        assertTrue(controllerVelocityFramePatch.default)
        listOf(
            controllerPoseExtrapolationPatch, controllerPoseTimePatch,
            controllerHalPosePatch, controllerGripHapticsPatch,
        ).forEach { assertFalse(it.default, it.name) }
    }

    @Test
    fun `every controller patch lists 5002527 and keeps every older base`() {
        val older = setOf(
            "2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968,
            "2.0.22" to 5002244, "2.0.23" to 5002363, "2.0.24" to 5002395,
        )
        listOf(
            controllerVelocityFramePatch, controllerPoseExtrapolationPatch, controllerPoseTimePatch,
            controllerHalPosePatch, controllerGripHapticsPatch,
        ).forEach { patch ->
            val pairs = patch.compatibility.orEmpty().flatMap { it.targets }
                .flatMap { t -> t.versionCodes.orEmpty().values.map { t.version.orEmpty() to it } }.toSet()
            assertEquals(older + (version to 5002527), pairs, patch.name)
        }
    }

    @Test
    fun `pose time regions of 5002527 are distinct, ordered inside the text segment and conflict guards stay`() {
        val scene = assertNotNull(controllerPoseTimeScene(version, code))
        val regions = listOf(scene.state, scene.send, scene.clock).sortedBy { it.offset }
        regions.zipWithNext().forEach { (a, b) -> assertTrue(a.offset + a.length <= b.offset, "$a overlaps $b") }
        assertEquals(listOf("controller_hal_pose", "controller_extrapolation"), controllerPoseTimeConflicts)
        // Different bytes than 5002395: the regions must not be a transplant.
        val old = assertNotNull(controllerPoseTimeScene("2.0.24", "5002395"))
        assertFalse(scene.state.sha256 == old.state.sha256)
        assertFalse(scene.send.sha256 == old.send.sha256)
        assertFalse(scene.clock.sha256 == old.clock.sha256)
    }

    @Test
    fun `battery hook scope is exact, keeps old bases and is inert on other packages`() {
        assertEquals(
            setOf("2.0.23" to "5002363", "2.0.24" to "5002395", "2.0.24" to "5002527"),
            NATIVE_BATTERY_SETTINGS_BUILDS,
        )
        listOf("2.0.23" to "5002363", "2.0.24" to "5002395", "2.0.24" to "5002527").forEach { (v, c) ->
            assertTrue(isNativeBatterySettingsBuild(v, c), "$v/$c")
            assertTrue(isUnrestrictedBatteryTarget(CONTROLLER_STEAM_LINK_PACKAGE, v, c), "$v/$c")
        }
        listOf("2.0.20" to "5001712", "2.0.20" to "5001812", "2.0.21" to "5001968", "2.0.22" to "5002244")
            .forEach { (v, c) ->
                assertFalse(isNativeBatterySettingsBuild(v, c), "$v/$c")
                // Legacy bases still get the manifest permission through the legacy automatic path.
                assertTrue(isUnrestrictedBatteryTarget(CONTROLLER_STEAM_LINK_PACKAGE, v, c), "$v/$c")
            }
        listOf("2.0.24" to "5002526", "2.0.24" to "5002528", "2.0.23" to "5002527", "2.0.25" to "5002527")
            .forEach { (v, c) ->
                assertFalse(isNativeBatterySettingsBuild(v, c), "$v/$c")
                assertFalse(isUnrestrictedBatteryTarget(CONTROLLER_STEAM_LINK_PACKAGE, v, c), "$v/$c")
            }
        listOf("cn.vr4p.oculus4xvrplayerov", "com.example.other", "").forEach { packageName ->
            assertFalse(isUnrestrictedBatteryTarget(packageName, version, code), packageName)
            assertFalse(isUnrestrictedBatteryTarget(packageName, "2.0.20", "5001712"), packageName)
        }
    }

    // ---- real decoded base ----

    @Test
    fun `5002527 real scene carries the pinned pose time code and the hooked function slots`() {
        val file = scene()
        assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", file != null)
        val bytes = file!!.readBytes()
        assertEquals(2_333_472, bytes.size)
        assertEquals("cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03", sha256(bytes))
        val before = bytes.copyOf()

        val sceneProfile = controllerPoseTimeScene(version, code)!!
        validateControllerPoseTimeScene(sceneProfile, bytes)
        validateControllerPoseTimeScene(sceneProfile, bytes) // reapplication is a pure read
        assertTrue(before.contentEquals(bytes))

        val elf = Elf(bytes)
        // The executable segment starts at file offset 0, so a function's address is its file offset.
        val text = elf.loads.first()
        assertEquals(0L, text.offset); assertEquals(0L, text.vaddr)
        assertTrue((text.flags and 1L) != 0L, "first PT_LOAD must be executable")
        listOf(sceneProfile.state, sceneProfile.send, sceneProfile.clock).forEach {
            assertTrue(it.offset + it.length <= text.filesz, "$it outside text")
        }
        // JUMP_SLOTs the layer rewrites resolve to GetControllerState and SubmitMessage.
        val state = elf.jumpSlot(0x239b78L)
        assertEquals("_ZN11QSVLXRInput18GetControllerStateER19QSVLControllerStatei", state.first)
        assertEquals(sceneProfile.state.offset.toLong(), state.second)
        val submit = elf.jumpSlot(0x239588L)
        assertEquals("_ZN11SVLDataLink13SubmitMessageEP7datasetbb", submit.first)
        assertEquals(0x163d8cL, submit.second)
        // The regions sit on exported symbols of the same sizes.
        assertEquals(0xa9cL, elf.symbolSize("_ZN11QSVLXRInput18GetControllerStateER19QSVLControllerStatei"))
        assertEquals(0x550L, elf.symbolSize("_ZN10QSVLClient9SendPosesEii"))
        assertEquals(sceneProfile.send.offset.toLong(), elf.symbolValue("_ZN10QSVLClient9SendPosesEii"))
        assertEquals(sceneProfile.clock.offset.toLong(), elf.symbolValue("GetCurrentTimeUS"))
    }

    @Test
    fun `5002527 real scene stays valid for pose time after the recommended native patches`() {
        val file = scene()
        assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", file != null)
        val stock = file!!.readBytes()
        val profile = controllerPoseTimeScene(version, code)!!
        val outputs = listOf(
            patchVisualDelay(stock, 60, version, code),
            patchNativeMicrophonePreset(stock, "voice-recognition", version, code),
            setProjectionSwapchainFormat(stock, VideoOutputPrecision.RGB10_A2_EXPERIMENTAL, version, code),
        )
        outputs.forEachIndexed { index, patched ->
            assertFalse(patched.contentEquals(stock), "patch $index changed nothing")
            validateControllerPoseTimeScene(profile, patched)
        }
        // All of them together on one library.
        validateControllerPoseTimeScene(
            profile,
            setProjectionSwapchainFormat(
                patchNativeMicrophonePreset(
                    patchVisualDelay(stock, 60, version, code), "voice-recognition", version, code,
                ),
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL, version, code,
            ),
        )
    }

    @Test
    fun `5002527 SteamLink onCreate has the exact shape the battery hook needs and equals 5002395`() {
        val new = decoded("$version-$code", "smali/com/valvesoftware/steamlink/SteamLink.smali")
        val old = decoded("2.0.24-5002395", "smali/com/valvesoftware/steamlink/SteamLink.smali")
        assumeTrue("BLOCKED: decoded 2.0.24/5002527 SteamLink.smali is absent", new != null)
        val body = onCreate(new!!.readText())

        // Same exact method as the already supported 5002395 when that tree is present.
        old?.let { assertEquals(onCreate(it.readText()), body) }

        val lines = body.lines().map { it.trim() }.filter { it.isNotEmpty() && !it.startsWith(".line") }
        assertEquals(".locals 2", lines[0])
        // Hook goes right after the super call: p0 and the saved-state Bundle p1 are still intact.
        assertEquals(
            "invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->onCreate(Landroid/os/Bundle;)V", lines[1],
        )
        assertTrue(lines[2].startsWith("const/4 p1"), "p1 is overwritten right after the hook point")
        // No exception table, and no label or branch target before the insertion point.
        assertFalse(body.contains(".catch"))
        assertFalse(body.contains(".catchall"))
        assertFalse(body.contains(":try_start"))
        assertTrue(body.lines().takeWhile { !it.trim().startsWith("invoke-super") }.none { it.trim().startsWith(":") })
        // Registers: .locals 2 + p0,p1 = v2,v3 are consecutive, matching invoke-static/range {p0..p1}
        // (registerCount - 2, count 2).
        assertFalse(body.contains("GxrBatterySettings"))
    }

    private fun onCreate(smali: String): String =
        smali.substringAfter(".method protected onCreate(Landroid/os/Bundle;)V").substringBefore(".end method")

    // ---- minimal ELF64 reader (independent of the production helpers) ----

    private class Load(val flags: Long, val offset: Long, val vaddr: Long, val filesz: Long)

    private class Elf(private val b: ByteArray) {
        private val buf = ByteBuffer.wrap(b).order(ByteOrder.LITTLE_ENDIAN)
        private fun u16(o: Long) = buf.getShort(o.toInt()).toInt() and 0xffff
        private fun u32(o: Long) = buf.getInt(o.toInt()).toLong() and 0xffffffffL
        private fun u64(o: Long) = buf.getLong(o.toInt())

        val loads: List<Load>
        private val symbols = mutableMapOf<String, Pair<Long, Long>>() // name -> value,size
        private val slots = mutableMapOf<Long, Pair<String, Long>>()

        init {
            val phoff = u64(0x20); val phentsize = u16(0x36); val phnum = u16(0x38)
            loads = (0 until phnum).map { phoff + it.toLong() * phentsize }
                .filter { u32(it) == 1L }
                .map { Load(u32(it + 4), u64(it + 8), u64(it + 0x10), u64(it + 0x20)) }
            val shoff = u64(0x28); val shentsize = u16(0x3a); val shnum = u16(0x3c)
            val sections = (0 until shnum).map { shoff + it.toLong() * shentsize }
            fun type(s: Long) = u32(s + 4)
            fun offset(s: Long) = u64(s + 0x18)
            fun size(s: Long) = u64(s + 0x20)
            fun link(s: Long) = u32(s + 0x28)
            val dynsym = sections.single { type(it) == 11L }
            val dynstr = sections[link(dynsym).toInt()]
            fun name(index: Long): String {
                var p = (offset(dynstr) + index).toInt()
                val sb = StringBuilder()
                while (b[p] != 0.toByte()) {
                    sb.append(b[p].toInt().toChar())
                    p += 1
                }
                return sb.toString()
            }
            val symTable = mutableListOf<Triple<String, Long, Long>>()
            for (i in 0 until size(dynsym) / 24) {
                val e = offset(dynsym) + i * 24
                symTable += Triple(name(u32(e)), u64(e + 8), u64(e + 16))
            }
            symTable.forEach { (n, v, s) -> if (n.isNotEmpty() && v != 0L) symbols[n] = v to s }
            sections.filter { type(it) == 4L }.forEach { rela ->
                for (i in 0 until size(rela) / 24) {
                    val e = offset(rela) + i * 24
                    val info = u64(e + 8)
                    if ((info and 0xffffffffL) == 1026L) { // R_AARCH64_JUMP_SLOT
                        val sym = symTable[(info ushr 32).toInt()]
                        slots[u64(e)] = sym.first to sym.second
                    }
                }
            }
        }

        fun jumpSlot(got: Long): Pair<String, Long> = requireNotNull(slots[got]) { "no JUMP_SLOT at 0x${got.toString(16)}" }
        fun symbolValue(name: String): Long = requireNotNull(symbols[name]) { name }.first
        fun symbolSize(name: String): Long = requireNotNull(symbols[name]) { name }.second
    }
}
