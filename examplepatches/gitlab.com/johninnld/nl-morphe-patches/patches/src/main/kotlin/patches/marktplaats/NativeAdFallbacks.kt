package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val root = "Lcom/horizon/android/"
private const val repoOwner = "${root}core/advertising/nativead/a;"
private const val targetingOwner = "${root}core/advertising/targeting/a;"
private const val suspendMethod = "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressAdFallbacks() {
    val wrapper = "b(Ljava/lang/String;)Logd;"
    exact(repoOwner, wrapper, 17, 4, 7)
    val owner = target(repoOwner, wrapper).classDef
    check(owner.methods.none { it.name == "morpheNoAd" })
    owner.methods.add(MutableMethod(ImmutableMethod(
        repoOwner, "morpheNoAd", emptyList(), boundCode("Lrzc;"), 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList()),
    )).apply {
        addInstructions(0, """
            new-instance v0, Lrzc;
            sget-object v1, ${root}core/datamodel/resource/ResourceStatus;->ERROR:${root}core/datamodel/resource/ResourceStatus;
            const/4 v2, 0x0
            const/4 v3, 0x0
            const/4 v4, 0x0
            const/4 v5, 0x0
            const/4 v6, 0x0
            invoke-direct/range {v0 .. v6}, Lrzc;-><init>(${root}core/datamodel/resource/ResourceStatus;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/ArrayList;)V
            return-object v0
        """.trimIndent())
    })

    fun unavailable(coroutine: String, registers: Int, count: Int, index: Int, completion: Int, result: String) {
        val method = exact(coroutine, suspendMethod, 17, registers, count)
        val sponsored = coroutine.contains("NativeAdRepo")
        val captured = "$coroutine->this\$0:${if (sponsored) repoOwner else targetingOwner}"
        val first = method.getInstruction(index)
        val last = method.getInstruction(completion)
        check(first.opcode == Opcode.IGET_OBJECT && (first as? ReferenceInstruction)?.reference.toString() == captured)
        check(last.opcode == (if (sponsored) Opcode.IPUT_OBJECT else Opcode.IGET_OBJECT) &&
            (last as? ReferenceInstruction)?.reference.toString() ==
            (if (sponsored) "$coroutine->L\$0:Ljava/lang/Object;" else captured)) {
            "Marktplaats native advertising completion changed"
        }
        // Keep the original emitter, request-key cleanup, suspension and resume
        // cases. Only the fresh request path receives a native unavailable value.
        method.addInstructionsWithLabels(index, """
            invoke-static {}, $repoOwner->morpheNoAd()Lrzc;
            move-result-object $result
            goto/16 :native_completion
        """.trimIndent(), ExternalLabel("native_completion", last))
    }
    unavailable("${root}core/advertising/targeting/AdTargetingRepository\$requestDisplayTargetingForAd\$1;", 17, 90, 20, 62, "v0")
    unavailable("${root}core/advertising/targeting/AdTargetingRepository\$requestDisplayTargetingForListing\$2;", 22, 91, 20, 68, "v0")
    unavailable("${root}core/advertising/nativead/NativeAdRepo\$getSponsoredAd\$1;", 8, 42, 20, 33, "p1")

    // 16.19 removed the Compose VIP loader; its remaining PubMatic callers
    // are the guarded LRP loader and the no-content callback in qqi. The new
    // factory returns a non-null wrapper that callers dereference immediately.
    exact("Lxvh;", "b(${root}core/datamodel/MpAd;${root}feature/vip/d;Z)V", 17, 10, 57)
        .addInstructions(0, "return-void")
}
