/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Modified by lavinhoque33, 2026-11-19.
 * Modified by lavinhoque33, 2026-11-17.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.video.information.ModernVideoEndFingerprint
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayMethodRef
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayWithRegistryMethodRef
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val REPLAY = "Lapp/morphe/extension/music/patches/downloads/OfflineReplayHooks;"
private const val PLAYER_FALLBACK = "Lapp/morphe/extension/music/patches/downloads/PlayerFallback;"
private const val PAGE_REQUEST = $$"Lapp/morphe/extension/music/patches/downloads/DownloadsPage$PageRequest;"
private const val PAGE_RESPONSE = $$"Lapp/morphe/extension/music/patches/downloads/DownloadsPage$PageResponse;"
private const val NEXT_REQUEST = $$"Lapp/morphe/extension/music/patches/downloads/OfflineReplay$NextRequest;"
private const val STREAM_RESPONSE = $$"Lapp/morphe/extension/music/patches/downloads/StreamSwap$Response;"
private const val BROWSE_BYTES = $$"Lapp/morphe/extension/music/patches/downloads/OfflineBrowsePages$Bytes;"
private const val DETAIL_PAGE = $$"Lapp/morphe/extension/music/patches/downloads/OfflineReplay$DetailPage;"
private const val SHEET_CONTROLLER = $$"Lapp/morphe/extension/music/patches/downloads/NoConnectionSheet$Controller;"
private const val ON_SHEET_SHOWN = "$REPLAY->noConnectionSheetShown(Ljava/lang/Object;)V"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val THROWABLE = "Ljava/lang/Throwable;"
private const val MAP = "Ljava/util/Map;"
private const val LIST = "Ljava/util/List;"
private const val FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"
private const val EXECUTOR = "Ljava/util/concurrent/ScheduledExecutorService;"
private const val REGISTRY = "Lcom/google/protobuf/ExtensionRegistryLite;"

/** The browse id the "No connection" sheet's "Go to downloads" button opens. */
private const val SHEET_BROWSE = "FEmusic_offline"

private val REPLAY_VERSIONS = setOf("9.45.51", "9.40.51", "9.15.51", "8.30.54", "8.28.54", "8.12.54")

/** The experiment flag the offline watch command gate reads in every supported version (the id is the same). */
private const val GATE_EXPERIMENT = 0x02b88604L

/** The string the Downloads page service logs under, which no other class holds in its static initializer. */
private const val PAGE_SERVICE =
    "com/google/android/apps/youtube/music/offline/service/OfflineBrowsePageGenerationService"

/** The one string of the constructor of the request of that service: the name its log lines go under. */
private const val PAGE_REQUEST_NAME = "OfflineBrowsePageGenerationService"

/** The message the failure method of the page fragment (the base class of playlist and album pages) logs. */
private const val DETAIL_ERROR = "AbstractDetailPageFragment onEntityError."
private const val BROWSE_CACHE_FAILURE = "Failed to load response from PersistentBrowseService"
private const val BROWSE_METADATA = "BrowseResponseMetadata{responseTimeMs="
private val PLAYLIST_SYNC_VERSIONS = setOf("9.45.51", "9.40.51", "9.15.51", "8.30.54")

/** Message of the failure the stock player lookup ends with when a song was not downloaded the stock way. */
private const val UNPLAYABLE = "Unplayable Video"

/**
 * Offline playback of stream copies, in 9.45.51 / 9.40.51 / 9.15.51 / 8.30.54 order:
 * gate `Lgsz.c` / `Lgup.c` / `Lkch.c` / `Ljto.c`, player lookup `Laaqf.c` / `Laalc.c` / `Laxlp.c` / `Lauhp.c`,
 * watch-next entry `Lhyc.b` / `Lhyv.b` / `Lntb.b` / `Lnez.b`, requests `Labpl` / `Labjm` / `Lazmi` / `Lawgh`.
 * Every dependency of every hook is resolved before anything is changed, and the hooks go in together or not at all:
 * a version whose shape is unfamiliar only warns and plays as before. Needs [installStreamSwap]: the stored response
 * gets the same audio swap an online one does.
 */
internal fun BytecodePatchContext.installOfflineReplay() {
    if (packageMetadata.versionName !in REPLAY_VERSIONS) {
        printInfo("OfflineReplay: not available on this Music version; playback unchanged.")
        printWarn("Playlist sync skipped: native offline browse is not installed on this Music version.")
        return
    }

    try {
        val commandType = nativeDownloadsCommandResolverFingerprint.method.parameterTypes[1].toString()
        val supported = mutableClassDefBy(REPLAY).methods.single { it.name == "supported" }
        val installGate = prepareReplayGate(commandType)
        val (requestType, installTail) = prepareReplayTail()
        val (shuffleAvailable, installNext) = prepareReplayNext(requestType, commandType)

        val installPage = prepareDownloadsPage()
        val installBrowse = prepareBrowsePages(shuffleAvailable)
        val installSeek = prepareSeekSnap()
        val installSheet = prepareNoConnectionSheet()

        installGate()
        installTail()
        installNext()
        installPage?.invoke()
        installBrowse?.invoke()
        installSeek?.invoke()
        installSheet?.invoke()?.let(::printInfo)
        supported.returnEarly(true)
        if (installBrowse != null && packageMetadata.versionName in PLAYLIST_SYNC_VERSIONS) {
            mutableClassDefBy(PLAYLIST_SYNC).methods.single { it.name == "syncSupported" }.returnEarly(true)
        } else {
            printWarn("Playlist sync skipped: its native browse integration is not supported on this Music version.")
        }
        printInfo(
            "OfflineReplay: gate, player lookup and watch-next hooked; " +
                "request $requestType",
        )
    } catch (ex: Exception) {
        printWarn("OfflineReplay: hooks unavailable; online playback unchanged: ${ex.message}")
    }
}

/**
 * The Library's Downloads chip view: the app builds the page itself from its own downloads, in the service the
 * string [PAGE_SERVICE] names (`Lhse.d(request, options, callback)` in 9.45.51, `Lhtd.c` in 9.40.51, `Lnck.c` in
 * 9.15.51, `Lmpe.b` in 8.30.54: the one method of the class returning nothing and taking three objects). The callback,
 * the third argument, is replaced on entry by [REPLAY]'s wrapper, which adds the stream copies to the page the service
 * delivers. Three bridges give the extension what it needs without a name of the app's: the request's message
 * serialized (its continuation token says which chip it is), and the response's section list serialized and built
 * again from other bytes. The response is the class whose instance the callback's consumer casts to before it calls
 * the callback's one method that takes an object; it holds a wrapper which holds the section list. Optional: a
 * version where the shape is not found shows the app's own Downloads view.
 */
