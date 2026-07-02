package app.sni_patch.patches.shared.misc.sni

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchBuilder
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.File

private const val ARM64_DIR = "lib/arm64-v8a"
private const val DEFAULT_FORCED_SNI_HOST = "kek.bdn.dev"
private const val DEFAULT_YTIMG_SNI_HOST = "edgestatic.com"
private const val HTTPS_PORT = 443
private const val HOST_PORT_PAIR_SIZE = 0x20
private const val HOST_PORT_PAIR_PORT_OFFSET = 0x00
private const val HOST_PORT_PAIR_HOST_OFFSET = 0x08
private const val SHORT_STRING_SIZE_OFFSET = HOST_PORT_PAIR_HOST_OFFSET + 0x17
private const val MAX_SHORT_STRING_HOST_LENGTH = 22
private const val YTIMG_HOST = "i.ytimg.com"
private const val TRAMPOLINE_CODE_SIZE = 0x50
private const val TRAMPOLINE_LITERAL_OFFSET = TRAMPOLINE_CODE_SIZE
private const val TRAMPOLINE_FORCED_HOST_PORT_PAIR_OFFSET = TRAMPOLINE_LITERAL_OFFSET + Long.SIZE_BYTES
private const val TRAMPOLINE_YTIMG_HOST_PORT_PAIR_OFFSET = TRAMPOLINE_FORCED_HOST_PORT_PAIR_OFFSET + HOST_PORT_PAIR_SIZE
private const val TRAMPOLINE_PAYLOAD_SIZE = TRAMPOLINE_YTIMG_HOST_PORT_PAIR_OFFSET + HOST_PORT_PAIR_SIZE
private const val ARM64_CONDITION_NE = 0x1
private val HOSTNAME_REGEX = Regex("^[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)+$")

// Source-level context:
// - SSLConnectJob::DoSSLConnect() first completes the nested TransportConnectJob
//   and obtains a connected StreamSocket.
// - It then calls CreateSSLClientSocket(..., std::move(nested_socket_),
//   params_->host_and_port(), ssl_config).
//
// This is the clean boundary between the lower transport endpoint and the TLS
// authentication hostname. The fingerprint below matches the call-site tail
// where x3 is loaded with params_->host_and_port(). We only replace that x3
// argument with a synthetic HostPortPair stored in an RX cave; the underlying
// connected stream socket keeps using the original endpoint.
private val TLS_HOST_ARGUMENT_FINGERPRINT_BYTES = byteArrayOf(
    0x43, 0x61, 0x00, 0x91.toByte(), // add x3, x10, #0x18
    0x08, 0x00, 0x40, 0xf9.toByte(), // ldr x8, [x0]
    0x09, 0x11, 0x80.toByte(), 0xb9.toByte(), // ldrsw x9, [x8, #0x10]
    0x08, 0x01, 0x09, 0x8b.toByte(), // add x8, x8, x9
    0x00, 0x01, 0x3f, 0xd6.toByte(), // blr x8
)

private const val TLS_HOST_ARGUMENT_INSTRUCTION_OFFSET = 0

private fun ByteArray.findAll(needle: ByteArray): List<Int> {
    if (needle.isEmpty() || size < needle.size) return emptyList()

    val matches = mutableListOf<Int>()
    for (index in 0..(size - needle.size)) {
        if (this[index] != needle[0]) continue

        var matched = true
        for (i in 1 until needle.size) {
            if (this[index + i] != needle[i]) {
                matched = false
                break
            }
        }

        if (matched) {
            matches += index
        }
    }

    return matches
}

