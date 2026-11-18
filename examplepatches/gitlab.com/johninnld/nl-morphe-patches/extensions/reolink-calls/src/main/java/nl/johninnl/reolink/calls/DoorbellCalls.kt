package nl.johninnl.reolink.calls

import android.Manifest
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.os.Build
import android.os.SystemClock
import android.util.Log
import java.security.MessageDigest
import java.lang.reflect.Proxy

internal data class DoorbellEvent(
    val key: String,
    val address: String,
    val displayName: String,
    val device: Any,
    val channel: Any,
    val context: Context,
    val remoteMessage: Any,
    val notificationId: Int,
)

/** Process-local handoff; no app credentials or push payloads are persisted or exported. */
object DoorbellCalls {
    private var pending: DoorbellEvent? = null
    private val seen = LinkedHashMap<String, Long>()
    private val nativeFallback = ThreadLocal<Boolean>()

    @JvmStatic
    fun initialize(context: Context) {
        try {
            val task = NativeApi.call(NativeApi.instance("com.google.firebase.messaging.FirebaseMessaging"),
                "setNotificationDelegationEnabled", false) ?: return
            val listenerType = NativeApi.type("com.google.android.gms.tasks.OnCompleteListener")
            val listener = Proxy.newProxyInstance(listenerType.classLoader, arrayOf(listenerType)) { proxy, method, args ->
                when (method.name) {
                    "onComplete" -> {
                        val disabled = Build.VERSION.SDK_INT < 29 ||
                            context.getSystemService(NotificationManager::class.java).notificationDelegate == null
                        Log.i("ReolinkCalls", "App-handled notification delivery ready=$disabled")
                        null
                    }
                    "equals" -> proxy === args?.get(0)
                    "hashCode" -> System.identityHashCode(proxy)
                    "toString" -> "Doorbell notification delivery setup"
                    else -> null
                }
            }
            NativeApi.type("com.google.android.gms.tasks.Task").getMethod("addOnCompleteListener", listenerType)
                .invoke(task, listener)
        } catch (error: Throwable) {
            Log.w("ReolinkCalls", "Notification delivery setup unavailable: ${error.javaClass.simpleName}")
        }
    }

    @JvmStatic
    fun onSdkMessage(context: Context, intent: Intent?): Boolean {
        if (nativeFallback.get() == true) return false
        val extras = intent?.extras ?: return false
        // Only typed classification flags are logged: never UID, names, addresses, tokens or payloads.
        Log.i("ReolinkCalls", "FCM dispatch version=${DoorbellEvents.diagnostic(extras.getString("pushVersion"))}" +
            " type=${DoorbellEvents.diagnostic(extras.getString("type") ?: extras.getString("ALMTYPE"))}" +
            " doorphone=${extras.getString("doorphone") == "1"}" +
            " notification=${extras.getString("gcm.n.e") == "1"}")
        return try {
            val message = NativeApi.type("com.google.firebase.messaging.RemoteMessage")
                .getConstructor(Bundle::class.java).newInstance(Bundle(extras))
            onMessage(context, message)
        } catch (error: Throwable) {
            Log.w("ReolinkCalls", "FCM handoff unavailable: ${error.javaClass.simpleName}")
            false
        }
    }

