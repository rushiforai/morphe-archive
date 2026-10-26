package io.github.jordanwoodson.patches.kick.shared

import io.github.jordanwoodson.patches.kick.shared.HermesBundle.Constant
import java.io.File
import java.security.MessageDigest

/**
 * Runs against the supplied Kick bundle, not a reconstructed or synthetic bytecode file.
 * Usage: HermesProbe <stock index.android.bundle> <patched bundle out> <manifest out>
 */
fun main(args: Array<String>) {
    val original = File(args[0]).readBytes()
    val bundle = HermesBundle(original)
    check(bundle.function("KicksShopButton").offset == 0x8e36c9)
    check(bundle.function("preferencesSettingsSlice").body.size == 97)
    fun rejects(block: () -> Unit) = check(runCatching(block).isFailure)
    rejects { HermesBundle(original.copyOf().also { it[8] = 98 }) }
    rejects { HermesBundle(original.copyOf().also { it[500] = (it[500].toInt() xor 1).toByte() }) }
    rejects { bundle.function("missing") }
    rejects { bundle.function("get") }
    val disabled = HermesBundle(original)
    disabled.returnNull("KicksShopButton", "hide_buttons", defaultEnabled = false)
    check(disabled.preview().contentEquals(original))
    rejects { bundle.replace("KicksShopButton", "invalid", byteArrayOf(52), byteArrayOf(1, 2)) }
    for (name in listOf("KicksShopButton", "GetKicksButton", "ChannelSubButton", "ChannelGiftSubButton")) {
        bundle.returnNull(name, "hide_buttons")
    }
    rejects { bundle.returnNull("KicksShopButton", "overlap") }
    // A whole-body replacement must keep the body's length (Disable autoplay's edit; test_hermes.py checks it).
    rejects { bundle.replaceBody("preferencesSettingsSlice", "invalid", ByteArray(96)) }

    // The decoder walks every function body exactly, including ones with switch tables.
    val decoded = bundle.instructions(bundle.function("handleBanUserEvent"))
    check(decoded.last().offset == 0x122 && decoded.last().bytes.contentEquals(byteArrayOf(0x76, 1)))
    check(decoded.count { it.target() != null } == 5)
    branchChecks(original)

    // Object literal keys come from the shape table, in the slot order PutOwnBySlotIdx fills.
    val chatConfig = bundle.functionUsing("web chat config", reads = listOf("searchParams", "getRequestBaseHeaders"),
        loads = listOf("https://chat.mobile.kick.com"))
    val literals = bundle.instructions(chatConfig).filter { it.opcode == 2 } // NewObjectWithBufferLong
    check(bundle.objectKeys(literals[0]).take(3) == listOf("chatroomId", "subscriberBadges", "userCanModerate"))
    check(bundle.objectKeys(literals[0]).size == 12) // With channelLanguage, which 40.32.1 lacked.
    check(bundle.objectKeys(literals[1]) == listOf("id", "slug", "username"))
    check(bundle.objectKeys(literals[2]) == listOf("uri"))
    rejects { bundle.objectKeys(bundle.instructions(chatConfig).first()) }

    // returnAtEntry covers prologues returnNull rejects, and returns the requested constant.
    bundle.returnAtEntry("AppUpdateHandler", "block_update_prompts")
    bundle.returnAtEntry("shouldShowAppRating", "hide_app_rating", Constant.FALSE)
    rejects { bundle.returnNull("shouldShowAppRating", "invalid") }
    bundle.returnAtEntry("handleClearChatEvent", "chat_ignore_clears", Constant.UNDEFINED)
    val clear = bundle.function("handleClearChatEvent")
    val general = (clear.numberRegisters + clear.nonPointerRegisters).toByte()
    check(general > 0 && bundle.edits.last().replacement.contentEquals(
        byteArrayOf(0x93.toByte(), general, 0x76, general, 0, 0, 0, 0)))
    rejects { bundle.returnAtEntry("handleSubscriptionEvent", "invalid") } // JmpTrue isn't a prologue.

    // An anonymous function is selected by what it reads and loads; no match is rejected.
    bundle.functionUsing("delete message", reads = listOf("userCanModerate"), loads = listOf("user_deleted"))
    rejects { bundle.functionUsing("missing", reads = listOf("userCanModerate"), loads = listOf("clear-")) }

    // Both guard shapes; a function without one, or with another JmpTrue first, is rejected.
    bundle.skipGuard(bundle.function("handleSubscriptionEvent"), "hide_sub_messages", defaultEnabled = false)
    check(bundle.edits.last().replacement.contentEquals(hex("10 07 07")))
    bundle.skipGuard(bundle.function("addHistoryEntry"), "no_search_history")
    check(bundle.edits.last().original.contentEquals(hex("b1 05 02")) &&
        bundle.edits.last().replacement.contentEquals(hex("10 02 02")))
    rejects { bundle.skipGuard(bundle.function("shouldShowAppRating"), "invalid") }
    val hostEnd = bundle.functionUsing("host countdown end", reads = listOf("currentPath"),
        loads = listOf("/stream", "/clip", "/vod"))
    rejects { bundle.skipGuard(hostEnd, "invalid") } // Its first JmpTrue isn't a return guard.
    bundle.returnAtEntry(hostEnd, "host_end", Constant.UNDEFINED, defaultEnabled = false)
    // This is decoder/helper coverage only, not a Stay on channel execution test.
    // verify_hosting.py executes the APK manifest's real countdown edit, retained React caches,
    // actual JSX handlers/countdown callbacks and stock/off/mutated bytecode controls.
    check(bundle.instructions(bundle.function("JoinHostDialogContent")).count {
        (it.opcode == 1 || it.opcode == 2) && bundle.objectKeys(it) == listOf("duration", "startOnMount", "onEnd")
    } == 1)

    // Structural matches: GetById with this bundle's string ID, and one instruction run with register flow.
    check(bundle.getById(4, 9, 22, "subscription").contentEquals(hex("45 04 09 16") +
        byteArrayOf(bundle.stringId("subscription").toByte(), (bundle.stringId("subscription") ushr 8).toByte())))
    rejects { bundle.getById(4, 9, 22, "missing-property") }
    check(bundle.functionsNamed("?anon_0_getVodSession").size == 2) // Generator wrapper and body.
    val home = bundle.functionsNamed("ChannelHomeContent")
    val (_, row) = bundle.sequence("PopularClipsRow element", home,
        listOf(bundle.reads("PopularClipsRow"), bundle.creates("channelSlug"), { it.opcode == HermesOp.PUT_OWN_BY_SLOT_IDX },
            { it.opcode == HermesOp.CALL3 })) { (component, props, _, call) ->
        call.u8(4) == component.u8(1) && call.u8(5) == props.u8(1)
    }
    check(row.size == 4)
    rejects { bundle.sequence("ambiguous", home, listOf(bundle.reads("jsx"))) } // Many jsx reads.
    rejects { bundle.sequence("missing", home, listOf(bundle.reads("PopularClipsRow"), bundle.creates("missing-key"))) }
    rejects { bundle.sequence("wrong flow", home, listOf(bundle.reads("PopularClipsRow"), bundle.creates("channelSlug"))) {
        (component, props) -> component.u8(1) == props.u8(1)
    } }

    // Literal readers: every array/object literal instruction with the bytes its values occupy.
    check(bundle.literals.size > 50000)
    val skipScale = bundle.literals.single { it.keys == listOf("livestream", "vod", "live-vod", "clip") }
    val slots = bundle.slotArrays(skipScale)
    check(slots.keys == setOf(0, 1, 2, 3))
    val (vod, liveVod) = slots.getValue(1) to slots.getValue(2)
    check(vod.start == liveVod.start && vod.end - vod.start == 13)
    val skipReaders = listOf(vod, liveVod)
    check(bundle.literalsReading(vod.start, vod.end).size == 2)
    // The live edge array [60] shares its value with an unrelated object: editing it is refused.
    val live = slots.getValue(0)
    check(bundle.literalsReading(live.start, live.end).size > 1)
    rejects { bundle.dataChoice(live.start, "invalid", bundle.literal(live.start, 5), mapOf("1" to hex("71 3d000000")),
        listOf(live)) }

    // Literal edits: exact original bytes, only their own readers, unique windows, choices with their own bytes.
    val skip = vod.start
    check(bundle.literal(skip, 13).contentEquals(hex("73 0a000000 0a000000 0a000000")))
    rejects { bundle.dataChoice(skip, "invalid", hex("73 0b000000"), mapOf("1" to hex("73 0c000000")), skipReaders) }
    rejects { bundle.dataChoice(-1, "invalid", hex("00"), mapOf("1" to hex("01")), skipReaders) }
    rejects { bundle.dataChoice(skip, "vod_skip_seconds", hex("73 0a000000 0a000000 0a000000"),
        mapOf("5" to hex("73 05000000 05000000 05000000")), readers = listOf(vod)) } // A reader left out.
    val choice = bundle.dataChoice(skip, "vod_skip_seconds", hex("73 0a000000 0a000000 0a000000"),
        mapOf("5" to hex("73 05000000 05000000 05000000"), "30" to hex("73 1e000000 1e000000 1e000000")),
        readers = skipReaders)
    check(choice.embedded.contentEquals(choice.original))
    rejects { bundle.dataChoice(skip, "vod_skip_seconds", hex("73"), mapOf("x" to hex("74")), skipReaders) }
    fun id(colour: String) = bundle.stringId(colour).let { byteArrayOf(it.toByte(), (it ushr 8).toByte()) }
    val surfaceValues = byteArrayOf(0x58) + id("#1C1E20") + id("#141517") + id("#090A0B")
    val surface = bundle.literals.single {
        it.keys?.take(3) == listOf("highest", "base", "lowest") && bundle.literal(it.start, 7).contentEquals(surfaceValues)
    }
    val lowest = surface.start + 5
    val base = surface.start + 3
    rejects { bundle.dataChoice(lowest, "vod_skip_seconds", id("#090A0B"), mapOf("1" to id("#000000")), listOf(surface),
        defaultValue = "1") } // One key, two defaults.
    bundle.dataChoice(lowest, "amoled_black", id("#090A0B"), mapOf("1" to id("#000000"), "2" to id("#000000")),
        readers = listOf(surface))
    bundle.dataChoice(base, "amoled_black", id("#141517"), mapOf("2" to id("#0B0B0C")), readers = listOf(surface))
    rejects { bundle.dataChoice(lowest - 1, "amoled_black", bundle.literal(lowest - 1, 2),
        mapOf("1" to bundle.literal(lowest - 1, 2).also { it[1] = (it[1] + 1).toByte() }), readers = listOf(surface)) }
    val shipped = HermesBundle(original)
    shipped.dataChoice(skip, "vod_skip_seconds", hex("73 0a000000 0a000000 0a000000"),
        mapOf("5" to hex("73 05000000 05000000 05000000")), readers = skipReaders, defaultValue = "5")
    check(shipped.replacements().single().let { (from, to) -> from != to && from.length == to.length })

    val patched = bundle.preview()
    check(patched.size == original.size)
    check(MessageDigest.getInstance("SHA-1").digest(patched.copyOfRange(0, patched.size - 20))
        .contentEquals(patched.copyOfRange(patched.size - 20, patched.size)))
    val restored = patched.copyOf()
    for (edit in bundle.edits) edit.original.copyInto(restored, edit.offset)
    MessageDigest.getInstance("SHA-1").digest(restored.copyOfRange(0, restored.size - 20))
        .copyInto(restored, restored.size - 20)
    check(restored.contentEquals(original))
    // Functions with edits, plus one window for the adjacent colour edits and one for the skip interval.
    check(bundle.replacements().size == bundle.edits.filter { it.functionId >= 0 }.map { it.functionId }.toSet().size + 2)
    for ((from, to) in bundle.replacements()) {
        val pattern = hex(from)
        check((0..original.size - pattern.size).count { start ->
            original[start] == pattern[0] && pattern.indices.all { original[start + it] == pattern[it] }
        } == 1)
        check(from.length == to.length)
    }
    val manifest = bundle.manifest()
    check(manifest.contains("\"format\":2") && manifest.contains("\"embeddedSha256\""))
    val black = id("#000000").joinToString("") { "%02x".format(it.toInt() and 255) }
    check(manifest.contains("\"values\":{\"1\":\"$black\",\"2\":\"$black\"},\"default\":\"0\""))
    File(args[1]).writeBytes(patched)
    File(args[2]).writeText(manifest)
    println("PASS: actual v99 headers, fail-closed checks, ${bundle.edits.size} edits (entry returns, guards, " +
        "literal choices), footer, unique windows and exact disabled restoration")
}

