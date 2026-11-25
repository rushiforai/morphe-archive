package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.coexist.validateVersionCode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import java.io.File
import java.security.MessageDigest

internal const val MESSAGE_SOUND_PATCH = "Custom new-message sound"
internal const val MESSAGE_SOUND_KEY = "soundFile"
internal const val MESSAGE_SOUND_LIMIT = 1_048_576L

/**
 * SHA-256 of Messenger's raw/new_message, the same 11,615-byte Ogg file in 583 and 584.
 * Its path inside the APK is obfuscated and moves between builds (res/ezh.ogg, res/ezl.ogg and res/ezo.ogg
 * across 583's, res/e0c.ogg in 584), so the patch finds it by its bytes and refuses when there isn't exactly one copy.
 */
internal const val STOCK_NEW_MESSAGE_SHA256 = "724eedfb0f57edff1b82468d3f9f9076f790a7041e55c2df42113053ed7c10c2"

/**
 * Formats Android's media player opens from an app's raw resources, keyed by file extension. Only the start of the file
 * is checked, so a cut-off file or an MP4 video still passes, and the phone plays whatever audio it can find in it.
 */
internal val MESSAGE_SOUND_FORMATS: Map<String, (ByteArray) -> Boolean> = linkedMapOf(
    "ogg" to { it.startsWith("OggS") },
    "mp3" to { it.startsWith("ID3") || (it.size > 1 && it[0] == 0xFF.toByte() && (it[1].toInt() and 0xE0) == 0xE0) },
    "m4a" to { it.size > 8 && String(it, 4, 4, Charsets.US_ASCII) == "ftyp" },
    "wav" to { it.startsWith("RIFF") && it.size > 12 && String(it, 8, 4, Charsets.US_ASCII) == "WAVE" },
)

private fun ByteArray.startsWith(prefix: String) =
    size >= prefix.length && String(this, 0, prefix.length, Charsets.US_ASCII) == prefix

private fun refuse(reason: String, patch: String = MESSAGE_SOUND_PATCH): Nothing = throw PatchException("$patch: $reason.")

private fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

/** Reads the chosen sound, or refuses with the reason when it isn't a usable audio file of 1 MB or less. */
internal fun readMessageSound(path: String, patch: String = MESSAGE_SOUND_PATCH): ByteArray {
    val file = File(path.trim())
    val format = MESSAGE_SOUND_FORMATS[file.extension.lowercase()]
        ?: refuse("${file.name} isn't an .ogg, .mp3, .m4a or .wav file", patch)
    if (!file.isFile) refuse("${file.path} doesn't exist or isn't a file", patch)
    if (file.length() > MESSAGE_SOUND_LIMIT) refuse("${file.name} is ${file.length()} bytes, over the 1,048,576-byte (1 MB) limit", patch)
    val bytes = file.inputStream().use { it.readNBytes(MESSAGE_SOUND_LIMIT.toInt() + 1) }
    if (bytes.isEmpty()) refuse("${file.name} is empty", patch)
    if (bytes.size > MESSAGE_SOUND_LIMIT) refuse("${file.name} grew past the 1,048,576-byte (1 MB) limit while it was read", patch)
    if (!format(bytes)) refuse("${file.name} doesn't start like a .${file.extension.lowercase()} file", patch)
    return bytes
}

/** One of Messenger's stock sounds: what people call it, its bytes' SHA-256 in every supported build, and its file type. */
internal class StockSound(val sound: String, val sha256: String, val extension: String = "ogg", val patch: String = MESSAGE_SOUND_PATCH)

internal val NEW_MESSAGE_SOUND = StockSound("new-message", STOCK_NEW_MESSAGE_SHA256)

/** Finds the one APK resource file holding [stock]. */
internal fun findMessageSound(entries: List<String>, stock: StockSound = NEW_MESSAGE_SOUND, read: (String) -> ByteArray): String {
    val matches = entries.filter { it.startsWith("res/") && it.endsWith(".${stock.extension}") }.filter { sha256(read(it)) == stock.sha256 }
    return when (matches.size) {
        1 -> matches.single()
        0 -> refuse("this APK doesn't have Messenger's original ${stock.sound} sound. Use an unmodified Messenger ${MessengerTarget.supportedApks()}", stock.patch)
        else -> refuse("this APK has ${matches.size} copies of Messenger's ${stock.sound} sound (${matches.joinToString()}), so it can't tell which to replace", stock.patch)
    }
}

