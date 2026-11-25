package nl.johninnl.reolink.calls

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioTrack
import android.os.SystemClock
import com.android.bc.devicemanager.BCAudioData
import com.android.bc.devicemanager.Channel
import com.android.bc.devicemanager.ChannelTalkStateObserver
import java.lang.reflect.Proxy
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean

/** Owns a talk session and its PCM endpoints, never a player Activity or rendering surface. */
internal class NativeAudioSession(private val event: DoorbellEvent, private val ended: () -> Unit) : AutoCloseable {
    private val closed = AtomicBoolean()
    private val muted = AtomicBoolean()
    private val talkReady = CountDownLatch(1)
    private val talkFailed = AtomicBoolean()
    private var recorder: Any? = null
    private var observerAdded = false
    @Volatile private var ownsTalk = false
    @Volatile private var requestedTalk = false
    private var stream: Any? = null
    private var streamListener: Any? = null
    private var ownsStream = false
    @Volatile private var mixedAudio = false
    private var track: AudioTrack? = null
    private var trackFormat: Pair<Int, Int>? = null
    @Volatile var answered = false
        private set
    @Volatile var receivedFrames = 0L
        private set
    @Volatile var sentFrames = 0L
        private set

    private val talkObserver = object : ChannelTalkStateObserver() {
        override fun talkStateChange(channel: Channel) {
            if (channel !== event.channel || closed.get()) return
            try {
                val state = NativeApi.call(channel, "getTalkStateFromSDK") as Int
                if (state == 2) talkReady.countDown()
                else if (ownsTalk && state != 1) {
                    talkFailed.set(true)
                    talkReady.countDown()
                    if (answered) ended()
                }
            } catch (_: Throwable) { ended() }
        }
        override fun talkMixAudioDataChange(channel: Channel, audio: BCAudioData) {
            if (channel === event.channel && mixedAudio) receive(audio)
        }
    }

    fun prepare() {
        synchronized(this) {
            check(!closed.get())
            check((NativeApi.call(event.channel, "getTalkStateFromSDK") as Int) !in 1..2) {
                "Another native talk session owns this channel"
            }
            NativeApi.call(event.channel, "addObserver", talkObserver)
            observerAdded = true
            NativeApi.call(event.device, "openDeviceAsync")
        }
        val until = SystemClock.elapsedRealtime() + 15_000
        while (NativeApi.call(event.device, "getDeviceState").toString() != "BC_DEVICE_STATE_OPEN_SUCCEED") {
            check(!closed.get() && SystemClock.elapsedRealtime() < until) { "Native device login unavailable" }
            Thread.sleep(50)
        }
        synchronized(this) {
            check(!closed.get())
            val bean = NativeApi.call(event.channel, "getChannelBean")!!
            val ability = NativeApi.call(bean, "getTalkAbility")!!
            mixedAudio = NativeApi.call(ability, "isSupportMixAudioStream") == true
            if (!mixedAudio) prepareLegacyReceiveStream()
        }
    }

    private fun prepareLegacyReceiveStream() {
        val manager = NativeApi.singleton("com.android.bc.devicemanager.stream.StreamManager")
        val normal = NativeApi.type("com.android.bc.devicemanager.stream.StreamGroup\$Type").getField("NORMAL").get(null)
        val owner = NativeApi.call(manager, "getChannelStreamWithType", event.channel, normal)!!
        val live = NativeApi.call(owner, "getLiveStream")!!
        stream = live
        ownsStream = NativeApi.call(live, "isOpen") != true
        val listenerType = NativeApi.type("com.android.bc.devicemanager.stream.IStreamGroupListener")
        val listener = Proxy.newProxyInstance(listenerType.classLoader, arrayOf(listenerType)) { proxy, method, args ->
            when (method.name) {
                "onAudioDataChange" -> { if (!mixedAudio && args?.get(0) === live) receive(args[1]!!); null }
                "equals" -> proxy === args?.get(0)
                "hashCode" -> System.identityHashCode(proxy)
                "toString" -> "Reolink call audio receiver"
                else -> null // In particular, video frame callbacks have no renderer.
            }
        }
        streamListener = listener
        NativeApi.call(live, "observeStream", listener)
        NativeApi.call(NativeApi.instance("com.android.bc.realplay.PreviewCenter"), "startFluent", live)
    }

