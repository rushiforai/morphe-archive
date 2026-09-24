package app.discord.patches.composer

import app.discord.patches.banner.DiscordConstants
import app.discord.patches.hermes.HermesBundle
import app.discord.patches.hermes.fail
import app.morphe.patcher.patch.resourcePatch

/**
 * Hides the gift (Nitro gifting) button in the chat message composer by
 * neutering it at two surfaces directly in the Hermes bundle.
 *
 * Self-locating: the visible gift icon lives in ChatInputRightActions,
 * found at patch time as the function reading shouldShowGiftButton in
 * the composer-bar shape (TransitionItem + EXPRESSION). The edit forces
 * that prop load to false (6-byte GetById -> LoadConstFalse x3). The
 * flag must be written once and tested once (scratch reuse after the
 * test is fine); the false path is stock behavior, so the emoji button
 * is untouched.
 *
 * The same flag also gates a gift entry in the ChatInputActions row
 * (attach-sheet actions). Known gift-push codegen is tried there;
 * builds whose sheet has no gift entry (344.13, 346.13: only dead
 * NITRO_GIFT renderer refs remain) skip that site when the prop is read
 * in exactly one function. Anything else fails loudly.
 */
val hideGiftButtonPatch = resourcePatch(
    name = "Hide gift button",
    description = "Hides the gift button in the chat message composer.",
    default = true,
) {
    compatibleWith(DiscordConstants.COMPATIBILITY_DISCORD_COMPOSER)

    execute {
        val bundle = get("assets/index.android.bundle", true)
        val bytes = bundle.readBytes()
        val hbc = HermesBundle(bytes)

        val bar = findGiftBar(hbc)
        BAR_REPLACEMENT.forEachIndexed { i, byte -> bytes[bar.at + i] = byte }
        println("Hide gift button: bar flag forced false at offset ${bar.at}")

        val sheet = findGiftSheet(bytes, bar.propReaders)
        if (sheet != null) {
            SHEET_REPLACEMENT.forEachIndexed { i, byte -> bytes[sheet + i] = byte }
            println("Hide gift button: sheet push neutered at offset $sheet")
        } else {
            println("Hide gift button: no sheet gift entry, site skipped")
        }
        bundle.writeBytes(bytes)
    }
}

private val BAR_SHAPE_STRINGS = listOf("TransitionItem", "EXPRESSION")

private val BAR_REPLACEMENT: ByteArray =
    byteArrayOf(0x96.toByte(), 0x10, 0x96.toByte(), 0x10, 0x96.toByte(), 0x10)

private val SHEET_REPLACEMENT: ByteArray =
    byteArrayOf(0x10, 0x0D, 0x0D, 0x96.toByte(), 0x0D)

// Gift-push codegen for builds whose attach-sheet has a gift entry
// (frozen facts about old bundles; old bundles never change).
private val SHEET_ANCHORS = listOf(
    "6e 0d 0f 0c 0d ae 20 44 0f 0c 21 c8 02 0d aa 00",
    "6e 0d 0f 0c 0d ae 1c 44 0f 0c 24 c8 01 0d aa 00",
).map { hex -> hex.split(" ").map { it.toInt(16).toByte() }.toByteArray() }

private val COND_JUMPS = setOf("JmpTrue", "JmpTrueLong", "JmpFalse", "JmpFalseLong")

private class BarTarget(val at: Int, val propReaders: Int)

private fun findGiftBar(hbc: HermesBundle): BarTarget {
    val sid = hbc.stringId("shouldShowGiftButton")
    if (sid < 0) {
        fail("Hide gift button FAILED: string 'shouldShowGiftButton' " +
            "missing from the string table - update strings " +
            "in HideGiftButtonPatch.kt")
    }
    val cands = hbc.findersOf(sid)
    val fid = if (cands.size == 1) {
        cands[0]
    } else {
        val shaped = cands.filter { f ->
            BAR_SHAPE_STRINGS.all { s ->
                val id = hbc.stringId(s)
                id >= 0 && hbc.findersOf(id).contains(f)
            }
        }
        if (shaped.size != 1) {
            fail("Hide gift button FAILED: ${cands.size} functions read " +
                "shouldShowGiftButton $cands, ${shaped.size} with composer " +
                "shape $shaped (want exactly 1, ChatInputRightActions) - " +
                "update BAR_SHAPE_STRINGS in HideGiftButtonPatch.kt")
        }
        shaped[0]
    }
    val instrs = hbc.decode(fid)
    val flags = instrs.filter {
        it.op.name == "GetById" && it.vals.size > 3 && it.vals[3] == sid
    }
    if (flags.size != 1) {
        fail("Hide gift button FAILED: bar fn $fid has ${flags.size} " +
            "shouldShowGiftButton loads (want exactly 1) - update " +
            "FLAG_RULE in HideGiftButtonPatch.kt")
    }
    val flag = flags[0]
    val reg = flag.vals[0]
    val after = instrs.filter { it.off > flag.off }
    val tests = after.filter {
        it.op.name in COND_JUMPS && hbc.regsOf(it).second.contains(reg)
    }
    if (tests.size != 1) {
        fail("Hide gift button FAILED: bar fn $fid flag r$reg tested " +
            "${tests.size} times (want exactly 1 conditional jump) - " +
            "update FLAG_RULE in HideGiftButtonPatch.kt")
    }
    val touched = after.filter { it.off < tests[0].off }.filter {
        val (dst, reads) = hbc.regsOf(it)
        dst == reg || reads.contains(reg)
    }
    if (touched.isNotEmpty()) {
        fail("Hide gift button FAILED: bar fn $fid flag r$reg touched " +
            "between load and test at ${touched.map { it.off }} - update " +
            "FLAG_RULE in HideGiftButtonPatch.kt")
    }
    if (BAR_REPLACEMENT.size != flag.len) {
        fail("Hide gift button FAILED: bar flag is ${flag.len} bytes but " +
            "the replacement is ${BAR_REPLACEMENT.size} - re-derive " +
            "BAR_REPLACEMENT in HideGiftButtonPatch.kt")
    }
    return BarTarget(flag.off, cands.size)
}

private fun findGiftSheet(bytes: ByteArray, propReaders: Int): Int? {
    for (anchor in SHEET_ANCHORS) {
        val hits = findAll(bytes.asList(), anchor)
        if (hits.size == 1) return hits[0]
        if (hits.size > 1) {
            fail("Hide gift button FAILED: sheet push anchor matched " +
                "${hits.size} times at $hits (want exactly 1) - the " +
                "attach-sheet codegen changed, add the moved push " +
                "anchor in HideGiftButtonPatch.kt")
        }
    }
    if (propReaders == 1) return null // no gift entry in the sheet.
    fail("Hide gift button FAILED: no known sheet push anchor hit and " +
        "shouldShowGiftButton is read in $propReaders functions (want 1 " +
        "for the sheetless case) - analyze the attach-sheet: add the " +
        "moved push anchor or extend the sheetless reasoning " +
        "in HideGiftButtonPatch.kt")
}

private fun findAll(haystack: List<Byte>, needle: ByteArray): List<Int> {
    val out = mutableListOf<Int>()
    if (needle.isEmpty() || haystack.size < needle.size) return out
    outer@ for (i in 0..haystack.size - needle.size) {
        for (j in needle.indices) {
            if (haystack[i + j] != needle[j]) continue@outer
        }
        out.add(i)
    }
    return out
}
