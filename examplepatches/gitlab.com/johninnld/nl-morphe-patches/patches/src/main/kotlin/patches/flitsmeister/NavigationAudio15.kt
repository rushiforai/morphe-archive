package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import patches.shared.PROVIDER_AUDIO
import patches.shared.gateProviderAudio
import patches.shared.gateProviderQueue
import patches.shared.gateProviderBatch
import patches.shared.replaceAudioCalls
import patches.shared.trackProviderAudio

context(context: BytecodePatchContext)
internal fun bindFlitsmeisterNavigationAudio15() {
    val request = exact("Ls50;", "a", "V", "Ljava/lang/String;", "Ljava/lang/String;", "Ly9k;", "Z", "Z", "Z", "Ls39;").method
    val queue = exact("Ls50;", "j", "V", "Landroid/media/AudioAttributes;", "I", "Z", "Z", "Ljava/lang/Float;").method
    val batch = exact("Ls50;", "i", "V", "[Ls50\$c;").method
    val routing = listOf(exact("Ls50;", "e", "V", "Landroid/media/AudioAttributes;", "I", "Z").method) +
        listOf("l", "m", "n").map { exact("Ls50;", it).method }
    val constructor = exact("Ls50;", "<init>", "V", "Landroid/content/Context;").method
    val mediaFactory = exact("Ljd0\$a;", "a", "V", "Landroid/content/Context;", "Ljava/lang/String;", "Landroid/media/AudioAttributes;", "Z", "Z", "Ljava/lang/Float;", "Ls39;").method
    val prepared = exact("Ljd0;", "onPrepared", "V", "Landroid/media/MediaPlayer;").method
    val resume = exact("Lid0;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;").method
    val speech = exact("Ln50;", "invoke", "Ljava/lang/Object;").method
    val resetSpeech = exact("Lwd0;", "a").method
    val destroy = exact("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;", "onDestroy").method
    val mapListener = exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/AndroidSpeechPlayer;", "setSpeechListener", "V",
        "Lorg/maplibre/navigation/android/navigation/ui/v5/voice/SpeechListener;").method
    val mapSpeech = exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/AndroidSpeechPlayer;", "play", "V",
        "Lorg/maplibre/navigation/android/navigation/ui/v5/voice/SpeechAnnouncement;").method
    val focus = exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;", "requestFocus", "V").method
    val cleanup = exact("Ls50;", "k").method
    val abandon = exact("Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;", "abandonFocus").method
    // Resolve and validate the entire publisher-15 cohort before changing any method.
    // Names alone are unsafe: Lt50 still exists in 15 but is no longer the queue.
    for ((method, registers, count) in listOf(
        Triple(request, 15, 30), Triple(queue, 17, 93), Triple(batch, 14, 217),
        Triple(routing[0], 16, 166), Triple(routing[1], 10, 119),
        Triple(routing[2], 7, 49), Triple(routing[3], 8, 53),
        Triple(constructor, 4, 56), Triple(cleanup, 6, 77),
        Triple(mediaFactory, 16, 68), Triple(prepared, 2, 7), Triple(resume, 4, 22),
        Triple(speech, 18, 235),
        // resetSpeech is the TTS factory; a system-voice patch may replace its
        // constructor and add a return, so only its references are guarded below.
        Triple(mapListener, 3, 6), Triple(mapSpeech, 6, 22),
        Triple(focus, 2, 4), Triple(abandon, 2, 4),
    )) check(method.implementation!!.registerCount == registers && method.instructions.size == count) {
        "Changed Flitsmeister 15 native audio layout: $method"
    }
    validateFlitsmeister15AudioBatch(batch)
    requireAudio15References(request, "Ls50;->i([Ls50\$c;)V", 1)
    requireAudio15References(constructor, "Ljava/lang/Object;-><init>()V", 1)
    requireAudio15References(queue, "Ls50;->k()V", 2)
    requireAudio15References(queue, "Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;", 1)
    requireAudio15References(cleanup, "Landroid/media/AudioManager;->abandonAudioFocusRequest(Landroid/media/AudioFocusRequest;)I", 1)
    requireAudio15References(focus, "Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I", 1)
    requireAudio15References(abandon, "Landroid/media/AudioManager;->abandonAudioFocusRequest(Landroid/media/AudioFocusRequest;)I", 1)
    val listener = "Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I"
    // onDestroy is a restored VM callback and already contains the navigation hook;
    // its audio ABI is checked independently of that earlier method-body restoration.
    for ((method, count) in listOf(speech to 2, resetSpeech to 1, destroy to 1, mapListener to 1)) {
        requireAudio15References(method, listener, count)
    }
    requireAudio15References(mediaFactory, "Landroid/media/MediaPlayer;->setVolume(FF)V", 1)
    for (method in listOf(prepared, resume)) requireAudio15References(method, "Landroid/media/MediaPlayer;->start()V", 1)
    requireAudio15References(speech, "Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I", 1)
    requireAudio15References(speech, "Landroid/speech/tts/TextToSpeech;->synthesizeToFile(Ljava/lang/CharSequence;Landroid/os/Bundle;Ljava/io/File;Ljava/lang/String;)I", 1)
    requireAudio15References(mapSpeech, "Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I", 1)
    for ((owner, name, type) in listOf(Triple("Ls50;", "f", "Ljava/util/concurrent/LinkedBlockingQueue;"), Triple("Ls50;", "g", "Z"),
        Triple("Ls50;", "e", "Lwd0;"), Triple("Lwd0;", "b", "Landroid/speech/tts/TextToSpeech;"), Triple("Ls50\$c;", "f", "Ls39;"))) {
        check(context.mutableClassDefBy(owner).fields.count { it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) } == 1) { "Changed native audio queue field $owner->$name" }
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


private fun requireAudio15References(method: MutableMethod, reference: String, expected: Int) {
    check(method.instructions.count { (it as? ReferenceInstruction)?.reference?.toString() == reference } == expected) {
        "Changed Flitsmeister 15 native audio ABI in $method: $reference expected $expected"
    }
}

/** Preserve the publisher's three muted-batch callback loops and their continuations. */
internal fun validateFlitsmeister15AudioBatch(method: MutableMethod) {
    check(method.definingClass == "Ls50;" && method.name == "i" && method.returnType == "V" &&
        method.parameterTypes == listOf("[Ls50\$c;") &&
        method.implementation!!.registerCount == 14 && method.instructions.size == 217) {
        "Changed Flitsmeister 15 native audio batch"
    }
    requireAudio15References(method, "Ls50\$c;->f:Ls39;", 3)
    requireAudio15References(method, "Ls39;->invoke()Ljava/lang/Object;", 3)
    val code = method.instructions.toList()
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    for ((field, loop) in listOf(41 to 35, 73 to 67, 100 to 94)) {
        check(code[field].opcode == Opcode.IGET_OBJECT &&
            (code[field] as? ReferenceInstruction)?.reference.toString() == "Ls50\$c;->f:Ls39;" &&
            code[field + 1].opcode == Opcode.IF_EQZ &&
            code[field + 2].opcode == Opcode.INVOKE_INTERFACE &&
            (code[field + 2] as? ReferenceInstruction)?.reference.toString() == "Ls39;->invoke()Ljava/lang/Object;" &&
            code[field + 3].opcode == Opcode.GOTO) { "Changed Flitsmeister 15 batch completion loop" }
        for (branch in listOf(field + 1, field + 3)) {
            check(addresses[branch] + (code[branch] as OffsetInstruction).codeOffset == addresses[loop]) {
                "Changed Flitsmeister 15 batch completion continuation"
            }
        }
    }
}
