package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.rewrite
import app.s.chzzk.common.utils.smaliReference

private const val AUDIO = "Lapp/s/chzzk/extension/AudioEffects;"
private const val PROCESSOR = "Lcom/naver/prismplayer/media3/common/audio/AudioProcessor;"
private const val FORMAT = "Lcom/naver/prismplayer/media3/common/audio/AudioProcessor${'$'}AudioFormat;"
private const val SINK = "Lcom/naver/prismplayer/media3/exoplayer/audio/DefaultAudioSink;"

internal fun BytecodePatchContext.addAudioHooks() {
    val renamed = packageMetadata.versionName == "3.16.0"
    val expected = if (renamed) setOf(
        "a()Z", "b()Z", "c()Ljava/nio/ByteBuffer;", "e($FORMAT)$FORMAT", "f(Ljava/nio/ByteBuffer;)V",
        "flush()V", "g(Lcom/naver/prismplayer/media3/common/audio/AudioProcessor${'$'}StreamMetadata;)V",
        "h()V", "reset()V", "i(J)J",
    ) else setOf(
        "a()Ljava/nio/ByteBuffer;", "b()Z", "d($FORMAT)$FORMAT", "e(Ljava/nio/ByteBuffer;)V",
        "f()Z", "flush()V", "g(Lcom/naver/prismplayer/media3/common/audio/AudioProcessor${'$'}StreamMetadata;)V",
        "h()V", "reset()V", "i(J)J",
    )
    check(classDefBy(PROCESSOR).methods.filter { it.name != "<clinit>" }
        .map { it.smaliReference.substringAfter("->") }.toSet() == expected) {
        "CHZZK audio processor contract changed"
    }
    val extension = mutableClassDefBy(AUDIO)
    extension.methods.single { it.name == "renamedProcessorMethods" }.rewrite("""
        const/4 v0, ${if (renamed) "0x1" else "0x0"}
        return v0
    """)
    for ((name, fieldName) in mapOf("sampleRate" to "a", "channelCount" to "b", "encoding" to "c")) {
        val field = classDefBy(FORMAT).fields.single { it.name == fieldName && it.type == "I" }
        extension.methods.single { it.name == name }.rewrite("""
            check-cast p0, $FORMAT
            iget p0, p0, ${field.smaliReference}
            return p0
        """)
    }
    val unset = classDefBy(FORMAT).fields.single { it.name == "e" && it.type == FORMAT }
    extension.methods.single { it.name == "unsetFormat" }.rewrite("""
        sget-object v0, ${unset.smaliReference}
        return-object v0
    """)
    val chain = mutableClassDefBy("Lcom/naver/prismplayer/media3/exoplayer/audio/DefaultAudioSink${'$'}DefaultAudioProcessorChain;")
    chain.methods.single { it.name == "<init>" && it.parameterTypeNames == listOf("[$PROCESSOR") }
        .addInstructions(0, """
            invoke-static/range {p1 .. p1}, $AUDIO->append(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            check-cast p1, [$PROCESSOR
        """.trimIndent())

    // Keep decoded PCM available so the effects can be toggled during playback.
    val sink = mutableClassDefBy(SINK)
    val support = "Lcom/naver/prismplayer/media3/exoplayer/audio/AudioOffloadSupport;"
    val unavailable = classDefBy(support).fields.single { it.name == "d" && it.type == support }
    sink.methods.single { it.name == (if (renamed) "r" else "q") && it.returnType == support }.rewrite("""
        sget-object v0, ${unavailable.smaliReference}
        return-object v0
    """)
    val format = "Lcom/naver/prismplayer/media3/common/Format;"
    val mime = classDefBy(format).fields.single { it.name == "n" && it.type == "Ljava/lang/String;" }
    val formatSupport = sink.methods.single { it.name == (if (renamed) "z" else "y") && it.parameterTypeNames == listOf(format) }
    check(formatSupport.localRegisterCount >= 2)
    formatSupport.addInstructionsWithLabels(0, """
        const-string v0, "audio/raw"
        iget-object v1, p1, ${mime.smaliReference}
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-nez v0, :original
        const/4 v0, 0x0
        return v0
        :original
        nop
    """.trimIndent())
}
