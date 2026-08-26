package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.floatOption
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK
import java.util.Locale

// Unique line present in VRLink's embedded video fragment shader. Stock builds indent this line;
// calibrated builds do not, so locate the line first and then walk back to the version directive.
private val SHADER_EXTENSION =
    "#extension GL_OES_EGL_image_external_essl3 : enable".toByteArray(Charsets.US_ASCII)
private val SHADER_VERSION = "#version 300 es\n".toByteArray(Charsets.US_ASCII)
private const val SHADER_SIZE = 1087

// Initial calibration: gamma 1.06, saturation 1.12, zero-centred dither.
private val INITIAL_SHADER = """#version 300 es
#extension GL_OES_EGL_image_external_essl3 : enable
precision mediump float;

in vec2 uvmask;
in vec2 uv;
out vec4 color;

layout(location=2) uniform samplerExternalOES tex0;
layout(location=3) uniform float fFadeAmount;
layout(location=4) uniform vec3 UniReserved1;
layout(location=5) uniform vec4 UniReserved2;
layout(location=6) uniform vec4 UniDitherOffsets;

void main()
{
    color = texture(tex0, uv);
    mat3 _valve1_d2020d709 = mat3(
        1.04988847,  0.05442289,  0.00393458,
       -0.04433306,  0.96052738,  0.01122383,
       -0.005557,   -0.01509698,  0.98628952);
    vec3 c = _valve1_d2020d709 * color.rgb;
    c = pow(clamp(c, 0.0, 1.0), vec3(1.06));
    float y = dot(c, vec3(0.2126, 0.7152, 0.0722));
    c = mix(vec3(y), c, 1.12);
    float n = (fract(UniDitherOffsets.a * .43 + UniDitherOffsets.r +
        gl_FragCoord.x * 1.67 + gl_FragCoord.y * 1.127) - .5) * .00292;
    n *= smoothstep(.01, .04, max(c.r, max(c.g, c.b)));
    color.rgb = clamp(c + n, 0.0, 1.0) * fFadeAmount;
""".trimStart('\n')

private fun paddedShader(gamma: Float, saturation: Float): ByteArray {
    val gammaValue = String.format(Locale.US, "%.2f", gamma)
    val saturationValue = String.format(Locale.US, "%.2f", saturation)
    val src = INITIAL_SHADER
        .replace("vec3(1.06)", "vec3($gammaValue)")
        .replace("c, 1.12", "c, $saturationValue")
        .toByteArray(Charsets.US_ASCII)
    if (src.size > SHADER_SIZE) throw PatchException("Calibration shader exceeds $SHADER_SIZE bytes (${src.size})")
    return src.copyOf(SHADER_SIZE).apply {
        for (i in src.size until SHADER_SIZE) this[i] = ' '.code.toByte()
    }
}

private fun ByteArray.indicesOfSubarray(pattern: ByteArray): List<Int> {
    val matches = mutableListOf<Int>()
    outer@ for (i in 0..size - pattern.size) {
        for (j in pattern.indices) { if (this[i + j] != pattern[j]) continue@outer }
        matches += i
    }
    return matches
}

private fun findVideoShader(bytes: ByteArray): Int {
    val extensionMatches = bytes.indicesOfSubarray(SHADER_EXTENSION)
    if (extensionMatches.size != 1) {
        throw PatchException(
            "Expected one video GLSL extension marker, found ${extensionMatches.size}"
        )
    }

    val extensionPos = extensionMatches.single()
    val searchStart = (extensionPos - 32).coerceAtLeast(0)
    val shaderPos = (searchStart..extensionPos)
        .firstOrNull { pos ->
            pos + SHADER_VERSION.size <= bytes.size &&
                bytes.sliceArray(pos until pos + SHADER_VERSION.size).contentEquals(SHADER_VERSION)
        }
        ?: throw PatchException("Video GLSL version directive not found before extension marker")

    if (shaderPos + SHADER_SIZE >= bytes.size || bytes[shaderPos + SHADER_SIZE] != 0.toByte()) {
        throw PatchException(
            "Video GLSL block at 0x${shaderPos.toString(16)} lacks expected $SHADER_SIZE-byte NUL boundary"
        )
    }
    return shaderPos
}

@Suppress("unused")
val oledCalibrationPatch = rawResourcePatch(
    name = "OLED color calibration",
    description = "Replaces VRLink's embedded GLSL fragment shader with configurable Galaxy XR OLED gamma and saturation correction.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)

    val profile by stringOption(
        key = "profile",
        default = "initial",
        values = mapOf(
            "Initial tested (gamma 1.06, saturation 1.12)" to "initial",
            "Final balanced tested (gamma 1.20, saturation 1.45)" to "final-balanced",
            "Custom gamma and saturation" to "custom",
        ),
        title = "Calibration profile",
        description = "Tested profiles: Initial uses gamma 1.06 and saturation 1.12; Final balanced uses gamma 1.20 and saturation 1.45. Custom uses number inputs below.",
        required = true,
    )

    val gamma by floatOption(
        key = "gamma",
        default = 1.06f,
        values = mapOf(
            "Initial APK (1.06)" to 1.06f,
            "Final balanced (1.20)" to 1.20f,
        ),
        title = "Gamma",
        description = "Used by Custom profile. Tested values: 1.06 (Initial) and 1.20 (Final balanced). Allowed range: 0.50 to 2.50.",
        required = true,
        validator = { value -> value != null && value in 0.50f..2.50f },
    )

    val saturation by floatOption(
        key = "saturation",
        default = 1.12f,
        values = mapOf(
            "Initial APK (1.12)" to 1.12f,
            "Final balanced (1.45)" to 1.45f,
        ),
        title = "Saturation",
        description = "Used by Custom profile. Tested values: 1.12 (Initial) and 1.45 (Final balanced). Allowed range: 0.00 to 3.00.",
        required = true,
        validator = { value -> value != null && value in 0.00f..3.00f },
    )

    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val shaderPos = findVideoShader(bytes)
        val (selectedGamma, selectedSaturation) = when (profile) {
            "initial" -> 1.06f to 1.12f
            "final-balanced" -> 1.20f to 1.45f
            "custom" -> gamma!! to saturation!!
            else -> throw PatchException("Unknown OLED calibration profile: $profile")
        }
        val result = bytes.copyOf()
        paddedShader(selectedGamma, selectedSaturation).copyInto(result, shaderPos)
        file.writeBytes(result)
    }
}
