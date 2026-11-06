package com.openbubbles.wear.bridge

import android.content.Context
import android.net.Uri
import android.util.Log
import com.google.android.gms.wearable.Asset
import com.google.android.gms.wearable.CapabilityClient
import com.google.android.gms.wearable.PutDataMapRequest
import com.google.android.gms.wearable.Wearable
import com.openbubbles.wear.protocol.Protocol
import com.openbubbles.wear.protocol.SyncPayload
import com.openbubbles.wear.protocol.Wire
import com.openbubbles.wear.protocol.WireThread

/**
 * Sends live updates to every reachable watch and mirrors snapshots into the
 * Data Layer so a watch can show cached conversations while the phone is away.
 */
object WatchLink {
    fun publishNotificationDismissal(context: Context, event: com.openbubbles.wear.protocol.NotificationDismissal): com.google.android.gms.tasks.Task<com.google.android.gms.wearable.DataItem>? {
        if (!event.isValid()) return null
        val request = PutDataMapRequest.create(Protocol.notificationDismissalDataPath(event.threadId))
        request.dataMap.putString(Protocol.DATA_KEY_JSON, Wire.encode(event))
        request.setUrgent()
        return Wearable.getDataClient(context).putDataItem(request.asPutDataRequest())
            .addOnFailureListener { Log.w(TAG, "Could not sync notification dismissal", it) }
    }

    private const val TAG = "OBWearLink"
    private const val PREFS_NAME = "openbubbles_wear_link"
    private const val KEY_URIS = "data_uris"
    private val uriLock = Any()

    fun sendToNode(context: Context, nodeId: String, path: String, bytes: ByteArray) {
        Wearable.getMessageClient(context)
            .sendMessage(nodeId, path, bytes)
            .addOnFailureListener { error ->
                Log.w(TAG, "Message $path to $nodeId failed", error)
            }
    }

    fun broadcast(context: Context, path: String, bytes: ByteArray) {
        Wearable.getCapabilityClient(context)
            .getCapability(Protocol.CAPABILITY_WATCH, CapabilityClient.FILTER_REACHABLE)
            .addOnSuccessListener { info ->
                if (info.nodes.isEmpty()) {
                    sendToAllConnected(context, path, bytes)
                } else {
                    info.nodes.forEach { node ->
                        sendToNode(context, node.id, path, bytes)
                    }
                }
            }
            .addOnFailureListener {
                sendToAllConnected(context, path, bytes)
            }
    }

    private fun sendToAllConnected(context: Context, path: String, bytes: ByteArray) {
        Wearable.getNodeClient(context).connectedNodes
            .addOnSuccessListener { nodes ->
                nodes.forEach { node ->
                    sendToNode(context, node.id, path, bytes)
                }
            }
            .addOnFailureListener { error ->
                Log.w(TAG, "Unable to enumerate connected nodes", error)
            }
    }

    fun putSync(context: Context, payload: SyncPayload) {
        putJson(context, Protocol.DATA_SYNC, Wire.encode(payload), recordUri = false)
    }

    fun putThread(context: Context, thread: WireThread) {
        val transport = Wire.threadForTransport(thread)
        putJson(
            context,
            Protocol.threadDataPath(thread.id),
            Wire.encode(transport),
            recordUri = true
        )
    }

    private fun putJson(context: Context, path: String, json: String, recordUri: Boolean) {
        val request = PutDataMapRequest.create(path)
        request.dataMap.putString(Protocol.DATA_KEY_JSON, json)
        request.setUrgent()
        Wearable.getDataClient(context).putDataItem(request.asPutDataRequest())
            .addOnSuccessListener { item ->
                if (recordUri) recordUri(context, path, item.uri.toString())
            }
            .addOnFailureListener { error ->
                Log.w(TAG, "Data item $path failed", error)
            }
    }

    fun publishAll(context: Context, threads: List<WireThread>, sync: SyncPayload) {
        putSync(context, sync)
        threads.forEach { putThread(context, it) }
        pruneThreads(context, threads.map { it.id }.toSet())
    }

