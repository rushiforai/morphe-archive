package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val SEARCH_REQUEST = "LlIlIlllIllIIllI;"

private fun searchMethod(name: String, parameter: String, registers: Int, body: String) =
    MutableMethod(ImmutableMethod(
        SEARCH_REQUEST, name, listOf(ImmutableMethodParameter(parameter, emptySet(), null)),
        "Ljava/lang/Object;", AccessFlags.PUBLIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList()),
    )).apply { addInstructionsWithLabels(0, body.trimIndent()) }

internal val exactSearchTrackPatch = patch {
    compatibleWith(deezerCompatibility)
    execute {
        val request = mutableClassDefBy(SEARCH_REQUEST)
        check(request.interfaces.add("LIIlllIIlIIIIl;"))
        // The dispatcher can reuse an older equal in-flight action for A -> B -> A,
        // leaving B running. Search taps must dispatch anew and cancel the pending job.
        mutableClassDefBy("LIlllIIllIIIIIllI;").methods.single {
            it.name == "lIIIIIlllllIIIII" && it.parameterTypes == listOf("LlIIIIlIlIllIIII;")
        }.addInstructionsWithLabels(0, """
            iget-object v0, p1, LlIIIIlIlIllIIII;->IllIlllIIIllIlII:LlIlIllIIlIlIlll;
            sget-object v1, LlIlIllIIlIlIlll;->IlIlIIIllIIIllll:LlIlIllIIlIlIlll;
            if-eq v0, v1, :fresh
            sget-object v1, LlIlIllIIlIlIlll;->IlIIlllIIlIlIlIl:LlIlIllIIlIlIlll;
            if-eq v0, v1, :fresh
            sget-object v1, LlIlIllIIlIlIlll;->lIlIllIIll:LlIlIllIIlIlIlll;
            if-ne v0, v1, :keep_pending
            :fresh
            iget-object v0, p0, LIlllIIllIIIIIllI;->lIIIIIlllllIIIII:Lcom/deezer/app/libraries/data/player/actions/jukebox/lIIIIIlllllIIIII;
            const/4 v1, 0x0
            iput-object v1, v0, Lcom/deezer/app/libraries/data/player/actions/jukebox/lIIIIIlllllIIIII;->IIllIIllIlIII:LIIIlIIIIl;
            :keep_pending
            nop
        """.trimIndent())
        // Keep the selected ID on the request instance, including across suspension.
        // A search tap must fetch that ID, rather than song.getSearchTrackMix.
        request.methods.add(searchMethod("morpheFetchSelectedTrack", "LIIIllIlIIIIIIll;", 9, """
            iget-object v0, p0, LlIlIlllIllIIllI;->lIIIlIlIIIIIlII:LlIIIIlIlIllIIII;
            iget-object v0, v0, LlIIIIlIlIllIIII;->lIIIIIlllllIIIII:Ljava/lang/String;
            filled-new-array {v0}, [Ljava/lang/String;
            move-result-object v0
            iget-object v1, p0, LlIlIlllIllIIllI;->IIllIIlIIIlIIlll:LIIIIlIIlllIIlll;
            check-cast v1, LIIIIIlllllIIIlII;
            iget-object v2, v1, LIIIIIlllllIIIlII;->IllIlllIIIllIlII:LIIIIIIlIlIllll;
            iget-object v2, v2, LIllIllIlIllIlIll;->lIIIIIlllllIIIII:LIIllIIlIIlIIl;
            invoke-interface {v2, v0}, LIIllIIlIIlIIl;->IIIIlIlIIIIlIIll([Ljava/lang/String;)LIlllIlIlIlIlllII;
            move-result-object v0
            iget-object v1, v1, LIIIIIlllllIIIlII;->lIIIIIlllllIIIII:LIIIIlIIIlllII;
            iget-object v2, v1, LIIIIlIIIlllII;->lIIIIIlllllIIIII:LIIllllIllIllllll;
            iget-object v1, v1, LIIIIlIIIlllII;->lIIlIIlIlllllII:LlIIlIllIlIlIllI;
            const-class v3, LlIlIIIIIIlII;
            new-instance v4, LIIIlIIIllIIllllI;
            const/4 v5, 0x1
            invoke-direct {v4, v3, v5}, LIIIlIIIllIIllllI;-><init>(Ljava/lang/Object;I)V
            new-instance v3, LIIIlIIIllIIllllI;
            const/4 v5, 0x0
            invoke-direct {v3, v4, v5}, LIIIlIIIllIIllllI;-><init>(Ljava/lang/Object;I)V
            iget-object v1, v1, LlIIlIllIlIlIllI;->lIIlIlIllIl:Ljava/lang/Object;
            check-cast v1, LllllllIlIIIIlI;
            invoke-static {v3, v1}, LIlIIIIllIllIIIlI;->IIllIlIIIlIl(LIlIIlllllIIlI;LllllllIlIIIIlI;)LIIIlllIllllIIIll;
            move-result-object v1
            new-instance v3, LIllIllIIllIII;
            invoke-direct {v3, v1, v0}, LIllIllIIllIII;-><init>(LIlIIlllllIIlI;LIlllIlIlIlIlllII;)V
            invoke-static {}, LIIlllllllIlllI;->lIIIlIlIIIIIlII()LIIlllllllIlllI;
            move-result-object v0
            iput-object v0, v3, LIllIllIIllIII;->IIllIIlIIIlIIlll:LIIlllllllIlllI;
            invoke-virtual {v3}, LIllIllIIllIII;->build()LIlIlIlIIIIlIlIlI;
            move-result-object v0
            invoke-virtual {v2, v0}, LIIllllIllIllllll;->lIIIIIlllllIIIII(LIlIlIlIIIIlIlIlI;)LIllIIIIlllIlIll;
            move-result-object v0
            new-instance v1, LllIIIIlIIIlIll;
            const/16 v2, 0xa
            invoke-direct {v1, v2}, LllIIIIlIIIlIll;-><init>(I)V
            invoke-virtual {v0, v1}, LllIIIIlllllIIII;->IIIlIIIIIIIlIl(LIlIIIlllllIIllI;)LllIIIIlllllIIII;
            move-result-object v0
            invoke-virtual {v0, p0}, LllIIIIlllllIIII;->IlIIlIIlIlI(LIIlllIIlIIIIl;)LIllIIIIlllIlIll;
            move-result-object v0
            sget-object v1, LIIIIlIlIllIIIl;->lIIlIlIllIl:LIIIIlIlIllIIIl;
            invoke-static {v0, v1, p1}, LlIIIIIIlIIlIIl;->llIlIllIllIIlll(LIIllllIIlllIIIII;LIIIIlIlIllIIIl;LIIIllIlIIIIIIll;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """))
        request.methods.add(searchMethod("apply", "Ljava/lang/Object;", 12, """
            instance-of v0, p1, LIllIlIlIIIIllllI;
            if-nez v0, :success
            return-object p1
            :success
            check-cast p1, LIllIlIlIIIIllllI;
            iget-object v0, p1, LIllIlIlIIIIllllI;->IllIlllIIIllIlII:Ljava/lang/Object;
            check-cast v0, Ljava/lang/Iterable;
            invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
            move-result-object v0
            iget-object v1, p0, LlIlIlllIllIIllI;->lIIIlIlIIIIIlII:LlIIIIlIlIllIIII;
            iget-object v1, v1, LlIIIIlIlIllIIII;->lIIIIIlllllIIIII:Ljava/lang/String;
            :next
            invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :missing
            invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            check-cast v2, LlIlIIIIIIlII;
            iget-object v3, v2, LlIllllIIlIllllI;->lIlIIIlIllI:Ljava/lang/String;
            invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v3
            if-eqz v3, :next
            iget-object v0, p0, LlIlIlllIllIIllI;->IIlIIIlIIIllllll:LIlllIlllllllll;
            iget-object v1, v0, LIlllIlllllllll;->lIIIIIlllllIIIII:LIIlIIlllIIII;
            invoke-virtual {v1, v2}, LIIlIIlllIIII;->lIIIlIlIIIIIlII(LlIllllIIlIllllI;)LlIIIIlIIIIIIlIIl;
            move-result-object v1
            iget-object v0, v0, LIlllIlllllllll;->IllIlllIIIllIlII:Landroid/content/Context;
            invoke-static {v0, v2, v1}, LIllIIIIllIIIIll;->IIIlIIIIIIIlIl(Landroid/content/Context;LlIllllIIlIllllI;LIllIIIIIlIlIlIlI;)V
            new-instance v0, LIIIlIIIIllllll;
            const/4 v3, 0x0
            invoke-direct {v0, v1, v3}, LIIIlIIIIllllll;-><init>(LIllIIIIIlIlIlIlI;Lorg/json/JSONObject;)V
            iget-object v2, v2, LlIlIIIIIIlII;->IIlIIIllIIIllllI:Ljava/lang/String;
            if-eqz v2, :mapped
            new-instance v1, Lorg/json/JSONObject;
            invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
            iput-object v1, v0, LIIIlIIIIllllll;->lIIlIlIllIl:Lorg/json/JSONObject;
            :mapped
            invoke-static {v0}, LIlIllIllIlIll;->lIIIIIlllllIIIII(LlIIllIIlIlIlIll;)LlIlIlIlllIlI;
            move-result-object v0
            invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
            move-result-object v3
            new-instance v2, LlIllllIIllIllI;
            const/4 v4, 0x0
            const/4 v5, 0x0
            const/4 v6, 0x1
            const/4 v7, 0x0
            const/4 v8, 0x0
            invoke-direct/range {v2 .. v8}, LlIllllIIllIllI;-><init>(Ljava/util/List;Ljava/util/List;ZZZI)V
            new-instance v0, LIllIlIlIIIIllllI;
            invoke-direct {v0, v2}, LIllIlIlIIIIllllI;-><init>(Ljava/lang/Object;)V
            return-object v0
            :missing
            new-instance v0, Ljava/util/NoSuchElementException;
            const-string v1, "Selected search track unavailable"
            invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V
            throw v0
        """))
        request.methods.single {
            it.name == "IllIIIlllIIlIlll" && it.parameterTypes == listOf("LlIIIIIlIIIIlllII;")
        }.addInstructionsWithLabels(0, """
            iget-object v0, p0, LlIlIlllIllIIllI;->lIIIlIlIIIIIlII:LlIIIIlIlIllIIII;
            iget-object v0, v0, LlIIIIlIlIllIIII;->IllIlllIIIllIlII:LlIlIllIIlIlIlll;
            sget-object v1, LlIlIllIIlIlIlll;->IlIlIIIllIIIllll:LlIlIllIIlIlIlll;
            if-eq v0, v1, :exact
            sget-object v1, LlIlIllIIlIlIlll;->IlIIlllIIlIlIlIl:LlIlIllIIlIlIlll;
            if-eq v0, v1, :exact
            sget-object v1, LlIlIllIIlIlIlll;->lIlIllIIll:LlIlIllIIlIlIlll;
            if-ne v0, v1, :original
            :exact
            check-cast p1, LIIIllIlIIIIIIll;
            invoke-virtual {p0, p1}, $SEARCH_REQUEST->morpheFetchSelectedTrack(LIIIllIlIIIIIIll;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
            :original
            nop
        """.trimIndent())
    }
}
