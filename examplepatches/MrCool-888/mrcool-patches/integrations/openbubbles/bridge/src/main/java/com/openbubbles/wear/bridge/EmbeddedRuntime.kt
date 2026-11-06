package com.openbubbles.wear.bridge

import android.content.Context
import android.os.Handler
import android.os.Looper

/** Installed by the native startup hook; no exported Binder bridge is needed. */
object EmbeddedRuntime {
    interface Backend {
        fun execute(json: String): String
        fun isEnabled(): Boolean
    }

    @Volatile internal var backend: Backend? = null
        private set
    private val handler = Handler(Looper.getMainLooper())
    private val refresh = Runnable { BridgeCoordinator.refreshBackend() }

    @JvmStatic fun initialize(context: Context, implementation: Backend) {
        backend = implementation
        BridgeCoordinator.init(context)
        ActionDedupe.init(context)
        runCatching {
            com.google.android.gms.wearable.Wearable.getCapabilityClient(context)
                .addLocalCapability(com.openbubbles.wear.protocol.Protocol.CAPABILITY_PHONE)
                .addOnFailureListener { android.util.Log.w("OBWearBackend", "Could not advertise Wear capability", it) }
        }.onFailure { android.util.Log.w("OBWearBackend", "Wear transport unavailable", it) }
        onBackendChanged()
    }

    internal fun enabled(): Boolean = runCatching { backend?.isEnabled() == true }.getOrDefault(false)

    @JvmStatic fun onBackendChanged() {
        handler.removeCallbacks(refresh)
        handler.postDelayed(refresh, 400L)
    }

    @JvmStatic fun onAlert(chatGuid: String, postedAt: Long, hidePreview: Boolean) {
        handler.post { BridgeCoordinator.onAlert(chatGuid, postedAt, hidePreview) }
    }

    @JvmStatic fun diagnostics(context: Context): String = BridgeCoordinator.diagnostics(context)

    @JvmStatic fun onTestAlert(timestamp: Long) {
        handler.post { BridgeCoordinator.sendTestAlert(timestamp) }
    }

    @JvmStatic fun publishNotificationDismissal(context: Context, threadId: String, postedAt: Long): com.google.android.gms.tasks.Task<com.google.android.gms.wearable.DataItem>? {
        return WatchLink.publishNotificationDismissal(context,
            com.openbubbles.wear.protocol.NotificationDismissal(threadId = threadId, postedAt = postedAt))
    }

    @JvmStatic fun clearCache(context: Context) {
        BridgeCoordinator.clearCache(context)
        onBackendChanged()
    }
}
