package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

private const val PROVIDER_SPEECH = "Lnl/johninnl/navigation/startup/ProviderSpeech;"

/** The APK under review. Kept separate from the 5.26 catalog target so older patches stay pinned. */
internal val COMPATIBILITY_WAZE_SYSTEM_VOICE = Compatibility(
    name = "Waze",
    packageName = "com.waze",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x33CCFF,
    targets = listOf(AppTarget(version = "5.27.0.1", minSdk = 32)),
)

/**
 * `private void dh.I(Chunk, Completion)` plays one already-built navigation chunk.
 * The chunk carries the exact text Waze intended to say; use it instead of the
 * downloaded recording. If the selected engine cannot speak, the original call
 * still runs and the recording is heard.
 */
private object WazeChunkFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/dh;",
    name = "I",
    returnType = "V",
    parameters = listOf("Lcom/waze/sound/v;", "Lg/h/a/a;"),
)

/** The recorded audio player: `dy.g(filePath, cacheKey, ...)`. */
private object WazeRecordedPromptFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/dy;",
    name = "g",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Lg/h/a/a;"),
)

/** `dh.G(boolean)` clears route speech. Stop our queue when the native player is stopped. */
private object WazeClearSpeechFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sound/dh;",
    name = "G",
    returnType = "V",
    parameters = listOf("Z"),
)

@Suppress("unused")
val wazeSystemVoicePatch = bytecodePatch(
    name = "Use the system voice for navigation",
    description = "Speaks Waze navigation chunks through the phone's selected text-to-speech " +
        "engine instead of Waze's downloaded voice recordings. Waze already supplies the chunk " +
        "text, so no speech recognition is needed. Select DriveDeck as the system engine to hear " +
        "the local DriveDeck voice; otherwise the original voice remains the fallback.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE_SYSTEM_VOICE)
    extendWith("extensions/waze.mpe")

    execute {
        WazeApplicationCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, $PROVIDER_SPEECH->init(Landroid/content/Context;)V",
        )
        bindWazeSystemVoice(WazeChunkFingerprint.method)
        bindWazeRecordedPrompts(WazeRecordedPromptFingerprint.method)
        bindWazeClearSpeech(WazeClearSpeechFingerprint.method)
    }
}

internal fun bindWazeSystemVoice(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    if (method.implementation == null || method.implementation!!.registerCount <= 3)
        throw PatchException("Waze chunk player has no scratch register")
    method.addInstructionsWithLabels(0, """
        invoke-virtual {p1}, Lcom/waze/sound/v;->b()Ljava/lang/String;
        move-result-object v0
        invoke-static {v0, p2}, $PROVIDER_SPEECH->speak(Ljava/lang/String;Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :native_chunk
        return-void
    """.trimIndent(), ExternalLabel("native_chunk", method.getInstruction(0)))
}

internal fun bindWazeClearSpeech(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.addInstructions(0, """
        if-eqz p1, :keep_navigation_speech
        invoke-static {}, $PROVIDER_SPEECH->stop()V
        :keep_navigation_speech
        nop
    """.trimIndent())
}


/** Map Waze's recorded prompt file names to text; unknown sounds fall through unchanged. */
internal fun bindWazeRecordedPrompts(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    if (method.implementation == null || method.implementation!!.registerCount <= 5)
        throw PatchException("Waze recorded prompt player has no scratch register")
    method.addInstructionsWithLabels(0, """
        invoke-static {p1, p5}, $PROVIDER_SPEECH->speakAsset(Ljava/lang/String;Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :native_recorded_prompt
        return-void
    """.trimIndent(), ExternalLabel("native_recorded_prompt", method.getInstruction(0)))
}
