package app.template.extension.diag

import android.app.Activity
import android.app.Application
import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import android.os.Process
import android.util.Log
import java.io.File
import java.io.FileInputStream
import java.io.FileWriter
import java.io.InputStreamReader
import java.security.MessageDigest
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

/**
 * Startup diagnostics + crash self-reporting for the Vogelkop patched builds.
 *
 * WHY THIS EXISTS: v1.2.0-v1.2.3 patched builds crashed instantly on open for
 * one user, and without a device-side stack trace every fix attempt was a
 * guess (three signature-spoof rewrites did not cure it). The usual channel
 * for a device-side stack trace is `adb logcat`, but requesting that from a
 * non-technical user failed repeatedly. This class removes that dependency:
 *
 *  - A startup breadcrumb trail is appended to
 *    `<app external files dir>/vogelkop-diag.log`
 *    (Android/data/<package>/files/, readable with any file manager, no
 *    permission needed) at the injection points the *Startup diagnostics*
 *    patch writes into every Application subclass: attachBaseContext entry,
 *    onCreate entry, onCreate exit.
 *  - An uncaught-exception handler is installed as early as possible
 *    (attachBaseContext runs before ContentProviders and before
 *    Application.onCreate, so provider and early-init crashes are captured
 *    too) and writes the FULL stack trace of any startup crash to the same
 *    file. The handler chains to the previous default handler (Opera's
 *    breakpad wiring) so Opera's own crash flow is preserved, and it
 *    re-asserts itself at several injection points, because Opera replaces
 *    the default handler during onCreate.
 *  - It also records WHICH signing certificate the patched app currently
 *    sees for itself: Opera's vendor certificate proves the spoof layers
 *    engage at runtime; the Morphe key means they did not.
 *
 * The class must survive ANY failure: every entry point is wrapped in
 * try/Throwable, and a diagnostic layer that crashes the app is worse than no
 * diagnostic layer. It must also compile without kotlin-stdlib references
 * (same discipline as SignatureHookApp: no lambdas, no Kotlin collections,
 * explicit .equals(), no reference ==, no smart-cast helpers).
 *
 * Merged through its own extension dex (extensions/diag.mpe) by the
 * *Startup diagnostics* patch, independently of *Spoof app signature* - so a
 * no-spoof build still self-reports.
 */
class StartupDiag private constructor() {

    companion object {

        private const val TAG = "VogelkopDiag"
        private const val FILE_NAME = "vogelkop-diag.log"
        private const val MAX_BYTES: Long = 262144

        private val lock = Any()
        private var logFile: File? = null
        private var formatter: SimpleDateFormat? = null
        private var catcher: CrashCatcher? = null

        // ------------------------------------------------------------------
        // Injection points (called from bytecode the patch inserts).
        // ------------------------------------------------------------------

        /** Injected at the very start of every Application.attachBaseContext. */
        @JvmStatic
        fun init(base: Context?) {
            try {
                val file = resolveLogFile(base)
                synchronized(lock) {
                    logFile = file
                    if (formatter == null) {
                        formatter = SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US)
                    }
                }
                if (file == null) {
                    Log.w(TAG, "no writable dir for diag log; breadcrumbs disabled")
                }
                breadcrumb("attach-base-context entered")
                installCatcher()
                logEnvironment(base)
            } catch (t: Throwable) {
                Log.w(TAG, "init failed", t)
            }
        }

        /** Injected at the very start of every Application.onCreate. */
        @JvmStatic
        fun onCreateStart(app: Application?) {
            try {
                installCatcher()
                breadcrumb("app-onCreate entered")
                logSpoofState()
            } catch (t: Throwable) {
                Log.w(TAG, "onCreateStart failed", t)
            }
        }

        /** Injected before every return in every Application.onCreate. */
        @JvmStatic
        fun onCreateEnd() {
            try {
                installCatcher()
                breadcrumb("app-onCreate completed")
            } catch (t: Throwable) {
                Log.w(TAG, "onCreateEnd failed", t)
            }
        }

        /** Injected at the start of the launcher Activity.onCreate (optional). */
        @JvmStatic
        fun activityStart(activity: Activity?) {
            try {
                val name = if (activity == null) "?" else activity.javaClass.getName()
                breadcrumb("activity-onCreate " + name)
            } catch (t: Throwable) {
                Log.w(TAG, "activityStart failed", t)
            }
        }

        // ------------------------------------------------------------------
        // Crash capture.
        // ------------------------------------------------------------------

