package io.github.jordanwoodson.patches.twitch.clips

import app.morphe.patcher.patch.PatchException
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.hex

/** Keep the home pager and tab bar on the same following/live tab source. */
internal fun HermesBundle.hideClipDiscoveryTabs() {
    // The original hook still localizes labels and runs all hooks. Only its final array excludes
    // the Clips object; its memo cache may retain that unused object without changing tab indexes.
    replace("useFeedTabs", "hide_clips",
        hex("08 03 03 00 5a 03 07 00 5a 03 06 01 5a 03 05 02"),
        hex("08 03 02 00 5a 03 07 00 5a 03 06 01 93 00 93 00"))

    // The chrome hook is not the pager's model. Remove the same key before Object.keys builds
    // exported TABS; following/live retain indexes 0/1. Its numeric sort is then redundant.
    // `TABS = Object.keys(FEED_TAB_INDEX).sort(...)`, found by its string operands.
    val objectId = id16("Object")
    val keys = id8("keys")
    val model = matchingFunction(hex("48 04 03 00 $objectId 44 03 04 02 $keys 6e 04 03 04 05 45 03 04 03 ${id16("sort")}"))
    replace(model, "hide_clips", model.body.copyOfRange(0x7a, 0x9a),
        hex("90 07 ${id16("clips")} 63 07 05 07 00 48 04 03 00 $objectId 44 03 04 02 $keys 6e 04 03 04 05 10 01 04 93 00 93 00"))

    // DiscoveryFeedContent's offsets and registers are the compiler's for the supported version: its pager children
    // array is r96, built from r97; the page after the second child starts at 0x6de4.
    val content = function("DiscoveryFeedContent")
    replace(content, "hide_clips", hex("08 60 03 00 5a 60 61 00"), hex("08 60 02 00 5a 60 61 00"))
    // Skip creation and insertion of ClipsFeedPage. The first two children, parent JSX call,
    // scroll ranges and initial selection now all use the same two-entry TABS model. Nothing
    // outside the skipped range jumps into it, and it writes none of the registers read after it.
    // `children[1] = page; jsxs`, then a long jump to the parent props after the third child (0x6f61).
    val secondPage = hex("5a 60 61 01 44 65 62 ff ${id8("jsxs")}")
    if (!content.body.copyOfRange(0x6de0, 0x6de9).contentEquals(secondPage))
        throw PatchException("Twitch: unexpected clip pager children")
    replace(content, "hide_clips", secondPage, hex("5a 60 61 01 af 7d 01 00 00"))

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
        get(3, 2, 255, "openClip") + hex("89 04 01") +
        byteArrayOf(0x90.toByte(), 5, empty.toByte(), (empty ushr 8).toByte()) +
        hex("6f 03 03 02 04 05 93 00 76 00")
    replace(entry, "hide_clips", entry.body, native.copyOf(entry.body.size))

    // The native pager fetches the requested slug itself. The old readiness gate waited for
    // Home feed edges, which could remain empty after falling back from initialTab=clips.
    // The effect still requires a non-empty initialClipSlug and deduplicates it through its ref.
    // `ready = Boolean(clipSlug && !loading && edges.length > 0)`: the Call2 becomes LoadConstTrue r82.
    replace(content, "hide_clips", hex("6e 52 4c 05 29"), hex("95 52 10 52 52"))

    // Give initial clipSlug effects and pending deep-link events the same native callback.
    // Omit one memo dependency save (slot 206), so this small props block recomputes safely.
    val props = content.body.copyOfRange(0x222f, 0x2294)
    val oldSave = hex("8b 00 ce 60 10 00 55")
    val saveAt = props.indices.singleOrNull { at -> at + oldSave.size <= props.size && props.copyOfRange(at, at + oldSave.size).contentEquals(oldSave) }
        ?: throw PatchException("Twitch: missing clip props memo dependency")
    val updatedProps = props.copyOf()
    if (!updatedProps.copyOfRange(30, 34).contentEquals(hex("52 29 55 05")))
        throw PatchException("Twitch: missing initial clip callback prop")
    // r160 holds the stock clip callback closure, which is created right after this block, so it is
    // free here; r104 is the component's function environment.
    if (!content.body.copyOfRange(3, 5).contentEquals(hex("40 68")))
        throw PatchException("Twitch: unexpected clip feed environment register")
    updatedProps[32] = 160.toByte()
    val closure = byteArrayOf(0x84.toByte(), 160.toByte(), 104, entry.id.toByte(), (entry.id ushr 8).toByte())
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
    // Primary button: slots 23/24, element r5, cache hit Jmp at 0x60b (to 0x676, now 0x668).
    replace(function, "hide_subscription_upsells",
        hex("8b 00 17 60 06 00 07 8b 00 18 60 06 00 05 10 04 05 76 04"), guard(5))
    replace(function, "hide_subscription_upsells", hex("ae 6b"), hex("ae 5d"))
}
