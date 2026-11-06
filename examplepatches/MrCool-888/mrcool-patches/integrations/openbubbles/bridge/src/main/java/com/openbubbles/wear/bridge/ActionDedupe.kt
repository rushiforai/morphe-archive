package com.openbubbles.wear.bridge

import android.content.Context
import com.openbubbles.wear.protocol.ActionResult
import com.openbubbles.wear.protocol.Wire
import java.util.concurrent.ConcurrentHashMap

/**
 * Remembers completed request IDs so a replayed watch action cannot send the
 * same message twice. The watch journals a send until the Data Layer accepts
 * it; if it crashes between accepting and clearing that journal entry, the same
 * request ID is replayed after reconnect. Returning the original result is
 * cheap and keeps the watch's optimistic message consistent.
 */
object ActionDedupe {
    private const val PREFS_NAME = "openbubbles_wear_actions"
    private const val KEY_INDEX = "index"
    private const val KEY_PREFIX = "result:"
    private const val MAX_RESULTS = 200

    private var initialized = false
    private lateinit var prefs: android.content.SharedPreferences
    private val inFlight = ConcurrentHashMap.newKeySet<String>()

    @Synchronized
    fun init(context: Context) {
        if (initialized) return
        prefs = context.applicationContext
            .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        initialized = true
    }

    @Synchronized
    private fun get(context: Context, requestId: String): ActionResult? {
        init(context)
        val raw = prefs.getString(KEY_PREFIX + requestId, null) ?: return null
        return Wire.decode<ActionResult>(raw)
    }

    @Synchronized
    fun put(context: Context, result: ActionResult): Boolean {
        init(context)
        val requestIds = prefs.getString(KEY_INDEX, "")
            .orEmpty()
            .split(',')
            .filter { it.isNotBlank() }
            .toMutableList()
        if (result.requestId !in requestIds) requestIds += result.requestId
        val editor = prefs.edit()
        while (requestIds.size > MAX_RESULTS) {
            val removed = requestIds.removeAt(0)
            editor.remove(KEY_PREFIX + removed)
        }
        return editor
            .putString(KEY_PREFIX + result.requestId, Wire.encode(result))
            .putString(KEY_INDEX, requestIds.joinToString(","))
            .commit()
    }

    data class Claim(val started: Boolean, val result: ActionResult? = null)

    /** Atomically checks completed IDs and journals intent before any side effect. */
    @Synchronized
    fun claim(context: Context, requestId: String, action: String, threadId: String?): Claim {
        init(context)
        if (requestId in inFlight) return Claim(false)
        // A retryable result (for example, the phone was locked) performed no
        // side effect, so the same request may run again after unlock.
        get(context, requestId)?.let { if (!it.retryable) return Claim(false, it) }
        // If the process dies after sending but before saving its result, we
        // cannot tell whether OpenBubbles sent it. Never repeat that side effect.
        val uncertain = ActionResult(
            requestId = requestId, action = action, ok = false, threadId = threadId,
            error = "The previous send was interrupted. Check OpenBubbles before trying again to avoid a duplicate."
        )
        if (!put(context, uncertain)) {
            return Claim(false, uncertain.copy(error = "Could not save the send request. Free phone storage and try again."))
        }
        inFlight.add(requestId)
        return Claim(true)
    }

    fun end(requestId: String) {
        inFlight.remove(requestId)
    }
}
