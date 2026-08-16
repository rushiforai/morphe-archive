package dev.petalaa.extension

import java.io.BufferedReader
import java.io.InputStreamReader

/**
 * Shared root shell helper.
 *
 * Used by [AASelfTweaker] and [CarDisplay] to run commands via `su`.
 * Detects a working root invocation once (preferring `--mount-master`),
 * then reuses that prefix for all subsequent calls.
 */
object RootShell {

    /** su invocation prefix, detected once by [detect]. */
    @Volatile
    private var suArgs: List<String> = listOf("su", "--mount-master", "-c")

    /**
     * Detects a working root invocation. Returns true when root is usable.
     * Callers should check [isRootAvailable] instead of calling this directly.
     */
    @JvmStatic
    fun detect(): Boolean {
        if (isRootAvailable) return true
        val candidates = listOf(
            listOf("su", "--mount-master", "-c"),
            listOf("su", "-M", "-c"),
            listOf("su", "-c")
        )
        for (args in candidates) {
            val out = runCatching {
                val process = ProcessBuilder(*args.toTypedArray(), "id").start()
                val stdout = process.inputStream.bufferedReader().readText()
                process.waitFor()
                stdout
            }.getOrNull() ?: continue
            if (out.contains("uid=0")) {
                suArgs = args
                AALogger.i("RootShell: root OK via: ${args.joinToString(" ")}")
                return true
            }
        }
        return false
    }

    /** True when root has been detected and is usable. */
    @JvmStatic
    val isRootAvailable: Boolean
        get() = suArgs.isNotEmpty() && runCatching {
            val process = ProcessBuilder(*suArgs.toTypedArray(), "id").start()
            val out = process.inputStream.bufferedReader().readText()
            process.waitFor()
            out.contains("uid=0")
        }.getOrElse { false }

    /**
     * Runs [command] through `su -c`, returning (exitCode, stdout, stderr).
     * On timeout the process is destroyed and exit code -1 is returned.
     * Never throws.
     */
    @JvmStatic
    fun run(command: String, timeoutSec: Int = 15): Triple<Int, String, String> {
        return try {
            val process = ProcessBuilder(*suArgs.toTypedArray(), command).start()
            var stdout = ""
            var stderr = ""
            val outThread = Thread {
                stdout = process.inputStream.bufferedReader().readText()
            }.apply { isDaemon = true; start() }
            val errThread = Thread {
                stderr = process.errorStream.bufferedReader().readText()
            }.apply { isDaemon = true; start() }
            val deadlineMs = System.currentTimeMillis() + timeoutSec * 1000L
            var exitCode: Int? = null
            while (System.currentTimeMillis() < deadlineMs) {
                try {
                    exitCode = process.exitValue()
                    break
                } catch (_: IllegalThreadStateException) {
                    Thread.sleep(50)
                }
            }
            outThread.join(1000)
            errThread.join(1000)
            if (exitCode == null) {
                process.destroy()
                AALogger.w("RootShell: command timed out after ${timeoutSec}s: $command")
                Triple(-1, stdout, stderr)
            } else {
                Triple(exitCode, stdout, stderr)
            }
        } catch (t: Throwable) {
            AALogger.e("RootShell: run failed for: $command", t)
            Triple(-1, "", t.message ?: "")
        }
    }
}