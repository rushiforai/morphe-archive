/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.sendconfirm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val SEND_CONFIRM = "$EXTENSION_PACKAGE/misc/SendConfirm;"
private const val NAME = "Ask before sending a sticker"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val VIEW = "Landroid/view/View;"
private const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private const val USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val USER_FULL = "Lorg/telegram/tgnet/TLRPC\$UserFull;"
private const val ACCOUNT_INSTANCE = "Lorg/telegram/messenger/AccountInstance;"
private const val SEND_ANIMATION = "Lorg/telegram/messenger/MessageObject\$SendAnimationData;"
private const val PHOTO_ENTRY = "Lorg/telegram/messenger/MediaController\$PhotoEntry;"
private const val MEDIA_CONTROLLER = "Lorg/telegram/messenger/MediaController;"
private const val ENTER_VIEW = "Lorg/telegram/ui/Components/ChatActivityEnterView;"
private const val LAUNCH_ACTIVITY = "Lorg/telegram/ui/LaunchActivity;"
internal const val CAMERA_ALLOWED = "Lorg/telegram/messenger/camera/CameraView;->isCameraAllowed()Z"

/** What each hook takes, in the order the method it stands in front of takes its arguments. */
private val STICKER_TARGET = listOf(DOCUMENT, STRING, OBJECT, SEND_ANIMATION, "Z", "Z", "I", "I")
private val STICKER_HOOK = listOf(OBJECT, OBJECT, OBJECT, OBJECT, OBJECT, "Z", "Z", "I", "I")
private val GIF_TARGET = listOf(VIEW, OBJECT, STRING, OBJECT, "Z", "I", "I", PHOTO_ENTRY, "Z")
private val GIF_HOOK = listOf(OBJECT, OBJECT, OBJECT, OBJECT, OBJECT, "Z", "I", "I", OBJECT, "Z")
private val VOICE_TARGET = listOf("I", "Z", "I", "Z", "J")
private val VOICE_HOOK = listOf(OBJECT, "I", "Z", "I", "Z", "J")
private val CALL_TARGET = listOf(USER, "Z", "Z", ACTIVITY, USER_FULL, ACCOUNT_INSTANCE)
private val CALL_HOOK = listOf(OBJECT, "Z", "Z", OBJECT, OBJECT, OBJECT)

/** The round video recorder's entry in the chat, which the two builds give their arguments in a different order. */
internal enum class VideoShape(val target: List<String>, val hook: String, val resume: String) {
    /** State, sound, date, timer, effect, stars. */
    SOUND_SECOND(listOf("I", "Z", "I", "I", "J", "J"), "video", "resumeVideo"),

    /** State, date, timer, effect, stars, sound. */
    SOUND_LAST(listOf("I", "I", "I", "J", "J", "Z"), "videoReordered", "resumeVideoReordered"),
}

@Suppress("unused")
val sendConfirmPatch = bytecodePatch(
    name = NAME,
    description = "Asks you to confirm before a sticker, GIF, voice or video message, or call goes out, so a stray tap " +
        "doesn't send it. All four start off. Turn them on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveSendConfirm()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.insert { target, apply -> apply(MutableMethod(ImmutableMethod.of(target))) }
        writeSendConfirmStubs(site)
        site.insert { target, apply -> apply(target) }
        enableStatus("askBeforeSending")
    }
}

/** A method of the app and, for a call site, the one instruction in it to change. */
internal class SendConfirmSite(
    val sticker: MutableMethod, val gif: MutableMethod, val voice: MutableMethod, val video: MutableMethod,
    val shape: VideoShape, val header: MutableMethod, val headerCall: Int, val profile: MutableMethod, val profileCall: Int,
    val startCall: String, val launchField: String,
) {
    /** Hands each place that gets code to [change] with the edit that does it, copy or real. */
    fun insert(change: (MutableMethod, (MutableMethod) -> Unit) -> Unit) {
        change(sticker) { gate(it, "$SEND_CONFIRM->sticker(${STICKER_HOOK.joinToString("")})Z") }
        change(gif) { gate(it, "$SEND_CONFIRM->gif(${GIF_HOOK.joinToString("")})Z") }
        change(voice) { gate(it, "$SEND_CONFIRM->voice(${VOICE_HOOK.joinToString("")})Z") }
        change(video) { gate(it, "$SEND_CONFIRM->${shape.hook}(${listOf(OBJECT).plus(shape.target).joinToString("")})Z") }
        change(header) { replaceCall(it, headerCall) }
        change(profile) { replaceCall(it, profileCall) }
    }
}

