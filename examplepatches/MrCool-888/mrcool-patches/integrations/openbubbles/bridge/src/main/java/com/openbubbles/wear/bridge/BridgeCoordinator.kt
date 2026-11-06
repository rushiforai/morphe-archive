package com.openbubbles.wear.bridge

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.openbubbles.wear.protocol.*
import org.json.JSONObject

/** Backend-authoritative bridge; every action runs inside patched OpenBubbles. */
object BridgeCoordinator {
    fun dismissNotification(event: NotificationDismissal) {
        if (!initialized || !event.isValid()) return
        PatchBridgeClient.request(appContext, "dismissNotification",
            JSONObject().put("threadId", event.threadId).put("postedAt", event.postedAt), 8_000) { reply ->
            if (!reply.ok) Log.w("OBWearLink", "Could not dismiss matching phone notification")
        }
    }

    private const val MAX_SEND_LENGTH = 800
    private var initialized = false
    private lateinit var appContext: Context
    private lateinit var prefs: BridgePreferences
    private lateinit var store: BridgeStore
    private lateinit var mediaCache: MediaCache
    private val handler = Handler(Looper.getMainLooper())
    private val syncRunnable = Runnable { publishSync() }
    private var discoveryRunning = false
    private lateinit var reactionTracker: ReactionEventTracker
    private var reactionRefreshInFlight = false
    private var reactionRefreshPending = false

    data class SendResult(val threadId: String?, val error: String?, val message: WireMessage? = null,
        val retryable: Boolean = false)

    @Synchronized fun init(context: Context) {
        if (initialized) return
        appContext = context.applicationContext
        prefs = BridgePreferences(appContext)
        store = BridgeStore(appContext)
        mediaCache = MediaCache(appContext)
        val seen = appContext.getSharedPreferences("wear_reaction_alerts", Context.MODE_PRIVATE)
            .getString("seen", null)?.let { Wire.decode<List<String>>(it) }
        reactionTracker = ReactionEventTracker(seen)
        initialized = true
        PatchBridgeClient.onAvailabilityChanged = { scheduleSync() }
    }

    fun refreshBackend() {
        if (!initialized) return
        PatchBridgeClient.probe(appContext, force = true) { ready ->
            publishSync()
            if (!ready) return@probe
            refreshReactionEvents()
            maybeAutoDiscoverChats(appContext)
            store.snapshot().filter { it.directHistory }.forEach { previous ->
                threadPayload(previous.id) { payload ->
                    val current = payload.thread
                    if (payload.error == null && current != null && current != previous)
                        publishThreadUpdate(current)
                }
            }
        }
    }

    @Synchronized
    private fun refreshReactionEvents() {
        if (!initialized || !prefs.relayEnabled) return
        if (reactionRefreshInFlight) {
            reactionRefreshPending = true
            return
        }
        reactionRefreshInFlight = true
        PatchBridgeClient.request(appContext, "reactionEvents", JSONObject(), 24_000) { reply ->
            try {
                val array = if (reply.ok) reply.json?.optJSONArray("events") else null
                if (array != null) {
                    val events = (0 until array.length()).mapNotNull { index ->
                        val item = array.optJSONObject(index) ?: return@mapNotNull null
                        val id = item.optString("id").takeIf { it.isNotBlank() && it.length <= 512 } ?: return@mapNotNull null
                        val threadId = BridgeJson.canonicalId(item.optString("threadId"))
                            ?.takeIf(Protocol::isChatGuid) ?: return@mapNotNull null
                        val timestamp = item.optLong("timestamp", 0)
                        val text = item.optString("text").take(300).takeIf(String::isNotBlank) ?: return@mapNotNull null
                        ReactionEvent(id, threadId, timestamp,
                            item.optString("sender").take(160).takeIf(String::isNotBlank), text, item.optBoolean("muted"))
                    }
                    val hidden = reply.json?.optBoolean("hidePreview", true) ?: true
                    val fresh = reactionTracker.newEvents(events, System.currentTimeMillis())
                    val saved = appContext.getSharedPreferences("wear_reaction_alerts", Context.MODE_PRIVATE)
                        .edit().putString("seen", Wire.encode(reactionTracker.snapshot())).commit()
                    if (!saved) return@request
                    fresh.forEach { event ->
                        if (event.muted || !reactionAlertsAllowed(event.threadId)) return@forEach
                        threadPayload(event.threadId) { payload ->
                            if (payload.error != null || !reactionAlertsAllowed(event.threadId)) return@threadPayload
                            val thread = payload.thread ?: return@threadPayload
                            val message = WireMessage(id = "reaction:${event.id}", threadId = thread.id,
                                text = event.text, sender = event.sender, timestamp = event.timestamp)
                            val alert = ReactionAlert(thread = Wire.threadForTransport(thread), event = message, hidePreview = hidden)
                            WatchLink.broadcast(appContext, Protocol.PATH_REACTION_ALERT, Wire.encodeBytes(alert))
                        }
                    }
                }
            } finally {
                val again = synchronized(this) {
                    reactionRefreshInFlight = false
                    reactionRefreshPending.also { reactionRefreshPending = false }
                }
                if (again) refreshReactionEvents()
            }
        }
    }

