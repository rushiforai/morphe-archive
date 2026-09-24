package app.discord.patches.banner

import app.discord.patches.hermes.HermesBundle
import app.discord.patches.hermes.fail
import app.morphe.patcher.patch.resourcePatch

/**
 * Hides the quest promo banner (QuestBar) by neutering its visibility gate
 * directly in the Hermes bundle.
 *
 * Self-locating: instead of baked-in byte anchors, the patch finds the
 * gate at patch time - the single function referencing QUEST_BAR_MOBILE
 * + isDismissed + userStatus - validates its head shape, and returns
 * null on entry (6-byte edit, decoder alignment preserved). It attempts
 * to work on Discord versions it never saw; anything unrecognized fails
 * loudly with the update point named.
 *
 * Gate history (Hermes bytecode v98): 341.13 hook-style variant (quest
 * via parent), 342/343 identical codegen, 344 shifted registers, 346 new
 * eligibility hooks + a CreateFunctionEnvironment in the head. All share
 * the same string co-occurrence and a 6-byte replaceable head.
 *
 * The edit replaces the gate's first two instructions
 * (GetParentEnvironment + LoadParam, or GetParentEnvironment +
 * CreateFunctionEnvironment) with:
 *   LoadConstNull r2 (94 02) + Ret r2 (76 02) + LoadConstUndefined r0 (93 00)
 */
val hideQuestBarPatch = resourcePatch(
    name = "Hide quest promo banner",
    description = "Hides the quest promo banner at the top of the server channel list.",
    default = true,
) {
    compatibleWith(DiscordConstants.COMPATIBILITY_DISCORD)

    execute {
        val bundle = get("assets/index.android.bundle", true)
        val bytes = bundle.readBytes()
        val hbc = HermesBundle(bytes)

        val at = findQuestGate(hbc)
        QUEST_REPLACEMENT.forEachIndexed { i, byte -> bytes[at + i] = byte }
        bundle.writeBytes(bytes)
        println("Hide quest promo banner: gate neutered at bundle offset $at")
    }
}

private val QUEST_STRINGS = listOf("QUEST_BAR_MOBILE", "isDismissed", "userStatus")

// Accepted gate head shapes (first two instructions). The 6-byte edit
// overwrites exactly these; anything else fails below.
private val HEAD_SHAPES = listOf(
    listOf("GetParentEnvironment", "LoadParam"),
    listOf("GetParentEnvironment", "CreateFunctionEnvironment"),
)

private val QUEST_REPLACEMENT: ByteArray =
    byteArrayOf(0x94.toByte(), 0x02, 0x76, 0x02, 0x93.toByte(), 0x00)

private fun findQuestGate(hbc: HermesBundle): Int {
    val sids = QUEST_STRINGS.map { s ->
        val sid = hbc.stringId(s)
        if (sid < 0) {
            fail("Hide quest promo banner FAILED: string '$s' missing " +
                "from the bundle string table (renamed/removed?) - " +
                "update QUEST_STRINGS in HideQuestBarPatch.kt")
        }
        sid
    }
    val sets = sids.map { hbc.findersOf(it).toSet() }
    val cands = sets.reduce { a, b -> a.intersect(b) }.sorted()
    if (cands.size != 1) {
        fail("Hide quest promo banner FAILED: ${cands.size} functions " +
            "reference $QUEST_STRINGS: $cands (want exactly 1, the gate) - " +
            "tighten QUEST_STRINGS in HideQuestBarPatch.kt")
    }
    val fid = cands[0]
    val instrs = hbc.decode(fid)
    val head = instrs.take(2).map { it.op.name }
    if (!HEAD_SHAPES.contains(head)) {
        val seen = instrs.take(3).map { it.op.name }
        fail("Hide quest promo banner FAILED: gate fn $fid head is $seen, " +
            "matches no known HEAD_SHAPES $HEAD_SHAPES - add the new " +
            "shape (and its replacement) in HideQuestBarPatch.kt")
    }
    val headLen = instrs.take(2).sumOf { it.len }
    if (headLen != QUEST_REPLACEMENT.size) {
        fail("Hide quest promo banner FAILED: gate fn $fid head $head is " +
            "$headLen bytes but the replacement is " +
            "${QUEST_REPLACEMENT.size} - re-derive QUEST_REPLACEMENT " +
            "in HideQuestBarPatch.kt")
    }
    return instrs[0].off
}