private fun BytecodePatchContext.prepareDownloadsPage(): (() -> Unit)? {
    try {
        val serviceType = Fingerprint(name = "<clinit>", strings = listOf(PAGE_SERVICE)).matchSingle().classDef.type
        val service = mutableClassDefBy(serviceType)
        val method = service.methods.single { candidate ->
            candidate.returnType == "V" && !AccessFlags.STATIC.isSet(candidate.accessFlags) &&
                candidate.parameterTypes.size == 3 && candidate.parameterTypes.all { it.startsWith("L") }
        }
        val requestBase = method.parameterTypes[0].toString()
        val callbackType = method.parameterTypes[2].toString()
        val registers = method.implementation!!.registerCount
        // The hook keeps the wrapped callback in one local, which is free at the entry.
        check(registers - 4 >= 1) { "page: no free registers" }

        val request = pageRequestBridge(requestBase)
        val response = pageResponseBridge(serviceType, callbackType)

        val refresh = prepareDownloadsPageRefresh(serviceType)

        return {
            request()
            response()
            refresh?.invoke()
            // request, options and the callback are consecutive parameter registers, so one local is enough.
            method.addInstructions(0, """
                invoke-static/range {p1 .. p3}, $REPLAY->wrapDownloadsPage($OBJECT$OBJECT$OBJECT)$OBJECT
                move-result-object v0
                check-cast v0, $callbackType
                move-object/from16 p3, v0
            """)
        }
    } catch (ex: Exception) {
        printWarn("OfflineReplay: downloads page not hooked; the Downloads view is the app's own: ${ex.message}")
        return null
    }
}

/** The request class of the page service, and its message field, with a bridge that serializes the message. */
private fun BytecodePatchContext.pageRequestBridge(requestBase: String): () -> Unit {
    val constructor = Fingerprint(
        name = "<init>",
        custom = { method, _ ->
            method.implementation?.instructions?.any {
                it.getReference<StringReference>()?.string == PAGE_REQUEST_NAME
            } == true
        },
    ).matchSingle()
    val requestClass = mutableClassDefBy(constructor.classDef.type)
    check(requestClass.superclass == requestBase) { "page: the request is not the service's" }
    check(constructor.method.parameterTypes.size == 2) { "page: request constructor" }

    val message = constructor.method.parameterTypes[1].toString()
    val field = requestClass.fields.single { it.type == message && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val serialize = serializerOf(message)

    return {
        requestClass.interfaces.add(PAGE_REQUEST)
        requestClass.addDownloadsBridge("rvxRequestBytes", emptyList(), "[B", 2, """
            iget-object v0, p0, ${requestClass.type}->${field.name}:${field.type}
            invoke-virtual {v0}, $serialize
            move-result-object v0
            return-object v0
        """)
    }
}

/** The page response class, found from what the callback's consumer casts to, with its two bridges. */
private fun BytecodePatchContext.pageResponseBridge(serviceType: String, callbackType: String): () -> Unit {
    val interfaces = interfaceClosure(callbackType)
    // The call names the interface it was made on, and the method may be declared in one of its parents.
    val deliveries = interfaces.flatMap { type ->
        val methods = classDefByOrNull(type)?.methods?.toList().orEmpty()
        methods.filter { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) }
            .map { it.name }
    }.toSet()
    check(deliveries.isNotEmpty()) { "page: the callback takes no object" }

    val casts = mutableSetOf<String>()
    classDefForEach { owner ->
        owner.methods.forEach { consumer ->
            val steps = consumer.implementation?.instructions?.toList() ?: return@forEach
            steps.forEachIndexed { index, step ->
                val call = step.getReference<MethodReference>()
                val delivers = step.opcode == Opcode.INVOKE_INTERFACE && step is FiveRegisterInstruction &&
                    step.registerCount == 2 && call != null &&
                    call.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) &&
                    call.definingClass in interfaces && call.name in deliveries
                if (!delivers) return@forEachIndexed

                val response = (step as FiveRegisterInstruction).registerD
                val writer = steps.subList(0, index).lastOrNull {
                    (it as? OneRegisterInstruction)?.registerA == response
                }
                if (writer?.opcode == Opcode.CHECK_CAST) casts.add(writer.getReference<TypeReference>()!!.type)
            }
        }
    }

    val built = builtNear(serviceType)
    val candidates = casts.filter { it in built }.mapNotNull { type -> pageResponseShape(type) }
    check(candidates.size == 1) {
        "page: found ${candidates.map { it.response }} response classes among ${casts.size} types"
    }
    val shape = candidates.single()

    val response = mutableClassDefBy(shape.response)
    val serialize = serializerOf(shape.page)
    val parserOwner = parseByteArrayMethodRef.get()!!.definingClass
    val parser = mutableClassDefBy(parserOwner).methods.single {
        it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
    }
    val default = classDefByOrNull(shape.page)!!.fields.single {
        it.type == shape.page && AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val extras = shape.extraFields.withIndex().joinToString("\n") { (index, field) ->
        "iget v${2 + index}, p0, ${shape.response}->${field.name}:${field.type}"
    }
    val extraTypes = shape.extraFields.joinToString("") { it.type }
    val extraRegisters = shape.extraFields.indices.joinToString("") { ", v${2 + it}" }

    return {
        response.interfaces.add(PAGE_RESPONSE)
        response.addDownloadsBridge("rvxPageBytes", emptyList(), "[B", 2, """
            iget-object v0, p0, ${shape.response}->${shape.holder.name}:${shape.holder.type}
            iget-object v0, v0, ${shape.holder.type}->${shape.pageField.name}:${shape.pageField.type}
            invoke-virtual {v0}, $serialize
            move-result-object v0
            return-object v0
        """)
        response.addDownloadsBridge("rvxWithPageBytes", listOf("[B"), OBJECT, 4 + shape.extraFields.size, """
            sget-object v0, ${shape.page}->${default.name}:${default.type}
            invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
            move-result-object v1
            invoke-static {v0, p1, v1}, $parser
            move-result-object v0
            check-cast v0, ${shape.page}
            $extras
            new-instance v1, ${shape.response}
            invoke-direct {v1, v0$extraRegisters}, ${shape.response}-><init>(${shape.page}$extraTypes)V
            return-object v1
        """)
    }
}

/**
 * The types the code of [serviceType] creates, and the types the classes it creates create in turn: the page
 * service hands the work to a task of its own, which builds the response. Other services of the app answer
 * with pages of the same shape.
 */
private fun BytecodePatchContext.builtNear(serviceType: String): Set<String> {
    fun createdBy(type: String): Set<String> {
        val methods = classDefByOrNull(type)?.methods?.toList().orEmpty()
        return methods.flatMap { it.implementation?.instructions?.toList().orEmpty() }
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { it.getReference<TypeReference>()!!.type }
            .toSet()
    }

    val first = createdBy(serviceType)
    return first + first.flatMap { createdBy(it) }
}

