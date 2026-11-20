package io.github.jordanwoodson.patches.twitch.home

import app.morphe.patcher.patch.PatchException
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.hex

internal const val HIDE_LIVE_TAB = "hide_home_live"

/**
 * RN Home's tabs are positions: Following 0, Live 1, Clips 2, in the tab row (useFeedTabs), the pager's pages
 * (DiscoveryFeedContent's children array), FEED_TAB_INDEX and TABS, and the index comparisons of the feed. Hide Clips
 * drops the last position. Hiding Live removes the middle one, so Clips moves to 1: every structure loses its entry
 * 1 and every comparison with Clips' index compares with 1, while comparisons with Live's become false.
 *
 * Each structural edit removes entry 1 from whatever Hide Clips left (a length becomes its length minus one), on
 * bytes Hide Clips doesn't touch, so either switch works alone and with both on Home is Following only. Offsets,
 * registers and closures below are the compiler's for the supported version; every edit is checked by
 * HermesBundle.requireSafeEdit, and tests/twitch/HomeLiveTabProbe.kt runs the edited code in all four combinations.
 *
 * The added code reads and writes `length` by value (GetByVal, PutByValLoose), not by ID: an ID instruction's cache
 * index must be below the function's cache size, and index 255 is only the shared overflow entry of functions with
 * 256 entries. In a small function it reads and writes past the cache, which crashed the JS thread on a phone.
 */
internal fun HermesBundle.hideHomeLiveTab() {
    hideLiveTabIndex()
    hideLiveTabRow()
    hideLivePage()
    remapFeedIndexes()
    hideLiveButtons()
}

private fun fail(what: String): Nothing = throw PatchException("Twitch: unexpected $what for Hide Live tab")

private fun ByteArray.u32(at: Int) = (0..3).fold(0) { value, i -> value or ((this[at + i].toInt() and 255) shl (8 * i)) }

private fun addr32(value: Int) = ByteArray(4) { i -> (value ushr (8 * i)).toByte() }

private fun join(vararg parts: ByteArray) = parts.fold(ByteArray(0)) { all, part -> all + part }

/** A replacement of [size] bytes: [code], then Unreachable (0) after its last jump, which nothing reaches. */
private fun padded(code: ByteArray, size: Int, what: String): ByteArray {
    if (code.size > size) fail("$what (${code.size} bytes for $size)")
    return code.copyOf(size)
}

/**
 * `FEED_TAB_INDEX = {following: 0, live: 1, clips: 2}` is an object literal: a shape (its keys) and values. The shape
 * {following, clips}, which the bundle already has, reads the first two values: {following: 0, clips: 1}, and
 * `TABS = Object.keys(...)` becomes [following, clips]. Hide Clips then deletes clips: {following: 0}.
 */
private fun HermesBundle.hideLiveTabIndex() {
    val model = matchingFunction(hex("48 04 03 00 ${id16("Object")} 44 03 04 02 ${id8("keys")} " +
        "6e 04 03 04 05 45 03 04 03 ${id16("sort")}"))
    // NewObjectWithBufferLong r5, shape, values; PutByIdLoose r2, r5, FEED_TAB_INDEX
    val store = find(model, hex("4a 02 05 00 ${id16("FEED_TAB_INDEX")}"))
    val literal = store - 10
    val body = model.body
    if (literal < 0 || body[literal].toInt() != 0x02 || body[literal + 1].toInt() != 5) fail("FEED_TAB_INDEX literal")
    val shape = body.u32(literal + 2)
    val values = body.u32(literal + 6)
    if (objectShapeKeys(shape) != listOf("following", "live", "clips") ||
        literalValues(values, 3).map { (it as? Number)?.toDouble() } != listOf(0.0, 1.0, 2.0)) {
        fail("FEED_TAB_INDEX keys or values")
    }
    val before = body.copyOfRange(literal, literal + 10)
    replaceAt(model, HIDE_LIVE_TAB, literal, before,
        join(byteArrayOf(0x02, 5), addr32(objectShape("following", "clips")), addr32(values)), defaultEnabled = false)
}

/**
 * useFeedTabs builds each tab object (label and memo cache) in its own block, then `[following, live, clips]` as
 * NewArray r3, 3 and three DefineOwnInDenseArray. The Live block becomes a jump past it, which leaves r6 (its object,
 * read only by the memo check and the array) undefined, and a stub in its bytes that the array's first two
 * definitions jump to: following at 0, clips at 1, then `length -= 1` (3 to 2, or 2 to 1 with Hide Clips' shorter
 * array), and on after the third definition, which Hide Clips owns. The memo cache keeps the shortened array.
 */
