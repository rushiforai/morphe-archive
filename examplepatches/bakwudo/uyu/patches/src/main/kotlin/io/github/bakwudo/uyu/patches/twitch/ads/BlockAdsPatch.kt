package io.github.bakwudo.uyu.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.bakwudo.uyu.patches.twitch.settings.setPatchIncluded
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE
import io.github.bakwudo.uyu.patches.twitch.theatre.nativeTheatrePatch
import io.github.bakwudo.uyu.patches.util.addInstructionsAtControlFlowLabel
import io.github.bakwudo.uyu.patches.util.fieldsRead
import io.github.bakwudo.uyu.patches.util.instanceField
import io.github.bakwudo.uyu.patches.util.replaceMethodBody
import io.github.bakwudo.uyu.patches.util.thisRegister

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/ads/BlockAdsPatch;"
private const val PLAYER_EVENTS_CLASS = "$EXTENSION_PACKAGE/ads/PlayerEvents;"
private const val PLAYER_EVENT_HELPER = "uyuOnPlayerEvent"

private const val IVS_PACKAGE = "Lcom/amazonaws/ivs/player/"

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Adds an option to block ads. Streams are requested as Twitch's embedded web " +
        "player, which gets fewer ads, and the app no longer requests or plays ads itself. " +
        "Ads that are part of the stream are covered with a black screen and muted until they " +
        "end. Display ads are not shown. Live streams can optionally be loaded through a proxy. " +
        "Streams open in Twitch's native player instead of the new React Native one, which this " +
        "relies on.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(settingsPatch, nativeTheatrePatch)

    execute {
        setPatchIncluded("blockAds")
        hookAccessToken()
        hookPlayerEvents()
        hookClientAds()
        hookDisplayAds()
        hookProxy()
    }
}

/**
 * Requests access tokens as Twitch's embedded web player ("embed"). Streams for that player type
 * get no midrolls.
 */
private fun BytecodePatchContext.hookAccessToken() {
    val paramsClass = mutableClassDefBy(PlaybackAccessTokenParamsToStringFingerprint.classDef.type)
    val constructors = paramsClass.methods.filter { method ->
        method.name == "<init>" && method.parameterTypes.count { it.toString() == "Ljava/lang/String;" } == 1
    }
    if (constructors.isEmpty()) throw PatchException("PlaybackAccessTokenParams constructor not found.")

    constructors.forEach { constructor ->
        // The player type is the only String parameter.
        val register = parameterRegister(
            constructor,
            constructor.parameterTypes.indexOfFirst { it.toString() == "Ljava/lang/String;" },
        )
        constructor.addInstructions(
            0,
            """
                invoke-static/range { $register .. $register }, $EXTENSION_CLASS->overridePlayerType(Ljava/lang/String;)Ljava/lang/String;
                move-result-object $register
            """,
        )
    }
}

/**
 * Lets the extension see every event of both players (Amazon IVS and ExoPlayer) before it is
 * sent, and drop the ones about ads: stitched ads (covered with a black screen instead), ads the
 * stream asks the app to request, and picture by picture ads.
 */
