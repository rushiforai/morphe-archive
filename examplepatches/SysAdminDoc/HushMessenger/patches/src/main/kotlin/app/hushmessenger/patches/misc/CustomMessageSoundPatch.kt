package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.coexist.validateVersionCode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.security.MessageDigest

internal const val MESSAGE_SOUND_PATCH = "Custom new-message sound"
internal const val MESSAGE_SOUND_KEY = "soundFile"
internal const val MESSAGE_SOUND_LIMIT = 1_048_576L

/**
 * SHA-256 of Messenger's raw/new_message, the same 11,615-byte Ogg file in all 37 supported builds.
 * Its path inside the APK is obfuscated and differs between builds (res/ll4.ogg, res/lns.ogg and
 * eight others), so the patch finds it by its bytes and refuses when there isn't exactly one copy.
 */
internal const val STOCK_NEW_MESSAGE_SHA256 = "724eedfb0f57edff1b82468d3f9f9076f790a7041e55c2df42113053ed7c10c2"

/** Formats Android's media player opens from an app's raw resources, keyed by file extension. */
internal val MESSAGE_SOUND_FORMATS: Map<String, (ByteArray) -> Boolean> = linkedMapOf(
    "ogg" to { it.startsWith("OggS") },
    "mp3" to { it.startsWith("ID3") || (it.size > 1 && it[0] == 0xFF.toByte() && (it[1].toInt() and 0xE0) == 0xE0) },
    "m4a" to { it.size > 8 && String(it, 4, 4, Charsets.US_ASCII) == "ftyp" },
    "wav" to { it.startsWith("RIFF") && it.size > 12 && String(it, 8, 4, Charsets.US_ASCII) == "WAVE" },
)

private fun ByteArray.startsWith(prefix: String) =
    size >= prefix.length && String(this, 0, prefix.length, Charsets.US_ASCII) == prefix

private fun refuse(reason: String): Nothing = throw PatchException("$MESSAGE_SOUND_PATCH: $reason.")

private fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

/** Reads the chosen sound, or refuses with the reason when it isn't a usable audio file of 1 MB or less. */
internal fun readMessageSound(path: String): ByteArray {
    val file = File(path.trim())
    val format = MESSAGE_SOUND_FORMATS[file.extension.lowercase()]
        ?: refuse("${file.name} isn't an .ogg, .mp3, .m4a or .wav file")
    if (!file.isFile) refuse("${file.path} doesn't exist or isn't a file")
    if (file.length() > MESSAGE_SOUND_LIMIT) refuse("${file.name} is ${file.length()} bytes, over the 1,048,576-byte (1 MB) limit")
    val bytes = file.inputStream().use { it.readNBytes(MESSAGE_SOUND_LIMIT.toInt() + 1) }
    if (bytes.isEmpty()) refuse("${file.name} is empty")
    if (bytes.size > MESSAGE_SOUND_LIMIT) refuse("${file.name} grew past the 1,048,576-byte (1 MB) limit while it was read")
    if (!format(bytes)) refuse("${file.name} doesn't start like a .${file.extension.lowercase()} file")
    return bytes
}

/** Finds the one APK resource file holding Messenger's stock new-message sound. */
internal fun findMessageSound(entries: List<String>, expected: String = STOCK_NEW_MESSAGE_SHA256, read: (String) -> ByteArray): String {
    val matches = entries.filter { it.startsWith("res/") && it.endsWith(".ogg") }.filter { sha256(read(it)) == expected }
    return when (matches.size) {
        1 -> matches.single()
        0 -> refuse("this APK doesn't have Messenger's original new-message sound. Use an unmodified arm64 Messenger ${MessengerTarget.supportedApks()}")
        else -> refuse("this APK has ${matches.size} copies of Messenger's new-message sound (${matches.joinToString()}), so it can't tell which to replace")
    }
}

/**
 * Replaces the new-message sound's bytes at its existing path, so its resource name, ID and file
 * name stay the same. A blank [chosen] path changes nothing. Every check runs before the write.
 */
internal fun replaceMessageSound(chosen: String?, entries: List<String>, file: (String) -> File, expected: String = STOCK_NEW_MESSAGE_SHA256): String? {
    if (chosen.isNullOrBlank()) return null
    val sound = readMessageSound(chosen)
    val target = findMessageSound(entries, expected) { file(it).readBytes() }
    file(target).writeBytes(sound)
    return target
}

@Suppress("unused")
val customMessageSoundPatch = resourcePatch(
    name = MESSAGE_SOUND_PATCH,
    description = "Swaps Messenger's new-message sound for an .ogg, .mp3, .m4a or .wav file of 1 MB or less that you choose. " +
        "Everything in Messenger that plays that sound plays yours. Leave the file empty to keep Messenger's sound. " +
        "A sound picked for Messenger in Android's notification settings still takes its place. Starts unselected.",
    default = false,
) {
    category("Sounds")
    compatibleWith(MessengerTarget.COMPATIBILITY)

    val soundFile by filePathOption(
        key = MESSAGE_SOUND_KEY,
        default = null,
        title = "Sound file",
        description = "An .ogg, .mp3, .m4a or .wav file of 1 MB (1,048,576 bytes) or less. Leave it empty to keep Messenger's sound.",
        required = false,
    ) { it.isNullOrBlank() || File(it.trim()).extension.lowercase() in MESSAGE_SOUND_FORMATS }

    execute {
        validateVersionCode(packageMetadata.versionCode)
        replaceMessageSound(soundFile, listApkEntries("res/"), { get(it) })
    }
}
