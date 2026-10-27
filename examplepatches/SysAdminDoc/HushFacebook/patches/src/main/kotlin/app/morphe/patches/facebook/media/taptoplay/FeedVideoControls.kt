/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.taptoplay

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.ads.sponsoredsearch.enumConstantFields
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.reelspeed.originGetters
import app.morphe.patches.facebook.media.resume.IS_PLAYING
import app.morphe.patches.facebook.media.resume.VIDEO_PLAYER_PARAMS
import app.morphe.patches.facebook.media.resume.paramsGetters
import app.morphe.patches.facebook.media.resume.releases
import app.morphe.patches.facebook.media.resume.reportedValues
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.reels.hold.VIEW_GROUP
import app.morphe.patches.facebook.reels.hold.attachedPlayerParameter
import app.morphe.patches.facebook.reels.hold.containersWritten
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val FEED_CONTROLS = "$EXTENSION_PACKAGE/reels/FeedVideoControls;"
internal const val INLINE_ATTACHED = "$FEED_CONTROLS->attached(Landroid/view/ViewGroup;Ljava/lang/Object;)V"
internal const val INLINE_RELEASED = "$FEED_CONTROLS->released(Ljava/lang/Object;)V"
internal val INLINE_FLAGS = linkedMapOf(
    "isLiveNow" to "liveNow", "isSponsored" to "sponsored",
    "isAudioOnly" to "audioOnly", "isAnimatedGifVideo" to "animatedGif",
)

