package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val JUKEBOX = "Lcom/deezer/core/jukebox/JukeboxService;"
private const val SESSION = "Landroid/support/v4/media/session/MediaSessionCompat;"
private const val STATE = "Landroid/support/v4/media/session/PlaybackStateCompat;"
private const val PUBLISHER = "LIIlIlIlIlIlIIl;"
private const val CALLBACK = "LIIIlIlIIIIIl;"
private const val QUEUE = "LllIlIlIlIIlIlIl;"
private const val PLAYER = "LIIlIIIllIlllIlll;"
private const val TRACK = "LIIIlIlIIlllIlIIl;"
private const val BRIDGE = "Lnl/johninnl/deezer/queue/QueueSession;"
private const val HANDLES = "Lnl/johninnl/deezer/queue/QueueHandles;"
private const val NATIVE = "Lnl/johninnl/deezer/queue/NativeQueue;"
private const val SOURCE = "Lnl/johninnl/deezer/queue/QueueSource;"
private const val MANAGER = "LlIIIIIlllIllllll;"
private const val HOLDER = "LIlIIIIlIlIIIIII;"
private const val SOURCE_OWNER = "LIlIlIlIlIlIIIlI;"
private const val SOURCE_EPOCH = "Lnl/johninnl/deezer/queue/SourceEpoch;"
private const val MUTATION = "Lnl/johninnl/deezer/queue/QueueMutation;"
private const val PROVIDER = "Lcom/deezer/core/jukebox/provider/AudioQueueProvider;"
private const val NATIVE_PROVIDER = "Lnl/johninnl/deezer/queue/NativeProvider;"
private const val POLICY = "LlIIIlIlIlIIIII;"
private const val RIGHTS = "LIlIllIlIllIIllI;"

private fun queueHelper(owner: String, name: String, result: String, parameters: List<String>, locals: Int,
    code: String): MutableMethod = MutableMethod(ImmutableMethod(
    owner, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
    1, emptySet(), emptySet(), ImmutableMethodImplementation(
        locals + 1 + parameters.sumOf { if (it == "J") 2 else 1 }, emptyList(), emptyList(), emptyList(),
    ),
)).apply {
    addInstructions(0, code.trimIndent())
}