    /**
     * Publishes one attachment as a Data Layer asset. A changing publication
     * timestamp forces a change event even when the same photo was requested
     * more than once.
     */
    fun publishMedia(context: Context, info: MediaInfo, onResult: (String?) -> Unit) {
        val bytes = runCatching { info.file.readBytes() }.getOrNull()
        if (bytes == null || bytes.isEmpty()) {
            onResult("The cached photo could not be read.")
            return
        }
        if (bytes.size > MAX_MEDIA_ASSET_BYTES) {
            onResult("This attachment is too large to send to the watch.")
            return
        }
        val path = Protocol.mediaDataPath(info.id)
        val request = PutDataMapRequest.create(path)
        request.dataMap.putString(Protocol.DATA_KEY_MIME, info.mimeType)
        request.dataMap.putInt(Protocol.DATA_KEY_WIDTH, info.width)
        request.dataMap.putInt(Protocol.DATA_KEY_HEIGHT, info.height)
        request.dataMap.putLong(Protocol.DATA_KEY_SIZE, info.size)
        request.dataMap.putLong(
            Protocol.DATA_KEY_MEDIA_PUBLISHED_AT,
            System.currentTimeMillis()
        )
        request.dataMap.putAsset(Protocol.DATA_KEY_ASSET, Asset.createFromBytes(bytes))
        request.setUrgent()
        Wearable.getDataClient(context).putDataItem(request.asPutDataRequest())
            .addOnSuccessListener { item ->
                recordUri(context, path, item.uri.toString())
                onResult(null)
            }
            .addOnFailureListener { error ->
                Log.w(TAG, "Media data item $path failed", error)
                onResult("The photo could not be sent to the watch.")
            }
    }

    /** Deletes media data items that are no longer referenced by a cached thread. */
    fun pruneMedia(context: Context, keepMediaIds: Set<String>) {
        val keepPaths = keepMediaIds.map { Protocol.mediaDataPath(it) }.toSet()
        val uris = readUris(context)
        val stale = uris.keys.filter { path ->
            path.startsWith(Protocol.DATA_MEDIA_PREFIX) && path !in keepPaths
        }
        if (stale.isEmpty()) return
        stale.forEach { path ->
            val uri = uris.remove(path)
            if (uri != null) {
                Wearable.getDataClient(context)
                    .deleteDataItems(Uri.parse(uri))
                    .addOnFailureListener { error ->
                        Log.w(TAG, "Unable to delete stale media item $path", error)
                    }
            }
        }
        writeUris(context, uris)
    }

    fun clearMedia(context: Context) {
        val uris = readUris(context)
        val mediaPaths = uris.keys.filter { it.startsWith(Protocol.DATA_MEDIA_PREFIX) }
        mediaPaths.forEach { path ->
            val uri = uris.remove(path)
            if (uri != null) {
                Wearable.getDataClient(context)
                    .deleteDataItems(Uri.parse(uri))
                    .addOnFailureListener { error ->
                        Log.w(TAG, "Unable to delete media item $path", error)
                    }
            }
        }
        writeUris(context, uris)
    }

    /** Deletes leftovers for conversations that have fallen out of the local cache. */
    fun pruneThreads(context: Context, keepThreadIds: Set<String>) {
        val keepPaths = keepThreadIds.map { Protocol.threadDataPath(it) }.toSet()
        val uris = readUris(context)
        val stale = uris.keys.filter { path ->
            path.startsWith(Protocol.DATA_THREAD_PREFIX) && path !in keepPaths
        }
        if (stale.isEmpty()) return
        stale.forEach { path ->
            val uri = uris.remove(path)
            if (uri != null) {
                Wearable.getDataClient(context)
                    .deleteDataItems(Uri.parse(uri))
                    .addOnFailureListener { error ->
                        Log.w(TAG, "Unable to delete stale data item $path", error)
                    }
            }
        }
        writeUris(context, uris)
    }

    private fun recordUri(context: Context, path: String, uri: String) {
        synchronized(uriLock) {
            val uris = readUris(context)
            uris[path] = uri
            writeUris(context, uris)
        }
    }

    private fun readUris(context: Context): MutableMap<String, String> {
        val raw = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            .getString(KEY_URIS, null)
            ?: return mutableMapOf()
        return Wire.decode<Map<String, String>>(raw)?.toMutableMap() ?: mutableMapOf()
    }

    private fun writeUris(context: Context, uris: Map<String, String>) {
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            .edit()
            .putString(KEY_URIS, Wire.encode(uris))
            .apply()
    }

    private const val MAX_MEDIA_ASSET_BYTES = 8 * 1024 * 1024
}
