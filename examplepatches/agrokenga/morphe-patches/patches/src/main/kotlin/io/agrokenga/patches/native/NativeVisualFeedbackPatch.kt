package io.agrokenga.patches.native

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.io.RandomAccessFile
import java.util.logging.Logger

private val log = Logger.getLogger("NativeVisualFeedbackPatch")

private const val PT_LOAD = 1L
private const val PF_X = 1L

// Sacrificial cave: KyyDebugCanvas.LoadPanels. Init is patched to return, so the
// cave is never entered by the debug canvas itself.
private const val ARM64_CAVE_RVA = 0x27A6228L
private const val ARM64_CAVE_OFFSET = 0x27A2228L
private const val ARM64_CAVE_CAPACITY = 0x8CC
private const val ARMV7_CAVE_RVA = 0x17D98D0L
private const val ARMV7_CAVE_OFFSET = 0x17D98D0L
private const val ARMV7_CAVE_CAPACITY = 0xAE8

private const val ARM64_INIT_RVA = 0x27A5C2CL
private const val ARM64_INIT_OFFSET = 0x27A1C2CL
private const val ARMV7_INIT_RVA = 0x17D90F8L
private const val ARMV7_INIT_OFFSET = 0x17D90F8L

// Exported IL2CPP helper and NGUI debug overlay.
private const val ARM64_STRING_NEW = 0x20BEC74L
private const val ARMV7_STRING_NEW = 0x00F6CE5CL
private const val ARM64_NGUIDEBUG_LOG = 0x244E3A8L
private const val ARMV7_NGUIDEBUG_LOG = 0x139D0C8L
private const val ARM64_NGUIDEBUG_CREATE = 0x244DF80L
private const val ARMV7_NGUIDEBUG_CREATE = 0x139CBCCL

private val ARM64_INIT_PROLOGUE = hex("fe57bea9")
private val ARMV7_INIT_PROLOGUE = hex("30482de9")

private val ARM64_RET = hex("c0035fd6")
private val ARMV7_BX_LR = hex("1eff2fe1")

private data class Target(
    val label: String,
    val arm64Rva: Long,
    val arm64Offset: Long,
    val armv7Rva: Long,
    val armv7Offset: Long,
    val arm64First: ByteArray,
    val armv7First: ByteArray,
)

private val targets = listOf(
    Target(
        "StoreService.PurchaseItem",
        0x251EDBCL, 0x251ADBCL, 0x14A05B0L, 0x14A05B0L,
        hex("fe0f1cf8"), hex("f04b2de9"),
    ),
    Target(
        "IAPService.GrantPurchase",
        0x2514AE4L, 0x2510AE4L, 0x1493C1CL, 0x1493C1CL,
        hex("fe0f1bf8"), hex("f04b2de9"),
    ),
    Target(
        "IAPService.GrantPurchasedItems",
        0x2516DF8L, 0x2512DF8L, 0x14964C4L, 0x14964C4L,
        hex("fe0f1cf8"), hex("f04b2de9"),
    ),
    Target(
        "IAPService.CompletePurchase",
        0x2518608L, 0x2514608L, 0x1498290L, 0x1498290L,
        hex("fe0f1bf8"), hex("f0472de9"),
    ),
    Target(
        "IAPService.ProcessPurchase",
        0x25162A4L, 0x25122A4L, 0x1495754L, 0x1495754L,
        hex("fe5fbda9"), hex("f04f2de9"),
    ),
    Target(
        "TestingIAP.ProcessPurchase",
        0x251F3F0L, 0x251B3F0L, 0x14A0D68L, 0x14A0D68L,
        hex("fe0f1cf8"), hex("f04b2de9"),
    ),
    Target(
        "TestingIAP.OnValidateSuccess",
        0x251F618L, 0x251B618L, 0x14A1000L, 0x14A1000L,
        hex("ff4303d1"), hex("f04f2de9"),
    ),
    Target(
        "PlayFabApiCall.ExecuteAsync",
        0x2CA7F3CL, 0x2CA3F3CL, 0x1D48E38L, 0x1D48E38L,
        hex("ff0302d1"), hex("f04f2de9"),
    ),
)

