package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class VideoOutputPrecisionTest {
    @Test
    fun `srgb8 control shader is highp and uses 8-bit-scaled vector dither`() {
        val shader = paddedVideoShader(1.06f, 1.12f, VideoOutputPrecision.SRGB8_HIGHP).ascii()

        assertTrue(shader.startsWith("#version 300 es\n"))
        assertTrue(shader.contains("precision highp float;"))
        assertTrue(shader.contains("const float DITHER_SCALE=.00392;"))
        assertTrue(shader.contains("UniDitherOffsets.rgb"))
        assertTrue(
            shader.contains(
                "n*=smoothstep(0.,.0157,q)*smoothstep(0.,.0157,1.-q);",
            ),
        )
        assertTrue(shader.contains("vec3 q=c;"))
        assertFalse(shader.contains("step(vec3(.04045),c)"))
        assertShaderInterface(shader)
    }

    @Test
    fun `rgb10 shader applies eotf and uses 10-bit-scaled dither`() {
        val shader = paddedVideoShader(
            1.20f,
            1.45f,
            VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
        ).ascii()

        assertTrue(shader.contains("const float DITHER_SCALE=.00073;"))
        assertTrue(
            shader.contains(
                "n*=smoothstep(0.,.00391,q)*smoothstep(0.,.00391,1.-q);",
            ),
        )
        assertTrue(
            shader.contains(
                "vec3 q=mix(c/12.92,pow((c+.055)/1.055,vec3(2.4)),step(vec3(.04045),c));",
            ),
        )
        assertTrue(shader.contains("vec3(1.20)"))
        assertTrue(shader.contains("c,1.45)"))
        assertShaderInterface(shader)
    }

    @Test
    fun `generated shaders preserve fixed block size`() {
        VideoOutputPrecision.entries.forEach { precision ->
            assertEquals(VIDEO_SHADER_SIZE, paddedVideoShader(1.06f, 1.12f, precision).size)
        }
    }

    @Test
    fun `shader locator requires the fixed nul boundary`() {
        val library = ByteArray(VIDEO_SHADER_SIZE + 32).apply {
            paddedVideoShader(1.06f, 1.12f, VideoOutputPrecision.SRGB8_HIGHP).copyInto(this)
        }
        assertEquals(0, findVideoShader(library))

        library[VIDEO_SHADER_SIZE] = 1
        assertFailsWith<PatchException> { findVideoShader(library) }
    }

    @Test
    fun `dither toggle preserves the selected output scale`() {
        VideoOutputPrecision.entries.forEach { precision ->
            val enabled = paddedVideoShader(1.06f, 1.12f, precision)
            val disabled = setDitherState(enabled, false)
            val restored = setDitherState(disabled, true)

            assertTrue(disabled.ascii().contains("const float DITHER_ENABLE=0.;"))
            assertContentEquals(enabled, restored)
        }
    }

    @Test
    fun `swapchain format patch supports all verified layouts and is reversible`() {
        listOf(
            VIDEO_LIBRARY_SIZE_5002244 to SWAPCHAIN_FORMAT_OFFSETS_5002244,
            VIDEO_LIBRARY_SIZE_5002313 to SWAPCHAIN_FORMAT_OFFSETS_5002313,
            VIDEO_LIBRARY_SIZE_5002318 to SWAPCHAIN_FORMAT_OFFSETS_5002318,
            VIDEO_LIBRARY_SIZE_5002322 to SWAPCHAIN_FORMAT_OFFSETS_5002322,
        ).forEach { (size, offsets) ->
            val srgb = syntheticLibrary(size, offsets)
            val rgb10 = setProjectionSwapchainFormat(srgb, VideoOutputPrecision.RGB10_A2_EXPERIMENTAL)

            offsets.forEach { offset ->
                assertContentEquals(
                    byteArrayOf(0x29, 0x0b, 0x90.toByte(), 0x52),
                    rgb10.copyOfRange(offset, offset + 4),
                )
            }
            val changedOffsets = srgb.indices.filter { srgb[it] != rgb10[it] }
            assertEquals(9, changedOffsets.size)
            assertContentEquals(srgb, setProjectionSwapchainFormat(rgb10, VideoOutputPrecision.SRGB8_HIGHP))
        }
    }

    @Test
    fun `swapchain format patch rejects mixed states`() {
        val mixed = syntheticLibrary()
        byteArrayOf(0x29, 0x0b, 0x90.toByte(), 0x52)
            .copyInto(mixed, SWAPCHAIN_FORMAT_OFFSETS_5002244.first())

        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(mixed, VideoOutputPrecision.RGB10_A2_EXPERIMENTAL)
        }
    }

    @Test
    fun `swapchain format patch rejects unknown layout`() {
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(ByteArray(1024), VideoOutputPrecision.SRGB8_HIGHP)
        }
    }

    @Test
    fun `swapchain format patch rejects changed instruction context`() {
        val changedContext = syntheticLibrary().apply {
            this[SWAPCHAIN_FORMAT_OFFSETS_5002244.first() - 1] = 0
        }
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(changedContext, VideoOutputPrecision.RGB10_A2_EXPERIMENTAL)
        }
    }

    private fun syntheticLibrary(
        size: Int = VIDEO_LIBRARY_SIZE_5002244,
        offsets: IntArray = SWAPCHAIN_FORMAT_OFFSETS_5002244,
    ): ByteArray = ByteArray(size).apply {
        val before = byteArrayOf(
            0xe1.toByte(), 0xa3.toByte(), 0x00, 0x91.toByte(),
            0xe0.toByte(), 0x03, 0x14, 0xaa.toByte(),
            0xe2.toByte(), 0x03, 0x1c, 0xaa.toByte(),
            0xe8.toByte(), 0x22, 0x09, 0x9b.toByte(),
        )
        val instruction = byteArrayOf(0x69, 0x88.toByte(), 0x91.toByte(), 0x52)
        val after = byteArrayOf(
            0xe9.toByte(), 0x1b, 0x00, 0xf9.toByte(),
            0x08, 0x21, 0x40, 0xb9.toByte(),
            0xe8.toByte(), 0x3b, 0x00, 0xb9.toByte(),
        )
        offsets.forEach { offset ->
            before.copyInto(this, offset - before.size)
            instruction.copyInto(this, offset)
            after.copyInto(this, offset + instruction.size)
        }
    }

    private fun ByteArray.ascii() = toString(Charsets.US_ASCII)

    private fun assertShaderInterface(shader: String) {
        assertTrue(shader.contains("layout(location=2) uniform highp samplerExternalOES tex0;"))
        assertFalse(shader.contains("layout(location=2) uniform samplerExternalOES tex0;"))
        assertTrue(shader.contains("layout(location=3) uniform float fFadeAmount;"))
        assertTrue(shader.contains("layout(location=4) uniform vec3 UniReserved1;"))
        assertTrue(shader.contains("layout(location=5) uniform vec4 UniReserved2;"))
        assertTrue(shader.contains("layout(location=6) uniform vec4 UniDitherOffsets;"))
        assertTrue(shader.contains("_valve1_d2020d709"))
        assertTrue(shader.contains("*fFadeAmount;"))
    }
}
