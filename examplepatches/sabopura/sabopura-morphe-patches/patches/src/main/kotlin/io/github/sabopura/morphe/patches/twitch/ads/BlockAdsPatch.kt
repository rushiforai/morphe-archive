package io.github.sabopura.morphe.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_ADS
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import io.github.sabopura.morphe.patches.twitch.ui.enableTwitchFeature
import io.github.sabopura.morphe.patches.twitch.ui.playerMenuResourcePatch
import org.w3c.dom.Element
import java.util.logging.Logger

private const val AD_BLOCK = "Lio/github/sabopura/morphe/extension/twitch/ads/AdBlock;"
private const val AD_FREE_CLIENT = "Lio/github/sabopura/morphe/extension/twitch/ads/AdFreeHttpClient;"
private const val SHIELD = "io.github.sabopura.morphe.extension.twitch.ads.AdShield"
private const val IVS_NET = "Lcom/amazonaws/ivs/net/"
private const val NETWORKING = "Lcom/facebook/react/modules/network/NetworkingModule;"
private const val CUE_ROUTER = "Lcom/twitchrn/player/AdMetadataCueRouter;"
private val log: Logger = Logger.getLogger("SabopuraTwitch.Ads")

/** Covers the video above the picture and below Twitch's controls; used only as a last resort. */
internal val blockAdsResourcePatch = resourcePatch(
    description = "Adds the ad cover to Twitch's player layout.",
) {
    execute {
        document("res/layout/player_view_delegate.xml").use { document ->
            val nodes = document.getElementsByTagName("*")
            val views = (0 until nodes.length).map { nodes.item(it) as Element }
            if (views.any { it.tagName == SHIELD }) return@use
            val video = views.singleOrNull { it.getAttribute("android:id").substringAfter('/') == "playback_view_container" }
                ?: throw PatchException("Block ads: player layout lost playback_view_container")
            val shield = document.createElement(SHIELD)
            shield.setAttribute("android:layout_width", "match_parent")
            shield.setAttribute("android:layout_height", "match_parent")
            shield.setAttribute("android:visibility", "gone")
            video.parentNode.insertBefore(shield, video.nextSibling)
        }
    }
}

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Blocks pre-roll, mid-roll and VOD ads, ads stitched into live streams, audio ads, " +
        "picture-by-picture ads and banner or feed ads, without a third-party server. Can be " +
        "switched off in the settings.",
) {
    compatibleWith(TWITCH_ADS)
    dependsOn(playerMenuResourcePatch, blockAdsResourcePatch)
    extendWith("extensions/twitch.mpe")

    execute {
        val classes = classesMatching { true }
        initializeSettings()
        blockClientAds()
        blockAdServerApi(classes)
        blockDisplayAdParser()
        blockReactNativeAds()
        replaceStitchedAds()
        disablePictureByPicture()
        handlePlayerAdEvents(classes)
        log.info("Block ads: all layers installed")
    }

    finalize {
        enableTwitchFeature("adsPatch")
    }
}

// ---- helpers ----

private fun Method.code() = implementation?.instructions?.toList().orEmpty()

private fun Method.hasString(text: String) = code().any {
    (it as? ReferenceInstruction)?.reference.let { r -> r is StringReference && r.string == text }
}

private fun Method.parameterRegister(index: Int): Int {
    var word = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    parameterTypes.take(index).forEach { word += if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return word
}

/** v0 (and v1) must not alias a parameter when used as scratch at method entry. */
private fun Method.requireScratch(label: String, count: Int = 1) {
    val impl = implementation ?: throw PatchException("Block ads: $label has no code")
    val ins = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if (impl.registerCount - ins < count) throw PatchException("Block ads: $label has too few free registers")
}

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.filter {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }.uniqueContract("mutable ${method.name}")

/** Inserts a filter after the instruction that produced the returned object. */
private fun MutableMethod.filterResultAt(moveResultIndex: Int, call: String) {
    val register = (getInstruction(moveResultIndex) as OneRegisterInstruction).registerA
    addInstructions(moveResultIndex + 1, """
        invoke-static/range {v$register .. v$register}, $call
        move-result-object v$register
    """)
}

// ---- settings ----

private fun BytecodePatchContext.initializeSettings() {
    val application = mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;")
    application.methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
        .addInstructions(0, "invoke-static/range {p0 .. p0}, $AD_BLOCK->initialize(Landroid/content/Context;)V")
}

// ---- ① the presenter that requests every ad the app plays itself ----

private fun BytecodePatchContext.blockClientAds() {
    val presenter = classesWithStrings("ad request already active").uniqueContract("Block ads: ad request presenter")
    val constructor = presenter.methods.filter { m ->
        m.name == "<init>" && m.parameterTypes.count { it.toString() == "Z" } == 1 &&
            m.code().any { insn ->
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Ltv/twitch/android/core/mvp/presenter/StateMachine;" && it.name == "<init>"
                } == true
            }
    }.uniqueContract("Block ads: ad request presenter constructor")
    val p = constructor.parameterRegister(constructor.parameterTypes.indexOfFirst { it.toString() == "Z" })
    mutable(constructor).addInstructions(0, """
        invoke-static/range {p$p .. p$p}, $AD_BLOCK->allowClientAds(Z)Z
        move-result p$p
    """)
}