private fun hex(value: String): ByteArray =
    value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun putWord(buffer: ByteArray, offset: Int, value: Long) {
    buffer[offset] = (value and 0xFF).toByte()
    buffer[offset + 1] = ((value shr 8) and 0xFF).toByte()
    buffer[offset + 2] = ((value shr 16) and 0xFF).toByte()
    buffer[offset + 3] = ((value shr 24) and 0xFF).toByte()
}

private fun readWord(buffer: ByteArray, offset: Int): Long =
    (buffer[offset].toLong() and 0xFF) or
        ((buffer[offset + 1].toLong() and 0xFF) shl 8) or
        ((buffer[offset + 2].toLong() and 0xFF) shl 16) or
        ((buffer[offset + 3].toLong() and 0xFF) shl 24)

private fun arm64Branch(from: Long, to: Long, link: Boolean): Long {
    val delta = to - from
    require(delta and 3L == 0L) { "ARM64 branch target is not 4-byte aligned" }
    val immediate = ((delta shr 2) and 0x03FFFFFFL)
    return (if (link) 0x94000000L else 0x14000000L) or immediate
}

private fun arm64Adr(from: Long, to: Long, register: Int): Long {
    val delta = to - from
    require(delta in -1048576L..1048575L) { "ARM64 ADR target is out of range" }
    val immlo = (delta and 3L) shl 29
    val immhi = ((delta shr 2) and 0x7FFFFL) shl 5
    return 0x10000000L or immlo or immhi or register.toLong()
}

private fun armv7Branch(from: Long, to: Long, link: Boolean): Long {
    val delta = to - (from + 8)
    require(delta and 3L == 0L) { "ARMv7 branch target is not 4-byte aligned" }
    val immediate = (delta shr 2) and 0x00FFFFFFL
    return (if (link) 0xEB000000L else 0xEA000000L) or immediate
}

private fun armv7Adr(from: Long, to: Long, register: Int): Long {
    val delta = to - (from + 8)
    require(delta in 0L..4095L) { "ARMv7 ADR target is out of range" }
    return 0xE28F0000L or (register.toLong() shl 12) or delta
}

private fun buildArm64Hook(hookRva: Long, resumeRva: Long, original: ByteArray, message: String): ByteArray {
    val messageBytes = message.toByteArray(Charsets.UTF_8) + 0
    val messageSize = (messageBytes.size + 3) and -4
    val hook = ByteArray(0x48 + messageSize)

    putWord(hook, 0x00, 0xD10183FFL) // sub sp, sp, #0x60
    putWord(hook, 0x04, 0xA90007E0L) // stp x0, x1, [sp, #0]
    putWord(hook, 0x08, 0xA9010FE2L) // stp x2, x3, [sp, #0x10]
    putWord(hook, 0x0C, 0xA90217E4L) // stp x4, x5, [sp, #0x20]
    putWord(hook, 0x10, 0xA9031FE6L) // stp x6, x7, [sp, #0x30]
    putWord(hook, 0x14, 0xA9047BE8L) // stp x8, x30, [sp, #0x40]
    putWord(hook, 0x18, arm64Branch(hookRva + 0x18, ARM64_NGUIDEBUG_CREATE, link = true))
    putWord(hook, 0x1C, arm64Adr(hookRva + 0x1C, hookRva + 0x48, 0)) // adr x0, message
    putWord(hook, 0x20, arm64Branch(hookRva + 0x20, ARM64_STRING_NEW, link = true))
    putWord(hook, 0x24, arm64Branch(hookRva + 0x24, ARM64_NGUIDEBUG_LOG, link = true))
    putWord(hook, 0x28, 0xA94007E0L) // ldp x0, x1, [sp, #0]
    putWord(hook, 0x2C, 0xA9410FE2L) // ldp x2, x3, [sp, #0x10]
    putWord(hook, 0x30, 0xA94217E4L) // ldp x4, x5, [sp, #0x20]
    putWord(hook, 0x34, 0xA9431FE6L) // ldp x6, x7, [sp, #0x30]
    putWord(hook, 0x38, 0xA9447BE8L) // ldp x8, x30, [sp, #0x40]
    putWord(hook, 0x3C, 0x910183FFL) // add sp, sp, #0x60
    original.copyInto(hook, 0x40)
    putWord(hook, 0x44, arm64Branch(hookRva + 0x44, resumeRva, link = false))
    messageBytes.copyInto(hook, 0x48)

    return hook
}

