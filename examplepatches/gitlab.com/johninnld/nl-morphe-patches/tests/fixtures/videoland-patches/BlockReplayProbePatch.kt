package patches.videolandatv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import patches.atv.exact

private const val BLOCK_REMOTE = "Lcom/bedrockstreaming/component/layout/data/core/remote/LayoutRemoteDataSource;"
private const val BLOCK_RUN = "Lnl/johninnl/patches/videolandtest/BlockReplay;"
private const val BLOCK_CONTINUATION = "Lnl/johninnl/patches/videolandtest/BlockReplayContinuation;"
private const val BLOCK_COMPLETION = "Lnl/johninnl/patches/videolandtest/BlockReplayCompletion;"

/** Generate only diagnostic classes. No target classes are compiled into this extension. */
private fun blockMethod(owner: String, name: String, params: List<String>, result: String,
    locals: Int, flags: Int, code: String): MutableMethod =
    MutableMethod(ImmutableMethod(owner, name,
        params.map { ImmutableMethodParameter(it, emptySet(), null) }, result, flags, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + params.size + if (flags and 8 == 0) 1 else 0,
            emptyList(), emptyList(), emptyList()))).apply {
        val source = code.trimIndent()
        addInstructionsWithLabels(0, source)
        if (source.contains(":probeTryStart")) {
            fun index(label: String) = source.lineSequence().takeWhile { it.trim() != label }
                .count { it.isNotBlank() && !it.trim().startsWith(":") && !it.trim().startsWith(".") }
            implementation!!.let { body ->
                body.addCatch("Ljava/lang/Exception;", body.newLabelForIndex(index(":probeTryStart")),
                    body.newLabelForIndex(index(":probeTryEnd")), body.newLabelForIndex(index(":probeError")))
            }
        }
    }

