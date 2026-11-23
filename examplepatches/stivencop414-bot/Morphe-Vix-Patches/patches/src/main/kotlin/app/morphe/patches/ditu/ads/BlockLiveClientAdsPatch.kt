package app.morphe.patches.ditu.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object LiveAdSourceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Landroidx/media3/exoplayer/ExoPlayer;",
        "Landroid/content/Context;",
        "Landroidx/media3/exoplayer/source/G;",
        "Landroidx/media3/common/MediaItem;",
        "Landroidx/media3/common/MediaItem\$a;",
        "Z",
        "Landroidx/media3/exoplayer/source/ads/e;",
        "Landroidx/media3/common/e;",
    ),
    filters = listOf(
        string("adTagUri"),
        string("Error creating AdsMediaSource: "),
        methodCall(definingClass = "Landroidx/media3/exoplayer/ExoPlayer;", name = "addMediaSource"),
    ),
)

@Suppress("unused")
val blockLiveClientAdsPatch = patch(
    name = "Block client-side live prerolls",
    description = "Uses the live player's existing content-only route in place of its local IMA preroll. Ads already in the live stream can still play.",
    default = true,
) {
    category("Ads")
    compatibleWith(*AppCompatibilities.ditu())

    execute {
        val matches = LiveAdSourceFingerprint.matchAll().toList()
        if (matches.size != 1) throw PatchException("Expected one live IMA source loader; found ${matches.size}")
        val method = matches.single().method
        val instructions = method.instructions.toList()
        val copy = instructions.firstOrNull() as? TwoRegisterInstruction
        val firstParameter = (method.implementation?.registerCount
            ?: throw PatchException("Missing live source loader implementation")) - 9
        if (copy == null || copy.opcode != Opcode.MOVE_OBJECT_FROM16 ||
            copy.registerB != firstParameter + 5 || copy.registerA !in 0..15
        ) {
            throw PatchException("Unexpected live ad configuration parameter in ${method.definingClass}->${method.name}")
        }
        val nullChecks = instructions.takeWhile { it.opcode != Opcode.NEW_INSTANCE }.filter {
            it.opcode == Opcode.IF_EQZ && (it as? OneRegisterInstruction)?.registerA == copy.registerA
        }
        val target = (nullChecks.singleOrNull() as? BuilderOffsetInstruction)?.target?.location?.instruction
        val fallback = target?.getReference<MethodReference>()
        if (fallback?.name != "createMediaSource" || fallback.parameterTypes.map { it.toString() } !=
            listOf("Landroidx/media3/common/MediaItem;")
        ) {
            throw PatchException("Live content fallback after the null ad configuration check did not match")
        }
        method.replaceInstruction(0, BuilderInstruction11n(Opcode.CONST_4, copy.registerA, 0))
    }
}
