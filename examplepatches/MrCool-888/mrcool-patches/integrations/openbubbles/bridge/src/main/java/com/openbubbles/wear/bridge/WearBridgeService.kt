package com.openbubbles.wear.bridge

import android.util.Log
import com.google.android.gms.wearable.*
import com.openbubbles.wear.protocol.*
import org.json.JSONObject
import java.util.concurrent.atomic.AtomicBoolean

class WearBridgeService : WearableListenerService() {
    override fun onDataChanged(events: DataEventBuffer) {
        try {
            for (event in events) {
                if (event.type != DataEvent.TYPE_CHANGED) continue
                val path = event.dataItem.uri.path ?: continue
                if (!path.startsWith(Protocol.DATA_DISMISS_PREFIX)) continue
                val json = runCatching { DataMapItem.fromDataItem(event.dataItem).dataMap.getString(Protocol.DATA_KEY_JSON) }.getOrNull() ?: continue
                val dismissal = Wire.decode<NotificationDismissal>(json) ?: continue
                if (!dismissal.isValid() || path != Protocol.notificationDismissalDataPath(dismissal.threadId)) continue
                BridgeCoordinator.init(applicationContext)
                BridgeCoordinator.dismissNotification(dismissal)
            }
        } finally { events.release() }
    }

    override fun onCreate() {
        super.onCreate()
        BridgeCoordinator.init(applicationContext)
    }

    override fun onPeerConnected(peer: Node) {
        super.onPeerConnected(peer)
        BridgeCoordinator.sendSyncTo(peer.id)
    }

    override fun onCapabilityChanged(capabilityInfo: CapabilityInfo) {
        super.onCapabilityChanged(capabilityInfo)
        if (capabilityInfo.name == Protocol.CAPABILITY_WATCH)
            capabilityInfo.nodes.forEach { BridgeCoordinator.sendSyncTo(it.id) }
    }

