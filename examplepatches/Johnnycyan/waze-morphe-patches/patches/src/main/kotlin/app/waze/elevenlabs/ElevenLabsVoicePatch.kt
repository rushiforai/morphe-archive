package app.waze.elevenlabs

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val BRIDGE = "Lapp/waze/elevenlabs/extension/ElevenLabsBridge;"

private fun javaName(type: String) = type.removePrefix("L").removeSuffix(";").replace('/', '.')

private val COMPATIBILITY_WAZE = Compatibility(
    name = "Waze",
    packageName = "com.waze",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x33CCFF,
    targets = listOf(AppTarget(version = WAZE_VERSION)),
)

@Suppress("unused")
val elevenLabsVoicePatch = bytecodePatch(
    name = "ElevenLabs voice for navigation",
    description = "Speaks navigation instructions and alerts with an ElevenLabs voice. Adds an " +
        "\"ElevenLabs voice\" entry to Waze settings for the API key, voice and model. Waze's own " +
        "voice plays whenever ElevenLabs is off, not configured or unreachable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    extendWith("extensions/elevenlabs.mpe")

    execute {
        // Waze builds each online navigation chunk from (text, url, cacheKey); remember the text
        // so the URL playback that follows can be spoken instead.
        val chunk = ChunkConstructorFingerprint.method
        chunk.instructions.indices.reversed().filter { chunk.instructions[it].opcode == Opcode.RETURN_VOID }
            .forEach { index ->
                chunk.addInstructions(index,
                    "invoke-static/range {p1 .. p3}, $BRIDGE->remember(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V")
            }

        val urlPlay = UrlPlayFingerprint.method
        val filePlay = FilePlayFingerprint.method
        val nativePlay = NativePlayFingerprint.method
        val callback = filePlay.parameterTypes[4].toString()
        if (urlPlay.parameterTypes[2].toString() != callback) {
            throw PatchException("SoundPlayer URL and file playback use different callback types")
        }

        // The SoundPlayer's stop(): the player method that calls the engine's ExoPlayer stop.
        val engineStops = EngineStopFingerprint.matchAll().map { it.method }.toList()
        val stop = UrlPlayFingerprint.classDef.methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.calls().any { call -> engineStops.any { it.definingClass == call.definingClass && it.name == call.name } }
        }.singleOrNull() ?: throw PatchException("Cannot identify the SoundPlayer stop method")

        // Range invokes: these parameters are reused as other types later in the original methods.
        PlayerConstructorFingerprint.method.addInstructions(0,
            "invoke-static/range {p1 .. p1}, $BRIDGE->initialize(Landroid/content/Context;)V")
        SettingsRowsFingerprint.method.addInstructions(0,
            "invoke-static/range {p0 .. p0}, $BRIDGE->addSettingsEntry(Ljava/lang/Object;)V")
        urlPlay.addInstructions(0, """
            invoke-static/range {p0 .. p3}, $BRIDGE->play(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original
            return-void
            :original
            nop
        """)
        stop.addInstructions(0, "invoke-static {}, $BRIDGE->cancel()V")

        // The extension calls back into Waze by reflection; hand it this build's obfuscated names.
        // The locals are unused at entry to the player's initialization method.
        val ready = PlayerReadyFingerprint.method
        val locals = ready.implementation!!.registerCount - ready.parameterTypes.size - 1
        if (locals < 4) throw PatchException("SoundPlayer initialization has too few registers ($locals)")
        ready.addInstructions(0, """
            const-string v0, "${javaName(callback)}"
            const-string v1, "${urlPlay.name}"
            const-string v2, "${filePlay.name}"
            const-string v3, "${nativePlay.name}"
            invoke-static {v0, v1, v2, v3}, $BRIDGE->bind(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            invoke-static/range {p0 .. p0}, $BRIDGE->attachPlayer(Ljava/lang/Object;)V
        """)
        filePlay.addInstructions(0, """
            invoke-static/range {p0 .. p5}, $BRIDGE->playFile(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original_file
            return-void
            :original_file
            nop
        """)
        // Waze's native TTS path: remember text per cache key, report it as not cached so Waze
        // asks for playback, then speak it.
        NativeDownloadFingerprint.method.addInstructions(0,
            "invoke-static {p1, p3, p3}, $BRIDGE->remember(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V")
        nativePlay.addInstructions(0, """
            invoke-static/range {p0 .. p2}, $BRIDGE->playCached(Ljava/lang/Object;Ljava/lang/String;Z)Z
            move-result v0
            if-eqz v0, :original_cached
            return-void
            :original_cached
            nop
        """)
        NativeCacheFingerprint.method.addInstructions(0, """
            invoke-static/range {p1 .. p1}, $BRIDGE->needsText(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :original_cache
            const/4 v0, 0x0
            return v0
            :original_cache
            nop
        """)
    }
}
