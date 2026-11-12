/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.video.information.ModernVideoEndFingerprint
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayMethodRef
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
private const val PAGE_REQUEST = $$"Lapp/morphe/extension/music/patches/downloads/DownloadsPage$PageRequest;"
private const val PAGE_RESPONSE = $$"Lapp/morphe/extension/music/patches/downloads/DownloadsPage$PageResponse;"
private const val NEXT_REQUEST = $$"Lapp/morphe/extension/music/patches/downloads/OfflineReplay$NextRequest;"
private const val STREAM_RESPONSE = $$"Lapp/morphe/extension/music/patches/downloads/StreamSwap$Response;"
private const val BROWSE_BYTES = $$"Lapp/morphe/extension/music/patches/downloads/OfflineBrowsePages$Bytes;"
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

private val REPLAY_VERSIONS = setOf("9.40.51", "9.15.51", "8.30.54")

/** The experiment flag the offline watch command gate reads in every supported version (the id is the same). */
private const val GATE_EXPERIMENT = 0x02b88604L

/** The string the Downloads page service logs under, which no other class holds in its static initializer. */
private const val PAGE_SERVICE =
    "com/google/android/apps/youtube/music/offline/service/OfflineBrowsePageGenerationService"

/** The one string of the constructor of the request of that service: the name its log lines go under. */
private const val PAGE_REQUEST_NAME = "OfflineBrowsePageGenerationService"

/** The message the failure method of the page fragment (the base class of playlist and album pages) logs. */
private const val DETAIL_ERROR = "AbstractDetailPageFragment onEntityError."

/** Message of the failure the stock player lookup ends with when a song was not downloaded the stock way. */
private const val UNPLAYABLE = "Unplayable Video"

/**
 * Offline playback of stream copies, in 9.40.51 / 9.15.51 / 8.30.54 order:
 * gate `Lgup.c` / `Lkch.c` / `Ljto.c`, player lookup `Laalc.c` / `Laxlp.c` / `Lauhp.c`,
 * watch-next entry `Lhyv.b` / `Lntb.b` / `Lnez.b`, watch-next request `Labjm` / `Lazmi` / `Lawgh`.
 * Every dependency of every hook is resolved before anything is changed, and the hooks go in together or not at all:
 * a version whose shape is unfamiliar only warns and plays as before. Needs [installStreamSwap]: the stored response
 * gets the same audio swap an online one does.
 */