/**
 * Puts the extension's question in front of the method's first instruction, with `this` and every
 * parameter, which sit together in the top registers. On true the method goes on as it always did;
 * on false the extension has asked, and the method returns without doing anything yet. Borrows v0,
 * which holds nothing before the method's own first instruction.
 */
private fun gate(target: MutableMethod, hook: String) {
    val words = 1 + target.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val first = target.implementation!!.registerCount - words
    target.addInstructionsWithLabels(
        0,
        """
            invoke-static/range {v$first .. v${first + words - 1}}, $hook
            move-result v0
            if-nez v0, :hush_stock
            return-void
        """,
        ExternalLabel("hush_stock", target.getInstruction(0)),
    )
}

/** The call to Telegram's start of a call, with the same registers, goes to the extension, which makes it or asks first. */
private fun replaceCall(target: MutableMethod, index: Int) {
    val call = target.getInstruction(index) as RegisterRangeInstruction
    target.replaceInstruction(
        index,
        "invoke-static/range {v${call.startRegister} .. v${call.startRegister + call.registerCount - 1}}, " +
            "$SEND_CONFIRM->call(${CALL_HOOK.joinToString("")})V",
    )
}

/**
 * Four places, each a method that does the work only after a person asked for it: the chat bar's
 * sticker send, the GIF panel's listener, Telegram's end of a voice recording and the chat's
 * handling of the round video recorder. The calls come from the chat header's menu and the
 * profile's call buttons, the two places that call by hand.
 */
