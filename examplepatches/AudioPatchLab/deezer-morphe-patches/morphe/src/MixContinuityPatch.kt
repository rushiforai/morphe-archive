package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val MIX_DISPATCH = "LIIlIlIlIlllIlll;"
private const val MIX_ARGUMENTS = "LIIIIIIlIlIllIlIl;Ljava/util/List;LlIIllIIlIlIlIll;Ljava/util/List;LIIIIlIIlIllll;"

internal val mixContinuityPatch = patch {
    compatibleWith(deezerCompatibility)
    execute {
        val owner = mutableClassDefBy(MIX_DISPATCH)
        val parameters = listOf("LIIIIIIlIlIllIlIl;", "Ljava/util/List;", "LlIIllIIlIlIlIll;",
            "Ljava/util/List;", "LIIIIlIIlIllll;")
        owner.methods.add(MutableMethod(ImmutableMethod(
            MIX_DISPATCH, "morpheContinueCurrentMix", parameters.map {
                ImmutableMethodParameter(it, emptySet(), null)
            }, "Z", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(17, emptyList(), emptyList(), emptyList()),
        )).apply {
            addInstructionsWithLabels(0, """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                move-object/from16 v4, p4
                invoke-interface {v4}, LIllIlIIllIIIIIl;->IIlIIIlIIIllllll()LlIlIllIIlIlIlll;
                move-result-object v5
                sget-object v6, LlIlIllIIlIlIlll;->IIlIIlIllIIIIIIl:LlIlIllIIlIlIlll;
                if-eq v5, v6, :mix
                sget-object v6, LlIlIllIIlIlIlll;->IIlIIIlllIIIlll:LlIlIllIIlIlIlll;
                if-ne v5, v6, :native
                :mix
                invoke-interface {v4}, LIllIlIIllIIIIIl;->IlIIllIlllllllIl()LIlIIIIlIIllIIIll;
                move-result-object v5
                iget-object v5, v5, LIlIIIIlIIllIIIll;->lIIIIIlllllIIIII:Ljava/lang/String;
                invoke-interface {v0}, LIIIIIIlIlIllIlIl;->IIlIIllIIIIIlIIl()LIIIIIIllIIIllIIl;
                move-result-object v2
                if-eqz v2, :native
                invoke-interface {v2}, LlIIllIIlIlIlIll;->IIlIlllIIIllIllI()Ljava/lang/String;
                move-result-object v6
                invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
                move-result v6
                if-eqz v6, :native
                new-instance v7, Ljava/util/ArrayList;
                invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V
                invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v8
                :next
                invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z
                move-result v9
                if-eqz v9, :update
                invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v9
                check-cast v9, LlIIllIIlIlIlIll;
                invoke-interface {v9}, LlIIllIIlIlIlIll;->IIlIlllIIIllIllI()Ljava/lang/String;
                move-result-object v10
                invoke-static {v5, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
                move-result v10
                if-nez v10, :next
                invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                goto :next
                :update
                invoke-static {v4}, LlllllIlIIIIIIl;->IlIIlIIlIlI(LIIIIlIIlIllll;)LlIIlllllIIIlIll;
                move-result-object v4
                invoke-static {v4}, LIlIIllIlIlIlIIII;->IIlIIIIIIlllIIlI(LlIIlllllIIIlIll;)LllIlllIIIIlIIlI;
                move-result-object v4
                # Edit only upcoming tracks. A replacement/play request resets the decoder,
                # and the shuffle replacement can select an entirely different track.
                invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z
                move-result v3
                if-nez v3, :done
                invoke-static {}, LlIIlllIlllll;->lIIIIIlllllIIIII()LlIIlllIlllll;
                move-result-object v3
                const/4 v6, -0x1
                iput v6, v3, LlIIlllIlllll;->IIlIlIlIIIIlIll:I
                const/4 v6, -0x2
                iput v6, v3, LlIIlllIlllll;->IIlIIIlIIIllllll:I
                invoke-interface {v0}, LIIIIIIlIlIllIlIl;->isShuffle()Z
                move-result v6
                iput-boolean v6, v3, LlIIlllIlllll;->IllIlllIIIllIlII:Z
                invoke-interface {v0}, LIIIIIIlIlIllIlIl;->lIIlIIlIlllllII()V
                invoke-interface {v0, v7, v4, v3}, LIIIIIIlIlIllIlIl;->lIlIlIllIIIlIII(Ljava/util/List;LllIlllIIIIlIIlI;LlIIlllIlllll;)V
                move-object/from16 v3, p3
                if-eqz v3, :done
                invoke-interface {v0, v3}, LIIIIIIlIlIllIlIl;->lIIlIlIIIlllIll(Ljava/util/List;)V
                :done
                const/4 v0, 0x1
                return v0
                :native
                const/4 v0, 0x0
                return v0
            """.trimIndent())
        })
        owner.methods.single {
            it.name == "IIIllIlIlllII" && it.parameterTypes == parameters
        }.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p4}, $MIX_DISPATCH->morpheContinueCurrentMix($MIX_ARGUMENTS)Z
            move-result v0
            if-eqz v0, :native
            return-void
            :native
            nop
        """.trimIndent())
        // Full-track mix requests must not be downgraded to a different recommendation action.
        mutableClassDefBy("LlIIIIIlIllIlllIl;").methods.single {
            it.name == "lIIlIIlIlllllII" && it.parameterTypes == listOf("LlIIIIIlIIIIlllII;")
        }.addInstructionsWithLabels(0, """
            iget-object v0, p0, LlIIIIIlIllIlllIl;->IllIIIlllIIlIlll:LlIlIlllIllIIllI;
            iget-object v1, v0, LlIlIlllIllIIllI;->lIIIlIlIIIIIlII:LlIIIIlIlIllIIII;
            iget-object v1, v1, LlIIIIlIlIllIIII;->IllIlllIIIllIlII:LlIlIllIIlIlIlll;
            sget-object v2, LlIlIllIIlIlIlll;->IIlIIlIllIIIIIIl:LlIlIllIIlIlIlll;
            if-eq v1, v2, :full
            sget-object v2, LlIlIllIIlIlIlll;->IIlIIIlllIIIlll:LlIlIllIIlIlIlll;
            if-ne v1, v2, :native
            :full
            return-object v0
            :native
            nop
        """.trimIndent())
    }
}
