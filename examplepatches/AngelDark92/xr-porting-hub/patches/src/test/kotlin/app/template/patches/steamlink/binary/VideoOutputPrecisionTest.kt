package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.androidxr.retiredNativeProjectionHook
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNull
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
        Layout("2.0.20", "5001812", 2_220_872, intArrayOf(0x10ab24, 0x10ab94)),
        Layout("2.0.21", "5001968", 2_234_048, intArrayOf(0x106a94, 0x106b04)),
        Layout("2.0.22", "5002244", VIDEO_LIBRARY_SIZE_5002244, SWAPCHAIN_FORMAT_OFFSETS_5002244),
        Layout("2.0.23", "5002363", VIDEO_LIBRARY_SIZE_5002363, SWAPCHAIN_FORMAT_OFFSETS_5002363),
        Layout("2.0.24", "5002395", VIDEO_LIBRARY_SIZE_5002395, SWAPCHAIN_FORMAT_OFFSETS_5002395),
        Layout("2.0.24", "5002527", VIDEO_LIBRARY_SIZE_5002527, SWAPCHAIN_FORMAT_OFFSETS_5002527),
    )

    private fun decodedScene(version: String, code: String): java.io.File? {
        val root = generateSequence(java.io.File(System.getProperty("user.dir")).canonicalFile) { it.parentFile }
            .firstOrNull { java.io.File(it, "patches/src/main/kotlin").isDirectory } ?: return null
        return java.io.File(root, "android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so")
            .takeIf { it.isFile }
    }

    @Test
    fun `inner-fade shader keeps the vInnerFade uniform and fills the 1206-byte block`() {
        assertEquals(1206, VIDEO_SHADER_SIZE_INNER_FADE)
        VideoOutputPrecision.entries.forEach { precision ->
            VideoDitherMode.entries.forEach { dither ->
                listOf(.50f to 0f, 1f to 1f, 1.2f to 1.45f, 2.50f to 3f).forEach { (gamma, saturation) ->
                    val shader = paddedVideoShader(gamma, saturation, precision, dither, innerFade = true)
                    assertEquals(VIDEO_SHADER_SIZE_INNER_FADE, shader.size, "$precision/$dither/$gamma/$saturation")
                    assertFalse(shader.contains(0.toByte()))
                    val text = shader.ascii()
                    assertTrue(text.contains("layout(location=14) uniform vec4 vInnerFade;"))
                    assertEquals(1, Regex("vInnerFade").findAll(text).count())
                    assertShaderInterface(text, dither != VideoDitherMode.OFF)
                    assertNull(retiredNativeProjectionHook(shader))
                }
            }
        }
        // The legacy block is untouched: no vInnerFade, 1087 bytes.
        val legacy = paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP)
        assertEquals(VIDEO_SHADER_SIZE, legacy.size)
        assertFalse(legacy.ascii().contains("vInnerFade"))
    }

    @Test
    fun `inner-fade calibration recognition accepts only the exact stock-location block`() {
        val shader = paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, innerFade = true)
        assertTrue(isOledCalibrationShader(shader))
        val text = shader.ascii()
        // Valve's uniform keeps its stock location 14; there is no relocated or second declaration form.
        assertEquals(1, Regex("layout\\(location=14\\) uniform vec4 vInnerFade;").findAll(text).count())
        assertFalse(text.contains("location=7"))
        // Wrong location, a missing declaration, a duplicate and a changed body all fail closed.
        val wrongLocation = text.replace("location=14) uniform vec4 vInnerFade", "location=9 ) uniform vec4 vInnerFade")
            .toByteArray(Charsets.US_ASCII)
        assertFalse(isOledCalibrationShader(wrongLocation))
        val missing = text.replace("layout(location=14) uniform vec4 vInnerFade;", "")
            .padEnd(VIDEO_SHADER_SIZE_INNER_FADE, ' ').toByteArray(Charsets.US_ASCII)
        assertFalse(isOledCalibrationShader(missing))
        val duplicate = shader.copyOf().also {
            val extra = "layout(location=7 ) uniform vec4 vInnerFade;".toByteArray(Charsets.US_ASCII)
            extra.copyInto(it, it.size - extra.size)
        }
        assertFalse(isOledCalibrationShader(duplicate))
        assertFalse(isOledCalibrationShader(shader.copyOf().also { it[200] = '!'.code.toByte() }))
        // A 1087-byte legacy block and a 1206-byte block are distinct layouts: sizes never cross over.
        val legacy = paddedVideoShader(1.2f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP)
        assertTrue(isOledCalibrationShader(legacy))
        assertFalse(isOledCalibrationShader(legacy.copyOf(VIDEO_SHADER_SIZE_INNER_FADE).also {
            for (i in VIDEO_SHADER_SIZE until it.size) it[i] = ' '.code.toByte()
        }))
        assertFalse(isOledCalibrationShader(shader.copyOf(VIDEO_SHADER_SIZE)))
    }

    @Test
    fun `shader locator honours the per-layout nul boundary`() {
        val library = ByteArray(VIDEO_SHADER_SIZE_INNER_FADE + 32).apply {
            paddedVideoShader(1.06f, 1.12f, VideoOutputPrecision.SRGB8_HIGHP, innerFade = true).copyInto(this)
        }
        assertEquals(0, findVideoShader(library, VIDEO_SHADER_SIZE_INNER_FADE))
        // The legacy 1087-byte boundary is not a NUL in this block.
        assertFailsWith<PatchException> { findVideoShader(library) }
        library[VIDEO_SHADER_SIZE_INNER_FADE] = 1
        assertFailsWith<PatchException> { findVideoShader(library, VIDEO_SHADER_SIZE_INNER_FADE) }
    }

    @Test
    fun `5002527 real decoded renderer takes the calibration shader and format sites without side effects`() {
        val file = decodedScene("2.0.24", "5002527")
        org.junit.Assume.assumeTrue("BLOCKED: decoded 2.0.24/5002527 scene is absent", file != null)
        val stock = file!!.readBytes()
        assertEquals(VIDEO_LIBRARY_SIZE_5002527, stock.size)
        assertEquals("cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03", sha256Hex(stock))
        assertTrue(isSupportedVideoLibrarySize(stock.size))
        val shaderPos = findVideoShader(stock, VIDEO_SHADER_SIZE_INNER_FADE)
        assertEquals(0xa3085, shaderPos)
        // The production template, not a literal: stock shader declares vInnerFade at 14.
        val stockShader = stock.copyOfRange(shaderPos, shaderPos + VIDEO_SHADER_SIZE_INNER_FADE).ascii()
        assertTrue(stockShader.contains("layout(location = 14) uniform vec4 vInnerFade;"))
        assertTrue(stockShader.contains("layout(location = 2) uniform samplerExternalOES tex0;"))
        assertTrue(stockShader.contains("layout(location = 3) uniform float fFadeAmount;"))
        assertTrue(stockShader.contains("layout(location = 6) uniform vec4 UniDitherOffsets;"))
        for ((gamma, saturation) in listOf(1f to 1f, 1.2f to 1.45f, 1.06f to 1.12f)) {
            val calibrated = stock.copyOf().apply {
                paddedVideoShader(gamma, saturation, VideoOutputPrecision.SRGB8_HIGHP, innerFade = true)
                    .copyInto(this, shaderPos)
            }
            assertTrue(calibrated.indices.all {
                it in shaderPos until shaderPos + VIDEO_SHADER_SIZE_INNER_FADE || calibrated[it] == stock[it]
            }, "Out-of-scope byte changed")
            assertEquals(0, calibrated[shaderPos + VIDEO_SHADER_SIZE_INNER_FADE].toInt(), "NUL boundary")
            assertEquals(shaderPos, findVideoShader(calibrated, VIDEO_SHADER_SIZE_INNER_FADE))
            assertTrue(isOledCalibrationShader(calibrated.copyOfRange(shaderPos, shaderPos + VIDEO_SHADER_SIZE_INNER_FADE)))
        }
        // The stock block is not mistaken for calibration; the legacy locator rejects it.
        assertFalse(isOledCalibrationShader(stock.copyOfRange(shaderPos, shaderPos + VIDEO_SHADER_SIZE_INNER_FADE)))
        assertFailsWith<PatchException> { findVideoShader(stock) }
        // Format sites: both swapchains are already sRGB8; the transition set is atomic and reversible.
        val offsets = SWAPCHAIN_FORMAT_OFFSETS_5002527
        VideoOutputPrecision.entries.forEach { target ->
            val changed = setProjectionSwapchainFormat(stock, target, "2.0.24", "5002527")
            val diff = stock.indices.filter { stock[it] != changed[it] }
            assertTrue(diff.all { index -> offsets.any { index in it until it + 4 } }, "Out-of-scope format byte")
            offsets.forEach { assertContentEquals(formatInstruction(target), changed.copyOfRange(it, it + 4)) }
            assertContentEquals(stock, setProjectionSwapchainFormat(changed, VideoOutputPrecision.SRGB8_HIGHP, "2.0.24", "5002527"))
            assertContentEquals(changed, setProjectionSwapchainFormat(changed, target, "2.0.24", "5002527"))
        }
        // Neighbouring pairs never reach these sites.
        assertContentEquals(stock, setProjectionSwapchainFormat(stock, VideoOutputPrecision.RGB10_A2_EXPERIMENTAL, "2.0.24", "5002526"))
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(stock, VideoOutputPrecision.RGB10_A2_EXPERIMENTAL, "2.0.24", "5002395")
        }
    }

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
                    SWAPCHAIN_FORMAT_OFFSETS_5002363.forEach { formatInstruction(first).copyInto(this, it) }
                    formatInstruction(second).copyInto(this, SWAPCHAIN_FORMAT_OFFSETS_5002363.last())
                }
                val snapshot = mixed.copyOf()
                VideoOutputPrecision.entries.forEach { target ->
                    assertFailsWith<PatchException> { setProjectionSwapchainFormat(mixed, target, "2.0.23", "5002363") }
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
    fun `legacy shader generator retains old uvmask gate for historical comparisons`() {
        val off = paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.OFF).ascii()
        val in10 = paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.STANDARD, true).ascii()
        val in8 = paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.OFF, true).ascii()
        // Production OFF keeps these bytes. Historical gated variants below are no longer selected by the UI.
        assertFalse(off.contains("float f=clamp"))
        assertFalse(off.contains("vec2 d=abs(fract(uvmask"))
        assertTrue(off.contains("const float DITHER_ENABLE=0.;"))
        // 10-bit: fovea weight present, dither enabled, scaled by the fovea weight f.
        assertTrue(in10.contains("vec2 d=abs(fract(uvmask*vec2(1.,4.))-.5);"))
        assertTrue(in10.contains("float f=clamp(1.-dot(d,d)*4.,0.,1.);"))
        assertTrue(in10.contains("const float DITHER_ENABLE=1.;"))
        assertTrue(in10.contains("*DITHER_SCALE*DITHER_ENABLE*f;"))
        // 8-bit: fovea weight present, dither disabled (neutral path).
        assertTrue(in8.contains("float f=clamp(1.-dot(d,d)*4.,0.,1.);"))
        assertTrue(in8.contains("const float DITHER_ENABLE=0.;"))
        assertTrue(in8.contains("*DITHER_SCALE*DITHER_ENABLE*f;"))
    }

    @Test
    fun `all toggles off emits the pre-change golden bytes`() {
        // Golden pin (plan slice 5.4): with both fovea toggles off the emitted 1087-byte
        // shader at the default final-balanced calibration (gamma 1.20, saturation 1.45)
        // must remain byte-identical to the pre-Fovea-VD-Like srgb8-highp/dither-off
        // output. The two fovea variants are pinned as well so the gate/dither bytes
        // cannot drift silently. Current VD options use applyVdSdrFovea instead.
        val off = paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.OFF)
        assertEquals(VIDEO_SHADER_SIZE, off.size)
        assertEquals("a0117d0c0e78b251b979ec4e2094ae03f07eac1386c6971268d8d1543129681b", sha256Hex(off))

        val input8Bit = paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.OFF, true)
        assertEquals("c18f8cd748f4ab8b9310dbb3e764d63f3ccd7d521971d16767e84980c6fbcbc5", sha256Hex(input8Bit))

        val input10Bit = paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP, VideoDitherMode.STANDARD, true)
        assertEquals("f3f350a9f760d9af49c8fe116abf61bb2b60e774f7120b6fe83f28b40e89bce2", sha256Hex(input10Bit))
    }

    @Test
    fun `historical gated variants stay within the 1087-byte block for every calibration`() {
        listOf(
            VideoDitherMode.OFF to false,
            VideoDitherMode.STANDARD to true,
            VideoDitherMode.OFF to true,
        ).forEach { (dither, gate) ->
            listOf(.50f to 0f, 1f to 1f, 1.06f to 1.12f, 2.50f to 3f).forEach { (gamma, saturation) ->
                val shader = paddedVideoShader(gamma, saturation, VideoOutputPrecision.SRGB8_HIGHP, dither, gate)
                assertEquals(VIDEO_SHADER_SIZE, shader.size)
                assertFalse(shader.contains(0.toByte()))
            }
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
            .copyInto(mixed, SWAPCHAIN_FORMAT_OFFSETS_5002363.first())

        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                mixed,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                "2.0.23",
                "5002363",
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
                "5002363",
            ),
        )
    }

    @Test
    fun `swapchain format patch rejects wrong size for a known exact pair`() {
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                ByteArray(1024),
                VideoOutputPrecision.SRGB8_HIGHP,
                "2.0.23",
                "5002363",
            )
        }
    }

    @Test
    fun `swapchain format patch rejects changed instruction context`() {
        val changedContext = syntheticLibrary().apply {
            this[SWAPCHAIN_FORMAT_OFFSETS_5002363.first() - 1] = 0
        }
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                changedContext,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                "2.0.23",
                "5002363",
            )
        }
    }

    @Test
    fun `swapchain format patch rejects an extra matching context`() {
        val extraOffset = 0x100
        val duplicated = syntheticLibrary().apply {
            copyOfRange(
                SWAPCHAIN_FORMAT_OFFSETS_5002363.first() - 16,
                SWAPCHAIN_FORMAT_OFFSETS_5002363.first() + 16,
            ).copyInto(this, extraOffset - 16)
        }
        assertFailsWith<PatchException> {
            setProjectionSwapchainFormat(
                duplicated,
                VideoOutputPrecision.RGB10_A2_EXPERIMENTAL,
                "2.0.23",
                "5002363",
            )
        }
    }

    @Test
    fun `oled patched bytes pass the high-resolution retired hook guard on every layout`() {
        // The recommended set executes alpha0HighResolutionTriggerPatch and oledCalibrationPatch
        // together. Its only interaction with libvrlink_scene.so is this read-only guard, so the
        // OLED mutation (shader + format sites) must never trip it, in any option combination.
        val stockText = "ordinary guarded scene mutation".toByteArray()
        assertNull(retiredNativeProjectionHook(stockText), "negative control: guard must accept ordinary bytes")
        assertEquals(
            "libgxr_ast_underside.so",
            retiredNativeProjectionHook("prefix libgxr_ast_underside.so suffix".toByteArray()),
            "negative control: guard must still reject retired hooks",
        )
        layouts.forEach { layout ->
            isSupportedVideoLibrarySize(layout.size)
            VideoOutputPrecision.entries.forEach { precision ->
                VideoDitherMode.entries.forEach { dither ->
                    val shader = paddedVideoShader(1.06f, 1.12f, precision, dither)
                    assertNull(retiredNativeProjectionHook(shader), "${layout.versionCode}: emitted shader must not embed a retired hook name")
                    val bytes = oledCompositionLibrary(layout, shader)
                    assertEquals(0, findVideoShader(bytes), "${layout.versionCode}: shader locator on composed bytes")
                    val withFormat = setProjectionSwapchainFormat(bytes, precision, layout.versionName, layout.versionCode)
                    assertNull(retiredNativeProjectionHook(withFormat), "${layout.versionCode}: OLED-patched bytes must pass the high-resolution guard")
                    // Order independence: the guard reads whatever the OLED patch wrote last.
                    val withShaderOnPatched = oledCompositionLibrary(layout, shader)
                        .let { setProjectionSwapchainFormat(it, precision, layout.versionName, layout.versionCode) }
                    assertNull(retiredNativeProjectionHook(withShaderOnPatched), "${layout.versionCode}: guard after format mutation")
                }
            }
        }
    }

    private fun oledCompositionLibrary(layout: Layout, shader: ByteArray): ByteArray =
        ByteArray(layout.size).apply {
            shader.copyInto(this, 0)
            this[shader.size] = 0.toByte()
        }.apply { layout.offsets.forEach { offset ->
            byteArrayOf(
                0xe1.toByte(), 0xa3.toByte(), 0x00, 0x91.toByte(),
                0xe0.toByte(), 0x03, 0x14, 0xaa.toByte(),
                0xe2.toByte(), 0x03, 0x1c, 0xaa.toByte(),
                0xe8.toByte(), 0x22, 0x09, 0x9b.toByte(),
            ).copyInto(this, offset - 16)
            byteArrayOf(0x69, 0x88.toByte(), 0x91.toByte(), 0x52).copyInto(this, offset)
            byteArrayOf(
                0xe9.toByte(), 0x1b, 0x00, 0xf9.toByte(),
                0x08, 0x21, 0x40, 0xb9.toByte(),
                0xe8.toByte(), 0x3b, 0x00, 0xb9.toByte(),
            ).copyInto(this, offset + 4)
        }}

    private fun syntheticLibrary(
        size: Int = VIDEO_LIBRARY_SIZE_5002363,
        offsets: IntArray = SWAPCHAIN_FORMAT_OFFSETS_5002363,
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

    private fun sha256Hex(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

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
