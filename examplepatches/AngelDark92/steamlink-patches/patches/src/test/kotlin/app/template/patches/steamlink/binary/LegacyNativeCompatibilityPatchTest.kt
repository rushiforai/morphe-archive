package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith

class LegacyNativeCompatibilityPatchTest {
    private data class VerifiedLayout(
        val versionName: String,
        val versionCode: String,
        val size: Int,
        val face: Int,
        val eye: Int,
        val hmd: List<Pair<Int, ByteArray>>,
        val lobby: Pair<Int, ByteArray>,
        val stream: List<Pair<Int, ByteArray>>,
    )

    private val faceOriginal =
        "com.oculus.permission.FACE_TRACKING\u0000".toByteArray(Charsets.US_ASCII)
    private val facePatched =
        "android.permission.HAND_TRACKING\u0000\u0000\u0000\u0000".toByteArray(Charsets.US_ASCII)
    private val eyeOriginal =
        "com.oculus.permission.EYE_TRACKING\u0000}\u0000".toByteArray(Charsets.US_ASCII)
    private val eyePatched =
        "android.permission.EYE_TRACKING_FINE\u0000".toByteArray(Charsets.US_ASCII)

    private val layouts = listOf(
        VerifiedLayout(
            "2.0.20",
            "5001712",
            2_221_072,
            0x99924,
            0xA1A7F,
            listOf(0xFFE20 to hex("e0000036"), 0xFFE28 to hex("a8000034")),
            0x10DB10 to hex("14040036"),
            listOf(
                0x116564 to hex("68000035"),
                0x11656C to hex("68050034"),
                0x116620 to hex("a8050034"),
            ),
        ),
        VerifiedLayout(
            "2.0.20",
            "5001740",
            2_220_528,
            0x9987A,
            0xA19DD,
            listOf(0xFFCB0 to hex("e0000036"), 0xFFCB8 to hex("a8000034")),
            0x10D9A0 to hex("14040036"),
            listOf(
                0x1163F4 to hex("68000035"),
                0x1163FC to hex("68050034"),
                0x1164B0 to hex("a8050034"),
            ),
        ),
        VerifiedLayout(
            "2.0.22",
            "5002244",
            2_251_920,
            0x93952,
            0x9C10E,
            listOf(0xFD040 to hex("e0000036"), 0xFD048 to hex("a8000034")),
            0x10B658 to hex("14040036"),
            listOf(
                0x1140AC to hex("68000035"),
                0x1140B4 to hex("68050034"),
                0x114168 to hex("a8050034"),
            ),
        ),
        VerifiedLayout(
            "2.0.22",
            "5002313",
            2_276_872,
            0x94B4F,
            0x9D861,
            listOf(0xFF010 to hex("20010036"), 0xFF018 to hex("e8000034")),
            0x10E6C0 to hex("14040036"),
            emptyList(),
        ),
    )

    @Test
    fun `permission names relocate on an unknown native layout`() {
        val input = byteArrayOf(1, 2, 3) + faceOriginal + byteArrayOf(4, 5) + eyeOriginal + byteArrayOf(6)
        val expected = byteArrayOf(1, 2, 3) + facePatched + byteArrayOf(4, 5) + eyePatched + byteArrayOf(6)

        val patched = patchNativePermissionNames(input, "2.0.22", "5002206")

        assertContentEquals(expected, patched)
        assertContentEquals(expected, patchNativePermissionNames(patched, "2.0.22", "5002206"))
    }

    @Test
    fun `unknown layout without permission patterns is left untouched`() {
        val input = ByteArray(128) { it.toByte() }

        assertContentEquals(input, patchNativePermissionNames(input, "2.0.22", "5002206"))
    }

    @Test
    fun `unknown layout with only one permission pattern is left untouched atomically`() {
        val input = byteArrayOf(1, 2, 3) + faceOriginal + byteArrayOf(4, 5, 6)

        assertContentEquals(input, patchNativePermissionNames(input, "2.0.22", "5002206"))
    }

    @Test
    fun `known layout without permission patterns remains strict`() {
        layouts.forEach { layout ->
            assertFailsWith<PatchException> {
                patchNativePermissionNames(ByteArray(layout.size), layout.versionName, layout.versionCode)
            }
        }
    }

    @Test
    fun `native permission fallback names remain untouched`() {
        listOf("5002318" to 2_277_488, "5002322" to 2_283_400).forEach { (versionCode, size) ->
            val input = ByteArray(size).apply {
                faceOriginal.copyInto(this, 0x94AB5)
                eyeOriginal.copyInto(this, 0x9D7C7)
            }
            assertContentEquals(
                input,
                patchNativePermissionNames(input, "2.0.22", versionCode),
                versionCode,
            )
        }
    }

    @Test
    fun `permission targets support all verified layouts`() {
        layouts.forEach { layout ->
            val input = ByteArray(layout.size).apply {
                faceOriginal.copyInto(this, layout.face)
                eyeOriginal.copyInto(this, layout.eye)
            }

            val patched = patchNativePermissionNames(input, layout.versionName, layout.versionCode)

            assertContentEquals(facePatched, patched.copyOfRange(layout.face, layout.face + facePatched.size))
            assertContentEquals(eyePatched, patched.copyOfRange(layout.eye, layout.eye + eyePatched.size))
            assertContentEquals(
                patched,
                patchNativePermissionNames(patched, layout.versionName, layout.versionCode),
            )
        }
    }

