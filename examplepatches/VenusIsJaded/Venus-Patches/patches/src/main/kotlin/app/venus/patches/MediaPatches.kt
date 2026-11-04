package app.venus.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

internal const val BACKGROUND_MEDIA = "Lapp/venus/media/BackgroundMedia;"
internal const val MEDIA_SERVICE = "app.venus.media.MediaService"
private const val MAIN_ACTIVITY = "Lcom/discord/main/MainActivity;"
private const val REACT_ACTIVITY = "Lcom/discord/react_activities/ReactActivity;"
private const val AUDIO_PLAYER_MANAGER = "Lcom/discord/chat/presentation/message/view/voicemessages/AudioPlayerManager;"
private const val MEDIA_VIEW = "Lcom/discord/chat/presentation/message/view/MediaView;"
private const val MEDIA_VIEW_LIFECYCLE = "Lcom/discord/chat/presentation/message/view/MediaView\$lifecycleListener\$1;"
private const val MEDIA_PLAYBACK_PERMISSION = "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK"

/**
 * The service that keeps Discord running while sound plays in the background, and the permission Android 14 asks of a
 * media playback service. A root mount (#121) keeps the stock manifest: there the service is missing, so the notification
 * still shows but Android may pause Discord a while after you leave it.
 */
private val mediaServiceManifest = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val services = manifest.getElementsByTagName("service")
            for (i in 0 until services.length)
                if ((services.item(i) as Element).getAttribute("android:name") == MEDIA_SERVICE) return@use
            val service = manifest.createElement("service")
            service.setAttribute("android:name", MEDIA_SERVICE)
            service.setAttribute("android:exported", "false")
            service.setAttribute("android:foregroundServiceType", "mediaPlayback")
            application.appendChild(service)
            val permissions = manifest.getElementsByTagName("uses-permission")
            var present = false
            for (i in 0 until permissions.length)
                if ((permissions.item(i) as Element).getAttribute("android:name") == MEDIA_PLAYBACK_PERMISSION) present = true
            if (!present) {
                val permission = manifest.createElement("uses-permission")
                permission.setAttribute("android:name", MEDIA_PLAYBACK_PERMISSION)
                root.insertBefore(permission, application)
            }
        }
    }
}

/** The index right after the method's call to its own super implementation. */
internal fun afterSuper(method: MutableMethod): Int {
    val code = method.implementation?.instructions?.toList() ?: throw PatchException("${method.name} has no code")
    val index = code.indexOfFirst {
        it.opcode == Opcode.INVOKE_SUPER && ((it as ReferenceInstruction).reference as MethodReference).name == method.name
    }
    if (index < 0) throw PatchException("${method.definingClass}->${method.name} no longer calls super")
    return index + 1
}

/** Fails the patch if the method has fewer than [count] registers left over after its parameters. */
private fun requireLocals(method: MutableMethod, count: Int) {
    val implementation = method.implementation ?: throw PatchException("${method.name} has no code")
    val ins = 1 + method.parameterTypes.sumOf { val t = it.toString(); if (t == "J" || t == "D") 2.toInt() else 1.toInt() }
    if (implementation.registerCount - ins < count)
        throw PatchException("${method.definingClass}->${method.name} no longer has $count free registers")
}

/**
 * Fails the patch if a parameter sits above v15. The guards below pass p-registers to instructions with 4-bit register
 * fields (invoke-static {p0}, invoke-super, invoke-virtual {p1, v0}), which can't reach v16 and up; the encoded instruction
 * would read the wrong register and ART would reject the whole class at runtime.
 */
private fun requireLowRegisters(method: MutableMethod) {
    val implementation = method.implementation ?: throw PatchException("${method.name} has no code")
    if (implementation.registerCount > 16)
        throw PatchException("${method.definingClass}->${method.name} now has ${implementation.registerCount} registers")
}

/**
 * AudioPlayerManager.pauseCurrentPlayer(remember): the JS VoiceMessagesPlaybackManager asks for it with remember = true
 * when Discord goes to the background. Venus answers first; true means the sound keeps playing.
 * 4 registers, 2 of them parameters: v0 is free.
 */
