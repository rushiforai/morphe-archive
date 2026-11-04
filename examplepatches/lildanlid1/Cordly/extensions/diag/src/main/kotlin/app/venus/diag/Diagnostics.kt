@file:Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "DEPRECATION")

package app.venus.diag

import android.app.Activity
import android.app.ActivityManager
import android.app.Application
import android.app.ApplicationExitInfo
import android.app.Dialog
import android.content.ClipData
import android.content.ClipboardManager
import android.content.ContentValues
import android.content.Context
import android.content.Intent
import android.content.res.ColorStateList
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.RippleDrawable
import android.os.Build
import android.os.Bundle
import android.os.Debug
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.os.Process
import android.os.StatFs
import android.provider.MediaStore
import android.text.TextUtils
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.WindowInsets
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast
import com.facebook.react.bridge.Promise
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream
import java.io.PrintWriter
import java.io.StringWriter
import java.lang.ref.WeakReference
import java.nio.charset.StandardCharsets
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.TimeZone

/**
 * Crash screen and troubleshooting logs.
 *
 * When Discord crashes (a Java/Kotlin exception, a fatal JavaScript error React Native rethrows as one, and on Android 11
 * or newer also native crashes and "isn't responding"), a report is written to Discord's private files: what was
 * thrown, every cause, every thread, the device, memory, the Conduit settings that are on, Conduit's own debug log and
 * this process's logcat. The next time Discord opens, it's shown on a full-screen page with Copy, Share and Export.
 *
 * Conduit settings reaches the same reports, the device details and logcat through FileModule.clearFolder with a private
 * prefix (Discord only ever passes "cache" or "documents" as the folder). Only Java/Android APIs: the host's Kotlin
 * helpers are obfuscated.
 */
object Diagnostics {
    private const val PREFS = "venus-patches.json"
    private const val FOLDER = "venus-files"
    private const val PENDING = "crash-pending.txt"
    private const val LAST = "crash-last.txt"
    private const val SEEN = "crash-exit-seen.txt"
    private const val STRINGS = "venus-crash-strings.json"
    private const val JS_LOG = "venus-log.txt"
    private const val PREFIX = "venus-diag-v1:"
    private const val MAX_REPORT = 768 * 1024
    private const val MAX_SHOWN = 160 * 1024
    private const val MAX_SHARED = 180 * 1024
    private const val MAX_CLIP = 700 * 1024

    private const val BG = 0xFF1A1A1E.toInt()
    private const val CARD = 0xFF242429.toInt()
    private const val CARD_EDGE = 0x14FFFFFF
    private const val TEXT = 0xFFF2F3F5.toInt()
    private const val MUTED = 0xFF949BA4.toInt()
    private const val MONO = 0xFFDBDEE1.toInt()
    private const val RED = 0xFFF23F43.toInt()
    private const val BRAND = 0xFF5865F2.toInt()
    private const val NEUTRAL = 0xFF4E5058.toInt()

    @Volatile private var app: Context? = null
    @Volatile private var startedAt = 0L
    @Volatile private var screenOn = true
    @Volatile private var recording = false
    @Volatile private var showing = false
    @Volatile private var current: WeakReference<Activity>? = null
    private val main = Handler(Looper.getMainLooper())

    /** Right after Application.onCreate's super call. Any problem here leaves Discord exactly as it was. */
    @JvmStatic
    fun init(context: Context?) {
        try {
            val c = context?.applicationContext ?: context ?: return
            if (app != null) return
            app = c
            startedAt = System.currentTimeMillis()
            screenOn = crashScreenSetting(c)
            val previous = Thread.getDefaultUncaughtExceptionHandler()
            if (previous !is Catcher) Thread.setDefaultUncaughtExceptionHandler(Catcher(previous))
            if (c is Application) c.registerActivityLifecycleCallbacks(Lifecycle())
            // Android 11+ remembers why the last process ended: native crashes and ANRs never reach a Java handler.
            if (Build.VERSION.SDK_INT >= 30) Thread(object : Runnable { override fun run() { checkExitReasons(c) } }, "venus-exit-reasons").start()
        } catch (_: Throwable) { }
    }

    private class Catcher(private val next: Thread.UncaughtExceptionHandler?) : Thread.UncaughtExceptionHandler {
        override fun uncaughtException(thread: Thread, error: Throwable) {
            if (!recording) {
                recording = true
                try { save(javaReport(thread, error)) } catch (_: Throwable) { }
            }
            if (next != null) next.uncaughtException(thread, error)
            else { Process.killProcess(Process.myPid()); System.exit(10) }
        }
    }

    private class Lifecycle : Application.ActivityLifecycleCallbacks {
        override fun onActivityCreated(activity: Activity, state: Bundle?) { }
        override fun onActivityStarted(activity: Activity) { }
        override fun onActivityResumed(activity: Activity) {
            current = WeakReference(activity)
            // After Discord's first frames, so the page lands on top of its splash instead of under it.
            main.postDelayed(object : Runnable { override fun run() { showPending() } }, 700)
        }
        override fun onActivityPaused(activity: Activity) { }
        override fun onActivityStopped(activity: Activity) { }
        override fun onActivitySaveInstanceState(activity: Activity, state: Bundle) { }
        override fun onActivityDestroyed(activity: Activity) {
            if (current?.get() === activity) current = null
        }
    }

    // ---------------------------------------------------------------- reports

    private fun folder(c: Context): File {
        val dir = File(c.filesDir, FOLDER)
        if (!dir.isDirectory) dir.mkdirs()
        return dir
    }

    private fun save(report: String) {
        val c = app ?: return
        val text = cap(report, MAX_REPORT)
        write(File(folder(c), LAST), text)
        if (screenOn) write(File(folder(c), PENDING), text)
    }

