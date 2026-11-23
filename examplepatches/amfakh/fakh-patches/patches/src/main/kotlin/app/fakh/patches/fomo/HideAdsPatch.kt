package app.fakh.patches.fomo

import app.fakh.patches.fomo.shared.Constants.COMPATIBILITY_FOMO
import app.fakh.patches.fomo.shared.HermesBundle
import app.fakh.patches.fomo.shared.HermesBundle.Companion.OP_JMP
import app.fakh.patches.fomo.shared.HermesBundle.Companion.OP_JSTRICT_EQUAL_LONG
import app.fakh.patches.fomo.shared.HermesBundle.Companion.OP_LOAD_CONST_STRING
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder

// FOMO Indonesia is a React Native app: the whole UI is one Hermes bundle,
// `assets/index.android.bundle`. The home feed renders every server item through
// `_renderFeedSelector`. Promotional items carry one of four `item.inner.type`
// values: CLIENT_PROMO and INTERNAL_PROMO (FOMO's own cards and banners) and
// BANNER_PROMO and PROMO (sponsored posts). The function already has an exit that
// renders nothing; the original takes it only for a CLIENT_PROMO that repeats the
// previous item's type.
//
// The code after the `index > 0` guard is rewritten in place, same length, into:
//
//   type = item.inner.type
//   if (type is one of the four promo types) jump to the exit
//   jump past the old code (render the item)
//
// An item at index 0 still renders; the feed puts promos mid-feed. The pattern
// names strings and wildcards registers and cache indexes (see HermesBundle), and a
// pattern that matches anything other than exactly once aborts the patch.

private val PROMO_TYPES = listOf("CLIENT_PROMO", "INTERNAL_PROMO", "BANNER_PROMO", "PROMO")

private const val FEED_SELECTOR_PATTERN = """
    44 ?? ?? ?? @item  44 ?? ?? ?? @inner  44 ?? ?? ?? @type
    90 ?? @@CLIENT_PROMO  D5 ?? ?? ??
    44 ?? ?? ?? @item  44 ?? ?? ?? @inner  44 ?? ?? ?? @type
    44 ?? ?? ?? @state  45 ?? ?? ?? @@dataSource
    8B ?? 01  26 ?? ?? ??  5D ?? ?? ??
    44 ?? ?? ?? @item  44 ?? ?? ?? @inner  44 ?? ?? ?? @type
    D4 ?? ?? ?? ?? ?? ??
"""

// The salary summary upsell ("Mau liat summary?") is the `UnlockSalarySummaryInternalPromo`
// component. Its render returns null for a subscriber and the upsell card for everyone
// else, decided by one `JmpTrue` on `hasFomoPlusSubscription()`. That jump becomes
// unconditional, so the card is never drawn; nothing is unlocked.

private const val SUMMARY_UPSELL_PATTERN = """
    34 ?? ??  3B ?? ?? ??  45 ?? ?? ?? @@hasFomoPlusSubscription  93 ??  6C ?? ?? ??  B0 ?? ??
    3B ?? ?? ??  44 ?? ?? ?? @jsx  3B ?? ?? ??  44 ?? ?? ?? @default
    01 ?? ?? ?? ?? ??  01 ?? ?? ?? ?? ??  02 ?? ?? ?? ?? ?? ?? ?? ?? ??
    52 ?? ?? ??  52 ?? ?? ??  6F ?? ?? ?? ?? ??  76 ??  94 ??  76 ??
"""

private const val SUMMARY_UPSELL_JUMP_AT = 19

@Suppress("unused")
val fomoHideAdsPatch = rawResourcePatch(
    name = "Hide ads",
    description = "Hides the FOMO+ upsell cards and banners.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FOMO)
    category("Ads")

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("FOMO: assets/index.android.bundle not found.")
        }

        val bytes = bundleFile.readBytes()
        val bundle = HermesBundle(bytes)

        bundle.rewrite("promo feed skip", FEED_SELECTOR_PATTERN) { match ->
            val scratch = match[1]
            val type = match[11]
            val lastJump = match.size - 7
            val exit = lastJump + ByteBuffer.wrap(match).order(ByteOrder.LITTLE_ENDIAN).getInt(lastJump + 1)

            // The three leading reads of item.inner.type stay as they are.
            val out = ByteArray(match.size)
            match.copyInto(out, 0, 0, 15)
            var at = 15
            for (name in PROMO_TYPES) {
                val id = bundle.stringId(name)
                out[at] = OP_LOAD_CONST_STRING.toByte()
                out[at + 1] = scratch
                out[at + 2] = id.toByte()
                out[at + 3] = (id shr 8).toByte()
                at += 4
                out[at] = OP_JSTRICT_EQUAL_LONG.toByte()
                ByteBuffer.wrap(out).order(ByteOrder.LITTLE_ENDIAN).putInt(at + 1, exit - at)
                out[at + 5] = type
                out[at + 6] = scratch
                at += 7
            }
            out[at] = OP_JMP.toByte()
            out[at + 1] = (match.size - at).toByte()
            out
        }

        bundle.rewrite("salary summary upsell", SUMMARY_UPSELL_PATTERN) { match ->
            // JmpTrue (3 bytes) becomes Jmp (2 bytes, same offset) plus one dead byte.
            match.copyOf().also {
                it[SUMMARY_UPSELL_JUMP_AT] = OP_JMP.toByte()
                it[SUMMARY_UPSELL_JUMP_AT + 2] = 0
            }
        }

        bundle.seal()
        bundleFile.writeBytes(bytes)
    }
}