/** Bind only the original 9002703 DEX. Extension owns exported identity; native data remains native. */
internal fun wireDeezerQueueSelection(type: (String) -> MutableClass) {
    val service = type(JUKEBOX)
    val publisher = type(PUBLISHER)
    val callback = type(CALLBACK)
    val holder = type(HOLDER)
    val manager = type(MANAGER)
    val events = type("LIlIIIlIIIIIIlIll;")
    val mapper = type("LIIlIlIlllIIIIIlI;")
    val sourceOwner = type(SOURCE_OWNER)
    val provider = type(PROVIDER)
    check(service.methods.none { it.name == "dump" }) { "Native Deezer service dump changed" }
    service.methods.add(queueHelper(JUKEBOX, "dump", "V",
        listOf("Ljava/io/FileDescriptor;", "Ljava/io/PrintWriter;", "[Ljava/lang/String;"), 1, """
        invoke-super/range {p0 .. p3}, Landroid/app/Service;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
        iget-object v0, p0, $JUKEBOX->IlllIIllIIIIllIl:$PUBLISHER
        if-eqz v0, :done
        iget-object v0, v0, $PUBLISHER->morpheQueueSession:$BRIDGE
        if-eqz v0, :done
        invoke-virtual {v0, p2}, $BRIDGE->dump(Ljava/io/PrintWriter;)V
        :done
        return-void
    """))
    check(NATIVE !in service.interfaces && service.methods.none { it.name.startsWith("queue") })
    fun method(owner: MutableClass, name: String, vararg parameters: String) = owner.methods.single {
        it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters.toList()
    }
    fun helper(name: String, result: String, parameters: List<String>, locals: Int, code: String) {
        service.methods.add(queueHelper(JUKEBOX, name, result, parameters, locals, code))
    }
    val nativeSelect = method(callback, "onSkipToQueueItem", "J")
    check(nativeSelect.implementation!!.registerCount == 8 && nativeSelect.instructions.size == 33)
    val playFromId = method(callback, "onPlayFromMediaId", "Ljava/lang/String;", "Landroid/os/Bundle;")
    // MediaController may omit extras; the original callback writes callingPackage
    // into its Bundle immediately. Preserve that path with an empty Bundle.
    playFromId.addInstructionsWithLabels(0, """
        if-nez p2, :morphe_native_media_id
        new-instance p2, Landroid/os/Bundle;
        invoke-direct {p2}, Landroid/os/Bundle;-><init>()V
    """, ExternalLabel("morphe_native_media_id", playFromId.getInstruction(0)))
    val rawCommand = method(service, "lIIIIlllIlllll", "LIlIlllIlIIIlllI;")
    val publish = method(publisher, "IIlIlIlIlIllllll", STATE)
    check(publish.implementation!!.registerCount == 2 && publish.instructions.size == 6)
    val create = method(service, "onCreate")
    val destroy = method(service, "onDestroy")
    val source = method(mapper, "invoke", "Ljava/lang/Object;")
    check(source.instructions.size == 24 && source.implementation!!.registerCount == 5)
    val consume = method(manager, "lIIIIlllIlllll", "Z", "I", "LlIIlIllIIIllIII;", "Z", "I")
    val originalConsume = consume.instructions.toList()
    check(consume.implementation!!.registerCount == 24 &&
        (originalConsume[10] as? ReferenceInstruction)?.reference.toString() ==
        "$HOLDER->IllIlIlIIlIllIll(I)LIllIlIIllIlIlIlI;" && originalConsume[11].opcode == Opcode.MOVE_RESULT_OBJECT &&
        originalConsume[12].opcode == Opcode.IF_EQZ)
    val swap = method(holder, "onLoadComplete", "Landroid/content/Loader;", "Ljava/lang/Object;")
    val swapAt = swap.instructions.indexOfFirst {
        it.opcode == Opcode.IPUT_OBJECT && (it as? ReferenceInstruction)?.reference.toString() ==
            "$HOLDER->IllIlIlIIlIllIll:Landroid/database/Cursor;"
    }
    check(swapAt >= 0 && swap.implementation!!.registerCount >= 5)
    val sites = events.methods.flatMap { m -> m.instructions.toList().mapIndexedNotNull { i, instruction ->
        if ((instruction as? ReferenceInstruction)?.reference.toString() != "$SESSION->setQueue(Ljava/util/List;)V") null
        else Triple(m, i, instruction as FiveRegisterInstruction)
    } }
    check(sites.size == 1)
    sites.forEach { (m, i, call) ->
        val previous = m.instructions[i - 1]
        check(previous.opcode == Opcode.IGET_OBJECT && (previous as ReferenceInstruction).reference.toString() ==
            "$PUBLISHER->llIIIIIIlIIIIll:$SESSION" &&
            (previous as TwoRegisterInstruction).registerA == call.registerC && previous.registerB == call.registerC)
    }
    // Field descriptors are part of DEX lookup, including implemented-interface field types.
    check(service.fields.single { it.name == "IIIIlIIlllIll" }.type == "LIlIIIIIlllllIIlI;")
    val initializeAt = create.instructions.indexOfFirst {
        it.opcode == Opcode.IPUT_OBJECT && (it as? ReferenceInstruction)?.reference.toString() ==
            "$JUKEBOX->IlllIIllIIIIllIl:$PUBLISHER"
    }
    check(initializeAt >= 0)
    val sourceSwap = method(sourceOwner, "llIIIIIIlIIIIll", "Landroid/database/Cursor;")
    val sourceSwapAt = sourceSwap.instructions.indexOfFirst {
        it.opcode == Opcode.IPUT_OBJECT && (it as? ReferenceInstruction)?.reference.toString() ==
            "$SOURCE_OWNER->IIlllIlllIlll:Landroid/database/Cursor;"
    }
    check(sourceSwapAt >= 0)
    check(destroy.implementation!!.registerCount == 4)

    val uri = "Landroid/net/Uri;"
    val values = "Landroid/content/ContentValues;"
    val string = "Ljava/lang/String;"
    val bundle = "Landroid/os/Bundle;"
    val providerOperations = listOf(
        Triple("insert", uri, listOf(uri, values)),
        Triple("bulkInsert", "I", listOf(uri, "[$values")),
        Triple("delete", "I", listOf(uri, string, "[$string")),
        Triple("update", "I", listOf(uri, values, string, "[$string")),
        Triple("call", bundle, listOf(string, string, bundle)),
        Triple("query", "Landroid/database/Cursor;", listOf(uri, "[$string", string, "[$string", string)),
    )
    val providerBodies = providerOperations.map { (name, result, parameters) ->
        method(provider, name, *parameters.toTypedArray()).also { check(it.returnType == result) }
    }

    service.interfaces.add(NATIVE)
    holder.fields.add(MutableField(ImmutableField(HOLDER, "morpheQueueEpoch", "J", 65, null, emptySet(), emptySet())))
    sourceOwner.fields.add(MutableField(ImmutableField(SOURCE_OWNER, "morpheQueueEpoch", "J", 65, null, emptySet(), emptySet())))
    sourceOwner.interfaces.add(SOURCE_EPOCH)
    sourceOwner.methods.add(queueHelper(SOURCE_OWNER, "queueSourceVersion", "J", emptyList(), 2,
        "iget-wide v0, p0, $SOURCE_OWNER->morpheQueueEpoch:J\nreturn-wide v0"))
    sourceOwner.methods.add(queueHelper(SOURCE_OWNER, "queueSourceList", "Ljava/lang/Object;", emptyList(), 1,
        "invoke-virtual {p0}, $SOURCE_OWNER->IlIllIIIlIIIlIIl()Ljava/util/List;\nmove-result-object v0\nreturn-object v0"))
    sourceOwner.methods.add(queueHelper(SOURCE_OWNER, "queueSourceStamp", "J", emptyList(), 2, """
        iget-object v0, p0, $SOURCE_OWNER->IIlllIlllIlll:Landroid/database/Cursor;
        invoke-static {v0}, $MUTATION->cursorVersion(Ljava/lang/Object;)J
        move-result-wide v0
        return-wide v0
    """))
    // The original provider SQL and exception paths remain verbatim, behind typed wrappers.
    // Query stamps travel through ContentResolver cursor extras; no row or media data changes.
    provider.interfaces.add(NATIVE_PROVIDER)
    providerOperations.zip(providerBodies).forEach { (spec, raw) ->
        val (name, result, parameters) = spec
        val suffix = name.replaceFirstChar(Char::uppercaseChar)
        raw.name = "morpheQueueNative$suffix"
        val args = parameters.joinToString("")
        val operation = if (result == "I") "move-result v0\nreturn v0" else "move-result-object v0\nreturn-object v0"
        provider.methods.add(queueHelper(PROVIDER, name, result, parameters, 0, """
            invoke-static/range {p0 .. p${parameters.size}}, $MUTATION->$name($NATIVE_PROVIDER$args)$result
            $operation
        """))
        provider.methods.add(queueHelper(PROVIDER, "queue$suffix", result, parameters, 0, """
            invoke-virtual/range {p0 .. p${parameters.size}}, $PROVIDER->morpheQueueNative$suffix($args)$result
            $operation
        """))
    }
    publisher.fields.add(MutableField(ImmutableField(PUBLISHER, "morpheQueueSession", BRIDGE, 1, null, emptySet(), emptySet())))
    // Capture actual producing list and each native occurrence BEFORE it is mapped to a QueueItem.
    source.replaceInstruction(6, "move-object v0, v2")
    source.replaceInstruction(10, "invoke-virtual {v0, v4}, $SOURCE->begin(Ljava/lang/Object;)V")
    source.replaceInstruction(23, "invoke-virtual {v0}, $SOURCE->seal()V")
    source.addInstructions(24, "return-object v0")
    source.addInstructions(18, "invoke-virtual {v0, v1}, $SOURCE->capture(Ljava/lang/Object;)V")
    source.addInstructions(2, """
        new-instance v2, $SOURCE
        move-object v1, p1
        check-cast v1, $SOURCE_EPOCH
        invoke-direct {v2, v1}, $SOURCE-><init>($SOURCE_EPOCH)V
    """)

    // No shared cursor reads are altered. This is the one authoritative target-row use,
    // before it becomes current playback data. Incidental/neighbor/native reads stay native.
    consume.addInstructionsWithLabels(12, """
        invoke-static {v3, v1}, $HANDLES->consume(Ljava/lang/Object;Ljava/lang/Object;)Z
        move-result v4
        if-nez v4, :morphe_queue_native_row
        return-void
    """, ExternalLabel("morphe_queue_native_row", consume.getInstruction(12)))
    // Native swap holds its cursor monitor. Count EVERY assignment, including A -> B -> A.
    // Use a no-argument holder helper so native live registers are never borrowed.
    holder.methods.add(queueHelper(HOLDER, "morpheQueueAdvance", "V", emptyList(), 4, """
        iget-wide v0, p0, $HOLDER->morpheQueueEpoch:J
        const-wide/16 v2, 0x1
        add-long/2addr v0, v2
        iput-wide v0, p0, $HOLDER->morpheQueueEpoch:J
        return-void
    """))
    val swapInstruction = swap.instructions[swapAt] as TwoRegisterInstruction
    swap.addInstructions(swapAt, "invoke-virtual {v${swapInstruction.registerB}}, $HOLDER->morpheQueueAdvance()V")
    sourceOwner.methods.add(queueHelper(SOURCE_OWNER, "morpheQueueAdvance", "V", emptyList(), 4, """
        iget-wide v0, p0, $SOURCE_OWNER->morpheQueueEpoch:J
        const-wide/16 v2, 0x1
        add-long/2addr v0, v2
        iput-wide v0, p0, $SOURCE_OWNER->morpheQueueEpoch:J
        return-void
    """))
    val sourceSwapInstruction = sourceSwap.instructions[sourceSwapAt] as TwoRegisterInstruction
    sourceSwap.addInstructions(sourceSwapAt,
        "invoke-virtual {v${sourceSwapInstruction.registerB}}, $SOURCE_OWNER->morpheQueueAdvance()V")

    nativeSelect.name = "morpheQueueNativeSelect"
    check((nativeSelect.instructions[31] as? ReferenceInstruction)?.reference.toString() ==
        "$JUKEBOX->lIIIIlllIlllll(LIlIlllIlIIIlllI;)V")
    nativeSelect.replaceInstruction(31,
        "invoke-static {v0, v5}, $HANDLES->selectedCommand(${NATIVE}Ljava/lang/Object;)V")
    callback.methods.add(queueHelper(CALLBACK, "onSkipToQueueItem", "V", listOf("J"), 2, """
        iget-object v0, p0, $CALLBACK->llIIIIIIlIIIIll:Ljava/lang/ref/WeakReference;
        invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
        move-result-object v0
        if-eqz v0, :done
        check-cast v0, $JUKEBOX
        iget-object v0, v0, $JUKEBOX->IlllIIllIIIIllIl:$PUBLISHER
        if-eqz v0, :done
        iget-object v0, v0, $PUBLISHER->morpheQueueSession:$BRIDGE
        if-eqz v0, :done
        invoke-virtual {v0, p1, p2}, $BRIDGE->select(J)V
        :done
        return-void
    """))
    rawCommand.name = "morpheQueueNativeCommand"
    service.methods.add(queueHelper(JUKEBOX, "lIIIIlllIlllll", "V", listOf("LIlIlllIlIIIlllI;"), 0, """
        invoke-static {p0, p1}, $HANDLES->command(${NATIVE}Ljava/lang/Object;)V
        return-void
    """))
    helper("queueCommand", "V", listOf("Ljava/lang/Object;"), 0, """
        check-cast p1, LIlIlllIlIIIlllI;
        invoke-virtual {p0, p1}, $JUKEBOX->morpheQueueNativeCommand(LIlIlllIlIIIlllI;)V
        return-void
    """)
    helper("queueDispatch", "V", listOf("J"), 1, """
        iget-object v0, p0, $JUKEBOX->llllIIlIIIIIllI:$CALLBACK
        invoke-virtual {v0, p1, p2}, $CALLBACK->morpheQueueNativeSelect(J)V
        return-void
    """)
    val getHolder = """
        iget-object v0, p0, $JUKEBOX->IIIIlIIlllIll:LIlIIIIIlllllIIlI;
        check-cast v0, LIIlIlIIlIlIII;
        iget-object v0, v0, LIIlIlIIlIlIII;->IIllllllllIlll:$MANAGER
        iget-object v0, v0, $MANAGER->IIllllllllIlll:$HOLDER
    """.trimIndent()
    helper("queueHolder", "Ljava/lang/Object;", emptyList(), 1, "$getHolder\nreturn-object v0")
    helper("queueLock", "Ljava/lang/Object;", emptyList(), 1, "$getHolder\niget-object v0, v0, $HOLDER->IlIIIlIIIIlllIl:Ljava/lang/Object;\nreturn-object v0")
    helper("queueCursor", "Ljava/lang/Object;", emptyList(), 1, "$getHolder\niget-object v0, v0, $HOLDER->IllIlIlIIlIllIll:Landroid/database/Cursor;\nreturn-object v0")
    helper("queueCursorStamp", "J", emptyList(), 2, """
        $getHolder
        iget-object v0, v0, $HOLDER->IllIlIlIIlIllIll:Landroid/database/Cursor;
        invoke-static {v0}, $MUTATION->cursorVersion(Ljava/lang/Object;)J
        move-result-wide v0
        return-wide v0
    """.trimIndent())
    helper("queueEpoch", "J", emptyList(), 2, "$getHolder\niget-wide v0, v0, $HOLDER->morpheQueueEpoch:J\nreturn-wide v0")
    helper("queueItem", "Ljava/lang/Object;", listOf("I"), 1, "$getHolder\ninvoke-virtual {v0, p1}, $HOLDER->IllIlIlIIlIllIll(I)LIllIlIIllIlIlIlI;\nmove-result-object v0\nreturn-object v0")
    helper("queuePosition", "I", listOf("Ljava/lang/Object;"), 1, """
        check-cast p1, $TRACK
        invoke-interface {p1}, $TRACK->getPosition()I
        move-result v0
        return v0
    """)
    helper("queueSame", "Z", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), 2, """
        const/4 v0, 0x0
        if-eqz p1, :done
        if-eqz p2, :done
        check-cast p1, $TRACK
        check-cast p2, $TRACK
        invoke-interface {p1}, $TRACK->getPosition()I
        move-result v0
        invoke-interface {p2}, $TRACK->getPosition()I
        move-result v1
        if-eq v0, v1, :native_identity
        const/4 v0, 0x0
        return v0
        :native_identity
        invoke-interface {p1, p2}, $TRACK->IllllIIIIIllIlIl($TRACK)Z
        move-result v0
        :done
        return v0
    """)
    helper("queueRawId", "J", listOf("Ljava/lang/Object;"), 2, """
        check-cast p1, $TRACK
        invoke-static {p1}, LIIIllIlllllIlll;->lllIllIlllllIIl($TRACK)J
        move-result-wide v0
        return-wide v0
    """)
    helper("queueSize", "I", emptyList(), 2, """
        $getHolder
        iget-object v0, v0, $HOLDER->IllIlIlIIlIllIll:Landroid/database/Cursor;
        if-eqz v0, :empty
        invoke-interface {v0}, Landroid/database/Cursor;->getCount()I
        move-result v0
        return v0
        :empty
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    helper("queueCurrent", "Ljava/lang/Object;", emptyList(), 1, """
        iget-object v0, p0, $JUKEBOX->IIIIlIIlllIll:LIlIIIIIlllllIIlI;
        invoke-interface {v0}, $PLAYER->IIlIlIlIlIllllll()$TRACK
        move-result-object v0
        return-object v0
    """)
    val getSourceOwner = """
        iget-object v0, p0, $JUKEBOX->IIlllIllIlIIlII:$QUEUE
        check-cast v0, LIIllIllIllI;
        iget-object v0, v0, LIIllIllIllI;->IIIIIllIlIIllll:LIIIlIIllllIIlIl;
        iget-object v0, v0, LIIIlIIllllIIlIl;->IIIllIIIIlllIIll:Ljava/lang/Object;
        check-cast v0, LllllllIlIlII;
        iget-object v0, v0, LllllllIlIlII;->llIllllIllIIlIl:LIlIlIlIlIlIIIlI;
    """.trimIndent()
    helper("queueSourceEpoch", "J", emptyList(), 2,
        "$getSourceOwner\niget-wide v0, v0, $SOURCE_OWNER->morpheQueueEpoch:J\nreturn-wide v0")
    helper("queueSourceStamp", "J", emptyList(), 2, """
        $getSourceOwner
        invoke-virtual {v0}, $SOURCE_OWNER->queueSourceStamp()J
        move-result-wide v0
        return-wide v0
    """.trimIndent())
    helper("queueSource", "Ljava/lang/Object;", emptyList(), 1, """
        $getSourceOwner
        invoke-virtual {v0}, $SOURCE_OWNER->IlIllIIIlIIIlIIl()Ljava/util/List;
        move-result-object v0
        return-object v0
    """)
    // Existing GoToTrack account/context masks; no eligibility result is forced.
    helper("queueAllowed", "Z", emptyList(), 4, QUEUE_RIGHTS)

    publish.name = "morpheQueueRawState"
    publisher.methods.add(queueHelper(PUBLISHER, "IIlIlIlIlIllllll", "V", listOf(STATE), 1, """
        iget-object v0, p0, $PUBLISHER->morpheQueueSession:$BRIDGE
        if-eqz v0, :native_state
        invoke-virtual {v0, p1}, $BRIDGE->state($STATE)$STATE
        move-result-object p1
        :native_state
        invoke-virtual {p0, p1}, $PUBLISHER->morpheQueueRawState($STATE)V
        return-void
    """))
    publisher.methods.add(queueHelper(PUBLISHER, "morpheQueuePublish", "V", listOf("Ljava/util/List;"), 1, """
        iget-object v0, p0, $PUBLISHER->morpheQueueSession:$BRIDGE
        if-eqz v0, :native_queue
        invoke-virtual {v0, p1}, $BRIDGE->publish(Ljava/util/List;)V
        return-void
        :native_queue
        iget-object v0, p0, $PUBLISHER->llIIIIIIlIIIIll:$SESSION
        invoke-virtual {v0, p1}, $SESSION->setQueue(Ljava/util/List;)V
        return-void
    """))
    sites.forEach { (m, i, call) ->
        m.replaceInstruction(i - 1, "nop")
        m.replaceInstruction(i, "invoke-virtual {v${call.registerC}, v${call.registerD}}, $PUBLISHER->morpheQueuePublish(Ljava/util/List;)V")
    }
    service.methods.add(queueHelper(JUKEBOX, "morpheQueueInitialize", "V", emptyList(), 3, """
        new-instance v0, $BRIDGE
        iget-object v2, p0, $JUKEBOX->lIIlllIlIIlllI:$SESSION
        invoke-direct {v0, p0, v2}, $BRIDGE-><init>($NATIVE$SESSION)V
        iget-object v1, p0, $JUKEBOX->IlllIIllIIIIllIl:$PUBLISHER
        iput-object v0, v1, $PUBLISHER->morpheQueueSession:$BRIDGE
        return-void
    """))
    create.addInstructions(initializeAt + 1, "invoke-virtual/range {p0 .. p0}, $JUKEBOX->morpheQueueInitialize()V")
    destroy.addInstructions(0, """
        iget-object v0, p0, $JUKEBOX->IlllIIllIIIIllIl:$PUBLISHER
        if-eqz v0, :morphe_queue_retired
        iget-object v1, v0, $PUBLISHER->morpheQueueSession:$BRIDGE
        if-eqz v1, :morphe_queue_clear
        invoke-virtual {v1}, $BRIDGE->retire()V
        :morphe_queue_clear
        const/4 v1, 0x0
        iput-object v1, v0, $PUBLISHER->morpheQueueSession:$BRIDGE
        :morphe_queue_retired
        nop
    """)
}

@Suppress("unused")
val deezerQueueItemSelection = bytecodePatch(
    name = "Enable queue item selection",
    description = "Publishes provider-owned occurrence handles for ordinary media-session Up next " +
        "selection. Retires changed queues and preserves Deezer's native account checks, queue order " +
        "and selection dispatch. Grants no playback rights.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase)
    extendWith("extensions/deezer-queue.mpe")
    execute { wireDeezerQueueSelection { mutableClassDefBy(it) } }
}


private val QUEUE_RIGHTS = """
        iget-object v0, p0, $JUKEBOX->IIIIlIIlllIll:LIlIIIIIlllllIIlI;
        if-eqz v0, :deny
        invoke-interface {v0}, $PLAYER->IIlllIIIIIIIIIlI()Z
        move-result v1
        if-nez v1, :deny
        invoke-interface {v0}, $PLAYER->IIlIlIlIlIllllll()$TRACK
        move-result-object v0
        if-eqz v0, :deny
        invoke-interface {v0}, $TRACK->lIIlIlllIlllIl()Z
        move-result v1
        if-nez v1, :deny
        iget-object v1, p0, $JUKEBOX->lIIlIlllIlllIl:$POLICY
        if-eqz v1, :deny
        invoke-virtual {v1, v0}, $POLICY->IIllllIIIIIlIIl($TRACK)I
        move-result v2
        iget-object v1, v1, $POLICY->IIllllIIIIIlIIl:$RIGHTS
        if-eqz v1, :deny
        iget v1, v1, $RIGHTS->IIllllllllIlll:I
        if-eqz v2, :context_zero
        const/4 v3, 0x1
        if-eq v2, v3, :context_one
        const/4 v3, 0x2
        if-eq v2, v3, :context_other
        const/4 v3, 0x3
        if-ne v2, v3, :deny
        :context_other
        and-int/lit8 v1, v1, 0x8
        goto :rights
        :context_one
        and-int/lit8 v1, v1, 0x2
        goto :rights
        :context_zero
        and-int/lit8 v1, v1, 0x1
        :rights
        if-eqz v1, :deny
        const/4 v0, 0x1
        return v0
        :deny
        const/4 v0, 0x0
        return v0
""".trimIndent()
