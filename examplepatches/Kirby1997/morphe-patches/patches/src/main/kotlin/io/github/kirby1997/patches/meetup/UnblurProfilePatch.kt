package io.github.kirby1997.patches.meetup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Meetup gates profile fields, group lists and member rows behind Compose's
// Modifier.blur(). Patch the four androidx.compose.ui.draw.BlurKt overloads to
// return the input Modifier untouched, so every blur() call becomes a no-op.

object Blur1fqSgwFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Landroidx/compose/ui/Modifier;",
    parameters = listOf(
        "Landroidx/compose/ui/Modifier;",
        "F",
        "F",
        "Landroidx/compose/ui/graphics/Shape;",
    ),
    definingClass = "Landroidx/compose/ui/draw/BlurKt;",
    name = "blur-1fqS-gw",
)

object Blur1fqSgwDefaultFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
    returnType = "Landroidx/compose/ui/Modifier;",
    parameters = listOf(
        "Landroidx/compose/ui/Modifier;",
        "F",
        "F",
        "Landroidx/compose/ui/draw/BlurredEdgeTreatment;",
        "I",
        "Ljava/lang/Object;",
    ),
    definingClass = "Landroidx/compose/ui/draw/BlurKt;",
    name = "blur-1fqS-gw\$default",
)

object BlurF8QBwvsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Landroidx/compose/ui/Modifier;",
    parameters = listOf(
        "Landroidx/compose/ui/Modifier;",
        "F",
        "Landroidx/compose/ui/graphics/Shape;",
    ),
    definingClass = "Landroidx/compose/ui/draw/BlurKt;",
    name = "blur-F8QBwvs",
)

object BlurF8QBwvsDefaultFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
    returnType = "Landroidx/compose/ui/Modifier;",
    parameters = listOf(
        "Landroidx/compose/ui/Modifier;",
        "F",
        "Landroidx/compose/ui/draw/BlurredEdgeTreatment;",
        "I",
        "Ljava/lang/Object;",
    ),
    definingClass = "Landroidx/compose/ui/draw/BlurKt;",
    name = "blur-F8QBwvs\$default",
)

@Suppress("unused")
val unblurProfilePatch = bytecodePatch(
    name = "Unblur profile content",
    description = "Disables the Compose blur overlay Meetup applies to gated profile fields, group lists, and member rows so the underlying data is visible.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        // Each overload takes the source Modifier as p0 and returns a Modifier.
        // Returning p0 unchanged short-circuits the blur graphics layer.
        val passthrough = """
            return-object p0
        """

        Blur1fqSgwFingerprint.method.addInstructions(0, passthrough)
        Blur1fqSgwDefaultFingerprint.method.addInstructions(0, passthrough)
        BlurF8QBwvsFingerprint.method.addInstructions(0, passthrough)
        BlurF8QBwvsDefaultFingerprint.method.addInstructions(0, passthrough)
    }
}
