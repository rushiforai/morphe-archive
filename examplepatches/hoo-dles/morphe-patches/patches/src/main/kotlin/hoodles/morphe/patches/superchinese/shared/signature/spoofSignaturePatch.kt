package hoodles.morphe.patches.superchinese.shared.signature

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import app.morphe.util.byteArrayOf
import hoodles.morphe.util.requireArm64
import net.fornwall.jelf.ElfFile
import net.fornwall.jelf.ElfSymbol
import java.io.RandomAccessFile

val spoofSignaturePatch = rawResourcePatch {

    dependsOn(spoofSignaturePatch)

    availability(requireArm64())

    execute {
        val lib = get("lib/arm64-v8a/libSuperChinese.so", true)
        val elf = ElfFile.from(lib)

        val getSignatureInfo = elf.dynamicSymbolTableSection.symbols.first {
            (it.name?.contains("getSignatureInfo")  ?: false) && it.type == ElfSymbol.STT_FUNC.toInt()
        }
        val getSignatureInfoPatch = byteArrayOf(
            "fd 7b be a9" + // stp  x29, x30, [sp, #-0x20]!     ; prologue
            "f3 53 01 a9" + // stp  x19, x20, [sp, #0x10]
            "f3 03 00 aa" + // mov  x19, x0
            "a1 01 00 10" + // adr  x1, .md5_sig                ; md5_sig = "B83D04DC4B7984A66A1A9EE93734150A"
            "68 02 40 f9" + // ldr  x8, [x19]
            "08 9d 42 f9" + // ldr  x8,[x8, #0x538]
            "00 01 3f d6" + // blr  x8                          ; sig_jstring = NewStringUTF(env, md5_sig)
            "e1 03 00 aa" + // mov  x1, x0
            "e0 03 13 aa" + // mov  x0, x19
            "02 00 80 d2" + // mov  x2, #0
            "68 02 40 f9" + // ldr  x8, [x19]
            "08 a5 42 f9" + // ldr  x8, [x8, #0x548]
            "00 01 3f d6" + // blr  x8                          ; sig_heap_str = GetStringUTFChars(env, sig_jstring, NULL)
            "f3 53 41 a9" + // ldp  x19, x20, [sp, #0x10]       ; epilogue
            "fd 7b c2 a8" + // ldp  x29, x30, [sp], #0x20
            "c0 03 5f d6" + // ret                              ; return (char *)sig_heap_str
            // .md5_sig
            "42 38 33 44 30 34 44 43 34 42 37 39 38 34 41 36 36 41 31 41 39 45 45 39 33 37 33 34 31 35 30 41 00"
        )

        RandomAccessFile(lib, "rw").use {
            it.seek(getSignatureInfo.st_value)
            it.write(getSignatureInfoPatch)
        }
    }
}