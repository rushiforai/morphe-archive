package io.github.jordanwoodson.patches.twitch.home

import io.github.jordanwoodson.patches.twitch.clips.hideClipDiscoveryTabs
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.HermesFunction
import io.github.jordanwoodson.patches.twitch.shared.hex
import java.io.File

/**
 * Hide Live tab (issue 73) with Hide Clips, in all four combinations: a small interpreter runs the edited RN Home code
 * of the pinned stock bundle (tab index and TABS, the tab row with its memo cache, the pager's children, the initial
 * tab, the index comparisons and the Clips mount) and checks that tab row, pages and indexes agree. Registers the
 * skipped Live page used to set are left unset, so reading one before writing it fails.
 *
 * Usage: HomeLiveTabProbeKt <stock index.android.bundle>
 */
fun main(args: Array<String>) {
    val stock = File(args[0]).readBytes()
    val bundle = HermesBundle(stock)
    bundle.hideClipDiscoveryTabs()
    bundle.hideHomeLiveTab()
    check(bundle.edits.map { it.key }.toSet() == setOf("hide_clips", HIDE_LIVE_TAB))
    check(bundle.edits.filter { it.key == HIDE_LIVE_TAB }.none { it.defaultEnabled }) { "Hide Live tab must default off" }
    bundle.edits.filter { it.key == HIDE_LIVE_TAB }.forEach { checkNoPropertyCache(it.replacement) }
    for (clips in listOf(false, true)) for (live in listOf(false, true)) {
        val bytes = stock.copyOf()
        bundle.edits.filter { (it.key == "hide_clips" && clips) || (it.key == HIDE_LIVE_TAB && live) }
            .forEach { it.replacement.copyInto(bytes, it.offset) }
        val tabs = listOfNotNull("following", "live".takeUnless { live }, "clips".takeUnless { clips })
        HomeTabs(bundle, bytes, tabs).verify()
        println("PASS: Hide Clips ${if (clips) "on" else "off"}, Hide Live tab ${if (live) "on" else "off"}: $tabs")
    }
    println("PASS: tab index, TABS, tab row (and its memo), pages, initial tab, index comparisons and Clips mount agree")
}

/**
 * Hide Live tab's replacements decode to instructions without a property cache index (no GetById, PutById, ...): an
 * index must be below the function's cache size, and 255 is only the overflow entry of functions that have 256.
 */
private fun checkNoPropertyCache(code: ByteArray) {
    // Lengths of the opcodes the replacements may use (BytecodeList.def at v98); anything else fails.
    val lengths = mapOf(0x00 to 1, 0x02 to 10, 0x08 to 4, 0x10 to 3, 0x17 to 4, 0x19 to 4, 0x1c to 4, 0x2f to 3,
        0x34 to 3, 0x37 to 4, 0x3b to 4, 0x58 to 4, 0x5a to 4, 0x5d to 4, 0x60 to 4, 0x6e to 5, 0x76 to 2, 0x8b to 3,
        0x90 to 4, 0x91 to 6, 0x93 to 2, 0x96 to 2, 0xae to 2, 0xaf to 5, 0xb2 to 3, 0xd3 to 4)
    var at = 0
    while (at < code.size) {
        val op = code[at].toInt() and 255
        at += lengths[op] ?: error("opcode ${op.toString(16)} in a Hide Live tab replacement")
    }
    check(at == code.size)
}

private object Undefined { override fun toString() = "undefined" }
private object Hole { override fun toString() = "<hole>" }
private class JsObject(val props: LinkedHashMap<String, Any?> = linkedMapOf()) { override fun toString() = "$props" }
private class JsArray(val items: MutableList<Any?>) { override fun toString() = "$items" }
private class Fn(val name: String, val call: (Any?, List<Any?>) -> Any?) { override fun toString() = "fn $name" }
private class Env(val slots: MutableMap<Int, Any?> = mutableMapOf(), val parent: Env? = null)
/** A value the probe doesn't model (a module, a hook, a style): reads give more of it, calls give an element. */
private class Opaque(val name: String) { override fun toString() = name }
private class Element(val type: Any?, val props: Any?) { override fun toString() = "<$type>" }

private class HomeTabs(val bundle: HermesBundle, val bytes: ByteArray, val tabs: List<String>) {
    val index = tabs.withIndex().associate { (i, tab) -> tab to i }