        private class CrashCatcher(
            private val previous: Thread.UncaughtExceptionHandler?,
        ) : Thread.UncaughtExceptionHandler {

            override fun uncaughtException(thread: Thread, throwable: Throwable) {
                try {
                    val sb = StringBuilder()
                    sb.append("\n===== CRASH =====\n")
                    sb.append("time: ").append(now()).append('\n')
                    sb.append("process: ").append(processName()).append('\n')
                    sb.append("thread: ").append(thread.getName()).append('\n')
                    sb.append(Log.getStackTraceString(throwable))
                    sb.append("=================\n")
                    appendToFile(sb.toString())
                } catch (t: Throwable) {
                    // never let the reporter itself break anything
                }
                try {
                    previous?.uncaughtException(thread, throwable)
                } catch (t: Throwable) {
                    // last resort: make sure the process still dies
                    Log.e(TAG, "previous crash handler threw", t)
                    Runtime.getRuntime().halt(10)
                }
            }
        }

        /**
         * Chains onto whatever handler is currently installed (Opera swaps in
         * its breakpad handler inside onCreate, so this is re-run at several
         * injection points to stay at the head of the chain).
         */
        private fun installCatcher() {
            synchronized(lock) {
                val current = catcher
                if (current != null && Thread.getDefaultUncaughtExceptionHandler().equals(current)) {
                    return
                }
                val previous = Thread.getDefaultUncaughtExceptionHandler()
                val fresh = CrashCatcher(previous)
                Thread.setDefaultUncaughtExceptionHandler(fresh)
                catcher = fresh
            }
        }

        // ------------------------------------------------------------------
        // Environment + breadcrumb writers.
        // ------------------------------------------------------------------

