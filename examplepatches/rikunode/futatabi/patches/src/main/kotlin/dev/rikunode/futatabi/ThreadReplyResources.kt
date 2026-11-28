package dev.rikunode.futatabi

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.file.Files
import java.nio.file.attribute.FileTime
import java.security.MessageDigest

internal const val REPLY_ONLY_LIBAPP_SHA256 = "fff81f997d337736c2ce2f162e8a9509a400194a61ae8e58c2de48dce05684d7"
internal const val REPLY_BANNER_LIBAPP_SHA256 = "6813c18f877ee16f794d69a89d93eec0c385eafe5919390cd26378dc363ed7cd"
internal const val REPLY_LOGIN_LIBAPP_SHA256 = "74437eb6169dc58e7247ee3c299d02675f081b422ec2d49f64268ffd2bab4d43"
internal const val REPLY_ALL_LIBAPP_SHA256 = "4bcff4e77437718e6730464d2036a19e507c7bb7bf9100ce8f14e0b137705092"

private val replyStub = "e50301aa65030036a6f05fb8c67c0c53df780171a0000054df7c0171a1020054470080520200001427008052a67040b8df300071e1010054a63c0091c8230010c9008052ff04007161000054ca14403802000014ca244078111540385f01116b8100005429050071e1feff543600001465030036a6f05fb8c67c0c53df780171a0000054df7c0171a1020054470080520200001427008052a67040b8df400071e1010054a63c00918820005009018052ff04007161000054ca14403802000014ca244078111540385f01116b8100005429050071e1feff541b000014250e0036a6f05fb8c67c0c53df780171a0000054df7c0171610d0054470080520200001427008052a67040b8df300071a10c0054a63c0091681d0050c9008052ff04007161000054ca14403802000014ca244078111540385f01116b410b005429050071e1feff5405f040b8a5801c8b65030036a6f05fb8c67c0c53df780171a0000054df7c0171a1020054470080520200001427008052a67040b8df280071e1010054a63c009108180010a9008052ff04007161000054ca14403802000014ca244078111540385f01116b8100005429050071e1feff541b00001445070036a6f05fb8c67c0c53df780171a0000054df7c017181060054470080520200001427008052a67040b8df300071c1050054a63c0091c8140030c9008052ff04007161000054ca14403802000014ca244078111540385f01116b6104005429050071e1feff54057041b8a5801c8bc5030036a6f05fb8c67c0c53df780171a0000054df7c017101030054470080520200001427008052a67040b8df78007141020054a63c009168110070e9018052ff04007161000054ca14403802000014ca244078111540385f01116be100005429050071e1feff54e30305aa70df409110de46f9ed9cf71770634091109a42f9ea9cf717e50300aa85030036a6f05fb8c67c0c53df780171a0000054df7c0171c1020054470080520200001427008052a67040b8dfb0007101020054a63c0091a80d0050c9028052ff04007161000054ca14403802000014ca244078111540385f01116ba100005429050071e1feff54701f48f9d19cf71770874091109242f9ce9cf717a18352f8e20300aae50301aa65030036a6f05fb8c67c0c53df780171a0000054df7c0171a1020054470080520200001427008052a67040b8df800171e1010054a63c0091c80a001009068052ff04007161000054ca14403802000014ca244078111540385f01116b8100005429050071e1feff543600001465030036a6f05fb8c67c0c53df780171a0000054df7c0171a1020054470080520200001427008052a67040b8df900171e1010054a63c0091e808001049068052ff04007161000054ca14403802000014ca244078111540385f01116b8100005429050071e1feff541b00001485030036a6f05fb8c67c0c53df780171a0000054df7c0171c1020054470080520200001427008052a67040b8df80017101020054a63c00910807005009068052ff04007161000054ca14403802000014ca244078111540385f01116ba100005429050071e1feff54c2c20091939cf717929cf717687474703a68747470733a3132372e302e302e313a3138373635687474703a2f2f3132372e302e302e313a313837363561696d6f6765616e696d616e63686d6562756b69687474703a2f2f3132372e302e302e313a31383736352f61696d6f67652f6675746162612e7068703f677569643d6f6e687474703a2f2f3132372e302e302e313a31383736352f616e696d616e63682f6675746162612e7068703f677569643d6f6e687474703a2f2f3132372e302e302e313a31383736352f6d6562756b692f6675746162612e7068703f677569643d6f6e0000".replyBytes()
// A2: accept only the exact Mebuki thread URL returned by Uri.toString.
 // No Dart calls or allocations are added. The first hook retains the String
 // in the already tracked URI local; the second skips HTTPS reconstruction.