private fun buildArmv7Hook(hookRva: Long, resumeRva: Long, original: ByteArray, message: String): ByteArray {
    val messageBytes = message.toByteArray(Charsets.UTF_8) + 0
    val messageSize = (messageBytes.size + 3) and -4
    val hook = ByteArray(0x20 + messageSize)

    putWord(hook, 0x00, 0xE92D503FL) // push {r0-r5, r12, lr}
    putWord(hook, 0x04, armv7Branch(hookRva + 0x04, ARMV7_NGUIDEBUG_CREATE, link = true))
    putWord(hook, 0x08, armv7Adr(hookRva + 0x08, hookRva + 0x20, 0)) // adr r0, message
    putWord(hook, 0x0C, armv7Branch(hookRva + 0x0C, ARMV7_STRING_NEW, link = true))
    putWord(hook, 0x10, armv7Branch(hookRva + 0x10, ARMV7_NGUIDEBUG_LOG, link = true))
    putWord(hook, 0x14, 0xE8BD503FL) // pop {r0-r5, r12, lr}
    original.copyInto(hook, 0x18)
    putWord(hook, 0x1C, armv7Branch(hookRva + 0x1C, resumeRva, link = false))
    messageBytes.copyInto(hook, 0x20)

    return hook
}

private fun readBytes(file: File, offset: Long, size: Int): ByteArray {
    RandomAccessFile(file, "r").use { raf ->
        raf.seek(offset)
        return ByteArray(size).also { raf.readFully(it) }
    }
}

private fun writeAtRva(
    file: File,
    abi: String,
    name: String,
    rva: Long,
    expectedOffset: Long,
    data: ByteArray,
) {
    val elf = readElf(file)
    val segment = elf.segments.firstOrNull {
        it.type == PT_LOAD && rva >= it.vaddr && rva < it.vaddr + it.filesz
    } ?: throw PatchException("$abi $name: RVA 0x${rva.toString(16)} is not in a PT_LOAD segment")

    val fileOffset = segment.offset + (rva - segment.vaddr)
    if (fileOffset != expectedOffset) {
        throw PatchException(
            "$abi $name: mapped offset 0x${fileOffset.toString(16)} does not match " +
                "the dump offset 0x${expectedOffset.toString(16)}",
        )
    }
    if ((segment.flags and PF_X) == 0L) {
        throw PatchException("$abi $name: target segment is not executable")
    }

    val bytes = file.readBytes()
    val index = fileOffset.toInt()
    if (index < 0 || index + data.size > bytes.size) {
        throw PatchException("$abi $name: write is outside the library")
    }

    data.copyInto(bytes, index)
    file.writeBytes(bytes)

    val written = readBytes(file, fileOffset, data.size)
    if (!written.contentEquals(data)) {
        throw PatchException("$abi $name: write-back verification failed")
    }

    log.info("$abi $name: wrote ${data.size} bytes at 0x${fileOffset.toString(16)}")
}

