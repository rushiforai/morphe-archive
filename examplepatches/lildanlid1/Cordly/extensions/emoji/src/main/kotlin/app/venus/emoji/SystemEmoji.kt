package app.venus.emoji

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Typeface
import com.facebook.react.bridge.Promise
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.util.concurrent.ConcurrentHashMap

/**
 * Force system emojis: Discord's native chat, reactions and emoji picker get every Unicode emoji's
 * picture from Surrogates.toAssetUrl, which points at Discord's bundled Twemoji PNGs. While this is
 * on, the emoji is drawn once with the phone's own emoji font (or an emoji font you imported) into a small PNG in Discord's cache,
 * and that file is used instead, so sizes, spoilers and taps keep working as before.
 *
 * Read from the saved Cordly setting once at launch, so one session never mixes the two styles.
 * Only Java/Android APIs: the host's Kotlin helpers are obfuscated.
 */
object SystemEmoji {
    private const val PREFS = "venus-patches.json"
    private const val MAX_PREFS = 4 * 1024 * 1024
    private const val SIZE = 128
    private const val PREFIX = "venus-emoji-v1:"
    // Changed whenever the drawing changes, so files drawn by an older release are never reused. Inside it, one
    // folder per emoji font (see fontStamp), so a font update draws every emoji again.
    private const val FOLDER = "venus-emoji-v1"
    private val urls = ConcurrentHashMap<String, String>()
    private val unsupported = ConcurrentHashMap<String, Boolean>()

    /** Read by the patched lookup first, so it costs one field read while the setting is off. */
    @JvmField
    @Volatile
    var enabled = false
    @Volatile
    private var directory: File? = null
    @Volatile
    private var appContext: Context? = null
    /** The imported emoji font this session draws with, or null for the phone's own. */
    @Volatile
    private var imported: Typeface? = null
    @Volatile
    private var useFile = false
    // Imported fonts live in Discord's private files, next to the settings. The display name is kept beside it.
    private const val FILES = "venus-files"
    private const val FONT_FILE = "emoji.ttf"
    private const val NAME_FILE = "emoji.name"
    private const val MAX_FONT = 64L * 1024 * 1024
    /** The font family React Native emojis ask for while an imported emoji font is in use (see bootstrap.js). */
    private const val FAMILY = "CordlyEmoji"

    /** Reads the saved setting once, before any emoji is drawn. Any problem leaves Discord's emojis alone. */
    @JvmStatic
    fun init(context: Context?) {
        appContext = context?.applicationContext ?: context
        imported = null
        enabled = try {
            val file = File(context!!.filesDir, PREFS)
            // Starts off, like every Cordly setting: no saved settings yet, or none for this switch, means off.
            val on = file.isFile && file.length() <= MAX_PREFS &&
                savedOn(file)
            if (on && useFile) imported = try { load(File(File(context.filesDir, FILES), FONT_FILE)) } catch (_: Throwable) { null }
            if (on && imported != null) registerFamily(imported!!)
            if (!on) false else {
                // One folder per emoji font: after a system or emoji font update the old drawings were shown forever.
                // Folders for an older font are removed, so the cache never holds two sets.
                val root = File(context.cacheDir, FOLDER)
                val folder = File(root, fontStamp())
                if (folder.isDirectory || folder.mkdirs()) {
                    directory = folder
                    // Off the launch path: there can be thousands of old drawings.
                    val cleanup = Thread({
                        try {
                            val old = root.listFiles()
                            // Releases up to 1.7.0 drew straight into this folder: those loose files go too.
                            if (old != null) for (stale in old) if (stale.name != folder.name) { if (stale.isDirectory) removeFolder(stale) else stale.delete() }
                        } catch (_: Throwable) { }
                    }, "Cordly-Emoji-Cleanup")
                    cleanup.isDaemon = true
                    cleanup.priority = Thread.MIN_PRIORITY
                    cleanup.start()
                    true
                } else false
            }
        } catch (_: Throwable) { false }
    }

