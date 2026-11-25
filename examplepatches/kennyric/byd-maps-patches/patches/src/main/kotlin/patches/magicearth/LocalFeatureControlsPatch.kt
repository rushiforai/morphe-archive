package patches.magicearth

import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest

private const val LIBRARY = "lib/arm64-v8a/libapp.so"
private const val IMAGE_SIZE = 19334024
private const val IMAGE_HASH = "d95665e9a434a8fcfe5ade23dbd733a66b386ab5a2c2b6b4d3f7bd5b86485ef4"
private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it.toInt() and 0xff) }
private fun String.bytes() = chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private data class Function(val offset: Int, val size: Int, val hash: String)
private data class Edit(val offset: Int, val before: String, val after: String)

private val functions = listOf(
    Function(0xb96e90, 0x140, "8bbdc90594b35a66e71e97555d00ad502655556714c1ba7c722b9f48f0c89a8b"),
    Function(0xb794b4, 0x19c, "91ed28942da3672eab98067592d3de45efa730f5aecf5085880d8387fbc15d72"),
    Function(0xba9154, 0x150, "ce3abbac572ac70797a96201fb2d280cef56ed90a5e6799d793dd665e856b81d"),
    Function(0xbb5d44, 0x4c, "23f7b5c2eb62c924d05b6f339577fcee8ff79de796bcbee487b3c7d11f54a741"),
    Function(0xde0f4c, 0x5cc, "2821125549cc5e7fafec370af46f8835655956d2462bb2ae910c73a0b3cf942f"),
    Function(0xc1e2c4, 0xac, "c96b543a32a133cb465bac11f4295465d9cf1d057434b96ca7751d1460351bf3"),
    Function(0xc1e90c, 0x460, "d56827c750c4bf90683f287d7e7bb7d3874aeca01a1f22889c25ded86165b647"),
)
private val edits = listOf(
    // handlePremiumFeatureCheck: take its existing true/Future return path.
    Edit(0xb96f40, "c2002036", "06000014"),
    // Preserve weather/TTS/HUD/waypoint policies; skip only these two disable calls.
    Edit(0xb79628, "76070094", "1f2003d5"),
    Edit(0xb79630, "47060094", "1f2003d5"),
    // ensureMapUpdatePremium: retain its existing true/Future return path.
    Edit(0xba9270, "20012036", "09000014"),
    // Promotional Widget builders: allocate an empty SizedBox with null child/dimensions.
    // Preserve a Dart frame and the original allocator/GC slow path; never return null.
    Edit(0xbb5d44, "fd79bfa9fd030faaef2100d1502740f9ff0110eb", "fd79bfa9fd030faa2d15ee97fd79c1a8c0035fd6"),
    Edit(0xde0f4c, "fd79bfa9fd030faaefa101d1e00301aaa1831ff8", "fd79bfa9fd030faaab68e597fd79c1a8c0035fd6"),
    Edit(0xc1e2c4, "fd79bfa9fd030faaef8100d1a1831ff8502740f9", "fd79bfa9fd030faacd73ec97fd79c1a8c0035fd6"),
    Edit(0xc1e90c, "fd79bfa9fd030faaef2101d1e00301aae10302aa", "fd79bfa9fd030faa3b72ec97fd79c1a8c0035fd6"),
)

/**
 * The audited ELF executable PT_LOAD maps file offsets and virtual addresses equally.
 * The complete image hash pins that layout as well as all unedited instructions.
 * No subscription status, receipt, SDK activation or network response is changed.
 */
internal fun enableLocalFeatureControls(input: ByteArray): ByteArray {
    check(input.size == IMAGE_SIZE && input.sha256() == IMAGE_HASH) {
        "Unsupported Magic Earth ARM64 image or patch already applied"
    }
    functions.forEach { function ->
        check(input.copyOfRange(function.offset, function.offset + function.size).sha256() == function.hash) {
            "Magic Earth local feature function changed"
        }
    }
    edits.forEach { edit ->
        check(input.copyOfRange(edit.offset, edit.offset + edit.before.length / 2).contentEquals(edit.before.bytes())) {
            "Magic Earth local feature instruction changed"
        }
    }
    return input.copyOf().also { output ->
        edits.forEach { edit -> edit.after.bytes().copyInto(output, edit.offset) }
    }
}

@Suppress("unused")
val localFeatureControls = resourcePatch(
    name = "Enable local feature controls",
    description = "ARM64 only: skips local premium prompts for recording, map downloads and map styles, preserves traffic/elevation selections, and hides four premium promotion widgets. Online services still require server authorization. Runtime validation pending.",
    default = false,
) {
    compatibleWith(magicEarth)
    dependsOn(originalInput, nativeCarFeatureControls)
    execute {
        val libraries = listApkEntries("lib").filter { it.endsWith("/libapp.so") }.toSet()
        check(libraries == setOf(LIBRARY)) { "Select the complete original ARM64 Magic Earth split set" }
        val file = get(LIBRARY)
        val output = enableLocalFeatureControls(file.readBytes())
        file.writeBytes(output)
    }
}
