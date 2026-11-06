package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Start at high quality.
//
// YouTube TV starts each video at a low resolution and steps up once it has
// measured the connection. With protected streams the player
// rebuilds its video decoder for that step, which shows as a short flicker a
// few seconds in.
//
// The player has a "sticky quality" feature, off by a server experiment: at
// the start of each playback it asks the sticky-quality store whether a saved
// choice applies, and if so, gives that choice to the playback request,
// either as a fixed starting resolution or as a quality setting. The store's
// check now always says yes, and the saved choice is the starting resolution
// picked in the patch options. YouTube's own "Higher picture quality" setting
// was tried here as well, but playback still started at 480p with it.
//
// This works for recordings and on-demand videos. Live channels still start
// low: the native player core reads the starting resolution but picks a live
// stream's quality itself.
//
// The store is found by its "sticky_video_quality_key" string. Its choice is
// a small protobuf message, and the message's renamed class, builder, and
// fields are read from the store's own code that builds it.
// ─────────────────────────────────────────────────────────────────────────────

internal object StickyQualityStoreFingerprint : Fingerprint(
    strings = listOf("sticky_video_quality_key"),
)

@Suppress("unused")
val startAtHighQualityPatch = bytecodePatch(
    name = "Start at high quality",
    description = "Starts recordings and on-demand videos at high quality instead of stepping up from a low one.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    val quality by stringOption(
        key = "startingQuality",
        default = "1080",
        values = mapOf(
            "2160p (4K)" to "2160",
            "1080p" to "1080",
            "720p" to "720",
        ),
        title = "Starting quality",
        description = "The resolution recordings and on-demand videos start at. Choose 2160p only with the 4K Plus add-on: without it, videos start low as if the patch were off.",
        required = true,
    ) { it?.toIntOrNull()?.let { height -> height in 144..4320 } == true }

    execute {
        val store = mutableClassDefBy(StickyQualityStoreFingerprint.classDef.type)
        val choice = store.methods.singleOrNull {
            it.returnType == "Lj\$/util/Optional;" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Sticky quality choice method not found")
        val applies = store.methods.singleOrNull {
            it.returnType == "Z" && it.parameterTypes.firstOrNull()?.toString() ==
                "Lcom/google/android/libraries/youtube/player/model/PlaybackStartDescriptor;"
        } ?: throw PatchException("Sticky quality check method not found")

        // Read the message's names from the code that builds it.
        val instructions = choice.implementation!!.instructions.toList()
        fun methodNamed(name: String) = instructions.firstNotNullOfOrNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref -> ref.name == name }
        } ?: throw PatchException("$name not found in the sticky quality choice")

        val defaultInstance = instructions.firstNotNullOfOrNull {
            if (it.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
            ((it as ReferenceInstruction).reference as FieldReference).takeIf { ref -> ref.type == ref.definingClass }
        } ?: throw PatchException("Quality message default instance not found")
        val message = defaultInstance.type
        val builder = instructions.firstNotNullOfOrNull {
            if (it.opcode != Opcode.CHECK_CAST) return@firstNotNullOfOrNull null
            ((it as ReferenceInstruction).reference as TypeReference).type.takeIf { type -> type != message }
        } ?: throw PatchException("Quality message builder not found")
        val instance = instructions.firstNotNullOfOrNull {
            if (it.opcode != Opcode.IGET_OBJECT) return@firstNotNullOfOrNull null
            ((it as ReferenceInstruction).reference as FieldReference).takeIf { ref -> ref.name == "instance" }
        } ?: throw PatchException("Quality message builder instance not found")

        // The message's int fields: the presence bits (the one field read
        // back), then, by the order they are written, the fixed resolution
        // and the quality setting.
        val intFields = instructions.filter { it.opcode == Opcode.IPUT || it.opcode == Opcode.IGET }
            .map { it.opcode to ((it as ReferenceInstruction).reference as FieldReference) }
            .filter { (_, ref) -> ref.definingClass == message && ref.type == "I" }
        val presence = intFields.firstOrNull { (op, _) -> op == Opcode.IGET }?.second?.name
            ?: throw PatchException("Quality message presence field not found")
        val written = intFields.filter { (op, ref) -> op == Opcode.IPUT && ref.name != presence }
            .map { it.second.name }.distinct()
        if (written.size != 2) throw PatchException("Quality message fields not found: $written")
        val resolutionField = written.first()

        val createBuilder = methodNamed("createBuilder")
        val copyOnWrite = methodNamed("copyOnWrite")
        val build = methodNamed("build")

        choice.addInstructions(
            0,
            """
                sget-object v0, $message->${defaultInstance.name}:$message
                invoke-virtual { v0 }, $createBuilder
                move-result-object v0
                check-cast v0, $builder
                invoke-virtual { v0 }, $copyOnWrite
                iget-object v1, v0, $instance
                check-cast v1, $message
                const/16 v2, ${quality!!.toInt()}
                iput v2, v1, $message->$resolutionField:I
                const/4 v2, 0x1
                iput v2, v1, $message->$presence:I
                invoke-virtual { v0 }, $build
                move-result-object v0
                invoke-static { v0 }, Lj${'$'}/util/Optional;->of(Ljava/lang/Object;)Lj${'$'}/util/Optional;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        applies.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
