package nl.johninnl.reolink.calls

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.content.pm.ServiceInfo
import android.net.Uri
import android.os.Build
import android.os.IBinder
import android.os.SystemClock
import android.telecom.DisconnectCause
import android.util.Log
import androidx.core.telecom.CallAttributesCompat
import androidx.core.telecom.CallControlResult
import androidx.core.telecom.CallControlScope
import androidx.core.telecom.CallsManager
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.async
import kotlinx.coroutines.cancel
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeout
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock

/** Private component injected by the patch; Android Auto controls the registered Telecom call. */
class ReolinkCallService : Service() {
    companion object {
        internal const val KEY = "reolink_call_key"
        private const val ANSWER = "nl.johninnl.reolink.calls.ANSWER"
        private const val END = "nl.johninnl.reolink.calls.END"
        private const val CHANNEL = "morphe_doorbell_calls"
        private const val NOTIFICATION = 29175
    }
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate)
    private var event: DoorbellEvent? = null
    private var native: NativeAudioSession? = null
    private var controls: CallControlScope? = null
    private var callJob: Job? = null
    private var pendingAction: String? = null
    private var accepting = false
    private val answerLock = Mutex()

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == ANSWER || intent?.action == END) {
            if (event?.key == intent.getStringExtra(KEY)) {
                pendingAction = intent.action
                performPendingAction()
            }
            if (event == null) stopSelf()
            return START_NOT_STICKY
        }
        if (callJob != null) return START_NOT_STICKY
        val incoming = DoorbellCalls.event(intent?.getStringExtra(KEY))
        if (incoming == null) { stopSelf(); return START_NOT_STICKY }
        event = incoming
        try {
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(NotificationChannel(CHANNEL, "Doorbell calls", NotificationManager.IMPORTANCE_HIGH))
            val notification = notification(incoming, false)
            if (Build.VERSION.SDK_INT >= 29) startForeground(NOTIFICATION, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_PHONE_CALL)
            else startForeground(NOTIFICATION, notification)
            callJob = scope.launch { runCall(incoming) }
        } catch (error: RuntimeException) {
            Log.w("ReolinkCalls", "Call service start failed: ${error.javaClass.simpleName}")
            DoorbellCalls.fallback(incoming)
            DoorbellCalls.finished(incoming.key)
            stopSelf()
        }
        return START_NOT_STICKY
    }

    private suspend fun runCall(incoming: DoorbellEvent) {
        var admitted = false
        val session = NativeAudioSession(incoming) {
            scope.launch { disconnect(DisconnectCause.REMOTE) }
        }
        native = session
        val ready = scope.async(Dispatchers.IO) { session.prepare() }
        suspend fun answer() = answerLock.withLock {
            if (!session.answered) {
                accepting = true
                val deadline = SystemClock.elapsedRealtime() + 4_000
                try {
                    withTimeout(4_000) {
                        ready.await()
                        withContext(Dispatchers.IO) { session.answer(deadline) }
                    }
                    getSystemService(NotificationManager::class.java).notify(NOTIFICATION, notification(incoming, true))
                } finally { accepting = false }
            }
        }
        // Both the phone's explicit notification action and remote surfaces use this same native answer.
        answerNative = { answer() }
        try {
            val calls = CallsManager(TelecomContext(this))
            calls.registerAppWithTelecom(CallsManager.CAPABILITY_BASELINE)
            Log.i("ReolinkCalls", "Telecom account registered")
            calls.addCall(
                CallAttributesCompat(incoming.displayName, Uri.parse("reolink-doorbell:${incoming.address}"),
                    CallAttributesCompat.DIRECTION_INCOMING, CallAttributesCompat.CALL_TYPE_AUDIO_CALL,
                    callCapabilities = 0),
                onAnswer = { type ->
                    check(type == CallAttributesCompat.CALL_TYPE_AUDIO_CALL)
                    try { answer() }
                    catch (error: Throwable) {
                        scope.launch { disconnect(DisconnectCause.LOCAL) }
                        throw error
                    }
                },
                onDisconnect = { withContext(Dispatchers.IO) { session.close() } },
                onSetActive = { check(session.answered) },
                onSetInactive = {
                    // The native SDK does not expose hold. Release the microphone rather than claiming it.
                    withContext(Dispatchers.IO) { session.close() }
                    throw UnsupportedOperationException("Doorbell hold is not supported")
                },
            ) {
                admitted = true
                controls = this
                Log.i("ReolinkCalls", "Telecom incoming call admitted")
                scope.launch { isMuted.collect { session.setMuted(it) } }
                scope.launch {
                    delay(20_000) // Same unanswered-call timeout as Reolink's doorbell activity.
                    if (!session.answered && !accepting) disconnect(DisconnectCause.MISSED)
                }
                performPendingAction()
            }
        } catch (error: CancellationException) {
            throw error
        } catch (error: Throwable) {
            Log.w("ReolinkCalls", "Telecom call failed: ${error.javaClass.simpleName}")
            if (!admitted) DoorbellCalls.fallback(incoming)
        } finally {
            ready.cancel()
            controls = null
            answerNative = null
            withContext(kotlinx.coroutines.NonCancellable + Dispatchers.IO) {
                try { session.close() }
                catch (error: Throwable) { Log.w("ReolinkCalls", "Call cleanup failed: ${error.javaClass.simpleName}") }
            }
            DoorbellCalls.finished(incoming.key)
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
        }
    }

    private var answerNative: (suspend () -> Unit)? = null
    private fun performPendingAction() {
        val control = controls ?: return
        val action = pendingAction ?: return
        pendingAction = null
        scope.launch {
            if (action == END) disconnect(if (native?.answered == true) DisconnectCause.LOCAL else DisconnectCause.REJECTED)
            else try {
                answerNative?.invoke() ?: error("Native answer unavailable")
                check(control.answer(CallAttributesCompat.CALL_TYPE_AUDIO_CALL) is CallControlResult.Success)
            } catch (error: Throwable) {
                Log.w("ReolinkCalls", "Answer failed: ${error.javaClass.simpleName}")
                disconnect(DisconnectCause.LOCAL)
            }
        }
    }

    private suspend fun disconnect(cause: Int) {
        try { native?.let { withContext(Dispatchers.IO) { it.close() } } }
        catch (error: Throwable) { Log.w("ReolinkCalls", "Native disconnect failed: ${error.javaClass.simpleName}") }
        try {
            val control = controls
            if (control == null) callJob?.cancel()
            else if (control.disconnect(DisconnectCause(cause)) !is CallControlResult.Success) callJob?.cancel()
        } catch (error: Throwable) {
            Log.w("ReolinkCalls", "Telecom disconnect failed: ${error.javaClass.simpleName}")
            callJob?.cancel()
        }
    }

    private fun notification(incoming: DoorbellEvent, active: Boolean): Notification {
        fun action(name: String): PendingIntent = PendingIntent.getService(this, name.hashCode(),
            Intent(this, ReolinkCallService::class.java).setAction(name).putExtra(KEY, incoming.key),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        return CallNotifications.build(this, CHANNEL, incoming.displayName, active, action(ANSWER), action(END))
    }

    override fun onDestroy() {
        scope.cancel()
        // Close native media independently of coroutine cancellation or Telecom teardown.
        native?.let { session ->
            Thread({
                try { session.close() }
                catch (error: Throwable) { Log.w("ReolinkCalls", "Service cleanup failed: ${error.javaClass.simpleName}") }
            }, "reolink-call-cleanup").start()
        }
        event?.let { DoorbellCalls.finished(it.key) }
        stopForeground(STOP_FOREGROUND_REMOVE)
        super.onDestroy()
    }
}
