package io.github.jordanwoodson.patches.twitch.clips

import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import java.io.File
import java.security.MessageDigest

/** Exercises production transforms on the pinned stock asset; Android/RN runtime is tested separately. */
fun main(args: Array<String>) {
    val stock = File(args[0]).readBytes()
    val bundle = HermesBundle(stock)
    val subscribeStock = bundle.function("SubscribeButton").body
    check(subscribeStock.size == 1656)
    bundle.hideClipDiscoveryTabs()
    bundle.hideBitsInterface()
    bundle.hideSubscriptionInterface()
    check(bundle.edits.map { it.key }.toSet() == setOf("hide_clips", "hide_tipping", "hide_subscription_upsells"))
    val patched = bundle.preview()
    verifyClipNavigation(bundle, patched, stock)
    check(patched.size == stock.size)
    val restore = patched.copyOf()
    bundle.edits.forEach { it.original.copyInto(restore, it.offset) }
    MessageDigest.getInstance("SHA-1").digest(restore.copyOfRange(0, restore.size - 20)).copyInto(restore, restore.size - 20)
    check(restore.contentEquals(stock))

    val subscribe = bundle.function("SubscribeButton")
    val body = patched.copyOfRange(subscribe.offset, subscribe.offset + subscribe.body.size)
    // Independently execute the three injected result guards, on cache misses and cache hits.
    // Registers hold arbitrary reference identity so this detects lost subscribed elements.
    fun guard(pcStart: Int, source: Int, subscribed: Boolean, cacheHit: Boolean): Any? {
        val element = Any()
        val registers = mutableMapOf<Int, Any?>(source to element, 4 to element)
        val props = mapOf("isSubscribed" to subscribed)
        var pc = pcStart + if (cacheHit) 3 else 0
        repeat(12) {
            fun u(index: Int) = body[pc + index].toInt() and 255
            when (u(0)) {
                0x10 -> { registers[u(1)] = registers[u(2)]; pc += 3 }
                0x89 -> { check(u(2) == 1); registers[u(1)] = props; pc += 3 }
                0x45 -> {
                    val property = u(4) or (u(5) shl 8)
                    check(bundle.strings[property] == "isSubscribed")
                    registers[u(1)] = (registers[u(2)] as Map<*, *>)["isSubscribed"]
                    pc += 6
                }
                0xb0 -> pc += if (registers[u(2)] == true) body[pc + 1].toInt() else 3
                0x94 -> { registers[u(1)] = null; pc += 2 }
                0x76 -> return registers[u(1)].also { check(if (subscribed) it === element else it == null) }
                else -> error("Unexpected guard opcode at $pc")
            }
        }
        error("Guard did not return")
    }
    for (subscribed in listOf(false, true)) for (cacheHit in listOf(false, true)) {
        guard(0x46e, 16, subscribed, cacheHit)
        guard(0x5c2, 14, subscribed, cacheHit)
        guard(0x665, 5, subscribed, cacheHit)
    }
    // All three existing cache-hit branches now land after the element-copy instruction.
    fun signed32(at: Int) = (0..3).fold(0) { value, index -> value or ((body[at + index].toInt() and 255) shl (index * 8)) }
    check(0x3e5 + signed32(0x3e6) == 0x471)
    check(0x55d + body[0x55e].toInt() == 0x5c5)
    check(0x60b + body[0x60c].toInt() == 0x668)
    // The original hook setup and subscription status read remain intact.
    check(body.copyOfRange(0, 0x2f).contentEquals(subscribeStock.copyOfRange(0, 0x2f)))
    check(bundle.edits.none { edit -> bundle.functions[edit.functionId].name in setOf("CheerPart", "onSubscriptionEvent", "onSubscriptionGiftEvent", "onFirstCheerEvent", "feedNavMedium") })
    File(args[1]).writeBytes(patched)
    File(args[2]).writeText(bundle.manifest())
    if (args.size > 3) {
        val actual = File(args[3]).readBytes()
        bundle.edits.forEach { edit ->
            check(actual.copyOfRange(edit.offset, edit.offset + edit.replacement.size).contentEquals(edit.replacement))
        }
        verifyClipNavigation(bundle, actual, stock)
        println("PASS: actual APK asset contains every UI transform and passes the caller probe")
    }
    println("PASS: UI Hermes transforms, twelve subscribed output/cache cases, hook preservation and exact restoration")
}
