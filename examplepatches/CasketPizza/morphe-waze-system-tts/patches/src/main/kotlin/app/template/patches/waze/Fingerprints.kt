package app.waze.systemtts.patches.waze

import app.morphe.patcher.Fingerprint

object ChunkConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/ai;", name = "<init>",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
)
object PlayerConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/fb;", name = "<init>"
)
object UrlPlayFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/fb;", name = "g", returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lh/g/a/a;")
)
object StopPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/fb;", name = "e", returnType = "V", parameters = emptyList()
)
object SettingsRowsFingerprint : Fingerprint(
    definingClass = "Lcom/waze/settings/dc;", name = "x",
    returnType = "V", parameters = emptyList()
)

object FilePlayFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/fb;", name = "c", returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Lh/g/a/a;")
)
object PlayerReadyFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/fb;", name = "a", returnType = "V", parameters = emptyList()
)
object NativeDownloadFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/TtsNativeManager;", name = "downloadTtsFromVoiceServer",
    returnType = "V", parameters = listOf("Ljava/lang/String;", "Lcom/waze/jni/protos/sound/TtsVoice;", "Ljava/lang/String;")
)
object NativePlayFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/TtsNativeManager;", name = "play",
    returnType = "V", parameters = listOf("Ljava/lang/String;", "Z")
)
object NativeCacheFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/TtsNativeManager;", name = "cacheExists",
    returnType = "Z", parameters = listOf("Ljava/lang/String;")
)