    private fun reactionAlertsAllowed(threadId: String): Boolean {
        if (!initialized || !prefs.relayEnabled || !EmbeddedRuntime.enabled() || !BridgeInfo.shouldAlertWatch(appContext)) return false
        val manager = appContext.getSystemService(android.app.NotificationManager::class.java) ?: return false
        if (!manager.areNotificationsEnabled() ||
            manager.getNotificationChannel("messages")?.importance == android.app.NotificationManager.IMPORTANCE_NONE) return false
        val conversation = manager.getNotificationChannel("messages", threadId)
        return conversation?.importance != android.app.NotificationManager.IMPORTANCE_NONE
    }

    fun onAlert(rawGuid: String, postedAt: Long, hidePreview: Boolean) {
        if (!initialized || !prefs.relayEnabled || !Protocol.isChatGuid(rawGuid)) return
        val id = BridgeJson.canonicalId(rawGuid) ?: return
        threadPayload(id) { payload ->
            if (payload.error != null) return@threadPayload
            val thread = payload.thread ?: return@threadPayload
            // The native notification's timestamp identifies its incoming backend message.
            val incoming = thread.messages.lastOrNull { !it.fromMe && it.timestamp == postedAt }
                ?: return@threadPayload
            publishThreadUpdate(thread, incoming.id, hidePreview)
            scheduleSync()
        }
    }

    fun threadFor(threadId: String): WireThread? =
        if (!initialized) null else store.get(threadId)?.let(::decorate)

    fun threadPayload(threadId: String, callback: (ThreadPayload) -> Unit) {
        if (!initialized) {
            callback(ThreadPayload(error = "The bridge is still starting."))
            return
        }
        val cached = threadFor(threadId)
        if (!prefs.relayEnabled) {
            callback(ThreadPayload(thread = cached, error = "Relay is paused on the phone."))
            return
        }
        if (threadId.startsWith("new:")) {
            callback(ThreadPayload(thread = cached))
            return
        }
        val fields = JSONObject().put("threadId", threadId).put("limit", 80)
        cached?.address?.let { address -> if (address.isNotBlank()) fields.put("address", address) }
        PatchBridgeClient.request(appContext, "thread", fields, 24_000) { reply ->
            if (!prefs.relayEnabled) {
                callback(ThreadPayload(error = "Relay is paused on the phone."))
                return@request
            }
            val history = reply.json?.optJSONObject("thread")
            val bridged = if (reply.ok && history?.optJSONArray("messages") != null)
                BridgeJson.thread(history) else null
            if (bridged == null) {
                callback(ThreadPayload(thread = cached?.let(::decorate), error = reply.error
                    ?: "OpenBubbles returned no message history. Cached messages may be incomplete."))
                return@request
            }
            val stored = storeBridgeThread(bridged)
            callback(ThreadPayload(thread = decorate(stored)))
        }
    }

