package app.venus.font

import android.content.Context
import android.graphics.Typeface
import android.os.Build
import com.facebook.react.bridge.Promise
import org.json.JSONObject
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import java.util.regex.Pattern

/**
 * Force system font: Discord's own fonts (gg sans, Noto Sans, Ginto, gg mono) become the phone's
 * sans-serif or monospace font, or a font file you imported, keeping each weight and italic. Every Discord text, React Native or
 * native chat, asks ReactFontManager.getTypeface(String, TypefaceStyle, AssetManager) first.
 *
 * Read from the saved Venus setting before Discord draws anything, so every screen is measured and
 * drawn with one font. Only Java/Android APIs: the host's Kotlin helpers are obfuscated.
 */
object SystemFont {
    private const val PREFS = "venus-patches.json"
    private const val MAX_PREFS = 4 * 1024 * 1024
    // First name in a family list such as "ggsans-Bold, NotoSans-Bold". Names a user picks for a
    // display-name style (8Bit, Sakura, ...) never match, so those keep their own font.
    private val discordFamily = Pattern.compile("^\\s*(ggsans|gg sans|NotoSans|ABCGinto[A-Za-z]*|ggmono|SourceCodePro)([^,]*)")
    private val monospace = Pattern.compile("^(ggmono|SourceCodePro)$")
    private val extraBold = Pattern.compile("ExtraBold")
    private val black = Pattern.compile("Black")
    private val semibold = Pattern.compile("Semi[Bb]old")
    private val bold = Pattern.compile("Bold")
    private val medium = Pattern.compile("Medium")
    private val italicName = Pattern.compile("Italic")
    private val skip = Any()
    private val cache = ConcurrentHashMap<String, Any>()

    /** Read by the patched font lookup first, so it costs one field read while the setting is off. */
    @JvmField
    @Volatile
    var enabled = false
    @Volatile
    private var appContext: Context? = null
    /** The imported font this session draws with instead of the phone's sans-serif, or null. */
    @Volatile
    private var imported: Typeface? = null

    /** Reads the saved setting once, before any text is drawn. Any problem leaves Discord's fonts alone. */
    @JvmStatic
    fun init(context: Context?) {
        appContext = context?.applicationContext ?: context
        imported = null
        enabled = try {
            val file = File(context!!.filesDir, PREFS)
            if (Build.VERSION.SDK_INT < 28 || !file.isFile || file.length() > MAX_PREFS) false
            else savedOn(file)
        } catch (_: Throwable) { false }
        // A missing or broken imported file falls back to the phone's font, never to an empty one.
        if (enabled && useFile) imported = try { load(File(File(context!!.filesDir, FOLDER), FONT_FILE)) } catch (_: Throwable) { null }
    }

    // Imported fonts live in Discord's private files, next to the settings. The display name is kept beside it.
    private const val FOLDER = "venus-files"
    private const val FONT_FILE = "font.ttf"
    private const val NAME_FILE = "font.name"
    private const val MAX_FONT = 32L * 1024 * 1024
    @Volatile
    private var useFile = false

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

    private const val PREFIX = "venus-font-v1:"