/** [type] and every interface it extends, however far up. */
private fun BytecodePatchContext.interfaceClosure(type: String): Set<String> {
    val found = linkedSetOf<String>()
    fun add(current: String) {
        if (found.add(current)) classDefByOrNull(current)?.interfaces?.forEach { add(it) }
    }
    add(type)
    return found
}

/** What the extension needs of a page response class: the wrapper field, the section list field in it, the rest. */
private class PageResponseShape(
    val response: String,
    val page: String,
    val holder: FieldReference,
    val pageField: FieldReference,
    val extraFields: List<FieldReference>,
)

/**
 * The shape of [type] when it is a page response: a class with a constructor of a section list followed by numbers
 * only (the numbers are fields of the class, copied to a response built from other bytes), and a field of a wrapper
 * class that holds a field of that section list's type.
 */
private fun BytecodePatchContext.pageResponseShape(type: String): PageResponseShape? {
    val response = classDefByOrNull(type) ?: return null
    val own = response.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    for (constructor in response.methods.filter { it.name == "<init>" }) {
        val parameters = constructor.parameterTypes.map(CharSequence::toString)
        if (parameters.isEmpty() || !parameters.drop(1).all { it == "I" }) continue

        val page = parameters[0]
        val holders = own.mapNotNull { field ->
            val pageField = classDefByOrNull(field.type)?.fields?.singleOrNull {
                it.type == page && !AccessFlags.STATIC.isSet(it.accessFlags)
            }
            pageField?.let { field to it }
        }
        val extras = parameters.drop(1).map { primitive -> own.singleOrNull { it.type == primitive } ?: return null }
        if (holders.size == 1) {
            val (holder, pageField) = holders.single()
            return PageResponseShape(type, page, holder, pageField, extras)
        }
    }
    return null
}

/** The reference of the serializing method of a message class, which a base class of it may define. */
private fun BytecodePatchContext.serializerOf(message: String): String {
    var type: String? = message
    while (type != null) {
        val owner = classDefByOrNull(type) ?: break
        owner.methods.firstOrNull {
            it.name == "toByteArray" && it.parameterTypes.isEmpty() && it.returnType == "[B"
        }?.let { return "${owner.type}->toByteArray()[B" }
        type = owner.superclass
    }
    error("page: no serializer on $message")
}

/**
 * Captures the native detail model at success and retains existing album failure replay on its original versions.
 * Playlist requests use the first-load bridge when available instead of waiting for the stock error callback.
 */
private fun BytecodePatchContext.prepareBrowsePages(shuffleAvailable: Boolean): (() -> Unit)? {
    try {
        val failureMatch = Fingerprint(
            returnType = "V",
            strings = listOf(DETAIL_ERROR),
            custom = { method, _ ->
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 2 &&
                    method.parameterTypes[1] == THROWABLE
            },
        ).matchSingle()
        val page = mutableClassDefBy(failureMatch.classDef.type)
        val failure = failureMatch.method
        val stateType = failure.parameterTypes[0].toString()
        val success = page.methods.single {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(stateType, OBJECT)
        }
        check(success.implementation!!.registerCount - 3 in 2..13) { "browse: success registers" }

        val requestTypes = page.methods.flatMap { it.implementation?.instructions ?: emptyList() }
            .filter { it.opcode == Opcode.INSTANCE_OF }
            .mapNotNull { it.getReference<TypeReference>()?.type }
            .filter { classDefByOrNull(it)?.superclass == stateType }
            .distinct()
        check(requestTypes.size == 1) { "browse: found ${requestTypes.size} request classes" }
        val requestType = requestTypes.single()
        val idAccessors = classDefByOrNull(requestType)!!.methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() &&
                it.returnType == STRING && it.name != "toString"
        }
        check(idAccessors.size == 1) { "browse: found ${idAccessors.size} id accessors" }
        val idName = idAccessors.single().name

        val modelType = detailModelType(success)
        val modelClass = mutableClassDefBy(modelType)
        val modelInit = modelClass.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.size == 1 }
        check(modelInit != null) { "browse: model constructor" }
        val messageType = modelInit.parameterTypes.single().toString()
        val messageField = modelClass.fields.single {
            it.type == messageType && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val default = classDefByOrNull(messageType)!!.fields.single {
            it.type == messageType && AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val serialize = serializerOf(messageType)
        val keepLegacy = packageMetadata.versionName in PLAYLIST_SYNC_VERSIONS
        val legacyParser = if (keepLegacy) checkNotNull(parseByteArrayWithRegistryMethodRef.get()) else null
        val installInitial = try {
            prepareInitialDetail(page, success, stateType, requestType, modelInit, default, shuffleAvailable)
        } catch (ex: Exception) {
            printWarn("OfflineReplay: initial playlist detail load not hooked: ${ex.message}")
            if (!keepLegacy) return null
            null
        }
        val stock = if (keepLegacy) {
            check(failure.implementation!!.registerCount - 3 in 1..13) { "browse: failure registers" }
            ExternalLabel("rvx_page_stock", failure.getInstruction<Instruction>(0))
        } else null

        return {
            modelClass.interfaces.add(BROWSE_BYTES)
            modelClass.addDownloadsBridge("rvxBrowseBytes", emptyList(), "[B", 2, """
                iget-object v0, p0, $modelType->${messageField.name}:$messageType
                invoke-virtual {v0}, $serialize
                move-result-object v0
                return-object v0
            """)
            page.addDownloadsBridge("rvxPageId", listOf(stateType), STRING, 3, """
                instance-of v0, p1, $requestType
                if-eqz v0, :rvx_no_id
                check-cast p1, $requestType
                invoke-virtual {p1}, $requestType->$idName()$STRING
                move-result-object v0
                return-object v0
                :rvx_no_id
                const/4 v0, 0x0
                return-object v0
            """)
            success.addInstructions(0, """
                invoke-virtual {p0, p1}, ${page.type}->rvxPageId($stateType)$STRING
                move-result-object v0
                const/4 v1, ${if (keepLegacy) 1 else 0}
                invoke-static {v0, p2, v1}, $REPLAY->onBrowseResponse($STRING${OBJECT}Z)V
            """)
            if (stock != null && legacyParser != null) {
                page.addDownloadsBridge("rvxPageModel", listOf("[B"), OBJECT, 4, """
                    sget-object v0, $default
                    invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
                    move-result-object v1
                    invoke-static {v0, p1, v1}, $legacyParser
                    move-result-object v0
                    check-cast v0, $messageType
                    new-instance v1, $modelType
                    invoke-direct {v1, v0}, $modelInit
                    return-object v1
                """)
                failure.addInstructionsWithLabels(0, """
                    invoke-virtual {p0, p1}, ${page.type}->rvxPageId($stateType)$STRING
                    move-result-object v0
                    invoke-static {v0, p2}, $REPLAY->answerBrowse($STRING$THROWABLE)[B
                    move-result-object v0
                    if-eqz v0, :rvx_page_stock
                    invoke-virtual {p0, v0}, ${page.type}->rvxPageModel([B)$OBJECT
                    move-result-object v0
                    invoke-virtual {p0, p1, v0}, ${page.type}->${success.name}($stateType$OBJECT)V
                    return-void
                """, stock)
            }
            installInitial?.invoke()
        }
    } catch (ex: Exception) {
        printWarn("OfflineReplay: browse pages not hooked; a downloaded list opens as before: ${ex.message}")
        return null
    }
}

