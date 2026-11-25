package patches.magicearth

import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest

private const val GEM = "lib/arm64-v8a/libGEM.so"
private val telemetryDispatches = mapOf(
    0x10b4a28 to "4d460094", // storage callback loaded at 0x10b4a1c
    0x10cc964 to "7ee6ff97", // storage callback loaded at 0x10cc958
    0x10bc464 to "be270094", // usage callback loaded at 0x10bc458
)

/** Suppress only the three traced, result-unused calls to the telemetry job helper. */
internal fun withoutGemTelemetryDispatch(input: ByteArray): ByteArray {
    check(input.size == 47042352) { "Unsupported Magic Earth GEM image size" }
    val hash = MessageDigest.getInstance("SHA-256").digest(input)
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    check(hash == "0884a04b6a87f87e70e2b18197273649d29bfcf1921a8a6b5e266445a466c70a") {
        "Unsupported Magic Earth GEM image or patch already applied"
    }
    // The pinned ELF's executable PT_LOAD maps these virtual addresses to equal file offsets.
    telemetryDispatches.forEach { (offset, before) ->
        val bytes = before.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
        check(input.copyOfRange(offset, offset + 4).contentEquals(bytes)) {
            "Magic Earth GEM telemetry dispatch changed"
        }
    }
    return input.copyOf().also { output ->
        telemetryDispatches.keys.forEach { offset ->
            byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte()).copyInto(output, offset)
        }
    }
}

@Suppress("unused")
val disableGemTelemetryDispatch = resourcePatch(
    name = "Disable GEM telemetry dispatch",
    description = "ARM64 only: prevents the traced GEM storage and usage telemetry jobs from being queued. Keeps SDK initialization intact. Local statistics storage may remain; runtime validation pending.",
    default = false,
) {
    compatibleWith(magicEarth)
    dependsOn(originalInput)
    execute {
        val libraries = listApkEntries("lib").filter { it.endsWith("/libGEM.so") }.toSet()
        check(libraries == setOf(GEM)) { "Select the complete original ARM64 Magic Earth split set" }
        val file = get(GEM)
        file.writeBytes(withoutGemTelemetryDispatch(file.readBytes()))
    }
}