    fun truth(v: Any?) = !(v == null || v === Undefined || v == false || v == 0 || v == 0.0 || v == "")
    fun same(a: Any?, b: Any?): Boolean = when {
        a is Number && b is Number -> a.toDouble() == b.toDouble()
        a is String || b is String -> a == b
        else -> a === b || (a == null && b == null)
    }
    /** `==` for the values here: null and undefined are equal to each other only. */
    fun loose(a: Any?, b: Any?) = if ((a == null || a === Undefined) || (b == null || b === Undefined))
        (a == null || a === Undefined) && (b == null || b === Undefined) else same(a, b)
    fun number(v: Any?): Double = when (v) { is Number -> v.toDouble(); false, null -> 0.0; true -> 1.0; else -> error("not a number: $v") }

    fun property(target: Any?, key: Any?): Any? = when (target) {
        is JsObject -> if (target.props.containsKey(key.toString())) target.props[key.toString()] else Undefined
        is JsArray -> when (key) {
            "length" -> target.items.size
            "findIndex" -> Fn("findIndex") { _, a -> target.items.indexOfFirst { truth((a[0] as Fn).call(Undefined, listOf(it))) } }
            "indexOf" -> Fn("indexOf") { _, a -> target.items.indexOfFirst { same(it, a[0]) } }
            "sort" -> Fn("sort") { _, a ->
                val compare = a[0] as Fn
                target.items.sortWith { x, y -> number(compare.call(Undefined, listOf(x, y))).compareTo(0.0) }
                target
            }
            is Number -> target.items.getOrElse(key.toInt()) { Undefined }.let { if (it === Hole) Undefined else it }
            else -> error("unmodelled array property $key")
        }
        is Opaque -> Opaque("${target.name}.$key")
        is Element -> Opaque("$target.$key")
        else -> error("property $key of $target")
    }

    fun setProperty(target: Any?, key: String, value: Any?) {
        when (target) {
            is JsObject -> target.props[key] = value
            is JsArray -> {
                check(key == "length") { "array property $key" }
                val length = number(value).toInt()
                while (target.items.size > length) target.items.removeAt(target.items.size - 1)
                while (target.items.size < length) target.items += Hole
            }
            is Opaque -> Unit
            else -> error("set $key on $target")
        }
    }

    fun call(f: Any?, self: Any?, a: List<Any?>): Any? = when (f) {
        is Fn -> f.call(self, a)
        // jsx(type, props) and the like.
        is Opaque -> Element(a.getOrNull(0) ?: f, a.getOrNull(1))
        else -> error("call of $f")
    }

