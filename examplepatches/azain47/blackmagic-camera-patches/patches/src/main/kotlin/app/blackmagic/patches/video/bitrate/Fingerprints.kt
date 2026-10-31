package app.blackmagic.patches.video.bitrate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal const val BITRATE_LEVEL_CLASS =
    "Lcom/blackmagicdesign/android/utils/entity/BitrateLevel;"

/**
 * `BitrateLevel.<clinit>` constructs the enum constants MAX / HIGH / MEDIUM / LOW,
 * each with a `float` scale stored in field `f`. Stock scales are
 * MAX = 1.0E7 (clamped to the encoder ceiling), HIGH = 2.0, MEDIUM = 1.5, LOW = 1.0.
 *
 * The class is not obfuscated, so the static initializer is matched by its
 * defining class and `<clinit>` name. The three float literals (2.0 / 1.5 / 1.0)
 * appear in that order and are the only float constants in the method.
 */
internal object BitrateLevelClinitFingerprint : Fingerprint(
    definingClass = BITRATE_LEVEL_CLASS,
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        literal(2.0f), // HIGH
        literal(1.5f), // MEDIUM
        literal(1.0f), // LOW
    ),
)

/**
 * The bitrate calculator: `int nr0.d(StreamType, int, Size, BitrateLevel, int,
 * LiveStreamQuality, Codec)`. The enclosing class and method name are obfuscated,
 * but every parameter type is a stable (non-obfuscated) Blackmagic/Android type,
 * and the method is the only one that reads `BitrateLevel.f`.
 *
 * The constant-frame-rate branch computes
 * `min(encoderMax, round(resolutionBase * scale * perSecondBase))`.
 * Filter 0 locates the `iget BitrateLevel.f` inside that branch; filter 1 locates
 * the `Math.min` clamp whose first argument register is the encoder ceiling.
 */
internal object BitrateFormulaFingerprint : Fingerprint(
    isStatic = true,
    returnType = "I",
    // Parameters are intentionally NOT declared. In 3.5.1 the method gained a
    // trailing `ColorSpaceProfile` parameter (7 -> 8 args), which broke an exact
    // parameter match. The `iget BitrateLevel.f` read is unique to this method
    // across the whole app, so the instruction filters alone identify it and the
    // match survives future signature changes.
    filters = listOf(
        fieldAccess(
            definingClass = BITRATE_LEVEL_CLASS,
            name = "f",
            type = "F",
            opcode = Opcode.IGET,
        ),
        methodCall(
            definingClass = "Ljava/lang/Math;",
            name = "min",
            parameters = listOf("I", "I"),
            returnType = "I",
        ),
    ),
)
