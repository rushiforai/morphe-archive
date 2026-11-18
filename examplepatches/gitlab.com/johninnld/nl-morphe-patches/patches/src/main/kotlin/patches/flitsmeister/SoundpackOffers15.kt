package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

private const val SOUND_PACK = "Lnl/flitsmeister/models/enums/SoundPacks;"
private const val SOUND_STATE = "Lvei\$a;"
private const val SOUND_OFFERS = "Lomh;->a(Landroidx/compose/ui/Modifier;${SOUND_STATE}Lvei;Lhdi;Landroidx/compose/runtime/Composer;I)V"
private const val SOUND_BANNER = "Lfei;->a(Landroidx/compose/ui/Modifier;${SOUND_PACK}Ls39;Landroidx/compose/runtime/Composer;II)V"

/** Hide only unowned paid offers in the 15.0 Settings catalogue.
 * DEFAULT is the sole free enum entry. State.e contains genuine purchases;
 * State.d is purchased minus downloaded and stays with the original selectors.
 * Read ownership without changing the set, catalogue, selections, downloads
 * or billing state. v6 is dead
 * after the cast and is overwritten by the original Compose flags at the join.
 */
internal fun soundpackOfferPlans15() = listOf(
    MethodPlan(SOUND_OFFERS, 24, 217, listOf(
        Guard(145, Opcode.IGET_OBJECT, listOf(0, 2), "$SOUND_STATE->c:Ljava/util/Set;"),
        Guard(149, Opcode.INVOKE_STATIC, listOf(0, 6), "Ls33;->m0(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;"),
        Guard(151, Opcode.INVOKE_INTERFACE, listOf(0), "Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;"),
        Guard(153, Opcode.INVOKE_INTERFACE, listOf(0), "Ljava/util/Iterator;->hasNext()Z"),
        Guard(155, Opcode.IF_EQZ, listOf(6), target = 204),
        Guard(156, Opcode.INVOKE_INTERFACE, listOf(0), "Ljava/util/Iterator;->next()Ljava/lang/Object;"),
        Guard(157, Opcode.MOVE_RESULT_OBJECT, listOf(6)),
        Guard(158, Opcode.MOVE_OBJECT, listOf(7, 6)),
        Guard(159, Opcode.CHECK_CAST, listOf(7), SOUND_PACK),
        Guard(160, Opcode.AND_INT_LIT16, listOf(6, 14)),
        Guard(196, Opcode.INVOKE_DIRECT, listOf(8, 3, 7, 4), "Lmmh;-><init>(Lvei;${SOUND_PACK}Lhdi;)V"),
        Guard(202, Opcode.INVOKE_STATIC_RANGE, (6..11).toList(), SOUND_BANNER),
        Guard(203, Opcode.GOTO, target = 153),
        Guard(204, Opcode.INVOKE_STATIC, listOf(9), "Lk20;->d(Landroidx/compose/runtime/Composer;)Z"),
    ), listOf(Edit(160, "labelled", """
        sget-object v6, $SOUND_PACK->DEFAULT:$SOUND_PACK
        if-eq v7, v6, :morphe_usable_soundpack
        iget-object v6, v2, $SOUND_STATE->e:Ljava/util/Set;
        invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
        move-result v6
        if-eqz v6, :morphe_join
        :morphe_usable_soundpack
        nop
    """.trimIndent(), 153)), mapOf(
        "$SOUND_STATE->c:Ljava/util/Set;" to 1,
        "$SOUND_STATE->d:Ljava/util/Set;" to 0,
        "$SOUND_STATE->e:Ljava/util/Set;" to 0,
        "Ljava/util/Iterator;->hasNext()Z" to 1,
        "Ljava/util/Iterator;->next()Ljava/lang/Object;" to 1,
        SOUND_BANNER to 1,
    )),
)
