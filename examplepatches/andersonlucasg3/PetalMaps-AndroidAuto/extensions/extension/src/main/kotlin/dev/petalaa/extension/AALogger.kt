package dev.petalaa.extension

import android.content.Context
import android.util.Log
import java.io.BufferedWriter
import java.io.File
import java.io.FileWriter
import java.io.PrintWriter
import java.io.StringWriter
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.concurrent.locks.ReentrantLock

/**
 * Dual logger for the PetalAA extension: writes to both logcat (tag PetalAA)
 * and a file in the app's external files dir. All operations are best-effort
 * and never crash the host process.
 *
 * File location: `<context.getExternalFilesDir(null)>/petal_aa.log`
 * Shareable copy: `/sdcard/petal_aa.log` (via root)
 *
 * Thread-safe. Idempotent init.
 */
object AALogger {

    private const val TAG = "PetalAA"
    private const val LOG_FILE_NAME = "petal_aa.log"
    private const val SHAREABLE_PATH = "/sdcard/petal_aa.log"
    private const val MAX_SIZE_BYTES = 2 * 1024 * 1024 // 2 MB
    private const val KEEP_SIZE_BYTES = 1024 * 1024   // keep last ~1 MB on rotation

    private val lock = ReentrantLock()
    private var logFile: File? = null
    private var initialized = false
    private var defaultUncaughtHandler: Thread.UncaughtExceptionHandler? = null

    private val timestampFormat = SimpleDateFormat("MM-dd HH:mm:ss.SSS", Locale.US)

    /**
     * Initialize the file logger. Idempotent — calling multiple times is safe
     * and does not reset or truncate the log file.
     */
    fun init(context: Context) {
        lock.lock()
        try {
            if (initialized) return
            val dir = context.getExternalFilesDir(null)
                ?: run {
                    Log.w(TAG, "AALogger: getExternalFilesDir returned null")
                    initialized = true
                    return
                }
            logFile = File(dir, LOG_FILE_NAME)
            // Truncate if file exceeds MAX_SIZE_BYTES
            rotateIfNeeded(logFile)
            initialized = true
            Log.i(TAG, "AALogger initialized: ${logFile?.absolutePath}")
        } catch (t: Throwable) {
            // Never crash the host
            Log.e(TAG, "AALogger init failed", t)
        } finally {
            lock.unlock()
        }
    }

    /**
     * Install an uncaught exception handler that logs FATAL crashes to the
     * file before delegating to the default handler. Does not swallow crashes.
     */
    fun installCrashHandler() {
        lock.lock()
        try {
            if (defaultUncaughtHandler != null) return // already installed
            defaultUncaughtHandler = Thread.getDefaultUncaughtExceptionHandler()
            Thread.setDefaultUncaughtExceptionHandler { thread, throwable ->
                logFatalCrash(thread, throwable)
                // Delegate to the original handler — do not swallow the crash
                defaultUncaughtHandler?.uncaughtException(thread, throwable)
            }
            Log.i(TAG, "AALogger crash handler installed")
        } catch (t: Throwable) {
            Log.e(TAG, "AALogger: failed to install crash handler", t)
        } finally {
            lock.unlock()
        }
    }

    // ---- Public logging API (mirrors android.util.Log levels) ------------

    fun d(msg: String) {
        log(TAG, android.util.Log.DEBUG, msg, null)
    }

    fun i(msg: String) {
        log(TAG, android.util.Log.INFO, msg, null)
    }

    fun w(msg: String) {
        log(TAG, android.util.Log.WARN, msg, null)
    }

    fun e(msg: String, tr: Throwable? = null) {
        log(TAG, android.util.Log.ERROR, msg, tr)
    }

    // ---- Core logging -----------------------------------------------------

    private fun log(tag: String, priority: Int, msg: String, tr: Throwable?) {
        // Always write to logcat
        if (tr != null) {
            Log.println(priority, tag, msg)
            Log.println(priority, tag, tr.stackTraceToString())
        } else {
            Log.println(priority, tag, msg)
        }
        // Best-effort file append
        appendToFile(priority, msg, tr)
    }

