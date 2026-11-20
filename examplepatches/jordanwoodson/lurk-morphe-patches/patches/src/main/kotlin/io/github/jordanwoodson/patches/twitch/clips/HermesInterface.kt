package io.github.jordanwoodson.patches.twitch.clips

import app.morphe.patcher.patch.PatchException
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.hex

/** Keep the home pager and tab bar on the same following/live tab source. */
internal fun HermesBundle.hideClipDiscoveryTabs() {
    // The original hook still localizes labels and runs all hooks. Only its final array excludes
    // the Clips object; its memo cache may retain that unused object without changing tab indexes.
    // `[following, live, clips]`: NewArray r3, 3, then one DefineOwnInDenseArray per tab. Only the length and the
    // third entry change, so Hide Live tab (home/HermesHomeTabs.kt) can replace the first two on its own.
    val tabs = function("useFeedTabs")
    val array = find(tabs, hex("08 03 03 00 5a 03 07 00 5a 03 06 01 5a 03 05 02"))
    replaceAt(tabs, "hide_clips", array, hex("08 03 03 00"), hex("08 03 02 00"))
    replaceAt(tabs, "hide_clips", array + 12, hex("5a 03 05 02"), hex("93 00 93 00"))

    // The chrome hook is not the pager's model. Remove the same key before Object.keys builds
    // exported TABS; following/live retain indexes 0/1. Its numeric sort is then redundant.
    // `TABS = Object.keys(FEED_TAB_INDEX).sort(...)`, found by its string operands.
    val objectId = id16("Object")
    val keys = id8("keys")
    val model = matchingFunction(hex("48 04 03 00 $objectId 44 03 04 02 $keys 6e 04 03 04 05 45 03 04 03 ${id16("sort")}"))
    replace(model, "hide_clips", model.body.copyOfRange(0x7a, 0x9a),
        hex("90 07 ${id16("clips")} 63 07 05 07 00 48 04 03 00 $objectId 44 03 04 02 $keys 6e 04 03 04 05 10 01 04 93 00 93 00"))

    // DiscoveryFeedContent's offsets and registers are the compiler's for the supported version: its pager children
    // array is r97, built from r98; the page after the second child starts at 0x6f93.
    val content = function("DiscoveryFeedContent")
    replace(content, "hide_clips", hex("08 61 03 00 5a 61 62 00"), hex("08 61 02 00 5a 61 62 00"))
    // Skip creation and insertion of ClipsFeedPage. The first two children, parent JSX call,
    // scroll ranges and initial selection now all use the same two-entry TABS model. Nothing
    // outside the skipped range jumps into it, and it writes none of the registers read after it.
    // After `children[1] = page`, the clips page's first instruction (GetByIdShort jsxs) becomes a long jump to the
    // parent props after the third child (0x711b). Hide Live tab jumps from the Live page to the same instruction.
    val secondPage = hex("5a 61 62 01 44 66 63 ff ${id8("jsxs")}")
    if (!content.body.copyOfRange(0x6f8f, 0x6f98).contentEquals(secondPage))
        throw PatchException("Twitch: unexpected clip pager children")
    replaceAt(content, "hide_clips", 0x6f93, secondPage.copyOfRange(4, 9), hex("af 88 01 00 00"))

    // Explicit in-feed clip requests use Twitch's existing native clip pager instead. The
    // original t86 callback selected index 2 before injecting a clip, which is no longer valid.
    val entry = matchingFunction(hex("45 03 03 00 ${id16("FEED_TAB_INDEX")} 45 03 03 01 ${id16("clips")}"))
    if (entry.body.size != 71 || entry.frameSize < 6 || entry.numberRegisters + entry.nonPointerRegisters > 2)
        throw PatchException("Twitch: unexpected explicit clip callback registers")
    fun get(dst: Int, src: Int, cache: Int, property: String): ByteArray {
        val id = stringId(property)
        if (id !in 0..65535) throw PatchException("Twitch: native clip property exceeds instruction width")
        return byteArrayOf(0x45, dst.toByte(), src.toByte(), cache.toByte(), id.toByte(), (id ushr 8).toByte())
    }
    val empty = stringId("")
    val native = hex("34 02 01 3b 02 02 04") + // Discovery module's React Native namespace.
        get(2, 2, 0, "NativeModules") + get(2, 2, 1, "TwitchRNHostNavigation") +
        // A read cache index must be below the function's cache size (2 here): 255 would read past it.
        get(3, 2, 1, "openClip") + hex("89 04 01") +
        byteArrayOf(0x90.toByte(), 5, empty.toByte(), (empty ushr 8).toByte()) +
        hex("6f 03 03 02 04 05 93 00 76 00")
    replace(entry, "hide_clips", entry.body, native.copyOf(entry.body.size))

    // The native pager fetches the requested slug itself. The old readiness gate waited for
    // Home feed edges, which could remain empty after falling back from initialTab=clips.
    // The effect still requires a non-empty initialClipSlug and deduplicates it through its ref.
    // `ready = Boolean(clipSlug && !loading && edges.length > 0)`: the Call2 becomes LoadConstTrue r81.
    replace(content, "hide_clips", hex("6e 51 4a 05 23"), hex("95 51 10 51 51"))

    // Give initial clipSlug effects and pending deep-link events the same native callback.
    // Omit one memo dependency save (slot 220), so this small props block recomputes safely.
    // The block builds { initialClipSlug, initialClipReady, collapseStoriesShelf, onTabRequested,
    // onSubfeedRequested, onEntrySurfaceRequested, onEntry, openClipDeepLink, setActiveIndex, scrollToTop } in r35;
    // openClipDeepLink (slot 7) is r86.
    val props = content.body.copyOfRange(0x2391, 0x240c)
    val oldSave = hex("8b 00 dc 60 10 00 56")
    val saveAt = props.indices.singleOrNull { at -> at + oldSave.size <= props.size && props.copyOfRange(at, at + oldSave.size).contentEquals(oldSave) }
        ?: throw PatchException("Twitch: missing clip props memo dependency")
    val updatedProps = props.copyOf()
    if (!updatedProps.copyOfRange(38, 42).contentEquals(hex("52 23 56 07")))
        throw PatchException("Twitch: missing initial clip callback prop")
    // r163 holds the stock clip callback closure, which is created right after this block, so it is
    // free here; r105 is the component's function environment.
    if (!content.body.copyOfRange(3, 5).contentEquals(hex("40 69")))
        throw PatchException("Twitch: unexpected clip feed environment register")
    updatedProps[40] = 163.toByte()
    val closure = byteArrayOf(0x84.toByte(), 163.toByte(), 105, entry.id.toByte(), (entry.id ushr 8).toByte())
    replace(content, "hide_clips", props, closure + updatedProps.copyOfRange(0, saveAt) +
        updatedProps.copyOfRange(saveAt + oldSave.size, updatedProps.size) + hex("93 05"))

    // The former hook handler awaited the in-feed data injector then scrolled that page.
    // Its replacement delegates once and returns undefined, matching all fire-and-forget callers.
    val hookEntry = matchingFunction(hex("3b 03 03 03 70 05 03 01 06 05 04"))
    if (hookEntry.body.size != 86) throw PatchException("Twitch: unexpected clip hook callback")
    replace(hookEntry, "hide_clips", hookEntry.body,
        hex("34 02 00 3b 02 02 03 89 03 01 93 01 6e 02 02 01 03 76 01").copyOf(hookEntry.body.size))

    // Initial params were previously injected by the feed query. Open them through the native
    // callback once; keep the existing slug/ref checks so ordinary rerenders do not reopen it.
    val initial = matchingFunction(hex("34 01 00 3b 03 01 00 b2 27 03 3b 02 01 01 b2 20 02 3b 02 01 08"))
    if (initial.body.size != 50) throw PatchException("Twitch: unexpected initial clip effect")
    val initialBody = hex("93 00 34 01 00 3b 03 01 00 b2 1f 03 3b 02 01 08 44 04 02 00 ${id8("current")} d3 13 04 03 " +
        "4a 02 03 00 ${id16("current")} 3b 01 01 03 6e 01 01 00 03 76 00")
        .copyOf(initial.body.size)
    replace(initial, "hide_clips", initial.body, initialBody)
}

