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
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object PlayerBannerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(name = "isMegaphoneActive", parameters = emptyList(), returnType = "Z"),
        methodCall(name = "setCustomBannerIsActive", parameters = listOf("Z"), returnType = "V"),
        methodCall(name = "getMegaphoneChannelsJson"),
        string("Error parsing megaphoneChannelsJson"),
    ),
)

@Suppress("unused")
val hidePlayerBannersPatch = patch(
    name = "Hide player campaign banners",
    description = "Disables the player's optional Megaphone banner overlay on phone and TV. This can hide announcements as well as promotions.",
    default = false,
) {
    category("Ads")
    compatibleWith(*AppCompatibilities.ditu())

    execute {
        val matches = PlayerBannerFingerprint.matchAll().toList()
        if (matches.size != 1) throw PatchException("Expected one player banner configuration method; found ${matches.size}")
        val method = matches.single().method
        val instructions = method.instructions.toList()
        val reads = instructions.indices.filter {
            instructions[it].getReference<MethodReference>()?.name == "isMegaphoneActive"
        }
        val index = (reads.singleOrNull()
            ?: throw PatchException("Expected one Megaphone activation check")) + 1
        val result = instructions.getOrNull(index) as? OneRegisterInstruction
        if (result == null || instructions[index].opcode != Opcode.MOVE_RESULT || result.registerA !in 0..15) {
            throw PatchException("Unexpected Megaphone activation result in ${method.definingClass}->${method.name}")
        }
        method.replaceInstruction(index, BuilderInstruction11n(Opcode.CONST_4, result.registerA, 0))
    }
}
