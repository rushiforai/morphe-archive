package app.venus.monet

import android.app.Activity
import android.content.Context
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.ViewGroup
import com.facebook.react.bridge.Promise
import java.io.File

/**
 * Material You colors and Custom themes, native side.
 *
 * 1. Hands Cordly the phone's wallpaper palettes (Android 12+ system_accent1..3 and system_neutral1..2, 13 shades each)
 *    as JSON. Cordly builds Discord's colors from them in JavaScript.
 * 2. Recolors Discord's native views (the chat list, voice overlay, reactions, notifications, window background) with
 *    the same palette: every theme color they use passes through ColorUtilsKt.applySaturationFactor, which asks [remap]
 *    first. Cordly sends a table of Discord color -> Material color (same tone, so Light stays light and Midnight black);
 *    it's saved, so the next launch is colored from the first frame.
 *
 * Reached through FileModule.getFileHash's Promise with a private URI prefix: Discord never calls getFileHash, and a
 * TurboModule can't gain new methods. Anything else falls through to Discord's own code. Only Java/Android APIs: the
 * host's Kotlin helpers are obfuscated.
 */
object SystemColors {
    private const val PREFIX = "venus-monet-v1:"
    private const val SAVED = "venus-monet.txt"
    private const val MAX_ENTRIES = 1024
    private const val PREFS = "venus-patches.json"
    private const val MAX_PREFS = 4 * 1024 * 1024
    private val palettes = arrayOf("accent1", "accent2", "accent3", "neutral1", "neutral2")
    private val shades = intArrayOf(0, 10, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)

    /** One table, swapped whole, so a color lookup on another thread never sees half of an update. */
    private class Table(@JvmField val keys: IntArray, @JvmField val values: IntArray, @JvmField val source: String)
    private val empty = Table(IntArray(0), IntArray(0), "")

    /** Read by the patched color lookup first, so it costs one field read while Material You is off. */
    @JvmField
    @Volatile
    var enabled = false
    @Volatile
    private var table = empty
    @Volatile
    private var appContext: Context? = null

    /** Loads the saved table once, before Discord draws anything. Any problem leaves Discord's colors alone. */
    @JvmStatic
    fun init(context: Context?) {
        appContext = context?.applicationContext ?: context
        try {
            val file = File(context!!.filesDir, SAVED)
            if (!file.isFile || file.length() > MAX_ENTRIES * 12L + 16 || !savedOn(File(context.filesDir, PREFS))) return
            val parsed = parse(String(java.nio.file.Files.readAllBytes(file.toPath()), java.nio.charset.StandardCharsets.UTF_8))
            if (parsed != null) { table = parsed; enabled = true }
        } catch (_: Throwable) { }
    }

    /**
     * Whether Cordly' saved settings still have Material You or Custom themes on, so turning them off and leaving Discord
     * before the native side heard about it never brings the colors back. Cordly writes them with JSON.stringify.
     */
    private fun savedOn(file: File): Boolean {
        if (!file.isFile || file.length() > MAX_PREFS) return false
        val text = String(java.nio.file.Files.readAllBytes(file.toPath()), java.nio.charset.StandardCharsets.UTF_8)
        @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
        val raw = text as java.lang.String
        if (raw.indexOf("\"materialYou\":") < 0 && raw.indexOf("\"customThemes\":") < 0) return false
        val json = org.json.JSONObject(text)
        return json.optBoolean("materialYou", false) || json.optBoolean("customThemes", false)
    }

    /** Discord's color in Material You, keeping its alpha; anything not in the table is returned as it was. */
    @JvmStatic
    fun remap(color: Int): Int {
        val current = table
        val keys = current.keys
        if (keys.size == 0) return color
        val at = java.util.Arrays.binarySearch(keys, color and 0xffffff)
        if (at < 0 || at >= current.values.size) return color
        return (color and -0x1000000) or current.values[at]
    }

    @JvmStatic
    fun dispatch(request: String, context: Context?, promise: Promise): Boolean {
        if (request.length < PREFIX.length || request.substring(0, PREFIX.length) != PREFIX) return false
        val body = request.substring(PREFIX.length)
        if (appContext == null && context != null) appContext = context.applicationContext ?: context
        try {
            when {
                body == "colors" -> promise.resolve(read(context))
                body == "off" -> { apply(empty, context); promise.resolve("off") }
                body.length > 4 && body.substring(0, 4) == "map:" -> {
                    val parsed = parse(body.substring(4))
                    if (parsed == null) promise.reject("VENUS_MONET", "Bad color table")
                    else { apply(parsed, context); promise.resolve("on") }
                }
                else -> promise.reject("VENUS_MONET", "Unknown request")
            }
        } catch (_: Throwable) {
            promise.resolve("")
        }
        return true
    }

    /** The palettes as {"accent1":["#rrggbb", ...13], ...}, or "" before Android 12. */
    private fun read(context: Context?): String {
        if (Build.VERSION.SDK_INT < 31 || context == null) return ""
        val res = context.resources
        val out = StringBuilder(1024).append('{')
        var p = 0
        while (p < palettes.size) {
            if (p > 0) out.append(',')
            out.append('"').append(palettes[p]).append("\":[")
            var s = 0
            while (s < shades.size) {
                val id = res.getIdentifier("system_" + palettes[p] + "_" + shades[s], "color", "android")
                if (id == 0) return ""
                val color = res.getColor(id, null) and 0xffffff
                if (s > 0) out.append(',')
                val hex = Integer.toHexString(color or 0x1000000).substring(1)
                out.append("\"#").append(hex).append('"')
                s++
            }
            out.append(']')
            p++
        }
        return out.append('}').toString()
    }