internal fun keepAudioPlaying(method: MutableMethod) {
    if (method.parameterTypes.map { it.toString() } != listOf("Z") || method.returnType != "V")
        throw PatchException("AudioPlayerManager.pauseCurrentPlayer ABI changed")
    requireLocals(method, 1)
    requireLowRegisters(method)
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        invoke-static {p1}, $BACKGROUND_MEDIA->keepAudio(Z)Z
        move-result v0
        if-eqz v0, :venus_pause_audio
        return-void
        :venus_pause_audio
        nop
    """)
}

/**
 * MediaView's onHostPause pauses its video when Discord's screen pauses; not the one in Venus' picture-in-picture window.
 * onHostPause has 25 registers, so `this` (p0) is v24, which iget-object's 4-bit register fields can't address: reading
 * the field straight from p0 left v0 unset and ART rejected the whole class, crashing every embed and attachment as it
 * inflated. `this` is copied into v0 first with move-object/from16, which reaches any register.
 */
internal fun keepVideoPlaying(method: MutableMethod) {
    if (method.parameterTypes.isNotEmpty() || method.returnType != "V") throw PatchException("MediaView onHostPause ABI changed")
    requireLocals(method, 1)
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        move-object/from16 v0, p0
        iget-object v0, v0, $MEDIA_VIEW_LIFECYCLE->this${'$'}0:$MEDIA_VIEW
        invoke-static {v0}, $BACKGROUND_MEDIA->keepVideo(Landroid/view/View;)Z
        move-result v0
        if-eqz v0, :venus_pause_video
        return-void
        :venus_pause_video
        nop
    """)
}

/**
 * MediaView.onConfigurationChanged(Configuration): while a video plays in Venus' picture-in-picture window, the window's
 * landscape configuration made Discord release that video's player (a new orientation means a new player in setMediaData),
 * which reset it in the window and left the chat's player broken (#145). Venus answers first; when it says keep, only
 * View's own onConfigurationChanged runs. 26 registers, so `this` (p0) is v24: it's copied into v0 with move-object/from16,
 * and the super call uses invoke-super/range, which reaches any register.
 */
internal fun keepVideoConfig(method: MutableMethod) {
    if (method.parameterTypes.map { it.toString() } != listOf("Landroid/content/res/Configuration;") || method.returnType != "V")
        throw PatchException("MediaView.onConfigurationChanged ABI changed")
    requireLocals(method, 1)
    requireUnpatched(method, "venus-")
    val code = method.implementation?.instructions?.toList() ?: throw PatchException("${method.name} has no code")
    val superCall = code.firstOrNull {
        (it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE) &&
            ((it as ReferenceInstruction).reference as MethodReference).name == method.name
    } ?: throw PatchException("MediaView.onConfigurationChanged no longer calls super")
    val reference = (superCall as ReferenceInstruction).reference as MethodReference
    method.addInstructions(0, """
        move-object/from16 v0, p0
        invoke-static {v0}, $BACKGROUND_MEDIA->keepConfig(Landroid/view/View;)Z
        move-result v0
        if-eqz v0, :venus_media_config
        invoke-super/range {p0 .. p1}, $reference
        return-void
        :venus_media_config
        nop
    """)
}

/**
 * Venus first; Discord's own code (its call picture-in-picture) only runs when Venus didn't act. The guard goes at the very
 * start of the method and calls super itself before returning: a branch inserted after the super call of these short
 * methods came out pointing inside an instruction (VerifyApk caught it), while a prefix at index 0 encodes cleanly, like
 * every other Venus guard.
 */
internal fun activityGuard(method: MutableMethod, call: String, registers: String, label: String) {
    requireLocals(method, 1)
    requireLowRegisters(method)
    requireUnpatched(method, "venus-")
    val code = method.implementation?.instructions?.toList() ?: throw PatchException("${method.name} has no code")
    val superCall = code.firstOrNull {
        it.opcode == Opcode.INVOKE_SUPER && ((it as ReferenceInstruction).reference as MethodReference).name == method.name
    } ?: throw PatchException("${method.definingClass}->${method.name} no longer calls super")
    val reference = (superCall as ReferenceInstruction).reference as MethodReference
    if (reference.parameterTypes.map { it.toString() } != method.parameterTypes.map { it.toString() })
        throw PatchException("${method.definingClass}->${method.name} calls a different super method")
    val params = (0..method.parameterTypes.size).joinToString(", ") { "p$it" }
    method.addInstructions(0, """
        invoke-static {$registers}, $BACKGROUND_MEDIA->$call
        move-result v0
        if-eqz v0, :$label
        invoke-super {$params}, $reference
        return-void
        :$label
        nop
    """)
}

