package app.hoitruyenchu.patches.itruyenchu.audio.tts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal const val SPEECH_MODULE = "Lexpo/modules/speech/SpeechModule;"
internal const val SPEECH_OPTIONS = "Lexpo/modules/speech/SpeechOptions;"
internal const val TEXT_TO_SPEECH = "Landroid/speech/tts/TextToSpeech;"

/** Classes of expo-speech: SpeechModule itself and its lambdas / inner classes. */
private fun isSpeechModuleClass(type: String) =
    type == SPEECH_MODULE || type.startsWith("Lexpo/modules/speech/SpeechModule$")

/** private val textToSpeech: TextToSpeech by lazy { ... } */
internal object GetTextToSpeechFingerprint : Fingerprint(
    definingClass = SPEECH_MODULE,
    name = "getTextToSpeech",
    returnType = TEXT_TO_SPEECH,
    parameters = listOf(),
)

/** private val isTextToSpeechReady get() = _ttsReady */
internal object IsTextToSpeechReadyFingerprint : Fingerprint(
    definingClass = SPEECH_MODULE,
    name = "isTextToSpeechReady",
    returnType = "Z",
    parameters = listOf(),
)

/** private fun speakOut(id: String, text: String, options: SpeechOptions) */
internal object SpeakOutFingerprint : Fingerprint(
    definingClass = SPEECH_MODULE,
    name = "speakOut",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", SPEECH_OPTIONS),
)

/** private fun getVoices(): List<VoiceRecord> */
internal object GetVoicesFingerprint : Fingerprint(
    definingClass = SPEECH_MODULE,
    name = "getVoices",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

/** AsyncFunction("stop") { textToSpeech.stop() } */
internal object StopSpeechFingerprint : Fingerprint(
    filters = listOf(
        methodCall(definingClass = TEXT_TO_SPEECH, name = "stop", returnType = "I"),
    ),
    custom = { _, classDef -> isSpeechModuleClass(classDef.type) },
)

/** OnActivityDestroys { textToSpeech.shutdown() } */
internal object ShutdownSpeechFingerprint : Fingerprint(
    filters = listOf(
        methodCall(definingClass = TEXT_TO_SPEECH, name = "shutdown", returnType = "V"),
    ),
    custom = { _, classDef -> isSpeechModuleClass(classDef.type) },
)