private fun installHooks(file: File, abi: String, is64: Boolean) {
    val caveRva = if (is64) ARM64_CAVE_RVA else ARMV7_CAVE_RVA
    val caveOffset = if (is64) ARM64_CAVE_OFFSET else ARMV7_CAVE_OFFSET
    val caveCapacity = if (is64) ARM64_CAVE_CAPACITY else ARMV7_CAVE_CAPACITY

    patchMethod(
        file = file,
        abi = abi,
        methodName = "KyyDebugCanvas.Init",
        rva = if (is64) ARM64_INIT_RVA else ARMV7_INIT_RVA,
        expectedOffset = if (is64) ARM64_INIT_OFFSET else ARMV7_INIT_OFFSET,
        patch = if (is64) ARM64_RET else ARMV7_BX_LR,
        expectedBefore = if (is64) ARM64_INIT_PROLOGUE else ARMV7_INIT_PROLOGUE,
    )

    var cursor = caveRva
    for (target in targets) {
        val rva = if (is64) target.arm64Rva else target.armv7Rva
        val offset = if (is64) target.arm64Offset else target.armv7Offset
        val original = if (is64) target.arm64First else target.armv7First
        val hook = if (is64) {
            buildArm64Hook(cursor, rva + 4, original, "CALLED: ${target.label}")
        } else {
            buildArmv7Hook(cursor, rva + 4, original, "CALLED: ${target.label}")
        }

        if (cursor + hook.size > caveRva + caveCapacity) {
            throw PatchException(
                "$abi: hook cave overflow at ${target.label}; need $caveCapacity bytes",
            )
        }

        writeAtRva(file, abi, "hook for ${target.label}", cursor, offsetForRva(caveRva, cursor, caveOffset), hook)
        patchMethod(
            file = file,
            abi = abi,
            methodName = target.label,
            rva = rva,
            expectedOffset = offset,
            patch = if (is64) {
                hex("00000000").also { putWord(it, 0, arm64Branch(rva, cursor, link = false)) }
            } else {
                hex("00000000").also { putWord(it, 0, armv7Branch(rva, cursor, link = false)) }
            },
            expectedBefore = original,
        )

        cursor += hook.size
    }

    log.info("$abi: installed ${targets.size} hooks, used ${cursor - caveRva} of $caveCapacity cave bytes")
}

private fun offsetForRva(caveRva: Long, cursor: Long, caveOffset: Long): Long =
    caveOffset + (cursor - caveRva)

val nativeVisualFeedbackPatch = resourcePatch(
    name = "Native Visual Feedback",
    description = "Hooks every probed purchase and PlayFab method in libil2cpp.so and logs " +
        "\"CALLED: <method>\" through NGUIDebug's on-screen overlay. Diagnostic only; it does not " +
        "change any return value, response, entitlement, or purchase result.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFD700,
            targets = listOf(AppTarget(version = "2.21.4")),
        ),
    )

    val enableFeedback = booleanOption(
        key = "nativeVisualFeedbackEnable",
        default = false,
        title = "Show native call log overlay",
        description = "Install diagnostic hooks for the probed purchase and PlayFab methods. " +
            "The hooks only log; they do not alter return values or purchases. Disabled by default.",
    )

    execute {
        log.info("=== Native visual feedback ===")

        if (enableFeedback.value != true) {
            log.info("Disabled; set nativeVisualFeedbackEnable=true to install the diagnostic hooks.")
        } else {
            val arm64 = get("lib/arm64-v8a/libil2cpp.so")
            if (arm64.exists()) {
                installHooks(arm64, "arm64-v8a", is64 = true)
            } else {
                log.warning(
                    "MISSING lib/arm64-v8a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }

            val armv7 = get("lib/armeabi-v7a/libil2cpp.so")
            if (armv7.exists()) {
                installHooks(armv7, "armeabi-v7a", is64 = false)
            } else {
                log.warning(
                    "MISSING lib/armeabi-v7a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }
        }
    }
}