// ---- ② the ad server API of the native screens ----

private fun BytecodePatchContext.blockAdServerApi(classes: List<ClassDef>) {
    // Retrofit's create(Class): wrap the AdEdgeApi service it returns.
    val retrofit = classesWithStrings("API declarations must be interfaces.").uniqueContract("Block ads: Retrofit")
    val create = retrofit.methods.filter {
        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Class;") && it.returnType == "Ljava/lang/Object;" &&
            it.hasString("API declarations must be interfaces.")
    }.uniqueContract("Block ads: Retrofit create")
    val proxyCall = create.code().indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
            r.definingClass == "Ljava/lang/reflect/Proxy;" && r.name == "newProxyInstance"
        } == true
    }
    if (proxyCall < 0 || create.code()[proxyCall + 1].opcode != Opcode.MOVE_RESULT_OBJECT)
        throw PatchException("Block ads: Retrofit create no longer builds a proxy")
    mutable(create).filterResultAt(proxyCall + 1, "$AD_BLOCK->service(Ljava/lang/Object;)Ljava/lang/Object;")

    // RxJava's Single.just, for the immediate "blocked" answers of the wrapped API.
    val just = classDefBy("Lio/reactivex/u;").methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;") &&
            it.hasString("item is null")
    }.uniqueContract("Block ads: Single.just")
    val bridge = mutableClassDefBy(AD_BLOCK).methods.single { it.name == "single" }
    bridge.removeInstructions(0, bridge.instructions.size)
    bridge.addInstructions(0, """
        invoke-static {p0}, ${just.definingClass}->${just.name}(Ljava/lang/Object;)${just.returnType}
        move-result-object p0
        return-object p0
    """)
    if (classes.none { it.type == "Ltv/twitch/android/shared/ad/edge/api/AdEdgeApi;" })
        throw PatchException("Block ads: AdEdgeApi is missing")
}

/** The parser of /ads responses (display ads and VAST): answer "no ad", as Twitch does on 204. */
private fun BytecodePatchContext.blockDisplayAdParser() {
    val parser = classesWithStrings("failed to parse display ad response: ").flatMap { it.methods }.filter {
        it.parameterTypes.map { p -> p.toString() } == listOf("Lretrofit2/adapter/rxjava2/Result;", "Z") &&
            it.hasString("failed to parse display ad response: ")
    }.uniqueContract("Block ads: ad response parser")
    val noAd = parser.code().mapNotNull {
        if (it.opcode == Opcode.SGET_OBJECT) (it as ReferenceInstruction).reference as FieldReference else null
    }.distinct().filter { classDefBy(it.type).superclass == parser.returnType }
        .uniqueContract("Block ads: no-ad response")
    parser.requireScratch("ad response parser")
    val method = mutable(parser)
    method.addInstructionsWithLabels(0, """
        invoke-static {}, $AD_BLOCK->enabled()Z
        move-result v0
        if-eqz v0, :original
        sget-object v0, $noAd
        return-object v0
    """, ExternalLabel("original", method.getInstruction(0)))
}

// ---- ③ ad server requests of the React Native screens ----

/**
 * `AdMetadataCueRouter.route(String)`; 32.0.0 added a trailing boolean that Twitch only passes on
 * to TwitchAdStateModule. The hook reads the cue text alone, so both shapes are accepted.
 */
internal fun isAdCueRoute(method: Method) = method.name == "route" && method.returnType == "V" &&
    method.parameterTypes.map { it.toString() } in listOf(listOf("Ljava/lang/String;"), listOf("Ljava/lang/String;", "Z"))