    private fun javaReport(thread: Thread, error: Throwable): String {
        var root = error
        var depth = 0
        while (root.cause != null && root.cause !== root && depth < 20) { root = root.cause!!; depth++ }
        val where = if (root.stackTrace.size > 0) root.stackTrace[0].toString() else ""
        val out = java.lang.StringBuilder(64 * 1024)
        header(out, if (isJavaScript(error)) "JavaScript error" else "Java crash")
        section(out, "What went wrong")
        out.append(firstLine(root.toString())).append('\n')
        if (where.length > 0) out.append("  at ").append(where).append('\n')
        if (root !== error) out.append("Thrown as: ").append(firstLine(error.toString())).append('\n')
        out.append("Thread: ").append(thread.name).append(" (id ").append(thread.id).append(", priority ").append(thread.priority).append(")\n")
        section(out, "Stack trace")
        val trace = StringWriter()
        error.printStackTrace(PrintWriter(trace))
        out.append(trace.toString())
        details(out)
        threads(out, thread)
        val log = logcat(1500, true)
        section(out, "Logcat (this process, last 1500 lines)")
        out.append(if (log.length > 0) log else "(unavailable)\n")
        return out.toString()
    }

    private fun isJavaScript(error: Throwable): Boolean {
        var e: Throwable? = error
        var depth = 0
        while (e != null && depth < 20) {
            val name = e.javaClass.name as java.lang.String
            if (name.indexOf("JavascriptException") >= 0 || name.indexOf("JSException") >= 0) return true
            e = e.cause; depth++
        }
        return false
    }

    private fun header(out: java.lang.StringBuilder, kind: String) {
        val now = System.currentTimeMillis()
        out.append("Conduit crash report\n==================\n")
        line(out, "Kind", kind)
        line(out, "When", stamp(now) + " (" + zone() + ")")
        line(out, "Discord open for", duration(now - startedAt))
        val c = app
        if (c != null) {
            line(out, "Conduit Patches", venusRevision(c))
            line(out, "Discord", discordVersion(c))
        }
    }

    private fun section(out: java.lang.StringBuilder, title: String) {
        out.append("\n--- ").append(title).append(" ---\n")
    }

    private fun line(out: java.lang.StringBuilder, key: String, value: Any?) {
        out.append(key).append(": ").append(value?.toString() ?: "unknown").append('\n')
    }

    /** Everything about the phone, Discord and Conduit that can matter: shared by crash reports and Conduit's log export. */
    private fun details(out: java.lang.StringBuilder) {
        val c = app ?: return
        section(out, "Discord and Conduit")
        line(out, "Conduit Patches", venusRevision(c))
        line(out, "Discord", discordVersion(c))
        line(out, "Package", c.packageName)
        line(out, "Installed by", try { installer(c) } catch (_: Throwable) { null })
        line(out, "Process", processName())
        line(out, "Runs as", (if (Build.VERSION.SDK_INT >= 23 && !Process.is64Bit()) "32-bit" else "64-bit") + " (native libraries in " + c.applicationInfo.nativeLibraryDir + ")")
        line(out, "Crash screen", if (screenOn) "on" else "off")
        section(out, "Device")
        line(out, "Model", Build.MANUFACTURER + " " + Build.MODEL + " (" + Build.DEVICE + ", " + Build.PRODUCT + ")")
        line(out, "Brand", Build.BRAND)
        line(out, "Hardware", Build.HARDWARE + ", board " + Build.BOARD)
        if (Build.VERSION.SDK_INT >= 31) line(out, "Chip", Build.SOC_MANUFACTURER + " " + Build.SOC_MODEL)
        line(out, "Android", Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + "), security patch " + Build.VERSION.SECURITY_PATCH)
        line(out, "Build", Build.DISPLAY)
        line(out, "Fingerprint", Build.FINGERPRINT)
        line(out, "ABIs", TextUtils.join(", ", Build.SUPPORTED_ABIS))
        line(out, "Kernel", System.getProperty("os.version"))
        val props = props()
        if (props.length > 0) out.append(props)
        section(out, "Display")
        try {
            val m = c.resources.displayMetrics
            val conf = c.resources.configuration
            line(out, "Density", m.density.toString() + " (" + m.densityDpi + " dpi)" + (if (m.density != Math.round(m.density).toFloat()) ", not a whole number" else ""))
            // Android's Display size setting changes the density from the panel's own: a Poco F3 is 440 dpi, "larger" makes it 461.
            if (Build.VERSION.SDK_INT >= 24) {
                val stable = android.util.DisplayMetrics.DENSITY_DEVICE_STABLE
                line(out, "Display size", if (stable == m.densityDpi) "default (" + stable + " dpi)"
                    else "changed: " + m.densityDpi + " dpi instead of the phone's " + stable + " dpi (" + (if (m.densityDpi > stable) "larger" else "smaller") + ")")
            }
            line(out, "Font scale", conf.fontScale.toString() + " (scaled density " + m.scaledDensity + ")")
            if (Build.VERSION.SDK_INT >= 31) line(out, "Bold text adjustment", conf.fontWeightAdjustment)
            line(out, "Screen", m.widthPixels.toString() + " x " + m.heightPixels + " px, " + conf.screenWidthDp + " x " + conf.screenHeightDp + " dp, smallest " + conf.smallestScreenWidthDp + " dp")
            line(out, "Dark mode", if ((conf.uiMode and 0x30) == 0x20) "on" else "off")
            line(out, "Language", if (Build.VERSION.SDK_INT >= 24) conf.locales.toLanguageTags() else Locale.getDefault().toLanguageTag())
            line(out, "Layout direction", if (conf.layoutDirection == View.LAYOUT_DIRECTION_RTL) "right to left" else "left to right")
            val activity = current?.get()
            if (activity != null && Build.VERSION.SDK_INT >= 30) line(out, "Refresh rate", activity.display?.refreshRate)
        } catch (_: Throwable) { }
        section(out, "Memory and storage")
        try {
            val am = c.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
            val mi = ActivityManager.MemoryInfo()
            am.getMemoryInfo(mi)
            line(out, "Phone memory", mb(mi.availMem) + " free of " + mb(mi.totalMem) + (if (mi.lowMemory) ", LOW" else "") + ", low at " + mb(mi.threshold))
            line(out, "Low-RAM device", am.isLowRamDevice)
            line(out, "App memory class", am.memoryClass.toString() + " MB (large " + am.largeMemoryClass + " MB)")
            val r = Runtime.getRuntime()
            line(out, "Java heap", mb(r.totalMemory() - r.freeMemory()) + " used, " + mb(r.maxMemory()) + " max")
            line(out, "Native heap", mb(Debug.getNativeHeapAllocatedSize()) + " used of " + mb(Debug.getNativeHeapSize()))
            val pss = Debug.MemoryInfo()
            Debug.getMemoryInfo(pss)
            line(out, "Total PSS", mb(pss.totalPss * 1024L))
            val fs = StatFs(c.filesDir.path)
            line(out, "Storage", mb(fs.availableBytes) + " free of " + mb(fs.totalBytes))
        } catch (_: Throwable) { }
        section(out, "System settings")
        try {
            val power = c.getSystemService(Context.POWER_SERVICE) as android.os.PowerManager
            line(out, "Battery saver", power.isPowerSaveMode)
            line(out, "Ignores battery optimization", power.isIgnoringBatteryOptimizations(c.packageName))
            line(out, "Animation scale", android.provider.Settings.Global.getFloat(c.contentResolver, android.provider.Settings.Global.ANIMATOR_DURATION_SCALE, 1f))
            val net = c.getSystemService(Context.CONNECTIVITY_SERVICE) as android.net.ConnectivityManager
            line(out, "Data saver", when (net.restrictBackgroundStatus) { 3 -> "on"; 2 -> "on, Discord allowed"; else -> "off" })
            line(out, "Time zone", zone())
        } catch (_: Throwable) { }
        section(out, "Conduit settings")
        out.append(venusSettings(c))
        section(out, "Conduit debug log")
        out.append(logText(c))
    }

