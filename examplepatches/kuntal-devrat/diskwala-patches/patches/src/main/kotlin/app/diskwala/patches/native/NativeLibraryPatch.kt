package app.diskwala.patches.native

import app.diskwala.patches.shared.Constants.COMPATIBILITY_DISKWALA
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File
import java.io.RandomAccessFile

/**
 * Patches native .so libraries to neutralize PairIP anti-tamper traps.
 * This is equivalent to Steps 3-6 of build_master_apk.py.
 *
 * Uses rawResourcePatch to get file system access to the decoded APK,
 * then performs offset-based binary writes to .so files.
 */
@Suppress("unused")
val nativeLibraryPatch = rawResourcePatch(
    name = "Patch native libraries",
    description = "Neutralizes PairIP traps in native .so libraries and patches Hermes bundle.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        // Native libraries are APK root entries.  They are not exposed through
        // fileWorkspace on Manager 1.29, so use the arbitrary-file API instead.
        fun lib(name: String): File = get("lib/arm64-v8a/$name")

        fun patchFile(file: File, patches: List<Pair<Long, ByteArray>>) {
            if (!file.exists()) { println("WARN: ${file.name} missing"); return }
            RandomAccessFile(file, "rw").use { raf ->
                for ((offset, bytes) in patches) { raf.seek(offset); raf.write(bytes) }
            }
            println("Patched ${file.name}: ${patches.size} patches")
        }

        fun arm64(vararg instructions: Long): ByteArray {
            val buf = ByteArray(instructions.size * 4)
            for (i in instructions.indices) {
                val v = instructions[i].toInt()
                buf[i * 4 + 0] = (v and 0xFF).toByte()
                buf[i * 4 + 1] = ((v shr 8) and 0xFF).toByte()
                buf[i * 4 + 2] = ((v shr 16) and 0xFF).toByte()
                buf[i * 4 + 3] = ((v shr 24) and 0xFF).toByte()
            }
            return buf
        }

        fun encodeBl(pc: Long, target: Long): Long {
            val imm26 = ((target - pc) shr 2) and 0x3FFFFFF; return 0x94000000L or imm26
        }
        fun encodeAdr(rd: Int, pc: Long, target: Long): Long {
            val o = target - pc; return 0x10000000L or ((o and 3) shl 29) or (((o shr 2) and 0x7FFFF) shl 5) or rd.toLong()
        }
        fun encodeAdrp(rd: Int, pc: Long, target: Long): Long {
            val o = (target shr 12) - (pc shr 12); return 0x90000000L or ((o and 3) shl 29) or (((o shr 2) and 0x7FFFF) shl 5) or rd.toLong()
        }
        fun encodeAddImm(rd: Int, rn: Int, imm: Int): Long {
            return 0x91000000L or (((imm and 0xFFF).toLong()) shl 10) or (rn.toLong() shl 5) or rd.toLong()
        }
        fun encodeCbz(rt: Int, pc: Long, target: Long): Long {
            return 0x34000000L or ((((target - pc) shr 2) and 0x7FFFF) shl 5) or rt.toLong()
        }

        val RET = arm64(0xd65f03c0)
        val NOP = arm64(0xd503201f)

        // === 1. libpairipcore.so ===
        patchFile(lib("libpairipcore.so"), listOf(
            0x8b52cL to arm64(0x528000c0, 0x72a00020, 0xd65f03c0),
            0x6bf70L to arm64(0xd2800000, 0xd65f03c0),
            0x29c34L to RET, 0x29f44L to RET, 0x1a7dcL to RET,
            0x2a34cL to RET, 0x2a3b0L to RET, 0x2a414L to RET, 0x2a430L to RET
        ))

        // === 2. libcrypto.so ===
        val cp = mutableListOf<Pair<Long, ByteArray>>()
        cp += 0x462b7cL to RET; cp += 0x4631d4L to RET; cp += 0x35914cL to RET; cp += 0x4c8000L to RET
        cp += 0x35e054L to arm64(0x52800020, 0xd65f03c0)
        cp += 0x35e4e0L to arm64(0x52800020, 0xd65f03c0)
        cp += 0x3401a0L to arm64(0x17fff53e)
        cp += 0x3401acL to arm64(0x17fff53b)
        cp += 0x371d58L to arm64(0xa9be7bfd, 0xa90153f3, 0x910003fd, 0xaa0003f3, 0xaa0103f4,
            0xb9400268, 0x35000088, 0x52800028, 0xb9000268, 0xd63f0280,
            0x52800020, 0xa94153f3, 0xa8c27bfd, 0xd65f03c0)
        cp += 0x371d74L to arm64(0x52800020, 0xd65f03c0)
        cp += 0x371d90L to arm64(0x52800020, 0xd65f03c0)
        cp += 0x371db0L to arm64(0xaa1f03e0, 0xd65f03c0)
        cp += 0x371db4L to arm64(0x52800020, 0xd65f03c0)
        cp += 0x371e58L to RET
        // PLT stubs
        var off = 0x4633a0L; while (off < 0x463c70L) { cp += off to arm64(0x52800000, 0xd65f03c0, 0xd503201f, 0xd503201f); off += 16 }
        // libc implementations
        cp += 0x4633c0L to arm64(0xaa0003e3, 0xb40000c2, 0x38401424, 0x38001464, 0x51000442, 0x17fffffc, 0xd65f03c0, 0xd503201f)
        cp += 0x4633d0L to arm64(0xaa0003e3, 0xb40000c2, 0x38001461, 0x51000442, 0x35ffffc2, 0xd65f03c0, 0xd503201f, 0xd503201f)
        cp += 0x4633e0L to arm64(0xb4000102, 0x38401403, 0x38401424, 0x6b04007f, 0x540000a1, 0x51000442, 0x35ffff62, 0x52800000, 0xd65f03c0, 0x2a0503e0)
        cp += 0x4633f0L to arm64(0xaa0003e1, 0x38401422, 0x35ffffc2, 0xcb000020, 0x51000400, 0xd65f03c0, 0xd503201f, 0xd503201f)
        cp += 0x463400L to arm64(0xb4000102, 0x38401403, 0x38401424, 0x6b04007f, 0x540000a1, 0x34000083, 0x51000442, 0x35ffff42, 0x52800000, 0xd65f03c0)
        cp += 0x463410L to arm64(0x38401402, 0x38401423, 0x6b03005f, 0x54000081, 0x35ffff82, 0x52800000, 0xd65f03c0, 0x2a0403e0)
        cp += 0x463430L to arm64(0xb4000040, 0xd2900008, 0xf9000008, 0xd2900000, 0xd65f03c0, 0xd503201f)
        cp += 0x463490L to arm64(0x17ffffcc, 0xd503201f, 0xd503201f, 0xd503201f)
        cp += 0x4634b0L to arm64(0x90000320, 0x91226000, 0xd65f03c0, 0xd503201f)
        cp += 0x463770L to arm64(0x9b017c00, 0x14000047, 0xd503201f, 0xd503201f)
        cp += 0x463790L to arm64(0xd65f03c0, 0xd503201f, 0xd503201f, 0xd503201f)
        cp += 0x4638a0L to arm64(0xd65f03c0, 0xd503201f, 0xd503201f, 0xd503201f)
        cp += 0x463890L to arm64(0x91003c00, 0x927cec00, 0x90000328, 0xf9404109, 0xb5000069, 0x91040109, 0x8b00012a, 0xf900410a, 0xaa0903e0, 0xd65f03c0, 0xd503201f)
        cp += 0x4638b0L to arm64(0x17ffff78, 0xd503201f, 0xd503201f, 0xd503201f)
        cp += 0x463ad0L to arm64(0xb4000040, 0xd2800028, 0xf9000008, 0xf900041f, 0x52800000, 0xd65f03c0)
        patchFile(lib("libcrypto.so"), cp)

        // === 3. libreactnative.so ===
        val rn = mutableListOf<Pair<Long, ByteArray>>()
        rn += 0x5c0000L to RET
        // JNI_OnLoad
        val rnBase = 0x2b5bf8L; val rnCbBase = 0x2b5c5cL
        val c1 = mutableListOf<Long>(0xd10243ff, 0xa9087bfd, 0xf9003bf3, 0xaa0003f3)
        var pc = rnBase + c1.size * 4; c1 += encodeAdrp(8, pc, 0x5b0b38); c1 += 0xf9059d00
        c1 += listOf(0xa9007fff, 0xa9017fff, 0xa9027fff, 0xa9037fff)
        pc = rnBase + c1.size * 4; c1 += encodeAdr(3, pc, rnCbBase); c1 += 0xf9001be3
        c1 += listOf(0x910003e2, 0xf90023e2, 0x910103e2, 0xf90033e2, 0xaa1303e0, 0x910103e1)
        pc = rnBase + c1.size * 4; c1 += encodeBl(pc, 0x5716f0)
        c1 += listOf(0x528000c0, 0x72a00020, 0xf9403bf3, 0xa9487bfd, 0x910243ff, 0xd65f03c0)
        // Callback
        val c2 = mutableListOf<Long>(0xd10083ff, 0xa9017bfd, 0xf90003f3)
        for (f in longArrayOf(0x44ea14,0x47ba28,0x479778,0x47296c,0x47124c,0x46e5fc,0x46f0c0,0x46e1bc,0x473148,0x46a014,0x3b9530,0x3bab4c,0x523d30,0x5294b0,0x52a960,0x27388c,0x299934,0x29ad54,0x2ad3bc,0x2b35f4,0x2b46b0)) {
            pc = rnCbBase + c2.size * 4; c2 += encodeBl(pc, f)
        }
        pc = rnCbBase + c2.size * 4; c2 += encodeBl(pc, 0x570c70)
        c2 += listOf(0xaa0003f3, 0xf9400268, 0xf9401908, 0xaa1303e0)
        pc = rnCbBase + c2.size * 4; c2 += encodeAdrp(1, pc, 0x15c4a4)
        c2 += encodeAddImm(1, 1, 0x15c4a4 and 0xFFF); c2 += 0xd63f0100
        val skip = rnCbBase + (c2.size + 9) * 4
        pc = rnCbBase + c2.size * 4; c2 += encodeCbz(0, pc, skip)
        c2 += listOf(0xaa0003e1, 0xaa1303e0)
        pc = rnCbBase + c2.size * 4; c2 += encodeAdrp(2, pc, 0x5a1dd0)
        c2 += encodeAddImm(2, 2, 0x5a1dd0 and 0xFFF)
        c2 += listOf(0x52800ea3, 0xf9400268, 0xf9435d08, 0xd63f0100)
        c2 += listOf(0xf94003f3, 0xa9417bfd, 0x910083ff, 0xd65f03c0)
        rn += rnBase to arm64(*(c1 + c2).toLongArray())
        var nop = rnBase + (c1.size + c2.size) * 4; while (nop < 0x2b5d9c) { rn += nop to NOP; nop += 4 }
        // Clean .data
        rn += 0x599940L to ByteArray(0x599dc0 - 0x599940)
        fun q(a: Long, b: Long, c: Long, d: Long): ByteArray { val buf = ByteArray(32); var p = 0
            for (v in longArrayOf(a,b,c,d)) { for (i in 0..7) { buf[p++] = ((v shr (i*8)) and 0xFF).toByte() } }; return buf }
        rn += 0x599a28L to q(1,1,0,0); rn += 0x599ab0L to q(8,8,0,0x17fe50)
        rn += 0x599cd0L to q(32,8,0,0x18e220); rn += 0x599d90L to q(48,8,0,0); rn += 0x599db0L to q(1,1,0,0)
        patchFile(lib("libreactnative.so"), rn)

        // === 4. libhermestooling.so ===
        val ht = mutableListOf<Pair<Long, ByteArray>>()
        ht += 0x17400L to RET; for (o in 0x17404..0x1743f step 4) ht += o.toLong() to NOP
        val htBase = 0x1eab4L; val htC = mutableListOf<Long>(0xd10083ff, 0xa9017bfd)
        pc = htBase + htC.size * 4; htC += encodeBl(pc, 0x175dc)
        pc = htBase + htC.size * 4; htC += encodeBl(pc, 0x1ee00)
        htC += listOf(0x528000c0, 0x72a00020, 0xa9417bfd, 0x910083ff, 0xd65f03c0)
        ht += htBase to arm64(*htC.toLongArray())
        nop = htBase + htC.size * 4; while (nop < 0x1eb20) { ht += nop to NOP; nop += 4 }
        patchFile(lib("libhermestooling.so"), ht)

        // === 5. libhermes.so ===
        patchFile(lib("libhermes.so"), (0xc0044..0xc0050 step 4).map { it.toLong() to NOP })

        // === 6. libreactnativequickcrypto.so ===
        val qc = mutableListOf<Pair<Long, ByteArray>>()
        val qcBase = 0x4f160L; val qcCb = 0x4f364L
        val qcC = mutableListOf<Long>(0xd10243ff, 0xa9087bfd, 0xf9003bf3, 0xaa0003f3, 0xa9007fff, 0xa9017fff, 0xa9027fff, 0xa9037fff)
        pc = qcBase + qcC.size * 4; qcC += encodeAdr(3, pc, qcCb)
        qcC += listOf(0xf9001be3, 0x910003e2, 0xf90023e2, 0x910103e2, 0xf90033e2, 0xaa1303e0, 0x910103e1)
        pc = qcBase + qcC.size * 4; qcC += encodeBl(pc, 0x9e3b0)
        qcC += listOf(0x528000c0, 0x72a00020, 0xf9403bf3, 0xa9487bfd, 0x910243ff, 0xd65f03c0)
        qc += qcBase to arm64(*qcC.toLongArray())
        nop = qcBase + qcC.size * 4; while (nop < 0x4f1f0) { qc += nop to NOP; nop += 4 }
        qc += 0x6507cL to arm64(0xa9007d1f, 0xd65f03c0)
        qc += 0x64bd4L to arm64(0xa9007d1f, 0xf900091f, 0xd65f03c0)
        patchFile(lib("libreactnativequickcrypto.so"), qc)

        // === 7. Hermes bundle: QuickBase64 -> ImageLoader ===
        val bundle = get("assets/index.android.bundle")
        if (bundle.exists()) {
            val raf = RandomAccessFile(bundle, "rw")
            try {
                val data = ByteArray(raf.length().toInt()); raf.readFully(data)
                fun replaceAll(needle: ByteArray, replacement: ByteArray, message: String) {
                    require(needle.size == replacement.size) { "$message changes byte length" }
                    var count = 0
                    for (i in 0..data.size - needle.size) {
                        if ((0 until needle.size).all { data[i + it] == needle[it] }) {
                            System.arraycopy(replacement, 0, data, i, replacement.size)
                            count++
                        }
                    }
                    println("$message: $count occurrence(s)")
                }

                // Update the in-memory buffer. Writing the file before the
                // label edit would be overwritten by the final full-buffer
                // write and silently restore QuickBase64.
                replaceAll("QuickBase64".toByteArray(), "ImageLoader".toByteArray(), "Patched QuickBase64 -> ImageLoader")

                // The app uses this text as an outlined TextInput label. In
                // the legacy JS bundle it remains visible after a value is
                // entered, so replace the label with same-length whitespace
                // while leaving the input value and behavior unchanged.
                val label = "Paste DiskWala URL here..."
                replaceAll(label.toByteArray(), ByteArray(label.length) { 0x20 }, "Removed link label text (UTF-8)")
                val labelUtf16 = label.toByteArray(Charsets.UTF_16LE)
                replaceAll(labelUtf16, ByteArray(labelUtf16.size) { if (it % 2 == 0) 0x20 else 0 }, "Removed link label text (UTF-16LE)")
                raf.seek(0)
                raf.write(data)
            } finally { raf.close() }
        }

        println("=== All native patches applied ===")
    }
}
