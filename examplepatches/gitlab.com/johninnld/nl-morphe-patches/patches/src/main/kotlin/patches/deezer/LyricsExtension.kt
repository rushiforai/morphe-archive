package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.InputStream

internal const val LYRIC_RX = "LIlIlIllIIllIl;"
internal const val LYRIC_RX_PARENT = "LIlIIIllIIllIIlIl;"
internal const val LYRIC_RX_SOURCE = "LIIlIIIIllIIlllll;"
internal const val LYRIC_RX_OBSERVER = "LlIlIlllllIllI;"
internal const val LYRIC_DISPOSABLE = "LlIllIlIIlIIlllI;"
internal const val LYRIC_TRACK = "LIlIIlllIIlIIllll;"
internal const val LYRIC_DTO = "LIIIIlllllllllllI;"
internal const val LYRIC_MODEL = "LIllIIllIIIIIll;"
internal const val LYRIC_LINE = "LIlIlIIIIIllIlllI;"
internal const val LYRIC_PAIR = "LlIllIlIllIIllll;"
internal const val LYRIC_ACTIVITY = "Lcom/deezer/android/ui/lyrics/LyricsActivity;"
internal const val LYRIC_VM = "LllIIlIIIIlllll;"
internal const val LYRIC_MANAGER = "LIllIIllIlIlIIIIl;"
internal const val LYRIC_FACTORY = "Lnl/johninnl/deezer/lyrics/NativeLyricsFactory;"
internal const val LYRIC_OBSERVABLE = "Lnl/johninnl/deezer/lyrics/NativeLyricsObservable;"
internal const val LYRIC_OBSERVER = "Lnl/johninnl/deezer/lyrics/NativeLyricsObserver;"
internal const val LYRIC_SIGNATURE = "Lnl/johninnl/deezer/lyrics/TrackSignature;"
internal const val LYRIC_PAYLOAD = "Lnl/johninnl/deezer/lyrics/LyricsPayload;"
internal const val LYRIC_FORMAT = "Lnl/johninnl/deezer/lyrics/DeezerLyricFormat;"
internal const val LYRIC_FLOW = "Lnl/johninnl/deezer/lyrics/LyricsFlow;"
internal const val LYRIC_OUTPUT = "Lnl/johninnl/deezer/lyrics/LyricsFlow\$Output;"

internal fun lyricMethod(owner: String, name: String, result: String, params: List<String>, locals: Int,
    code: String, static: Boolean = false, flags: Int = AccessFlags.PUBLIC.value): MutableMethod =
    ImmutableMethod(owner, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        flags or (if (static) AccessFlags.STATIC.value else 0) or
            (if (name == "<init>") AccessFlags.CONSTRUCTOR.value else 0), emptySet(), emptySet(),
        MutableMethodImplementation(locals + params.sumOf { if (it == "J" || it == "D") 2 else 1 } + if (static) 0 else 1))
        .toMutable().apply { addInstructions(0, code.trimIndent()) }

private fun lyricField(owner: String, name: String, type: String, final: Boolean = true) =
    ImmutableField(owner, name, type, AccessFlags.PRIVATE.value or
        (if (final) AccessFlags.FINAL.value else AccessFlags.VOLATILE.value),
        null, emptySet(), emptySet())