    private fun threads(out: java.lang.StringBuilder, crashed: Thread?) {
        section(out, "Threads")
        try {
            val all = Thread.getAllStackTraces()
            val mainThread = Looper.getMainLooper().thread
            val order = java.util.ArrayList<Thread>()
            if (all.containsKey(mainThread)) order.add(mainThread)
            if (crashed != null && crashed !== mainThread && all.containsKey(crashed)) order.add(crashed)
            for (t in all.keys) if (t !== mainThread && t !== crashed) order.add(t)
            var shown = 0
            for (t in order) {
                if (shown++ >= 80) { out.append("... ").append(order.size - 80).append(" more threads\n"); break }
                val frames = all.get(t) ?: continue
                out.append('"').append(t.name).append("\" ").append(t.state).append(if (t.isDaemon) " daemon" else "")
                    .append(if (t === crashed) "  <- crashed" else "").append('\n')
                var i = 0
                while (i < frames.size && i < 30) { out.append("    at ").append(frames[i]).append('\n'); i++ }
                if (frames.size > 30) out.append("    ... ").append(frames.size - 30).append(" more\n")
            }
        } catch (_: Throwable) { out.append("(unavailable)\n") }
    }

    /** Discord's own lines from Android's log. An app can only ever read the lines from its own user id. */
    private fun logcat(lines: Int, onlyThisProcess: Boolean): String {
        val args = java.util.ArrayList<String>()
        args.add("logcat"); args.add("-d"); args.add("-v"); args.add("threadtime"); args.add("-b"); args.add("main,system,crash")
        args.add("-t"); args.add(lines.toString())
        if (onlyThisProcess) { args.add("--pid"); args.add(Process.myPid().toString()) }
        return run(args.toArray(arrayOfNulls<String>(0)), 2 * 1024 * 1024)
    }

    /**
     * React Native logs the same SoftException with a 70-line stack trace thousands of times. Those copies filled the
     * report and pushed the minutes around a problem out of it ("82 KB left out"). A stack trace already shown once
     * becomes one line with its time, and a run of identical lines becomes one line with a count.
     */
    private fun squeeze(log: String): String {
        if (log.length == 0) return log
        val text = log as java.lang.String
        val lines = java.util.ArrayList<String>()
        var from = 0
        while (from < text.length) {
            var to = text.indexOf('\n'.code, from)
            if (to < 0) to = text.length
            lines.add(text.substring(from, to))
            from = to + 1
        }
        val out = java.lang.StringBuilder(log.length / 2)
        val seen = java.util.HashMap<String, String>()
        var lastMessage = ""
        var repeats = 0
        var i = 0
        while (i < lines.size) {
            val first = lines.get(i)
            var end = i + 1
            while (end < lines.size && isFrame(lines.get(end))) end++
            if (end - i > 2) {
                val sig = java.lang.StringBuilder()
                var k = i
                while (k < end) { sig.append(shape(message(lines.get(k)))).append('\n'); k++ }
                val key = sig.toString()
                val firstSeen = seen.get(key)
                if (firstSeen != null) {
                    if (repeats > 0) { out.append("    (the line above ").append(repeats).append(" more times)\n"); repeats = 0 }
                    out.append(prefix(first)).append(firstLine(message(first))).append("  (same ").append(end - i - 1)
                        .append("-line stack trace as at ").append(firstSeen).append(")\n")
                    lastMessage = ""
                    i = end
                    continue
                }
                seen.put(key, (prefix(first) as java.lang.String).trim())
            }
            var k = i
            while (k < end) {
                val line = lines.get(k)
                val msg = shape(message(line))
                if (msg.length > 0 && msg == lastMessage) repeats++
                else {
                    if (repeats > 0) { out.append("    (the line above ").append(repeats).append(" more times)\n"); repeats = 0 }
                    out.append(line).append('\n')
                    lastMessage = msg
                }
                k++
            }
            i = end
        }
        if (repeats > 0) out.append("    (the line above ").append(repeats).append(" more times)\n")
        return out.toString()
    }

    /** "11-01 05:05:48.221 25764 25764 E Tag: message" -> "message" (the whole line when it isn't in that form). */
    private fun message(line: String): String {
        val at = (line as java.lang.String).indexOf(": ", 31)
        return if (at < 0) line else line.substring(at + 2)
    }

    private fun prefix(line: String): String {
        val at = (line as java.lang.String).indexOf(": ", 31)
        return if (at < 0 || line.length < 18) "" else line.substring(6, 18) + " " + line.substring(31, at + 2)
    }