    /** Runs function [id] from [start] until [stop] (or its Ret) on [r]; registers not in [r] are unset. */
    fun run(id: Int, start: Int, stop: Int, r: MutableMap<Int, Any?>, env: Env?, params: List<Any?> = emptyList()): Any? {
        val f: HermesFunction = bundle.functions[id]
        val b = bytes.copyOfRange(f.offset, f.offset + f.body.size)
        var pc = start
        fun u(n: Int) = b[pc + n].toInt() and 255
        fun u16(n: Int) = u(n) or (u(n + 1) shl 8)
        fun s8(n: Int) = b[pc + n].toInt()
        fun s32(n: Int) = (0..3).fold(0) { v, i -> v or (u(n + i) shl (8 * i)) }
        fun reg(n: Int): Any? {
            val register = u(n)
            check(r.containsKey(register)) { "r$register read before written in ${f.name} #$id at ${pc.toString(16)}" }
            return r[register]
        }
        fun set(n: Int, v: Any?) { r[u(n)] = v }
        fun literal(shape: Int, values: Int) = JsObject(LinkedHashMap<String, Any?>().apply {
            val keys = bundle.objectShapeKeys(shape)
            keys.zip(bundle.literalValues(values, keys.size)).forEach { (k, v) -> put(k.toString(), if (v == Unit) Undefined else v) }
        })
        repeat(100_000) {
            if (pc == stop) return Undefined
            when (val op = u(0)) {
                0x00 -> error("Unreachable executed in ${f.name} #$id at ${pc.toString(16)}")
                0x01 -> { set(1, literal(u16(2), u16(4))); pc += 6 }
                0x02 -> { set(1, literal(s32(2), s32(6))); pc += 10 }
                0x04 -> { set(1, JsObject()); pc += 2 }
                0x08 -> { set(1, JsArray(MutableList(u16(2)) { Hole })); pc += 4 }
                0x10 -> { set(1, reg(2)); pc += 3 }
                0x16 -> { set(1, loose(reg(2), reg(3))); pc += 4 }
                0x17 -> { set(1, same(reg(2), reg(3))); pc += 4 }
                0x19 -> { set(1, !same(reg(2), reg(3))); pc += 4 }
                0x1b -> { set(1, number(reg(2)) <= number(reg(3))); pc += 4 }
                0x1c -> { set(1, number(reg(2)) > number(reg(3))); pc += 4 }
                0x1e -> { set(1, number(reg(2)) + number(reg(3))); pc += 4 }
                0x26 -> { set(1, number(reg(2)) - number(reg(3))); pc += 4 }
                0x2f -> { set(1, number(reg(2)) - 1); pc += 3 }
                0x34 -> { var e = env; repeat(u(2)) { e = e!!.parent }; set(1, e); pc += 3 }
                0x37 -> { (reg(1) as Env).slots[u(2)] = reg(3); pc += 4 }
                0x3b -> { set(1, (reg(2) as Env).slots.getOrElse(u(3)) { Undefined }); pc += 4 }
                0x44 -> { set(1, property(reg(2), bundle.strings[u(4)])); pc += 5 }
                0x45, 0x48 -> { set(1, property(reg(2), bundle.strings[u16(4)])); pc += 6 }
                0x4a -> { setProperty(reg(1), bundle.strings[u16(4)], reg(2)); pc += 6 }
                0x52 -> { val o = reg(1) as JsObject; o.props[o.props.keys.elementAt(u(3))] = reg(2); pc += 4 }
                0x58 -> { val a = reg(1) as JsArray; while (a.items.size <= u(3)) a.items += Hole; a.items[u(3)] = reg(2); pc += 4 }
                0x5a -> {
                    val a = reg(1) as JsArray
                    check(u(3) < a.items.size) { "DefineOwnInDenseArray past the length in ${f.name} at ${pc.toString(16)}" }
                    a.items[u(3)] = reg(2); pc += 4
                }
                0x5d -> { set(1, property(reg(2), reg(3).let { if (it is Number) it.toInt() else it })); pc += 4 }
                0x5e -> { set(1, property(reg(2), u(3))); pc += 4 }
                0x60 -> {
                    when (val t = reg(1)) {
                        is JsArray -> if (reg(2) == "length") setProperty(t, "length", reg(3)) else t.items[number(reg(2)).toInt()] = reg(3)
                        is JsObject -> t.props[reg(2).toString()] = reg(3)
                        else -> error("PutByVal on $t")
                    }
                    pc += 4
                }
                0x63 -> { (reg(2) as JsObject).props.remove(reg(3).toString()); set(1, true); pc += 5 }
                0x6c -> { set(1, call(reg(2), reg(3), emptyList())); pc += 4 }
                0x6e -> { set(1, call(reg(2), reg(3), listOf(reg(4)))); pc += 5 }
                0x6f -> { set(1, call(reg(2), reg(3), listOf(reg(4), reg(5)))); pc += 6 }
                0x76 -> return reg(1)
                0x84 -> {
                    val closure = u16(3); val closureEnv = reg(2) as Env?
                    set(1, Fn("#$closure") { _, a -> run(closure, 0, -1, mutableMapOf(), closureEnv, a) }); pc += 5
                }
                0x89 -> { set(1, if (u(2) == 0) Undefined else params.getOrElse(u(2) - 1) { Undefined }); pc += 3 }
                0x8b -> { set(1, u(2)); pc += 3 }
                0x90 -> { set(1, bundle.strings[u16(2)]); pc += 4 }
                0x91 -> { set(1, bundle.strings[s32(2)]); pc += 6 }
                0x93 -> { set(1, Undefined); pc += 2 }
                0x94 -> { set(1, null); pc += 2 }
                0x95 -> { set(1, true); pc += 2 }
                0x96 -> { set(1, false); pc += 2 }
                0x97 -> { set(1, 0); pc += 2 }
                0xae -> pc += s8(1)
                0xaf -> pc += s32(1)
                0xb0 -> pc += if (truth(reg(2))) s8(1) else 3
                0xb2 -> pc += if (!truth(reg(2))) s8(1) else 3
                0xb3 -> pc += if (!truth(reg(5))) s32(1) else 6
                0xd1 -> pc += if (!loose(reg(2), reg(3))) s8(1) else 4
                0xd3 -> pc += if (same(reg(2), reg(3))) s8(1) else 4
                0xd5 -> pc += if (!same(reg(2), reg(3))) s8(1) else 4
                else -> error("unmodelled opcode ${op.toString(16)} in ${f.name} #$id at ${pc.toString(16)}")
            }
        }
        error("${f.name} did not finish")
    }