/** After super: tells Venus, then Discord's own code runs as before. */
internal fun activityNotice(method: MutableMethod, call: String) {
    requireUnpatched(method, "venus-")
    requireLowRegisters(method)
    method.addInstructions(afterSuper(method), "invoke-static {p0}, $BACKGROUND_MEDIA->$call")
}

/** Instructions [mediaBridge] adds before Discord's own moveFile code, counting the nop its label lands on. */
internal const val MEDIA_BRIDGE_SIZE = 7

/**
 * Venus settings sends the notification's texts and the playing message's details through FileModule.moveFile with a
 * private prefix (moveFile(storageDir, source, destination, promise): p1 carries the prefix and request, p4 is the
 * Promise). Discord only ever passes "cache" or "documents" as the folder. No other Venus guard uses this method.
 */
internal fun mediaBridge(method: MutableMethod) {
    if (method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", PROMISE) ||
        method.returnType != "V") throw PatchException("FileModule.moveFile ABI changed")
    requireLocals(method, 1)
    requireLowRegisters(method)
    requireUnpatched(method, "venus-")
    method.addInstructions(0, """
        const-string v0, "venus-media-v1:"
        invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :venus_original_move
        invoke-static {p1, p4}, $BACKGROUND_MEDIA->dispatch(Ljava/lang/String;$PROMISE)Z
        return-void
        :venus_original_move
        nop
    """)
}

@Suppress("unused")
val keepMediaPlaying = bytecodePatch(
    name = "Keep media playing",
    description = "Voice messages and audio keep playing when you leave Discord or turn off the screen, and videos pop out into a small window."
) {
    compatibleWith(discord)
    section(PLUGINS)
    dependsOn(venusSettings, mediaServiceManifest)
    extendWith("extensions/media.mpe")
    execute {
        selectRuntimeFeature("backgroundMedia")
        keepAudioPlaying(Fingerprint(definingClass = AUDIO_PLAYER_MANAGER, name = "pauseCurrentPlayer", returnType = "V",
            parameters = listOf("Z")).method)
        keepVideoPlaying(Fingerprint(definingClass = MEDIA_VIEW_LIFECYCLE, name = "onHostPause", returnType = "V",
            parameters = listOf()).method)
        keepVideoConfig(Fingerprint(definingClass = MEDIA_VIEW, name = "onConfigurationChanged", returnType = "V",
            parameters = listOf("Landroid/content/res/Configuration;")).method)
        activityGuard(Fingerprint(definingClass = MAIN_ACTIVITY, name = "onUserLeaveHint", returnType = "V", parameters = listOf()).method,
            "onUserLeaveHint(Landroid/app/Activity;)Z", "p0", "venus_discord_leave")
        activityGuard(Fingerprint(definingClass = MAIN_ACTIVITY, name = "onPictureInPictureModeChanged", returnType = "V",
            parameters = listOf("Z")).method, "onPipModeChanged(Landroid/app/Activity;Z)Z", "p0, p1", "venus_discord_pip")
        activityGuard(Fingerprint(definingClass = MAIN_ACTIVITY, name = "onPictureInPictureModeChanged", returnType = "V",
            parameters = listOf("Z", "Landroid/content/res/Configuration;")).method,
            "onPipModeChanged(Landroid/app/Activity;Z)Z", "p0, p1", "venus_discord_pip_config")
        activityNotice(Fingerprint(definingClass = MAIN_ACTIVITY, name = "onStop", returnType = "V", parameters = listOf()).method,
            "onStop(Landroid/app/Activity;)V")
        activityNotice(Fingerprint(definingClass = MAIN_ACTIVITY, name = "onResume", returnType = "V", parameters = listOf()).method,
            "onResume(Landroid/app/Activity;)V")
        activityNotice(Fingerprint(definingClass = REACT_ACTIVITY, name = "onPause", returnType = "V", parameters = listOf()).method,
            "onPause(Landroid/app/Activity;)V")
        mediaBridge(Fingerprint(definingClass = FILE_MODULE, name = "moveFile", returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", PROMISE)).method)
        val onCreate = Fingerprint(definingClass = "Lcom/discord/MainApplication;", name = "onCreate", returnType = "V",
            parameters = listOf()).method
        if (afterSuper(onCreate) != 1) throw PatchException("MainApplication.onCreate no longer starts with super.onCreate()")
        onCreate.addInstructions(1, "invoke-static {p0}, $BACKGROUND_MEDIA->init(Landroid/content/Context;)V")
    }
}