    private fun isFrame(line: String): Boolean {
        val m = message(line) as java.lang.String
        return m.startsWith("\tat ") || m.startsWith("\t... ") || m.startsWith("Caused by: ")
    }

    /** The same text with every number as #, so a trace for view tag 4268 and one for 9844 count as the same. */
    private fun shape(text: String): String {
        val out = java.lang.StringBuilder(text.length)
        var digits = false
        var i = 0
        while (i < text.length) {
            val ch = text[i]
            if (ch >= '0' && ch <= '9') { if (!digits) out.append('#'); digits = true } else { out.append(ch); digits = false }
            i++
        }
        return out.toString()
    }

    private fun run(command: Array<out String?>, limit: Int): String = try {
        val p = Runtime.getRuntime().exec(command)
        val text = readAll(p.inputStream, limit)
        try { p.destroy() } catch (_: Throwable) { }
        text
    } catch (_: Throwable) { "" }

    private val PROPS = arrayOf("ro.product.marketname", "ro.miui.ui.version.name", "ro.mi.os.version.name", "ro.mi.os.version.incremental",
        "ro.build.version.oneui", "ro.build.version.emui", "ro.build.version.opporom", "ro.vivo.os.version", "ro.board.platform",
        "ro.hardware.egl", "ro.hardware.vulkan", "debug.hwui.renderer", "ro.sf.lcd_density", "persist.sys.font", "ro.build.characteristics")

    /** ROM details Android's Build doesn't have (MIUI/HyperOS, One UI, the GPU driver), from getprop. */
    private fun props(): String {
        val all = run(arrayOf("getprop"), 512 * 1024) as java.lang.String
        val out = java.lang.StringBuilder()
        for (key in PROPS) {
            val at = all.indexOf("[" + key + "]: [")
            if (at < 0) continue
            val start = at + key.length + 5
            val end = all.indexOf("]", start)
            if (end > start) out.append(key).append(": ").append(all.substring(start, end)).append('\n')
        }
        return out.toString()
    }

    // ---------------------------------------------------------------- native crashes and ANRs (Android 11+)

    private fun checkExitReasons(c: Context) {
        if (Build.VERSION.SDK_INT < 30) return
        try {
            val am = c.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
            val list = am.getHistoricalProcessExitReasons(c.packageName, 0, 8)
            val seenFile = File(folder(c), SEEN)
            val firstRun = !seenFile.isFile
            var seen = 0L
            if (!firstRun) seen = try { java.lang.Long.parseLong(read(seenFile)) } catch (_: Throwable) { 0L }
            var newest = seen
            var reported = false
            for (info in list) {
                if (info.timestamp > newest) newest = info.timestamp
                if (firstRun || reported || info.timestamp <= seen || info.processName != c.packageName) continue
                val reason = info.reason
                if (reason != ApplicationExitInfo.REASON_CRASH_NATIVE && reason != ApplicationExitInfo.REASON_ANR) continue
                save(exitReport(info))
                reported = true
            }
            write(seenFile, java.lang.Long.toString(newest))
            if (reported) main.postDelayed(object : Runnable { override fun run() { showPending() } }, 400)
        } catch (_: Throwable) { }
    }

    private fun exitReport(info: ApplicationExitInfo): String {
        val anr = info.reason == ApplicationExitInfo.REASON_ANR
        val out = java.lang.StringBuilder(64 * 1024)
        header(out, if (anr) "Discord stopped responding (ANR)" else "Native crash")
        section(out, "What went wrong")
        val description = info.description
        out.append(if (description != null && description.length > 0) description else if (anr) "Application Not Responding" else "Native crash").append('\n')
        line(out, "Happened at", stamp(info.timestamp))
        line(out, "Process", info.processName + " (pid " + info.pid + ")")
        line(out, "Signal or status", info.status)
        line(out, "Memory then", "PSS " + mb(info.pss * 1024L) + ", RSS " + mb(info.rss * 1024L))
        line(out, "Importance", info.importance)
        if (anr) {
            section(out, "Thread dump from Android")
            val traces = try { val input = info.traceInputStream; if (input == null) "" else readAll(input, 400 * 1024) } catch (_: Throwable) { "" }
            out.append(if (traces.length > 0) traces else "(Android didn't keep one)\n")
        } else {
            out.append("Android keeps the native stack as a tombstone only system tools can read; the log below has what Discord's process wrote before it ended.\n")
        }
        details(out)
        section(out, "Logcat (Discord, every process, last 2000 lines)")
        val log = logcat(2000, false)
        out.append(if (log.length > 0) log else "(unavailable)\n")
        return out.toString()
    }

    // ---------------------------------------------------------------- small helpers (Java APIs only)

    private fun stamp(ms: Long): String = SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(Date(ms))

    private fun zone(): String = TimeZone.getDefault().id

    private fun duration(ms: Long): String {
        if (ms < 0 || startedAt == 0L) return "unknown"
        val seconds = ms / 1000
        val h = seconds / 3600
        val m = (seconds % 3600) / 60
        val s = seconds % 60
        return (if (h > 0) h.toString() + " h " else "") + (if (h > 0 || m > 0) m.toString() + " min " else "") + s + " s"
    }

    private fun mb(bytes: Long): String = (bytes / 1048576L).toString() + " MB"

    private fun firstLine(text: String): String {
        val at = (text as java.lang.String).indexOf('\n'.code)
        return if (at < 0) text else text.substring(0, at)
    }

    private fun readAll(input: InputStream, limit: Int): String {
        val buffer = ByteArrayOutputStream()
        val chunk = ByteArray(16 * 1024)
        try {
            while (true) {
                val n = input.read(chunk)
                if (n < 0) break
                if (buffer.size() < limit) buffer.write(chunk, 0, Math.min(n, limit - buffer.size()))
            }
        } finally { try { input.close() } catch (_: Throwable) { } }
        return String(buffer.toByteArray(), StandardCharsets.UTF_8)
    }

    private fun read(file: File): String = readAll(java.io.FileInputStream(file), MAX_REPORT)

    private fun write(file: File, text: String) {
        val out = FileOutputStream(file)
        try { out.write((text as java.lang.String).getBytes(StandardCharsets.UTF_8)) } finally { out.close() }
    }

