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
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private object StartupVideoFingerprint : Fingerprint(
    definingClass = "Lcom/caracol/streaming/feature/home/MobileSplashActivity;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        methodCall(name = "getSplashURL", parameters = emptyList(), returnType = "Ljava/lang/String;"),
        methodCall(definingClass = "Landroidx/media3/common/MediaItem;", name = "fromUri",
            parameters = listOf("Ljava/lang/String;")),
        string("android.resource"),
        methodCall(definingClass = "Landroidx/media3/common/MediaItem;", name = "fromUri",
            parameters = listOf("Landroid/net/Uri;")),
    ),
)

@Suppress("unused")
val blockRemoteStartupVideoPatch = patch(
    name = "Block remote startup video",
    description = "Loads the bundled Ditu logo animation in place of the remote full-screen startup video.",
    default = true,
) {
    category("Ads")
    compatibleWith(*AppCompatibilities.ditu())

    execute {
        val matches = StartupVideoFingerprint.matchAll().toList()
        if (matches.size != 1) throw PatchException("Expected one startup video selector; found ${matches.size}")
        val method = matches.single().method
        val instructions = method.instructions.toList()
        val remoteUrl = instructions.indexOfFirst { it.getReference<MethodReference>()?.name == "getSplashURL" }
        val localUri = instructions.indexOfFirst { it.getReference<StringReference>()?.string == "android.resource" }
        val localFile = instructions.indexOfFirst { it.getReference<FieldReference>()?.name == "splash_video" }
        if (remoteUrl < 0 || localUri <= remoteUrl || localFile <= localUri) {
            throw PatchException("Remote startup video or bundled splash resource was not found")
        }
        val branches = instructions.withIndex().take(remoteUrl).filter { (_, instruction) ->
            instruction.opcode == Opcode.IF_EQZ && instruction is BuilderOffsetInstruction &&
                instruction.target.location.index in (remoteUrl + 1)..localUri
        }
        val branch = branches.singleOrNull()
            ?: throw PatchException("Expected one branch to the bundled startup animation; found ${branches.size}")
        val target = (branch.value as BuilderOffsetInstruction).target
        method.replaceInstruction(branch.index, BuilderInstruction20t(Opcode.GOTO_16, target))
    }
}