/** Finds the one APK resource file holding Messenger's stock new-message sound, by its SHA-256. */
internal fun findMessageSound(entries: List<String>, expected: String, read: (String) -> ByteArray): String =
    findMessageSound(entries, StockSound("new-message", expected), read)

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
val customMessageSoundPatch = patch(
    name = MESSAGE_SOUND_PATCH,
    description = "Replaces Messenger's new-message sound with an .ogg, .mp3, .m4a or .wav file (1 MB or less) that you choose. Pick it in Morphe Manager's Expert mode. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Sounds")
    compatibleWith(MessengerTarget.COMPATIBILITY)

    val soundFile by filePathOption(
        key = MESSAGE_SOUND_KEY,
        default = null,
        title = "Sound file",
        description = "Your .ogg, .mp3, .m4a or .wav file, 1 MB or smaller. Leave it empty to keep Messenger's own sound.",
        required = false,
    ) { it.isNullOrBlank() || File(it.trim()).extension.lowercase() in MESSAGE_SOUND_FORMATS }

    execute {
        validateVersionCode(packageMetadata.versionCode)
        replaceMessageSound(soundFile, listApkEntries("res/"), { resourceFile(it) })
    }
}

internal const val CHAT_SOUNDS_PATCH = "Custom chat sounds"
internal const val SEND_SOUND_KEY = "sendSoundFile"
internal const val SENT_SOUND_KEY = "sentSoundFile"
internal const val IN_APP_SOUND_KEY = "inAppSoundFile"

/** raw/sound_send, raw/sound_sent and raw/in_app_notification, the same bytes in every 587 build under obfuscated paths. */
internal val SEND_SOUND = StockSound("send", "f4751c0839ad07327aec9c097221e4a3fcbdd461bc6b303a2522051366498c9c", patch = CHAT_SOUNDS_PATCH)
internal val SENT_SOUND = StockSound("sent", "e765cf8d429db8aa6e24cfea5ecb7a147b940ebf837523ca0161df63365524f7", patch = CHAT_SOUNDS_PATCH)
internal val IN_APP_SOUND = StockSound("in-app message", "dfcdabe221fe3b72b3d052d446b5249cf0470af8defc1ac316c5d68a3704f60f", "m4a", CHAT_SOUNDS_PATCH)

/**
 * Replaces each stock sound that has a file chosen for it, keeping its path. Every choice is read and every stock file
 * found before the first write, so one unusable choice changes nothing. Returns the paths it wrote.
 */
internal fun replaceChatSounds(chosen: Map<StockSound, String?>, entries: List<String>, file: (String) -> File): List<String> {
    val plan = chosen.filterValues { !it.isNullOrBlank() }.map { (stock, path) ->
        val sound = readMessageSound(path!!, CHAT_SOUNDS_PATCH)
        findMessageSound(entries, stock) { file(it).readBytes() } to sound
    }
    for ((target, sound) in plan) file(target).writeBytes(sound)
    return plan.map { it.first }
}

private const val CHAT_SOUND_FILE = "Your .ogg, .mp3, .m4a or .wav file, 1 MB or smaller. Leave it empty to keep Messenger's own sound."

@Suppress("unused")
val customChatSoundsPatch = patch(
    name = CHAT_SOUNDS_PATCH,
    description = "Replaces the sounds Messenger plays as you send a message, once it has gone through, and for a new message while Messenger is open, each with an .ogg, .mp3, .m4a or .wav file (1 MB or less) that you choose. Pick them in Morphe Manager's Expert mode. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Sounds")
    compatibleWith(MessengerTarget.COMPATIBILITY)

    val sendSound by filePathOption(
        key = SEND_SOUND_KEY,
        default = null,
        title = "Send sound",
        description = "Plays as you send a message. $CHAT_SOUND_FILE",
        required = false,
    ) { it.isNullOrBlank() || File(it.trim()).extension.lowercase() in MESSAGE_SOUND_FORMATS }
    val sentSound by filePathOption(
        key = SENT_SOUND_KEY,
        default = null,
        title = "Sent sound",
        description = "Plays once a message you sent has gone through. $CHAT_SOUND_FILE",
        required = false,
    ) { it.isNullOrBlank() || File(it.trim()).extension.lowercase() in MESSAGE_SOUND_FORMATS }
    val inAppSound by filePathOption(
        key = IN_APP_SOUND_KEY,
        default = null,
        title = "In-app message sound",
        description = "Plays for a new message while Messenger is open. $CHAT_SOUND_FILE",
        required = false,
    ) { it.isNullOrBlank() || File(it.trim()).extension.lowercase() in MESSAGE_SOUND_FORMATS }

    execute {
        validateVersionCode(packageMetadata.versionCode)
        replaceChatSounds(mapOf(SEND_SOUND to sendSound, SENT_SOUND to sentSound, IN_APP_SOUND to inAppSound), listApkEntries("res/")) { resourceFile(it) }
    }
}
