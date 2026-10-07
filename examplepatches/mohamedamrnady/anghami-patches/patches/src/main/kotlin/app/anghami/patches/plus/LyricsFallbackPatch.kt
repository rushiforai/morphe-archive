package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FALLBACK_HELPER =
    "Lapp/anghami/extension/extension/LrclibFallback;"

/**
 * LRCLIB fallback for truncated lyrics (opt-in, default off).
 *
 * Fires only from the GETlyrics.view API callback (`A7/F.onNext`), after the
 * server response has rendered. The helper returns early for full native
 * responses, so the Plus/native path and `saveLyrics` flow are untouched;
 * truncated teasers are never written to StoredLyrics (the helper keeps its
 * own SharedPreferences cache, `lyrics_fallback`).
 *
 * Waterfall (title then artist, sequential): exact `/api/get` with duration,
 * without duration, normalized variants, fielded `/api/search`, `?q=` search.
 *
 * Data-level hasLyrics fix: the server song payload carries hasLyrics=false
 * for lyrics-less tracks (and A7/C re-clears it on empty responses), which
 * kept the button greyed, the mode observer reverting, and the screen
 * empty no matter how many consumer branches were nopped. Instead every
 * trampoline forces Song.hasLyrics=true on the instance (W0 entry, onNext
 * entry, onError entry, mode observer after I0()) via the reflection
 * helper — all native checks then just work, podcasts excepted (their guard
 * is untouched). The fallback itself still only renders on truncated/empty
 * server responses.
 *
 * Truncated suppression: once LRCLIB lyrics are cached for a song, later
 * opens never show the teaser again. The view-load hook paints the cache
 * instantly; the `A7/E.b`-entry hook rewrites the truncated API response
 * in place before native renders it; the onNext hook then re-flags it
 * truncated so native saveLyrics keeps refusing it (prefs cache stays
 * the only source of truth, manual picks keep sticking).
 *
 * Patch-authoring rules honored: all trampolines are branch-free inserts
 * (entry prepends use only dead-at-entry v0, or p1 alone; the a1 insert
 * reuses the I0() result register). No new labels, no register growth.
 */