/** Before 8.30 the success method leaves the model untyped; resolve the native browse-result envelope instead. */
private fun BytecodePatchContext.detailModelType(success: Method): String {
    val checkedModels = success.implementation!!.instructions.filter { it.opcode == Opcode.INSTANCE_OF }
        .mapNotNull { it.getReference<TypeReference>()?.type }.distinct()
    if (checkedModels.isNotEmpty()) return checkedModels.single()

    val metadata = Fingerprint(strings = listOf(BROWSE_METADATA)).matchSingle().classDef
    val types = setOf(metadata.type, metadata.superclass).filterNotNull()
    val fallback = Fingerprint(returnType = FUTURE, strings = listOf(BROWSE_CACHE_FAILURE)).matchSingle().method
    return fallback.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }
        .single { it.name == "<init>" && it.parameterTypes.size == 2 && it.parameterTypes[1].toString() in types }
        .parameterTypes.first().toString()
}

/**
 * The fragment's onCreate and deferred first-load entry both call its abstract request issuer. Replacing those
 * invocations (rather than the issuer itself) leaves button and mutation refreshes alone. Stock onDestroy cancels
 * the request state; stock success sets it to LOADED. The worker's delivery checks the same identity and INITIAL
 * phase, so it cannot render a replaced, refreshed, or destroyed request.
 */
private fun BytecodePatchContext.prepareInitialDetail(
    page: MutableClass, success: MutableMethod, stateType: String, requestType: String,
    modelInit: MethodReference, default: FieldReference,
    shuffleAvailable: Boolean,
): () -> Unit {
    val state = classDefByOrNull(stateType) ?: error("browse: no request state class")
    val onCreate = page.methods.single {
        it.name == "onCreate" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
    }
    val createCode = onCreate.implementation!!.instructions.toList()
    check(createCode.any { it.getReference<StringReference>()?.string == "defer_entity_loading" }) {
        "browse: no fragment first-load gate"
    }
    val issuers = page.methods.filter {
        AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(stateType)
    }
    val issuer = issuers.single { method ->
        createCode.any { it.getReference<MethodReference>() == method }
    }
    val current = createCode.filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { it.getReference<FieldReference>() }
        .distinct().single { it.definingClass == page.type && it.type == stateType }
    val phase = state.fields.single { classDefByOrNull(it.type)?.superclass == "Ljava/lang/Enum;" }
    val initial = state.methods.single { it.name == "<init>" && it.parameterTypes.isEmpty() }
        .implementation!!.instructions.filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { it.getReference<FieldReference>() }
        .single { it.definingClass == phase.type && it.type == phase.type }
    val flags = state.methods.single {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("I")
    }
    val context = state.fields.single { it.type == MAP && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val deferred = page.methods.single {
        it.parameterTypes.isEmpty() && it.returnType == "V" &&
            it.implementation?.instructions?.any { instruction ->
                instruction.getReference<MethodReference>() == issuer
            } == true
    }
    val sites = listOf(onCreate, deferred).map { method ->
        val instructions = method.implementation!!.instructions.toList()
        val site = instructions.indices.single { index ->
            instructions[index].getReference<MethodReference>() == issuer
        }
        val invoke = instructions[site]
        check(invoke.opcode == Opcode.INVOKE_VIRTUAL && invoke is FiveRegisterInstruction &&
            invoke.registerCount == 2) { "browse: first-load invocation registers" }
        Triple(method, site, invoke)
    }
    val hook = mutableClassDefBy(REPLAY).methods.single { it.name == "localDetailSupported" }
    val shuffleHook = if (shuffleAvailable) {
        mutableClassDefBy(REPLAY).methods.single { it.name == "localPlaylistShuffleSupported" }
    } else null
    val (onlinePage, service) = stockDetailPage(issuer, requestType)
    val installSavedModel = prepareSavedPlaylistModel(onlinePage, service, modelInit, default)

    return {
        installSavedModel()
        onlinePage.interfaces.add(DETAIL_PAGE)
        page.addDownloadsBridge("rvxOwnsInitialBrowse", listOf(OBJECT), "Z", 4, """
            instance-of v0, p1, $requestType
            if-eqz v0, :rvx_other_request
            iget-object v0, p0, $current
            if-ne v0, p1, :rvx_other_request
            check-cast p1, $stateType
            iget-object v0, p1, $phase
            sget-object v1, $initial
            if-ne v0, v1, :rvx_other_request
            const/4 v0, 0x1
            return v0
            :rvx_other_request
            const/4 v0, 0x0
            return v0
        """)
        page.addDownloadsBridge("rvxInitialBrowseId", listOf(OBJECT), STRING, 4, """
            invoke-virtual {p0, p1}, ${page.type}->rvxOwnsInitialBrowse($OBJECT)Z
            move-result v0
            if-eqz v0, :rvx_no_initial
            check-cast p1, $stateType
            const/4 v0, 0x2
            invoke-virtual {p1, v0}, $flags
            move-result v0
            if-nez v0, :rvx_no_initial
            invoke-virtual {p0, p1}, ${page.type}->rvxPageId($stateType)$STRING
            move-result-object v0
            iget-object v1, p1, $context
            invoke-static {v0, v1}, $REPLAY->initialDetailId($STRING$MAP)$STRING
            move-result-object v0
            return-object v0
            :rvx_no_initial
            const/4 v0, 0x0
            return-object v0
        """)
        page.addDownloadsBridge("rvxFinishInitialBrowse", listOf(OBJECT, OBJECT), "Z", 4, """
            invoke-virtual {p0, p1}, ${page.type}->rvxOwnsInitialBrowse($OBJECT)Z
            move-result v0
            if-eqz v0, :rvx_not_delivered
            check-cast p1, $stateType
            if-eqz p2, :rvx_issue_stock
            invoke-virtual {p0, p1, p2}, ${page.type}->${success.name}($stateType$OBJECT)V
            const/4 v0, 0x1
            return v0
            :rvx_issue_stock
            invoke-virtual {p0, p1}, $issuer
            :rvx_not_delivered
            const/4 v0, 0x0
            return v0
        """)
        page.addDownloadsBridge("rvxLoadInitialBrowse", listOf(stateType), "V", 3, """
            invoke-static {p0, p1}, $REPLAY->openInitialBrowse($OBJECT$OBJECT)Z
            move-result v0
            if-nez v0, :rvx_initial_handled
            invoke-virtual {p0, p1}, $issuer
            :rvx_initial_handled
            return-void
        """)
        for ((method, index, invoke) in sites) {
            method.replaceInstruction(index,
                "invoke-virtual {v${invoke.registerC}, v${invoke.registerD}}, " +
                    "${page.type}->rvxLoadInitialBrowse($stateType)V")
        }
        hook.returnEarly(true)
        shuffleHook?.returnEarly(true)
        printInfo("OfflineReplay: local first playlist detail load hooked in ${page.type} (${onlinePage.type})")
    }
}

/**
 * The native playlist fragment's bridge delegates to a public final typed method which issues the browse future.
 * The stock offline/media-provider fragment has a protected issuer and must keep using its own data.
 */
private fun BytecodePatchContext.stockDetailPage(
    issuer: MethodReference, requestType: String,
): Pair<MutableClass, FieldReference> {
    val match = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = "V",
        parameters = listOf(requestType),
        custom = { method, owner ->
            val bridge = owner.methods.singleOrNull {
                it.name == issuer.name && it.returnType == issuer.returnType &&
                    it.parameterTypes == issuer.parameterTypes
            }
            bridge?.implementation?.instructions?.any {
                it.getReference<MethodReference>() == method
            } == true && method.implementation?.instructions?.any(::isBrowseServiceCall) == true
        },
    ).matchSingle()
    val page = mutableClassDefBy(match.classDef.type)
    val code = match.method.implementation!!.instructions.toList()
    val service = code.single(::isBrowseServiceCall).getReference<MethodReference>()!!.definingClass
    val field = code.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { it.getReference<FieldReference>() }
        .distinct().single { it.definingClass == page.type && it.type == service }
    return page to field
}