private fun buildSyntheticHostPortPair(host: String): ByteArray {
    require(host.length <= MAX_SHORT_STRING_HOST_LENGTH) {
        "Host '$host' is too long for libc++ short-string HostPortPair storage"
    }

    return ByteArray(HOST_PORT_PAIR_SIZE).also { bytes ->
        val hostBytes = host.encodeToByteArray()
        hostBytes.copyInto(bytes, destinationOffset = HOST_PORT_PAIR_HOST_OFFSET)
        bytes[HOST_PORT_PAIR_HOST_OFFSET + hostBytes.size] = 0
        bytes[SHORT_STRING_SIZE_OFFSET] = hostBytes.size.toByte()
        bytes[HOST_PORT_PAIR_PORT_OFFSET] = (HTTPS_PORT and 0xff).toByte()
        bytes[HOST_PORT_PAIR_PORT_OFFSET + 1] = ((HTTPS_PORT ushr 8) and 0xff).toByte()
    }
}

private fun ByteArray.writeInstruction(offset: Int, instruction: Int) {
    instruction.toLittleEndianBytes().copyInto(this, destinationOffset = offset)
}

private fun buildConditionalSniTrampoline(
    caveVirtualAddress: Long,
    returnVirtualAddress: Long,
    forcedHostPortPair: ByteArray,
    ytimgHostPortPair: ByteArray,
): ByteArray {
    val ytimgHostBytes = YTIMG_HOST.encodeToByteArray()
    check(ytimgHostBytes.size == 11) { "Unexpected YTIMG_HOST length" }

    val payload = ByteArray(TRAMPOLINE_PAYLOAD_SIZE)
    val forcedPathOffset = 0x40
    val ytimgPathOffset = 0x48
    val forcedPathVirtualAddress = caveVirtualAddress + forcedPathOffset
    val ytimgPathVirtualAddress = caveVirtualAddress + ytimgPathOffset
    val literalVirtualAddress = caveVirtualAddress + TRAMPOLINE_LITERAL_OFFSET
    val forcedHostPortPairVirtualAddress = caveVirtualAddress + TRAMPOLINE_FORCED_HOST_PORT_PAIR_OFFSET
    val ytimgHostPortPairVirtualAddress = caveVirtualAddress + TRAMPOLINE_YTIMG_HOST_PORT_PAIR_OFFSET

    fun instructionVirtualAddress(offset: Int) = caveVirtualAddress + offset

    // x10 is already the SSLConnectJob params pointer at the original call-site.
    // x3 must point at either the general forced SNI pair or the ytimg-specific one.
    payload.writeInstruction(0x00, encodeAddImmediate(3, 10, 0x18))
    payload.writeInstruction(0x04, encodeLdrUnsignedImmediate(11, 3, SHORT_STRING_SIZE_OFFSET, sizeBytes = 1))
    payload.writeInstruction(0x08, encodeCmpImmediate(11, ytimgHostBytes.size, is64Bit = false))
    payload.writeInstruction(0x0c, encodeConditionalBranch(instructionVirtualAddress(0x0c), forcedPathVirtualAddress, ARM64_CONDITION_NE))
    payload.writeInstruction(0x10, encodeLdrUnsignedImmediate(11, 3, HOST_PORT_PAIR_HOST_OFFSET, sizeBytes = 8))
    payload.writeInstruction(0x14, encodeLdrLiteral(12, instructionVirtualAddress(0x14), literalVirtualAddress, is64Bit = true))
    payload.writeInstruction(0x18, encodeEorShiftedRegister(11, 11, 12, is64Bit = true))
    payload.writeInstruction(0x1c, encodeCbnz(11, instructionVirtualAddress(0x1c), forcedPathVirtualAddress, is64Bit = true))
    payload.writeInstruction(0x20, encodeLdrUnsignedImmediate(11, 3, HOST_PORT_PAIR_HOST_OFFSET + 8, sizeBytes = 2))
    payload.writeInstruction(0x24, encodeMovz(12, 0x6f63, is64Bit = false))
    payload.writeInstruction(0x28, encodeCmpShiftedRegister(11, 12, is64Bit = false))
    payload.writeInstruction(0x2c, encodeConditionalBranch(instructionVirtualAddress(0x2c), forcedPathVirtualAddress, ARM64_CONDITION_NE))
    payload.writeInstruction(0x30, encodeLdrUnsignedImmediate(11, 3, HOST_PORT_PAIR_HOST_OFFSET + 10, sizeBytes = 1))
    payload.writeInstruction(0x34, encodeCmpImmediate(11, 'm'.code, is64Bit = false))
    payload.writeInstruction(0x38, encodeConditionalBranch(instructionVirtualAddress(0x38), forcedPathVirtualAddress, ARM64_CONDITION_NE))
    payload.writeInstruction(0x3c, encodeB(instructionVirtualAddress(0x3c), ytimgPathVirtualAddress))
    payload.writeInstruction(0x40, encodeAdr(3, instructionVirtualAddress(0x40), forcedHostPortPairVirtualAddress))
    payload.writeInstruction(0x44, encodeB(instructionVirtualAddress(0x44), returnVirtualAddress))
    payload.writeInstruction(0x48, encodeAdr(3, instructionVirtualAddress(0x48), ytimgHostPortPairVirtualAddress))
    payload.writeInstruction(0x4c, encodeB(instructionVirtualAddress(0x4c), returnVirtualAddress))

    ytimgHostBytes.copyInto(payload, destinationOffset = TRAMPOLINE_LITERAL_OFFSET, endIndex = 8)
    forcedHostPortPair.copyInto(payload, destinationOffset = TRAMPOLINE_FORCED_HOST_PORT_PAIR_OFFSET)
    ytimgHostPortPair.copyInto(payload, destinationOffset = TRAMPOLINE_YTIMG_HOST_PORT_PAIR_OFFSET)
    return payload
}

