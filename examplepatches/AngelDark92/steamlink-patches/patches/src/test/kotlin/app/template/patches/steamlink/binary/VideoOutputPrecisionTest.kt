package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class VideoOutputPrecisionTest {
    private data class Layout(
        val versionName: String,
        val versionCode: String,
        val size: Int,
        val offsets: IntArray,
    )

    private val layouts = listOf(
        Layout("2.0.20", "5001712", VIDEO_LIBRARY_SIZE_5001712, SWAPCHAIN_FORMAT_OFFSETS_5001712),
        Layout("2.0.20", "5001740", VIDEO_LIBRARY_SIZE_5001740, SWAPCHAIN_FORMAT_OFFSETS_5001740),
        Layout("2.0.22", "5002244", VIDEO_LIBRARY_SIZE_5002244, SWAPCHAIN_FORMAT_OFFSETS_5002244),
        Layout("2.0.22", "5002313", VIDEO_LIBRARY_SIZE_5002313, SWAPCHAIN_FORMAT_OFFSETS_5002313),
        Layout("2.0.22", "5002318", VIDEO_LIBRARY_SIZE_5002318, SWAPCHAIN_FORMAT_OFFSETS_5002318),
        Layout("2.0.22", "5002322", VIDEO_LIBRARY_SIZE_5002322, SWAPCHAIN_FORMAT_OFFSETS_5002322),
    )

    @Test
    fun `srgb8 control shader is highp and retains disabled 8-bit-scaled vector dither`() {
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
    fun `rgb10 shader applies eotf and retains disabled 10-bit-scaled dither`() {
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
            VideoDitherMode.entries.forEach { dither ->
                listOf(.50f to 0f, 1f to 1f, 1.06f to 1.12f, 2.50f to 3f).forEach { (gamma, saturation) ->
                    val shader = paddedVideoShader(gamma, saturation, precision, dither)
                    assertEquals(VIDEO_SHADER_SIZE, shader.size, "$precision / $dither / $gamma / $saturation")
                    assertFalse(shader.contains(0.toByte()))
                    assertShaderInterface(shader.ascii(), dither != VideoDitherMode.OFF)
                }
            }
        }
    }

    @Test
    fun `fp16 output applies sRGB EOTF at neutral calibration`() {
        val shader = paddedVideoShader(1f, 1f, VideoOutputPrecision.RGBA16F_EXPERIMENTAL).ascii()
        assertTrue(shader.contains("mix(c/12.92,pow((c+.055)/1.055,vec3(2.4)),step(vec3(.04045),c))"))
        assertTrue(shader.contains("vec3(1.00)"))
        assertTrue(shader.contains("c,1.00)"))
        assertShaderInterface(shader)
    }

    @Test
    fun `all precision options round trip and unknown precision fails closed`() {
        VideoOutputPrecision.entries.forEach { precision ->
            assertEquals(precision, VideoOutputPrecision.fromOption(precision.optionValue))
        }
        assertFailsWith<PatchException> { VideoOutputPrecision.fromOption("rgba32f") }
        assertFailsWith<PatchException> { VideoOutputPrecision.fromOption(null) }
    }

    @Test
    fun `active dithering guards endpoints in sRGB code values before linear conversion`() {
        VideoOutputPrecision.entries.forEach { precision ->
            listOf(VideoDitherMode.LOW to ".00196", VideoDitherMode.STANDARD to ".00392").forEach { (mode, scale) ->
                val shader = paddedVideoShader(1f, 1f, precision, mode).ascii()
                assertTrue(shader.contains("const float DITHER_SCALE=$scale;"))
                assertTrue(shader.contains("vec3 q=c;"))
                assertTrue(shader.contains("n*=smoothstep(0.,.0157,q)*smoothstep(0.,.0157,1.-q);"))
                val addNoise = shader.indexOf("q=clamp(q+n,0.,1.);")
                assertTrue(addNoise >= 0)
                if (precision == VideoOutputPrecision.SRGB8_HIGHP) {
                    assertTrue(shader.contains("color.rgb=q*fFadeAmount;"))
                    assertFalse(shader.contains("step(vec3(.04045)"))
                } else {
                    val conversion = shader.indexOf("mix(q/12.92,pow((q+.055)/1.055,vec3(2.4)),step(vec3(.04045),q))")
                    assertTrue(conversion > addNoise, "Dither must precede the EOTF for $precision")
                }
                assertShaderInterface(shader, true)
            }
        }
    }

    @Test
    fun `all projection formats transition atomically and idempotently on every guarded layout`() {
        layouts.forEach { layout ->
            val original = syntheticLibrary(layout.size, layout.offsets)
            VideoOutputPrecision.entries.forEach { source ->
                val input = setProjectionSwapchainFormat(original, source, layout.versionName, layout.versionCode)
                VideoOutputPrecision.entries.forEach { target ->
                    val snapshot = input.copyOf()
                    val changed = setProjectionSwapchainFormat(input, target, layout.versionName, layout.versionCode)
                    val expected = original.copyOf().apply {
                        layout.offsets.forEach { formatInstruction(target).copyInto(this, it) }
                    }
                    assertContentEquals(expected, changed, "${layout.versionCode}: $source -> $target")
                    assertContentEquals(snapshot, input, "Input mutated")
                    assertContentEquals(changed, setProjectionSwapchainFormat(changed, target, layout.versionName, layout.versionCode))
                }
            }
        }
    }

    @Test
    fun `mixed precision sites fail without modifying input including fp16`() {
        VideoOutputPrecision.entries.forEach { first ->
            VideoOutputPrecision.entries.filter { it != first }.forEach { second ->
                val mixed = syntheticLibrary().apply {
                    SWAPCHAIN_FORMAT_OFFSETS_5002244.forEach { formatInstruction(first).copyInto(this, it) }
                    formatInstruction(second).copyInto(this, SWAPCHAIN_FORMAT_OFFSETS_5002244.last())
                }
                val snapshot = mixed.copyOf()
                VideoOutputPrecision.entries.forEach { target ->
                    assertFailsWith<PatchException> { setProjectionSwapchainFormat(mixed, target, "2.0.22", "5002244") }
                    assertContentEquals(snapshot, mixed)
                }
            }
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
            val disabled = paddedVideoShader(1.06f, 1.12f, precision)
            val enabled = setDitherState(disabled, true)
            val restored = setDitherState(enabled, false)

            assertTrue(disabled.ascii().contains("const float DITHER_ENABLE=0.;"))
            assertTrue(enabled.ascii().contains("const float DITHER_ENABLE=1.;"))
            assertContentEquals(disabled, restored)
        }
    }

    @Test
    fun `swapchain format patch supports all verified layouts and is reversible`() {
        layouts.forEach { layout ->
            val srgb = syntheticLibrary(layout.size, layout.offsets)
            val rgb10 = setProjectionSwapchainFormat(
                srgb,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                layout.versionName,
                layout.versionCode,
            )

            layout.offsets.forEach { offset ->
                assertContentEquals(
                    byteArrayOf(0x29, 0x0b, 0x90.toByte(), 0x52),
                    rgb10.copyOfRange(offset, offset + 4),
                )
            }
            val changedOffsets = srgb.indices.filter { srgb[it] != rgb10[it] }
            assertEquals(layout.offsets.size * 3, changedOffsets.size)
            assertContentEquals(
                srgb,
                setProjectionSwapchainFormat(
                    rgb10,
                    VideoOutputPrecision.SRGB8_HIGHP,
                    layout.versionName,
                    layout.versionCode,
                ),
            )
        }
    }

    @Test
    fun `swapchain format patch rejects mixed states`() {
        val mixed = syntheticLibrary()
        byteArrayOf(0x29, 0x0b, 0x90.toByte(), 0x52)
            .copyInto(mixed, SWAPCHAIN_FORMAT_OFFSETS_5002244.first())

        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                mixed,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                "2.0.22",
                "5002244",
            )
        }
    }

    @Test
    fun `swapchain format patch leaves a wrong exact pair untouched`() {
        val input = syntheticLibrary()
        assertContentEquals(
            input,
            setProjectionSwapchainFormat(
                input,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                "2.0.20",
                "5002244",
            ),
        )
    }

    @Test
    fun `swapchain format patch rejects wrong size for a known exact pair`() {
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                ByteArray(1024),
                VideoOutputPrecision.SRGB8_HIGHP,
                "2.0.22",
                "5002244",
            )
        }
    }

    @Test
    fun `swapchain format patch rejects changed instruction context`() {
        val changedContext = syntheticLibrary().apply {
            this[SWAPCHAIN_FORMAT_OFFSETS_5002244.first() - 1] = 0
        }
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                changedContext,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                "2.0.22",
                "5002244",
            )
        }
    }

    @Test
    fun `swapchain format patch rejects an extra matching context`() {
        val extraOffset = 0x100
        val duplicated = syntheticLibrary().apply {
            copyOfRange(
                SWAPCHAIN_FORMAT_OFFSETS_5002244.first() - 16,
                SWAPCHAIN_FORMAT_OFFSETS_5002244.first() + 16,
            ).copyInto(this, extraOffset - 16)
        }
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                duplicated,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                "2.0.22",
                "5002244",
            )
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

    private fun formatInstruction(precision: VideoOutputPrecision): ByteArray = when (precision) {
        VideoOutputPrecision.SRGB8_HIGHP -> byteArrayOf(0x69, 0x88.toByte(), 0x91.toByte(), 0x52)
        VideoOutputPrecision.RGB10_A2_EXPERIMENTAL -> byteArrayOf(0x29, 0x0b, 0x90.toByte(), 0x52)
        VideoOutputPrecision.RGBA16F_EXPERIMENTAL -> byteArrayOf(0x49, 0x03, 0x91.toByte(), 0x52)
    }

    private fun assertShaderInterface(shader: String, ditherEnabled: Boolean = false) {
        assertTrue(shader.contains("const float DITHER_ENABLE=${if (ditherEnabled) 1 else 0}.;"))
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