/**
 * Clip shelves in the Home feeds, such as "Clips for you" on the Live tab (issue 89). FeedShelfContainer already
 * renders nothing for a shelf without items, after all of its hooks: `if (items.length === 0) return null; if
 * (x == null) return null`. The second check becomes a jump to a stub that makes the same check and also returns
 * null when the first item is a FeedClip, so every hook still runs and a recycled feed cell keeps its hook order.
 * The stub lives in the shelf's title code, whose "Clips for you" fallback no clip shelf reaches any more: the
 * title is now the shelf's own.
 */
internal fun HermesBundle.hideClipShelves() {
    val shelf = function("FeedShelfContainer")
    val body = shelf.body
    fun u8(at: Int) = body[at].toInt() and 255
    fun s32(at: Int) = (0..3).fold(0) { value, i -> value or (u8(at + i) shl (8 * i)) }
    fun addr32(value: Int) = ByteArray(4) { i -> (value ushr (8 * i)).toByte() }
    fun single(pattern: ByteArray, what: String) = (0..body.size - pattern.size).singleOrNull { at ->
        body.copyOfRange(at, at + pattern.size).contentEquals(pattern)
    } ?: throw PatchException("Twitch: unexpected $what in FeedShelfContainer")

    // `title = node.title || (isAllClips(items) ? formatMessage("Clips for you") : undefined)`, from the
    // GetByIdShort of title (title in r11, the node in r27) up to the fallbackText read, 42 bytes:
    // GetByIdShort r9, r27, title; JmpTrue r9; LoadConstUndefined r11; JmpFalse r30; GetByIdShort formatMessage;
    // NewObjectWithBufferLong; Call2 r11; Jmp; GetByIdShort r11, r27, title; Jmp.
    val title = single(hex("44 09 1b 24 ${id8("title")} b0 1e 09 93 0b b2 17 1e 44 1d 0d 26 ${id8("formatMessage")} 02 09"), "shelf title")
    val titleEnd = title + 42
    if (!body.copyOfRange(title + 33, titleEnd).contentEquals(hex("ae 07 44 0b 1b 24 ${id8("title")} ae 08")) ||
        !body.copyOfRange(titleEnd, titleEnd + 6).contentEquals(hex("45 0b 1c 27 ${id16("fallbackText")}"))) {
        throw PatchException("Twitch: unexpected shelf title flow in FeedShelfContainer")
    }
    val afterTitle = titleEnd + 6 // Where every title path continues.

    // `GetByIdShort r11, r18, length; LoadConstZero r0; JStrictEqualLong ret, r11, r0; JEqualLong ret, r20, r2`.
    val empty = single(hex("44 0b 12 0e ${id8("length")} 97 00 d4"), "empty shelf check")
    val second = empty + 14
    if (u8(second) != 0xd0 || u8(second + 5) != 0x14 || u8(second + 6) != 0x02) {
        throw PatchException("Twitch: unexpected second empty shelf check in FeedShelfContainer")
    }
    val ret = empty + 7 + s32(empty + 8)
    if (second + s32(second + 1) != ret || u8(ret) != 0x76 || u8(ret + 1) != 0x02) {
        throw PatchException("Twitch: the empty shelf checks don't share a return in FeedShelfContainer")
    }
    val resume = second + 7

    val typename = stringId("__typename")
    val clip = stringId("FeedClip")
    // The cache slot of `items.length` (14): an array, never of a feed item's hidden class.
    val readTypename = if (typename < 256) hex("44 0b 0b 0e") + byteArrayOf(typename.toByte())
        else if (typename < 65536) hex("45 0b 0b 0e") + byteArrayOf(typename.toByte(), (typename ushr 8).toByte())
        else throw PatchException("Twitch: __typename has no 16-bit string ID")
    val loadClip = if (clip < 65536) hex("90 00") + byteArrayOf(clip.toByte(), (clip ushr 8).toByte())
        else hex("91 00") + addr32(clip)

    // The stub starts where the original JmpTrue ended: a jump may only land on an original instruction start.
    val stub = title + 8
    var at = stub
    val code = mutableListOf<ByteArray>()
    fun emit(bytes: ByteArray) { code += bytes; at += bytes.size }
    emit(hex("d0") + addr32(ret - at) + hex("14 02")) // JEqualLong ret, r20, r2: the second check, as before.
    emit(hex("5e 0b 12 00")) // GetByIndex r11, r18, 0: there is a first item.
    emit(readTypename) // r11 = r11.__typename
    emit(loadClip) // r0 = "FeedClip"
    emit(hex("d4") + addr32(ret - at) + hex("0b 00")) // JStrictEqualLong ret, r11, r0
    emit(hex("af") + addr32(resume - at)) // JmpLong back after the checks.
    val titleCode = hex("44 0b 1b 24 ${id8("title")} ae") + byteArrayOf((afterTitle - (title + 5)).toByte())
    val replacement = (listOf(titleCode, ByteArray(1)) + code).fold(ByteArray(0)) { all, part -> all + part }
    if (replacement.size > 42 || afterTitle - (title + 5) > 127) throw PatchException("Twitch: clip shelf stub doesn't fit")
    replace(shelf, "hide_clips", body.copyOfRange(title, titleEnd), replacement.copyOf(42))
    replace(shelf, "hide_clips", body.copyOfRange(second, second + 7), (hex("af") + addr32(stub - second)).copyOf(7))
}

