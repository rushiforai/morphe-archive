package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.rewrite
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WORKAROUNDS = "Lapp/s/chzzk/extension/CodecWorkarounds;"
private const val CODEC_INFO = "Lcom/naver/prismplayer/media3/exoplayer/mediacodec/MediaCodecInfo;"

internal fun BytecodePatchContext.addCodecWorkarounds() {
    val info = mutableClassDefBy(CODEC_INFO)
    val name = info.methods.single { it.name == "toString" }.implementation!!.instructions
        .mapNotNull { it.getReference<FieldReference>() }
        .single { it.definingClass == CODEC_INFO && it.type == "Ljava/lang/String;" }
    mutableClassDefBy(WORKAROUNDS).methods.single { it.name == "codecName" }.rewrite("""
        check-cast p0, $CODEC_INFO
        iget-object p0, p0, ${name.smaliReference}
        return-object p0
    """)
    val support = info.methods.single {
        it.returnType == "Z" && it.parameterTypeNames == listOf("I", "I", "D")
    }
    check(support.localRegisterCount >= 1)
    support.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p4}, $WORKAROUNDS->supportsSizeAndRate(Ljava/lang/Object;IID)Z
        move-result v0
        if-eqz v0, :original
        return v0
        :original
        nop
    """.trimIndent())
    val adapters = listOf(
        "Lcom/naver/prismplayer/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;",
        "Lcom/naver/prismplayer/media3/exoplayer/mediacodec/SynchronousMediaCodecAdapter${'$'}Factory;",
    )
    for (owner in adapters) {
        val calls = mutableClassDefBy(owner).methods.flatMap { method ->
            method.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
                instruction.getReference<MethodReference>()?.let {
                    it.definingClass == "Landroid/media/MediaCodec;" && it.name == "configure"
                } == true
            }?.map { method to it } ?: emptyList()
        }
        check(calls.size == 1) { "CHZZK codec configuration contract changed: $owner" }
        val (method, call) = calls.single()
        val registers = call.value as FiveRegisterInstruction
        method.addInstructions(call.index, """
            invoke-static {v${registers.registerC}, v${registers.registerD}, v${registers.registerF}}, $WORKAROUNDS->prepare(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCrypto;)V
        """.trimIndent())
    }
}