internal fun BytecodePatchContext.installOfflineReplay() {
    if (packageMetadata.versionName !in REPLAY_VERSIONS) {
        printInfo("OfflineReplay: not available on this Music version; playback unchanged.")
        return
    }

    try {
        val commandType = nativeDownloadsCommandResolverFingerprint.method.parameterTypes[1].toString()
        val supported = mutableClassDefBy(REPLAY).methods.single { it.name == "supported" }
        val installGate = prepareReplayGate(commandType)
        val (requestType, installTail) = prepareReplayTail()
        val installNext = prepareReplayNext(requestType, commandType)

        val installPage = prepareDownloadsPage()
        val installBrowse = prepareBrowsePages()
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
 * string [PAGE_SERVICE] names (`Lhtd.c(request, options, callback)` in 9.40.51, `Lnck.c` in 9.15.51, `Lmpe.b` in
 * 8.30.54: the one method of the class that returns nothing and takes three objects). The callback, the third
 * argument, is replaced on entry by [REPLAY]'s wrapper, which adds the stream copies to the page the service
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
 * The pages the app shows in its page fragment (a playlist, an album): the stock page is recorded online and answered
 * again offline, so a downloaded list opens as its own page. The fragment is the base class of the playlist and album
 * pages (`Lglh` in 9.40.51), found by the message its failure method logs, [DETAIL_ERROR]. Its two sibling methods
 * take the page's request state (the base class of the browse request, which also holds the browse id): the failure
 * `(State, Throwable)V` and the success `(State, Object)V` that renders the response model. Two hooks that go in
 * together or not at all:
 *
 * - capture: the success hands the request's browse id and the response model to [REPLAY]. The model class gets
 *   [BROWSE_BYTES] and a bridge that serializes the message it holds.
 * - replay: the failure asks [REPLAY] for a stored page before anything else. With one it parses the bytes into a
 *   model, the way the controller does, and gives it to the success method of the same fragment, which renders it
 *   and sets the state of the request. Without one the stock body runs unchanged.
 *
 * The request class is the subclass of the state class the fragment tests; its browse id is its only
 * no-argument string method. The model class is the one the success method tests (`instance-of`); its message is the
 * field its one-argument constructor takes.
 * Optional: a version where the shape is not found opens a downloaded list as before.
 */
private fun BytecodePatchContext.prepareBrowsePages(): (() -> Unit)? {
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
        // Both hooks use v0 at the entry and call a method on `this` with the state and one more register.
        check(success.implementation!!.registerCount - 3 >= 1) { "browse: success registers" }
        check(failure.implementation!!.registerCount - 3 in 1..13) { "browse: failure registers" }

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

        val models = success.implementation!!.instructions.filter { it.opcode == Opcode.INSTANCE_OF }
            .mapNotNull { it.getReference<TypeReference>()?.type }.distinct()
        check(models.size == 1) { "browse: found ${models.size} model classes" }
        val modelType = models.single()
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
        val parserOwner = parseByteArrayMethodRef.get()!!.definingClass
        val parser = mutableClassDefBy(parserOwner).methods.single {
            it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
        }

        val stock = ExternalLabel("rvx_page_stock", failure.getInstruction<Instruction>(0))

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
            page.addDownloadsBridge("rvxPageModel", listOf("[B"), OBJECT, 4, """
                sget-object v0, $messageType->${default.name}:${default.type}
                invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
                move-result-object v1
                invoke-static {v0, p1, v1}, $parser
                move-result-object v0
                check-cast v0, $messageType
                new-instance v1, $modelType
                invoke-direct {v1, v0}, $modelType-><init>($messageType)V
                return-object v1
            """)
            success.addInstructions(0, """
                invoke-virtual {p0, p1}, ${page.type}->rvxPageId($stateType)$STRING
                move-result-object v0
                invoke-static {v0, p2}, $REPLAY->onBrowseResponse($STRING$OBJECT)V
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
    } catch (ex: Exception) {
        printWarn("OfflineReplay: browse pages not hooked; a downloaded list opens as before: ${ex.message}")
        return null
    }
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
    check(literal > 0 && instructions[literal - 1].opcode == Opcode.CHECK_CAST) { "gate: no message cast" }
    val cast = instructions[literal - 1]
    val messageType = cast.getReference<TypeReference>()!!.type
    val message = (cast as OneRegisterInstruction).registerA
    val scratch = (instructions[literal] as OneRegisterInstruction).registerA

    val flagCall = (literal + 1 until instructions.size).first {
        instructions[it].opcode == Opcode.INVOKE_VIRTUAL
    }
    val flagMethod = instructions[flagCall].getReference<MethodReference>()!!
    check(flagMethod.parameterTypes.map(CharSequence::toString) == listOf("J", "Z") && flagMethod.returnType == "Z") {
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
    for (index in literal - 1..flagCall + 1) {
        val step = instructions[index]
        check(index == literal - 1 || (!step.writes(message) && !step.writes(self) &&
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

    // Every failure of the lookup (an id the offline store lacks ends in a different catch block than a stale entry)
    // jumps to the guard: the hook takes over that jump target, so no failure path can skip it.
    return requestType to {
        owner.addDownloadsBridge("rvxTail", listOf(requestType, callbackType), "Z", 8, """
            invoke-virtual {p1}, ${offlineOnly.definingClass}->${offlineOnly.name}()Z
            move-result v0
            invoke-virtual {p1}, ${videoId.definingClass}->${videoId.name}()$STRING
            move-result-object v1
            invoke-static {v1, v0}, $REPLAY->storedForPlayer(${STRING}Z)[B
            move-result-object v2
            if-nez v2, :stored
            const/4 v0, 0x0
            return v0
            :stored
            invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
            move-result-wide v3
            invoke-static {v2, v3, v4}, ${wrapper.type}->${factory.name}([BJ)${factory.returnType}
            move-result-object v2
            invoke-static {v2, v1}, $REPLAY->finishPlayer($OBJECT$STRING)$OBJECT
            move-result-object v2
            if-nez v2, :deliver
            const/4 v0, 0x0
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
    }
}

/**
 * The offline watch-next request. The request is kept in the boolean argument's register (dead after the task is
 * built) and, at the return, handed with the future to [REPLAY]: its answer is the stock future, except that a failed
 * stock future of an offline watch of ours is answered with the queue built from the stored list. The request class
 * gets two bridges: its watch command, and the stock response object of a response's bytes.
 */
private fun BytecodePatchContext.prepareReplayNext(requestType: String, commandType: String): () -> Unit {
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

    return {
        requestClass.interfaces.add(NEXT_REQUEST)
        requestClass.addDownloadsBridge("rvxCommand", emptyList(), OBJECT, 2, """
            iget-object v0, p0, ${commandField.definingClass}->${commandField.name}:${commandField.type}
            return-object v0
        """)
        requestClass.addDownloadsBridge("rvxNextResponse", listOf("[B"), OBJECT, 4, """
            sget-object v0, $protoDefault
            invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
            move-result-object v1
            invoke-static {v0, p1, v1}, $parser
            move-result-object v0
            check-cast v0, $protoType
            new-instance v1, $responseType
            invoke-direct {v1, v0}, $responseType-><init>($protoType)V
            return-object v1
        """)
        method.addInstructions(returnIndex, """
            invoke-static {v$booleanArgument, v$future}, $REPLAY->wrapNext($OBJECT$FUTURE)$FUTURE
            move-result-object v$future
        """)
        method.addInstruction(taskInit + 1, "move-object v$booleanArgument, v$request")
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
    name = "<init>",
    parameters = listOf("L", "Lj$/time/Instant;", "J", "L", "L", "Z"),
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