    fun markReadDirect(threadId: String, callback: (String?) -> Unit) {
        if (!initialized) {
            callback("The bridge is still starting.")
            return
        }
        if (!prefs.relayEnabled) {
            callback("Relay is paused on the phone.")
            return
        }
        val fields = JSONObject().put("threadId", threadId)
        store.get(threadId)?.address?.let { address -> if (address.isNotBlank()) fields.put("address", address) }
        PatchBridgeClient.request(appContext, "markRead", fields, 8_000) { reply ->
            val error = if (reply.ok) null else reply.error ?: "OpenBubbles could not mark the chat read."
            if (error == null) {
                prefs.markReadAt(threadId)
                store.markRead(threadId)
                publishAfterAction(threadId)
            }
            callback(error)
        }
    }

    private fun sendDirect(
        requestId: String,
        threadId: String,
        address: String?,
        text: String,
        replyToMessageId: String?,
        replyToPartIndex: Int,
        callback: (SendResult) -> Unit
    ) {
        val fields = JSONObject().put("requestId", requestId).put("threadId", threadId).put("text", text)
        if (replyToMessageId != null) fields.put("replyToMessageId", replyToMessageId)
            .put("replyToPartIndex", replyToPartIndex)
        val recipient = address ?: store.get(threadId)?.address
        if (!recipient.isNullOrBlank()) fields.put("address", recipient)
        PatchBridgeClient.request(appContext, "send", fields, 24_000) { reply ->
            val body = reply.json
            if (!reply.ok || body == null) {
                callback(
                    SendResult(
                        threadId,
                        reply.error ?: "OpenBubbles could not send the message."
                    )
                )
                return@request
            }
            val bridged = BridgeJson.thread(body.optJSONObject("thread"))
            val stored = bridged?.let(::storeBridgeThread)
            val canonical = stored?.id
                ?: BridgeJson.canonicalId(body.optString("threadId"))
                ?: threadId
            val message = BridgeJson.message(body.optJSONObject("message"), canonical)
            if (stored == null) {
                val previous = store.get(threadId)
                val fallback = previous?.copy(id = canonical, messages = emptyList()) ?: WireThread(
                    id = canonical, title = recipient ?: "Conversation", address = recipient,
                    isGroup = Protocol.isGroupGuid(canonical.removePrefix("chat_"))
                )
                val replyTo = replyToMessageId?.let { id ->
                    val target = previous?.messages?.firstOrNull { it.id == id }
                    MessageReference(id, target?.displayText?.take(160).orEmpty(), target?.sender,
                        target?.fromMe == true, replyToPartIndex)
                }
                val sent = message ?: recordSent(canonical, requestId, text, replyTo)
                storeBridgeThread(fallback.copy(messages = listOf(sent)))
            }
            prefs.markReadAt(canonical)
            store.markRead(canonical)
            publishAfterAction(canonical)
            callback(
                SendResult(
                    threadId = canonical,
                    error = null,
                    message = message
                )
            )
        }
    }

    fun discoverChatsDirect(
        requestId: String,
        offset: Int = 0,
        callback: (com.openbubbles.wear.protocol.GroupsResult) -> Unit
    ) {
        if (!initialized) {
            callback(com.openbubbles.wear.protocol.GroupsResult(requestId = requestId, offset = offset, error = "The bridge is still starting."))
            return
        }
        if (!prefs.relayEnabled) {
            callback(com.openbubbles.wear.protocol.GroupsResult(requestId = requestId, offset = offset, error = "Relay is paused on the phone."))
            return
        }
        PatchBridgeClient.request(appContext, "chats", JSONObject().put("limit", 40).put("offset", offset), 12_000) { reply ->
            if (!prefs.relayEnabled) {
                callback(com.openbubbles.wear.protocol.GroupsResult(requestId = requestId, offset = offset, error = "Relay is paused on the phone."))
                return@request
            }
            val array = if (reply.ok) reply.json?.optJSONArray("chats") else null
            if (array == null) {
                callback(
                    com.openbubbles.wear.protocol.GroupsResult(
                        requestId = requestId,
                        offset = offset,
                        error = reply.error ?: "OpenBubbles did not return its chat list."
                    )
                )
                return@request
            }
            val jsonChats = (0 until array.length()).mapNotNull { array.optJSONObject(it) }
            // Import oldest first so the bounded directory keeps the newest chats.
            val imported = jsonChats.mapNotNull(BridgeJson::thread).asReversed().map(::storeBridgeThread)
            val visible = imported.map(::decorate).map { it.toSummary() }
                .distinctBy { it.id }
                .sortedByDescending { it.lastTimestamp }
            prefs.lastChatDiscoveryAt = System.currentTimeMillis()
            scheduleSync()
            callback(
                com.openbubbles.wear.protocol.GroupsResult(
                    requestId = requestId,
                    offset = reply.json?.optInt("offset", offset) ?: offset,
                    nextOffset = reply.json?.takeIf { it.has("nextOffset") }?.optInt("nextOffset"),
                    groups = visible.filter { it.isGroup },
                    chats = visible.filterNot { it.isGroup },
                    note = "Read directly from OpenBubbles with the Wear patch. Open a chat to load its history."
                )
            )
        }
    }

