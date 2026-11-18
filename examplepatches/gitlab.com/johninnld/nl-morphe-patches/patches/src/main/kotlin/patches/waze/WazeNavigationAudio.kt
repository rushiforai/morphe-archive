package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import patches.shared.PROVIDER_AUDIO
import patches.shared.gateProviderAudio
import patches.shared.replaceAudioCalls
import patches.shared.trackProviderAudio

context(context: BytecodePatchContext)
internal fun bindWazeNavigationAudio() {
    fun method(owner: String, name: String, result: String, vararg parameters: String) =
        Fingerprint(definingClass = owner, name = name, returnType = result, parameters = parameters.toList()).method
    // Resolve the entire reviewed native cohort before adding any gate.
    val file = method("Lcom/waze/sound/dy;", "g", "V", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Lg/h/a/a;")
    val url = method("Lcom/waze/sound/dy;", "l", "V", "Ljava/lang/String;", "Ljava/lang/String;", "Lg/h/a/a;")
    val system = method("Lcom/waze/sound/dy;", "h", "V", "Ljava/lang/String;")
    val predicate = method("Lcom/waze/sound/ex;", "A", "Z", "Lcom/waze/sound/ff;")
    val speech = method("Lcom/waze/sound/m;", "c", "Ljava/lang/Object;", "Ljava/lang/String;", "Z", "Lg/d/e;")
    val listener = method("Lcom/waze/sound/m;", "d", "Ljava/lang/Object;", "Lcom/waze/sound/m;", "Landroid/content/Context;", "Ljava/lang/String;", "Lg/d/e;")
    val volume = method("Lcom/waze/sound/er;", "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;")
    val osPlayer = method("Lcom/waze/sound/dx;", "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;")
    val constructor = Fingerprint(definingClass = "Lcom/waze/sound/ex;", name = "<init>").method
    check(context.mutableClassDefBy("Lcom/waze/sound/f;").fields.any { it.name == "a" && it.type == "Lcom/waze/sound/f;" })
    method("Lcom/waze/sound/p;", "a", "V")
    gateProviderAudio(file, 5, "void"); gateProviderAudio(url, 3, "void"); gateProviderAudio(system, -1, "void")
    gateProviderAudio(predicate, -1, "true")
    replaceAudioCalls(volume, "Landroidx/media3/exoplayer/ExoPlayer;->setVolume(F)V", "$PROVIDER_AUDIO->volume(Ljava/lang/Object;F)V", 2)
    replaceAudioCalls(osPlayer, "Landroid/media/MediaPlayer;->start()V", "$PROVIDER_AUDIO->start(Landroid/media/MediaPlayer;)V", 1)
    replaceAudioCalls(speech, "Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I",
        "$PROVIDER_AUDIO->speak(Landroid/speech/tts/TextToSpeech;Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I", 1)
    replaceAudioCalls(speech, "Landroid/speech/tts/TextToSpeech;->synthesizeToFile(Ljava/lang/CharSequence;Landroid/os/Bundle;Ljava/io/File;Ljava/lang/String;)I",
        "$PROVIDER_AUDIO->synthesize(Landroid/speech/tts/TextToSpeech;Ljava/lang/CharSequence;Landroid/os/Bundle;Ljava/io/File;Ljava/lang/String;)I", 1)
    replaceAudioCalls(listener, "Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I",
        "$PROVIDER_AUDIO->setListener(Landroid/speech/tts/TextToSpeech;Landroid/speech/tts/UtteranceProgressListener;)I", 1)
    trackProviderAudio(constructor, 2, "trackWazeFocus")
}
