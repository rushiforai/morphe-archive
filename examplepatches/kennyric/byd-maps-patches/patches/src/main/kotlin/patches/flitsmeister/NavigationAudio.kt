package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import patches.shared.PROVIDER_AUDIO
import patches.shared.gateProviderAudio
import patches.shared.gateProviderQueue
import patches.shared.gateProviderBatch
import patches.shared.replaceAudioCalls
import patches.shared.trackProviderAudio

context(context: BytecodePatchContext)
internal fun bindFlitsmeisterNavigationAudio() {
    if (isFlitsmeister15()) {
        bindFlitsmeisterNavigationAudio15()
        return
    }
    val request = exact("Lt50;", "a", "V", "Ljava/lang/String;", "Ljava/lang/String;", "Lh4k;", "Z", "Z", "Z", "Lz39;").method
    val queue = exact("Lt50;", "j", "V", "Landroid/media/AudioAttributes;", "I", "Z", "Z", "Ljava/lang/Float;").method
    val batch = exact("Lt50;", "i", "V", "[Lt50\$c;").method
    val routing = listOf(exact("Lt50;", "e", "V", "Landroid/media/AudioAttributes;", "I", "Z").method) +
        listOf("l", "m", "n").map { exact("Lt50;", it).method }
    val constructor = exact("Lt50;", "<init>", "V", "Landroid/content/Context;").method
    val mediaFactory = exact("Ljd0\$a;", "a", "V", "Landroid/content/Context;", "Ljava/lang/String;", "Landroid/media/AudioAttributes;", "Z", "Z", "Ljava/lang/Float;", "Lz39;").method
    val prepared = exact("Ljd0;", "onPrepared", "V", "Landroid/media/MediaPlayer;").method
    val resume = exact("Lid0;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;").method
    val speech = exact("Lo50;", "invoke", "Ljava/lang/Object;").method
    val resetSpeech = exact("Lxd0;", "a").method
    val destroy = exact("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;", "onDestroy").method
    val mapListener = exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/AndroidSpeechPlayer;", "setSpeechListener", "V",
        "Lorg/maplibre/navigation/android/navigation/ui/v5/voice/SpeechListener;").method
    val mapSpeech = exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/AndroidSpeechPlayer;", "play", "V",
        "Lorg/maplibre/navigation/android/navigation/ui/v5/voice/SpeechAnnouncement;").method
    val focus = exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;", "requestFocus", "V").method
    exact("Lt50;", "k"); exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;", "abandonFocus")
    for ((owner, name, type) in listOf(Triple("Lt50;", "f", "Ljava/util/concurrent/LinkedBlockingQueue;"), Triple("Lt50;", "g", "Z"),
        Triple("Lt50;", "e", "Lxd0;"), Triple("Lxd0;", "b", "Landroid/speech/tts/TextToSpeech;"), Triple("Lt50\$c;", "f", "Lz39;"))) {
        check(context.mutableClassDefBy(owner).fields.any { it.name == name && it.type == type }) { "Changed native audio queue field $owner->$name" }
    }
    gateProviderAudio(request, 7, "void"); gateProviderQueue(queue); gateProviderAudio(mapSpeech, -1, "void")
    gateProviderBatch(batch); routing.forEach(::gateProviderQueue)
    trackProviderAudio(constructor, 0, "trackQueue")
    gateFlitsmeisterMapFocus(focus)
    replaceAudioCalls(mediaFactory, "Landroid/media/MediaPlayer;->setVolume(FF)V", "$PROVIDER_AUDIO->mediaVolume(Landroid/media/MediaPlayer;FF)V", 1)
    for (method in listOf(prepared, resume)) replaceAudioCalls(method, "Landroid/media/MediaPlayer;->start()V", "$PROVIDER_AUDIO->start(Landroid/media/MediaPlayer;)V", 1)
    replaceAudioCalls(speech, "Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I",
        "$PROVIDER_AUDIO->speak(Landroid/speech/tts/TextToSpeech;Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I", 1)
    replaceAudioCalls(speech, "Landroid/speech/tts/TextToSpeech;->synthesizeToFile(Ljava/lang/CharSequence;Landroid/os/Bundle;Ljava/io/File;Ljava/lang/String;)I",
        "$PROVIDER_AUDIO->synthesize(Landroid/speech/tts/TextToSpeech;Ljava/lang/CharSequence;Landroid/os/Bundle;Ljava/io/File;Ljava/lang/String;)I", 1)
    for ((method, count) in listOf(speech to 2, resetSpeech to 1, destroy to 1, mapListener to 1)) {
        replaceAudioCalls(method, "Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I",
            "$PROVIDER_AUDIO->setListener(Landroid/speech/tts/TextToSpeech;Landroid/speech/tts/UtteranceProgressListener;)I", count)
    }
    replaceAudioCalls(mapSpeech, "Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I",
        "$PROVIDER_AUDIO->legacySpeak(Landroid/speech/tts/TextToSpeech;Ljava/lang/String;ILjava/util/HashMap;)I", 1)
}

/** Bind the fallthrough to an instruction owned by this method. Prepending
 * tracking after a separately assembled local gate leaves its label behind.
 */
internal fun gateFlitsmeisterMapFocus(method: MutableMethod) {
    check(method.returnType == "V" && method.parameterTypes.isEmpty())
    check(checkNotNull(method.implementation).registerCount > 1)
    method.addInstruction(0, "nop")
    method.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p0}, $PROVIDER_AUDIO->trackMapFocus(Ljava/lang/Object;)V
        invoke-static {}, $PROVIDER_AUDIO->muted()Z
        move-result v0
        if-eqz v0, :native_audio
        return-void
    """.trimIndent(), ExternalLabel("native_audio", method.getInstruction(0)))
}

