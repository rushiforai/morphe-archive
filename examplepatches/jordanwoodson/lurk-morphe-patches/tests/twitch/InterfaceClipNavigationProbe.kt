package io.github.jordanwoodson.patches.twitch.clips

import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.hex

/** Small independent interpreter for the actual edited callers, with RN/native boundaries doubled. */
@Suppress("UNCHECKED_CAST")
internal fun verifyClipNavigation(bundle: HermesBundle, patched: ByteArray, stock: ByteArray) {
    data class Env(val slots: MutableMap<Int, Any?> = mutableMapOf(), val parent: Env? = null)
    class Fn(val call: (Any?, List<Any?>) -> Any?)
    val undefined = Any()
    val calls = mutableListOf<List<Any?>>()
    val nativeModule = mutableMapOf<String, Any?>("openClip" to Fn { receiver, args ->
        check(receiver is Map<*, *> && args.size == 2 && args[0] is String && args[1] == "")
        calls.add(args); undefined
    })
    val moduleEnv = Env(mutableMapOf(4 to mapOf("NativeModules" to mapOf("TwitchRNHostNavigation" to nativeModule))))
    val componentEnv = Env(parent = moduleEnv)
    lateinit var run: (Int, Int, Int, MutableMap<Int, Any?>, Env?, List<Any?>) -> Any?
    var modelId = -1 // The TABS model's function, found by its anchor below.
    fun property(value: Any?, key: String): Any? = when (value) {
        is Map<*, *> -> value[key] ?: undefined
        is List<*> -> when (key) {
            "length" -> value.size
            "findIndex" -> Fn { _, args -> value.indexOfFirst { (args[0] as Fn).call(undefined, listOf(it)) == true } }
            else -> error("Unsupported list property $key")
        }
        else -> error("Unsupported property $key on $value")
    }
    val global = mapOf("Object" to mapOf("keys" to Fn { _, args -> (args[0] as Map<*, *>).keys.toMutableList() }),
        "Math" to mapOf("max" to Fn { _, args -> args.map { it as Int }.max() }))
    fun truth(value: Any?) = value != null && value !== undefined && value != false && value != 0 && value != ""
    fun equal(a: Any?, b: Any?) = if ((a == null || a === undefined) && (b == null || b === undefined)) true else a == b
    run = interpreter@ { id, start, stop, state, parent, args ->
        val f = bundle.functions[id]
        val b = patched.copyOfRange(f.offset, f.offset + f.body.size)
        var pc = start
        val r = object : MutableMap<Int, Any?> by state {
            override fun get(key: Int): Any? {
                check(state.containsKey(key)) { "Uninitialized r$key in #$id at ${pc.toString(16)}" }
                return state[key]
            }
        }
        repeat(1000) {
            if (pc == stop) return@interpreter undefined
            fun u(n: Int) = b[pc + n].toInt() and 255
            fun u16(n: Int) = u(n) or (u(n + 1) shl 8)
            fun i32(n: Int) = (0..3).fold(0) { v, j -> v or (u(n + j) shl (8 * j)) }
            fun map(reg: Int) = r[reg] as MutableMap<Any?, Any?>
            when (val op = u(0)) {
                0x02 -> { // Reviewed object literal boundaries; values are the unedited stock literals.
                    r[u(1)] = if (id == modelId) linkedMapOf<Any?, Any?>("following" to 0, "live" to 1, "clips" to 2)
                        else linkedMapOf<Any?, Any?>("initialClipSlug" to null, "initialClipReady" to null,
                            "collapseStoriesShelf" to null, "onTabRequested" to null, "onEntry" to null,
                            "openClipDeepLink" to null, "setActiveIndex" to null, "scrollToTop" to null)
                    pc += 10
                }
                0x08 -> { r[u(1)] = MutableList<Any?>(u16(2)) { undefined }; pc += 4 }
                0x10 -> { r[u(1)] = r[u(2)]; pc += 3 }
                0x16 -> { r[u(1)] = equal(r[u(2)], r[u(3)]); pc += 4 }
                0x17 -> { r[u(1)] = r[u(2)] == r[u(3)]; pc += 4 }
                0x34 -> { var env = parent; repeat(u(2)) { env = env!!.parent }; r[u(1)] = env; pc += 3 }
                0x37, 0x38 -> { (r[u(1)] as Env).slots[u(2)] = r[u(3)]; pc += 4 }
                0x3b -> { r[u(1)] = (r[u(2)] as Env).slots[u(3)] ?: undefined; pc += 4 }
                0x44, 0x45, 0x48 -> {
                    r[u(1)] = property(r[u(2)], bundle.strings[if (op == 0x44) u(4) else u16(4)])
                    pc += if (op == 0x44) 5 else 6
                }
                0x4a -> { map(u(1))[bundle.strings[u16(4)]] = r[u(2)]; pc += 6 }
                0x52 -> { val target = map(u(1)); target[target.keys.elementAt(u(3))] = r[u(2)]; pc += 4 }
                0x5a -> { (r[u(1)] as MutableList<Any?>)[u(3)] = r[u(2)]; pc += 4 }
                0x60 -> { map(u(1))[r[u(2)]] = r[u(3)]; pc += 4 }
                0x63 -> { val key = r[u(3)]; val target = map(u(2)); target.remove(key); r[u(1)] = true; pc += 5 }
                0x6a -> {
                    val count = u(3); val base = f.frameSize - 8
                    r[u(1)] = (r[u(2)] as Fn).call(r[base], (1 until count).map { r[base - it] })
                    pc += 4
                }
                0x6c, 0x6e, 0x6f -> {
                    val count = when (op) { 0x6c -> 0; 0x6e -> 1; else -> 2 }
                    val fn = r[u(2)] as Fn
                    r[u(1)] = fn.call(r[u(3)], (0 until count).map { r[u(4 + it)] })
                    pc += 4 + count
                }
                0x76 -> return@interpreter r[u(1)]
                0x84 -> {
                    val closureId = u16(3); val closureEnv = r[u(2)] as Env
                    r[u(1)] = Fn { _, values -> run(closureId, 0, -1, mutableMapOf(), closureEnv, values) }
                    pc += 5
                }
                0x89 -> { r[u(1)] = args.getOrElse(u(2) - 1) { undefined }; pc += 3 }
                0x8b -> { r[u(1)] = u(2); pc += 3 }
                0x90 -> { r[u(1)] = bundle.strings[u16(2)]; pc += 4 }
                0x93 -> { r[u(1)] = undefined; pc += 2 }
                0x94 -> { r[u(1)] = null; pc += 2 }
                0x95 -> { r[u(1)] = true; pc += 2 }
                0x96 -> { r[u(1)] = false; pc += 2 }
                0x97 -> { r[u(1)] = 0; pc += 2 }
                0x3d -> { r[u(1)] = global; pc += 2 }
                0xaf -> pc += i32(1)
                0xb0 -> pc += if (truth(r[u(2)])) b[pc + 1].toInt() else 3
                0xb2 -> pc += if (!truth(r[u(2)])) b[pc + 1].toInt() else 3
                0xd1 -> pc += if (!equal(r[u(2)], r[u(3)])) b[pc + 1].toInt() else 4
                0xd3 -> pc += if (r[u(2)] == r[u(3)]) b[pc + 1].toInt() else 4
                else -> error("Unsupported opcode ${op.toString(16)} in ${f.name} #$id at ${pc.toString(16)}")
            }
        }
        error("Caller did not terminate")
    }
    // Offsets and registers below are Twitch 31.8.0's DiscoveryFeedContent compiler output.
    val model = bundle.matchingFunction(hex("48 04 03 00 ${bundle.id16("Object")} 44 03 04 02 ${bundle.id8("keys")} " +
        "6e 04 03 04 05 45 03 04 03 ${bundle.id16("sort")}"))
    modelId = model.id
    val exports = linkedMapOf<Any?, Any?>()
    val modelRegs = mutableMapOf<Int, Any?>(0 to undefined, 1 to Env(), 2 to exports, 3 to global)
    run(model.id, 0x66, -1, modelRegs, null, emptyList())
    check((exports["FEED_TAB_INDEX"] as Map<*, *>) == mapOf("following" to 0, "live" to 1))
    val tabs = exports["TABS"] as List<*>
    check(tabs == listOf("following", "live"))
    val content = bundle.function("DiscoveryFeedContent")
    // Actual pager array/assignment/jump/props instructions: third child must never be constructed.
    val pagerProps = linkedMapOf<Any?, Any?>().apply { (0..8).forEach { put(it, undefined) } }
    val pager = mutableMapOf<Int, Any?>(90 to pagerProps, 94 to "following")
    run(content.id, 0x6a27, 0x6a2f, pager, null, emptyList())
    pager[94] = "live"
    run(content.id, 0x6bbf, 0x6d28, pager, null, emptyList())
    check(pagerProps[8] == tabs)
    // Execute both real scroll-range reads, and real initialTab lookup + Math.max fallback.
    for (at in listOf(0xa2b, 0xa68)) {
        val r = mutableMapOf<Int, Any?>(26 to exports)
        run(content.id, at, at + 11, r, null, emptyList())
        check(r[26] == 2)
    }
    for (initial in listOf("following", "live", "clips", "missing")) {
        val env = Env(mutableMapOf(0 to mapOf("initialTab" to initial)))
        val r = mutableMapOf<Int, Any?>(18 to exports, 101 to env)
        run(content.id, 0x29c, 0x2b2, r, null, emptyList())
        r[23] = r[18]
        run(content.id, 0x2d2, 0x2eb, r, null, emptyList())
        check(env.slots[6] == if (initial == "live") 1 else 0)
    }
    // Execute actual hook props construction; the same closure handles tap and initial requests.
    val propsRegs = mutableMapOf<Int, Any?>(101 to componentEnv, 16 to mutableMapOf<Any?, Any?>())
    listOf(83,82,91,109,78,88,105,79).forEach { propsRegs[it] = Any() }
    run(content.id, 0x20af, 0x210d, propsRegs, null, emptyList())
    val props = propsRegs[67] as Map<*, *>
    val nativeEntry = props["openClipDeepLink"] as Fn
    val nativeFunction = bundle.matchingFunction(hex("45 03 03 00 ${bundle.id16("FEED_TAB_INDEX")} 45 03 03 01 ${bundle.id16("clips")}"))
    val nativeBody = patched.copyOfRange(nativeFunction.offset, nativeFunction.offset + nativeFunction.body.size)
    fun u32(at: Int) = (0..3).fold(0) { value, i -> value or ((stock[at + i].toInt() and 255) shl (8 * i)) }
    val table = 128 + nativeFunction.id * 12
    val header = (u32(table) and 0x1ffffff) or (((u32(table + 4) ushr 14) and 255) shl 24)
    val reserved = u32(header + 20) + u32(header + 24)
    val readCaches = stock[header + 32].toInt() and 255
    check(reserved == 2 && readCaches == 2)
    // Every new reference-bearing result uses a GC-traced general register. Index255 is the
    // official PROPERTY_CACHING_DISABLED sentinel; only indexes0/1 access the real cache pool.
    for (at in listOf(0, 3, 7, 13, 19, 25, 28, 32))
        check((nativeBody[at + 1].toInt() and 255) >= reserved)
    for (at in listOf(7, 13, 19)) {
        val cache = nativeBody[at + 3].toInt() and 255
        check(cache < readCaches || cache == 255)
    }
    check(nativeEntry.call(undefined, listOf("TappedSlug", "SeedSlug", "metadata")) === undefined)
    val hookEntry = bundle.matchingFunction(hex("3b 03 03 03 70 05 03 01 06 05 04"))
    fun validateCallbackMetadata(id: Int) {
        val f = bundle.functions[id]
        val at = 128 + id * 12
        val h = (u32(at) and 0x1ffffff) or (((u32(at + 4) ushr 14) and 255) shl 24)
        val firstGeneral = u32(h + 20) + u32(h + 24)
        val readCount = stock[h + 32].toInt() and 255
        val writeCount = stock[h + 33].toInt() and 255
        val b = patched.copyOfRange(f.offset, f.offset + f.body.size)
        var pc = 0
        while (b[pc].toInt() and 255 != 0x76) {
            fun u(n: Int) = b[pc + n].toInt() and 255
            val op = u(0)
            if (op in setOf(0x34, 0x3b, 0x44, 0x45, 0x89, 0x90, 0x6e, 0x6f)) check(u(1) >= firstGeneral)
            if (op == 0x44 || op == 0x45) check(u(3) < readCount || u(3) == 255)
            if (op == 0x4a) check(u(3) < writeCount || u(3) == 255)
            pc += when (op) {
                0x93 -> 2
                0x34, 0x89, 0xb2 -> 3
                0x3b, 0x90, 0xd3 -> 4
                0x44, 0x6e -> 5
                0x45, 0x4a, 0x6f -> 6
                else -> error("Unexpected replacement instruction ${op.toString(16)}")
            }
        }
    }
    validateCallbackMetadata(nativeFunction.id)
    validateCallbackMetadata(hookEntry.id)
    val hookEnv = Env(mutableMapOf(3 to nativeEntry))
    check(run(hookEntry.id, 0, -1, mutableMapOf(), hookEnv, listOf("InitialSlug", "SeedSlug", "metadata")) === undefined)
    hookEnv.slots[12] = Fn { _, args -> run(hookEntry.id, 0, -1, mutableMapOf(), hookEnv, args) }
    val pending = bundle.matchingFunction(hex("34 02 00 3b 04 02 0c 95 05 89 07 02 89 08 01"))
    check(run(pending.id, 0, -1, mutableMapOf(), hookEnv, listOf("PendingSlug", "SeedSlug")) === undefined)
    // The actual readiness assignment must work even with no feed edges and loading=true.
    val ready = mutableMapOf<Int, Any?>(82 to false, 145 to true, 27 to emptyList<Any?>())
    run(content.id, 0x2023, 0x2028, ready, null, emptyList())
    check(ready[82] == true)
    val initialEffect = bundle.matchingFunction(hex("34 01 00 3b 03 01 00 b2 27 03 3b 02 01 01 b2 20 02 3b 02 01 08"))
    validateCallbackMetadata(initialEffect.id)
    val initialEnv = Env(mutableMapOf(0 to "EmptyFeedSlug", 1 to ready[82], 3 to nativeEntry,
        8 to mutableMapOf<Any?, Any?>("current" to undefined)))
    repeat(3) { check(run(initialEffect.id, 0, -1, mutableMapOf(), initialEnv, emptyList()) === undefined) }
    for (absent in listOf(undefined, null, "")) {
        initialEnv.slots[0] = absent
        check(run(initialEffect.id, 0, -1, mutableMapOf(), initialEnv, emptyList()) === undefined)
    }
    initialEnv.slots[0] = "SecondInitialSlug"
    check(run(initialEffect.id, 0, -1, mutableMapOf(), initialEnv, emptyList()) === undefined)
    check(calls == listOf(listOf("TappedSlug", ""), listOf("InitialSlug", ""), listOf("PendingSlug", ""), listOf("EmptyFeedSlug", ""), listOf("SecondInitialSlug", "")))
    check(props["initialClipSlug"] === propsRegs[83] && props["onTabRequested"] === propsRegs[109])
    check((propsRegs[16] as Map<*, *>)[190] == null) // omitted dependency forces safe props recompute
    println("PASS: emitted Clips model, initial selection, scroll bounds, pager children and native clip caller data flow")
}