    @Test
    fun `5002313 permission targets tolerate stock eye replacement collision`() {
        val faceTarget = 0x94B4F
        val eyeTarget = 0x9D861
        val stockEyeReplacement = 0x9CCC6
        val input = ByteArray(2_276_872).apply {
            faceOriginal.copyInto(this, faceTarget)
            eyeOriginal.copyInto(this, eyeTarget)
            eyePatched.copyInto(this, stockEyeReplacement)
        }

        val patched = patchNativePermissionNames(input, "2.0.22", "5002313")

        assertContentEquals(facePatched, patched.copyOfRange(faceTarget, faceTarget + facePatched.size))
        assertContentEquals(eyePatched, patched.copyOfRange(eyeTarget, eyeTarget + eyePatched.size))
        assertContentEquals(
            eyePatched,
            patched.copyOfRange(stockEyeReplacement, stockEyeReplacement + eyePatched.size),
        )
        assertContentEquals(patched, patchNativePermissionNames(patched, "2.0.22", "5002313"))
    }

    @Test
    fun `5002313 mixed permission target state completes remaining edit`() {
        val faceTarget = 0x94B4F
        val eyeTarget = 0x9D861
        val input = ByteArray(2_276_872).apply {
            facePatched.copyInto(this, faceTarget)
            eyeOriginal.copyInto(this, eyeTarget)
            eyePatched.copyInto(this, 0x9CCC6)
        }

        val patched = patchNativePermissionNames(input, "2.0.22", "5002313")

        assertContentEquals(facePatched, patched.copyOfRange(faceTarget, faceTarget + facePatched.size))
        assertContentEquals(eyePatched, patched.copyOfRange(eyeTarget, eyeTarget + eyePatched.size))
    }

    @Test
    fun `5002313 invalid permission target remains strict and atomic`() {
        val faceTarget = 0x94B4F
        val eyeTarget = 0x9D861
        val input = ByteArray(2_276_872).apply {
            faceOriginal.copyInto(this, faceTarget)
            eyeOriginal.copyInto(this, eyeTarget)
            this[eyeTarget] = 0x55
        }

        assertFailsWith<PatchException> {
            patchNativePermissionNames(input, "2.0.22", "5002313")
        }
        assertContentEquals(faceOriginal, input.copyOfRange(faceTarget, faceTarget + faceOriginal.size))
    }

    @Test
    fun `fixed HMD and lobby gates support all verified layouts`() {
        val nop = hex("1f2003d5")

        layouts.forEach { layout ->
            val input = ByteArray(layout.size).apply {
                layout.hmd.forEach { (offset, bytes) -> bytes.copyInto(this, offset) }
                layout.lobby.second.copyInto(this, layout.lobby.first)
            }
            val hmdPatched = patchHmdInitializationGates(input, layout.versionName, layout.versionCode)
            layout.hmd.forEach { (offset, _) ->
                assertContentEquals(nop, hmdPatched.copyOfRange(offset, offset + 4))
            }
            val lobbyPatched = patchLobbyPermissionStateGate(
                hmdPatched,
                layout.versionName,
                layout.versionCode,
            )
            assertContentEquals(
                nop,
                lobbyPatched.copyOfRange(layout.lobby.first, layout.lobby.first + 4),
            )
            assertContentEquals(
                lobbyPatched,
                patchHmdInitializationGates(lobbyPatched, layout.versionName, layout.versionCode),
            )
            assertContentEquals(
                lobbyPatched,
                patchLobbyPermissionStateGate(lobbyPatched, layout.versionName, layout.versionCode),
            )
        }
    }

    @Test
    fun `stream gates remain build-specific`() {
        layouts.forEach { layout ->
            val input = ByteArray(layout.size).apply {
                layout.stream.forEach { (offset, bytes) -> bytes.copyInto(this, offset) }
            }
            val patched = patchStreamXrGates(input, layout.versionName, layout.versionCode)
            layout.stream.forEach { (offset, _) ->
                assertContentEquals(hex("1f2003d5"), patched.copyOfRange(offset, offset + 4))
            }
            assertContentEquals(
                patched,
                patchStreamXrGates(patched, layout.versionName, layout.versionCode),
            )
        }
    }

    @Test
    fun `wrong exact pair sharing a known size is left untouched`() {
        val layout = layouts.first()
        val input = ByteArray(layout.size).apply {
            faceOriginal.copyInto(this, layout.face)
            eyeOriginal.copyInto(this, layout.eye)
            layout.hmd.forEach { (offset, bytes) -> bytes.copyInto(this, offset) }
            layout.lobby.second.copyInto(this, layout.lobby.first)
            layout.stream.forEach { (offset, bytes) -> bytes.copyInto(this, offset) }
        }

        assertContentEquals(input, patchNativePermissionNames(input, "2.0.22", layout.versionCode))
        assertContentEquals(input, patchHmdInitializationGates(input, "2.0.22", layout.versionCode))
        assertContentEquals(input, patchLobbyPermissionStateGate(input, "2.0.22", layout.versionCode))
        assertContentEquals(input, patchStreamXrGates(input, "2.0.22", layout.versionCode))
    }

    @Test
    fun `known exact pair rejects the wrong library size`() {
        val layout = layouts.first()
        val wrongSize = ByteArray(layout.size - 1)

        assertFailsWith<PatchException> {
            patchNativePermissionNames(wrongSize, layout.versionName, layout.versionCode)
        }
        assertFailsWith<PatchException> {
            patchHmdInitializationGates(wrongSize, layout.versionName, layout.versionCode)
        }
        assertFailsWith<PatchException> {
            patchLobbyPermissionStateGate(wrongSize, layout.versionName, layout.versionCode)
        }
        assertFailsWith<PatchException> {
            patchStreamXrGates(wrongSize, layout.versionName, layout.versionCode)
        }
    }

    private fun hex(value: String): ByteArray =
        value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}
