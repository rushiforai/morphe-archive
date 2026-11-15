package app.hoitruyenchu.patches.itruyenchu.audio.tts

import app.hoitruyenchu.patches.itruyenchu.misc.extension.sharedExtensionPatch
import app.hoitruyenchu.patches.itruyenchu.shared.AsyncStorageMultiSetFingerprint
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_TTS_CONTROLLER
import app.hoitruyenchu.patches.itruyenchu.shared.READABLE_ARRAY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val UTTERANCE_PROGRESS_LISTENER = "Landroid/speech/tts/UtteranceProgressListener;"

private val wakeLockPermissionPatch = patch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val permissions = document.getElementsByTagName("uses-permission")
            val hasWakeLock = (0 until permissions.length).any {
                permissions.item(it).attributes.getNamedItem("android:name")?.nodeValue ==
                        "android.permission.WAKE_LOCK"
            }
            if (!hasWakeLock) {
                val element = document.createElement("uses-permission")
                element.setAttribute("android:name", "android.permission.WAKE_LOCK")
                manifest.insertBefore(element, manifest.firstChild)
            }
        }
    }
}

@Suppress("unused")
val ttsReliabilityPatch = patch(
    name = "TTS reliability",
    description = "Fixes text-to-speech reading that stops after a phone call or does nothing when pressing play: " +
            "re-creates the TTS engine when it dies, pauses during calls and resumes afterwards, " +
            "retries failed lines, uses the correct Vietnamese voice, and applies a new speed right away " +
            "instead of after pause + play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    dependsOn(sharedExtensionPatch, wakeLockPermissionPatch)

    execute {
        // The UtteranceProgressListener that forwards engine events to JS
        // (SpeechModule$textToSpeech$2$newTtsInstance$1$1$1 in expo-speech 14).
        val listenerType = classDefBy { classDef ->
            classDef.superclass == UTTERANCE_PROGRESS_LISTENER &&
                    classDef.type.startsWith("Lexpo/modules/speech/SpeechModule$")
        }.type

        // 1. All engine access goes through TtsController, which re-creates dead engines.
        GetTextToSpeechFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, $listenerType
                invoke-direct { v0, p0 }, $listenerType-><init>($SPEECH_MODULE)V
                invoke-virtual { p0 }, $SPEECH_MODULE->getAppContext()Lexpo/modules/kotlin/AppContext;
                move-result-object p0
                invoke-virtual { p0 }, Lexpo/modules/kotlin/AppContext;->getReactContext()Landroid/content/Context;
                move-result-object p0
                invoke-static { p0, v0 }, $EXTENSION_TTS_CONTROLLER->getTts(Landroid/content/Context;$UTTERANCE_PROGRESS_LISTENER)$TEXT_TO_SPEECH
                move-result-object v0
                return-object v0
            """,
        )

        // 2. TtsController queues speech itself until the engine is ready.
        IsTextToSpeechReadyFingerprint.method.returnEarly(true)

        // 3. speakOut(id, text, options) -> TtsController.speak(id, text, language, pitch, rate, voice)
        SpeakOutFingerprint.method.apply {
            // Arguments are built in v0..v5. With 4 or more locals, p3 (options) lies above v5
            // and p1 / p2 are copied before v5 / v6 could overwrite them.
            if (implementation!!.registerCount < 8) throw PatchException("Unexpected speakOut register count")
            addInstructions(
                0,
                """
                    invoke-direct { p0 }, $SPEECH_MODULE->getTextToSpeech()$TEXT_TO_SPEECH
                    move-object v0, p1
                    move-object v1, p2
                    invoke-virtual { p3 }, $SPEECH_OPTIONS->component1()Ljava/lang/String;
                    move-result-object v2
                    invoke-virtual { p3 }, $SPEECH_OPTIONS->component2()Ljava/lang/Float;
                    move-result-object v3
                    invoke-virtual { p3 }, $SPEECH_OPTIONS->component3()Ljava/lang/Float;
                    move-result-object v4
                    invoke-virtual { p3 }, $SPEECH_OPTIONS->component4()Ljava/lang/String;
                    move-result-object v5
                    invoke-static/range { v0 .. v5 }, $EXTENSION_TTS_CONTROLLER->speak(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/String;)V
                    return-void
                """,
            )
        }

        // 4. getVoices() waits for a ready and healthy engine instead of hanging or throwing.
        GetVoicesFingerprint.method.addInstructions(
            0,
            """
                invoke-direct { p0 }, $SPEECH_MODULE->getTextToSpeech()$TEXT_TO_SPEECH
                invoke-static { }, $EXTENSION_TTS_CONTROLLER->awaitReady()V
            """,
        )

        // 5. Speech.stop() clears the queue kept by TtsController.
        StopSpeechFingerprint.let {
            val index = it.instructionMatches.first().index
            it.method.apply {
                val register = getInstruction<FiveRegisterInstruction>(index).registerC
                replaceInstruction(
                    index,
                    "invoke-static { v$register }, $EXTENSION_TTS_CONTROLLER->stop($TEXT_TO_SPEECH)I",
                )
            }
        }

        // 6. Activity destroyed: do not kill the engine while a reading session is active,
        //    otherwise forget it so it is re-created on next use.
        ShutdownSpeechFingerprint.let {
            val index = it.instructionMatches.first().index
            it.method.apply {
                val register = getInstruction<FiveRegisterInstruction>(index).registerC
                replaceInstruction(
                    index,
                    "invoke-static { v$register }, $EXTENSION_TTS_CONTROLLER->onActivityDestroyed($TEXT_TO_SPEECH)V",
                )
            }
        }

        // 7. A new speed chosen in the voice bar is used right away (JS keeps the old one until
        //    pause + play): TtsController reads it from the saved voice bar store.
        AsyncStorageMultiSetFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_TTS_CONTROLLER->onStorageSet($READABLE_ARRAY)V",
        )
    }
}
