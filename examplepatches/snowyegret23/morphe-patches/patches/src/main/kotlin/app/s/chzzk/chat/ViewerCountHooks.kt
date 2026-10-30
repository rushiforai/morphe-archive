package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val OVERLAY = "Lapp/s/chzzk/extension/ViewerCountOverlay;"
private const val COMMUNITY = "Lcom/navercorp/game/android/community/"

internal fun BytecodePatchContext.addViewerCountHooks() {
    fun bridge(name: String, registers: Int, body: String) {
        val owner = mutableClassDefBy(OVERLAY)
        val original = owner.methods.single { it.name == name }
        val replacement = MutableMethod(ImmutableMethod(
            owner.type, original.name, original.parameters, original.returnType, original.accessFlags,
            original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())
        ))
        replacement.addInstructions(0, body.trimIndent())
        owner.methods.remove(original)
        owner.methods.add(replacement)
    }

    val statusType = "${COMMUNITY}data/core/entity/serviceplayable/StreamingLiveStatus;"
    val detailType = "${COMMUNITY}ui/common/ui/overlayplayerend/live/streaming/StreamingLiveDetail;"
    val status = classDefBy(statusType)
    fun getter(field: String, type: String) = status.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == type &&
            method.implementation?.instructions?.count() == 2 &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.let { ref ->
                    ref.definingClass == statusType && ref.name == field && ref.type == type
                } == true
            } == true
    }
    val count = getter("concurrentUserCount", "I")
    val exposed = getter("cvExposure", "Z")
    val liveStatus = getter("status", "${statusType.dropLast(1)}${'$'}LiveStatus;")
    val channel = classDefBy(detailType).fields.single { it.name == "c" && it.type == "Ljava/lang/String;" }
    bridge("capture", 6, """
        check-cast p0, $detailType
        check-cast p1, $statusType
        if-eqz p0, :done
        if-eqz p1, :done
        iget-object v0, p0, ${channel.smaliReference}
        const/4 v1, -0x1
        invoke-virtual {p1}, ${exposed.smaliReference}
        move-result v2
        if-eqz v2, :update
        invoke-virtual {p1}, ${liveStatus.smaliReference}
        move-result-object v2
        if-eqz v2, :update
        invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;
        move-result-object v2
        const-string v3, "OPEN"
        invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-eqz v2, :update
        invoke-virtual {p1}, ${count.smaliReference}
        move-result v1
        :update
        invoke-static {v0, v1}, $OVERLAY->update(Ljava/lang/String;I)V
        :done
        return-void
    """)

    // The live item can be cached; the status in this collector is refreshed every 30 seconds.
    val collector = mutableClassDefBy("${COMMUNITY}app/ui/overlayplayerend/live/streaming/StreamingLiveEndViewModel${'$'}loadDataIntervalPer30Sec${'$'}8;")
        .methods.single { it.name == "invokeSuspend" }
    val casts = collector.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.CHECK_CAST }
    val statusCast = casts.single { it.value.getReference<TypeReference>()?.type == statusType }
    val detailCast = casts.single { it.value.getReference<TypeReference>()?.type == detailType }
    check(statusCast.index < detailCast.index)
    val statusRegister = (statusCast.value as OneRegisterInstruction).registerA
    val detailRegister = (detailCast.value as OneRegisterInstruction).registerA
    check(statusRegister < 16 && detailRegister < 16)
    collector.addInstructions(detailCast.index + 1,
        "invoke-static {v$detailRegister, v$statusRegister}, $OVERLAY->capture(Ljava/lang/Object;Ljava/lang/Object;)V")

    val viewType = "${COMMUNITY}core/feature/feature/player/BasePlayerView;"
    val modelType = "${COMMUNITY}core/feature/feature/player/BasePlayerViewModel;"
    val playableType = "${COMMUNITY}data/core/entity/player/StreamingLivePlayableData;"
    val view = mutableClassDefBy(viewType)
    val modelGetter = view.methods.single { it.name == "getViewModel" && it.returnType == modelType }
    val playableField = if (packageMetadata.versionName == "3.16.0") "k0" else "o0"
    val playable = classDefBy(modelType).fields.single { it.name == playableField && it.type == "Landroidx/lifecycle/MutableLiveData;" }
    check(classDefBy(playableType).methods.any { it.name == "getChannelId" && it.returnType == "Ljava/lang/String;" })
    bridge("currentChannel", 3, """
        check-cast p0, $viewType
        invoke-virtual {p0}, ${modelGetter.smaliReference}
        move-result-object v0
        if-eqz v0, :empty
        iget-object v0, v0, ${playable.smaliReference}
        invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;
        move-result-object v0
        instance-of v1, v0, $playableType
        if-eqz v1, :empty
        check-cast v0, $playableType
        invoke-interface {v0}, $playableType->getChannelId()Ljava/lang/String;
        move-result-object v0
        return-object v0
        :empty
        const/4 v0, 0x0
        return-object v0
    """)
    val attach = view.methods.single { it.name == "onAttachedToWindow" }
    val end = attach.implementation!!.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index
    attach.addInstructions(end, "invoke-static/range {p0 .. p0}, $OVERLAY->attach(Landroid/view/ViewGroup;)V")
}