private fun BytecodePatchContext.hookPlayerEvents() {
    val adStarted = StitchedAdStartedToStringFingerprint.classDef
    val eventBase = topSuperclass(adStarted)
    val eventTypes = listOf(
        adStarted to 1,
        StitchedAdQuartileToStringFingerprint.classDef to 2,
        LiveContentToStringFingerprint.classDef to 3,
        ClientAdRequestedToStringFingerprint.classDef to 4,
        PictureByPictureAdToStringFingerprint.classDef to 5,
    )
    eventTypes.forEach { (event, _) ->
        if (topSuperclass(event) != eventBase) {
            throw PatchException("${event.type} is not a player event like ${adStarted.type}.")
        }
    }

    replaceMethodBody(
        PLAYER_EVENTS_CLASS,
        "type",
        2,
        eventTypes.joinToString("\n") { (event, type) ->
            """
                instance-of v0, p0, ${event.type}
                if-eqz v0, :not_$type
                const/4 v0, $type
                return v0
                :not_$type
            """
        } + """
            const/4 v0, 0x0
            return v0
        """,
    )

    // The stitched ad's metadata. Its toString reads the ad's duration first, then the ad
    // break's duration, both floats.
    val metadata = StitchedAdMetadataToStringFingerprint.classDef.type
    val metadataField = adStarted.instanceField(metadata)
    val durations = StitchedAdMetadataToStringFingerprint.method.fieldsRead(metadata)
        .filter { it.type == "F" }
        .distinctBy { it.name }
    if (durations.size < 2) throw PatchException("Stitched ad durations not found in $metadata.")
    replaceMethodBody(PLAYER_EVENTS_CLASS, "adDuration", 2, metadataFloatGetter(adStarted.type, metadataField, durations[0]))
    replaceMethodBody(PLAYER_EVENTS_CLASS, "adBreakDuration", 2, metadataFloatGetter(adStarted.type, metadataField, durations[1]))

    hookPlayerMute()

    // The event dispatch of each player: an instance method that takes only a player event.
    val dispatchers = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } == listOf(eventBase)
            ) {
                dispatchers += classDef.type to method.name
            }
        }
    }
    if (dispatchers.isEmpty()) throw PatchException("No player sends $eventBase events.")

    dispatchers.forEach { (playerType, methodName) -> hookPlayerEventDispatch(playerType, methodName, eventBase) }
}

private fun BytecodePatchContext.hookPlayerEventDispatch(playerType: String, methodName: String, eventBase: String) {
    val player = mutableClassDefBy(playerType)

    // The view the player draws into, an interface with getView().
    var getView: String? = null
    val renderViewField = player.fields.singleOrNull { field ->
        if (AccessFlags.STATIC.isSet(field.accessFlags)) return@singleOrNull false
        val type = classDefByOrNull(field.type) ?: return@singleOrNull false
        if (!AccessFlags.INTERFACE.isSet(type.accessFlags)) return@singleOrNull false
        val method = type.methods.singleOrNull {
            it.name == "getView" && it.parameterTypes.isEmpty() && it.returnType == "Landroid/view/View;"
        } ?: return@singleOrNull false
        getView = "${field.type}->${method.name}()Landroid/view/View;"
        true
    } ?: throw PatchException("Render view field not found in the player $playerType.")

    player.methods.add(
        ImmutableMethod(
            player.type,
            PLAYER_EVENT_HELPER,
            listOf(
                ImmutableMethodParameter(player.type, null, null),
                ImmutableMethodParameter(eventBase, null, null),
            ),
            "Z",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $playerType->${renderViewField.name}:${renderViewField.type}
                    const/4 v1, 0x0
                    if-eqz v0, :report
                    invoke-interface { v0 }, $getView
                    move-result-object v1
                    :report
                    invoke-static { p0, v1, p1 }, $EXTENSION_CLASS->onPlayerEvent(Ljava/lang/Object;Landroid/view/View;Ljava/lang/Object;)Z
                    move-result v0
                    return v0
                """,
            )
        },
    )

    val dispatch = player.methods.single {
        it.name == methodName && it.parameterTypes.map { type -> type.toString() } == listOf(eventBase)
    }
    dispatch.apply {
        // v0 is used before the method's own code runs, so it must not be a parameter.
        if (thisRegister == 0) throw PatchException("Player event dispatch of $playerType has no free register.")
        addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p1 }, $playerType->$PLAYER_EVENT_HELPER($playerType$eventBase)Z
                move-result v0
                if-eqz v0, :dispatch
                return-void
                :dispatch
                nop
            """,
        )
    }
}

/**
 * Lets the extension mute the player during stitched ads, the way the player presenter's setMuted
 * does: it calls the player's mute method, or its unmute method.
 */
private fun BytecodePatchContext.hookPlayerMute() {
    val calls = PlayerPresenterSetMutedFingerprint.method.instructions
        .filter { it.opcode == Opcode.INVOKE_INTERFACE }
        .map { (it as ReferenceInstruction).reference as MethodReference }
        .filter { it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf("Z") }
    val mute = calls.firstOrNull()
    val unmute = calls.lastOrNull()
    if (mute == null || unmute == null || mute.name == unmute.name || mute.definingClass != unmute.definingClass) {
        throw PatchException("Player mute and unmute calls not found in setMuted.")
    }
    val player = mute.definingClass

    replaceMethodBody(
        PLAYER_EVENTS_CLASS,
        "setMuted",
        3,
        """
            instance-of v0, p0, $player
            if-eqz v0, :done
            check-cast p0, $player
            const/4 v0, 0x0
            if-eqz p1, :unmute
            invoke-interface { p0, v0 }, $player->${mute.name}(Z)V
            return-void
            :unmute
            invoke-interface { p0, v0 }, $player->${unmute.name}(Z)V
            :done
            return-void
        """,
    )
}