private fun blockReplayDex(blockId: String): ByteArrayInputStream {
    require(Regex("[A-Za-z0-9._:-]{1,200}").matches(blockId)) { "Provide a genuine block ID, without URL/path characters" }
    val constructor = blockMethod(BLOCK_RUN, "<init>", listOf(BLOCK_REMOTE, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
        "V", 0, 65537, """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        iput-object p1, p0, $BLOCK_RUN->remote:$BLOCK_REMOTE
        iput-object p2, p0, $BLOCK_RUN->section:Ljava/lang/String;
        iput-object p3, p0, $BLOCK_RUN->type:Ljava/lang/String;
        iput-object p4, p0, $BLOCK_RUN->id:Ljava/lang/String;
        return-void
    """)
    val initializer = blockMethod(BLOCK_RUN, "<clinit>", emptyList(), "V", 1, 65544, """
        new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;
        invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V
        sput-object v0, $BLOCK_RUN->started:Ljava/util/concurrent/atomic/AtomicBoolean;
        return-void
    """)
    val start = blockMethod(BLOCK_RUN, "maybeStart", listOf(BLOCK_REMOTE, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
        "V", 3, 9, """
        :probeTryStart
        if-eqz p0, :probeDone
        if-eqz p1, :probeDone
        invoke-virtual {p1}, Ljava/lang/String;->length()I
        move-result v0
        if-eqz v0, :probeDone
        const-string v0, "video"
        invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :probeDone
        const-string v0, "clip_99929"
        invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :probeDone
        sget-object v0, $BLOCK_RUN->started:Ljava/util/concurrent/atomic/AtomicBoolean;
        const/4 v1, 0x0
        const/4 v2, 0x1
        invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z
        move-result v0
        if-eqz v0, :probeDone
        new-instance v0, $BLOCK_RUN
        invoke-direct {v0, p0, p1, p2, p3}, $BLOCK_RUN-><init>(${BLOCK_REMOTE}Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
        new-instance v1, Ljava/lang/Thread;
        const-string v2, "MorpheBlockReplay"
        invoke-direct {v1, v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
        invoke-virtual {v1}, Ljava/lang/Thread;->start()V
        :probeTryEnd
        :probeDone
        return-void
        :probeError
        move-exception v0
        invoke-static {v0}, $BLOCK_COMPLETION->failure(Ljava/lang/Throwable;)V
        return-void
    """)
    val run = blockMethod(BLOCK_RUN, "run", emptyList(), "V", 9, 1, """
        :probeTryStart
        new-instance v0, $BLOCK_COMPLETION
        invoke-direct {v0}, $BLOCK_COMPLETION-><init>()V
        new-instance v7, $BLOCK_CONTINUATION
        invoke-direct {v7, v0}, $BLOCK_CONTINUATION-><init>(LZu/d;)V
        iget-object v1, p0, $BLOCK_RUN->remote:$BLOCK_REMOTE
        iget-object v2, p0, $BLOCK_RUN->section:Ljava/lang/String;
        iget-object v3, p0, $BLOCK_RUN->type:Ljava/lang/String;
        iget-object v4, p0, $BLOCK_RUN->id:Ljava/lang/String;
        const-string v5, "$blockId"
        new-instance v6, LR7/h;
        const/4 v8, 0x1
        invoke-direct {v6, v8, v8}, LR7/h;-><init>(II)V
        invoke-virtual/range {v1 .. v7}, $BLOCK_REMOTE->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LR7/h;Lbv/c;)Ljava/lang/Object;
        move-result-object v1
        sget-object v2, Lav/a;->N:Lav/a;
        if-eq v1, v2, :probeDone
        invoke-interface {v0, v1}, LZu/d;->resumeWith(Ljava/lang/Object;)V
        :probeTryEnd
        :probeDone
        return-void
        :probeError
        move-exception v0
        invoke-static {v0}, $BLOCK_COMPLETION->failure(Ljava/lang/Throwable;)V
        return-void
    """)
    val continuationConstructor = blockMethod(BLOCK_CONTINUATION, "<init>", listOf("LZu/d;"), "V", 0, 65537, """
        invoke-direct {p0, p1}, Lbv/c;-><init>(LZu/d;)V
        return-void
    """)
    val continuationResult = blockMethod(BLOCK_CONTINUATION, "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", 0, 1, """
        return-object p1
    """)
    val completionConstructor = blockMethod(BLOCK_COMPLETION, "<init>", emptyList(), "V", 0, 65537, """
        invoke-direct {p0}, Ljava/lang/Object;-><init>()V
        return-void
    """)
    val context = blockMethod(BLOCK_COMPLETION, "getContext", emptyList(), "LZu/i;", 1, 1, """
        sget-object v0, LZu/j;->N:LZu/j;
        return-object v0
    """)
    val completion = blockMethod(BLOCK_COMPLETION, "resumeWith", listOf("Ljava/lang/Object;"), "V", 2, 1, """
        if-eqz p1, :resultNull
        invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
        move-result-object v0
        invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
        move-result-object v0
        goto :resultLog
        :resultNull
        const-string v0, "null"
        :resultLog
        const-string v1, "MorpheBlockReplayResult"
        invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
        return-void
    """)
    val failure = blockMethod(BLOCK_COMPLETION, "failure", listOf("Ljava/lang/Throwable;"), "V", 2, 9, """
        invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
        move-result-object v0
        invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
        move-result-object v0
        const-string v1, "MorpheBlockReplayError"
        invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
        return-void
    """)
    val fields = listOf("remote" to BLOCK_REMOTE, "section" to "Ljava/lang/String;", "type" to "Ljava/lang/String;", "id" to "Ljava/lang/String;")
        .map { (name, type) -> ImmutableField(BLOCK_RUN, name, type, 18, null, emptySet(), emptySet()) } +
        ImmutableField(BLOCK_RUN, "started", "Ljava/util/concurrent/atomic/AtomicBoolean;", 10, null, emptySet(), emptySet())
    val classes = listOf(
        ImmutableClassDef(BLOCK_RUN, 17, "Ljava/lang/Object;", listOf("Ljava/lang/Runnable;"), "BlockReplayTestOnly", emptySet(), fields,
            listOf(initializer, constructor, start, run)),
        ImmutableClassDef(BLOCK_CONTINUATION, 17, "Lbv/c;", emptyList(), "BlockReplayTestOnly", emptySet(), emptyList(),
            listOf(continuationConstructor, continuationResult)),
        ImmutableClassDef(BLOCK_COMPLETION, 17, "Ljava/lang/Object;", listOf("LZu/d;"), "BlockReplayTestOnly", emptySet(), emptyList(),
            listOf(completionConstructor, context, completion, failure)),
    )
    val store = MemoryDataStore()
    DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(24), classes))
    return ByteArrayInputStream(store.data)
}

/** Explicit opt-in; excluded from the normal scoped bundle and never rewrites a request. */
@Suppress("unused")
val blockReplayProbePatch = bytecodePatch(name = "Replay supplied episode block (test only)", default = false) {
    compatibleWith(videolandTv)
    dependsOn(originalInput)
    val blockId = stringOption(key = "blockId", title = "Genuine episode block ID", required = true,
        description = "Copy an actual supplied block ID. No ID is inferred or guessed.",
        validator = { value -> value != null && Regex("[A-Za-z0-9._:-]{1,200}").matches(value) })
    extendWith { blockReplayDex(requireNotNull(blockId.value)) }
    execute {
        exact(BLOCK_REMOTE, "a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LR7/h;Lbv/c;)Ljava/lang/Object;", 15, 12)
        exact(BLOCK_REMOTE, "e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Integer;Ljava/lang/String;Lbv/c;)Ljava/lang/Object;", 17, 14)
            .addInstructionsWithLabels(0, """
                invoke-static {p0, p1, p2, p3}, $BLOCK_RUN->maybeStart(${BLOCK_REMOTE}Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            """.trimIndent())
    }
}