private fun BytecodePatchContext.blockReactNativeAds() {
    val send = mutableClassDefBy(NETWORKING).methods.filter {
        it.name == "sendRequestInternalReal" && it.parameterTypes.size >= 3 &&
            it.parameterTypes.take(3).map { p -> p.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", "I")
    }.uniqueContract("Block ads: NetworkingModule.sendRequestInternalReal")
    send.requireScratch("NetworkingModule.sendRequestInternalReal")
    send.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p3}, $AD_BLOCK->answerReactRequest(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;I)Z
        move-result v0
        if-eqz v0, :original
        return-void
    """, ExternalLabel("original", send.getInstruction(0)))

    val route = mutableClassDefBy(CUE_ROUTER).methods.filter(::isAdCueRoute)
        .uniqueContract("Block ads: AdMetadataCueRouter.route")
    route.requireScratch("AdMetadataCueRouter.route")
    route.addInstructionsWithLabels(0, """
        invoke-static/range {p1 .. p1}, $AD_BLOCK->dropReactCue(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :original
        return-void
    """, ExternalLabel("original", route.getInstruction(0)))
}

// ---- ④ stitched ads: the HTTP client of the Amazon IVS player ----

private fun BytecodePatchContext.replaceStitchedAds() {
    listOf("ReadCallback", "StreamConsumer").forEach {
        val type = mutableClassDefBy("$IVS_NET$it;")
        if (!AccessFlags.INTERFACE.isSet(type.accessFlags)) throw PatchException("Block ads: IVS $it is not an interface")
        type.accessFlags = type.accessFlags or AccessFlags.PUBLIC.value
    }
    val factory = mutableClassDefBy("${IVS_NET}HttpClientFactory;").methods.filter {
        it.name == "create" && it.parameterTypes.isEmpty() && it.returnType == "${IVS_NET}HttpClient;" &&
            AccessFlags.STATIC.isSet(it.accessFlags)
    }.uniqueContract("Block ads: IVS HttpClientFactory.create")
    val returns = factory.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
    if (returns.size != 1 || factory.instructions[returns[0] - 1].opcode != Opcode.MOVE_RESULT_OBJECT)
        throw PatchException("Block ads: IVS HttpClientFactory.create changed shape")
    factory.filterResultAt(returns[0] - 1, "$AD_FREE_CLIENT->wrap(${IVS_NET}HttpClient;)${IVS_NET}HttpClient;")
}

// ---- ⑤ picture-by-picture ----

private fun BytecodePatchContext.disablePictureByPicture() {
    val presenter = classesWithStrings(
        "processStateChange(Ltv/twitch/android/feature/pbyp/PbypPresenter\$State;Ltv/twitch/android/feature/pbyp/PbypPresenter\$Event;)Ltv/twitch/android/core/mvp/presenter/StateAndAction;"
    ).uniqueContract("Block ads: picture-by-picture presenter")
    val check = presenter.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }.uniqueContract("Block ads: picture-by-picture feature check")
    val method = mutable(check)
    method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }.map { it.index }.reversed().forEach { index ->
        val register = (method.getInstruction(index) as OneRegisterInstruction).registerA
        method.addInstructions(index, """
            invoke-static/range {v$register .. v$register}, $AD_BLOCK->allowPictureByPicture(Z)Z
            move-result v$register
        """)
    }
}

// ---- ⑥ ad events of the native players ----

private fun BytecodePatchContext.handlePlayerAdEvents(classes: List<ClassDef>) {
    fun eventByToString(prefix: String) = classes.filter { c ->
        c.methods.any { m -> m.name == "toString" && m.code().any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith(prefix) == true
        } }
    }.uniqueContract("Block ads: player event $prefix")

    val stitched = eventByToString("OnSurestreamAdStarted(")
    val quartile = eventByToString("OnSurestreamAdQuartile(")
    val clientAd = eventByToString("OnMultiformatAdRequested(")
    val pbyp = eventByToString("OnPbypPreflightMessage(")
    val family = stitched.superclass ?: throw PatchException("Block ads: stitched ad event has no base")
    listOf(quartile, clientAd, pbyp).forEach {
        if (it.superclass != family) throw PatchException("Block ads: player ad events no longer share a base")
    }
    // The "live again" event is a singleton of the same family, sent for twitch-stream-source=live.
    val liveAgain = classes.flatMap { it.methods }.filter { it.hasString("twitch-stream-source") && it.hasString("X-TV-TWITCH-STREAM-SOURCE") }
        .flatMap { m -> m.code().mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference } }
        .map { it.type }.distinct()
        .filter { type -> classDefByOrNull(type)?.superclass == family && type !in setOf(stitched.type, quartile.type, clientAd.type, pbyp.type) }
        .uniqueContract("Block ads: live-again event")

    // The root of the event hierarchy is the only parameter of each player's dispatch method.
    var root = classDefBy(family)
    while (root.superclass != null && root.superclass != "Ljava/lang/Object;") root = classDefBy(root.superclass!!)
    val dispatchers = classes.flatMap { it.methods }.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map { p -> p.toString() } == listOf(root.type) && it.implementation != null
    }
    if (dispatchers.size != 2) throw PatchException("Block ads: expected 2 player event dispatchers, found ${dispatchers.size}")

    val kinds = listOf(stitched.type to 1, liveAgain to 2, quartile.type to 3, clientAd.type to 4, pbyp.type to 5)
    dispatchers.forEach { dispatcher ->
        dispatcher.requireScratch("player event dispatcher", 2)
        val method = mutable(dispatcher)
        val checks = kinds.joinToString("\n") { (type, kind) -> """
            instance-of v0, v1, $type
            if-eqz v0, :not_$kind
            const/4 v0, $kind
            goto :ad_event
            :not_$kind
        """ }
        method.addInstructionsWithLabels(0, """
            move-object/from16 v1, p1
            $checks
            goto :original
            :ad_event
            sput v0, $AD_BLOCK->eventKind:I
            invoke-static/range {p0 .. p1}, $AD_BLOCK->onPlayerAdEvent(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :original
            return-void
        """, ExternalLabel("original", method.getInstruction(0)))
    }
}