    /** Called from an IO coroutine; Telecom's remote-answer deadline remains bounded. */
    @Synchronized fun answer(deadline: Long) {
        check(!closed.get())
        if (answered) return
        val opened = CountDownLatch(1)
        var error: Throwable? = null
        requestedTalk = true
        NativeApi.call(event.device, "post", Runnable {
            try {
                check(!closed.get())
                check(NativeApi.call(event.channel, "talkOpen") == true) { "Native doorbell rejected talk" }
                ownsTalk = true
                if (closed.get()) {
                    NativeApi.call(event.channel, "talkClose")
                    ownsTalk = false
                    return@Runnable
                }
                if (NativeApi.call(event.channel, "getTalkStateFromSDK") == 2) talkReady.countDown()
            } catch (failure: Throwable) { error = failure }
            finally { opened.countDown() }
        })
        check(opened.await(minOf(2_000, (deadline - SystemClock.elapsedRealtime()).coerceAtLeast(0)), TimeUnit.MILLISECONDS)) {
            "Native doorbell answer timed out"
        }
        error?.let { throw it }
        check(talkReady.await(minOf(1_000, (deadline - SystemClock.elapsedRealtime()).coerceAtLeast(0)), TimeUnit.MILLISECONDS)
            && !talkFailed.get() && !closed.get()) {
            "Native doorbell did not enter talk state"
        }
        val ability = NativeApi.call(NativeApi.call(event.channel, "getChannelBean")!!, "getTalkAbility")!!
        check((NativeApi.call(ability, "getConfigSize") as Int) > 0)
        val config = NativeApi.call(ability, "getConfig")!!
        // Use Reolink's Java recorder/AEC path, whose AudioRecord source is VOICE_COMMUNICATION.
        // This avoids changing the global JNI/Oboe engine or other camera-player sessions.
        val recorderType = NativeApi.type("com.android.bc.component.BCAudioRecord")
        val constructor = recorderType.getDeclaredConstructor(Boolean::class.javaPrimitiveType).apply { isAccessible = true }
        val capture = constructor.newInstance(false)
        recorder = capture
        val delegateType = NativeApi.type("com.android.bc.component.BCAudioRecord\$IRecordDelegate")
        val delegate = Proxy.newProxyInstance(delegateType.classLoader, arrayOf(delegateType)) { proxy, method, args ->
            when (method.name) {
                "recordDataUpdate" -> {
                    if (!closed.get() && !muted.get() && NativeApi.call(event.channel, "getTalkStateFromSDK") == 2) {
                        if (NativeApi.call(event.channel, "talkSend", args!![0], args[1]) == true) sentFrames++
                        else ended()
                    }
                    null
                }
                "equals" -> proxy === args?.get(0)
                "hashCode" -> System.identityHashCode(proxy)
                "toString" -> "Reolink call microphone"
                else -> null
            }
        }
        val result = NativeApi.call(capture, "startRecord", true,
            NativeApi.call(event.channel, "isSD20") == true,
            if (NativeApi.call(config, "getSoundTrack") == 0) 2 else 3,
            if (NativeApi.call(config, "getSamplePrecision") == 8) 3 else 2,
            NativeApi.call(config, "getSampleRate"), delegate) as Int
        check(result >= 0 && NativeApi.call(capture, "getIsRecording") == true) { "Doorbell microphone could not start" }
        answered = true
    }

    fun setMuted(value: Boolean) { muted.set(value) }

    private fun receive(audio: Any) {
        try { receiveFrame(audio) } catch (_: Throwable) { ended() }
    }

    @Synchronized private fun receiveFrame(audio: Any) {
        if (closed.get() || !answered) return
        val rate = NativeApi.call(audio, "getSampleRate") as Int
        val channels = NativeApi.call(audio, "getChannels") as Int
        val bytes = NativeApi.call(audio, "getMedia") as ByteArray
        val length = NativeApi.call(audio, "getLength") as Int
        if (rate !in 8000..192000 || channels !in 1..2 || length !in 1..bytes.size) return
        val format = rate to channels
        if (track == null || trackFormat != format) {
            track?.let { it.stop(); it.release() }
            val mask = if (channels == 1) AudioFormat.CHANNEL_OUT_MONO else AudioFormat.CHANNEL_OUT_STEREO
            val buffer = AudioTrack.getMinBufferSize(rate, mask, AudioFormat.ENCODING_PCM_16BIT)
            check(buffer > 0)
            track = AudioTrack.Builder()
                .setAudioAttributes(AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_VOICE_COMMUNICATION)
                    .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build())
                .setAudioFormat(AudioFormat.Builder().setSampleRate(rate).setChannelMask(mask)
                    .setEncoding(AudioFormat.ENCODING_PCM_16BIT).build())
                .setTransferMode(AudioTrack.MODE_STREAM).setBufferSizeInBytes(buffer * 2).build().also { it.play() }
            trackFormat = format
        }
        val written = track!!.write(bytes, 0, length, AudioTrack.WRITE_NON_BLOCKING)
        if (written > 0) {
            receivedFrames++
            recorder?.let { NativeApi.call(it, "farEndBuffer", bytes, 0, written) }
        } else if (written < 0) ended()
    }

    @Synchronized override fun close() {
        if (!closed.compareAndSet(false, true)) return
        answered = false
        muted.set(true)
        talkReady.countDown()
        var failure: Throwable? = null
        fun release(action: () -> Unit) { try { action() } catch (error: Throwable) { if (failure == null) failure = error } }
        recorder?.let { capture ->
            release { NativeApi.call(capture, "stopRecord") }
            release { NativeApi.call(capture, "release") }
        }
        recorder = null
        if (requestedTalk) release {
            NativeApi.call(event.device, "post", Runnable {
                if (ownsTalk) { NativeApi.call(event.channel, "talkClose"); ownsTalk = false }
            })
        }
        if (observerAdded) release { NativeApi.call(event.channel, "deleteObserver", talkObserver) }
        stream?.let { live ->
            streamListener?.let { listener -> release { NativeApi.call(live, "removeObserver", listener) } }
            if (ownsStream) release {
                val getter = NativeApi.type("com.android.bc.devicemanager.stream.StreamGroup")
                    .getDeclaredMethod("getListener").apply { isAccessible = true }
                // A native UI can take over the borrowed engine. Don't close a stream still observed by it.
                if ((getter.invoke(live) as Collection<*>).isEmpty()) NativeApi.call(live, "closeStream")
            }
        }
        track?.let { playback -> release { playback.stop() }; release { playback.release() } }
        track = null
        failure?.let { throw it }
    }
}