/**
 * Stops the ads the app requests and plays itself: prerolls, midrolls and VOD midrolls, and
 * picture by picture ads. Ads the stream asks for are dropped with the player events.
 */
private fun BytecodePatchContext.hookClientAds() {
    // The presenter that requests every client-side video ad drops all requests when its
    // "shouldShowAds" is false, as Twitch does for clips and dashboard VODs.
    ClientAdRequestPresenterConstructorFingerprint.method.apply {
        val register = parameterRegister(this, parameterTypes.indexOfFirst { it.toString() == "Z" })
        addInstructions(
            0,
            """
                invoke-static/range { $register .. $register }, $EXTENSION_CLASS->overrideShowAds(Z)Z
                move-result $register
            """,
        )
    }

    // The result of the ad eligibility check, in case a request gets that far.
    val eligibilityEvent = EligibilityCheckCompletedToStringFingerprint.classDef.type
    adEligibilityResultFingerprint(eligibilityEvent).method.addInstructions(
        0,
        """
            invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->overrideShouldRequestAd(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
        """,
    )

    // Picture by picture ads (the stream keeps playing in a corner during the ad) start only if
    // the feature is on.
    PictureByPictureEnabledFingerprint.method.returnEarly("const/4 v0, 0x0", "return v0")
}

/**
 * Hides display ads: banners next to the player, ads in native lists and at the top of browse
 * pages, and the ads of the React Native home feed.
 */
private fun BytecodePatchContext.hookDisplayAds() {
    // The parser returns the "no ad" singleton, a subclass of its return type with a static
    // field of its own type.
    DisplayAdParserFingerprint.method.apply {
        val noAd = instructions.filter { it.opcode == Opcode.SGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .firstOrNull { field ->
                field.type == field.definingClass && classDefByOrNull(field.type)?.superclass == returnType
            } ?: throw PatchException("No ad result not found in the display ad parser.")
        returnEarly("sget-object v0, ${noAd.definingClass}->${noAd.name}:${noAd.type}", "return-object v0")
    }

    // Browse pages show no display ad to Turbo users.
    val browseState = mutableClassDefBy(BrowseDisplayAdStateToStringFingerprint.classDef.type)
    val browseStateConstructor = browseState.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map { type -> type.toString() } == listOf("Z")
    } ?: throw PatchException("Browse display ad state constructor not found.")
    browseStateConstructor.addInstructions(
        0,
        """
            invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->overrideIsTurbo(Z)Z
            move-result p1
        """,
    )

    // Video ads in the React Native home feed get no player.
    FeedVideoAdPlayerFingerprint.method.returnEarly("const/4 v0, 0x0", "return-object v0")

    // The home feed's JavaScript requests its ads itself.
    ReactNativeSendRequestFingerprint.method.addInstructions(
        0,
        """
            invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->overrideReactNativeUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """,
    )
}

/**
 * Loads live streams through the proxy the user entered, and from Twitch if the proxy fails.
 */
