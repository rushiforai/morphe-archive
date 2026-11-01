package patches.hln

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val VIDEO = "Lnl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction;"

/** Exact writes in both ordinary and serialization constructors. Every source
 * register is encoded by iput-boolean and therefore fits const/4. It is either a
 * dedicated incoming boolean or a scratch register overwritten by the next mask. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun disableBooleanWrites(cls: String, field: String, expected: Int) {
    val owner = exact(cls, if (cls == VIDEO) "describeContents()I" else "toString()Ljava/lang/String;").classDef
    val writes = owner.methods.flatMap { method -> method.instructions.withIndex().mapNotNull { (index, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        if (instruction.opcode == Opcode.IPUT_BOOLEAN && ref?.definingClass == cls && ref.name == field && ref.type == "Z") {
            check(method.name == "<init>") { "HLN mutable flag $cls->$field" }
            Triple(method, index, instruction as TwoRegisterInstruction)
        } else null
    } }
    check(writes.size == expected) { "HLN expected $expected $cls->$field writes, found ${writes.size}" }
    writes.groupBy { it.first }.forEach { (_, entries) -> entries.asReversed().forEach { (method, index, instruction) ->
        // Keep existing branch targets on the replacement const, including the
        // serialization constructor's shared default/supplied write label.
        method.replaceInstruction(index, "const/4 v${instruction.registerA}, 0x0")
        method.addInstructions(index + 1, "iput-boolean v${instruction.registerA}, v${instruction.registerB}, $cls->$field:Z")
    } }
}

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Filters commercial feed/article rows and disables banner technologies, video advertising and game prerolls using existing no-ad feature paths while preserving editorial media.") {
    compatibleWith(hln)
    dependsOn(originalInput, contentFilters, suppressCompanionCampaigns)
    execute {
        change(FILTER, "morpheAds()Z", TRUE)
        change("Li96;", "<init>(ZZZZZZ)V", "const/4 p1, 0x0\nconst/4 p2, 0x0\nconst/4 p3, 0x0\nconst/4 p4, 0x0")
        disableBooleanWrites(VIDEO, "k", 2)
        disableBooleanWrites("Lbj7;", "e", 1)
        disableBooleanWrites("Lbwg;", "l", 1)
        // Transition the existing game ad StateFlow to its supported error
        // state. Original collectors deliver RewardRejected and resume playing.
        val game = exact("Lo37;", "<init>(Lcom/google/ads/interactivemedia/v3/api/AdsLoader;Lcom/google/ads/interactivemedia/v3/api/AdsRequest;Lcom/google/ads/interactivemedia/v3/api/AdsRenderingSettings;Lcb7;)V").method
        exact("Lo37;", "b(Ljava/lang/String;)V")
        val requests = game.instructions.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/google/ads/interactivemedia/v3/api/AdsLoader;" && ref.name == "requestAds"
        }
        check(requests.size == 1) { "HLN game ad request boundary changed" }
        val index = requests.single().index
        game.replaceInstruction(index, "const-string p1, \"disabled\"")
        game.addInstructions(index + 1, "invoke-virtual {p0, p1}, Lo37;->b(Ljava/lang/String;)V")
    }
}