/**
 * Switch decoding over the whole bundle, and the edit check that keeps branches out of replaced bytes: a jump or a
 * switch case landing inside an edit's changed bytes is refused, an edit that changes only bytes after the landing
 * point is allowed, and returnNull refuses a function that jumps into its replaced prologue.
 */
private fun branchChecks(original: ByteArray) {
    val bundle = HermesBundle(original)
    fun message(block: () -> Unit) = runCatching(block).exceptionOrNull()?.message.orEmpty()
    val decoded = bundle.functions.filter { it.body.isNotEmpty() }.distinctBy { it.offset }
        .associateWith { bundle.instructions(it) }
    var uintSwitches = 0
    var stringSwitches = 0
    for ((_, instructions) in decoded) {
        val boundaries = instructions.map { it.offset }.toSet()
        for (instruction in instructions) {
            if (instruction.opcode == 0xa7) uintSwitches++
            if (instruction.opcode == 0xa8) stringSwitches++
            for (target in instruction.targets()) check(target in boundaries) { "branch to a non-boundary $target" }
        }
    }
    check(uintSwitches > 0 && stringSwitches > 0)

    // Flip a register operand on each side of a landing point: the changed bytes then span it.
    fun flipped(bytes: ByteArray, vararg at: Int) = bytes.copyOf().also { for (i in at) it[i] = (it[i].toInt() xor 1).toByte() }
    fun spanning(switch: Boolean) = decoded.firstNotNullOf { (function, instructions) ->
        val plain = instructions.mapNotNull { it.target() }.toSet()
        val landing = instructions.flatMap { if (switch) it.switchTargets.drop(1) else listOfNotNull(it.target()) }
            .firstOrNull { target ->
                val index = instructions.indexOfFirst { it.offset == target }
                index > 0 && instructions[index - 1].bytes.size >= 2 && instructions[index].bytes.size >= 2 &&
                    instructions[index - 1].targets().isEmpty() && instructions[index].targets().isEmpty() &&
                    (!switch || target !in plain)
            } ?: return@firstNotNullOf null
        val index = instructions.indexOfFirst { it.offset == landing }
        Triple(function, instructions[index - 1], instructions[index])
    }
    for (switch in listOf(false, true)) {
        val (function, before, at) = spanning(switch)
        val window = before.bytes + at.bytes
        val error = message {
            HermesBundle(original).replace(function, "probe", window, flipped(window, 1, before.bytes.size + 1))
        }
        check("lands inside the edited bytes" in error) { "${if (switch) "switch case" else "jump"} into an edit: $error" }
        // Control: changing only the instruction at the landing point keeps the landing point an unchanged boundary.
        HermesBundle(original).replace(function, "probe", window, flipped(window, before.bytes.size + 1))
    }

    // returnNull pads its prologue with Unreachable: a function that jumps into it is refused.
    val prologues = decoded.keys.filter { function ->
        val body = function.body
        function.name.isNotEmpty() && body.size >= 9 && body[0].toInt() == 0x34 && (body[3].toInt() and 255) in setOf(0x40, 0x89, 0x41) &&
            function.flags and 0x18 == 0
    }
    val jumpsIn = prologues.filter { function ->
        val length = if ((function.body[3].toInt() and 255) == 0x41) 9 else 6
        decoded.getValue(function).any { instruction -> instruction.targets().any { it in 1 until length } } &&
            runCatching { bundle.function(function.name) }.isSuccess
    }
    for (function in jumpsIn) check("branches into its prologue" in message { HermesBundle(original).returnNull(function.name, "probe") })
    println("PASS: ${decoded.size} functions decoded with $uintSwitches UInt and $stringSwitches string switches, every " +
        "branch on an instruction boundary; jumps and switch cases into edited bytes refused, ${jumpsIn.size} " +
        "returnNull prologues with a jump into them refused")
}
