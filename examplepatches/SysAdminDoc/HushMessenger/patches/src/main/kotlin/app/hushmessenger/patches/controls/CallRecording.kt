package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Records a call (#105). Messenger's calls run on native audio threads with no Java recorder to tap, but the native side
 * calls a Java sink for each stream it's given. Nothing in Messenger hands it one, so the extension does, using the audio
 * API Messenger's own proxy receives when a call starts.
 */
internal const val CALL_RECORDING = "call_recording"
internal const val CALL_RECORDING_API_CALL = "Lapp/hushmessenger/extension/CallRecording;->api(Ljava/lang/Object;)V"
internal const val CALL_RECORDING_ACTIVE_CALL = "Lapp/hushmessenger/extension/CallRecording;->active(Z)V"

private const val AUDIO_PROXY = "Lcom/facebook/rsys/audio/gen/AudioProxy;"
private const val AUDIO_API = "Lcom/facebook/rsys/audio/gen/AudioApi;"

/** The proxy's method that takes the call's audio API. */
internal fun Method.isCallAudioApi(): Boolean = name == "setApi" && returnType == "V" &&
    parameterTypes.map { it.toString() } == listOf(AUDIO_API) && implementation != null

/** The proxy's method that says whether a call is running. */
internal fun Method.isCallActiveSetter(): Boolean = name == "setIsCallActive" && returnType == "V" &&
    parameterTypes.map { it.toString() } == listOf("Z") && implementation != null

/**
 * Both methods of the proxy Messenger's calls run on. It only keeps the API, so its setIsCallActive is empty. The proxy with
 * a real one looks more like the answer, but only Meta AI's voice sessions build it, and a call never reaches it.
 */
internal fun findCallRecording(classes: Iterable<ClassDef>): List<Method> {
    val parents = classes.associate { it.type to it.superclass }
    fun isProxy(type: String): Boolean {
        var parent = parents[type]
        var hops = 0
        while (parent != null && hops++ < 8) {
            if (parent == AUDIO_PROXY) return true
            parent = parents[parent]
        }
        return false
    }
    val proxies = classes.filter { isProxy(it.type) }.mapNotNull { proxy ->
        val api = proxy.methods.singleOrNull { it.isCallAudioApi() } ?: return@mapNotNull null
        val active = proxy.methods.singleOrNull { it.isCallActiveSetter() } ?: return@mapNotNull null
        if (active.implementation!!.instructions.count() != 1) return@mapNotNull null
        listOf(api, active)
    }
    return proxies.singleOrNull() ?: emptyList()
}

internal fun MutableMethod.validateCallRecording() {
    if (!isCallAudioApi() && !isCallActiveSetter()) {
        throw PatchException("Messenger controls: the call's audio proxy changed (no audio method in ${hookId()})")
    }
}

/** Only notes the API and the call's state. Nothing touches the call's audio until someone taps Record. */
internal fun MutableMethod.injectCallRecording() {
    validateCallRecording()
    val value = parameterRegister(1)
    val call = if (isCallAudioApi()) CALL_RECORDING_API_CALL else CALL_RECORDING_ACTIVE_CALL
    addInstructions(0, "invoke-static/range {v$value .. v$value}, $call")
}
