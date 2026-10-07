package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21t
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HEADER_BUTTON_TYPE =
    "Lcom/anghami/model/adapter/headers/HeaderButtonType;"

/**
 * Makes the playlist/album header buttons explicit (covers albums too — the
 * album presenter `R4/t` delegates to the same base click implementation).
 *
 * Stock behavior for free accounts: the server sends main=SHUFFLE and the
 * client picks secondary itself (owned playlist -> EDIT, otherwise FOLLOW;
 * albums -> LIKE). The header renders main + secondary
 * (`setupButtons`), so free users get [Shuffle] + [Edit/Follow/Like] and
 * never see Play.
 *
 * This patch rewrites the button TYPE selection (all same-format,
 * same-register `sget` swaps — no branches, no new registers, no labels):
 *
 * Playlists (`P5/b.v`, the single playlist header builder):
 * - main SHUFFLE -> PLAY (server pref overridden; Plus accounts already get
 *   PLAY, unchanged for them),
 * - secondary EDIT / FOLLOW / FOLLOWED / null -> SHUFFLE,
 * - LEAVECOLLAB and ADD_MORE_CLOUD_MUSIC (functional, no menu fallback)
 *   are deliberately kept.
 * Offline mixtape (`J5/a.v`): main SHUFFLE -> PLAY, null secondary ->
 * SHUFFLE (was a single standalone button).
 * Albums: the `AlbumHeaderData` pref getter is forced to PLAY (podcasts
 * already return PLAY before consulting it, untouched), and
 * `AlbumHeaderModel.getSecondaryButtonType` LIKE/LIKED -> SHUFFLE
 * (podcast SHOW_FOLLOW/SHOW_FOLLOWED branch untouched).
 *
 * Net: every playlist/album header shows [Play] + [Shuffle]. Taps flow
 * through the stock click funnel (`onHeaderButtonClicked` ->
 * `onPlayButtonClick` / `onShuffleButtonClick`): Play starts the queue in
 * order, Shuffle really shuffles it (stock `shuffle()` is left live by the
 * "Unforce shuffle" patch this depends on).
 *
 * Edit/Follow/Like stay reachable from the 3-dot menu
 * (`onHeaderButtonClicked` + follow handlers are untouched).
 *
 * Depends on "Unforce shuffle" (server-forced shuffle stays off, so the
 * explicit taps are the only shuffle source); enabling this pulls that in
 * automatically.
 */
