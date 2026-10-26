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

        // libvkmedia.so: voice-message tamper-kill branches. Located by expected opcode at a
        // known offset; silently skipped on builds where the offset no longer matches.
        try {
            val nop = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
            val sites = listOf(
                Triple(0x68874, byteArrayOf(0x80.toByte(), 0x07, 0x00, 0x36), nop),
                Triple(0x689ac, byteArrayOf(0x80.toByte(), 0x29, 0x00, 0x36), nop),
                Triple(0x68f1c, byteArrayOf(0x80.toByte(), 0x08, 0x00, 0x36), nop),
                Triple(0x6d540, byteArrayOf(0x00, 0x05, 0x00, 0x54), byteArrayOf(0x20, 0x00, 0x00, 0x14)),
            )
            val media = this["lib/arm64-v8a/libvkmedia.so"]
            if (media.exists()) {
                val mb = media.readBytes()
                var patched = 0
                for ((off, expect, repl) in sites) {
                    if (off + expect.size <= mb.size && mb.copyOfRange(off, off + expect.size).contentEquals(expect)) {
                        repl.copyInto(mb, off); patched++
                    }
                }
                if (patched > 0) {
                    media.writeBytes(mb)
                    println("Patched $patched libvkmedia.so tamper-kill branches")
                }
            }
        } catch (t: Throwable) {
            println("WARNING: libvkmedia.so anti-tamper patch failed: ${t.message}")
        }
    }
}