private fun isBrowseServiceCall(instruction: Instruction): Boolean {
    val call = instruction.getReference<MethodReference>() ?: return false
    return instruction.opcode == Opcode.INVOKE_VIRTUAL && call.returnType == FUTURE &&
        call.parameterTypes.size == 2 && call.parameterTypes[0].startsWith("L") &&
        call.parameterTypes[1] == "Ljava/util/concurrent/Executor;"
}

/**
 * The seek of the player after a drag on the progress bar (`Lacbd.ap` in 9.40.51, found by the strings the video
 * information patch also uses). It asks the app's stream cache for the start of the span nearest to the target:
 * a negative answer cancels the seek, one below the target moves the target there, one at or above it seeks to the
 * target. A copy played from a file has no span, the lookup answers 0 and the seek restarts the song. The answer goes
 * through [REPLAY] on its way, which replaces a 0 with a value above any target while there is no network. The
 * lookup is the one call in the method that takes two objects, a long and a boolean and returns a long. Optional:
 * a version where it is not found only keeps the stock seek, and the rest still installs.
 */
private fun BytecodePatchContext.prepareSeekSnap(): (() -> Unit)? {
    try {
        val method = ModernVideoEndFingerprint.matchSingle().method
        val instructions = method.implementation!!.instructions.toList()
        val lookups = instructions.indices.filter { index ->
            val call = instructions[index]
            call.opcode in setOf(
                Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_INTERFACE,
                Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE_RANGE,
            ) &&
                call.getReference<MethodReference>()?.let { reference ->
                    val parameters = reference.parameterTypes.map(CharSequence::toString)
                    reference.returnType == "J" && parameters.size == 4 && parameters[0].startsWith("L") &&
                        parameters[1].startsWith("L") && parameters[2] == "J" && parameters[3] == "Z"
                } == true
        }
        check(lookups.size == 1) { "seek: found ${lookups.size} cache lookups" }

        val result = instructions[lookups.single() + 1]
        check(result.opcode == Opcode.MOVE_RESULT_WIDE) { "seek: lookup result is not used" }
        val register = (result as OneRegisterInstruction).registerA
        val insertion = lookups.single() + 1

        return {
            method.addInstructions(insertion + 1, """
                invoke-static/range {v$register .. v${register + 1}}, $REPLAY->seekSnap(J)J
                move-result-wide v$register
            """)
        }
    } catch (ex: Exception) {
        printWarn("OfflineReplay: seek snap not hooked; a drag on the progress bar seeks as stock: ${ex.message}")
        return null
    }
}

/**
 * The stock "No connection" bottom sheet covers the player controls offline. Its presenter (`Lhjm.a` in 9.40.51) builds
 * the mealbar with the "Go to downloads" button (the [SHEET_BROWSE] endpoint) and shows it through its controller, the
 * one call of a method of a class of its own fields' types that takes the mealbar and returns nothing. Right after that
 * call [REPLAY] gets the controller, to dismiss the sheet when a copy plays offline. The controller's own dismiss is
 * the method that reads the mealbar presenter's current mealbar and calls its dismiss: `iget-object`, `iget-object`
 * (each possibly followed by a `check-cast`), `if-eqz`, `invoke-virtual`, `return-void` (`Ljlj.a()V` in 9.40.51,
 * `Lrjd.a()V` in 9.15.51, `Lquv.a()V` in 8.30.54); the patch gives the
 * controller class a bridge `rvxDismiss` that calls it. Optional: when the shape is not found the sheet stays as stock.
 */
private fun BytecodePatchContext.prepareNoConnectionSheet(): (() -> String)? {
    try {
        val presenter = Fingerprint(
            returnType = "V",
            parameters = emptyList(),
            strings = listOf(SHEET_BROWSE),
            custom = { method, _ -> method.looksLikeSheetPresenter() },
        ).matchSingle()
        val owner = presenter.classDef
        val method = presenter.method
        val instructions = method.implementation!!.instructions.toList()

        val fieldTypes = owner.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type }.toSet()
        val shows = instructions.indices.filter { index ->
            instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                instructions[index].getReference<MethodReference>()?.let {
                    it.definingClass in fieldTypes && it.returnType == "V" && it.parameterTypes.size == 1
                } == true
        }
        check(shows.size == 1) { "sheet: found ${shows.size} calls that show the mealbar" }

        val show = instructions[shows.single()]
        val controllerType = show.getReference<MethodReference>()!!.definingClass
        val controller = mutableClassDefBy(controllerType)
        val dismisses = controller.methods.filter { it.isMealbarDismiss() }
        check(dismisses.size == 1) { "sheet: found ${dismisses.size} dismiss methods in $controllerType" }

        val register = (show as FiveRegisterInstruction).registerC
        val dismiss = dismisses.single()

        return {
            controller.interfaces.add(SHEET_CONTROLLER)
            controller.addDownloadsBridge("rvxDismiss", emptyList(), "V", 1, """
                invoke-virtual {p0}, $controllerType->${dismiss.name}()V
                return-void
            """)
            mutableClassDefBy(owner.type).findMutableMethodOf(method)
                .addInstruction(shows.single() + 1, "invoke-static {v$register}, $ON_SHEET_SHOWN")

            "OfflineReplay: no-connection sheet hooked ${owner.type}->${method.name}, controller $controllerType, " +
                "dismiss ${dismiss.name}"
        }
    } catch (ex: Exception) {
        printWarn("OfflineReplay: no-connection sheet not hooked; it stays as stock offline: ${ex.message}")
        return null
    }
}