@Suppress("unused")
val lyricsFallbackPatch = bytecodePatch(
    name = "LRCLIB lyrics fallback",
    description = "When the server returns truncated/empty lyrics, fetches the full text from LRCLIB (opt-in free source) into a separate cache. Native full lyrics and the Plus path are untouched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    extendWith("extensions/extension.mpe")

    execute {
        val method = LyricsApiOnNextFingerprint.method
        // Data-level first: the callback's song gets hasLyrics=true before
        // anything downstream reads it. Branch-free prepend (v0 dead at entry).
        method.addInstructions(
            0,
            """
                iget-object v0, p0, LA7/F;->a:Lcom/anghami/ghost/pojo/Song;
                invoke-static {v0}, $FALLBACK_HELPER->forceSongFlags(Ljava/lang/Object;)V
            """
        )
        val insns = method.implementation!!.instructions
        val anchor = insns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.INVOKE_STATIC && ins is Instruction35c &&
                (ins.reference as? MethodReference)?.let {
                    it.definingClass == "LA7/E;" && it.name == "b"
                } == true
            ) {
                index
            } else {
                null
            }
        }
        check(anchor.size == 1) {
            "expected exactly 1 A7/E.b call in onNext, found ${anchor.size}"
        }
        method.addInstructions(
            anchor[0] + 1,
            """
                iget-object v0, p0, LA7/F;->a:Lcom/anghami/ghost/pojo/Song;
                iget-object v1, p0, LA7/F;->b:Ljava/lang/Object;
                invoke-static {v0, p1, v1}, $FALLBACK_HELPER->maybeFetch(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            """
        )
        // Truncated suppression at the render choke point (`A7/E.b`
        // entry): a cached LRCLIB result rewrites the truncated/empty
        // response in place before native renders it, so the teaser is
        // never shown on first open or revisit. Branch-free prepend
        // (v0-v2 dead at entry of this static method); all decisions
        // live in the helper, misses are no-ops.
        LyricsSuccessFingerprint.method.addInstructions(
            0,
            """
                move-object v0, p0
                move-object v1, p1
                move-object v2, p3
                invoke-static {v0, v1, v2}, $FALLBACK_HELPER->substituteCached(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            """
        )
        // Instant cached paint at lyrics-view load (`A.h` entry):
        // known songs render immediately without waiting for the
        // DB/API round-trip. Branch-free (p0 alone, no v-reg touched).
        LyricsViewLoadFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $FALLBACK_HELPER->paintCached(Ljava/lang/Object;)V
            """
        )
        // Player lyrics button: the Song arrives with server hasLyrics=false
        // for lyrics-less tracks — force it true at W0 entry so the native
        // enable branch (and every other reader of this instance) just
        // works. Data-level fix; the old IF_EQZ nop is gone. Branch-free
        // prepend using p1 alone (no v-reg touched).
        LyricsButtonGateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1}, $FALLBACK_HELPER->forceSongFlags(Ljava/lang/Object;)V
            """
        )
        // Mode observer: it reads the current song via I0() and reverts
        // lyrics mode when !hasLyrics. Force the flags on the gate's song
        // instance right after its I0() move-result. a1 calls I0() twice,
        // so the insert anchors on the object register of the single
        // Song.hasLyrics iget (not on call order). Podcast guard untouched;
        // no nops.
        run {
            val a1 = LyricsModeRevertFingerprint.method
            val a1ins = a1.implementation!!.instructions
            val objRegs = a1ins.mapNotNull { ins ->
                if (ins.opcode == Opcode.IGET_BOOLEAN && ins is Instruction22c &&
                    (ins.reference as? FieldReference)?.let {
                        it.definingClass == "Lcom/anghami/ghost/pojo/Song;" &&
                            it.name == "hasLyrics"
                    } == true
                ) {
                    ins.registerB
                } else {
                    null
                }
            }
            check(objRegs.size == 1) {
                "expected exactly 1 hasLyrics iget in a1, found ${objRegs.size}"
            }
            val moves = a1ins.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.MOVE_RESULT_OBJECT && index > 0 &&
                    ins is Instruction11x && ins.registerA == objRegs[0] &&
                    a1ins[index - 1].opcode == Opcode.INVOKE_VIRTUAL &&
                    ((a1ins[index - 1] as? Instruction35c)?.reference as? MethodReference)?.let {
                        it.name == "I0" &&
                            it.returnType == "Lcom/anghami/ghost/pojo/Song;"
                    } == true
                ) {
                    index
                } else {
                    null
                }
            }
            check(moves.size == 1) {
                "expected exactly 1 gate I0() move-result in a1, found ${moves.size}"
            }
            val dest = (a1ins[moves[0]] as Instruction11x).registerA
            a1.addInstructions(
                moves[0] + 1,
                """
                    invoke-static {v$dest}, $FALLBACK_HELPER->forceSongFlags(Ljava/lang/Object;)V
                """
            )
        }
        // API error path (no usable server lyrics): force the flag first,
        // then the same fallback entry with a null response. Inserted
        // before the single return-void; v0/v1 are dead there (consumed by
        // the E.a call above). Branch-free.
        run {
            val onError = LyricsApiOnErrorFingerprint.method
            onError.addInstructions(
                0,
                """
                    iget-object v0, p0, LA7/F;->a:Lcom/anghami/ghost/pojo/Song;
                    invoke-static {v0}, $FALLBACK_HELPER->forceSongFlags(Ljava/lang/Object;)V
                """
            )
            val eins = onError.implementation!!.instructions
            val rets = eins.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.RETURN_VOID) index else null
            }
            check(rets.size == 1) {
                "expected exactly 1 return in onError, found ${rets.size}"
            }
            onError.addInstructions(
                rets[0],
                """
                    iget-object v0, p0, LA7/F;->a:Lcom/anghami/ghost/pojo/Song;
                    iget-object v1, p0, LA7/F;->b:Ljava/lang/Object;
                    invoke-static {v0, v1}, $FALLBACK_HELPER->maybeFetchNoResponse(Ljava/lang/Object;Ljava/lang/Object;)V
                """
            )
        }
    }
}

/**
 * Play-button lyrics options (depends on the fallback above).
 *
 * Replaces the play/pause button's native long-press (sleep-timer bottom
 * sheet, `l$c.onLongClick`) with the lyrics options dialog for the current
 * song: artist/title retry, LRCLIB search picker, synced/plain toggle and
 * server-version restore. An existing, undiscoverable gesture with zero
 * tap interference — single taps, scrolling and playback are untouched.
 * Kept separate so the fallback can run without the dialog.
 */
@Suppress("unused")
val lyricsLongPressPatch = bytecodePatch(
    name = "Lyrics options on play long-press",
    description = "Long-press play/pause for lyrics options (retry, LRCLIB search, synced/plain toggle, server version) instead of the sleep timer. Pulls in 'LRCLIB lyrics fallback'.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    dependsOn(lyricsFallbackPatch)

    execute {
        // Unconditional early return: our dialog instead of the sleep
        // timer. Branch-free const/return prepend (v0 free at entry,
        // .locals 2); p0's `a` field is the player fragment for context.
        PlayPauseLongPressFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/anghami/player/ui/l${'$'}c;->a:Lcom/anghami/player/ui/l;
                invoke-static {v0}, $FALLBACK_HELPER->showLyricsOptions(Ljava/lang/Object;)V
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