    fun verify() {
        val exports = model()
        val row = row()
        check(row == tabs) { "tab row $row" }
        val pages = pages()
        check(pages == tabs.map { mapOf("following" to "FollowingPage", "live" to "LiveFeedPage", "clips" to "ClipsFeedPage")[it] }) { "pages $pages" }
        initialTab(exports)
        comparisons()
        mount()
        feedData()
        cover()
    }

    /** FEED_TAB_INDEX and TABS, from the module's literal on. */
    fun model(): JsObject {
        val model = bundle.matchingFunction(hex("48 04 03 00 ${bundle.id16("Object")} 44 03 04 02 ${bundle.id8("keys")} " +
            "6e 04 03 04 05 45 03 04 03 ${bundle.id16("sort")}"))
        val exports = JsObject()
        val keys = Fn("keys") { _, a -> JsArray((a[0] as JsObject).props.keys.toMutableList<Any?>()) }
        val global = JsObject(linkedMapOf("Object" to JsObject(linkedMapOf("keys" to keys))))
        val start = bundle.find(model, hex("4a 02 05 00 ${bundle.id16("FEED_TAB_INDEX")}")) - 10
        run(model.id, start, -1, mutableMapOf(0 to Undefined, 1 to Env(), 2 to exports, 3 to global), null)
        val feedTabIndex = (exports.props["FEED_TAB_INDEX"] as JsObject).props.mapValues { number(it.value).toInt() }
        check(feedTabIndex == index) { "FEED_TAB_INDEX $feedTabIndex" }
        check((exports.props["TABS"] as JsArray).items == tabs) { "TABS ${exports.props["TABS"]}" }
        return exports
    }

    /** useFeedTabs from its first memo check: the labels' and tabs' cache entries, then the array; twice. */
    fun row(): List<Any?> {
        val f = bundle.function("useFeedTabs")
        val cache = JsArray(MutableList(16) { Opaque("sentinel") })
        val intl = JsObject(linkedMapOf("formatMessage" to Fn("formatMessage") { _, a -> ((a[0] as JsObject).props["defaultMessage"]) }))
        val start = bundle.find(f, hex("5e 02 04 00 d5"))
        fun once() = run(f.id, start, -1, mutableMapOf(1 to Undefined, 4 to cache, 5 to intl), null) as JsArray
        val first = once()
        val second = once()
        check(first === second) { "the tab row's memo cache misses" }
        val labels = mapOf("following" to "Following", "live" to "Live", "clips" to "Clips")
        first.items.forEach { val tab = it as JsObject; check(tab.props["label"] == labels[tab.props["key"]]) { "tab $tab" } }
        return first.items.map { (it as JsObject).props["key"] }
    }

    /** The pager's children, from NewArray to the props; the Following page is given, the others built. */
    fun pages(): List<Any?> {
        val f = bundle.function("DiscoveryFeedContent")
        val start = bundle.find(f, hex("08 61 03 00 5a 61 62 00"))
        val props = JsObject(LinkedHashMap((0..8).associate { "p$it" to Undefined }))
        // Every register is something the probe doesn't model, except those the Live page's code writes.
        val r = mutableMapOf<Int, Any?>()
        (0 until f.frameSize).forEach { r[it] = Opaque("r$it") }
        (listOf(98) + (101..112)).forEach { r.remove(it) }
        r[5] = Undefined
        r[94] = props
        r[98] = Element(Opaque("FollowingPage"), null)
        run(f.id, start, bundle.find(f, hex("52 5e 61 08")) + 4, r, null)
        val children = props.props["p8"] as JsArray
        check(children === r[97])
        return children.items.map { (((it as Element).type) as Opaque).name.substringAfterLast('.') }
    }