/** The presenter's method: reads a clock (a no-argument interface call returning a long) and keeps long times. */
private fun Method.looksLikeSheetPresenter(): Boolean {
    val instructions = implementation?.instructions?.toList() ?: return false
    val opcodes = instructions.map { it.opcode }.toSet()

    return Opcode.SGET_WIDE in opcodes && Opcode.IPUT_WIDE in opcodes && Opcode.IPUT_BOOLEAN in opcodes &&
        instructions.any {
            it.opcode == Opcode.INVOKE_INTERFACE && it.getReference<MethodReference>()?.let { reference ->
                reference.returnType == "J" && reference.parameterTypes.isEmpty()
            } == true
        }
}

/** The controller's dismiss: reads the mealbar presenter's current mealbar and calls its dismiss when there is one. */
private fun Method.isMealbarDismiss(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || name == "<init>" || returnType != "V" || parameterTypes.isNotEmpty()) {
        return false
    }

    val opcodes = implementation?.instructions?.map { it.opcode }?.filter { it != Opcode.CHECK_CAST } ?: return false

    return opcodes == listOf(
        Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID,
    )
}

/**
 * The offline watch command resolver (`Laocx` extension 57703777). Behind an experiment flag it either drops the
 * command while the app counts itself offline or goes on to the watch endpoint handler `d(command, message, context)`.
 * Right after the flag is read the song's id is asked of [REPLAY]: a song with stored data while the device has no
 * network goes straight to the handler. Both branches of the stock code are left as they are otherwise.
 */
private fun BytecodePatchContext.prepareReplayGate(commandType: String): () -> Unit {
    val match = Fingerprint(
        returnType = "V",
        parameters = listOf(commandType, MAP),
        strings = listOf("PPSV", "PPSE", "PPAD", "PPSDST"),
        custom = { method, _ -> method.hasWideLiteral(GATE_EXPERIMENT) },
    ).matchSingle()
    val method = match.method
    val owner = match.classDef
    val instructions = method.implementation!!.instructions.toList()

    val literal = instructions.indexOfFirst {
        it.opcode == Opcode.CONST_WIDE_32 && (it as WideLiteralInstruction).wideLiteral == GATE_EXPERIMENT
    }
    val castIndex = (literal - 1 downTo 0).firstOrNull { instructions[it].opcode == Opcode.CHECK_CAST }
        ?: error("gate: no message cast")
    // 9.45 inserts an integer experiment selector between the message cast and the flag id.
    check(instructions.subList(castIndex + 1, literal).all { it.opcode == Opcode.CONST_16 }) {
        "gate: unexpected instructions after the message cast"
    }
    val cast = instructions[castIndex]
    val messageType = cast.getReference<TypeReference>()!!.type
    val message = (cast as OneRegisterInstruction).registerA
    val scratch = (instructions[literal] as OneRegisterInstruction).registerA

    val flagCall = (literal + 1 until instructions.size).first {
        instructions[it].opcode == Opcode.INVOKE_VIRTUAL
    }
    val flagMethod = instructions[flagCall].getReference<MethodReference>()!!
    val flagParameters = flagMethod.parameterTypes.map(CharSequence::toString)
    check(flagMethod.returnType == "Z" &&
        flagParameters in listOf(listOf("J", "Z"), listOf("I", "J", "Z"))) {
        "gate: unexpected experiment flag reader"
    }
    val flagResult = instructions[flagCall + 1]
    val flagTest = instructions[flagCall + 2]
    check(flagResult.opcode == Opcode.MOVE_RESULT && flagTest.opcode == Opcode.IF_EQZ) { "gate: no flag test" }
    val flag = (flagResult as OneRegisterInstruction).registerA
    check((flagTest as OneRegisterInstruction).registerA == flag && flag != scratch) { "gate: flag register" }
    val insertion = flagCall + 2

    val delegates = instructions.filter {
        it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_DIRECT
    }.filter {
        it.getReference<MethodReference>()?.let { call ->
            call.definingClass == owner.type && call.returnType == "V" &&
                call.parameterTypes.map(CharSequence::toString) == listOf(commandType, messageType, MAP)
        } == true
    }
    check(delegates.map { it.getReference<MethodReference>()!!.name }.distinct().size == 1) { "gate: no handler" }
    val handlerCall = delegates.last() as FiveRegisterInstruction
    check(handlerCall.registerCount == 4) { "gate: handler call shape" }
    val handler = handlerCall.getReference<MethodReference>()!!
    val self = handlerCall.registerC
    val command = handlerCall.registerD
    val context = handlerCall.registerF
    val invokeHandler = if (handlerCall.opcode == Opcode.INVOKE_DIRECT) "invoke-direct" else "invoke-virtual"
    val handlerSignature = "${owner.type}->${handler.name}(${commandType}${messageType}$MAP)V"

    val videoId = instructions.drop(literal).first {
        it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.let { field ->
            field.definingClass == messageType && field.type == STRING
        } == true
    }.getReference<FieldReference>()!!

    // The run from the cast to the flag test is straight code: it must keep what the handler call needs.
    for (index in castIndex..flagCall + 1) {
        val step = instructions[index]
        check(index == castIndex || (!step.writes(message) && !step.writes(self) &&
            !step.writes(command) && !step.writes(context))) { "gate: handler registers overwritten" }
    }
    // The handler's registers are copies of the arguments made once at the start and never reassigned.
    for (register in listOf(self, command, context)) {
        check(instructions.count { it.writes(register) } == 1) { "gate: register v$register is reassigned" }
    }
    check(listOf(self, command, message, context, scratch, flag).all { it <= 15 }) { "gate: register range" }
    check(instructions.isDeadFrom(insertion + 1, scratch) &&
        instructions.isDeadFrom((flagTest as BuilderOffsetInstruction).target.location.index, scratch)) {
        "gate: scratch register v$scratch is live"
    }

    val stock = ExternalLabel("rvx_replay_gate_stock", method.getInstruction<Instruction>(insertion))
    return {
        method.addInstructionsWithLabels(insertion, """
            invoke-static {v$flag}, $REPLAY->noteGateFlag(Z)V
            iget-object v$scratch, v$message, ${videoId.definingClass}->${videoId.name}:$STRING
            invoke-static {v$scratch}, $REPLAY->holdsForGate($STRING)Z
            move-result v$scratch
            if-eqz v$scratch, :rvx_replay_gate_stock
            $invokeHandler {v$self, v$command, v$message, v$context}, $handlerSignature
            return-void
        """, stock)
    }
}