internal fun BytecodePatchContext.resolveSendConfirm(): SendConfirmSite {
    requireStatusMethod("askBeforeSending")
    controlHook(SEND_CONFIRM, "launchActivity", listOf(), ACTIVITY)
    controlHook(SEND_CONFIRM, "sticker", STICKER_HOOK, "Z")
    controlHook(SEND_CONFIRM, "gif", GIF_HOOK, "Z")
    controlHook(SEND_CONFIRM, "voice", VOICE_HOOK, "Z")
    controlHook(SEND_CONFIRM, "call", CALL_HOOK, "V")
    controlHook(SEND_CONFIRM, "resumeSticker", STICKER_HOOK, "V")
    controlHook(SEND_CONFIRM, "resumeGif", GIF_HOOK, "V")
    controlHook(SEND_CONFIRM, "resumeVoice", VOICE_HOOK, "V")
    controlHook(SEND_CONFIRM, "startCall", CALL_HOOK, "V")
    for (shape in VideoShape.values()) {
        controlHook(SEND_CONFIRM, shape.hook, listOf(OBJECT).plus(shape.target), "Z")
        controlHook(SEND_CONFIRM, shape.resume, listOf(OBJECT).plus(shape.target), "V")
    }

    // The first pass finds Telegram's start of a call, the one static method taking these six.
    val starts = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == CALL_TARGET
        }.forEach { starts += cls.type to signature(it) }
    }
    val (startType, startWanted) = starts.controlSingle("Telegram's start of a call")
    val startOwner = mutableClassDefBy(startType)
    val startMethod = startOwner.methods.single { signature(it) == startWanted }
    controlShape(AccessFlags.PUBLIC.isSet(startOwner.accessFlags) && AccessFlags.PUBLIC.isSet(startMethod.accessFlags), "the start of a call is inaccessible")
    val startRef = startWanted

    val gifs = mutableListOf<Pair<String, String>>()
    val videos = mutableListOf<Triple<String, String, VideoShape>>()
    val headers = mutableListOf<Triple<String, String, List<Int>>>()
    val profiles = mutableListOf<Triple<String, String, List<Int>>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { m ->
            val params = m.parameterTypes.map(CharSequence::toString)
            val instance = !AccessFlags.STATIC.isSet(m.accessFlags)
            if (instance && m.returnType == "V" && params == GIF_TARGET) gifs += cls.type to signature(m)
            if (m.implementation == null) return@forEach
            val body = m.controlBody()
            if (instance && m.returnType == "V") {
                val shape = VideoShape.values().firstOrNull { it.target == params }
                if (shape != null && body.any { it.controlRef() == CAMERA_ALLOWED } &&
                    body.any { it.controlCall()?.let { c -> c.name == "getParentActivity" && c.parameterTypes.isEmpty() && c.returnType == ACTIVITY } == true }) {
                    videos += Triple(cls.type, signature(m), shape)
                }
            }
            val calls = body.indices.filter { body[it].controlRef() == startRef }
            if (instance && m.returnType == "V" && calls.isNotEmpty()) {
                if (params == listOf("I") && body.any { it.controlString() == "/help" } && body.any { it.controlString() == "/settings" }) {
                    headers += Triple(cls.type, signature(m), calls)
                }
                if (params == listOf("Z")) profiles += Triple(cls.type, signature(m), calls)
            }
        }
    }

    // The chat bar's send of a picked sticker.
    val barClass = mutableClassDefBy(ENTER_VIEW)
    controlShape(AccessFlags.PUBLIC.isSet(barClass.accessFlags), "the chat bar is inaccessible")
    val sticker = barClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == STICKER_TARGET
    }.controlSingle("the chat bar's sticker send")
    requireGateable(sticker, "the chat bar's sticker send")

    // The GIF panel's listener, which the chat bar hands the GIF that was tapped.
    val (gifType, gifWanted) = gifs.controlSingle("the GIF panel's send")
    val gifClass = mutableClassDefBy(gifType)
    val gif = gifClass.methods.single { signature(it) == gifWanted }
    controlShape(AccessFlags.PUBLIC.isSet(gifClass.accessFlags), "the GIF panel's listener is inaccessible")
    requireGateable(gif, "the GIF panel's send")

    // Telegram's end of a recording, by its kept name.
    val mediaClass = mutableClassDefBy(MEDIA_CONTROLLER)
    controlShape(AccessFlags.PUBLIC.isSet(mediaClass.accessFlags), "the media controller is inaccessible")
    val voice = mediaClass.methods.filter { m ->
        m.name == "stopRecording" && !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
            m.parameterTypes.map(CharSequence::toString) == VOICE_TARGET
    }.controlSingle("Telegram's end of a recording")
    requireGateable(voice, "Telegram's end of a recording")

    // The chat's handling of the round video recorder: the one that opens the camera and names the activity.
    val (videoType, videoWanted, shape) = videos.controlSingle("the chat's handling of the round video recorder")
    val videoClass = mutableClassDefBy(videoType)
    val video = videoClass.methods.single { signature(it) == videoWanted }
    controlShape(AccessFlags.PUBLIC.isSet(videoClass.accessFlags), "the chat's video recorder listener is inaccessible")
    requireGateable(video, "the chat's handling of the round video recorder")

    // The header menu's call item, and the profile's call button, each calling once.
    val (headerType, headerWanted, headerCalls) = headers.controlSingle("the chat header's menu")
    val header = mutableClassDefBy(headerType).methods.single { signature(it) == headerWanted }
    val headerCall = headerCalls.controlSingle("the chat header's call")
    val (profileType, profileWanted, profileCalls) = profiles.controlSingle("the profile's call button")
    val profile = mutableClassDefBy(profileType).methods.single { signature(it) == profileWanted }
    val profileCall = profileCalls.controlSingle("the profile's call")
    for ((method, at, what) in listOf(Triple(header, headerCall, "the chat header's call"), Triple(profile, profileCall, "the profile's call"))) {
        val body = method.controlBody()
        val call = body[at] as? RegisterRangeInstruction
        controlShape(call != null && call.opcode == Opcode.INVOKE_STATIC_RANGE && call.registerCount == 6,
            "$what is no longer one call with six arguments")
        controlShape(body.getOrNull(at + 1)?.opcode != Opcode.MOVE_RESULT, "$what is no longer a call that gives nothing back")
    }

    // The field LaunchActivity.onCreate sets to itself, which is the app's main window.
    val launchClass = mutableClassDefBy(LAUNCH_ACTIVITY)
    controlShape(AccessFlags.PUBLIC.isSet(launchClass.accessFlags), "the main window is inaccessible")
    val onCreate = launchClass.methods.filter { it.name == "onCreate" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;") }
        .controlSingle("the main window's start")
    val own = onCreate.controlBody().filter { it.opcode == Opcode.SPUT_OBJECT && it.controlField()?.let { f -> f.definingClass == LAUNCH_ACTIVITY && f.type == LAUNCH_ACTIVITY } == true }
        .map { it.controlField().toString() }.distinct().controlSingle("the main window's own field")
    val declared = launchClass.fields.filter { "${it.definingClass}->${it.name}:${it.type}" == own }.controlSingle("the main window's field")
    controlShape(AccessFlags.PUBLIC.isSet(declared.accessFlags) && AccessFlags.STATIC.isSet(declared.accessFlags), "the main window's field is inaccessible")

    return SendConfirmSite(sticker, gif, voice, video, shape, header, headerCall, profile, profileCall, startRef, own)
}

