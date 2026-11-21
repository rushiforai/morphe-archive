package io.github.jordanwoodson.patches.twitch.home

import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import java.io.File

/**
 * Hide Stories (issues 75 and 95) on RN Home: runs DiscoveryFeedContent's edited bytecode of the pinned stock bundle
 * for each combination of the switch and Twitch's recaps flag, from the `useRecapsShelfEnabled()` call through
 * showStoriesShelf, the top chrome's shelf offset and FollowingTab's feedPinOffsetRef. With the switch off each value is
 * Twitch's; with it on every one is what stock Twitch computes with its recaps shelf on (no shelf, offset 0, no pin),
 * whatever the flag says.
 *
 * Usage: HomeStoriesProbeKt <stock index.android.bundle>
 */
fun main(args: Array<String>) {
    val stock = File(args[0]).readBytes()
    val bundle = HermesBundle(stock)
    bundle.hideStoriesShelf()
    val edits = bundle.edits.sortedBy { it.offset }
    check(edits.map { it.key }.toSet() == setOf(HIDE_STORIES)) { "unexpected keys ${edits.map { it.key }}" }
    check(edits.size == 3 && edits.all { it.defaultEnabled }) { "expected three default-on Stories edits" }
    val feed = bundle.function("DiscoveryFeedContent")
    val call = edits[0].offset - feed.offset // Call1 recaps, f, this; Not shown, recaps
    val branches = edits.drop(1).map { it.offset - feed.offset }
    val pin = branches.single { stock[feed.offset + it + 3].toInt() and 255 == 0x10 }
    val offset = branches.single { it != pin }
    val height = 120.0 // shelfHeight, a value that can't be confused with 0 or TABS_BAR_MARGIN_TOP
    for (stories in listOf(false, true)) for (recaps in listOf(false, true)) {
        val bytes = stock.copyOf()
        if (stories) edits.forEach { it.replacement.copyInto(bytes, it.offset) }
        val run = StoriesRun(bundle, bytes.copyOfRange(feed.offset, feed.offset + feed.body.size))
        val shown = run.u(call + 5)
        run.registers[run.u(call + 2)] = RecapsHook(recaps)
        run.exec(call, call + 7)
        val end = offset + run.s(offset + 1)
        run.registers[run.u(end - 2)] = height // Add offset, height, margin; end:
        run.exec(offset - 2, end)
        val ref = Any()
        run.registers[run.u(pin + 5)] = ref
        run.exec(pin - 2, pin + 6)
        val hidden = stories || recaps
        check(run.registers[shown] == !hidden) { "showStoriesShelf ${run.registers[shown]} (stories $stories, recaps $recaps)" }
        val chrome = run.registers[run.u(offset - 1)]
        check(chrome == if (hidden) 0.0 else height + 28) { "shelf offset $chrome (stories $stories, recaps $recaps)" }
        val following = run.registers[run.u(pin - 1)]
        check(if (hidden) following === JsUndefined else following === ref) { "FollowingTab pin $following" }
        println("PASS: Hide Stories ${if (stories) "on" else "off"}, recaps shelf ${if (recaps) "on" else "off"}: " +
            "showStoriesShelf ${!hidden}, shelf offset $chrome, Following pin ${if (hidden) "none" else "the shelf's"}")
    }
    println("PASS: Hide Stories gives RN Home stock Twitch's no-shelf layout (offset 0, no pin) for either recaps flag")
}

private object JsUndefined { override fun toString() = "undefined" }
private class RecapsHook(val result: Boolean)
private object ConstantsModule

/** The few v98 instructions of the three Stories sites, run on the function's (edited) bytes. */
private class StoriesRun(val bundle: HermesBundle, val body: ByteArray) {
    val registers = mutableMapOf<Int, Any?>()
    fun u(at: Int) = body[at].toInt() and 255
    fun s(at: Int) = body[at].toInt()
    fun truth(v: Any?) = !(v == null || v === JsUndefined || v == false || v == 0.0)

    fun exec(start: Int, end: Int) {
        var pc = start
        while (pc != end) {
            check(pc in start until end) { "left the site at $pc" }
            when (u(pc)) {
                0x6c -> { // Call1 dst, f, this
                    registers[u(pc + 1)] = (registers[u(pc + 2)] as RecapsHook).result; pc += 4
                }
                0x13 -> { registers[u(pc + 1)] = !truth(registers[u(pc + 2)]); pc += 3 } // Not
                0x10 -> { registers[u(pc + 1)] = registers[u(pc + 2)]; pc += 3 } // Mov
                0x93 -> { registers[u(pc + 1)] = JsUndefined; pc += 2 } // LoadConstUndefined
                0x97 -> { registers[u(pc + 1)] = 0.0; pc += 2 } // LoadConstZero
                0xb0 -> pc += if (truth(registers[u(pc + 2)])) s(pc + 1) else 3 // JmpTrue
                0xb2 -> pc += if (truth(registers[u(pc + 2)])) 3 else s(pc + 1) // JmpFalse
                0x5e -> { registers[u(pc + 1)] = ConstantsModule; pc += 4 } // GetByIndex: the constants module's require ID
                0x6e -> { registers[u(pc + 1)] = ConstantsModule; pc += 5 } // Call2: require
                0x45 -> { // GetById dst, module, cache, id
                    val name = bundle.strings[u(pc + 4) or (u(pc + 5) shl 8)]
                    check(registers[u(pc + 2)] === ConstantsModule && name == "TABS_BAR_MARGIN_TOP") { "read of $name" }
                    registers[u(pc + 1)] = 28.0; pc += 6
                }
                0x1e -> { // Add
                    registers[u(pc + 1)] = (registers[u(pc + 2)] as Double) + (registers[u(pc + 3)] as Double); pc += 4
                }
                else -> error("unexpected opcode ${u(pc).toString(16)} at $pc")
            }
        }
    }
}