    private fun appendToFile(priority: Int, msg: String, tr: Throwable?) {
        val file = lockAndReadLogfile() ?: return
        try {
            val bw = BufferedWriter(FileWriter(file, true))
            try {
                val ts = timestampFormat.format(Date())
                val level = when (priority) {
                    android.util.Log.VERBOSE -> "V"
                    android.util.Log.DEBUG -> "D"
                    android.util.Log.INFO -> "I"
                    android.util.Log.WARN -> "W"
                    android.util.Log.ERROR -> "E"
                    android.util.Log.ASSERT -> "F"
                    else -> "?"
                }
                bw.write("$ts [$level] $msg")
                bw.newLine()
                if (tr != null) {
                    val sw = StringWriter()
                    tr.printStackTrace(PrintWriter(sw))
                    bw.write(sw.toString())
                }
            } finally {
                bw.flush()
                bw.close()
            }
        } catch (_: Throwable) {
            // Silent fail — never crash the host
        } finally {
            lock.unlock()
        }
    }

    // ---- Crash logging ----------------------------------------------------

    private fun logFatalCrash(thread: Thread, throwable: Throwable) {
        val file = logFile ?: return
        try {
            val bw = BufferedWriter(FileWriter(file, true))
            try {
                val ts = timestampFormat.format(Date())
                bw.write("=== FATAL CRASH $ts (thread=${thread.name}) ===")
                bw.newLine()
                val sw = StringWriter()
                throwable.printStackTrace(PrintWriter(sw))
                bw.write(sw.toString())
                bw.write("=== END FATAL CRASH ===")
                bw.newLine()
            } finally {
                bw.flush()
                bw.close()
            }
        } catch (_: Throwable) {
            // Best effort only
        }
    }

    // ---- Shareable copy ---------------------------------------------------

    /**
     * Copies the log file to /sdcard/petal_aa.log via root, so the user can
     * access it from any file manager without needing adb.
     */
    fun shareableCopy() {
        val src = logFile ?: return
        if (!src.exists()) return
        try {
            val cmd = "cp '${src.absolutePath}' '$SHAREABLE_PATH' && chmod 644 '$SHAREABLE_PATH'"
            val (exit, _, err) = runSuQuiet(cmd)
            if (exit == 0) {
                Log.i(TAG, "AALogger: shareable copy at $SHAREABLE_PATH")
            } else {
                Log.w(TAG, "AALogger: shareable copy failed (exit=$exit): $err")
            }
        } catch (t: Throwable) {
            Log.w(TAG, "AALogger: shareable copy threw", t)
        }
    }

    /** Minimal su runner for shareableCopy — mirrors AASelfTweaker.detectSuArgs logic. */
    private fun runSuQuiet(command: String): Triple<Int, String, String> {
        return try {
            val candidates = listOf(
                listOf("su", "--mount-master", "-c"),
                listOf("su", "-M", "-c"),
                listOf("su", "-c")
            )
            for (args in candidates) {
                val process = ProcessBuilder(*args.toTypedArray(), command).start()
                val stdout = process.inputStream.bufferedReader().readText()
                val stderr = process.errorStream.bufferedReader().readText()
                // Manual timeout loop (waitFor(long, TimeUnit) requires API 26)
                val deadline = System.currentTimeMillis() + 10_000L
                var exit: Int? = null
                while (System.currentTimeMillis() < deadline) {
                    try {
                        exit = process.exitValue()
                        break
                    } catch (_: IllegalThreadStateException) {
                        Thread.sleep(50)
                    }
                }
                val finalExit = exit ?: -1
                if (finalExit != -1) return Triple(finalExit, stdout, stderr)
            }
            Triple(-1, "", "no working su")
        } catch (t: Throwable) {
            Triple(-1, "", t.message ?: "")
        }
    }

    // ---- Rotation helpers -------------------------------------------------

    private fun rotateIfNeeded(file: File?) {
        val f = file ?: return
        if (!f.exists()) return
        val size = try { f.length() } catch (_: Throwable) { return }
        if (size <= MAX_SIZE_BYTES) return
        // Keep the last ~1 MB, discard the rest
        try {
            val content = f.readText()
            val keep = if (content.length > KEEP_SIZE_BYTES) {
                content.substring(content.length - KEEP_SIZE_BYTES)
            } else {
                content
            }
            f.writeText(keep)
            Log.i(TAG, "AALogger: rotated log (was ${size}B, kept ~${keep.length}B)")
        } catch (_: Throwable) {
            // Silent fail
        }
    }

    // ---- Synchronized accessor --------------------------------------------

    @Synchronized
    private fun lockAndReadLogfile(): File? {
        lock.lock()
        return logFile
    }
}