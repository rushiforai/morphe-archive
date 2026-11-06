package com.openbubbles.wear.bridge

import android.content.Context
import android.os.Handler
import android.os.HandlerThread
import android.os.Looper
import android.util.Log
import org.json.JSONObject
import java.util.concurrent.atomic.AtomicBoolean

/** Async adapter for the backend installed inside OpenBubbles by the patch. */
object PatchBridgeClient {
    private const val API_VERSION = 1
    private const val PROBE_INTERVAL_MS = 15_000L
    private val main = Handler(Looper.getMainLooper())
    private val worker = Handler(HandlerThread("OBWearRequests").apply { start() }.looper)

    data class Reply(val ok: Boolean, val json: JSONObject?, val error: String?, val timedOut: Boolean = false)

    @Volatile private var available = false
    @Volatile private var checkedAt = 0L
    val patchInstalled: Boolean get() = EmbeddedRuntime.backend != null
    val bridgeEnabled: Boolean get() = EmbeddedRuntime.enabled()
    @Volatile var backendState: String = "Starting"
        private set
    internal var onAvailabilityChanged: (() -> Unit)? = null

    fun isAvailable(context: Context): Boolean {
        if (System.currentTimeMillis() - checkedAt > PROBE_INTERVAL_MS) probe(context)
        return available && bridgeEnabled
    }

    fun probe(context: Context, force: Boolean = false, callback: ((Boolean) -> Unit)? = null) {
        val now = System.currentTimeMillis()
        if (!force && now - checkedAt < PROBE_INTERVAL_MS) {
            callback?.invoke(available && bridgeEnabled)
            return
        }
        checkedAt = now
        request(context, "status", timeoutMs = 6_000) { reply ->
            val state = when {
                !patchInstalled -> "Wear patch unavailable"
                !bridgeEnabled -> "Disabled in OpenBubbles"
                else -> reply.json?.optString("backendState")?.takeIf { it.isNotBlank() } ?: "Unavailable"
            }
            val ready = reply.ok && bridgeEnabled && reply.json?.optBoolean("ready") == true
            val changed = available != ready || state != backendState
            available = ready
            backendState = state
            checkedAt = System.currentTimeMillis()
            if (changed) {
                Log.i("OBWearBackend", "Wear bridge backend: $state")
                onAvailabilityChanged?.invoke()
            }
            callback?.invoke(ready)
        }
    }

    fun request(
        context: Context,
        op: String,
        fields: JSONObject = JSONObject(),
        timeoutMs: Long = 8_000,
        callback: (Reply) -> Unit
    ) {
        val body = JSONObject(fields.toString()).put("apiVersion", API_VERSION).put("op", op)
        val backend = EmbeddedRuntime.backend
        if (backend == null) {
            callback(Reply(false, null, "The Wear patch is unavailable. Open the matching patched OpenBubbles app."))
            return
        }
        if (op != "status" && !bridgeEnabled) {
            callback(Reply(false, null, "Wear bridge is disabled in OpenBubbles Settings → Morphe patches."))
            return
        }
        val finished = AtomicBoolean(false)
        fun finish(reply: Reply) {
            if (finished.compareAndSet(false, true)) callback(reply)
        }
        val timeout = Runnable {
            finish(Reply(false, null,
                "OpenBubbles did not answer. Check the phone before retrying a send to avoid duplicates.", true))
        }
        main.postDelayed(timeout, timeoutMs)
        worker.post {
            if (finished.get()) return@post
            val reply = try {
                val raw = backend.execute(body.toString())
                val json = JSONObject(raw)
                if (json.optInt("apiVersion", -1) != API_VERSION) {
                    Reply(false, null, "OpenBubbles returned an unsupported Wear bridge response.")
                } else Reply(json.optBoolean("ok"), json,
                    if (json.optBoolean("ok")) null else json.optString("error").ifBlank { "OpenBubbles could not complete the request." })
            } catch (t: Throwable) {
                Log.w("OBWearBackend", "Embedded request failed", t)
                Reply(false, null, t.message ?: "OpenBubbles could not complete the request.")
            }
            main.post {
                main.removeCallbacks(timeout)
                finish(reply)
            }
        }
    }
}
