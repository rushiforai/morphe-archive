package patches.deezer

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField

internal const val LYRIC_ARTWORK_HOLDER = "LIIIIIIlllllIIllI;"
internal const val LYRIC_ARTWORK_ADAPTER = "LlllIIIllIIlll;"
internal const val LYRIC_ARTWORK = "Lnl/johninnl/deezer/lyrics/NativeArtworkLyricsBinding;"
internal const val LYRIC_PLAYABLE = "LIIIlIlIIlllIlIIl;"
internal const val LYRIC_DIAGNOSTICS = "Lnl/johninnl/deezer/lyrics/LyricsDiagnostics;"
internal const val LYRIC_HOLDER_FLOW = "morpheArtworkLyrics"

/** Bind the existing artwork pill; never change the track's persisted native lyrics flag. */
internal fun artworkLyricsFactoryMethods(): List<MutableMethod> = listOf(
    lyricMethod(LYRIC_FACTORY, "unbindArtwork", "V", listOf(LYRIC_ARTWORK_HOLDER), 2, """
        iget-object v0, p0, $LYRIC_ARTWORK_HOLDER->$LYRIC_HOLDER_FLOW:$LYRIC_FLOW
        const/4 v1, 0x0
        iput-object v1, p0, $LYRIC_ARTWORK_HOLDER->$LYRIC_HOLDER_FLOW:$LYRIC_FLOW
        if-eqz v0, :done
        invoke-virtual {v0}, $LYRIC_FLOW->dispose()V
        :done
        return-void
    """, true),
    lyricMethod(LYRIC_FACTORY, "bindArtwork", "V", listOf(LYRIC_ARTWORK_HOLDER), 3, """
        invoke-static {p0}, $LYRIC_FACTORY->unbindArtwork($LYRIC_ARTWORK_HOLDER)V
        iget-object v0, p0, $LYRIC_ARTWORK_HOLDER->IIIllIIIIlllIIll:$LYRIC_PLAYABLE
        if-eqz v0, :done
        invoke-interface {v0}, $LYRIC_PLAYABLE->IlIlIIIIlIlIllII()Z
        move-result v1
        if-nez v1, :done
        invoke-interface {v0}, $LYRIC_TRACK->IlIIIIIIIlllIIl()I
        move-result v1
        const/4 v2, 0x1
        if-eq v1, v2, :done
        invoke-static {v0}, $LYRIC_FACTORY->signature($LYRIC_TRACK)$LYRIC_SIGNATURE
        move-result-object v1
        if-eqz v1, :invalid
        const-string v0, "cover_lookup"
        invoke-static {v0}, $LYRIC_DIAGNOSTICS->event(Ljava/lang/String;)V
        new-instance v2, $LYRIC_ARTWORK
        invoke-direct {v2, p0, v1}, $LYRIC_ARTWORK-><init>($LYRIC_ARTWORK_HOLDER$LYRIC_SIGNATURE)V
        invoke-virtual {v2}, $LYRIC_ARTWORK->start()V
        return-void
        :invalid
        const-string v0, "cover_invalid_signature"
        invoke-static {v0}, $LYRIC_DIAGNOSTICS->event(Ljava/lang/String;)V
        :done
        return-void
    """, true),
)