private fun HermesBundle.hideLiveTabRow() {
    val tabs = function("useFeedTabs")
    val array = find(tabs, hex("08 03 03 00 5a 03 07 00 5a 03 06 01 5a 03 05 02"))
    // Each block starts by comparing its label's cache entry: GetByIndex r2, r4, 4 (Live) and 8 (Clips).
    val live = find(tabs, hex("5e 02 04 04 d5 0a 02 05"))
    val clips = find(tabs, hex("5e 02 04 08 d5 0a 02 05"))
    if (clips - live !in 40..127 || array < clips) fail("useFeedTabs blocks")
    val stub = live + 4
    val code = join(
        hex("93 06"), // LoadConstUndefined r6
        byteArrayOf(0xae.toByte(), (clips - (live + 2)).toByte()), // Jmp to the Clips block
        hex("5a 03 07 00 5a 03 05 01"), // DefineOwnInDenseArray r3, r7, 0; r3, r5, 1
        // r2 = "length"; r0 = r3[r2]; r0--; r3[r2] = r0 (r0 is a number register, free until the memo saves).
        hex("90 02 ${id16("length")} 5d 00 03 02 2f 00 00 60 03 02 00"),
        hex("af"), addr32(array + 16 - (stub + 23)), // JmpLong past the array's third definition
    )
    replaceAt(tabs, HIDE_LIVE_TAB, live, tabs.body.copyOfRange(live, clips), padded(code, clips - live, "tab row stub"),
        defaultEnabled = false)
    replaceAt(tabs, HIDE_LIVE_TAB, array + 4, tabs.body.copyOfRange(array + 4, array + 12),
        padded(join(hex("af"), addr32(stub - (array + 4))), 8, "tab row jump"), defaultEnabled = false)
}

/**
 * DiscoveryFeedContent's pager children: NewArray r97, 3, the Following page at 0, the Live page at 1 (0x6dd6 to
 * 0x6f8f), the Clips page at 2, then the pager's props. The Live page's code becomes a stub: the two values it leaves
 * for the Clips page (r103 = "#000000", r105 = "light"), `length -= 1`, and a jump to the Clips page, whose first
 * instruction is Hide Clips' jump to the props. The Clips page is defined at 1 (DefineOwnByIndex, which doesn't
 * need the array dense).
 */
private fun HermesBundle.hideLivePage() {
    val content = function("DiscoveryFeedContent")
    val jsxs = id8("jsxs")
    val first = find(content, hex("08 61 03 00 5a 61 62 00 44 66 63 ff $jsxs"))
    val second = find(content, hex("5a 61 62 01 44 66 63 ff $jsxs"))
    val third = find(content, hex("5a 61 62 02 52 5e 61 08"))
    val live = first + 8
    if (live != 0x6dd6 || second != 0x6f8f || third != 0x7117) fail("pager children")
    val body = content.body
    val black = hex("91 67") + addr32(stringId("#000000"))
    val light = hex("90 69 ${id16("light")}")
    if (find(content, black) !in live until second || find(content, light) !in live until second) fail("Live page values")
    val code = join(black, light,
        hex("90 62 ${id16("length")} 5d 65 61 62 2f 65 65 60 61 62 65"), // r98 = "length"; r101 = r97[r98]; r101--; r97[r98] = r101
        hex("af"), addr32(second + 4 - (live + 25)), // JmpLong to the Clips page (Hide Clips: to the props)
    )
    replaceAt(content, HIDE_LIVE_TAB, live, body.copyOfRange(live, second), padded(code, second - live, "pager stub"),
        defaultEnabled = false)
    replaceAt(content, HIDE_LIVE_TAB, third, hex("5a 61 62 02"), hex("58 61 62 01"), defaultEnabled = false)
}

