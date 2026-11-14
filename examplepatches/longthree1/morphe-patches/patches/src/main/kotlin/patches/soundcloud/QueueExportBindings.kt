package patches.soundcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXPORT = "Lnl/johninnl/soundcloud/QueueExport;"
private const val ROOT = "Lcom/soundcloud/android/"
private const val SERVICE = "${ROOT}playback/players/MediaService;"
private const val PROVIDER = "${ROOT}playback/PlaybackMediaProvider;"
private const val METADATA = "${ROOT}playback/mediasession/MetadataOperations;"
private const val ITEM = "${ROOT}foundation/playqueue/PlayQueueItem;"
private const val MANAGER = "${ROOT}features/playqueue/PlayQueueManager;"
private const val CONTROLLER = "${ROOT}playback/DefaultPlaySessionController;"
private const val ADS = "${ROOT}ads/player/PlayerAdsController;"
private const val CALLBACK = "Landroid/support/v4/media/session/MediaSessionCompat\$Callback\$MediaSessionCallbackApi21;"
private const val COMPAT = "Landroid/support/v4/media/session/MediaSessionCompat;"
private const val OBJECT = "Ljava/lang/Object;"

context(context: BytecodePatchContext)
internal fun bindQueueExport() {
    fun field(owner: String, type: String) = context.classDefBy(owner).fields.singleOrNull { it.type == type }
        ?.also { if (!AccessFlags.PUBLIC.isSet(it.accessFlags)) throw PatchException("SoundCloud queue field inaccessible: $it") }
        ?: throw PatchException("SoundCloud queue field changed: $owner $type")
    fun method(owner: String, result: String, vararg parameters: String) = context.classDefBy(owner).methods.singleOrNull {
        it.returnType == result && it.parameterTypes.map(CharSequence::toString) == parameters.toList()
    } ?: throw PatchException("SoundCloud queue method changed: $owner $result ${parameters.toList()}")
    fun dispatch(method: MethodReference) = if (AccessFlags.INTERFACE.isSet(context.classDefBy(method.definingClass).accessFlags))
        "invoke-interface" else "invoke-virtual"
    val extension = context.mutableClassDefBy(EXPORT)
    fun bridge(name: String, result: String, parameters: List<String>, locals: Int, code: String) {
        extension.methods.removeAll { it.name == name }
        extension.methods.add(MutableMethod(ImmutableMethod(EXPORT, name,
            parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result, AccessFlags.STATIC.value,
            emptySet(), emptySet(), ImmutableMethodImplementation(locals + parameters.size, emptyList(), emptyList(), emptyList())))
            .apply { addInstructions(0, code.trimIndent()) })
    }
    val provider = field(SERVICE, "${ROOT}playback/players/queue/MediaProvider;")
    val updates = field(SERVICE, "${ROOT}foundation/playqueue/PlayQueueUpdates;")
    val metadata = field(PROVIDER, METADATA)
    bridge("provider", OBJECT, listOf(OBJECT), 1, """
        check-cast p0, $SERVICE
        iget-object v0, p0, $provider
        return-object v0
    """)
    bridge("updates", OBJECT, listOf(OBJECT), 1, """
        check-cast p0, $SERVICE
        iget-object v0, p0, $updates
        return-object v0
    """)
    bridge("metadata", OBJECT, listOf(OBJECT), 1, """
        check-cast p0, $PROVIDER
        iget-object v0, p0, $metadata
        return-object v0
    """)
    val resolve = method(METADATA, "Lio/reactivex/rxjava3/core/Observable;", ITEM)
    bridge("resolveMetadata", OBJECT, listOf(OBJECT, OBJECT), 1, """
        check-cast p0, $METADATA
        check-cast p1, $ITEM
        ${dispatch(resolve)} { p0, p1 }, $resolve
        move-result-object v0
        return-object v0
    """)
    val callbackSession = method(CALLBACK, "$COMPAT".removeSuffix(";") + "\$MediaSessionImplApi21;")
    bridge("callbackSession", OBJECT, listOf(OBJECT), 1, """
        check-cast p0, $CALLBACK
        ${dispatch(callbackSession)} { p0 }, $callbackSession
        move-result-object v0
        return-object v0
    """)

    // Match the phone queue's selection operations, preserving its ad handling and save operation.
    // Use the resolved occurrence's position instead of indexOfPlayQueueItem, which collapses duplicates.
    val select = method(CONTROLLER, "V", ITEM)
    val calls = select.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.toList()
    val ads = calls.single { it.definingClass == ADS && it.returnType == "V" && it.parameterTypes.isEmpty() }
    val move = calls.single { it.definingClass == MANAGER && it.parameterTypes.map(CharSequence::toString) == listOf("I", "Z", "${ROOT}foundation/domain/playqueue/RepeatMode;") }
    val save = calls.single { it.definingClass == MANAGER && it.returnType == "V" && it.parameterTypes.isEmpty() }
    val controllerField = field(PROVIDER, "${ROOT}playback/session/PlaySessionController;")
    val adsField = field(CONTROLLER, ADS)
    val managerField = field(CONTROLLER, MANAGER)
    val verifierType = "${ROOT}features/playqueue/PlayQueueItemVerifier;"
    val connectionType = "${ROOT}utilities/android/network/ConnectionHelper;"
    val providerManager = field(PROVIDER, MANAGER)
    val verifier = field(MANAGER, verifierType)
    val connection = field(verifierType, connectionType)
    val managerCalls = context.classDefBy(MANAGER).methods.flatMap { original ->
        original.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }?.toList() ?: emptyList()
    }.distinctBy { it.toString() }
    val connected = managerCalls.single { it.definingClass == connectionType && it.returnType == "Z" && it.parameterTypes.isEmpty() }
    val predicate = managerCalls.single { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "Z", "I") }
    if (context.classDefBy(predicate.definingClass).methods.none { original ->
        original.name == "invoke" && original.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == verifierType
        } == true
    }) throw PatchException("SoundCloud queue eligibility predicate changed")
    bridge("eligible", "Z", listOf(OBJECT, OBJECT), 4, """
        check-cast p0, $PROVIDER
        iget-object v0, p0, $providerManager
        iget-object v1, v0, $verifier
        iget-object v2, v1, $connection
        ${dispatch(connected)} { v2 }, $connected
        move-result v2
        const/4 v3, 0x5
        new-instance v0, ${predicate.definingClass}
        invoke-direct { v0, v1, v2, v3 }, $predicate
        invoke-interface { v0, p1 }, Lkotlin/jvm/functions/Function1;->invoke($OBJECT)$OBJECT
        move-result-object v0
        check-cast v0, Ljava/lang/Boolean;
        invoke-virtual { v0 }, Ljava/lang/Boolean;->booleanValue()Z
        move-result v0
        return v0
    """)
    bridge("selectPosition", "V", listOf(OBJECT, "I"), 4, """
        check-cast p0, $PROVIDER
        iget-object v0, p0, $controllerField
        check-cast v0, $CONTROLLER
        iget-object v1, v0, $adsField
        ${dispatch(ads)} { v1 }, $ads
        iget-object v0, v0, $managerField
        const/4 v1, 0x1
        const/4 v2, 0x0
        ${dispatch(move)} { v0, p1, v1, v2 }, $move
        ${dispatch(save)} { v0 }, $save
        return-void
    """)

    // Reflection is used only for unrenamed interface/getter contracts. Fail the port if they changed.
    for ((owner, name, parameters) in listOf(
        Triple("Lio/reactivex/rxjava3/core/Observable;", "subscribe", listOf("Lio/reactivex/rxjava3/functions/Consumer;", "Lio/reactivex/rxjava3/functions/Consumer;")),
        Triple("Lio/reactivex/rxjava3/disposables/Disposable;", "dispose", emptyList()),
        Triple("${ROOT}foundation/playqueue/PlayQueue;", "getEntries", emptyList()),
        Triple("${ROOT}foundation/playqueue/PlayQueue;", "getCurrentPosition", emptyList()),
        Triple("${ROOT}foundation/playqueue/PlayQueueItemWithContext;", "getPlayQueueItem", emptyList()),
        Triple("${ROOT}foundation/playqueue/PlayQueueUpdates;", "getPlayQueueObservable", emptyList()),
    )) if (context.classDefBy(owner).methods.none { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters })
        throw PatchException("SoundCloud queue contract changed: $owner->$name")

    val service = context.mutableClassDefBy(SERVICE)
    val session = field(SERVICE, COMPAT)
    val create = service.methods.single { it.name == "onCreate" }
    create.addInstructions(create.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }, """
        move-object/from16 v1, p0
        iget-object v0, v1, $session
        invoke-static { v1, v0 }, $EXPORT->attach($OBJECT$OBJECT)V
    """)
    service.methods.single { it.name == "onDestroy" }.addInstruction(0, "invoke-static/range { p0 .. p0 }, $EXPORT->detach($OBJECT)V")
    service.methods.single {
        it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/support/v4/media/session/PlaybackStateCompat;")
    }.apply {
        // R8 reuses p0 in this method. Bind to the actual session setter receiver instead.
        val setter = instructions.withIndex().single { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == COMPAT && ref.returnType == "V" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/support/v4/media/session/PlaybackStateCompat;")
        }
        val receiver = when (val instruction = setter.value) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> throw PatchException("SoundCloud session setter invocation changed")
        }
        addInstruction(setter.index + 1, "invoke-static/range { v$receiver .. v$receiver }, $EXPORT->stateChanged($OBJECT)V")
    }
    context.mutableClassDefBy(CALLBACK).methods.single { it.name == "onSkipToQueueItem" }.addInstruction(0,
        "invoke-static/range { p0 .. p2 }, $EXPORT->select(${OBJECT}J)V")
}