internal fun artworkLyricsClass(): ImmutableClassDef {
    fun field(name: String, type: String) = ImmutableField(LYRIC_ARTWORK, name, type,
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, emptySet(), emptySet())
    val methods = mutableListOf(
        lyricMethod(LYRIC_ARTWORK, "<init>", "V", listOf(LYRIC_ARTWORK_HOLDER, LYRIC_SIGNATURE), 1, """
            invoke-direct {p0}, Ljava/lang/Object;-><init>()V
            iput-object p1, p0, $LYRIC_ARTWORK->holder:$LYRIC_ARTWORK_HOLDER
            iput-object p2, p0, $LYRIC_ARTWORK->signature:$LYRIC_SIGNATURE
            new-instance v0, $LYRIC_FLOW
            invoke-direct {v0, p2, p0}, $LYRIC_FLOW-><init>($LYRIC_SIGNATURE$LYRIC_OUTPUT)V
            iput-object v0, p0, $LYRIC_ARTWORK->flow:$LYRIC_FLOW
            iput-object v0, p1, $LYRIC_ARTWORK_HOLDER->$LYRIC_HOLDER_FLOW:$LYRIC_FLOW
            return-void
        """),
        lyricMethod(LYRIC_ARTWORK, "start", "V", emptyList(), 1, """
            iget-object v0, p0, $LYRIC_ARTWORK->flow:$LYRIC_FLOW
            invoke-virtual {v0}, $LYRIC_FLOW->nativeComplete()V
            return-void
        """),
        lyricMethod(LYRIC_ARTWORK, "isCurrent", "Z", emptyList(), 3, """
            iget-object v0, p0, $LYRIC_ARTWORK->holder:$LYRIC_ARTWORK_HOLDER
            iget-object v1, v0, $LYRIC_ARTWORK_HOLDER->$LYRIC_HOLDER_FLOW:$LYRIC_FLOW
            iget-object v2, p0, $LYRIC_ARTWORK->flow:$LYRIC_FLOW
            if-ne v1, v2, :stale
            iget-object v0, v0, $LYRIC_ARTWORK_HOLDER->IIIllIIIIlllIIll:$LYRIC_PLAYABLE
            if-eqz v0, :stale
            invoke-interface {v0}, $LYRIC_PLAYABLE->IlIlIIIIlIlIllII()Z
            move-result v1
            if-nez v1, :stale
            invoke-static {v0}, $LYRIC_FACTORY->signature($LYRIC_TRACK)$LYRIC_SIGNATURE
            move-result-object v0
            iget-object v1, p0, $LYRIC_ARTWORK->signature:$LYRIC_SIGNATURE
            invoke-virtual {v1, v0}, $LYRIC_SIGNATURE->equals(Ljava/lang/Object;)Z
            move-result v0
            return v0
            :stale
            const/4 v0, 0x0
            return v0
        """),
        lyricMethod(LYRIC_ARTWORK, "nativeUsable", "Z", listOf("Ljava/lang/Object;"), 1, """
            const/4 v0, 0x0
            return v0
        """),
        lyricMethod(LYRIC_ARTWORK, "fallbackValue", "Ljava/lang/Object;", listOf(LYRIC_PAYLOAD), 0, "return-object p1"),
        lyricMethod(LYRIC_ARTWORK, "value", "V", listOf("Ljava/lang/Object;"), 1, """
            iget-object v0, p0, $LYRIC_ARTWORK->holder:$LYRIC_ARTWORK_HOLDER
            iget-object v0, v0, $LYRIC_ARTWORK_HOLDER->lIlIIlIIlIlIllI:Landroid/widget/TextView;
            invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
            return-void
        """),
        lyricMethod(LYRIC_ARTWORK, "run", "V", emptyList(), 2, """
            invoke-virtual {p0}, $LYRIC_ARTWORK->isCurrent()Z
            move-result v0
            if-eqz v0, :done
            iget-object v0, p0, $LYRIC_ARTWORK->holder:$LYRIC_ARTWORK_HOLDER
            iget-object v0, v0, $LYRIC_ARTWORK_HOLDER->lIlIIlIIlIlIllI:Landroid/widget/TextView;
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
            iget-object v0, p0, $LYRIC_ARTWORK->holder:$LYRIC_ARTWORK_HOLDER
            iget-object v0, v0, $LYRIC_ARTWORK_HOLDER->IIIIIlIIIlIlllI:Landroid/widget/ImageView;
            const/4 v1, 0x1
            invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V
            const-string v0, "cover_ready"
            invoke-static {v0}, $LYRIC_DIAGNOSTICS->event(Ljava/lang/String;)V
            :done
            return-void
        """),
    )
    for ((name, params) in listOf("complete" to emptyList(), "error" to listOf("Ljava/lang/Throwable;"),
        "disposeNative" to emptyList())) methods += lyricMethod(LYRIC_ARTWORK, name, "V", params, 0, "return-void")
    return ImmutableClassDef(LYRIC_ARTWORK, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        "Ljava/lang/Object;", listOf(LYRIC_OUTPUT, "Ljava/lang/Runnable;"), "NativeArtworkLyricsBinding",
        emptySet(), listOf(field("holder", LYRIC_ARTWORK_HOLDER), field("signature", LYRIC_SIGNATURE), field("flow", LYRIC_FLOW)), methods)
}
