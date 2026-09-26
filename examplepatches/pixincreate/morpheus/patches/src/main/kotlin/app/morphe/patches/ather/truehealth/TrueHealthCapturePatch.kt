/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.truehealth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val HEALTH_LOG = "Lapp/morphe/ather/HealthLog;"
private const val RESPONSE_PACKAGE = "Lcom/ather/atherapplabs/atherlabs/features/trueHealth/api/response/"
private const val OBJECT_CONSTRUCTOR = "Ljava/lang/Object;-><init>()V"

/**
 * Matches the synthetic constructor of a wear-and-tear part.
 *
 * ```
 * public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;III...)V
 * ```
 *
 * The first parameter is the synthetic-constructor flag, so the payload starts at `p2`.
 */
internal object WearAndTearComponentFingerprint : Fingerprint(
    definingClass = "${RESPONSE_PACKAGE}WearAndTearComponent;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "I",
        "I",
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "${RESPONSE_PACKAGE}Tag;",
        "${RESPONSE_PACKAGE}Description;",
    ),
)

/**
 * Matches the synthetic constructor of a True Health report.
 *
 * The class also has a plain no-argument constructor, so the fingerprint pins the
 * four-parameter signature instead.
 */
internal object HealthFingerprint : Fingerprint(
    definingClass = "${RESPONSE_PACKAGE}Health;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I",
        "${RESPONSE_PACKAGE}OverallHealth;",
        "Ljava/util/List;",
        "Ljava/util/List;",
    ),
)

/**
 * Matches the synthetic constructor of a True Health report component.
 *
 * The class has four local registers, so `p0` is `v4`, `p2` is `v6` and the two
 * doubles occupy `v8`/`v9` and `v10`/`v11`.
 */
internal object ComponentFingerprint : Fingerprint(
    definingClass = "${RESPONSE_PACKAGE}Component;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "D",
        "D",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "${RESPONSE_PACKAGE}Tag;",
        "${RESPONSE_PACKAGE}Description;",
    ),
)

/**
 * Captures the True Health report while the app builds it.
 *
 * The report is deserialised into these response classes, so their constructors see
 * every field before the screens can drop it. The Morphe history screen reads the
 * captured parts later.
 *
 * The classes are obfuscated, so each fingerprint pins the defining class plus the
 * exact constructor signature.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * .method public synthetic constructor <init>(I...)V
 *     .locals 2
 *
 *     invoke-direct {p0}, Ljava/lang/Object;-><init>()V
 *
 *     invoke-static {p2, p3, p4, p5, p6}, Lapp/morphe/ather/HealthLog;->onWear(Ljava/lang/String;Ljava/lang/String;III)V
 * .end method
 * ```
 */
@Suppress("unused")
val trueHealthCapturePatch = bytecodePatch(
    name = "True Health capture",
    description = "Captures the True Health report while the app builds it, so the Morphe history screen can show the part wear.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        WearAndTearComponentFingerprint.method.captureAfterSuperCall(
            "invoke-static {p2, p3, p4, p5, p6}, $HEALTH_LOG->onWear(Ljava/lang/String;Ljava/lang/String;III)V",
        )
        HealthFingerprint.method.captureAfterSuperCall(
            "invoke-static {p3, p4}, $HEALTH_LOG->onHealth(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        ComponentFingerprint.method.captureAfterSuperCall(
            "invoke-static/range {v6 .. v11}, $HEALTH_LOG->onComponent(Ljava/lang/String;Ljava/lang/String;DD)V",
        )
    }
}

/**
 * Inserts [smali] right after the super constructor call, which is where the payload
 * fields of a synthetic constructor are still intact.
 */
private fun MutableMethod.captureAfterSuperCall(smali: String) {
    val body = implementation ?: throw IllegalStateException(
        "True Health response constructor has no body to patch.",
    )

    val superCallIndex = body.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_DIRECT &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == OBJECT_CONSTRUCTOR
    }

    if (superCallIndex < 0) {
        throw IllegalStateException("True Health response constructor does not call Object.<init>.")
    }

    addInstructions(superCallIndex + 1, smali)
}