internal fun lyricsAdapterDex(): InputStream {
    val factory = listOf(
        lyricMethod(LYRIC_FACTORY, "signature", LYRIC_SIGNATURE, listOf(LYRIC_TRACK), 6, """
            if-eqz p0, :missing
            invoke-interface {p0}, $LYRIC_TRACK->getId()Ljava/lang/String;
            move-result-object v0
            invoke-interface {p0}, $LYRIC_TRACK->getTitle()Ljava/lang/String;
            move-result-object v1
            invoke-interface {p0}, $LYRIC_TRACK->IIIIIIIIIlIIllll()Ljava/lang/String;
            move-result-object v2
            invoke-interface {p0}, $LYRIC_TRACK->llIIlIIIllIll()Ljava/lang/String;
            move-result-object v3
            invoke-interface {p0}, $LYRIC_TRACK->getDuration()J
            move-result-wide v4
            invoke-static/range {v0 .. v5}, $LYRIC_SIGNATURE->fromMillis(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)$LYRIC_SIGNATURE
            move-result-object v0
            return-object v0
            :missing
            const/4 v0, 0x0
            return-object v0
        """, true),
        lyricMethod(LYRIC_FACTORY, "wrap", LYRIC_RX, listOf(LYRIC_RX, LYRIC_TRACK, "I"), 2, """
            const/4 v1, 0x0
            new-instance v0, $LYRIC_OBSERVABLE
            invoke-direct {v0, p0, p1, p2, v1}, $LYRIC_OBSERVABLE-><init>($LYRIC_RX${LYRIC_TRACK}I$LYRIC_MANAGER)V
            return-object v0
        """, true),
        lyricMethod(LYRIC_FACTORY, "wrapOwned", LYRIC_RX, listOf(LYRIC_RX, LYRIC_TRACK, "I", LYRIC_MANAGER), 1, """
            new-instance v0, $LYRIC_OBSERVABLE
            invoke-direct {v0, p0, p1, p2, p3}, $LYRIC_OBSERVABLE-><init>($LYRIC_RX${LYRIC_TRACK}I$LYRIC_MANAGER)V
            return-object v0
        """, true),
        lyricMethod(LYRIC_FACTORY, "loadMissing", "V", listOf(LYRIC_MANAGER, LYRIC_TRACK), 4, """
            iget-object v0, p0, $LYRIC_MANAGER->IlIIIlIIIIlllIl:LIIllIIIIIIIlIIll;
            invoke-static {v0}, LIIIIlIllllllll;->IIllIllIlllI($LYRIC_DISPOSABLE)V
            const/4 v0, 0x0
            iput-object v0, p0, $LYRIC_MANAGER->IlIIlIIlIlIllI:$LYRIC_MODEL
            const-string v0, "screen_missing_loading"
            invoke-static {v0}, $LYRIC_DIAGNOSTICS->event(Ljava/lang/String;)V
            iget-object v0, p0, $LYRIC_MANAGER->lIIIIIlllIlIll:LlIIIlIIlIIIllI;
            const/4 v1, 0x1
            invoke-interface {v0, v1}, LlIIIlIIlIIIllI;->IIlllIIIIIIIIIlI(I)V
            iget-object v0, p0, $LYRIC_MANAGER->lIlIIllIIlI:LIlIIIlIlIIIIII;
            sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            invoke-virtual {v0, v1}, LIlIIIlIlIIIIII;->onNext(Ljava/lang/Object;)V
            sget-object v0, LlllIllIIlIIlII;->IIllllllllIlll:LlllIllIIlIIlII;
            const/4 v1, 0x1
            new-instance v2, $LYRIC_OBSERVABLE
            invoke-direct {v2, v0, p1, v1, p0}, $LYRIC_OBSERVABLE-><init>($LYRIC_RX${LYRIC_TRACK}I$LYRIC_MANAGER)V
            invoke-static {}, LIIllIIllIllIIll;->IllIlIlIIlIllIll()LlIIlIIllIlIIllI;
            move-result-object v0
            invoke-virtual {v2, v0}, $LYRIC_RX->IIllIIIIIIIllIll(LIIIllIIlIllIlllI;)LIIIIIlIIllIIlI;
            move-result-object v2
            new-instance v0, LIIIIIlIlllIIIlIl;
            invoke-direct {v0, p0, v1}, LIIIIIlIlllIIIlIl;-><init>(${LYRIC_MANAGER}I)V
            new-instance v1, LIIIIlIIIIIlIllIl;
            const/4 v3, 0x3
            invoke-direct {v1, v3, p0, p1}, LIIIIlIIIIIlIllIl;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V
            new-instance v3, $LYRIC_MISSING_COMPLETE
            invoke-direct {v3, p0, p1}, $LYRIC_MISSING_COMPLETE-><init>($LYRIC_MANAGER$LYRIC_TRACK)V
            invoke-virtual {v2, v0, v1, v3}, $LYRIC_RX->IIIlIlIlIIlllll(LlIlllIIlIlIlI;LlIlllIIlIlIlI;LllIlIIlIllllIll;)$LYRIC_DISPOSABLE
            move-result-object v0
            check-cast v0, LIIllIIIIIIIlIIll;
            iput-object v0, p0, $LYRIC_MANAGER->IlIIIlIIIIlllIl:LIIllIIIIIIIlIIll;
            return-void
        """, true),
        lyricMethod(LYRIC_FACTORY, "legacy", LYRIC_DTO, listOf(LYRIC_PAYLOAD), 2, """
            new-instance v0, $LYRIC_DTO
            invoke-direct {v0}, Ljava/lang/Object;-><init>()V
            invoke-virtual {p0}, $LYRIC_PAYLOAD->providerIdentity()Ljava/lang/String;
            move-result-object v1
            iput-object v1, v0, $LYRIC_DTO->IIllllllllIlll:Ljava/lang/String;
            iget-object v1, p0, $LYRIC_PAYLOAD->plainText:Ljava/lang/String;
            iput-object v1, v0, $LYRIC_DTO->IIlllIlllIlll:Ljava/lang/String;
            invoke-static {p0}, $LYRIC_FORMAT->pipeSyncJson($LYRIC_PAYLOAD)Ljava/lang/String;
            move-result-object v1
            iput-object v1, v0, $LYRIC_DTO->IIIIIllIIIlIIllI:Ljava/lang/String;
            const-string v1, ""
            iput-object v1, v0, $LYRIC_DTO->IIIllIIIIlllIIll:Ljava/lang/String;
            iput-object v1, v0, $LYRIC_DTO->IIIIIlIIIlIlllI:Ljava/lang/String;
            return-object v0
        """, true),
        lyricMethod(LYRIC_FACTORY, "model", LYRIC_MODEL, listOf(LYRIC_PAYLOAD), 15, """
            invoke-static {p0}, $LYRIC_FORMAT->texts($LYRIC_PAYLOAD)[Ljava/lang/String;
            move-result-object v7
            invoke-static {p0}, $LYRIC_FORMAT->times($LYRIC_PAYLOAD)[I
            move-result-object v8
            new-instance v2, Ljava/util/ArrayList;
            invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
            array-length v10, v7
            const/4 v9, 0x0
            :line
            if-ge v9, v10, :model
            aget-object v12, v7, v9
            aget v14, v8, v9
            const/4 v13, 0x0
            new-instance v11, $LYRIC_LINE
            invoke-direct {v11, v12, v13, v14}, $LYRIC_LINE-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V
            invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            add-int/lit8 v9, v9, 0x1
            goto :line
            :model
            invoke-virtual/range {p0 .. p0}, $LYRIC_PAYLOAD->providerIdentity()Ljava/lang/String;
            move-result-object v1
            invoke-virtual/range {p0 .. p0}, $LYRIC_PAYLOAD->synchronizedLines()Z
            move-result v3
            xor-int/lit8 v3, v3, 0x1
            const-string v4, ""
            const-string v5, ""
            invoke-virtual/range {p0 .. p0}, $LYRIC_PAYLOAD->attribution()Ljava/lang/String;
            move-result-object v6
            new-instance v0, $LYRIC_MODEL
            invoke-direct/range {v0 .. v6}, $LYRIC_MODEL-><init>(Ljava/lang/String;Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            return-object v0
        """, true),
        lyricMethod(LYRIC_FACTORY, "fallbackModel", "Z", listOf(LYRIC_MODEL), 2, """
            if-eqz p0, :native
            iget-object v0, p0, $LYRIC_MODEL->IllIlIlIIlIllIll:Ljava/lang/String;
            if-eqz v0, :native
            const-string v1, "lrclib:"
            invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            return v0
            :native
            const/4 v0, 0x0
            return v0
        """, true),
        lyricMethod(LYRIC_FACTORY, "licence", "Ljava/lang/String;", listOf("Ljava/lang/String;", "Ljava/lang/String;"), 1, """
            if-eqz p0, :native
            const-string v0, "lrclib:"
            invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :native
            const-string v0, "Lyrics from LRCLIB · lrclib.net"
            return-object v0
            :native
            return-object p1
        """, true),
        lyricMethod(LYRIC_FACTORY, "mayReport", "Z", listOf(LYRIC_ACTIVITY), 1, """
            iget-object v0, p0, $LYRIC_ACTIVITY->IlIIlIIIllllIIl:$LYRIC_VM
            if-eqz v0, :native
            iget-object v0, v0, $LYRIC_VM->IIllIIIllllllI:$LYRIC_MODEL
            invoke-static {v0}, $LYRIC_FACTORY->fallbackModel($LYRIC_MODEL)Z
            move-result v0
            xor-int/lit8 v0, v0, 0x1
            return v0
            :native
            const/4 v0, 0x1
            return v0
        """, true),
        lyricMethod(LYRIC_FACTORY, "usable", "Z", listOf("Ljava/lang/Object;", "I"), 2, """
            if-eqz p0, :missing
            if-eqz p1, :legacy
            instance-of v0, p0, $LYRIC_PAIR
            if-eqz v0, :native
            check-cast p0, $LYRIC_PAIR
            iget-object v0, p0, $LYRIC_PAIR->llIIIIIIlIIIIll:Ljava/lang/Object;
            instance-of v1, v0, $LYRIC_MODEL
            if-eqz v1, :native
            check-cast v0, $LYRIC_MODEL
            iget-object v0, v0, $LYRIC_MODEL->llIIIIIIlIIIIll:Ljava/util/ArrayList;
            invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
            move-result-object v0
            :line
            invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
            move-result v1
            if-eqz v1, :missing
            invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v1
            check-cast v1, $LYRIC_LINE
            iget-object v1, v1, $LYRIC_LINE->IllIlIlIIlIllIll:Ljava/lang/CharSequence;
            invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
            move-result-object v1
            invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
            move-result-object v1
            invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
            move-result v1
            if-nez v1, :line
            goto :native
            :legacy
            instance-of v0, p0, $LYRIC_DTO
            if-eqz v0, :native
            check-cast p0, $LYRIC_DTO
            iget-object v0, p0, $LYRIC_DTO->IIlllIlllIlll:Ljava/lang/String;
            if-eqz v0, :synced
            invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
            move-result-object v0
            invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
            move-result v0
            if-eqz v0, :native
            :synced
            iget-object v0, p0, $LYRIC_DTO->IIIIIllIIIlIIllI:Ljava/lang/String;
            invoke-static {v0}, $LYRIC_FORMAT->usableNativeSync(Ljava/lang/String;)Z
            move-result v0
            return v0
            :native
            const/4 v0, 0x1
            return v0
            :missing
            const/4 v0, 0x0
            return v0
        """, true),
    ) + artworkLyricsFactoryMethods()
    val streamFields = listOf(lyricField(LYRIC_OBSERVABLE, "track", LYRIC_TRACK), lyricField(LYRIC_OBSERVABLE, "mode", "I"),
        lyricField(LYRIC_OBSERVABLE, "manager", LYRIC_MANAGER))
    val stream = listOf(
        lyricMethod(LYRIC_OBSERVABLE, "<init>", "V", listOf(LYRIC_RX, LYRIC_TRACK, "I", LYRIC_MANAGER), 0, """
            invoke-direct {p0, p1}, $LYRIC_RX_PARENT-><init>($LYRIC_RX_SOURCE)V
            iput-object p2, p0, $LYRIC_OBSERVABLE->track:$LYRIC_TRACK
            iput p3, p0, $LYRIC_OBSERVABLE->mode:I
            iput-object p4, p0, $LYRIC_OBSERVABLE->manager:$LYRIC_MANAGER
            return-void
        """),
        lyricMethod(LYRIC_OBSERVABLE, "llIlIllIIIl", "V", listOf(LYRIC_RX_OBSERVER), 4, """
            iget-object v1, p0, $LYRIC_OBSERVABLE->track:$LYRIC_TRACK
            iget v2, p0, $LYRIC_OBSERVABLE->mode:I
            iget-object v3, p0, $LYRIC_OBSERVABLE->manager:$LYRIC_MANAGER
            new-instance v0, $LYRIC_OBSERVER
            invoke-direct {v0, p1, v1, v2, v3}, $LYRIC_OBSERVER-><init>($LYRIC_RX_OBSERVER${LYRIC_TRACK}I$LYRIC_MANAGER)V
            invoke-interface {p1, v0}, $LYRIC_RX_OBSERVER->IllIlIlIIlIllIll($LYRIC_DISPOSABLE)V
            invoke-virtual {v0}, $LYRIC_OBSERVER->isDisposed()Z
            move-result v1
            if-nez v1, :done
            iget-object v1, p0, $LYRIC_RX_PARENT->IIllllllllIlll:$LYRIC_RX_SOURCE
            invoke-interface {v1, v0}, $LYRIC_RX_SOURCE->llIIIIIIlIIIIll($LYRIC_RX_OBSERVER)V
            :done
            return-void
        """),
    )
    val observerFields = listOf(lyricField(LYRIC_OBSERVER, "downstream", LYRIC_RX_OBSERVER),
        lyricField(LYRIC_OBSERVER, "track", LYRIC_TRACK), lyricField(LYRIC_OBSERVER, "mode", "I"),
        lyricField(LYRIC_OBSERVER, "manager", LYRIC_MANAGER),
        lyricField(LYRIC_OBSERVER, "signature", LYRIC_SIGNATURE), lyricField(LYRIC_OBSERVER, "flow", LYRIC_FLOW),
        lyricField(LYRIC_OBSERVER, "upstream", LYRIC_DISPOSABLE, false))
    val observer = mutableListOf(
        lyricMethod(LYRIC_OBSERVER, "<init>", "V", listOf(LYRIC_RX_OBSERVER, LYRIC_TRACK, "I", LYRIC_MANAGER), 2, """
            invoke-direct {p0}, Ljava/lang/Object;-><init>()V
            iput-object p1, p0, $LYRIC_OBSERVER->downstream:$LYRIC_RX_OBSERVER
            iput-object p2, p0, $LYRIC_OBSERVER->track:$LYRIC_TRACK
            iput p3, p0, $LYRIC_OBSERVER->mode:I
            iput-object p4, p0, $LYRIC_OBSERVER->manager:$LYRIC_MANAGER
            invoke-static {p2}, $LYRIC_FACTORY->signature($LYRIC_TRACK)$LYRIC_SIGNATURE
            move-result-object v0
            iput-object v0, p0, $LYRIC_OBSERVER->signature:$LYRIC_SIGNATURE
            new-instance v1, $LYRIC_FLOW
            invoke-direct {v1, v0, p0}, $LYRIC_FLOW-><init>($LYRIC_SIGNATURE$LYRIC_OUTPUT)V
            iput-object v1, p0, $LYRIC_OBSERVER->flow:$LYRIC_FLOW
            return-void
        """),
        lyricMethod(LYRIC_OBSERVER, "IllIlIlIIlIllIll", "V", listOf(LYRIC_DISPOSABLE), 1, """
            iput-object p1, p0, $LYRIC_OBSERVER->upstream:$LYRIC_DISPOSABLE
            invoke-virtual {p0}, $LYRIC_OBSERVER->isDisposed()Z
            move-result v0
            if-eqz v0, :done
            invoke-interface {p1}, $LYRIC_DISPOSABLE->dispose()V
            :done
            return-void
        """),
        lyricMethod(LYRIC_OBSERVER, "isCurrent", "Z", emptyList(), 2, """
            iget-object v0, p0, $LYRIC_OBSERVER->signature:$LYRIC_SIGNATURE
            if-eqz v0, :owner
            iget-object v1, p0, $LYRIC_OBSERVER->track:$LYRIC_TRACK
            invoke-static {v1}, $LYRIC_FACTORY->signature($LYRIC_TRACK)$LYRIC_SIGNATURE
            move-result-object v1
            invoke-virtual {v0, v1}, $LYRIC_SIGNATURE->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :stale
            :owner
            iget-object v0, p0, $LYRIC_OBSERVER->manager:$LYRIC_MANAGER
            if-eqz v0, :native
            iget-object v0, v0, $LYRIC_MANAGER->IIllllIIIIllIl:$LYRIC_TRACK
            if-eqz v0, :stale
            iget-object v1, p0, $LYRIC_OBSERVER->track:$LYRIC_TRACK
            invoke-interface {v0, v1}, $LYRIC_TRACK->lIIIIIIIlllIllIl(Ljava/lang/Object;)Z
            move-result v0
            return v0
            :stale
            const/4 v0, 0x0
            return v0
            :native
            const/4 v0, 0x1
            return v0
        """),
        lyricMethod(LYRIC_OBSERVER, "nativeUsable", "Z", listOf("Ljava/lang/Object;"), 1, """
            iget v0, p0, $LYRIC_OBSERVER->mode:I
            invoke-static {p1, v0}, $LYRIC_FACTORY->usable(Ljava/lang/Object;I)Z
            move-result v0
            return v0
        """),
        lyricMethod(LYRIC_OBSERVER, "fallbackValue", "Ljava/lang/Object;", listOf(LYRIC_PAYLOAD), 3, """
            iget v0, p0, $LYRIC_OBSERVER->mode:I
            if-nez v0, :screen
            invoke-static {p1}, $LYRIC_FACTORY->legacy($LYRIC_PAYLOAD)$LYRIC_DTO
            move-result-object v0
            return-object v0
            :screen
            invoke-static {p1}, $LYRIC_FACTORY->model($LYRIC_PAYLOAD)$LYRIC_MODEL
            move-result-object v1
            iget-object v2, p0, $LYRIC_OBSERVER->track:$LYRIC_TRACK
            new-instance v0, $LYRIC_PAIR
            invoke-direct {v0, v2, v1}, $LYRIC_PAIR-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
            return-object v0
        """),
        lyricMethod(LYRIC_OBSERVER, "disposeNative", "V", emptyList(), 1, """
            iget-object v0, p0, $LYRIC_OBSERVER->upstream:$LYRIC_DISPOSABLE
            if-eqz v0, :done
            invoke-interface {v0}, $LYRIC_DISPOSABLE->dispose()V
            :done
            return-void
        """),
    )
    fun delegate(name: String, target: String, result: String, params: List<String>, field: String, fieldType: String, iface: Boolean = false) {
        val call = if (iface) "invoke-interface" else "invoke-virtual"
        val arguments = if (params.isEmpty()) "v0" else "v0, p1"
        observer += lyricMethod(LYRIC_OBSERVER, name, result, params, 1, """
            iget-object v0, p0, $LYRIC_OBSERVER->$field:$fieldType
            $call {$arguments}, $fieldType->$target(${params.joinToString("")})$result
            ${if (result == "V") "return-void" else "move-result v0\nreturn v0"}
        """)
    }
    delegate("onNext", "nativeValue", "V", listOf("Ljava/lang/Object;"), "flow", LYRIC_FLOW)
    delegate("onComplete", "nativeComplete", "V", emptyList(), "flow", LYRIC_FLOW)
    delegate("onError", "nativeFailure", "V", listOf("Ljava/lang/Throwable;"), "flow", LYRIC_FLOW)
    delegate("dispose", "dispose", "V", emptyList(), "flow", LYRIC_FLOW)
    delegate("isDisposed", "isDisposed", "Z", emptyList(), "flow", LYRIC_FLOW)
    delegate("value", "onNext", "V", listOf("Ljava/lang/Object;"), "downstream", LYRIC_RX_OBSERVER, true)
    delegate("complete", "onComplete", "V", emptyList(), "downstream", LYRIC_RX_OBSERVER, true)
    delegate("error", "onError", "V", listOf("Ljava/lang/Throwable;"), "downstream", LYRIC_RX_OBSERVER, true)
    val flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
    val classes = listOf(
        ImmutableClassDef(LYRIC_FACTORY, flags, "Ljava/lang/Object;", emptyList(), "NativeLyricsFactory", emptySet(), emptyList(), factory),
        ImmutableClassDef(LYRIC_OBSERVABLE, flags, LYRIC_RX_PARENT, emptyList(), "NativeLyricsObservable", emptySet(), streamFields, stream),
        ImmutableClassDef(LYRIC_OBSERVER, flags, "Ljava/lang/Object;", listOf(LYRIC_RX_OBSERVER, LYRIC_DISPOSABLE, LYRIC_OUTPUT),
            "NativeLyricsObserver", emptySet(), observerFields, observer),
        artworkLyricsClass(),
        missingLyricsCompletionClass(),
    )
    val store = MemoryDataStore()
    return try { DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(26), classes)); store.data.inputStream() }
    finally { store.close() }
}

internal fun lyricsExtension(): InputStream {
    val source = checkNotNull(object {}.javaClass.getResourceAsStream("/extensions/deezer-lyrics.mpe")) { "Build the lyrics extension first" }
    val runtime = source.buffered().use { DexBackedDexFile.fromInputStream(null, it) }
    val adapter = lyricsAdapterDex().buffered().use { DexBackedDexFile.fromInputStream(null, it) }
    val classes = runtime.classes.toList() + adapter.classes.toList()
    check(classes.map { it.type }.distinct().size == classes.size && classes.all { it.type.startsWith("Lnl/johninnl/deezer/lyrics/") })
    val store = MemoryDataStore()
    return try { DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(26), classes)); store.data.inputStream() }
    finally { store.close() }
}
