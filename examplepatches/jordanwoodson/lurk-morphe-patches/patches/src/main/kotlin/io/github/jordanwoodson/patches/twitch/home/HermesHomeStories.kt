package io.github.jordanwoodson.patches.twitch.home

import app.morphe.patcher.patch.PatchException
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.hex

internal const val HIDE_STORIES = "hide_home_stories"

// v98 opcodes (BytecodeList.def).
private const val MOV = 0x10
private const val ADD = 0x1e
private const val GET_BY_ID = 0x45
private const val LOAD_CONST_UNDEFINED = 0x93
private const val LOAD_CONST_ZERO = 0x97
private const val JMP_TRUE = 0xb0
private const val JMP_FALSE = 0xb2

/**
 * RN Home shows Stories while its recaps shelf is off: DiscoveryFeedContent reads `recaps = useRecapsShelfEnabled()`
 * and computes `showStoriesShelf = !recaps`, which goes to the top chrome (showStoriesShelf) and to useStoriesShelf
 * (shelfPresent). Stock Twitch with the recaps shelf on is the model for Hide Stories: no shelf, and none of the
 * layout or scrolling that makes room for one. The edits, all under [HIDE_STORIES]:
 *
 * - `Not shown, recaps` negates the hook function instead of its result: a function is truthy, so showStoriesShelf
 *   and shelfPresent are false, and the hook is still called. With a shelf present, a pull at the top of the feed
 *   revealed the hidden shelf instead of refreshing (issue 75).
 * - `offset = recaps ? 0 : shelfHeight + TABS_BAR_MARGIN_TOP` tests showStoriesShelf instead (`JmpTrue end, recaps`
 *   becomes `JmpFalse end, shown`, the same test in stock Twitch). The top chrome is translated by shelfProgress
 *   from -offset (collapsed) to 0, and the Following and Live pages from 0 to offset. TABS_BAR_MARGIN_TOP (28) is the
 *   gap the chrome puts above its tabs only while showStoriesShelf is on, so without a shelf the offset was still 28:
 *   the feed's first upward drag collapses the (now empty) shelf, since useStoriesShelf starts expanded and pinned,
 *   and moved the tabs 28 dp up under the status bar, with no shelf to reveal and bring them back (issue 95).
 * - `pin = recaps ? undefined : feedPinOffsetRef`, FollowingTab's prop, tests showStoriesShelf the same way: with the
 *   ref, Following's onScroll holds its list at the pin until a drag has collapsed the shelf, which is now invisible.
 *
 * Two other reads of recaps stay: they pick the recap cards and the recaps shelf header, which Hide recent streams
 * covers.
 */
internal fun HermesBundle.hideStoriesShelf() {
    val feed = function("DiscoveryFeedContent")
    val body = feed.body
    fun u8(at: Int) = body[at].toInt() and 255
    val hook = hex(id16("useRecapsShelfEnabled"))
    // GetById f, o, cache, "useRecapsShelfEnabled"; Call1 recaps, f, this; Not shown, recaps
    val at = (0..body.size - 13).filter { i ->
        u8(i) == GET_BY_ID && body[i + 4] == hook[0] && body[i + 5] == hook[1] &&
            u8(i + 6) == 0x6c && body[i + 8] == body[i + 1] && body[i + 7] != body[i + 1] &&
            u8(i + 10) == 0x13 && body[i + 12] == body[i + 7]
    }.singleOrNull() ?: fail("Stories shelf flag")
    val recaps = body[at + 7]
    val shown = body[at + 11]
    val before = body.copyOfRange(at + 6, at + 13)
    replace(feed, HIDE_STORIES, before, before.copyOf().also { it[6] = body[at + 1] })

    val starts = controlFlow(feed).map { it.first }
    val branches = starts.filter { it > at + 10 && u8(it) == JMP_TRUE && body[it + 2] == recaps }
    val margin = hex(id16("TABS_BAR_MARGIN_TOP"))
    // LoadConstZero offset; JmpTrue end, recaps; ...; GetById m, _, _, "TABS_BAR_MARGIN_TOP"; Add offset, height, m; end:
    val offset = branches.singleOrNull { b ->
        val end = b + body[b + 1]
        end - 10 > b && end <= body.size && u8(end - 10) == GET_BY_ID && body[end - 6] == margin[0] &&
            body[end - 5] == margin[1] && u8(end - 4) == ADD && body[end - 1] == body[end - 9] &&
            u8(b - 2) == LOAD_CONST_ZERO && body[b - 1] == body[end - 3]
    } ?: fail("Stories shelf offset")
    // GetById ref, shelf, cache, "feedPinOffsetRef" (useStoriesShelf's result)
    val ref = hex(id16("feedPinOffsetRef")).let { id ->
        starts.filter { u8(it) == GET_BY_ID && body[it + 4] == id[0] && body[it + 5] == id[1] }.singleOrNull()
    }?.let { body[it + 1] } ?: fail("feedPinOffsetRef read")
    // LoadConstUndefined pin; JmpTrue end, recaps; Mov pin, ref; end:
    val pin = branches.singleOrNull { b ->
        body[b + 1].toInt() == 6 && u8(b - 2) == LOAD_CONST_UNDEFINED && u8(b + 3) == MOV &&
            body[b + 4] == body[b - 1] && body[b + 5] == ref
    } ?: fail("Following pin offset")
    // The branches read shown in place of recaps, so nothing between the Not and them may write it: no instruction
    // there (but jumps, whose first operand is an address) may have it as its first operand, where Hermes puts the
    // result register.
    val sizes = starts.zipWithNext { a, b -> a to b - a }.toMap()
    if (starts.any { it > at + 10 && it < maxOf(offset, pin) && u8(it) !in 174..218 &&
            (sizes[it] ?: 0) > 1 && body[it + 1] == shown }) fail("Stories shelf flag reuse")
    for (branch in listOf(offset, pin)) {
        replaceAt(feed, HIDE_STORIES, branch, body.copyOfRange(branch, branch + 3),
            byteArrayOf(JMP_FALSE.toByte(), body[branch + 1], shown))
    }
}

private fun fail(what: String): Nothing = throw PatchException("Twitch: unexpected $what in DiscoveryFeedContent")