    override fun onMessageReceived(event: MessageEvent) {
        val node = event.sourceNodeId ?: return
        val path = event.path ?: return
        val data = event.data ?: return
        BridgeCoordinator.init(applicationContext)
        var requestId: String? = null
        try {
            require(data.size <= 100_000) { "The Wear request is too large." }
            val envelope = JSONObject(data.toString(Charsets.UTF_8))
            requestId = envelope.optString("requestId").takeIf { it.isNotBlank() }
            require(envelope.optInt("version", -1) == Protocol.VERSION) { "Update the watch app to match the OpenBubbles Wear patch." }
            require(requestId == null || requestId.matches(Regex("[A-Za-z0-9_-]{1,200}"))) { "Invalid request ID." }
            when (path) {
                Protocol.PATH_PING -> {
                    val ping = Wire.decodeBytes<PingPayload>(data) ?: return
                    if (ping.watchName.isNotBlank()) BridgePreferences(applicationContext).lastSeenWatchName = ping.watchName
                    PatchBridgeClient.probe(applicationContext, force = true) {
                        send(node, Protocol.PATH_PONG, Wire.encodeBytes(BridgeCoordinator.pong()))
                    }
                }
                Protocol.PATH_SYNC_REQUEST -> {
                    val request = Wire.decodeBytes<SyncRequest>(data) ?: return
                    if (request.watchName.isNotBlank()) BridgePreferences(applicationContext).lastSeenWatchName = request.watchName
                    BridgeCoordinator.sendSyncTo(node)
                }
                Protocol.PATH_THREAD_REQUEST -> {
                    val request = Wire.decodeBytes<ThreadRequest>(data) ?: return
                    BridgeCoordinator.threadPayload(request.threadId) { payload ->
                        send(node, Protocol.PATH_THREAD, Wire.encodeBytes(payload.copy(
                            thread = payload.thread?.let(Wire::threadForTransport), requestedThreadId = request.threadId)))
                    }
                }
                Protocol.PATH_SEND -> {
                    val request = Wire.decodeBytes<SendRequest>(data) ?: return
                    sendText(node, request.requestId, request.threadId, request.text, request.address,
                        Protocol.ACTION_SEND, Protocol.PATH_ACTION_RESULT,
                        request.replyToMessageId, request.replyToPartIndex)
                }
                Protocol.PATH_REPLY -> {
                    val request = Wire.decodeBytes<ReplyRequest>(data) ?: return
                    sendText(node, request.requestId, request.threadId, request.text, null,
                        Protocol.ACTION_REPLY, Protocol.PATH_REPLY_RESULT)
                }
                Protocol.PATH_REACTION -> {
                    val request = Wire.decodeBytes<ReactionRequest>(data) ?: return
                    val claim = ActionDedupe.claim(applicationContext, request.requestId,
                        Protocol.ACTION_REACTION, request.threadId)
                    if (!claim.started) {
                        claim.result?.let { action(node, it) }
                        return
                    }
                    val finished = AtomicBoolean(false)
                    fun complete(result: ActionResult) {
                        if (!finished.compareAndSet(false, true)) return
                        ActionDedupe.put(applicationContext, result)
                        ActionDedupe.end(request.requestId)
                        action(node, result)
                    }
                    try {
                        BridgeCoordinator.react(request, ::complete)
                    } catch (t: Throwable) {
                        complete(ActionResult(requestId = request.requestId, action = Protocol.ACTION_REACTION,
                            ok = false, threadId = request.threadId, error = t.message ?: "Could not send the reaction."))
                    }
                }
                Protocol.PATH_MARK_READ -> {
                    val request = Wire.decodeBytes<MarkReadRequest>(data) ?: return
                    BridgeCoordinator.markReadDirect(request.threadId) { error ->
                        action(node, ActionResult(requestId = request.requestId, action = Protocol.ACTION_MARK_READ,
                            ok = error == null, threadId = request.threadId, error = error))
                    }
                }
                Protocol.PATH_OPEN_PHONE -> {
                    val request = Wire.decodeBytes<OpenPhoneRequest>(data) ?: return
                    val error = BridgeCoordinator.openPhone(request.threadId)
                    action(node, ActionResult(requestId = request.requestId, action = Protocol.ACTION_OPEN_PHONE,
                        ok = error == null, threadId = request.threadId, error = error))
                }
                Protocol.PATH_GROUPS_REQUEST -> {
                    val request = Wire.decodeBytes<GroupsRequest>(data) ?: return
                    BridgeCoordinator.discoverChatsDirect(request.requestId, request.offset) { result ->
                        send(node, Protocol.PATH_GROUPS_RESULT, Wire.encodeBytes(Wire.groupsForTransport(result)))
                    }
                }
                Protocol.PATH_CONTACTS_REQUEST -> {
                    val request = Wire.decodeBytes<ContactsRequest>(data) ?: return
                    val page = if (!EmbeddedRuntime.enabled()) ContactsPage(requestId = request.requestId,
                        query = request.query.trim().take(80), offset = request.offset,
                        contactsAccess = ContactDirectory.hasAccess(applicationContext),
                        error = "Enable the Wear bridge in OpenBubbles settings.")
                        else ContactDirectory.load(applicationContext, request)
                    send(node, Protocol.PATH_CONTACTS_RESULT, Wire.encodeBytes(page))
                }
                Protocol.PATH_MEDIA_REQUEST -> {
                    val request = Wire.decodeBytes<MediaRequest>(data) ?: return
                    Thread({
                        BridgeCoordinator.media(request.mediaId) { info, error ->
                            send(node, Protocol.PATH_MEDIA_RESULT, Wire.encodeBytes(MediaPayload(
                                requestId = request.requestId, mediaId = request.mediaId,
                                ok = info != null && error == null, mimeType = info?.mimeType,
                                width = info?.width ?: 0, height = info?.height ?: 0, size = info?.size ?: 0,
                                error = error)))
                        }
                    }, "OBWearMedia").start()
                }
            }
        } catch (t: Throwable) {
            Log.w("OBWearService", "Rejected request on $path", t)
            send(node, Protocol.PATH_ACTION_RESULT,
                Wire.encodeBytes(BridgeError(requestId = requestId, error = t.message ?: "Invalid bridge request.")))
        }
    }

    private fun sendText(node: String, id: String, thread: String, text: String, address: String?, action: String,
                         path: String, replyToMessageId: String? = null, replyToPartIndex: Int = 0) {
        val claim = ActionDedupe.claim(applicationContext, id, action, thread)
        if (!claim.started) {
            claim.result?.let { send(node, path, Wire.encodeBytes(it)) }
            return
        }
        val finished = AtomicBoolean(false)
        fun complete(result: ActionResult) {
            if (!finished.compareAndSet(false, true)) return
            ActionDedupe.put(applicationContext, result)
            ActionDedupe.end(id)
            send(node, path, Wire.encodeBytes(result))
        }
        try {
            BridgeCoordinator.send(id, thread, text, address, replyToMessageId, replyToPartIndex) { result ->
                complete(ActionResult(requestId = id, action = action, ok = result.error == null,
                    threadId = result.threadId ?: thread, error = result.error,
                    retryable = result.retryable, message = result.message))
            }
        } catch (t: Throwable) {
            complete(ActionResult(requestId = id, action = action, ok = false, threadId = thread,
                error = t.message ?: "OpenBubbles could not send the message."))
        }
    }

    private fun send(node: String, path: String, data: ByteArray) = WatchLink.sendToNode(applicationContext, node, path, data)
    private fun action(node: String, result: ActionResult) = send(node, Protocol.PATH_ACTION_RESULT, Wire.encodeBytes(result))
}