    /** `Math.max(0, TABS.findIndex(tab => tab === (initialTab ?? "live")))`. */
    fun initialTab(exports: JsObject) {
        val f = bundle.function("DiscoveryFeedContent")
        val global = JsObject(linkedMapOf("Math" to JsObject(linkedMapOf("max" to Fn("max") { _, a -> a.maxOf { number(it) }.toInt() }))))
        for (initial in listOf("following", "live", "clips", null)) {
            val params = if (initial == null) JsObject() else JsObject(linkedMapOf("initialTab" to initial))
            val env = Env(mutableMapOf(0 to params))
            val r = mutableMapOf<Int, Any?>(6 to null, 16 to JsArray(MutableList(20) { Undefined }), 18 to exports,
                22 to global, 80 to params, 105 to env)
            run(f.id, 0x2b7, 0x2ed, r, null)
            r[24] = r[18]
            r[22] = global
            // GetGlobalObject isn't modelled: start after it with the global given.
            run(f.id, 0x2ef, 0x306, r, null)
            val expected = index[initial ?: "live"] ?: 0
            check(env.slots[6] == expected) { "initial tab $initial opens ${env.slots[6]}" }
        }
    }

    /**
     * The feed's comparisons of activeIndex (r90, one of the shown pages) with the Live and Clips pages: free scroll
     * on Live, then which page's feed list is active. Each must name the page now at that index.
     */
    fun comparisons() {
        val f = bundle.function("DiscoveryFeedContent")
        // freeScrollLive = freeScroll (r62) && activeIndex === Live, from `Mov r26, r62` (stock offsets).
        val free = bundle.find(f, hex("10 1a 3e b2 0a 1a"))
        // clipsActive (r12) and liveActive (r11), the edited block, with r0 = 2 as on every path there.
        val active = bundle.find(f, hex("17 0c 5a 00 10 94 84"))
        for (page in tabs.indices) {
            val a = mutableMapOf<Int, Any?>(1 to 7, 26 to true, 62 to true, 90 to page, 105 to Env())
            run(f.id, free, free + 13, a, null)
            check(a[26] == (tabs[page] == "live")) { "freeScrollLive on ${tabs[page]}" }
            val b = mutableMapOf<Int, Any?>(0 to 2, 1 to 7, 56 to "height", 90 to page, 105 to Env(), 132 to "max", 137 to false)
            run(f.id, active, active + 30, b, null)
            check(b[12] == (tabs[page] == "clips")) { "clipsActive on ${tabs[page]}" }
            check(b[11] == (tabs[page] == "live")) { "liveActive on ${tabs[page]}" }
            check(b[1] == 1 && b[0] == 2) { "r0/r1 changed" }
        }
    }

    /** The pager's visible pages (first, last) mount the Clips page once it is the last visible one. */
    fun mount() {
        val t25 = bundle.matchingFunction(hex("89 05 02 8b 00 02 d5 20 05 00 45 05 04 02 ${bundle.id16("clips")}"))
        for (last in tabs.indices) {
            var clipsMounted = false
            val env = Env(mutableMapOf(
                38 to JsObject(linkedMapOf("current" to JsObject(linkedMapOf("following" to true, "clips" to false)))),
                36 to Fn("setFollowingMounted") { _, _ -> Undefined },
                37 to Fn("setClipsMounted") { _, _ -> clipsMounted = true; Undefined }))
            run(t25.id, 0, -1, mutableMapOf(), env, listOf(0, last))
            check(clipsMounted == (tabs[last] == "clips")) { "Clips mounted with ${tabs[last]} the last visible page" }
        }
    }

    /** The loading placeholder marks the tab `initialTab ?? "live"`, or Following with Live hidden. */
    fun cover() {
        val f = bundle.function("FeedCoverPlaceholder")
        val at = bundle.find(f, hex("90 0a ${bundle.id16("live")} d3 07 04 01 10 0a 04"))
        for (initial in listOf("live", "following", null)) {
            val r = mutableMapOf<Int, Any?>(1 to Undefined, 4 to (initial ?: Undefined))
            run(f.id, at, at + 11, r, null)
            val expected = if ("live" in index) initial ?: "live" else "following"
            check(r[10] == expected && index[expected] != null) { "placeholder tab ${r[10]} for $initial" }
        }
    }

    /** useFeedData's isClips picks the Clips feed for the active tab. */
    fun feedData() {
        val f = bundle.function("useFeedData")
        val at = bundle.find(f, hex("8b 00 02 17 07 13 00"))
        for (active in tabs.indices) {
            val r = mutableMapOf<Int, Any?>(6 to false, 19 to active)
            run(f.id, at, at + 7, r, null)
            check(r[7] == (tabs[active] == "clips")) { "useFeedData isClips at $active" }
            check(r[0] == 2)
        }
    }
}
