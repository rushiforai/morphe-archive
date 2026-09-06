package app.discord.patches.composer

import app.discord.patches.banner.DiscordConstants
import app.morphe.patcher.patch.resourcePatch

/**
 * Hides the gift (Nitro gifting) button in the chat message composer by
 * neutering it at two surfaces directly in the Hermes bundle.
 *
 * The visible gift icon lives in ChatInputRightActions, which renders a
 * [gift?, emoji] row: when the shouldShowGiftButton prop is falsy the gift
 * TransitionItem child is skipped and only the emoji button renders. The
 * edit forces that prop load to false (6-byte GetById -> LoadConstFalse
 * r16 x3). The flag register is written once and tested once per
 * function (decoder-verified), and the false path is stock behavior, so
 * the emoji button and everything else are untouched.
 *
 * The same flag also gates a gift entry in the ChatInputActions row
 * (attach-sheet actions: PHOTOS/APPS/GIFT-or-THREAD). There the edit
 * replaces the 5-byte gift push (Call2 r13, r15, r12, r13) with
 * Mov r13, r13 + LoadConstFalse r13; both scratch registers die before
 * reuse and the length-based width math below adapts at runtime.
 * Neutering the push (rather than the flag) preserves the stock
 * gift-XOR-thread fallback there.
 *
 * Target analysis (Hermes bytecode v98 in all three builds):
 *
 * RightActions (ChatInputRightActions, flag load @ fn offset 30):
 * - 343.12 Stable: fn 52671 (offset 31111162, 505 bytes).
 * - 342.16 Stable: fn 52380 (offset 30994107, 505 bytes).
 * - 341.13 Stable: fn 52020 (offset 30845510, 501 bytes).
 *
 * Actions row (ChatInputActions, gift push Call2):
 * - 343.12 Stable: fn 51985, gift push at file offset 30962861.
 * - 342.16 Stable: fn 51714, gift push at file offset 30851579.
 * - 341.13 Stable: fn 51354, gift push at file offset 30703459.
 *   (342 and 341 share byte-identical gift-push codegen.)
 *
 * Each site tries its anchors and applies the one found exactly once;
 * anything else fails loudly so a Discord codegen change can never
 * silently corrupt the bundle.
 */
val hideGiftButtonPatch = resourcePatch(
    name = "Hide gift button",
    description = "Hides the gift button in the chat message composer.",
    default = true,
) {
    compatibleWith(DiscordConstants.COMPATIBILITY_DISCORD_COMPOSER)

    execute {
        val bundle = get("assets/index.android.bundle", true)
        val bytes = bundle.readBytes().toMutableList()

        // Site 1: composer bar — force shouldShowGiftButton load to false.
        applyOnce(
            bytes,
            replacement = b("96 10 96 10 96 10"),
            anchors = listOf(
                // 343.12 RightActions (fn 52671).
                b("45 10 05 03 7B 84 45 13 05 04 4F 8E 37 04 01 13"),
                // 342.16 RightActions (fn 52380).
                b("45 10 05 03 EB 12 45 13 05 04 6E 35 37 04 01 13"),
                // 341.13 RightActions (fn 52020).
                b("45 10 05 03 36 85 45 13 05 04 83 79 37 04 01 13"),
            ),
            label = "Gift bar flag",
        )

        // Site 2: actions row — skip the gift actions.push().
        applyOnce(
            bytes,
            replacement = b("10 0D 0D 96 0D"),
            anchors = listOf(
                // 342.16 / 341.13 gift push (identical codegen).
                b("6E 0D 0F 0C 0D AE 20 44 0F 0C 21 C8 02 0D AA 00"),
                // 343.12 gift push.
                b("6E 0D 0F 0C 0D AE 1C 44 0F 0C 24 C8 01 0D AA 00"),
            ),
            label = "Gift actions push",
        )

        bundle.writeBytes(bytes.toByteArray())
    }
}

private fun applyOnce(
    bytes: MutableList<Byte>,
    replacement: ByteArray,
    anchors: List<ByteArray>,
    label: String,
) {
    val matched = anchors.map { it to findAll(bytes, it) }
        .filter { (_, hits) -> hits.isNotEmpty() }
    check(matched.size == 1 && matched[0].second.size == 1) {
        "$label anchor matched ${matched.sumOf { it.second.size }} " +
            "time(s) across ${matched.size} known pattern(s); " +
            "Discord likely changed the bundle - patch needs re-analysis."
    }

    val at = matched[0].second[0]
    replacement.forEachIndexed { i, byte -> bytes[at + i] = byte }
}

private fun b(hex: String): ByteArray =
    hex.split(" ").map { it.toInt(16).toByte() }.toByteArray()

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