    /** "rrggbbRRGGBB" pairs, Discord's color then Material's, sorted by Discord's color. Null if anything is off. */
    private fun parse(text: String): Table? {
        val size = text.length / 12
        if (size == 0 || size > MAX_ENTRIES || text.length != size * 12) return null
        val keys = IntArray(size)
        val values = IntArray(size)
        var i = 0
        while (i < size) {
            val key = Integer.parseInt(text.substring(i * 12, i * 12 + 6), 16)
            val value = Integer.parseInt(text.substring(i * 12 + 6, i * 12 + 12), 16)
            if (i > 0 && key <= keys[i - 1]) return null
            keys[i] = key
            values[i] = value
            i++
        }
        return Table(keys, values, text)
    }

    /** Switches tables, saves the choice for the next launch, and redraws what's on screen when anything changed. */
    private fun apply(next: Table, context: Context?) {
        if (next.source == table.source) return
        table = next
        enabled = next.keys.size > 0
        val app = appContext
        try {
            if (app != null) {
                val file = File(app.filesDir, SAVED)
                if (next.keys.size == 0) file.delete()
                else {
                    val temp = File(app.filesDir, "$SAVED.tmp")
                    java.nio.file.Files.write(temp.toPath(), next.source.toByteArray(java.nio.charset.StandardCharsets.UTF_8))
                    if (!temp.renameTo(file)) temp.delete()
                }
            }
        } catch (_: Throwable) { }
        val activity = currentActivity(context)
        Handler(Looper.getMainLooper()).post(object : Runnable {
            override fun run() {
                refreshThemeObjects()
                if (activity != null) refresh(activity)
            }
        })
    }

    /**
     * Discord keeps one object per appearance whose colors are each read once, and chat rows hold on to it. Each one is
     * rebuilt and its fresh, not-yet-read colors are copied into the object everyone already holds, so every view reads
     * the new palette the next time it draws or binds.
     */
    private fun refreshThemeObjects() {
        try {
            val manager = Class.forName("com.discord.theme.ThemeManager")
            val field = manager.getDeclaredField("themes")
            field.isAccessible = true
            @Suppress("UNCHECKED_CAST")
            val themes = field.get(null) as? MutableMap<Any?, Any?> ?: return
            val held = java.util.ArrayList<Any?>(themes.size * 2)
            val entries = themes.entries.iterator()
            while (entries.hasNext()) { val entry = entries.next(); held.add(entry.key); held.add(entry.value) }
            themes.clear()
            if (held.size == 0) return
            val instance = manager.getField("INSTANCE").get(null)
            val getTheme = manager.getMethod("getTheme", Class.forName("com.discord.theme.DiscordTheme"))
            var i = 0
            while (i < held.size) {
                val key = held[i]
                val old = held[i + 1]
                i += 2
                if (old == null) continue
                try {
                    val fresh = getTheme.invoke(instance, key) ?: continue
                    if (fresh.javaClass != old.javaClass) continue
                    var type: Class<*>? = old.javaClass
                    while (type != null && type != Any::class.java) {
                        for (f in type.declaredFields) {
                            if (java.lang.reflect.Modifier.isStatic(f.modifiers)) continue
                            f.isAccessible = true
                            f.set(old, f.get(fresh))
                        }
                        type = type.superclass
                    }
                    themes.put(key, old)
                } catch (_: Throwable) {
                    // Chat rows still hold the old object: keep it in the map, or the next lookup builds a third one.
                    themes.put(key, old)
                }
            }
        } catch (_: Throwable) { }
    }

    private fun currentActivity(context: Context?): Activity? = try {
        if (context is Activity) context
        else context?.javaClass?.getMethod("getCurrentActivity")?.invoke(context) as? Activity
    } catch (_: Throwable) { null }

    /** Window background and system bars the way Discord redraws them on a theme change, then every native list. */
    private fun refresh(activity: Activity) {
        try {
            val utils = Class.forName("com.discord.theme.utils.ActivityThemeUtils")
            val instance = utils.getField("INSTANCE").get(null)
            utils.getMethod("updateActivityTheming\$theme_release", Activity::class.java).invoke(instance, activity)
        } catch (_: Throwable) { }
        try { sweep(activity.window.decorView, 0) } catch (_: Throwable) { }
    }

    /** RecyclerView, looked up once through Discord's class loader: a sweep visits every view on screen. */
    @Volatile
    private var listClass: Class<*>? = null
    private fun listClassFor(view: View): Class<*>? {
        val known = listClass
        if (known != null) return known
        return try {
            val found = Class.forName("androidx.recyclerview.widget.RecyclerView", false, view.javaClass.classLoader)
            listClass = found
            found
        } catch (_: Throwable) { null }
    }

    /** Rebinds native lists (chat rows read their colors when bound) and redraws everything else. */
    private fun sweep(view: View, depth: Int) {
        if (depth > 64) return
        val list = listClassFor(view)
        if (list != null && list.isInstance(view)) {
            try {
                val adapter = view.javaClass.getMethod("getAdapter").invoke(view)
                adapter?.javaClass?.getMethod("notifyDataSetChanged")?.invoke(adapter)
            } catch (_: Throwable) { }
        }
        view.invalidate()
        if (view is ViewGroup) {
            var i = 0
            while (i < view.childCount) {
                val child = view.getChildAt(i)
                if (child != null) sweep(child, depth + 1)
                i++
            }
        }
    }
}