/**
 * The offline player lookup. A song the stock lookup does not know (the user's stream copies are no entity of the
 * app's own offline store) ends in the `Unplayable Video` failure, which is delivered to the callback. In front of
 * that failure the lookup asks [REPLAY] for the stored response of the request's video; when it has one, the response
 * is built with the app's own factory (so the audio swap routes it to the copy) and delivered instead.
 *
 * @return the type of the request and the installation.
 */
private fun BytecodePatchContext.prepareReplayTail(): Pair<String, () -> Unit> {
    val match = Fingerprint(
        returnType = "V",
        parameters = listOf("L", "L"),
        strings = listOf(UNPLAYABLE),
        custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) },
    ).matchSingle()
    val method = match.method
    val owner = mutableClassDefBy(match.classDef.type)
    val requestType = method.parameterTypes[0].toString()
    val callbackType = method.parameterTypes[1].toString()
    val instructions = method.implementation!!.instructions.toList()
    val registers = method.implementation!!.registerCount

    val unplayable = instructions.indexOfFirst { it.getReference<StringReference>()?.string == UNPLAYABLE }
    val guard = (unplayable - 1 downTo 0).first { instructions[it].opcode.name.startsWith("if-") }
    check(instructions[guard].opcode == Opcode.IF_NEZ && instructions[guard + 1].opcode == Opcode.SGET_OBJECT) {
        "player: unexpected failure guard"
    }
    val scratch = (instructions[guard + 1] as OneRegisterInstruction).registerA
    val skipped = (instructions[guard] as BuilderOffsetInstruction).target.location.index
    check(instructions.isDeadFrom(guard + 1, scratch) && instructions.isDeadFrom(skipped, scratch) && scratch <= 255) {
        "player: scratch register v$scratch is live"
    }
    val parameters = registers - 3 until registers
    check(instructions.none { step -> parameters.any { step.writes(it) } }) { "player: parameters reassigned" }

    // The request's two answers, as the lookup itself reads them: the offline-only flag, then the video id.
    fun requestCall(returnType: String) = instructions.first { step ->
        (step.opcode == Opcode.INVOKE_VIRTUAL || step.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
            step.getReference<MethodReference>()?.let {
                it.definingClass == requestType && it.parameterTypes.isEmpty() && it.returnType == returnType
            } == true
    }.getReference<MethodReference>()!!
    val offlineOnly = requestCall("Z")
    val videoId = requestCall(STRING)

    val callbackNames = instructions.filter { it.opcode == Opcode.INVOKE_INTERFACE }
        .mapNotNull { it.getReference<MethodReference>() }
        .filter {
            it.definingClass == callbackType && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, OBJECT)
        }.map { it.name }.distinct()
    check(callbackNames.size == 1) { "player: no success callback" }
    val deliver = callbackNames.single()

    val wrapper = streamSwapAdapterClass()
    val factories = wrapper.methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType.startsWith("L") &&
            it.parameterTypes.map(CharSequence::toString) == listOf("[B", "J")
    }
    check(factories.isNotEmpty()) { "player: no response factory" }
    // The small one only wraps the bytes; the large one is the variant for a feature flag.
    val factory = factories.minBy { it.implementation?.instructions?.count() ?: Int.MAX_VALUE }
    val installPlayerFallback = preparePlayerFallback(requestType, offlineOnly, videoId, wrapper, factory)
    val cancelCallback = instructions.mapNotNull { it.getReference<MethodReference>() }.distinct().single {
        it.definingClass == callbackType && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "Ljava/lang/Exception;")
    }

    // Every failure of the lookup (an id the offline store lacks ends in a different catch block than a stale entry)
    // jumps to the guard: the hook takes over that jump target, so no failure path can skip it.
    return requestType to {
        installPlayerFallback()
        mutableClassDefBy(requestType).addDownloadsBridge("rvxCancelPlayer", listOf(OBJECT), "V", 5, """
            check-cast p1, $callbackType
            new-instance v1, Ljava/util/concurrent/CancellationException;
            invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V
            const/4 v0, 0x0
            invoke-interface {p1, v0, v1}, $cancelCallback
            return-void
        """)
        owner.addDownloadsBridge("rvxTail", listOf(requestType, callbackType), "Z", 8, """
            invoke-virtual {p1}, ${offlineOnly.definingClass}->${offlineOnly.name}()Z
            move-result v0
            invoke-virtual {p1}, ${videoId.definingClass}->${videoId.name}()$STRING
            move-result-object v1
            invoke-static {v1, v0}, $REPLAY->storedForPlayer(${STRING}Z)[B
            move-result-object v2
            if-nez v2, :stored
            invoke-static {p1, p2}, $PLAYER_FALLBACK->rejectPlayer($OBJECT$OBJECT)Z
            move-result v0
            return v0
            :stored
            invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
            move-result-wide v3
            invoke-static {v2, v3, v4}, ${wrapper.type}->${factory.name}([BJ)${factory.returnType}
            move-result-object v2
            invoke-static {v2, v1}, $REPLAY->finishPlayer($OBJECT$STRING)$OBJECT
            move-result-object v2
            if-nez v2, :deliver
            invoke-static {p1, p2}, $PLAYER_FALLBACK->rejectPlayer($OBJECT$OBJECT)Z
            move-result v0
            return v0
            :deliver
            const/4 v0, 0x0
            invoke-interface {p2, v0, v2}, $callbackType->$deliver($OBJECT$OBJECT)V
            const/4 v0, 0x1
            return v0
        """)
        method.addInstructionsAtControlFlowLabel(guard, """
            invoke-virtual/range {p0 .. p2}, ${owner.type}->rvxTail($requestType$callbackType)Z
            move-result v$scratch
            if-eqz v$scratch, :rvx_replay_player_stock
            return-void
            :rvx_replay_player_stock
            nop
        """)
        method.addInstructionsWithLabels(0, """
            invoke-virtual/range {p0 .. p2}, ${owner.type}->rvxTail($requestType$callbackType)Z
            move-result v$scratch
            if-eqz v$scratch, :rvx_replay_player_entry_stock
            return-void
            :rvx_replay_player_entry_stock
            nop
        """)
    }
}

/**
 * The offline watch-next request. The request is kept in the boolean argument's register (dead after the task is
 * built) and, at the return, handed with the future to [REPLAY]: its answer is the stock future, except that a failed
 * stock future of an offline watch of ours is answered with the queue built from the stored list. The request class
 * gets two bridges: its watch command, and the stock response object of a response's bytes.
 */