    /** Keeps the start (what went wrong, the stack) and the end (the newest log lines) of a long text. */
    private fun cap(text: String, max: Int): String {
        if (text.length <= max) return text
        val head = max * 3 / 5
        val tail = max - head
        return text.substring(0, head) + "\n\n... " + ((text.length - max) / 1024) + " KB left out ...\n\n" + text.substring(text.length - tail)
    }

    private fun prefs(c: Context): String? = try {
        val file = File(c.filesDir, PREFS)
        if (file.isFile && file.length() < 4 * 1024 * 1024) read(file) else null
    } catch (_: Throwable) { null }

    private fun crashScreenSetting(c: Context): Boolean {
        val text = prefs(c) ?: return true
        return (text as java.lang.String).indexOf("\"crashScreen\":false") < 0
    }

    /** Which Conduit features are on and how they're set. Never sign-ins, tokens, accounts or anything else private. */
    private fun venusSettings(c: Context): String {
        val text = prefs(c) ?: return "(no settings file yet)\n"
        return try {
            val saved = JSONObject(text)
            val on = java.lang.StringBuilder()
            val options = java.lang.StringBuilder()
            val keys = saved.keys()
            while (keys.hasNext()) {
                val key = keys.next()
                val lower = (key as java.lang.String).toLowerCase(Locale.ROOT) as java.lang.String
                val value = saved.opt(key)
                // Account switcher's own switches are plain on/off settings, not accounts; the "account" filter hid them,
                // so the report never said whether Account switcher was on. Saved accounts are never in this file.
                val switcherSwitch = value is Boolean && lower.startsWith("accountswitcher")
                if (!switcherSwitch && (lower.indexOf("auth") >= 0 || lower.indexOf("token") >= 0 || lower.indexOf("account") >= 0 ||
                    lower.indexOf("ids") >= 0 || lower.indexOf("grant") >= 0 || lower.indexOf("seen") >= 0 || lower.indexOf("users") >= 0)) continue
                if (value is Boolean) { if (value) { if (on.length > 0) on.append(", "); on.append(key) } }
                else if (value is Number || (value is String && value.length <= 60)) {
                    if (options.length > 0) options.append(", ")
                    options.append(key).append('=').append(value.toString())
                }
            }
            "On: " + (if (on.length > 0) on.toString() else "nothing") + "\nOptions: " + options + "\n"
        } catch (error: Throwable) { "(couldn't read the settings file: " + error + ")\n" }
    }

    private fun logText(c: Context): String = try {
        val file = File(c.filesDir, JS_LOG)
        if (file.isFile && file.length() > 0) cap(read(file), 400 * 1024) + "\n" else "(Debug logging is off, or nothing was recorded yet)\n"
    } catch (_: Throwable) { "(unavailable)\n" }

    private fun venusRevision(c: Context): String = try {
        JSONObject(readAll(c.assets.open("venus/injection.json"), 4096)).optString("revision", "unknown")
    } catch (_: Throwable) { "unknown" }

    private fun discordVersion(c: Context): String = try {
        val info = c.packageManager.getPackageInfo(c.packageName, 0)
        info.versionName + " (" + (if (Build.VERSION.SDK_INT >= 28) info.longVersionCode else info.versionCode.toLong()) + ")"
    } catch (_: Throwable) { "unknown" }

    private fun installer(c: Context): String? =
        if (Build.VERSION.SDK_INT >= 30) c.packageManager.getInstallSourceInfo(c.packageName).installingPackageName
        else c.packageManager.getInstallerPackageName(c.packageName)

    private fun processName(): String = if (Build.VERSION.SDK_INT >= 28) Application.getProcessName() else Process.myPid().toString()

    /** The whole troubleshooting report Conduit settings exports: the phone, Discord, Conduit's log and Discord's logcat. */
    private fun troubleshootingReport(): String {
        val out = java.lang.StringBuilder(128 * 1024)
        header(out, "Troubleshooting report")
        details(out)
        threads(out, null)
        section(out, "Logcat (this process, last 5000 lines, repeated stack traces shortened)")
        val log = squeeze(logcat(5000, true))
        out.append(if (log.length > 0) log else "(unavailable)\n")
        return cap(out.toString(), MAX_REPORT)
    }

    // ---------------------------------------------------------------- the crash screen

    /** English labels; Conduit settings sends its own language's (venus-crash-strings.json), read when the page opens. */
    private fun labels(c: Context): JSONObject {
        val out = JSONObject()
        out.put("crashed", "Discord crashed")
        out.put("anr", "Discord stopped responding")
        out.put("intro", "Here's what happened. Copy or export it and include it when you report the problem.")
        out.put("what", "What went wrong")
        out.put("report", "Full report")
        out.put("copy", "Copy")
        out.put("share", "Share")
        out.put("export", "Export")
        out.put("close", "Close")
        out.put("copied", "Crash report copied")
        out.put("saved", "Saved to Downloads as {name}")
        out.put("failed", "Couldn't save the file. Try Share instead.")
        out.put("partial", "Showing part of a long report. Export saves all of it.")
        out.put("preview", "Preview")
        try {
            val file = File(folder(c), STRINGS)
            if (file.isFile && file.length() < 64 * 1024) {
                val saved = JSONObject(read(file))
                val keys = saved.keys()
                while (keys.hasNext()) { val key = keys.next(); val value = saved.optString(key, ""); if (value.length > 0 && out.has(key)) out.put(key, value) }
            }
        } catch (_: Throwable) { }
        return out
    }

    private fun showPending() {
        val c = app ?: return
        if (showing) return
        val activity = current?.get() ?: return
        if (activity.isFinishing || activity.isDestroyed) return
        val file = File(folder(c), PENDING)
        if (!file.isFile) return
        val text = try { read(file) } catch (_: Throwable) { null }
        try { file.delete() } catch (_: Throwable) { }
        if (text == null || text.length == 0 || !screenOn) return
        show(activity, text, false)
    }

    private fun field(report: String, key: String): String {
        val raw = report as java.lang.String
        val at = raw.indexOf("\n" + key + ": ")
        if (at < 0) return ""
        val start = at + key.length + 3
        val end = raw.indexOf("\n", start)
        return if (end < 0) report.substring(start) else report.substring(start, end)
    }

