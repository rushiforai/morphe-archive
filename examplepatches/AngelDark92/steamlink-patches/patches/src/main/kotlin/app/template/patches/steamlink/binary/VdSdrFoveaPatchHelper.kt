package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest

internal const val VD_SDR_FOVEA_SUFFIX_SIZE = 296
internal const val VD_SDR_OPAQUE_SUFFIX_SIZE = 29
private const val STOCK_MASKED_HASH = "2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623"
private const val STOCK_OPAQUE_HASH = "93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c"

internal data class VdSdrFoveaGuard(val offset: Int, val size: Int, val sha256: String)
internal data class VdSdrFoveaLayout(
    val version: String, val code: String, val size: Int, val stockHash: String,
    val maskedSuffix: Int, val opaqueSuffix: Int, val guards: List<VdSdrFoveaGuard>,
)

// Independently measured from the exact decoded inputs: constructor assigns separate
// opaque/base and masked/fovea Shader objects; RenderSpecific selects them at +0x20/+0x28.
internal val VD_SDR_FOVEA_LAYOUTS = listOf(
    VdSdrFoveaLayout("2.0.20", "5001712", 2221072,
        "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495", 0xa6582, 0x9d23d,
        listOf(
            VdSdrFoveaGuard(0xf13f4, 504, "ad5ad5f6a9c52fc1ba17b109b6303e750397a4018b36ac0ebbbea34acabd5464"),
            VdSdrFoveaGuard(0xf1af4, 616, "4c905f1e24f02ea5e0c99bdba69aab311443c14af9a85f03005520985d490e7b"),
        )),
    VdSdrFoveaLayout("2.0.22", "5002244", 2251920,
        "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12", 0xa11d7, 0x976e6,
        listOf(
            VdSdrFoveaGuard(0xee210, 504, "57c3655916de003b3d0e9e2703c34f915320e5e330d3bac307f7d56586e158b1"),
            VdSdrFoveaGuard(0xee910, 616, "8ce7ad238e140586f2914445a683d9260f83fe33a61e2e9c2fc53abc3908bdf5"),
        )),
    VdSdrFoveaLayout("2.0.23", "5002363", 2292008,
        "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0", 0xa31bb, 0x99013,
        listOf(
            VdSdrFoveaGuard(0xf1350, 504, "bf4365c4e77b5119f41653f53ca48c0594dd128862991be8e208e1141549e9a4"),
            VdSdrFoveaGuard(0xf1a50, 616, "d3ad75422bac1df96b5a647ef0c4fbdf34facf0800f0164c2eedfdfd0daac4d0"),
        )),
)

private val STOCK_MASKED_SUFFIX = (
    "\n            vec2 placeInSection = fract(uvmask * vec2( 1.0, 4.0 ));\n" +
    "            vec2 distCenter = abs( placeInSection - 0.5 );\n" +
    "\t\t\tfloat powv = 10.0;\n" +
    "\t\t\tfloat edgecurve = 1.5;\n" +
    "\t\t\tcolor.a = pow( 1.05 - (pow( distCenter.y*2.0, powv ) + pow( distCenter.x*2.0, powv )) * 1.06, edgecurve );\n" +
    "    }\n    "
).toByteArray(Charsets.US_ASCII)

// 295 source bytes, padded to the existing 296-byte C-string slot. The original alpha
// statements retain every token and operation; only whitespace changes. In particular,
// preserve Valve's existing edge behavior rather than silently changing its pow argument.
// The caller supplies the existing highp arithmetic and external sampler through
// paddedVideoShader. Retain Valve's matrix: it may compensate decoder YUV conversion;
// removing it is not established VD behavior. Highp cannot recover earlier lost precision.
private val NEUTRAL_MASKED_SUFFIX = (
    "\ncolor.rgb=clamp(_valve1_d2020d709*texture(tex0,uv).rgb,0.,1.)*fFadeAmount;\n" +
    "vec2 placeInSection=fract(uvmask*vec2(1.0,4.0));\n" +
    "vec2 distCenter=abs(placeInSection-0.5);\n" +
    "float powv=10.0;float edgecurve=1.5;\n" +
    "color.a=pow(1.05-(pow(distCenter.y*2.0,powv)+pow(distCenter.x*2.0,powv))*1.06,edgecurve);\n}\n"
).toByteArray(Charsets.US_ASCII).let { source ->
    check(source.size <= VD_SDR_FOVEA_SUFFIX_SIZE)
    ByteArray(VD_SDR_FOVEA_SUFFIX_SIZE) { ' '.code.toByte() }.also { source.copyInto(it) }
}

internal fun vdSdrFoveaSuffix(mode: FoveaMode): ByteArray =
    (if (mode == FoveaMode.OFF) STOCK_MASKED_SUFFIX else NEUTRAL_MASKED_SUFFIX).copyOf()

private fun vdSdrHash(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

/** Embedded fallback ONLY: host ReloadWhenReady replaces complete shaders and can bypass
 * this suffix. Both declared depths use neutral external-RGB processing, with no invented
 * noise, integer quantizer or gamma boost, retaining Valve's original conversion matrix.
 * This does not reproduce VD's raw-YUV
 * sampler, establish effective decoder precision, or prove reduced visible banding.
 *
 * Mutates only the verified masked suffix; preserves the complete opaque/base program.
 * Caller retains the existing highp, dither-OFF common prefix and sRGB8 format handling.
 */
internal fun applyVdSdrFovea(
    input: ByteArray, version: String, code: String, mode: FoveaMode,
): ByteArray {
    val layout = VD_SDR_FOVEA_LAYOUTS.singleOrNull { it.version == version && it.code == code }
        ?: return input.copyOf()
    fun requireLayout(condition: Boolean, message: String) {
        if (!condition) throw PatchException("VD SDR fovea $version/$code: $message")
    }
    requireLayout(input.size == layout.size, "unexpected native size ${input.size}; expected ${layout.size}")
    requireLayout(STOCK_MASKED_SUFFIX.size == VD_SDR_FOVEA_SUFFIX_SIZE &&
        vdSdrHash(STOCK_MASKED_SUFFIX) == STOCK_MASKED_HASH, "canonical suffix integrity failure")
    for ((offset, size) in listOf(layout.maskedSuffix to VD_SDR_FOVEA_SUFFIX_SIZE,
        layout.opaqueSuffix to VD_SDR_OPAQUE_SUFFIX_SIZE)) {
        requireLayout(input[offset - 1] == 0.toByte() && input[offset + size] == 0.toByte(),
            "C-string boundary mismatch at 0x${offset.toString(16)}")
    }
    val current = input.copyOfRange(layout.maskedSuffix, layout.maskedSuffix + VD_SDR_FOVEA_SUFFIX_SIZE)
    requireLayout(current.contentEquals(STOCK_MASKED_SUFFIX) || current.contentEquals(NEUTRAL_MASKED_SUFFIX),
        "unrecognized masked suffix at 0x${layout.maskedSuffix.toString(16)}")
    requireLayout(vdSdrHash(input.copyOfRange(layout.opaqueSuffix,
        layout.opaqueSuffix + VD_SDR_OPAQUE_SUFFIX_SIZE)) == STOCK_OPAQUE_HASH, "opaque suffix changed")
    layout.guards.forEach { guard ->
        requireLayout(vdSdrHash(input.copyOfRange(guard.offset, guard.offset + guard.size)) == guard.sha256,
            "native renderer route changed at 0x${guard.offset.toString(16)}")
    }
    return input.copyOf().also { vdSdrFoveaSuffix(mode).copyInto(it, layout.maskedSuffix) }
}