/** The method takes a local to borrow at its start, nothing jumps back to its first instruction, and it can be called from outside. */
private fun requireGateable(method: Method, what: String) {
    val words = 1 + method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    controlShape(method.implementation != null && !AccessFlags.ABSTRACT.isSet(method.accessFlags), "$what has no body")
    controlShape(AccessFlags.PUBLIC.isSet(method.accessFlags), "$what is inaccessible")
    controlShape(method.implementation!!.registerCount - words >= 1, "$what has no local register to ask in")
    controlShape(ControlFlow.of(method).normal.none { 0 in it }, "something jumps back to the start of $what")
}

/** The stubs' bodies, which call the methods [site] found, each with the arguments the extension holds. */
internal fun BytecodePatchContext.writeSendConfirmStubs(site: SendConfirmSite) {
    val bar = site.sticker.definingClass
    val panel = site.gif.definingClass
    val chat = site.video.definingClass
    writeStub(SEND_CONFIRM, "launchActivity", 1, "sget-object v0, ${site.launchField}\nreturn-object v0")
    writeStub(SEND_CONFIRM, "resumeSticker", 9, """
        check-cast p0, $bar
        check-cast p1, $DOCUMENT
        check-cast p2, $STRING
        check-cast p4, $SEND_ANIMATION
        invoke-virtual/range {p0 .. p8}, ${signature(site.sticker)}
        return-void
    """)
    writeStub(SEND_CONFIRM, "resumeGif", 10, """
        check-cast p0, $panel
        check-cast p1, $VIEW
        check-cast p3, $STRING
        check-cast p8, $PHOTO_ENTRY
        invoke-virtual/range {p0 .. p9}, ${signature(site.gif)}
        return-void
    """)
    writeStub(SEND_CONFIRM, "resumeVoice", 7, """
        check-cast p0, $MEDIA_CONTROLLER
        invoke-virtual/range {p0 .. p6}, ${signature(site.voice)}
        return-void
    """)
    writeStub(SEND_CONFIRM, site.shape.resume, 9, """
        check-cast p0, $chat
        invoke-virtual/range {p0 .. p8}, ${signature(site.video)}
        return-void
    """)
    writeStub(SEND_CONFIRM, "startCall", 6, """
        check-cast p0, $USER
        check-cast p3, $ACTIVITY
        check-cast p4, $USER_FULL
        check-cast p5, $ACCOUNT_INSTANCE
        invoke-static/range {p0 .. p5}, ${site.startCall}
        return-void
    """)
}

private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