/** Clips' index (2) becomes 1; Live's (1) matches nothing. */
private fun HermesBundle.remapFeedIndexes() {
    val content = function("DiscoveryFeedContent")
    // freeScrollLive = freeScroll && activeIndex === 1 (r90 is activeIndex, r1 holds 1): false.
    replaceAt(content, HIDE_LIVE_TAB, find(content, hex("8b 01 01 17 1a 5a 01")) + 3, hex("17 1a 5a 01"),
        hex("96 1a 96 1a"), defaultEnabled = false)
    // clipsActive = activeIndex === 2 (r0 holds 2) ... liveActive = activeIndex === 1, with r1 = 1 loaded between.
    // Loading r1 first makes room: clipsActive = activeIndex === 1, liveActive = false; r1 still ends up 1.
    val active = hex("17 0c 5a 00 10 94 84 b2 06 0c 10 94 38 b2 06 89 10 94 38 37 69 1a 94 8b 01 01 17 0b 5a 01")
    replace(content, HIDE_LIVE_TAB, active,
        hex("8b 01 01 17 0c 5a 01 10 94 84 b2 06 0c 10 94 38 b2 06 89 10 94 38 37 69 1a 94 96 0b 96 0b"),
        defaultEnabled = false)
    // useState(initialIndex === 2) (the Clips page mounted) and `activeIndex !== 2`: r1 holds 1 on every path here.
    replace(content, HIDE_LIVE_TAB, hex("17 07 19 00 6e 1a 12 1a 07"), hex("17 07 19 01 6e 1a 12 1a 07"), defaultEnabled = false)
    replace(content, HIDE_LIVE_TAB, hex("19 36 5a 00"), hex("19 36 5a 01"), defaultEnabled = false)

    // Closures comparing activeIndex (environment slot 7) or a visible page with 2: LoadConstUInt8 2 becomes 1.
    fun clipsIndex(anchor: String, at: Int) {
        val function = matchingFunction(hex(anchor))
        val offset = find(function, hex(anchor)) + at
        val load = function.body.copyOfRange(offset, offset + 3)
        if (load[0].toInt() and 255 != 0x8b || load[2].toInt() != 2) fail("Clips index load")
        replaceAt(function, HIDE_LIVE_TAB, offset, load, byteArrayOf(load[0], load[1], 1), defaultEnabled = false)
    }
    // The pager's visible pages mount the Clips page once the last visible one is 2.
    clipsIndex("89 05 02 8b 00 02 d5 20 05 00 45 05 04 02 ${id16("clips")}", 3)
    // The feed list's scroll handler, its paged-snap timeout and its scroll-end handler on the Clips page.
    clipsIndex("3b 0a 05 07 8b 01 02 d5 50 0a 01", 4)
    clipsIndex("3b 04 03 07 8b 00 02 d5 34 04 00 3b 04 03 64", 4)
    clipsIndex("3b 04 03 07 8b 00 02 d5 36 04 00 3b 04 03 64", 4)
    // useStoriesShelf scrolls the feed list to the top on expanding, except on the Clips page (activeTab !== 2).
    clipsIndex("34 04 00 3b 05 04 00 8b 00 02 19 03 05 00 b2 27 03", 7)

    // useFeedData: isClips = activeTab === 2 picks the Clips feed. r6 holds false (isStaff's default), which compares
    // as 0, and the active tab is 0 or 1 with Live hidden: activeTab > 0.
    val feed = function("useFeedData")
    if (feed.body.copyOfRange(0x77, 0x79).contentEquals(hex("96 06")).not()) fail("useFeedData's false register")
    replace(feed, HIDE_LIVE_TAB, hex("8b 00 02 17 07 13 00"), hex("8b 00 02 1c 07 13 06"), defaultEnabled = false)

    // The placeholder shown while the feed loads marks `FEED_TAB_INDEX[initialTab ?? "live"]`, and a plain launch
    // passes initialTab "live": mark following (the jump skips taking initialTab).
    val cover = function("FeedCoverPlaceholder")
    replace(cover, HIDE_LIVE_TAB, hex("90 0a ${id16("live")} d3 07 04 01 10 0a 04"),
        hex("90 0a ${id16("following")} ae 07 00 00 10 0a 04"), defaultEnabled = false)
}

/**
 * Following's empty states offer buttons that open the Live tab (onNavigateToLive, `setActiveIndex(1)`): "Explore
 * Live" when no followed channel is live and "Let's Go!" when the account follows no one. Each is one element of its
 * parent's children array; that definition repeats the one before it instead, which leaves a hole React renders as
 * nothing. The callback itself selects Following (0).
 */
private fun HermesBundle.hideLiveButtons() {
    val following = function("FollowingTabContent")
    // "They'll be back!": NewArray r40, 4 with the Explore Live view (r31) last.
    replace(following, HIDE_LIVE_TAB, hex("08 28 04 00 5a 28 29 00 5a 28 25 01 5a 28 20 02 5a 28 1f 03"),
        hex("08 28 04 00 5a 28 29 00 5a 28 25 01 5a 28 20 02 5a 28 25 01"), defaultEnabled = false)
    // The empty state: NewArray r23, 8 with the Let's Go! view (r16) at 5.
    replace(following, HIDE_LIVE_TAB, hex("5a 17 11 04 5a 17 10 05 5a 17 0f 06"),
        hex("5a 17 11 04 5a 17 11 04 5a 17 0f 06"), defaultEnabled = false)
    // DiscoveryFeedContent's onNavigateToLive: `setActiveIndex(1)` (environment slot 8).
    val navigate = matchingFunction(hex("34 02 00 3b 02 02 08 8b 00 01 93 01 6e 02 02 01 00 76 02"))
    if (navigate.body.size != 19) fail("onNavigateToLive")
    replaceAt(navigate, HIDE_LIVE_TAB, 7, hex("8b 00 01"), hex("8b 00 00"), defaultEnabled = false)
}