    /**
     * The phone's emoji font, by file size and date, plus the Android build, plus the imported font when one is in use.
     * Changes whenever any of them is updated, so drawings from another font are never shown.
     */
    private fun fontStamp(): String {
        var stamp = android.os.Build.FINGERPRINT.hashCode().toLong()
        val context = appContext
        if (imported != null && context != null) {
            val file = File(File(context.filesDir, FILES), FONT_FILE)
            stamp = stamp * 31 + 7 + file.length() * 13 + file.lastModified()
        }
        for (path in EMOJI_FONTS) {
            val file = File(path)
            if (file.exists()) stamp = stamp * 31 + (if (file.isFile) file.length() * 17 else 0L) + file.lastModified()
        }
        return "f" + java.lang.Long.toHexString(stamp)
    }
    private val EMOJI_FONTS = arrayOf("/system/fonts/NotoColorEmoji.ttf", "/system/fonts/NotoColorEmojiFlags.ttf",
        "/system/fonts/SamsungColorEmoji.ttf", "/data/fonts/files")

    private fun removeFolder(folder: File) {
        val files = folder.listFiles()
        if (files != null) for (file in files) file.delete()
        folder.delete()
    }

    /**
     * Reopens Discord so a changed emoji setting applies everywhere at once. Called through
     * FileModule.getVideoDimensions' Promise: Discord for Android never uses that method (it only
     * answers "only supported on iOS"), so no other Cordly guard shares it.
     */
    @JvmStatic
    fun dispatch(request: String, promise: Promise) {
        val action = if (request.length >= PREFIX.length && request.substring(0, PREFIX.length) == PREFIX) request.substring(PREFIX.length) else ""
        if (action == "info") { promise.resolve(info()); return }
        if (action == "remove") { remove(promise); return }
        if (action.length > 7 && action.substring(0, 7) == "import:") { importFile(action.substring(7), promise); return }
        if (action != "restart") { promise.reject("VENUS_EMOJI", "Unknown emoji request"); return }
        val context = appContext
        val launch = context?.packageManager?.getLaunchIntentForPackage(context.packageName)?.component
        if (context == null || launch == null) { promise.reject("VENUS_EMOJI", "Discord's start screen is unavailable"); return }
        promise.resolve("restarting")
        // After the reply reaches JS: start a fresh task, then end this process so the old one can't linger.
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
            try {
                context.startActivity(android.content.Intent.makeRestartActivityTask(launch))
            } catch (_: Throwable) { }
            Runtime.getRuntime().exit(0)
        }, 250)
    }

    /** The typeface in a font file, or null when Android can't read it as one. */
    private fun load(file: File): Typeface? {
        if (!file.isFile || file.length() < 12 || file.length() > MAX_FONT) return null
        val made = Typeface.createFromFile(file)
        return if (made == null || made == Typeface.DEFAULT) null else made
    }

    /** TrueType, OpenType, TrueType collection or Apple TrueType: the formats Android's font loader accepts. */
    private fun looksLikeFont(file: File): Boolean {
        val head = ByteArray(4)
        val input = java.io.FileInputStream(file)
        try { if (input.read(head) != 4) return false } finally { input.close() }
        val tag = ((head[0].toInt() and 255) shl 24) or ((head[1].toInt() and 255) shl 16) or ((head[2].toInt() and 255) shl 8) or (head[3].toInt() and 255)
        return tag == 0x00010000 || tag == 0x4F54544F || tag == 0x74746366 || tag == 0x74727565
    }

    /**
     * Whether the font draws emojis itself. Android falls back to the phone's emoji font for anything a font lacks, so
     * hasGlyph says yes for any font: instead, a few common emojis are drawn with it and with the phone's font, and a font
     * that draws every one exactly like the phone does has no emojis of its own.
     */
    private fun drawsEmojis(typeface: Typeface): Boolean {
        // Grinning face, red heart, thumbs up: in every emoji font, from the oldest to the newest.
        for (sample in arrayOf("\uD83D\uDE00", "\u2764\uFE0F", "\uD83D\uDC4D")) {
            val mine = picture(sample, typeface)
            val phone = picture(sample, Typeface.DEFAULT)
            try { if (!mine.sameAs(phone)) return true } finally { mine.recycle(); phone.recycle() }
        }
        return false
    }

    private fun picture(text: String, typeface: Typeface): Bitmap {
        val paint = Paint(Paint.ANTI_ALIAS_FLAG)
        paint.typeface = typeface
        paint.textSize = 40f
        val bitmap = Bitmap.createBitmap(48, 48, Bitmap.Config.ARGB_8888)
        Canvas(bitmap).drawText(text, 4f, 40f, paint)
        return bitmap
    }

    /**
     * React Native emojis (reaction lists, statuses, the emoji grid) are drawn as text. Registering the imported font as a
     * custom family in ReactFontManager lets them ask for it by name; its own font lookup checks custom families first.
     * Reflection: the class is React Native's, and compiling against it would ship a second copy.
     */
    private fun registerFamily(typeface: Typeface) {
        try {
            val manager = Class.forName("com.facebook.react.common.assets.ReactFontManager")
            val instance = manager.getMethod("getInstance").invoke(null)
            manager.getMethod("addCustomFont", String::class.java, Typeface::class.java).invoke(instance, FAMILY, typeface)
        } catch (_: Throwable) { }
    }

    /** {"name", "size", "active"} for the imported emoji font, or {} when there is none. */
    private fun info(): String {
        val context = appContext ?: return "{}"
        return try {
            val folder = File(context.filesDir, FILES)
            val font = File(folder, FONT_FILE)
            if (!font.isFile) "{}" else {
                val names = File(folder, NAME_FILE)
                val name = if (names.isFile && names.length() < 1024) String(java.nio.file.Files.readAllBytes(names.toPath()), java.nio.charset.StandardCharsets.UTF_8) else ""
                JSONObject().put("name", name).put("size", font.length()).put("active", imported != null).toString()
            }
        } catch (_: Throwable) { "{}" }
    }

    /**
     * Copies an emoji font Cordly picked (a private copy in Discord's cache, from Android's file picker) into Discord's
     * files, after checking Android can draw emojis with it. Off the bridge thread: emoji fonts are often 10-30 MB.
     * The request is {"path", "name"}; only files inside Discord's own cache are accepted.
     */
    private fun importFile(json: String, promise: Promise) {
        val context = appContext
        if (context == null) { promise.reject("VENUS_EMOJI", "unavailable"); return }
        val worker = Thread({
            var source: File? = null
            try {
                val request = JSONObject(json)
                val picked = File(request.optString("path", ""))
                source = picked
                val cache = context.cacheDir.canonicalPath + File.separator
                @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
                val inside = (picked.canonicalPath as java.lang.String).startsWith(cache)
                if (!inside || !picked.isFile) { promise.reject("VENUS_EMOJI", "unreadable"); return@Thread }
                if (picked.length() > MAX_FONT) { promise.reject("VENUS_EMOJI", "too-large"); return@Thread }
                val typeface = if (looksLikeFont(picked)) load(picked) else null
                if (typeface == null) { promise.reject("VENUS_EMOJI", "not-a-font"); return@Thread }
                if (!drawsEmojis(typeface)) { promise.reject("VENUS_EMOJI", "no-emojis"); return@Thread }
                val folder = File(context.filesDir, FILES)
                if (!folder.isDirectory && !folder.mkdirs()) { promise.reject("VENUS_EMOJI", "unreadable"); return@Thread }
                // Copied beside the final name and then renamed, so a half-written font is never loaded.
                val temporary = File(folder, FONT_FILE + ".tmp")
                java.nio.file.Files.copy(picked.toPath(), temporary.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING)
                if (!temporary.renameTo(File(folder, FONT_FILE))) { temporary.delete(); promise.reject("VENUS_EMOJI", "unreadable"); return@Thread }
                var name = request.optString("name", "")
                if (name.length > 120) name = name.substring(0, 120)
                // java.lang.String.getBytes: the host has no usable Kotlin text helpers.
                @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
                val bytes = (name as java.lang.String).getBytes(java.nio.charset.StandardCharsets.UTF_8)
                java.nio.file.Files.write(File(folder, NAME_FILE).toPath(), bytes)
                promise.resolve(info())
            } catch (_: Throwable) {
                promise.reject("VENUS_EMOJI", "unreadable")
            } finally {
                try { source?.delete() } catch (_: Throwable) { }
            }
        }, "Cordly-Emoji-Import")
        worker.isDaemon = true
        worker.start()
    }

    private fun remove(promise: Promise) {
        val context = appContext
        if (context == null) { promise.reject("VENUS_EMOJI", "unavailable"); return }
        val folder = File(context.filesDir, FILES)
        File(folder, FONT_FILE).delete()
        File(folder, NAME_FILE).delete()
        promise.resolve("removed")
    }

    /** A file URL for the phone's drawing of this emoji, or null to let Discord use its own picture. */
    @JvmStatic
    fun url(surrogates: String?): String? {
        if (!enabled || surrogates == null || surrogates.length == 0 || surrogates.length > 64) return null
        val known = urls.get(surrogates)
        if (known != null) return known
        if (unsupported.containsKey(surrogates)) return null
        val made = try { draw(surrogates) } catch (_: Throwable) { null }
        // Both maps are bounded by the number of emojis; a full map only stops remembering.
        if (made == null) {
            if (unsupported.size < 4096) unsupported.put(surrogates, true)
        } else if (urls.size < 8192) urls.put(surrogates, made)
        return made
    }

    private fun fileName(surrogates: String): String {
        val out = StringBuilder()
        var i = 0
        while (i < surrogates.length) {
            val point = Character.codePointAt(surrogates, i)
            if (out.length > 0) out.append('-')
            out.append(Integer.toHexString(point))
            i += Character.charCount(point)
        }
        return out.append(".png").toString()
    }

    private fun draw(surrogates: String): String? {
        val folder = directory ?: return null
        val file = File(folder, fileName(surrogates))
        if (file.isFile && file.length() > 0) return "file://" + file.absolutePath
        val paint = Paint(Paint.ANTI_ALIAS_FLAG)
        paint.typeface = imported ?: Typeface.DEFAULT
        paint.textSize = SIZE * 0.8f
        paint.textAlign = Paint.Align.CENTER
        // An emoji newer than the phone's font keeps Discord's picture, not an empty box.
        if (!paint.hasGlyph(surrogates)) return null
        val width = paint.measureText(surrogates)
        if (width > SIZE) paint.textSize = paint.textSize * SIZE / width
        val metrics = paint.fontMetrics
        val bitmap = Bitmap.createBitmap(SIZE, SIZE, Bitmap.Config.ARGB_8888)
        try {
            Canvas(bitmap).drawText(surrogates, SIZE / 2f, SIZE / 2f - (metrics.ascent + metrics.descent) / 2f, paint)
            // Written beside the final name and then renamed, so a half-written file is never shown.
            val temporary = File(folder, file.name + "." + Thread.currentThread().id + ".tmp")
            try {
                val out = FileOutputStream(temporary)
                try { if (!bitmap.compress(Bitmap.CompressFormat.PNG, 100, out)) return null } finally { out.close() }
                if (!temporary.renameTo(file) && !file.isFile) return null
            } finally {
                temporary.delete()
            }
        } finally {
            bitmap.recycle()
        }
        return "file://" + file.absolutePath
    }

    /**
     * Whether the saved settings turn this on. Runs on Discord's main thread before the first screen:
     * Cordly writes them with JSON.stringify, so a file without `"systemEmoji":true` (the switch off, the
     * common case) needs no JSON parsing. Anything else is parsed exactly as before.
     */
    private fun savedOn(file: File): Boolean {
        val text = String(java.nio.file.Files.readAllBytes(file.toPath()), java.nio.charset.StandardCharsets.UTF_8)
        // java.lang.String.indexOf: the host has no usable Kotlin text helpers.
        @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
        val raw = text as java.lang.String
        if (raw.indexOf("\"systemEmoji\":true") < 0 && raw.indexOf("\"systemEmoji\":\"") < 0) return false
        val saved = JSONObject(text)
        useFile = saved.optString("systemEmojiSource", "phone") == "file"
        return saved.optBoolean("systemEmoji", false)
    }
}