    /** The first lines under "What went wrong": the exception and where it was thrown. */
    private fun summary(report: String): String {
        val raw = report as java.lang.String
        val at = raw.indexOf("--- What went wrong ---\n")
        if (at < 0) return ""
        val start = at + 24
        var end = raw.indexOf("\nThread: ", start)
        val next = raw.indexOf("\n--- ", start)
        if (end < 0 || (next >= 0 && next < end)) end = next
        if (end < 0) end = Math.min(report.length, start + 600)
        val text = report.substring(start, end)
        return if (text.length > 600) text.substring(0, 600) + "…" else text
    }

    private fun show(activity: Activity, report: String, preview: Boolean) {
        try {
            showing = true
            val s = labels(activity)
            val density = activity.resources.displayMetrics.density
            fun dp(v: Int): Int = (v * density + 0.5f).toInt()
            fun round(color: Int, radius: Int, edge: Int): GradientDrawable {
                val d = GradientDrawable()
                d.setColor(color)
                d.cornerRadius = dp(radius).toFloat()
                if (edge != 0) d.setStroke(dp(1), edge)
                return d
            }
            fun label(text: String, size: Float, color: Int, bold: Boolean): TextView {
                val t = TextView(activity)
                t.text = text
                t.textSize = size
                t.setTextColor(color)
                t.typeface = if (bold) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create("sans-serif", Typeface.NORMAL)
                t.includeFontPadding = false
                t.setLineSpacing(dp(3).toFloat(), 1f)
                return t
            }
            val anr = (field(report, "Kind") as java.lang.String).indexOf("ANR") >= 0

            val dialog = Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar)
            val root = LinearLayout(activity)
            root.orientation = LinearLayout.VERTICAL
            root.setBackgroundColor(BG)

            // Header: a red badge, the title and when it happened, and Close.
            val header = LinearLayout(activity)
            header.orientation = LinearLayout.HORIZONTAL
            header.gravity = Gravity.CENTER_VERTICAL
            header.setPadding(dp(20), dp(20), dp(12), dp(8))
            val badge = TextView(activity)
            badge.text = "!"
            badge.gravity = Gravity.CENTER
            badge.textSize = 22f
            badge.setTextColor(Color.WHITE)
            badge.typeface = Typeface.DEFAULT_BOLD
            badge.background = round(RED, 24, 0)
            header.addView(badge, LinearLayout.LayoutParams(dp(48), dp(48)))
            val titles = LinearLayout(activity)
            titles.orientation = LinearLayout.VERTICAL
            val titleRow = LinearLayout(activity)
            titleRow.orientation = LinearLayout.HORIZONTAL
            titleRow.gravity = Gravity.CENTER_VERTICAL
            titleRow.addView(label(s.optString(if (anr) "anr" else "crashed"), 20f, TEXT, true))
            if (preview) {
                val tag = label(s.optString("preview"), 11f, Color.WHITE, true)
                tag.background = round(BRAND, 10, 0)
                tag.setPadding(dp(8), dp(3), dp(8), dp(3))
                val lp = LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
                lp.leftMargin = dp(8)
                titleRow.addView(tag, lp)
            }
            titles.addView(titleRow)
            val whenText = field(report, "When")
            val sub = label(whenText + (if (field(report, "Discord open for").length > 0) " · " + field(report, "Discord open for") else ""), 13f, MUTED, false)
            sub.setPadding(0, dp(4), 0, 0)
            titles.addView(sub)
            val titlesLp = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
            titlesLp.leftMargin = dp(14)
            header.addView(titles, titlesLp)
            val close = label("✕", 18f, MUTED, true)
            close.gravity = Gravity.CENTER
            close.contentDescription = s.optString("close")
            close.background = RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), null, round(Color.WHITE, 20, 0))
            close.setOnClickListener { dialog.dismiss() }
            header.addView(close, LinearLayout.LayoutParams(dp(40), dp(40)))
            root.addView(header)

            val scroll = ScrollView(activity)
            scroll.isFillViewport = true
            val body = LinearLayout(activity)
            body.orientation = LinearLayout.VERTICAL
            body.setPadding(dp(16), dp(8), dp(16), dp(16))
            val intro = label(s.optString("intro"), 14f, MUTED, false)
            intro.setPadding(dp(4), 0, dp(4), dp(16))
            body.addView(intro)

            // What went wrong: the exception and the line it came from, in a card with a red edge.
            val what = summary(report)
            if (what.length > 0) {
                val card = LinearLayout(activity)
                card.orientation = LinearLayout.VERTICAL
                card.background = round(CARD, 16, 0x40F23F43)
                card.setPadding(dp(16), dp(14), dp(16), dp(16))
                card.addView(label((s.optString("what") as java.lang.String).toUpperCase(Locale.getDefault()), 11f, RED, true))
                val mono = label(what, 13f, TEXT, false)
                mono.typeface = Typeface.MONOSPACE
                mono.setTextIsSelectable(true)
                mono.setPadding(0, dp(8), 0, 0)
                card.addView(mono)
                body.addView(card)
            }

            // Chips: the versions and the phone, so a screenshot alone already says the most important part.
            val chips = LinearLayout(activity)
            chips.orientation = LinearLayout.VERTICAL
            chips.setPadding(0, dp(12), 0, 0)
            for (pair in arrayOf(arrayOf("Conduit", field(report, "Conduit Patches")), arrayOf("Discord", field(report, "Discord")),
                    arrayOf(Build.MANUFACTURER, Build.MODEL + " · Android " + Build.VERSION.RELEASE))) {
                if (pair[1].length == 0) continue
                val chip = LinearLayout(activity)
                chip.orientation = LinearLayout.HORIZONTAL
                chip.background = round(CARD, 12, CARD_EDGE)
                chip.setPadding(dp(14), dp(10), dp(14), dp(10))
                chip.addView(label(pair[0], 13f, MUTED, true), LinearLayout.LayoutParams(dp(84), ViewGroup.LayoutParams.WRAP_CONTENT))
                val v = label(pair[1], 13f, TEXT, false)
                v.isSingleLine = true
                v.ellipsize = TextUtils.TruncateAt.END
                chip.addView(v, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
                val lp = LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
                lp.bottomMargin = dp(6)
                chips.addView(chip, lp)
            }
            body.addView(chips)

            // The full report, monospace and selectable. Very long reports show their start; Export keeps all of it.
            val reportTitle = label((s.optString("report") as java.lang.String).toUpperCase(Locale.getDefault()), 11f, MUTED, true)
            reportTitle.setPadding(dp(4), dp(14), 0, dp(8))
            body.addView(reportTitle)
            if (report.length > MAX_SHOWN) {
                val note = label(s.optString("partial"), 12f, MUTED, false)
                note.setPadding(dp(4), 0, dp(4), dp(8))
                body.addView(note)
            }
            val log = label(if (report.length > MAX_SHOWN) report.substring(0, MAX_SHOWN) + "\n…" else report, 11f, MONO, false)
            log.typeface = Typeface.MONOSPACE
            log.setLineSpacing(dp(2).toFloat(), 1f)
            log.setTextIsSelectable(true)
            log.background = round(0xFF111214.toInt(), 14, CARD_EDGE)
            log.setPadding(dp(14), dp(14), dp(14), dp(14))
            body.addView(log)
            scroll.addView(body)
            root.addView(scroll, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f))

            // Actions: Copy and Share beside each other, Export filled in the brand color.
            val bar = LinearLayout(activity)
            bar.orientation = LinearLayout.HORIZONTAL
            bar.setPadding(dp(16), dp(12), dp(16), dp(16))
            bar.setBackgroundColor(BG)
            fun button(text: String, fill: Int, action: Runnable): TextView {
                val b = label(text, 15f, Color.WHITE, true)
                b.gravity = Gravity.CENTER
                b.background = RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), round(fill, 24, 0), null)
                b.setOnClickListener { try { action.run() } catch (_: Throwable) { } }
                val lp = LinearLayout.LayoutParams(0, dp(48), 1f)
                lp.leftMargin = dp(4); lp.rightMargin = dp(4)
                bar.addView(b, lp)
                return b
            }
            button(s.optString("copy"), NEUTRAL, Runnable {
                val clip = activity.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
                clip.setPrimaryClip(ClipData.newPlainText("Conduit crash report", cap(report, MAX_CLIP)))
                if (Build.VERSION.SDK_INT < 33) Toast.makeText(activity, s.optString("copied"), Toast.LENGTH_SHORT).show()
            })
            button(s.optString("share"), NEUTRAL, Runnable { share(activity, report) })
            button(s.optString("export"), BRAND, Runnable {
                val name = export(activity, report)
                Toast.makeText(activity, if (name != null) (s.optString("saved") as java.lang.String).replace("{name}", name) else s.optString("failed"), Toast.LENGTH_LONG).show()
                if (name == null) share(activity, report)
            })
            root.addView(bar)

            root.setOnApplyWindowInsetsListener { view, insets ->
                if (Build.VERSION.SDK_INT >= 30) {
                    val bars = insets.getInsets(WindowInsets.Type.systemBars() or WindowInsets.Type.displayCutout())
                    view.setPadding(bars.left, bars.top, bars.right, bars.bottom)
                } else view.setPadding(insets.systemWindowInsetLeft, insets.systemWindowInsetTop, insets.systemWindowInsetRight, insets.systemWindowInsetBottom)
                insets
            }
            dialog.setContentView(root)
            dialog.setOnDismissListener { showing = false }
            val window = dialog.window
            if (window != null) {
                window.setBackgroundDrawable(ColorDrawable(BG))
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
                window.statusBarColor = BG
                window.navigationBarColor = BG
            }
            dialog.show()
        } catch (_: Throwable) { showing = false }
    }

    private fun share(activity: Activity, report: String) {
        val send = Intent(Intent.ACTION_SEND)
        send.type = "text/plain"
        send.putExtra(Intent.EXTRA_SUBJECT, "Conduit crash report")
        send.putExtra(Intent.EXTRA_TEXT, cap(report, MAX_SHARED))
        activity.startActivity(Intent.createChooser(send, null))
    }

    /** Saves the whole report as a text file in Downloads (Android 10+), and returns its name, or null when it can't. */
    private fun export(c: Context, report: String): String? {
        if (Build.VERSION.SDK_INT < 29) return null
        return try {
            val name = "venus-crash-" + SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(Date()) + ".txt"
            val values = ContentValues()
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name)
            values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain")
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
            val uri = c.contentResolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values) ?: return null
            val out = c.contentResolver.openOutputStream(uri) ?: return null
            try { out.write((report as java.lang.String).getBytes(StandardCharsets.UTF_8)) } finally { out.close() }
            name
        } catch (_: Throwable) { null }
    }

    // ---------------------------------------------------------------- bridge for Conduit settings

    /**
     * FileModule.clearFolder(storageDir, path, promise) with storageDir = "venus-diag-v1:<action>". Discord only ever
     * passes "cache" or "documents", so its own calls fall through. Slow work (logcat, getprop) runs off the JS thread.
     */
    @JvmStatic
    fun dispatch(request: String, argument: String?, promise: Promise): Boolean {
        if (!(request as java.lang.String).startsWith(PREFIX)) return false
        val action = request.substring(PREFIX.length)
        val c = app
        if (c == null) { promise.reject("VENUS_DIAG", "Not ready"); return true }
        when (action) {
            "report" -> Thread(object : Runnable { override fun run() {
                try { promise.resolve(troubleshootingReport()) } catch (error: Throwable) { promise.reject("VENUS_DIAG", error.toString()) }
            } }, "venus-report").start()
            "last" -> {
                val file = File(folder(c), LAST)
                promise.resolve(try { if (file.isFile) read(file) else "" } catch (_: Throwable) { "" })
            }
            "views" -> main.post(object : Runnable { override fun run() {
                try { promise.resolve(views(argument ?: "")) } catch (error: Throwable) { promise.reject("VENUS_DIAG", error.toString()) }
            } })
            "forget" -> { try { File(folder(c), LAST).delete() } catch (_: Throwable) { }; promise.resolve("ok") }
            "screen:on", "screen:off" -> { screenOn = action == "screen:on"; promise.resolve("ok") }
            "strings" -> {
                try { if (argument != null && argument.length < 64 * 1024) write(File(folder(c), STRINGS), JSONObject(argument).toString()) } catch (_: Throwable) { }
                promise.resolve("ok")
            }
            "show" -> {
                val file = File(folder(c), LAST)
                val sample = try { if (file.isFile) read(file) else "" } catch (_: Throwable) { "" }
                main.post(object : Runnable { override fun run() {
                    val activity = current?.get()
                    if (activity == null || showing) { promise.reject("VENUS_DIAG", "No screen to show it on"); return }
                    show(activity, if (sample.length > 0) sample else sampleReport(), sample.length == 0)
                    promise.resolve("ok")
                } })
            }
            else -> promise.reject("VENUS_DIAG", "Unknown request")
        }
        return true
    }

    // ---------------------------------------------------------------- native views

    /**
     * The Android views behind something Conduit drew, found by its accessibility label (Read all's pill sets one), for
     * the debug log. React can reserve room for a view that never reaches the screen (Fabric's "Unable to find viewState
     * for tag"); this says whether it exists natively, whether it's visible, its real colors and every parent that could
     * hide or clip it.
     */
    private fun views(label: String): String {
        if (label.length == 0) return "no label given"
        val activity = current?.get() ?: return "no screen open"
        val root = activity.window?.decorView ?: return "no window"
        val found = java.util.ArrayList<View>()
        val texts = java.util.ArrayList<View>()
        find(root, label, found, texts, 0)
        val out = java.lang.StringBuilder()
        out.append(found.size).append(" native view(s) labelled \"").append(label).append("\", ").append(texts.size).append(" text view(s) showing it")
        var n = 0
        for (v in found) { if (n++ >= 3) break; out.append("\n  labelled: "); describe(out, v); ancestors(out, v) }
        n = 0
        for (v in texts) { if (n++ >= 3) break; out.append("\n  text: "); describe(out, v) }
        return out.toString()
    }

    private fun find(v: View, label: String, found: java.util.ArrayList<View>, texts: java.util.ArrayList<View>, depth: Int) {
        if (depth > 120 || found.size > 8) return
        val d = v.contentDescription
        if (d != null && (d.toString() as java.lang.String).indexOf(label) >= 0) found.add(v)
        if (v is TextView) { val t = v.text; if (t != null && (t.toString() as java.lang.String).equals(label)) texts.add(v) }
        if (v is ViewGroup) { var i = 0; while (i < v.childCount) { val child = v.getChildAt(i); if (child != null) find(child, label, found, texts, depth + 1); i++ } }
    }

    private fun describe(out: java.lang.StringBuilder, v: View) {
        val at = IntArray(2)
        try { v.getLocationOnScreen(at) } catch (_: Throwable) { }
        val rect = android.graphics.Rect()
        val visible = try { v.getGlobalVisibleRect(rect) } catch (_: Throwable) { false }
        out.append(v.javaClass.name).append(" ").append(visibility(v.visibility)).append(" alpha ").append(v.alpha)
            .append(if (v.isShown) " shown" else " NOT shown").append(if (v.isAttachedToWindow) "" else " DETACHED")
            .append(", ").append(v.width).append("x").append(v.height).append(" px at ").append(at[0]).append(",").append(at[1])
            .append(", on screen ").append(if (visible) rect.toShortString() else "NOWHERE")
        if (v.translationX != 0f || v.translationY != 0f) out.append(", moved ").append(v.translationX).append(",").append(v.translationY)
        if (v.scaleX != 1f || v.scaleY != 1f) out.append(", scale ").append(v.scaleX).append("x").append(v.scaleY)
        if (Build.VERSION.SDK_INT >= 18 && v.clipBounds != null) out.append(", clipped to ").append(v.clipBounds.toShortString())
        if (v.willNotDraw()) out.append(", draws nothing itself")
        val bg = v.background
        out.append(", background ").append(if (bg == null) "none" else if (bg is ColorDrawable) "#" + Integer.toHexString(bg.color) else bg.javaClass.simpleName + " alpha " + bg.alpha)
        if (v is TextView) out.append(", text color #").append(Integer.toHexString(v.currentTextColor)).append(", ").append(v.textSize).append(" px, ")
            .append(v.layout?.lineCount ?: -1).append(" line(s)")
        if (v is ViewGroup) out.append(", ").append(v.childCount).append(" children")
    }

    private fun ancestors(out: java.lang.StringBuilder, v: View) {
        var p = v.parent
        var depth = 0
        while (p is View && depth < 14) {
            val g = p as View
            out.append("\n    in ").append(g.javaClass.simpleName).append(" ").append(visibility(g.visibility)).append(" alpha ").append(g.alpha)
                .append(", ").append(g.width).append("x").append(g.height).append(" px")
            if (g.translationX != 0f || g.translationY != 0f) out.append(", moved ").append(g.translationX).append(",").append(g.translationY)
            if (g.scrollX != 0 || g.scrollY != 0) out.append(", scrolled ").append(g.scrollX).append(",").append(g.scrollY)
            if (g is ViewGroup && g.clipChildren) out.append(", clips children")
            if (Build.VERSION.SDK_INT >= 18 && g.clipBounds != null) out.append(", clipped to ").append(g.clipBounds.toShortString())
            p = g.parent
            depth++
        }
    }

    private fun visibility(value: Int): String = if (value == View.VISIBLE) "visible" else if (value == View.INVISIBLE) "INVISIBLE" else "GONE"

    /** What the crash screen looks like, for "Preview" when nothing has crashed yet. Nothing is thrown. */
    private fun sampleReport(): String {
        val out = java.lang.StringBuilder(16 * 1024)
        header(out, "Preview")
        section(out, "What went wrong")
        out.append("java.lang.IllegalStateException: This is a preview. Nothing crashed.\n  at app.venus.diag.Diagnostics.preview(Diagnostics.kt)\n")
        details(out)
        return out.toString()
    }
}