private val mebukiNativeOpenStub = "eb031eaac005003606f05fb8c67c0c53df780171a0000054df7c017101050054470080520200001427008052067040b8df98017141040054053c00916806001049048052210000940a154038df000a6b610300542905007161ffff541b000094dfc40071c3020054dfe40071880200548901805215000094dfc0007103020054dfe40071c80100542905007141ffff54c8040050890080520c0000940a154038df000a6bc10000542905007161ffff54a0831ef8fe030baa6617f417fe030baa707b40915717f417ff04007161000054a6144038c0035fd6a6244078c0035fd6a2835ef846f05fb8c67c0c53df78017180000054df7c0171400000548e17f417e00302aab818f417687474703a2f2f3132372e302e302e313a31383736352f6d6562756b692f7265732f2e68746d0000".replyBytes()
private fun String.replyBytes() = chunked(2).map { it.toInt(16).toByte() }.toByteArray()
private fun ByteArray.replyHash() = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it) }

// Stock composer URL construction: preserve original calls and safepoints.
// Exact loopback host and board only; stock pencil and long-press are untouched.
// The ELF RX segment is extended only into verified zero padding.
internal val threadReplyResources = rawResourcePatch {
    dependsOn(arm64TargetGuard)
    execute {
        val lib = get("lib/arm64-v8a/libapp.so")
        if (!lib.isFile) throw PatchException("futatabi: missing ARM64 reply resources")
        val bytes = lib.readBytes()
        val expected = when (val before = bytes.replyHash()) {
            "dd542fe3af5f266096e07f823da3880d3a6e7c771aa80afe6324137e63c5041a" -> REPLY_ONLY_LIBAPP_SHA256
            "f46c85060c997990099d8a6848d119680346bccd84371d7e34c45ac66e18a5b0" -> REPLY_BANNER_LIBAPP_SHA256
            LOGIN_ONLY_LIBAPP_SHA256 -> REPLY_LOGIN_LIBAPP_SHA256
            "a076ce46ff02e598d1e8c183ef8306ce447ec1f5117e2198bcad379bd07ec5d7" -> REPLY_ALL_LIBAPP_SHA256
            else -> throw PatchException("futatabi: unsupported ARM64 reply library (SHA-256 $before)")
        }
        val totalStubSize = replyStub.size + mebukiNativeOpenStub.size
        if (bytes.sliceArray(0xaa6160 until 0xaa6160 + totalStubSize).any { it != 0.toByte() })
            throw PatchException("futatabi: nonzero reply trampoline padding")
        "6e6208141f2003d5".replyBytes().copyInto(bytes, 0x88d7a8)
        "156308141f2003d5".replyBytes().copyInto(bytes, 0x88d7b8)
        "1b6308141f2003d5".replyBytes().copyInto(bytes, 0x88d820)
        replyStub.copyInto(bytes, 0xaa6160)
        if (!bytes.copyOfRange(0x7ac4d8, 0x7ac4dc).contentEquals("707b4091".replyBytes()) ||
            !bytes.copyOfRange(0x7ac5ec, 0x7ac5f0).contentEquals("a2835ef8".replyBytes()))
            throw PatchException("futatabi: unsupported Mebuki native navigation instructions")
        "79e80b14".replyBytes().copyInto(bytes, 0x7ac4d8)
        "6ce80b14".replyBytes().copyInto(bytes, 0x7ac5ec)
        mebukiNativeOpenStub.copyInto(bytes, 0xaa6160 + replyStub.size)
        // All still-image thread widgets use the same maximum display box (280 logical px).
        // Keep existing smaller user limits, native ratio calculation, and video branches.
        // The two leaf fragments occupy only the bypassed height-min instructions.
        if (!bytes.copyOfRange(0x89c7c8, 0x89c7d0).contentEquals("2020601e6d000054".replyBytes()))
            throw PatchException("futatabi: unsupported thread image sizing instruction at 0x89c7c8")
        "421c226e1b000014".replyBytes().copyInto(bytes, 0x89c7c8)
        if (!bytes.copyOfRange(0x89c8bc, 0x89c8c4).contentEquals("0020611e6d000054".replyBytes()))
            throw PatchException("futatabi: unsupported thread image sizing instruction at 0x89c8bc")
        "2040601e1d000014".replyBytes().copyInto(bytes, 0x89c8bc)
        if (!bytes.copyOfRange(0x89c3bc, 0x89c3c0).contentEquals("a0035ef8".replyBytes()))
            throw PatchException("futatabi: unsupported thread image sizing instruction at 0x89c3bc")
        "0d010014".replyBytes().copyInto(bytes, 0x89c3bc)
        if (!bytes.copyOfRange(0x89c940, 0x89c944).contentEquals("a0035ef8".replyBytes()))
            throw PatchException("futatabi: unsupported thread image sizing instruction at 0x89c940")
        "b4ffff17".replyBytes().copyInto(bytes, 0x89c940)
        if (!bytes.copyOfRange(0x89c7f0, 0x89c80c).contentEquals("2020621ec10000542328601e6408611e8308601e601ca34e0c000014".replyBytes()))
            throw PatchException("futatabi: unsupported thread image sizing instruction at 0x89c7f0")
        "112380522302631e0058631e2158631ea00319fca0035ef8eefeff17".replyBytes().copyInto(bytes, 0x89c7f0)
        if (!bytes.copyOfRange(0x89c810, 0x89c82c).contentEquals("e10000540820601ea6000054610000540100669e3f0000f18b000054".replyBytes()))
            throw PatchException("futatabi: unsupported thread image sizing instruction at 0x89c810")
        "112380522302631e2158631e4258631ea10319fca0035ef847000014".replyBytes().copyInto(bytes, 0x89c810)
        // ItaAddDialog: retain both stock buttons and URL validation.
        // Only empty input selects the hint constant as an internal signal.
        // myToast routes that exact constant to its existing native call;
        // all other messages follow the stock native/FToast decision.
        // No new Dart allocation, call or safepoint. Leave the palette cave free.
        val recoveryStub = "a1835ef8307040b86197409170000035211445f97a84f717212445f97884f717b0835df871974091311645f91f0211eb800000541f00166b40000054816bf017796bf017".replyBytes()
        val recoveryAt = 0xaa68ac
        val oldHint = "板または掲示板のURL".toByteArray(Charsets.UTF_16LE)
        val newHint = "URL／空欄OKで復活".toByteArray(Charsets.UTF_16LE)
        if (oldHint.size != newHint.size ||
            !bytes.copyOfRange(0x9df54, 0x9df54 + oldHint.size).contentEquals(oldHint) ||
            !bytes.copyOfRange(0x887aa0, 0x887aa8).contentEquals("61974091212445f9".replyBytes()) ||
            !bytes.copyOfRange(0x6c16c8, 0x6c16d0).contentEquals("1f00166b01010054".replyBytes()) ||
            bytes.copyOfRange(0xaa6160 + totalStubSize, recoveryAt + recoveryStub.size).any { it != 0.toByte() })
            throw PatchException("futatabi: unsupported board recovery snapshot")
        newHint.copyInto(bytes, 0x9df54)
        "837b08141f2003d5".replyBytes().copyInto(bytes, 0x887aa0)
        "81940f141f2003d5".replyBytes().copyInto(bytes, 0x6c16c8)
        recoveryStub.copyInto(bytes, recoveryAt)
        // Imported useHttps=true must not turn our plaintext loopback
        // transport into TLS. Preserve every other URL and the user's setting.
        val localHttpStub = "6104003628f05fb8087d0c532b0080d21f790171800000541f7d0171810300544b0080d2297040b8297d01534d0300106e008052b1154038aa01118b3f01116b030200542c3c0091e803112ab11540387f0500f1610000549001403902000014900140791f02116bc10000548c010b8b08050071c1feff54e00301aac0035fd6ed030aaace05007161fdff54fd79bfa9d557f1171e687474703a2f2f3132372e302e302e313a31383736352f6d6562756b692f1e687474703a2f2f3132372e302e302e313a31383736352f61696d6f67652f20687474703a2f2f3132372e302e302e313a31383736352f616e696d616e63682f00".replyBytes()
        val localHttpAt = recoveryAt + recoveryStub.size
        if (!bytes.copyOfRange(0x6fc8d0, 0x6fc8d4).contentEquals("fd79bfa9".replyBytes()) ||
            bytes.copyOfRange(localHttpAt, localHttpAt + localHttpStub.size).any { it != 0.toByte() })
            throw PatchException("futatabi: unsupported loopback HTTPS conversion site")
        "08a80e14".replyBytes().copyInto(bytes, 0x6fc8d0)
        localHttpStub.copyInto(bytes, localHttpAt)
        val elf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        for (offset in listOf(0xd0, 0xd8)) {
            if (elf.getLong(offset) != 0x686160L)
                throw PatchException("futatabi: unexpected executable segment size")
            elf.putLong(offset, (localHttpAt + localHttpStub.size - 0x420000).toLong())
        }
        if (bytes.replyHash() != expected) throw PatchException("futatabi: reply output hash mismatch")
        val stamp = Files.getLastModifiedTime(lib.toPath())
        lib.writeBytes(bytes)
        if (Files.getLastModifiedTime(lib.toPath()) == stamp)
            Files.setLastModifiedTime(lib.toPath(), FileTime.fromMillis(stamp.toMillis() + 2000))
    }
}