private fun BytecodePatchContext.prepareReplayNext(
    requestType: String, commandType: String,
): Pair<Boolean, () -> Unit> {
    val match = Fingerprint(
        returnType = FUTURE,
        parameters = listOf(requestType, "Z"),
        custom = { method, owner -> method.isDeferredNextEntry(owner) },
    ).matchSingle()
    val method = match.method
    val instructions = method.implementation!!.instructions.toList()
    val registers = method.implementation!!.registerCount
    val request = registers - 2
    val booleanArgument = registers - 1

    val taskInit = instructions.indexOfFirst { it.opcode == Opcode.INVOKE_DIRECT }
    val returnIndex = instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
    val future = (instructions[returnIndex] as OneRegisterInstruction).registerA
    check(instructions.drop(taskInit + 1).none { it.reads(booleanArgument) || it.writes(booleanArgument) }) {
        "next: the boolean argument is still used"
    }
    check(booleanArgument <= 15 && future <= 15 && request <= 15) { "next: register range" }

    val requestClass = mutableClassDefBy(requestType)
    val commandField = requestClass.fields.single {
        it.type == commandType && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val responseType = nextResponseType(requestType)
    val response = mutableClassDefBy(responseType)
    val responseInit = response.methods.single { it.name == "<init>" }
    check(responseInit.parameterTypes.size == 1) { "next: response constructor" }
    val protoType = responseInit.parameterTypes.single().toString()
    val protoDefault = mutableClassDefBy(protoType).fields.single {
        it.type == protoType && AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val parserOwner = parseByteArrayMethodRef.get()!!.definingClass
    val parser = mutableClassDefBy(parserOwner).methods.single {
        it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
    }
    val shuffle = prepareSavedPlaylistShuffle(response, requestType, protoType)
    val attachShuffle = shuffle?.let {
        """
            iput-boolean p2, v1, ${it.marker}
            iput-object p3, v1, ${it.continuation}
        """
    }.orEmpty()

    return (shuffle != null) to {
        shuffle?.install?.invoke()
        requestClass.interfaces.add(NEXT_REQUEST)
        requestClass.addDownloadsBridge("rvxCommand", emptyList(), OBJECT, 2, """
            iget-object v0, p0, ${commandField.definingClass}->${commandField.name}:${commandField.type}
            return-object v0
        """)
        requestClass.addDownloadsBridge("rvxNextResponse", listOf("[B", "Z", OBJECT), OBJECT, 6, """
            sget-object v0, $protoDefault
            invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
            move-result-object v1
            invoke-static {v0, p1, v1}, $parser
            move-result-object v0
            check-cast v0, $protoType
            new-instance v1, $responseType
            invoke-direct {v1, v0}, $responseType-><init>($protoType)V
            $attachShuffle
            return-object v1
        """)
        method.addInstructions(returnIndex, """
            invoke-static {v$booleanArgument, v$future}, $REPLAY->wrapNext($OBJECT$FUTURE)$FUTURE
            move-result-object v$future
        """)
        method.addInstruction(taskInit + 1, "move-object v$booleanArgument, v$request")
        method.addInstructionsWithLabels(0, """
            invoke-static {p1}, $REPLAY->localNext($OBJECT)$FUTURE
            move-result-object v0
            if-eqz v0, :rvx_next_network
            return-object v0
            :rvx_next_network
            nop
        """)
    }
}

/** The task-spawning entry: `new Task(this, request, flag); return Futures.submit(task, this.executor)`. */
private fun Method.isDeferredNextEntry(owner: ClassDef): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags)) return false

    val steps = implementation?.instructions?.toList() ?: return false
    val opcodes = steps.map { it.opcode }.filterNot { it.name.startsWith("const") }
    if (opcodes != listOf(Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT)) {
        return false
    }
    val executor = steps.first { it.opcode == Opcode.IGET_OBJECT }.getReference<FieldReference>()
    return executor?.definingClass == owner.type && executor.type == EXECUTOR
}

/** The response type the stock watch-next code builds for a request: the last argument of its builder method. */
private fun BytecodePatchContext.nextResponseType(requestType: String): String {
    val types = mutableSetOf<String>()
    classDefForEach { owner ->
        owner.methods.forEach { method ->
            val parameters = method.parameterTypes.map(CharSequence::toString)
            if (method.returnType == FUTURE && parameters.size == 4 && parameters[0] == requestType &&
                parameters[1].startsWith("L") && parameters[2] == LIST && parameters[3].startsWith("L")) {
                types.add(parameters[3])
            }
        }
    }
    check(types.size == 1) { "next: found ${types.size} response types" }
    return types.single()
}

/** The response adapter [installStreamSwap] added [STREAM_RESPONSE] to; without it the replay cannot swap audio. */
private fun BytecodePatchContext.streamSwapAdapterClass(): ClassDef = Fingerprint(
    name = "rvxWithBytes",
    returnType = OBJECT,
    parameters = listOf("[B", "Z"),
    custom = { _, owner -> STREAM_RESPONSE in owner.interfaces },
).matchSingle().classDef

private fun Method.hasWideLiteral(value: Long): Boolean = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_WIDE_32 && (it as WideLiteralInstruction).wideLiteral == value
} == true

/** Whether the instruction assigns the register, as the destination of its first operand. */
private fun Instruction.writes(register: Int): Boolean {
    if (this !is OneRegisterInstruction) return false

    return (opcode.setsRegister() && registerA == register) ||
        (opcode.setsWideRegister() && (registerA == register || registerA + 1 == register))
}

/** Whether the instruction reads the register: any operand that is not only the destination. */
private fun Instruction.reads(register: Int): Boolean = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG)
        .take(registerCount).contains(register)
    is RegisterRangeInstruction -> register in startRegister until startRegister + registerCount
    is ThreeRegisterInstruction -> registerB == register || registerC == register || readsFirst(register)
    is TwoRegisterInstruction -> registerB == register || readsFirst(register)
    is OneRegisterInstruction -> readsFirst(register)
    else -> false
}

private fun OneRegisterInstruction.readsFirst(register: Int): Boolean {
    val destination = (opcode.setsRegister() || opcode.setsWideRegister()) && opcode != Opcode.CHECK_CAST
    return registerA == register && !destination
}

/**
 * Whether the register is assigned before it is read when execution starts at [start]. Only straight code is
 * followed: a jump ends the proof as unknown (false), a return or throw ends it as dead (true).
 */
private fun List<Instruction>.isDeadFrom(start: Int, register: Int): Boolean {
    for (index in start until size) {
        val step = this[index]
        if (step.reads(register)) return false
        if (step.writes(register)) return true

        val name = step.opcode.name
        if (name.startsWith("return") || step.opcode == Opcode.THROW) return true
        if (name.startsWith("if-") || name.startsWith("goto") || name.endsWith("switch")) return false
    }
    return false
}