internal fun HermesBundle.hideBitsInterface() {
    falseProperty("ChatComposerBar", "showBitsButton", "hide_tipping")
    falseProperty("OneChatOverlayHost", "showCheerButton", "hide_tipping")
    falseProperty("OverlayActionButtons", "showCheerButton", "hide_tipping")
    listOf("AddBitsChipButton", "BuyBitsCard", "BitsTrayContainer", "QuickCheeringSurface").forEach {
        returnNull(it, "hide_tipping")
    }
}

internal fun HermesBundle.hideSubscriptionInterface() {
    // Gift and promotional UI never carries the existing subscribed indicator.
    listOf("GiftButton", "GiftSubLink", "TurboUpsellButton", "TheatreSDAUpsell").forEach {
        returnNull(it, "hide_subscription_upsells")
    }
    falseProperty("SubscribeButton", "isUpgrade", "hide_subscription_upsells")

    // SubscribeButton renders a text button, an icon button or (since 31.9.0) a primary-variant button. Each
    // path has a compiler memo-cache save block immediately before return. Use its last 19 bytes for a result
    // guard, and redirect the corresponding cache-hit edge through that guard. All React hooks and the
    // original subscribed element remain intact. The replaced cache entries merely recompute.
    val function = function("SubscribeButton")
    if (function.frameSize <= 5 || function.numberRegisters + function.nonPointerRegisters > 5) {
        throw PatchException("Twitch: subscribed result guard has no safe pointer register")
    }
    val id = stringId("isSubscribed")
    if (id !in 0..65535) throw PatchException("Twitch: subscribed property exceeds instruction width")
    fun guard(result: Int) = byteArrayOf(
        0x10, 4, result.toByte(), // Mov output, computed JSX element.
        0x89.toByte(), 5, 1, // LoadParam props.
        0x45, 5, 5, 1, id.toByte(), (id ushr 8).toByte(), // GetById isSubscribed.
        0xb0.toByte(), 5, 5, // JmpTrue to Ret.
        0x94.toByte(), 4, // LoadConstNull for a non-subscriber.
        0x76, 4, // Ret.
    )
    // Text button: slots 44/45, element r16, cache hit JmpLong at 0x3e5 (to the Ret at 0x47f, now 0x471).
    replace(function, "hide_subscription_upsells",
        hex("8b 00 2c 60 06 00 0e 8b 00 2d 60 06 00 10 10 04 10 76 04"), guard(16))
    replace(function, "hide_subscription_upsells", hex("af 9a 00 00 00"), hex("af 8c 00 00 00"))
    // Icon button: slots 34/35, element r14, cache hit Jmp at 0x55d (to 0x5d3, now 0x5c5).
    replace(function, "hide_subscription_upsells",
        hex("8b 00 22 60 06 00 07 8b 00 23 60 06 00 0e 10 04 0e 76 04"), guard(14))
    replace(function, "hide_subscription_upsells", hex("ae 76"), hex("ae 68"))
    // Primary button: slots 23/24, element r5, cache hit Jmp at 0x60b (to 0x672, now 0x664).
    replace(function, "hide_subscription_upsells",
        hex("8b 00 17 60 06 00 07 8b 00 18 60 06 00 05 10 04 05 76 04"), guard(5))
    replace(function, "hide_subscription_upsells", hex("ae 67"), hex("ae 59"))
}