    fun media(mediaId: String, callback: (MediaInfo?, String?) -> Unit) {
        if (!initialized) {
            callback(null, "The bridge is still starting.")
            return
        }
        if (!prefs.relayEnabled) {
            callback(null, "Relay is paused on the phone.")
            return
        }
        val cached = store.snapshot().firstOrNull { thread -> thread.messages.any { it.mediaId == mediaId } }
        val message = cached?.messages?.firstOrNull { it.mediaId == mediaId }
        val source = BridgeJson.mediaUri(message?.sourceUri)
        if (mediaCache.info(mediaId) == null && cached != null && message != null && source != null) {
            val enriched = mediaCache.ingest(cached, mapOf(message.id to MediaSource(source, message.mediaMime)), cached)
            store.update(enriched)
            publishThreadUpdate(decorate(enriched))
        }
        val info = AvatarCache.info(appContext, mediaId) ?: mediaCache.info(mediaId)
        if (info == null) {
            callback(null, "This photo is no longer cached on the phone.")
            return
        }
        WatchLink.publishMedia(appContext, info) { error ->
            if (error == null) {
                callback(info, null)
            } else {
                callback(null, error)
            }
        }
    }


    private fun storeBridgeThread(thread: WireThread): WireThread {
        val address = Protocol.normalizeAddress(thread.address)
        val alias = if (thread.isGroup || address == null) null else store.snapshot().firstOrNull {
            it.id.startsWith("new:") && !it.isGroup && Protocol.normalizeAddress(it.address) == address
        }
        return store.upsertIncoming(thread, mergeFromId = alias?.id)
    }

    fun send(requestId: String, threadId: String?, rawText: String, address: String? = null,
        replyToMessageId: String? = null, replyToPartIndex: Int = 0,
        callback: (SendResult) -> Unit) {
        if (!initialized) { callback(SendResult(threadId, "The bridge is still starting.")); return }
        if (!prefs.relayEnabled) { callback(SendResult(threadId, "Wear bridge is disabled in OpenBubbles settings.")); return }
        if (requestId.isBlank() || requestId.length > 200) {
            callback(SendResult(threadId, "Invalid send request ID.")); return
        }
        val text = rawText.trim()
        if (text.isBlank() || text.length > MAX_SEND_LENGTH) {
            callback(SendResult(threadId, "Enter a message of 1–800 characters.")); return
        }
        if (threadId.isNullOrBlank()) {
            callback(SendResult(null, "Open this chat in OpenBubbles on the phone first.")); return
        }
        sendDirect(requestId, threadId, address, text, replyToMessageId, replyToPartIndex, callback)
    }