@Suppress("unused")
val headerShufflePatch = bytecodePatch(
    name = "Header Play + Shuffle",
    description = "Playlist/album headers show Play + Shuffle instead of Shuffle + Edit/Follow/Like (functional LEAVECOLLAB, local-songs ADD_MORE and podcasts untouched). Pulls in 'Unforce shuffle'.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    dependsOn(unforceShufflePatch)

    execute {
        // --- Playlist main SHUFFLE -> PLAY (P5/b.v). ---
        run {
            val method = PlaylistHeaderButtonsFingerprint.method
            val insns = method.implementation!!.instructions
            val matches = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.SGET_OBJECT && ins is Instruction21c &&
                    (ins.reference as? FieldReference)?.name == "SHUFFLE" &&
                    ins.registerA == 3
                ) {
                    index
                } else {
                    null
                }
            }
            check(matches.size == 1) {
                "expected exactly 1 SHUFFLE sget into v3 in P5/b.v, found ${matches.size}"
            }
            method.replaceInstructions(
                matches[0],
                "sget-object v3, $HEADER_BUTTON_TYPE->PLAY:$HEADER_BUTTON_TYPE"
            )
        }
        // --- Playlist secondary EDIT/FOLLOW/FOLLOWED/null -> SHUFFLE. ---
        //
        // LABEL RULE (learned from a device VerifyError 2026-10-04): never
        // replace an instruction that directly carries a branch label (a
        // `:cond_X` line immediately above it) — Morphe's
        // remove+add-based replace orphans the label onto the FOLLOWING
        // instruction, silently rerouting the branch. Concretely the FOLLOW
        // sget below sits under `:cond_7`, so instead of swapping it (which
        // misroutes the not-followed path into returning a stale int as the
        // button type), the `if-eqz v6, :cond_7` branch itself is nopped so
        // every path falls through to the FOLLOWED slot (now SHUFFLE).
        // The orphaned `:cond_7` (zero remaining referrers) is dropped at
        // encode; the dead FOLLOW sget stays SHUFFLE and verifiable.
        for (field in listOf("EDIT", "FOLLOWED")) {
            val method = PlaylistHeaderButtonsFingerprint.method
            val insns = method.implementation!!.instructions
            val matches = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.SGET_OBJECT && ins is Instruction21c &&
                    (ins.reference as? FieldReference)?.name == field &&
                    ins.registerA == 0
                ) {
                    index
                } else {
                    null
                }
            }
            check(matches.size == 1) {
                "expected exactly 1 $field sget into v0 in P5/b.v, found ${matches.size}"
            }
            method.replaceInstructions(
                matches[0],
                "sget-object v0, $HEADER_BUTTON_TYPE->SHUFFLE:$HEADER_BUTTON_TYPE"
            )
        }
        run {
            // Collapse the followed/unfollowed split: both become SHUFFLE
            // via the FOLLOWED slot. The `if-eqz v6` (v6 = isPlaylistFollowed
            // result) is the only such branch in P5/b.v; it holds no label
            // itself, so replacing it is label-safe. (The FOLLOW sget it
            // used to jump to sits under `:cond_7` and must NOT be swapped —
            // see LABEL RULE above.)
            val method = PlaylistHeaderButtonsFingerprint.method
            val insns = method.implementation!!.instructions
            val branches = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.IF_EQZ && ins is Instruction21t &&
                    ins.registerA == 6
                ) {
                    index
                } else {
                    null
                }
            }
            check(branches.size == 1) {
                "expected exactly 1 if-eqz v6 in P5/b.v, found ${branches.size}"
            }
            method.replaceInstructions(branches[0], "nop")
        }
        // seeding the top `const/4 v0, 0x0`: that const also feeds the
        // null-playlist early exit (`:cond_a -> :goto_5 -> return-object v0`,
        // which must stay a null epoxy/w — seeding SHUFFLE there fails
        // verification with "returning HeaderButtonType but expected epoxy/w"
        // and crashes every PlaylistFragment at adapter creation (seen on
        // device 2026-10-04). The top const stays stock; the null -> SHUFFLE
        // upgrade happens at the consumer
        // (`PlaylistHeaderModel.getSecondaryButtonType`, see below).
        // The two checks below guard both halves of that invariant: the lone
        // top const exists, and the lone `return-object v0` (the method's
        // other return is `return-object v7`) still returns the stock null.
        // If either shape drifts, fail loudly instead of shipping a
        // VerifyError.
        run {
            val method = PlaylistHeaderButtonsFingerprint.method
            val insns = method.implementation!!.instructions
            val consts = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.CONST_4 && ins is Instruction11n &&
                    ins.registerA == 0 && ins.narrowLiteral == 0
                ) {
                    index
                } else {
                    null
                }
            }
            check(consts.size == 1) {
                "expected exactly 1 const/4 v0,0 in P5/b.v, found ${consts.size}"
            }
            val firstSget = insns.indexOfFirst { it.opcode == Opcode.SGET_OBJECT }
            check(consts[0] < firstSget) {
                "top const/4 v0,0 is not before the first sget in P5/b.v"
            }
            val nullReturns = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.RETURN_OBJECT &&
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x)?.registerA == 0
                ) {
                    index
                } else {
                    null
                }
            }
            check(nullReturns.size == 1) {
                "expected exactly 1 return-object v0 in P5/b.v, found ${nullReturns.size}"
            }
        }
        // --- Offline mixtape (J5/a.v): main SHUFFLE -> PLAY, null -> SHUFFLE. ---
        run {
            val method = MixtapeHeaderButtonsFingerprint.method
            val insns = method.implementation!!.instructions
            val mains = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.SGET_OBJECT && ins is Instruction21c &&
                    (ins.reference as? FieldReference)?.name == "SHUFFLE" &&
                    ins.registerA == 3
                ) {
                    index
                } else {
                    null
                }
            }
            check(mains.size == 1) {
                "expected exactly 1 SHUFFLE sget into v3 in J5/a.v, found ${mains.size}"
            }
            method.replaceInstructions(
                mains[0],
                "sget-object v3, $HEADER_BUTTON_TYPE->PLAY:$HEADER_BUTTON_TYPE"
            )
            // Secondary is the `const/4 v4, 0x0` immediately feeding the
            // PlaylistHeaderData.<init> call (the earlier one feeds the
            // main-type null path and must stay).
            val initIndex = insns.indexOfFirst {
                val ref = ((it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? MethodReference)
                ref?.name == "<init>" &&
                    ref.definingClass == "Lcom/anghami/model/adapter/headers/PlaylistHeaderData;"
            }
            check(initIndex > 0) { "PlaylistHeaderData.<init> call not found in J5/a.v" }
            val consts = insns.mapIndexedNotNull { index, ins ->
                if (index < initIndex && ins.opcode == Opcode.CONST_4 && ins is Instruction11n &&
                    ins.registerA == 4 && ins.narrowLiteral == 0
                ) {
                    index
                } else {
                    null
                }
            }
            check(consts.isNotEmpty()) { "no const/4 v4,0 before <init> in J5/a.v" }
            method.replaceInstructions(
                consts.max(),
                "sget-object v4, $HEADER_BUTTON_TYPE->SHUFFLE:$HEADER_BUTTON_TYPE"
            )
        }
        // --- Album primary pref -> PLAY (podcasts return PLAY earlier). ---
        AlbumPrefButtonTypeFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/anghami/ghost/prefs/PreferenceHelper${'$'}HeaderButtonType;->PLAY:Lcom/anghami/ghost/prefs/PreferenceHelper${'$'}HeaderButtonType;
                return-object v0
            """
        )
        // --- Album secondary LIKE/LIKED -> SHUFFLE (podcast branch kept). ---
        //
        // LABEL RULE (same as above): the LIKE sget sits directly under
        // `:cond_2`, so it must NOT be swapped (orphaning the label reroutes
        // the not-liked path into returning the stale isLiked boolean ->
        // VerifyError, seen on device 2026-10-04). Instead only the LIKED
        // sget (label-free) is swapped, and the `if-eqz v0, :cond_2` branch
        // feeding it is nopped so liked AND unliked both fall through to the
        // SHUFFLE slot. The orphaned `:cond_2` (zero referrers) is dropped at
        // encode; the dead LIKE slot stays SHUFFLE and verifiable.
        run {
            val method = AlbumSecondaryButtonFingerprint.method
            val insns = method.implementation!!.instructions
            val liked = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.SGET_OBJECT && ins is Instruction21c &&
                    (ins.reference as? FieldReference)?.name == "LIKED" &&
                    ins.registerA == 0
                ) {
                    index
                } else {
                    null
                }
            }
            check(liked.size == 1) {
                "expected exactly 1 LIKED sget into v0 in Album secondary, found ${liked.size}"
            }
            method.replaceInstructions(
                liked[0],
                "sget-object v0, $HEADER_BUTTON_TYPE->SHUFFLE:$HEADER_BUTTON_TYPE"
            )
        }
        run {
            // The isLiked branch directly above the (now SHUFFLE) LIKED slot:
            // `if-eqz v0` with [sget SHUFFLE, return-object] immediately
            // after. The podcast-tail branches don't match that shape
            // (SHOW_FOLLOW* sgets), and the podcast check isn't followed by
            // a sget at all.
            val method = AlbumSecondaryButtonFingerprint.method
            val insns = method.implementation!!.instructions
            val branches = insns.mapIndexedNotNull { index, ins ->
                if (ins.opcode == Opcode.IF_EQZ && ins is Instruction21t &&
                    ins.registerA == 0 &&
                    index + 2 < insns.size &&
                    insns[index + 1].let {
                        it.opcode == Opcode.SGET_OBJECT && it is Instruction21c &&
                            (it.reference as? FieldReference)?.name == "SHUFFLE"
                    } &&
                    insns[index + 2].opcode == Opcode.RETURN_OBJECT
                ) {
                    index
                } else {
                    null
                }
            }
            check(branches.size == 1) {
                "expected exactly 1 isLiked branch above the SHUFFLE slot, found ${branches.size}"
            }
            method.replaceInstructions(branches[0], "nop")
        }
        // --- Playlist null secondary (nonFollowable) -> SHUFFLE. ---
        // Index-0 prepend on the delegating getter (v0 dead at entry; sole
        // label at index 0). Non-null types (SHUFFLE from the swaps above,
        // LEAVECOLLAB, ADD_MORE) fall through to the stock return untouched.
        PlaylistSecondaryButtonFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/anghami/model/adapter/headers/PlaylistHeaderModel;->playlistHeaderData:Lcom/anghami/model/adapter/headers/PlaylistHeaderData;
                invoke-virtual {v0}, Lcom/anghami/model/adapter/headers/PlaylistHeaderData;->getSecondaryHeaderButtonType()Lcom/anghami/model/adapter/headers/HeaderButtonType;
                move-result-object v0
                if-nez v0, :keep_playlist_secondary
                sget-object v0, $HEADER_BUTTON_TYPE->SHUFFLE:$HEADER_BUTTON_TYPE
                :keep_playlist_secondary
                return-object v0
            """
        )
    }
}