private fun chooseCronetLibrary(arm64Dir: File): File? {
    val candidates = arm64Dir.listFiles()
        ?.filter { file ->
            file.isFile && file.name.startsWith("libcronet") && file.name.endsWith(".so")
        }
        ?.sortedBy { it.name }
        .orEmpty()

    return when (candidates.size) {
        0 -> null
        1 -> candidates.single()
        else -> throw PatchException(
            "Expected exactly one libcronet*.so in '$ARM64_DIR', found: " +
                    candidates.joinToString { it.name }
        )
    }
}

internal fun forceCronetSniPatch(
    name: String = "Force Cronet SNI (arm64)",
    block: ResourcePatchBuilder.() -> Unit,
) = resourcePatch(
    name = name,
    description = "Patches bundled arm64 libcronet so TLS SNI is forced to a configurable hostname in " +
            "the SSLClientSocket path. URL and HTTP Host remain unchanged.",
    default = true,
) {
    block()

    val forcedSniHost by stringOption(
        key = "forcedSniHost",
        default = DEFAULT_FORCED_SNI_HOST,
        title = "Forced SNI hostname",
        description = "Hostname written into libcronet and used by the SSLClientSocket path for TLS SNI.",
        required = true,
    ) {
        it != null && HOSTNAME_REGEX.matches(it)
    }

    val ytimgSniHost by stringOption(
        key = "ytimgSniHost",
        default = DEFAULT_YTIMG_SNI_HOST,
        title = "ytimg SNI hostname",
        description = "Hostname used as TLS SNI for i.ytimg.com image and thumbnail requests.",
        required = true,
    ) {
        it != null && HOSTNAME_REGEX.matches(it)
    }

    execute {
        val forcedSniHostValue = forcedSniHost!!.trim()
        if (forcedSniHostValue.length > MAX_SHORT_STRING_HOST_LENGTH) {
            throw PatchException(
                "Forced SNI host '$forcedSniHostValue' is too long. " +
                        "Maximum supported length is $MAX_SHORT_STRING_HOST_LENGTH characters."
            )
        }
        val ytimgSniHostValue = ytimgSniHost!!.trim()
        if (ytimgSniHostValue.length > MAX_SHORT_STRING_HOST_LENGTH) {
            throw PatchException(
                "ytimg SNI host '$ytimgSniHostValue' is too long. " +
                        "Maximum supported length is $MAX_SHORT_STRING_HOST_LENGTH characters."
            )
        }

        val arm64Dir = get(ARM64_DIR)
            ?: throw PatchException("Missing '$ARM64_DIR' in target APK")

        val cronetLib = chooseCronetLibrary(arm64Dir)
            ?: throw PatchException("No libcronet*.so found in '$ARM64_DIR'")

        val originalBytes = cronetLib.readBytes()
        val expected = TLS_HOST_ARGUMENT_FINGERPRINT_BYTES

        val patchOffsets = originalBytes.findAll(expected)
        if (patchOffsets.isEmpty()) {
            throw PatchException("TLS host argument fingerprint not found in ${cronetLib.name}.")
        }
        if (patchOffsets.size > 1) {
            println("WARNING: TLS host argument fingerprint matched multiple locations: " +
                    patchOffsets.joinToString { "0x${it.toString(16)}" })
            println("Using first match: 0x${patchOffsets.first().toString(16)}")
        }

        val patchOffset = patchOffsets.first() + TLS_HOST_ARGUMENT_INSTRUCTION_OFFSET
        println("DEBUG: Using patch offset: 0x${patchOffset.toString(16)}")

        val allocation = allocateExecutableTrampolineSpace(
            originalBytes = originalBytes,
            anchorFileOffset = patchOffset,
            minimumSize = TRAMPOLINE_PAYLOAD_SIZE,
        )
        val bytes = allocation.bytes
        val loadSegments = allocation.loadSegments
        val caveOffset = allocation.trampolineFileOffset
        println(
            "DEBUG: Allocated executable trampoline area at 0x${caveOffset.toString(16)}; " +
                    "segment growth=0x${allocation.grownBytes.toString(16)}, " +
                    "inserted=0x${allocation.insertedBytes.toString(16)}"
        )

        val caveVirtualAddress = allocation.trampolineVirtualAddress
        val patchVirtualAddress = fileOffsetToVirtualAddress(patchOffset, loadSegments)

        val forcedHostPortPair = buildSyntheticHostPortPair(forcedSniHostValue)
        val ytimgHostPortPair = buildSyntheticHostPortPair(ytimgSniHostValue)
        val trampoline = buildConditionalSniTrampoline(
            caveVirtualAddress = caveVirtualAddress,
            returnVirtualAddress = patchVirtualAddress + Int.SIZE_BYTES,
            forcedHostPortPair = forcedHostPortPair,
            ytimgHostPortPair = ytimgHostPortPair,
        )
        println(
            "DEBUG: Placing conditional SNI trampoline at 0x${caveOffset.toString(16)}; " +
                    "forcing $ytimgSniHostValue for $YTIMG_HOST and $forcedSniHostValue otherwise"
        )
        trampoline.copyInto(bytes, destinationOffset = caveOffset)

        // Replace `add x3, x10, #0x18` (`params_->host_and_port()`) at the
        // SSLConnectJob boundary with a branch to a trampoline. The trampoline
        // redirects `i.ytimg.com` to a dedicated synthetic pair and all other
        // TLS hostnames to the general forced pair. The nested StreamSocket has
        // already connected to the original endpoint, so the transport endpoint
        // and HTTP Host remain unchanged.
        val branchInstruction = encodeB(
            instructionVirtualAddress = patchVirtualAddress,
            targetVirtualAddress = caveVirtualAddress,
        )
        println("DEBUG: Patching instruction at 0x${patchOffset.toString(16)}: 0x${branchInstruction.toString(16)}")
        branchInstruction.toLittleEndianBytes().copyInto(bytes, destinationOffset = patchOffset)

        cronetLib.writeBytes(bytes)
    }
}