    fun react(request: ReactionRequest, callback: (ActionResult) -> Unit) {
        fun complete(error: String?, message: WireMessage? = null) = callback(ActionResult(
            requestId = request.requestId, action = Protocol.ACTION_REACTION,
            ok = error == null, threadId = request.threadId, error = error, message = message))
        if (!initialized || !prefs.relayEnabled) {
            complete("Enable the Wear bridge in OpenBubbles first.")
            return
        }
        if (!Protocol.isChatGuid(request.threadId) || request.messageId.isBlank() ||
            request.messageId.length > 512 || Tapback.fromType(request.reaction) == null ||
            request.partIndex !in 0..1024) {
            complete("Invalid reaction target.")
            return
        }
        val fields = JSONObject().put("requestId", request.requestId).put("threadId", request.threadId)
            .put("messageId", request.messageId).put("reaction", request.reaction)
            .put("remove", request.remove).put("partIndex", request.partIndex)
        PatchBridgeClient.request(appContext, "reaction", fields, 28_000) { reply ->
            if (!reply.ok) {
                complete(reply.error ?: "Could not send the reaction.")
                return@request
            }
            val thread = BridgeJson.thread(reply.json?.optJSONObject("thread"))
                ?.takeIf { it.id == request.threadId }?.let(::storeBridgeThread)
            val message = BridgeJson.message(reply.json?.optJSONObject("message"), request.threadId)
            thread?.let { publishThreadUpdate(decorate(it)) }
            complete(null, thread?.messages?.firstOrNull { it.id == request.messageId } ?: message)
        }
    }

    private fun recordSent(threadId: String, requestId: String, text: String, replyTo: MessageReference? = null): WireMessage {
        val message = WireMessage(id = BridgeStore.OPTIMISTIC_MESSAGE_PREFIX + requestId,
            threadId = threadId, text = text, timestamp = System.currentTimeMillis(),
            fromMe = true, status = "unconfirmed", replyTo = replyTo)
        store.mergeHistory(threadId, listOf(message))
        return message
    }

    fun openPhone(threadId: String?): String? {
        if (!initialized || !prefs.relayEnabled) return "Enable the Wear bridge in OpenBubbles first."
        val launcher = appContext.packageManager.getLaunchIntentForPackage(appContext.packageName)
            ?: return "OpenBubbles cannot be opened."
        val intent = if (threadId == null) launcher.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
            else {
                if (!Protocol.isChatGuid(threadId.removePrefix("chat_"))) return "Invalid conversation ID."
                ConversationLaunch.existingGuid(launcher, threadId)
            }
        return runCatching { appContext.startActivity(intent); null }
            .getOrElse { "Android did not allow opening this OpenBubbles conversation." }
    }

    fun relayEnabled(context: Context): Boolean { init(context); return prefs.relayEnabled }

    fun clearCache(context: Context) {
        init(context)
        store.clear()
        mediaCache.clear()
        AvatarCache.clear(appContext)
        WatchLink.clearMedia(appContext)
        prefs.clearCachedMessages()
        scheduleSync()
    }

    fun diagnostics(context: Context): String {
        init(context)
        return "Wear bridge " + BridgeInfo.BRIDGE_VERSION + "\n" +
            (if (prefs.relayEnabled) PatchBridgeClient.backendState else "Disabled") +
            "\nCached chats: " + store.snapshot().size + "\nCached images: " + mediaCache.count() +
            "\nContacts: " + (if (ContactDirectory.hasAccess(context)) "Allowed" else "Not allowed") +
            "\nLast watch: " + prefs.lastSeenWatchName.ifBlank { "Not connected yet" }
    }

    fun pong(): PongPayload = PongPayload(
        phoneName = BridgeInfo.phoneName(), bridgeVersion = BridgeInfo.BRIDGE_VERSION,
        relayEnabled = initialized && prefs.relayEnabled,
        phoneLocked = initialized && BridgeInfo.isPhoneLocked(appContext),
        phoneAwake = initialized && BridgeInfo.isPhoneAwake(appContext),
        trackedConversations = if (initialized) store.snapshot().size else 0,
        contactsAccess = initialized && ContactDirectory.hasAccess(appContext),
        directBridge = initialized && PatchBridgeClient.isAvailable(appContext),
        backendState = PatchBridgeClient.backendState
    )

    fun maybeAutoDiscoverChats(context: Context) {
        init(context)
        if (!prefs.relayEnabled || discoveryRunning) return
        discoveryRunning = true
        fun page(offset: Int) {
            discoverChatsDirect("auto-directory", offset) { result ->
                val next = result.nextOffset
                if (result.error == null && next != null && next > offset && next <= 5000) page(next)
                else { discoveryRunning = false; scheduleSync() }
            }
        }
        page(0)
    }