private fun BytecodePatchContext.hookProxy() {
    StreamPlaylistUriFingerprint.method.apply {
        val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
        if (returnIndices.isEmpty()) throw PatchException("Stream playlist URL method has no return.")
        returnIndices.asReversed().forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->overrideStreamUri(Landroid/net/Uri;)Landroid/net/Uri;
                    move-result-object v$register
                """,
            )
        }
    }

    // Amazon IVS loads the playlist with MediaPlayer.preload(Uri, Source.Listener). The listener
    // is wrapped so a failed proxy falls back to Twitch.
    val preloadCalls = mutableListOf<Pair<String, Method>>()
    var preload: MethodReference? = null
    var preloadOpcode: Opcode? = null
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEach { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                if (reference != null && isIvsPreload(reference)) {
                    preloadCalls += classDef.type to method
                    if (preload == null) {
                        preload = reference
                        preloadOpcode = instruction.opcode
                    }
                }
            }
        }
    }
    val preloadReference = preload ?: throw PatchException("MediaPlayer.preload call not found.")
    val invoke = when (preloadOpcode) {
        Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE -> "invoke-interface"
        else -> "invoke-virtual"
    }
    val listenerType = preloadReference.parameterTypes[1].toString()
    replaceMethodBody(
        PLAYER_EVENTS_CLASS,
        "preload",
        3,
        """
            check-cast p0, ${preloadReference.definingClass}
            check-cast p2, $listenerType
            $invoke { p0, p1, p2 }, ${preloadReference.definingClass}->preload(Landroid/net/Uri;$listenerType)V
            return-void
        """,
    )

    preloadCalls.map { (type, method) -> type to method.smaliSignature }.distinct().forEach { (type, signature) ->
        val method = mutableClassDefBy(type).methods.single { it.smaliSignature == signature }
        method.instructions.indices.filter { index ->
            val reference = (method.instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            reference != null && isIvsPreload(reference)
        }.forEach { index -> replaceWithExtensionPreload(method, index) }
    }
}

private fun isIvsPreload(reference: MethodReference) =
    reference.definingClass.startsWith(IVS_PACKAGE) && reference.name == "preload" &&
        reference.returnType == "V" &&
        reference.parameterTypes.map { it.toString() }.let {
            it.size == 2 && it[0] == "Landroid/net/Uri;" && it[1].startsWith(IVS_PACKAGE)
        }

private fun replaceWithExtensionPreload(method: MutableMethod, index: Int) {
    val target = "$EXTENSION_CLASS->preload(Ljava/lang/Object;Landroid/net/Uri;Ljava/lang/Object;)V"
    when (val instruction = method.instructions[index]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            index,
            "invoke-static { v${instruction.registerC}, v${instruction.registerD}, v${instruction.registerE} }, $target",
        )
        is RegisterRangeInstruction -> {
            val first = instruction.startRegister
            method.replaceInstruction(index, "invoke-static/range { v$first .. v${first + 2} }, $target")
        }
        else -> throw PatchException("Unexpected preload call in ${method.definingClass}.")
    }
}

/**
 * Inserts at the start: if the extension says ads are blocked, run [returnInstructions], which
 * must return. Needs v0 to be free (not a parameter).
 */
private fun MutableMethod.returnEarly(vararg returnInstructions: String) {
    if (AccessFlags.STATIC.isSet(accessFlags) || thisRegister == 0) {
        throw PatchException("$definingClass->$name has no free register.")
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $EXTENSION_CLASS->shouldBlockAds()Z
            move-result v0
            if-eqz v0, :original
            ${returnInstructions.joinToString("\n")}
            :original
            nop
        """,
    )
}

/** The class right below java.lang.Object in the superclasses of [classDef]. */
private fun BytecodePatchContext.topSuperclass(classDef: ClassDef): String {
    var current = classDef
    while (true) {
        val superclass = current.superclass ?: return current.type
        if (superclass == "Ljava/lang/Object;") return current.type
        current = classDefByOrNull(superclass) ?: return superclass
    }
}

/** The smali name of the register of a method's parameter (p1 is the first after `this`). */
private fun parameterRegister(method: Method, index: Int): String {
    if (index < 0) throw PatchException("Parameter not found in ${method.definingClass}->${method.name}.")
    val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
    val offset = method.parameterTypes.take(index).sumOf { type ->
        if (type.toString() == "J" || type.toString() == "D") 2 else 1
    }
    return "p${offset + if (isStatic) 0 else 1}"
}

private val Method.smaliSignature: String
    get() = "$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Code for a stub with one parameter that returns a float of the stitched ad's metadata if the
 * argument is the stitched ad started event, and 0 otherwise. Needs 2 registers.
 */
private fun metadataFloatGetter(eventType: String, metadataField: FieldReference, field: FieldReference) = """
    instance-of v0, p0, $eventType
    if-eqz v0, :none
    check-cast p0, $eventType
    iget-object v0, p0, $eventType->${metadataField.name}:${metadataField.type}
    iget v0, v0, ${field.definingClass}->${field.name}:F
    return v0
    :none
    const/4 v0, 0x0
    return v0
"""