/** Resolve every native member before changing anything. No other playback patch is required. */
internal fun BytecodePatchContext.installFeedVideoControls(play: Method) {
    fun refuse(detail: String): Nothing = throw PatchException("$PATCH: inline feed controls: $detail")
    val owner = classDefBy(play.definingClass)
    val trigger = play.parameterTypes.single().toString()
    val triggerClass = classDefBy(trigger)
    // 584 also stores BY_USER in a plain static alias (`LX/2T4;->A01`), so only the enum constant counts.
    val userFields = enumConstantFields(triggerClass).filterValues { it == "BY_USER" }.keys
    val user = triggerClass.fields.singleOrNull {
        it.name in userFields && it.type == trigger && AccessFlags.PUBLIC.isSet(it.accessFlags)
                && AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.ENUM.isSet(it.accessFlags)
    } ?: refuse("expected one public BY_USER enum constant in $trigger")
    val pauses = grootPauses(owner, trigger)
    val inner = innerPause(pauses) ?: refuse("no pause the other pauses hand on to")
    val pause = pauses.singleOrNull {
        it.parameterTypes.map(CharSequence::toString) == listOf(trigger) && it !== inner && calls(it, inner)
    } ?: refuse("expected one single-trigger outer pause")
    fun single(what: String, found: List<Method>) = found.singleOrNull()
        ?: refuse("expected one $what, found ${found.size}")
    val playing = single("isPlaying()", owner.methods.filter {
        it.name == IS_PLAYING && it.returnType == "Z" && it.parameterTypes.isEmpty()
                && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    })
    val params = single("VideoPlayerParams getter", paramsGetters(owner))
    val origin = single("PlayerOrigin getter", originGetters(owner))
    val release = single("native release", releases(owner, trigger))
    val attaches = owner.methods.mapNotNull { method -> attachedPlayerParameter(method, owner.type)?.let { method to it } }
    val (attach, playerParameter) = attaches.singleOrNull()
        ?: refuse("expected one attach of the current player container, found ${attaches.size}")
    if (attach.localRegisterCount() < 2) refuse("the attach needs two local registers")
    val container = containersWritten(attach, owner.type).singleOrNull()
        ?: refuse("the attach doesn't write exactly one ViewGroup field")
    if (owner.fields.none {
        it.name == container.name && it.type == VIEW_GROUP && AccessFlags.PUBLIC.isSet(it.accessFlags)
                && !AccessFlags.STATIC.isSet(it.accessFlags)
    }) refuse("the current player container isn't public")
    val paramsClass = classDefBy(VIDEO_PLAYER_PARAMS)
    val names = INLINE_FLAGS.keys + "videoId"
    val dump = paramsClass.methods.singleOrNull { method -> names.all { holdsString(method, it) } }
        ?: refuse("no unique params dump names ${names.joinToString()}")
    val reported = reportedValues(dump)
    fun field(name: String, type: String): FieldReference {
        val reference = reported[name] ?: refuse("the params dump doesn't report $name")
        return paramsClass.fields.singleOrNull {
            it.name == reference.name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags)
                    && !AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: refuse("$name isn't a public $type params field")
    }
    val flags = INLINE_FLAGS.mapValues { (name, _) -> field(name, "Z") }
    val id = field("videoId", "Ljava/lang/String;")
    listOf(owner, paramsClass, triggerClass).forEach {
        if (!AccessFlags.PUBLIC.isSet(it.accessFlags)) refuse("${it.type} isn't public")
    }
    listOf(play, pause, playing, params, origin).forEach {
        if (!AccessFlags.PUBLIC.isSet(it.accessFlags)) refuse("${it.definingClass}->${it.name} isn't public")
    }
    val extension = mutableClassDefBy(FEED_CONTROLS)
    fun stub(name: String, answer: String, arguments: List<String> = listOf("Ljava/lang/Object;")): MutableMethod =
        extension.methods.singleOrNull {
            it.name == name && it.returnType == answer && AccessFlags.STATIC.isSet(it.accessFlags)
                    && it.parameterTypes.map(CharSequence::toString) == arguments
        } ?: refuse("missing $name stub")
    // Resolve all stubs before the first edit too.
    val stubs = listOf("playerView" to VIEW_GROUP, "playerParams" to "Ljava/lang/Object;",
        "playerOrigin" to "Ljava/lang/Object;", "mediaId" to "Ljava/lang/String;", "isPlaying" to "Z")
        .associate { (name, answer) -> name to stub(name, answer) }
    val flagStubs = INLINE_FLAGS.values.associateWith { stub(it, "Z") }
    val command = stub("commandPlayer", "V", listOf("Ljava/lang/Object;", "Z"))
    stubs.getValue("playerView").addInstructions(0, """
        check-cast p0, ${owner.type}
        iget-object p0, p0, $container
        return-object p0
    """)
    listOf("playerParams" to params, "playerOrigin" to origin, "isPlaying" to playing).forEach { (name, method) ->
        val objectResult = method.returnType.startsWith("L")
        stubs.getValue(name).addInstructions(0, """
            check-cast p0, ${owner.type}
            invoke-virtual/range { p0 .. p0 }, ${method.definingClass}->${method.name}()${method.returnType}
            ${if (objectResult) "move-result-object" else "move-result"} p0
            ${if (objectResult) "return-object" else "return"} p0
        """)
    }
    stubs.getValue("mediaId").addInstructions(0, """
        check-cast p0, $VIDEO_PLAYER_PARAMS
        iget-object p0, p0, $id
        return-object p0
    """)
    INLINE_FLAGS.forEach { (name, stub) ->
        flagStubs.getValue(stub).addInstructions(0, """
            check-cast p0, $VIDEO_PLAYER_PARAMS
            iget-boolean p0, p0, ${flags.getValue(name)}
            return p0
        """)
    }
    // The boolean is read before its register becomes the trigger; both native calls use only p0/p1.
    command.addInstructionsWithLabels(0, """
        check-cast p0, ${owner.type}
        if-eqz p1, :pause
        sget-object p1, $user
        invoke-virtual/range { p0 .. p1 }, ${play.definingClass}->${play.name}($trigger)V
        return-void
        :pause
        sget-object p1, $user
        invoke-virtual/range { p0 .. p1 }, ${pause.definingClass}->${pause.name}($trigger)V
        return-void
    """)
    val mutableOwner = mutableClassDefBy(owner.type)
    val attaching = mutableOwner.findMutableMethodOf(attach)
    attaching.addInstructions(0, """
        move-object/from16 v0, ${attaching.parameterRegister(0)}
        move-object/from16 v1, ${attaching.parameterRegister(playerParameter)}
        invoke-static { v0, v1 }, $INLINE_ATTACHED
    """)
    mutableOwner.findMutableMethodOf(release).addInstruction(0, "invoke-static/range { p0 .. p0 }, $INLINE_RELEASED")
}