    fun sendSyncTo(nodeId: String) {
        if (!initialized) return
        PatchBridgeClient.probe(appContext, force = true) { ready ->
            if (ready) maybeAutoDiscoverChats(appContext)
            WatchLink.sendToNode(appContext, nodeId, Protocol.PATH_SYNC,
                Wire.encodeBytes(buildSync(store.snapshot().map(::decorate))))
        }
    }

    private fun buildSync(threads: List<WireThread>): SyncPayload = Wire.syncForTransport(SyncPayload(
        generatedAt = System.currentTimeMillis(), phoneName = BridgeInfo.phoneName(),
        bridgeVersion = BridgeInfo.BRIDGE_VERSION, relayEnabled = prefs.relayEnabled,
        phoneLocked = BridgeInfo.isPhoneLocked(appContext), phoneAwake = BridgeInfo.isPhoneAwake(appContext),
        conversations = threads.map { it.toSummary() }, contactsAccess = ContactDirectory.hasAccess(appContext),
        directBridge = PatchBridgeClient.isAvailable(appContext), backendState = PatchBridgeClient.backendState
    ))

    private fun decorate(thread: WireThread): WireThread {
        val ready = prefs.relayEnabled && PatchBridgeClient.isAvailable(appContext)
        return thread.copy(canReply = ready, canMarkRead = ready, canSend = ready)
    }

    private fun publishAfterAction(threadId: String) {
        store.get(threadId)?.let { publishThreadUpdate(decorate(it)) }
        scheduleSync()
    }

    private fun publishThreadUpdate(thread: WireThread, alertMessageId: String? = null, hidePreview: Boolean = false) {
        if (!initialized || !prefs.relayEnabled) return
        val update = liveUpdate(thread, alertMessageId, hidePreview)
        WatchLink.putThread(appContext, update.thread)
        WatchLink.broadcast(appContext, Protocol.PATH_UPDATE, Wire.encodeBytes(update))
    }

    internal fun liveUpdate(thread: WireThread, alertMessageId: String?, hidePreview: Boolean): UpdatePayload {
        // History loads asynchronously; the phone may have unlocked since its native alert.
        val eligibleAlertId = alertMessageId?.takeIf { BridgeInfo.shouldAlertWatch(appContext) }
        return UpdatePayload(thread = Wire.threadForTransport(thread),
            alertMessageId = eligibleAlertId, hideAlertPreview = hidePreview)
    }

    fun sendTestAlert(timestamp: Long) {
        if (!initialized || !prefs.relayEnabled) {
            Log.i("OBWearTest", "Test skipped: bridge not ready or disabled")
            return
        }
        val thread = Protocol.testNotificationThread(timestamp)
        val update = liveUpdate(thread, thread.messages.single().id, false)
        Log.i("OBWearTest", "Forwarding test; eligible=${update.alertMessageId != null}")
        // A test alert is transient: never publish it as chat history or a durable snapshot.
        WatchLink.broadcast(appContext, Protocol.PATH_TEST_NOTIFICATION, Wire.encodeBytes(update))
    }

    private fun scheduleSync() {
        handler.removeCallbacks(syncRunnable)
        handler.postDelayed(syncRunnable, 400L)
    }

    private fun publishSync() {
        if (!initialized) return
        val threads = store.snapshot().map(::decorate)
        val payload = buildSync(threads)
        WatchLink.putSync(appContext, payload)
        WatchLink.broadcast(appContext, Protocol.PATH_SYNC, Wire.encodeBytes(payload))
        if (!prefs.relayEnabled) return
        threads.forEach { WatchLink.putThread(appContext, it) }
        WatchLink.pruneThreads(appContext, threads.map { it.id }.toSet())
        val mediaIds = threads.flatMap { it.messages.mapNotNull { message -> message.mediaId } }.toSet()
        mediaCache.prune(mediaIds)
        WatchLink.pruneMedia(appContext, mediaIds + AvatarCache.ids(appContext))
        prefs.lastPublishAt = System.currentTimeMillis()
    }
}