        private fun logEnvironment(base: Context?) {
            if (base == null) {
                return
            }
            val sb = StringBuilder()
            sb.append("\n===== STARTUP =====\n")
            sb.append("time: ").append(now()).append('\n')
            sb.append("process: ").append(processName()).append('\n')
            sb.append("device: ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL)
                .append(" (android ").append(Build.VERSION.RELEASE)
                .append(", sdk ").append(Build.VERSION.SDK_INT).append(")\n")
            try {
                val pm = base.getPackageManager()
                val info: PackageInfo = pm.getPackageInfo(base.getPackageName(), 0)
                sb.append("app: ").append(info.packageName).append(' ')
                    .append(info.versionName).append(" (").append(info.getLongVersionCode()).append(")\n")
            } catch (t: Throwable) {
                sb.append("app: <unavailable>\n")
            }
            logSelfSignature(base, sb)
            appendToFile(sb.toString())
        }

        /**
         * Records the signing certificate the patched APK actually carries.
         * NOTE: this class is an extension class, and the spoof's redirect
         * engine never rewrites extension call sites - so this read is the
         * UNREDIRECTED ground truth (the Morphe key). What the app's own
         * code sees after the spoof is logged separately via the
         * spoof-presents hash and the install state.
         */
        private fun logSelfSignature(base: Context, sb: StringBuilder) {
            try {
                var hex: String? = null
                if (Build.VERSION.SDK_INT >= 28) {
                    val signing = base.getPackageManager()
                        .getPackageInfo(base.getPackageName(), PackageManager.GET_SIGNING_CERTIFICATES)
                        .signingInfo
                    if (signing != null) {
                        val signers = signing.getApkContentsSigners()
                        if (signers != null && signers.size > 0) {
                            hex = sha256hex(signers[0].toByteArray())
                        }
                    }
                }
                if (hex == null) {
                    @Suppress("DEPRECATION")
                    val legacy = base.getPackageManager()
                        .getPackageInfo(base.getPackageName(), PackageManager.GET_SIGNATURES)
                    val legacySignatures = legacy.signatures
                    if (legacySignatures != null && legacySignatures.size > 0) {
                        hex = sha256hex(legacySignatures[0].toByteArray())
                    }
                }
                sb.append("apk-signature-sha256 (unredirected ground truth): ")
                if (hex == null) {
                    sb.append("<unavailable>")
                } else {
                    sb.append(hex)
                }
                sb.append('\n')
            } catch (t: Throwable) {
                sb.append("apk-signature-sha256: <error ").append(t.javaClass.getName()).append(">\n")
            }
        }

        /**
         * Reports the signature-spoof install state through reflection, so
         * this class works with and without the spoof extension merged.
         */
        private fun logSpoofState() {
            try {
                val hookClass = Class.forName("app.template.extension.extension.SignatureHookApp")
                val field = hookClass.getField("installState")
                val state = field.get(null)
                breadcrumb("signature-spoof state: " + (if (state == null) "<null>" else state.toString()))
                try {
                    val certField = hookClass.getDeclaredField("ownSignatureBase64")
                    certField.setAccessible(true)
                    val base64 = certField.get(null) as? String
                    if (base64 != null && !base64.isEmpty()) {
                        val certSha = sha256hex(android.util.Base64.decode(base64, android.util.Base64.DEFAULT))
                        breadcrumb(
                            "spoof-presents-certificate-sha256: " + certSha +
                                " (vendor cert is 5d6afbf87f652af04647ada0df634cf22370900b164b09d50bd23aa2cb5285b8)",
                        )
                    } else {
                        breadcrumb("spoof-presents-certificate-sha256: <empty>")
                    }
                } catch (t: Throwable) {
                    breadcrumb("spoof-presents-certificate-sha256: unreadable")
                }
            } catch (t: ClassNotFoundException) {
                breadcrumb("signature-spoof state: absent (patch disabled)")
            } catch (t: Throwable) {
                breadcrumb("signature-spoof state: unreadable (" + t.javaClass.getName() + ')')
            }
        }

        private fun breadcrumb(message: String) {
            appendToFile("[" + now() + "] [" + processName() + "] " + message + '\n')
        }

        // ------------------------------------------------------------------
        // File plumbing.
        // ------------------------------------------------------------------

        private fun resolveLogFile(base: Context?): File? {
            if (base == null) {
                return null
            }
            val external = try {
                base.getExternalFilesDir(null)
            } catch (t: Throwable) {
                null
            }
            if (external != null) {
                return File(external, FILE_NAME)
            }
            val internal = try {
                base.getFilesDir()
            } catch (t: Throwable) {
                null
            }
            return if (internal != null) File(internal, FILE_NAME) else null
        }

        private fun appendToFile(text: String) {
            val file = synchronized(lock) { logFile } ?: return
            try {
                synchronized(lock) {
                    if (file.exists() && file.length() > MAX_BYTES) {
                        // keep the file from growing forever; drop the oldest half
                        val keep = readTail(file, MAX_BYTES / 2)
                        val tmp = File(file.getParentFile(), FILE_NAME + ".tmp")
                        FileWriter(tmp, false).use { it.write(keep) }
                        tmp.renameTo(file)
                    }
                    FileWriter(file, true).use { it.write(text) }
                }
            } catch (t: Throwable) {
                Log.w(TAG, "diag append failed", t)
            }
        }

        private fun readTail(file: File, maxBytes: Long): String {
            val out = StringBuilder()
            try {
                val len = file.length()
                val from = if (len > maxBytes) len - maxBytes else 0L
                val input = FileInputStream(file)
                val skipped = input.skip(from)
                val reader = InputStreamReader(input)
                val buf = CharArray(8192)
                while (true) {
                    val n = reader.read(buf)
                    if (n <= 0) {
                        break
                    }
                    out.append(buf, 0, n)
                }
                if (skipped > 0) {
                    out.insert(0, "<… older entries truncated …>\n")
                }
            } catch (t: Throwable) {
                return "<… unreadable …>\n"
            }
            return out.toString()
        }

        // ------------------------------------------------------------------
        // Small helpers (no kotlin-stdlib references).
        // ------------------------------------------------------------------

        private fun now(): String {
            val f = synchronized(lock) { formatter }
                ?: return java.lang.Long.toString(System.currentTimeMillis())
            return try {
                synchronized(f) { f.format(Date()) }
            } catch (t: Throwable) {
                "?"
            }
        }

        private fun processName(): String {
            try {
                if (Build.VERSION.SDK_INT >= 28) {
                    val name = Application.getProcessName()
                    if (name != null) {
                        return name
                    }
                }
            } catch (t: Throwable) {
                // fall through
            }
            try {
                val reader = InputStreamReader(FileInputStream("/proc/self/cmdline"))
                val buf = CharArray(128)
                val n = reader.read(buf)
                reader.close()
                if (n > 0) {
                    return String(buf, 0, n).trim()
                }
            } catch (t: Throwable) {
                // fall through
            }
            try {
                return "pid" + Process.myPid()
            } catch (t: Throwable) {
                return "?"
            }
        }

        private fun sha256hex(data: ByteArray): String {
            val md = MessageDigest.getInstance("SHA-256")
            val digest = md.digest(data)
            val sb = StringBuilder(digest.size * 2)
            var i = 0
            while (i < digest.size) {
                val b = digest[i].toInt() and 0xff
                if (b < 16) {
                    sb.append('0')
                }
                sb.append(Integer.toHexString(b))
                i++
            }
            return sb.toString()
        }
    }
}
