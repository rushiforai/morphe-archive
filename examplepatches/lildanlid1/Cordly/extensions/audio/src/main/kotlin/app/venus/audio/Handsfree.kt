package app.venus.audio

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import org.json.JSONObject
import java.io.File

/**
 * Keep Bluetooth audio clear in calls (#98). Bluetooth headphones have two ways to carry sound: A2DP (music quality,
 * playback only) and hands-free/SCO (a narrow two-way phone line that sounds muffled). Discord moves them to hands-free
 * whenever you join a call, voice channel or Stage, even when you never talk: it puts the phone in call mode
 * (MODE_IN_COMMUNICATION) and then starts SCO (startBluetoothSco on Android 12 and older, setCommunicationDevice with
 * the SCO device on Android 13 and newer). In call mode Android also stops sending any audio to A2DP.
 *
 * While the switch is on and A2DP headphones are connected, Discord's calls to those AudioManager methods come here
 * instead: the phone stays out of call mode and SCO never starts, so Android keeps sending Discord's voice audio to the
 * headphones over A2DP, and your phone's own microphone picks up your voice. Without A2DP headphones, or with the switch
 * off, every call goes straight to Android as before.
 *
 * The setting is read again each time Discord starts a call, so turning it on or off applies from the next call without
 * reopening Discord. Only Java/Android APIs: the host's Kotlin helpers are obfuscated.
 */
object Handsfree {
    private const val PREFS = "venus-patches.json"
    private const val MAX_PREFS = 4 * 1024 * 1024
    private const val KEY = "noHandsfree"

    @Volatile
    private var appContext: Context? = null
    /** The saved switch, as read when the current call started. */
    @Volatile
    private var enabled = false

    /** Remembers Discord's application, right after Application.onCreate's super call. Reads nothing. */
    @JvmStatic
    fun init(context: Context?) {
        appContext = context?.applicationContext ?: context
    }

    /** AudioManager.setMode: call mode is skipped while A2DP headphones are connected and the switch is on. */
    @JvmStatic
    fun setMode(manager: AudioManager, mode: Int) {
        if (mode == AudioManager.MODE_IN_COMMUNICATION) {
            enabled = readSetting()
            if (keepA2dp(manager)) {
                // Discord may have left call mode on from an earlier call; music-quality audio needs normal mode.
                if (manager.mode == AudioManager.MODE_IN_COMMUNICATION) manager.mode = AudioManager.MODE_NORMAL
                return
            }
        }
        manager.mode = mode
    }

    /** AudioManager.startBluetoothSco (Android 12 and older): the hands-free link is never opened while it applies. */
    @JvmStatic
    fun startBluetoothSco(manager: AudioManager) {
        if (keepA2dp(manager)) { leaveCallMode(manager); return }
        manager.startBluetoothSco()
    }

    /**
     * AudioManager.setCommunicationDevice (Android 13 and newer): choosing the headphones' hands-free (SCO) device is
     * refused while it applies, which leaves the sound on A2DP. Any other choice (speaker, earpiece, a wired headset) is
     * passed on, so picking an output in Discord still works.
     */
    @JvmStatic
    fun setCommunicationDevice(manager: AudioManager, device: AudioDeviceInfo?): Boolean {
        if (device != null && device.type == AudioDeviceInfo.TYPE_BLUETOOTH_SCO && keepA2dp(manager)) {
            leaveCallMode(manager)
            return false
        }
        return manager.setCommunicationDevice(device!!)
    }

    /** Headphones that connect in the middle of a call: drop call mode so their A2DP side carries the sound. */
    private fun leaveCallMode(manager: AudioManager) {
        try {
            if (manager.mode == AudioManager.MODE_IN_COMMUNICATION) manager.mode = AudioManager.MODE_NORMAL
        } catch (_: Throwable) { }
    }

    private fun keepA2dp(manager: AudioManager): Boolean {
        if (!enabled) return false
        return try {
            val outputs = manager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)
            var found = false
            for (device in outputs) if (device.type == AudioDeviceInfo.TYPE_BLUETOOTH_A2DP) { found = true; break }
            found
        } catch (_: Throwable) { false }
    }

    /**
     * Whether the saved settings turn this on. Cordly writes them with JSON.stringify, so a file without
     * `"noHandsfree":true` (the switch off, the common case) needs no JSON parsing. Any problem means off.
     */
    private fun readSetting(): Boolean = try {
        val context = appContext
        val file = if (context == null) null else File(context.filesDir, PREFS)
        if (file == null || !file.isFile || file.length() > MAX_PREFS) false
        else {
            val text = String(java.nio.file.Files.readAllBytes(file.toPath()), java.nio.charset.StandardCharsets.UTF_8)
            @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN", "CAST_NEVER_SUCCEEDS")
            val raw = text as java.lang.String
            if (raw.indexOf("\"$KEY\":true") < 0) false else JSONObject(text).optBoolean(KEY, false)
        }
    } catch (_: Throwable) { false }
}
