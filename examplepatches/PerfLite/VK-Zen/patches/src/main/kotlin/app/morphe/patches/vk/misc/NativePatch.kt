package app.morphe.patches.vk.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK

/**
 * The signature/integrity checks in libvkcore.so and libvkmedia.so crash a custom-signed APK.
 * Offsets differ in every VK build (the compiler moves the functions around), so each site is
 * located by a byte signature instead of a hardcoded offset. The replacement instructions are
 * position-independent (relative branches or a bare return), so the same bytes fit every build.
 */
val nativePatch = resourcePatch(
    name = "Native anti-tamper bypass",
    description = "Neutralizes signature and integrity checks in libvkcore.so and libvkmedia.so to prevent crashing on custom-signed APKs.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)

    finalize {
        fun ByteArray.indexOf(pattern: ByteArray): Int {
            outer@ for (i in 0..size - pattern.size) {
                for (j in pattern.indices) if (this[i + j] != pattern[j]) continue@outer
                return i
            }
            return -1
        }

        fun ByteArray.indicesOf(pattern: ByteArray): List<Int> {
            val result = mutableListOf<Int>()
            var i = indexOf(pattern)
            while (i >= 0) {
                result += i
                var next = -1
                outer@ for (k in i + 1..size - pattern.size) {
                    for (j in pattern.indices) if (this[k + j] != pattern[j]) continue@outer
                    next = k; break
                }
                i = next
            }
            return result
        }

        // libvkcore.so: JNI_OnLoad runs two signature checks. The first calls into the verifier
        // and branches to the tamper handler; the second is the handler itself. Replace the
        // verifier-call block with a jump straight to the clean-return path, and make the tamper
        // handler return immediately.
        try {
            val core = this["lib/arm64-v8a/libvkcore.so"]
            if (core.exists()) {
                val b = core.readBytes()

                // add x0,sp,#4 / strb wzr,[sp,#4] / bl verify / cbz / mov x1,x0 / ldr x0 / b
                val verifierBlock = byteArrayOf(
                    0xe0.toByte(), 0x13, 0x00, 0x91.toByte(),
                    0xff.toByte(), 0x13, 0x00, 0x39,
                    0xcb.toByte(), 0xf2.toByte(), 0xff.toByte(), 0x97.toByte(),
                    0x80.toByte(), 0x00, 0x00, 0xb4.toByte(),
                    0xe1.toByte(), 0x03, 0x00, 0xaa.toByte(),
                    0x60, 0x06, 0x40, 0xf9.toByte(),
                    0x06, 0x00, 0x00, 0x14
                )
                // The verifier block sits a fixed 0x64 bytes before the clean-return epilogue in
                // every build, so overwriting its first instruction with an unconditional branch
                // there skips the whole signature check. This avoids reproducing the build-specific
                // global load (the ldr offset differs between versions), which is what crashed 8.200.
                val branchToCleanReturn = byteArrayOf(0x19, 0x00, 0x00, 0x14)
                // sub sp,#0x30 / stp / stp / add x29 / mrs x20 / ldr x8 / tst w0,#0xff — tamper handler head
                val tamperHandler = byteArrayOf(
                    0xff.toByte(), 0xc3.toByte(), 0x00, 0xd1.toByte(),
                    0xfd.toByte(), 0x7b, 0x01, 0xa9.toByte(),
                    0xf4.toByte(), 0x4f, 0x02, 0xa9.toByte(),
                    0xfd.toByte(), 0x43, 0x00, 0x91.toByte(),
                    0x54, 0xd0.toByte(), 0x3b, 0xd5.toByte(),
                    0x88.toByte(), 0x16, 0x40, 0xf9.toByte(),
                    0x1f, 0x1c, 0x00, 0x72
                )
                val ret = byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())

                val sites = b.indicesOf(verifierBlock)
                val handlers = b.indicesOf(tamperHandler)
                check(sites.size == 1) { "libvkcore verifier block: expected 1 match, found ${sites.size}" }
                check(handlers.size == 1) { "libvkcore tamper handler: expected 1 match, found ${handlers.size}" }
                branchToCleanReturn.copyInto(b, sites.single())
                ret.copyInto(b, handlers.single())
                core.writeBytes(b)
                println("Patched libvkcore.so anti-tamper (check @${sites.single()}, handler @${handlers.single()})")
            }
        } catch (t: Throwable) {
            println("WARNING: libvkcore.so anti-tamper patch failed: ${t.message}")
        }

        // libvkmedia.so: the voice-message anti-tamper. Located by structure instead of by
        // offset, because VK moves this code in every build (8.195 and 8.201 differ).
        //
        // A kill block is `mov w0, #1 ; bl _exit`. The library contains several, but only the
        // tamper ones are entered by exactly one conditional branch (tbz / b.cond) testing the
        // verification result - that branch is the site to neutralize. Verified on 8.195 and
        // 8.201: both expose exactly four such guarded blocks, and the other blocks have none.
        //
        // tbz sites can simply be nopped: their fall-through is valid code. The b.cond site
        // cannot - its fall-through is a JNI ThrowNew("error! verify new libraries in
        // application!"), so it is redirected to the routine's own epilogue (stack canary check
        // + ret), which sits 0x20 before the kill block in both builds and is verified by
        // signature before anything is written.
        try {
            val media = this["lib/arm64-v8a/libvkmedia.so"]
            if (media.exists()) {
                val b = media.readBytes()

                fun u32(at: Int): Int =
                    (b[at].toInt() and 0xff) or ((b[at + 1].toInt() and 0xff) shl 8) or
                        ((b[at + 2].toInt() and 0xff) shl 16) or ((b[at + 3].toInt() and 0xff) shl 24)

                val movW0One = 0x52800020
                val bcondMask = 0xFF000010.toInt()
                val tbzMask = 0x7e000010
                val nopBytes = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())

                val blocks = ArrayList<Int>()
                for (off in 0 until b.size - 8 step 4) {
                    if (u32(off) == movW0One) {
                        val bl = u32(off + 4)
                        if (bl ushr 26 == 0b100101) blocks.add(off)
                    }
                }

                val blockSet = blocks.toHashSet()
                val guardsByBlock = HashMap<Int, ArrayList<Int>>()
                if (blockSet.isNotEmpty()) {
                    // Stay inside the code region: scanning data could invent fake branches.
                    val scanFrom = (blocks.min() - 0x10000).coerceAtLeast(0)
                    val scanTo = (blocks.max() + 0x1000).coerceAtMost(b.size - 4)
                    for (off in scanFrom until scanTo step 4) {
                        val ins = u32(off)
                        val isCond = (ins and bcondMask) == 0x54000000
                        val isTbz = (ins and tbzMask) == 0x36000000
                        if (!isCond && !isTbz) continue
                        var imm = (ins ushr 5) and 0x7ffff
                        if (imm and 0x40000 != 0) imm -= 0x80000
                        val target = off + (imm shl 2)
                        if (blockSet.contains(target)) {
                            guardsByBlock.getOrPut(target) { ArrayList() }.add(off)
                        }
                    }
                }

                var patched = 0
                var skipped = 0
                for ((block, guards) in guardsByBlock) {
                    if (guards.size != 1) {
                        println("WARNING: libvkmedia kill block 0x${block.toString(16)} has ${guards.size} guards, left alone")
                        skipped += guards.size
                        continue
                    }
                    val guard = guards.single()
                    val isTbz = (u32(guard) and tbzMask) == 0x36000000
                    if (isTbz) {
                        nopBytes.copyInto(b, guard)
                        patched++
                        println("Neutralized libvkmedia tbz kill guard at 0x${guard.toString(16)}")
                    } else {
                        val epilogue = block - 0x20
                        // Anchors: the kill block is preceded by its own function's epilogue,
                        // ending in `ret`, and starting with the stack-canary load.
                        val looksLikeEpilogue = epilogue >= 0 &&
                            u32(block - 4) == 0xd65f03c0.toInt() &&
                            u32(epilogue) == 0xf9401688.toInt()
                        if (!looksLikeEpilogue) {
                            println("WARNING: libvkmedia epilogue not found before block 0x${block.toString(16)}, guard 0x${guard.toString(16)} left alone")
                            skipped++
                            continue
                        }
                        val imm26 = ((epilogue - guard) shr 2) and 0x03ffffff
                        val encoded = 0x14000000 or imm26
                        for (k in 0..3) {
                            b[guard + k] = ((encoded ushr (8 * k)) and 0xff).toByte()
                        }
                        patched++
                        println("Redirected libvkmedia b.cond guard 0x${guard.toString(16)} -> epilogue 0x${epilogue.toString(16)}")
                    }
                }

                if (patched > 0) {
                    media.writeBytes(b)
                    println("Patched $patched libvkmedia.so tamper-kill guards (skipped=$skipped)")
                } else {
                    println("WARNING: no libvkmedia kill guards located - voice messages may still crash")
                }
            }
        } catch (t: Throwable) {
            println("WARNING: libvkmedia.so anti-tamper patch failed: ${t.message}")
        }
    }
}