    /**
     * Reopens Discord so a changed font setting applies everywhere at once. Text in React Native is
     * measured once but re-reads its font on every draw, so switching fonts mid-session would draw the
     * new font in space measured for the old one. Called through FileModule.fileExists'
     * Promise after the setting is written; ordinary fileExists calls fall through. (Not getSize: voice
     * messages already guard that method, and two guards in one method broke Discord's startup.)
     */
    @JvmStatic
    fun dispatch(request: String, promise: Promise): Boolean {
        if (request.length < PREFIX.length || request.substring(0, PREFIX.length) != PREFIX) return false
        val action = request.substring(PREFIX.length)
        if (action == "info") { promise.resolve(info()); return true }
        if (action == "remove") { remove(promise); return true }
        if (action.length > 7 && action.substring(0, 7) == "import:") { importFile(action.substring(7), promise); return true }
        if (action != "restart") { promise.reject("VENUS_FONT", "Unknown font request"); return true }
        val context = appContext
        val launch = context?.packageManager?.getLaunchIntentForPackage(context.packageName)?.component
        if (context == null || launch == null) { promise.reject("VENUS_FONT", "Discord's start screen is unavailable"); return true }
        promise.resolve("restarting")
        // After the reply reaches JS: start a fresh task, then end this process so the old one can't linger.
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
            try {
                context.startActivity(android.content.Intent.makeRestartActivityTask(launch))
            } catch (_: Throwable) { }
            Runtime.getRuntime().exit(0)
        }, 250)
        return true
    }

    /** {"name", "size", "active"} for the imported font, or {} when there is none. */
    private fun info(): String {
        val context = appContext ?: return "{}"
        return try {
            val folder = File(context.filesDir, FOLDER)
            val font = File(folder, FONT_FILE)
            if (!font.isFile) "{}" else {
                val names = File(folder, NAME_FILE)
                val name = if (names.isFile && names.length() < 1024) String(java.nio.file.Files.readAllBytes(names.toPath()), java.nio.charset.StandardCharsets.UTF_8) else ""
                JSONObject().put("name", name).put("size", font.length()).put("active", imported != null).toString()
            }
        } catch (_: Throwable) { "{}" }
    }

    /**
     * Copies a font Venus picked (a private copy in Discord's cache, from Android's file picker) into Discord's
     * files, after checking Android can draw it. Off the bridge thread: a font can be tens of megabytes.
     * The request is {"path", "name"}; only files inside Discord's own cache are accepted.
     */
    private fun importFile(json: String, promise: Promise) {
        val context = appContext
        if (context == null) { promise.reject("VENUS_FONT", "unavailable"); return }
        val worker = Thread({
            var source: File? = null
            try {
                val request = JSONObject(json)
                val picked = File(request.optString("path", ""))
                source = picked
                val cache = context.cacheDir.canonicalPath + File.separator
                @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
                val inside = (picked.canonicalPath as java.lang.String).startsWith(cache)
                if (!inside || !picked.isFile) { promise.reject("VENUS_FONT", "unreadable"); return@Thread }
                if (picked.length() > MAX_FONT) { promise.reject("VENUS_FONT", "too-large"); return@Thread }
                if (!looksLikeFont(picked) || load(picked) == null) { promise.reject("VENUS_FONT", "not-a-font"); return@Thread }
                val folder = File(context.filesDir, FOLDER)
                if (!folder.isDirectory && !folder.mkdirs()) { promise.reject("VENUS_FONT", "unreadable"); return@Thread }
                // Copied beside the final name and then renamed, so a half-written font is never loaded.
                val temporary = File(folder, FONT_FILE + ".tmp")
                java.nio.file.Files.copy(picked.toPath(), temporary.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING)
                val target = File(folder, FONT_FILE)
                if (!temporary.renameTo(target)) { temporary.delete(); promise.reject("VENUS_FONT", "unreadable"); return@Thread }
                var name = request.optString("name", "")
                if (name.length > 120) name = name.substring(0, 120)
                // java.lang.String.getBytes: the host has no usable Kotlin text helpers.
                @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
                val bytes = (name as java.lang.String).getBytes(java.nio.charset.StandardCharsets.UTF_8)
                java.nio.file.Files.write(File(folder, NAME_FILE).toPath(), bytes)
                promise.resolve(info())
            } catch (_: Throwable) {
                promise.reject("VENUS_FONT", "unreadable")
            } finally {
                try { source?.delete() } catch (_: Throwable) { }
            }
        }, "Venus-Font-Import")
        worker.isDaemon = true
        worker.start()
    }

    private fun remove(promise: Promise) {
        val context = appContext
        if (context == null) { promise.reject("VENUS_FONT", "unavailable"); return }
        val folder = File(context.filesDir, FOLDER)
        File(folder, FONT_FILE).delete()
        File(folder, NAME_FILE).delete()
        promise.resolve("removed")
    }

    /** The system typeface for one of Discord's families, or null to let Discord load its own. */
    @JvmStatic
    fun typeface(family: String?, nearestStyle: Int): Typeface? {
        if (!enabled || family == null || nearestStyle < 0 || nearestStyle > 3) return null
        // One small array per family name, so a lookup allocates nothing once it has been seen.
        @Suppress("UNCHECKED_CAST")
        var slots = cache[family] as Array<Any?>?
        if (slots == null) {
            val made = arrayOfNulls<Any>(4)
            // Bounded by Discord's own family names; a full cache just stops remembering.
            // Two threads can see the same new family: both use the array that went in first.
            @Suppress("UNCHECKED_CAST")
            slots = (if (cache.size < 256) cache.putIfAbsent(family, made) as Array<Any?>? else null) ?: made
        }
        val cached = slots[nearestStyle]
        if (cached != null) return if (cached === skip) null else cached as Typeface
        val made = make(family, nearestStyle)
        slots[nearestStyle] = made ?: skip
        return made
    }

    private fun make(family: String, nearestStyle: Int): Typeface? {
        val match = discordFamily.matcher(family)
        if (!match.lookingAt()) return null
        val suffix = match.group(2) ?: ""
        var weight = when {
            extraBold.matcher(suffix).find() -> 800
            black.matcher(suffix).find() -> 900
            semibold.matcher(suffix).find() -> 600
            bold.matcher(suffix).find() -> 700
            medium.matcher(suffix).find() -> 500
            else -> 400
        }
        val family0 = match.group(1) ?: ""
        // Discord names the weight in the family; a bold/italic style on top of it still applies.
        // ReactFontManager's nearest style: 1 bold, 2 italic, 3 bold italic.
        if ((nearestStyle and 1) != 0 && weight < 700) weight = 700
        val italic = italicName.matcher(suffix).find() || (nearestStyle and 2) != 0
        // Code keeps a monospace font: an imported font is almost never one, and code blocks would stop lining up.
        val base = if (monospace.matcher(family0).matches()) Typeface.MONOSPACE else imported ?: Typeface.SANS_SERIF
        if (Build.VERSION.SDK_INT < 28) return null
        var made: Typeface = Typeface.create(base, weight, italic)
        // Discord's chat font loader throws "Cannot find typeface" for anything equal to Typeface.DEFAULT,
        // and on many phones plain sans-serif is exactly that. One weight unit more is the same font
        // when drawn, but its own typeface, so the loader accepts it.
        if (made == Typeface.DEFAULT) made = Typeface.create(base, weight + 1, italic)
        return if (made == Typeface.DEFAULT) null else made
    }

    /**
     * Whether the saved settings turn this on. Runs on Discord's main thread before the first screen:
     * Venus writes them with JSON.stringify, so a file without `"systemFont":true` (the switch off, the
     * common case) needs no JSON parsing. Anything else is parsed exactly as before.
     */
    private fun savedOn(file: File): Boolean {
        val text = String(java.nio.file.Files.readAllBytes(file.toPath()), java.nio.charset.StandardCharsets.UTF_8)
        // java.lang.String.indexOf: the host has no usable Kotlin text helpers.
        @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
        val raw = text as java.lang.String
        if (raw.indexOf("\"systemFont\":true") < 0 && raw.indexOf("\"systemFont\":\"") < 0) return false
        val saved = JSONObject(text)
        useFile = saved.optString("systemFontSource", "phone") == "file"
        return saved.optBoolean("systemFont", false)
    }
}