    @JvmStatic
    fun onMessage(context: Context, remoteMessage: Any): Boolean {
        if (nativeFallback.get() == true) return false
        try {
            val extras = (NativeApi.call(remoteMessage, "toIntent") as Intent).extras ?: return false
            if (extras.getString("PUSH_DATA_KEY_TYPE") == "check_push") return false
            val push = NativeApi.call(NativeApi.singleton("com.reolink.push.PushMessageFactory"),
                "createPushMessage", extras) ?: return false
            val type = NativeApi.call(push, "getType") as? String
            val nativeCall = NativeApi.call(push, "getDoorPhone") == true &&
                (NativeApi.call(push, "getPushHandleType") as? Enum<*>)?.name == "CallDoorbell"
            val duplicate = NativeApi.call(push, "getDup") == true
            Log.i("ReolinkCalls", "Push classification type=${DoorbellEvents.diagnostic(type)} nativeCall=$nativeCall duplicate=$duplicate")
            if (!DoorbellEvents.isRing(nativeCall, type) || duplicate) return false
            // Match the native onMessage account policy before taking over presentation.
            if (NativeApi.call(push, "isCloudAccountPush") == true) {
                val account = NativeApi.instance("com.android.bc.account.AccountManager")
                if (NativeApi.call(account, "isLogin") != true ||
                    NativeApi.call(push, "getReceiverUserId") != NativeApi.call(account, "getID")) {
                    Log.i("ReolinkCalls", "Call skipped: native account policy")
                    return false
                }
            }
            if (context.checkSelfPermission(Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
                Log.i("ReolinkCalls", "Call skipped: microphone permission")
                return false // Keep the native permission/notification route until the owner grants access.
            }
            val uid = NativeApi.call(push, "getUid") as? String ?: run {
                Log.i("ReolinkCalls", "Call skipped: device identity absent")
                return false
            }
            val channelIds = NativeApi.call(push, "getChannel") as? String
            val messageId = NativeApi.call(push, "getMessageId")?.toString()
                ?: NativeApi.call(remoteMessage, "getMessageId") as? String
                // The native notification path also falls back to this instance identity when no ID exists.
                ?: "instance:${remoteMessage.hashCode()}"
            val device = NativeApi.call(NativeApi.instance("com.android.bc.devicemanager.DeviceManager"),
                "getDeviceByUID", uid) ?: run {
                Log.i("ReolinkCalls", "Call skipped: native device lookup")
                return false
            }
            val pushedChannels = NativeApi.call(device, "getPushChannels", channelIds) as? List<*>
            val channel = pushedChannels?.firstOrNull() ?: run {
                val channels = NativeApi.call(device, "getChannelListSorted") as? List<*>
                val explicit = NativeApi.call(push, "getChannelId") as? String
                val matched = channels?.singleOrNull {
                    it != null && explicit != null && NativeApi.call(it, "getChannelId").toString() == explicit
                }
                matched ?: channels?.singleOrNull() ?: run {
                    Log.i("ReolinkCalls", "Call skipped: channel unresolved maskPresent=${!channelIds.isNullOrBlank()} explicitPresent=${explicit != null}")
                    return false
                }
            }
            fun hash(value: String) = MessageDigest.getInstance("SHA-256").digest(value.toByteArray())
                .joinToString("") { "%02x".format(it.toInt() and 255) }
            val nativeChannel = NativeApi.call(channel, "getChannelId").toString()
            val digest = hash("$uid/$nativeChannel/$messageId")
            val address = hash("$uid/$nativeChannel") // Stable resolved doorbell identity, not its optional wire mask.
            val name = (NativeApi.call(push, "getDeviceName") as? String)?.takeIf { it.isNotBlank() }
                ?: (NativeApi.call(push, "getTitle") as? String)?.takeIf { it.isNotBlank() } ?: "Reolink doorbell"
            val event = DoorbellEvent(digest, address, name, device, channel, context, remoteMessage, remoteMessage.hashCode())
            synchronized(this) {
                val now = SystemClock.elapsedRealtime()
                seen.entries.removeAll { now - it.value > 300_000 }
                if (digest in seen) return true
                if (pending != null) return false // Native SDK owns one talk session; don't steal another call.
                pending = event
                seen[digest] = now
                while (seen.size > 64) seen.remove(seen.keys.first())
                try {
                    context.startForegroundService(Intent(context, ReolinkCallService::class.java)
                        .putExtra(ReolinkCallService.KEY, digest))
                    Log.i("ReolinkCalls", "Doorbell handed to call service")
                } catch (error: RuntimeException) {
                    pending = null
                    seen.remove(digest)
                    throw error
                }
            }
            return true
        } catch (error: Throwable) {
            Log.w("ReolinkCalls", "Native call handoff unavailable: ${error.javaClass.simpleName}")
            return false
        }
    }

    @Synchronized internal fun event(key: String?): DoorbellEvent? = pending?.takeIf { it.key == key }
    @Synchronized internal fun finished(key: String) { if (pending?.key == key) pending = null }

    internal fun fallback(event: DoorbellEvent) {
        try {
            nativeFallback.set(true)
            // Resume the original SDK presentation only. Its receipt/ack/dedup step already ran upstream.
            val dispatch = NativeApi.type("com.google.firebase.messaging.FirebaseMessagingService")
                .getDeclaredMethod("dispatchMessage", Intent::class.java).apply { isAccessible = true }
            dispatch.invoke(event.context, NativeApi.call(event.remoteMessage, "toIntent"))
        }
        catch (error: Throwable) { Log.w("ReolinkCalls", "Native notification fallback failed: ${error.javaClass.simpleName}") }
        finally { nativeFallback.remove() }
    }
}
