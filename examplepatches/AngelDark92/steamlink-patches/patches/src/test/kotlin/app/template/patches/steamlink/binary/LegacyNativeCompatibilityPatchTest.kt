package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith

class LegacyNativeCompatibilityPatchTest {
    private val faceOriginal =
        "com.oculus.permission.FACE_TRACKING\u0000".toByteArray(Charsets.US_ASCII)
    private val facePatched =
        "android.permission.HAND_TRACKING\u0000\u0000\u0000\u0000".toByteArray(Charsets.US_ASCII)
    private val eyeOriginal =
        "com.oculus.permission.EYE_TRACKING\u0000}\u0000".toByteArray(Charsets.US_ASCII)
    private val eyePatched =
        "android.permission.EYE_TRACKING_FINE\u0000".toByteArray(Charsets.US_ASCII)

    @Test
    fun `permission names relocate on an unknown native layout`() {
        val input = byteArrayOf(1, 2, 3) + faceOriginal + byteArrayOf(4, 5) + eyeOriginal + byteArrayOf(6)
        val expected = byteArrayOf(1, 2, 3) + facePatched + byteArrayOf(4, 5) + eyePatched + byteArrayOf(6)

        val patched = patchNativePermissionNames(input)

        assertContentEquals(expected, patched)
        assertContentEquals(expected, patchNativePermissionNames(patched))
    }

    @Test
    fun `unknown layout without permission patterns is left untouched`() {
        val input = ByteArray(128) { it.toByte() }

        assertContentEquals(input, patchNativePermissionNames(input))
    }

    @Test
    fun `unknown layout with only one permission pattern is left untouched atomically`() {
        val input = byteArrayOf(1, 2, 3) + faceOriginal + byteArrayOf(4, 5, 6)

        assertContentEquals(input, patchNativePermissionNames(input))
    }

    @Test
    fun `known layout without permission patterns remains strict`() {
        listOf(2_251_920, 2_276_872).forEach { size ->
            assertFailsWith<PatchException> {
                patchNativePermissionNames(ByteArray(size))
            }
        }
    }

    @Test
    fun `native permission fallback names remain untouched`() {
        listOf(2_277_488, 2_283_400).forEach { size ->
            val input = ByteArray(size).apply {
                faceOriginal.copyInto(this, 0x94AB5)
                eyeOriginal.copyInto(this, 0x9D7C7)
            }
            assertContentEquals(input, patchNativePermissionNames(input), size.toString())
        }
    }

    @Test
    fun `permission targets support both verified layouts`() {
        val layouts = listOf(
            Triple(2_251_920, 0x93952, 0x9C10E),
            Triple(2_276_872, 0x94B4F, 0x9D861),
        )

        layouts.forEach { (size, faceTarget, eyeTarget) ->
            val input = ByteArray(size).apply {
                faceOriginal.copyInto(this, faceTarget)
                eyeOriginal.copyInto(this, eyeTarget)
            }

            val patched = patchNativePermissionNames(input)

            assertContentEquals(facePatched, patched.copyOfRange(faceTarget, faceTarget + facePatched.size))
            assertContentEquals(eyePatched, patched.copyOfRange(eyeTarget, eyeTarget + eyePatched.size))
            assertContentEquals(patched, patchNativePermissionNames(patched))
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

        val patched = patchNativePermissionNames(input)

        assertContentEquals(facePatched, patched.copyOfRange(faceTarget, faceTarget + facePatched.size))
        assertContentEquals(eyePatched, patched.copyOfRange(eyeTarget, eyeTarget + eyePatched.size))
        assertContentEquals(
            eyePatched,
            patched.copyOfRange(stockEyeReplacement, stockEyeReplacement + eyePatched.size),
        )
        assertContentEquals(patched, patchNativePermissionNames(patched))
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

        val patched = patchNativePermissionNames(input)

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
            patchNativePermissionNames(input)
        }
        assertContentEquals(faceOriginal, input.copyOfRange(faceTarget, faceTarget + faceOriginal.size))
    }

    @Test
    fun `fixed HMD and lobby gates support both verified layouts`() {
        val layouts = listOf(
            FixedLayout(
                2_251_920,
                listOf(
                    0xFD040 to hex("e0000036"),
                    0xFD048 to hex("a8000034"),
                ),
                0x10B658 to hex("14040036"),
            ),
            FixedLayout(
                2_276_872,
                listOf(
                    0xFF010 to hex("20010036"),
                    0xFF018 to hex("e8000034"),
                ),
                0x10E6C0 to hex("14040036"),
            ),
        )
        val nop = hex("1f2003d5")

        layouts.forEach { layout ->
            val input = ByteArray(layout.size).apply {
                layout.hmd.forEach { (offset, bytes) -> bytes.copyInto(this, offset) }
                layout.lobby.second.copyInto(this, layout.lobby.first)
            }
            val hmdPatched = patchHmdInitializationGates(input)
            layout.hmd.forEach { (offset, _) ->
                assertContentEquals(nop, hmdPatched.copyOfRange(offset, offset + 4))
            }
            val lobbyPatched = patchLobbyPermissionStateGate(hmdPatched)
            assertContentEquals(
                nop,
                lobbyPatched.copyOfRange(layout.lobby.first, layout.lobby.first + 4),
            )
            assertContentEquals(lobbyPatched, patchHmdInitializationGates(lobbyPatched))
            assertContentEquals(lobbyPatched, patchLobbyPermissionStateGate(lobbyPatched))
        }
    }

    @Test
    fun `stream gates remain build-specific`() {
        val oldLayout = ByteArray(2_251_920).apply {
            hex("68000035").copyInto(this, 0x1140AC)
            hex("68050034").copyInto(this, 0x1140B4)
            hex("a8050034").copyInto(this, 0x114168)
        }
        val oldPatched = patchStreamXrGates(oldLayout)
        listOf(0x1140AC, 0x1140B4, 0x114168).forEach { offset ->
            assertContentEquals(hex("1f2003d5"), oldPatched.copyOfRange(offset, offset + 4))
        }

        val rewritten5002313 = ByteArray(2_276_872) { (it * 31).toByte() }
        assertContentEquals(rewritten5002313, patchStreamXrGates(rewritten5002313))
    }

    private data class FixedLayout(
        val size: Int,
        val hmd: List<Pair<Int, ByteArray>>,
        val lobby: Pair<Int, ByteArray>,
    )

    private fun hex(value: String): ByteArray =
        value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}
