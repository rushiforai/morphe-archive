package app.waze.elevenlabs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Waze renames its obfuscated classes and methods in every build, so nothing here names them.
// Each target is found by what survives renaming: Kotlin's parameter null-check strings, log
// strings, framework types, and the unobfuscated TtsNativeManager class.

private const val STRING = "Ljava/lang/String;"
internal const val TTS_MANAGER = "Lcom/waze/sound/TtsNativeManager;"
private const val EXO_PLAYER = "Landroidx/media3/exoplayer/ExoPlayer;"

internal fun Method.calls(): List<MethodReference> = implementation?.instructions
    ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.orEmpty()

private fun ClassDef.hasString(value: String) = methods.any { method ->
    method.implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    } == true
}

private fun Method.params() = parameterTypes.map { it.toString() }

/** Navigation text chunk: (text, url, cacheKey). */
object ChunkConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf(STRING, STRING, STRING),
    strings = listOf("text", "url", "cacheKey"),
    custom = { method, _ -> method.definingClass.startsWith("Lcom/waze/sound/") },
)

/** SoundPlayer implementation; its first constructor parameter is the application Context. */
object PlayerConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    strings = listOf("applicationContext", "playerFactory", "soundPlayerStatSender"),
    custom = { method, _ -> method.params().firstOrNull() == "Landroid/content/Context;" },
)

/** SoundPlayer initialization, after which the player can play files. */
object PlayerReadyFingerprint : Fingerprint(
    classFingerprint = PlayerConstructorFingerprint,
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("Initializing player."),
)

/** SoundPlayer: play online navigation audio (url, cacheKey, onPlayCompleted). */
object UrlPlayFingerprint : Fingerprint(
    classFingerprint = PlayerConstructorFingerprint,
    returnType = "V",
    strings = listOf("url", "cacheKey", "onPlayCompleted"),
    custom = { method, _ -> method.params().let { it.size == 3 && it[0] == STRING && it[1] == STRING } },
)

/** SoundPlayer: play a local file (filePath, stats, ignoreMute, ignoreHardMute, onPlayCompleted). */
object FilePlayFingerprint : Fingerprint(
    classFingerprint = PlayerConstructorFingerprint,
    returnType = "V",
    strings = listOf("filePath", "onPlayCompleted"),
    custom = { method, _ -> method.params().let { it.size == 5 && it.take(4) == listOf(STRING, STRING, "Z", "Z") } },
)

/**
 * Playback engine method that stops the ExoPlayer: the only no-argument method that fetches the
 * engine's ExoPlayer. The SoundPlayer's stop() is the player method that calls it.
 */
object EngineStopFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        method.definingClass.startsWith("Lcom/waze/sound/") &&
            method.calls().any { it.definingClass == classDef.type && it.returnType == EXO_PLAYER }
    },
)

/** SettingsPageFragment's row rebuild: clears the row container before adding rows again. */
object SettingsRowsFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(definingClass = "Landroid/widget/LinearLayout;", name = "removeViews")),
    custom = { _, classDef -> classDef.hasString("SettingsPageFragment") },
)

object NativeDownloadFingerprint : Fingerprint(
    definingClass = TTS_MANAGER,
    returnType = "V",
    parameters = listOf(STRING, "Lcom/waze/jni/protos/sound/TtsVoice;", STRING),
    custom = { method, _ -> method.implementation != null },
)

object NativePlayFingerprint : Fingerprint(
    definingClass = TTS_MANAGER,
    returnType = "V",
    parameters = listOf(STRING, "Z"),
    custom = { method, _ -> method.implementation != null },
)

object NativeCacheFingerprint : Fingerprint(
    definingClass = TTS_MANAGER,
    returnType = "Z",
    parameters = listOf(STRING),
    custom = { method, _ -> method.implementation != null },
)
