package patches.deezer

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField

internal const val LYRIC_MISSING_COMPLETE = "Lnl/johninnl/deezer/lyrics/NativeMissingLyricsCompletion;"

/** Close only a current missing-data request, after the native success consumer had its chance. */
internal fun missingLyricsCompletionClass(): ImmutableClassDef {
    val methods = listOf(
        lyricMethod(LYRIC_MISSING_COMPLETE, "<init>", "V", listOf(LYRIC_MANAGER, LYRIC_TRACK), 0, """
            invoke-direct {p0}, Ljava/lang/Object;-><init>()V
            iput-object p1, p0, $LYRIC_MISSING_COMPLETE->manager:$LYRIC_MANAGER
            iput-object p2, p0, $LYRIC_MISSING_COMPLETE->track:$LYRIC_TRACK
            return-void
        """),
        lyricMethod(LYRIC_MISSING_COMPLETE, "run", "V", emptyList(), 3, """
            iget-object v0, p0, $LYRIC_MISSING_COMPLETE->manager:$LYRIC_MANAGER
            iget-object v1, v0, $LYRIC_MANAGER->IIllllIIIIllIl:$LYRIC_TRACK
            if-eqz v1, :done
            iget-object v2, p0, $LYRIC_MISSING_COMPLETE->track:$LYRIC_TRACK
            invoke-interface {v1, v2}, $LYRIC_TRACK->lIIIIIIIlllIllIl(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :done
            iget-object v1, v0, $LYRIC_MANAGER->IlIIlIIlIlIllI:$LYRIC_MODEL
            if-nez v1, :done
            const-string v1, "screen_missing_close"
            invoke-static {v1}, $LYRIC_DIAGNOSTICS->event(Ljava/lang/String;)V
            iget-object v0, v0, $LYRIC_MANAGER->lIIIIIlllIlIll:LlIIIlIIlIIIllI;
            const/4 v1, 0x0
            invoke-interface {v0, v1}, LlIIIlIIlIIIllI;->IIlllIIIIIIIIIlI(I)V
            :done
            return-void
        """),
    )
    fun field(name: String, type: String) = ImmutableField(LYRIC_MISSING_COMPLETE, name, type,
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, null, emptySet(), emptySet())
    return ImmutableClassDef(LYRIC_MISSING_COMPLETE, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        "Ljava/lang/Object;", listOf("LllIlIIlIllllIll;"), "NativeMissingLyricsCompletion", emptySet(),
        listOf(field("manager", LYRIC_MANAGER), field("track", LYRIC_TRACK)), methods)
}
