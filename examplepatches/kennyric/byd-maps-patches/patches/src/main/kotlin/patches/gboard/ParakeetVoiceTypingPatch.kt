package patches.gboard

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val RECOGNIZER = "Lnl/johninnl/gboard/ParakeetRecognizer;"
private const val SETTINGS_ACTIVITY = "nl.johninnl.gboard.ParakeetSettingsActivity"
private const val CONTEXT = "Landroid/content/Context;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

// Gboard keeps its original class and method names in log metadata; these anchor the
// obfuscated recognizer contract so the patch never guesses from shapes alone.
private const val FACTORY_LOG = "[RD] Prioritizing the new S3 recognizer over the on-device recognizer. [news3]"
// Logged only on the factory's Rambler (Jetson) branch; it proves which boolean selects that branch.
private const val JETSON_FACTORY_LOG = "[Jetson] Neither S3 nor Lite model is available. Falling back to Voice IME recognizer."
private const val CALLBACK_CLASS = "com/google/android/apps/inputmethod/libs/voiceime/VoiceInputManager\$RecognizerCallback"
private const val TEMPLATE_CLASS = "com/google/android/apps/inputmethod/libs/agenticdictation/lite/JetsonLiteRecognizer"
private const val RESULT_LOG = "Ignored a recognition event with no results."
/** Log tags of Gboard's two on-device engines; both open the dictation session the same way. */
private val ON_DEVICE_ENGINES = listOf("SodaRecognizer.java", "JetsonLiteRecognizer.java")

private enum class Role { TYPE, SHUTDOWN, STOP_LISTENING, STOP_RECOGNITION, RETRY, START }

private val templateRoles = mapOf(
    "shutdown() [Lite]" to Role.SHUTDOWN,
    "stopListening(): %s [Lite]" to Role.STOP_LISTENING,
    "stopRecognition() [Lite]" to Role.STOP_RECOGNITION,
    "retryBatchRecognition() [Lite]" to Role.RETRY,
    "startRecognition() [Lite]" to Role.START,
)

/** Extension placeholder → the RecognizerCallback log message identifying the callback method. */
private val callbackRoles = mapOf(
    "cbListening" to "onListening() : Cannot run with %s",
    "cbSpeech" to "onRecognizing() : Cannot run with %s",
    "cbStopListening" to "onStopListening()",
    "cbStopRecognition" to "onStopRecognition()",
)

private fun Method.instructionsOrEmpty(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.strings(): Set<String> = instructionsOrEmpty().mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}.toSet()

private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

private fun Method.sig() = "$name(${params().joinToString("")})$returnType"

/** Names of an enum's constants mapped to their static fields, read from its initializer. */
private fun enumFields(enum: ClassDef): Map<String, FieldReference> {
    val clinit = enum.methods.singleOrNull { it.name == "<clinit>" } ?: throw PatchException("${enum.type} has no initializer")
    val fields = mutableMapOf<String, FieldReference>()
    var pending: String? = null
    for (instruction in clinit.instructionsOrEmpty()) {
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
            if (pending == null) pending = (reference as StringReference).string
        } else if (instruction.opcode == Opcode.SPUT_OBJECT && reference is FieldReference &&
            reference.definingClass == enum.type && reference.type == enum.type && pending != null) {
            fields[pending] = reference
            pending = null
        }
    }
    return fields
}

/** Recognizer contract resolved from one Gboard build. */
private class Contract(
    val factory: Method,
    /** The request's Rambler flag: Parakeet leaves those sessions to Google's own recognizers. */
    val ramblerSessionField: FieldReference,
    val holderField: FieldReference,
    val contextField: FieldReference,
    val recognizer: String,
    val methods: Map<Role, Method>,
    val inherited: List<Method>,
    val typeField: FieldReference,
    val callback: String,
    val callbackMethods: Map<String, Method>,
    val levelMethod: Method,
    val resultMethod: Method,
    val errorMethod: Method,
    val errorFields: Map<String, FieldReference>,
    val result: ResultBuilder,
)

/** How Gboard builds the recognition-result protos its RecognizerCallback receives. */
private class ResultBuilder(
    val listType: String,
    val listDefault: FieldReference,
    val hypothesisType: String,
    val hypothesisDefault: FieldReference,
    val newBuilder: MethodReference,
    val copyOnWrite: MethodReference,
    val instance: FieldReference,
    val build: MethodReference,
    val addAll: MethodReference,
    val presence: FieldReference,
    val text: FieldReference,
    val isFinal: FieldReference,
)

context(context: BytecodePatchContext)
private fun classesWith(string: String): List<ClassDef> =
    context.classDefByStrings(string, StringComparisonType.EQUALS)

context(context: BytecodePatchContext)
private fun methodWith(string: String, filter: (ClassDef) -> Boolean = { true }): Pair<ClassDef, Method> {
    val matches = classesWith(string).filter(filter).flatMap { owner ->
        owner.methods.filter { string in it.strings() }.map { owner to it }
    }
    return matches.singleOrNull() ?: throw PatchException("Expected one Gboard method logging \"$string\", found ${matches.size}")
}

context(context: BytecodePatchContext)
private fun resolveContract(): Contract {
    val (factoryOwner, factory) = methodWith(FACTORY_LOG)
    if (AccessFlags.STATIC.isSet(factory.accessFlags) || factory.params().size != 1) {
        throw PatchException("Gboard recognizer factory signature changed: ${factory.sig()}")
    }
    val recognizer = factory.returnType
    val instructions = factory.instructionsOrEmpty()
    val contextField = instructions.firstNotNullOfOrNull {
        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field ->
            it.opcode == Opcode.IGET_OBJECT && field.type == CONTEXT
        }
    } ?: throw PatchException("Gboard recognizer factory no longer reads a Context")
    val holderField = instructions.firstNotNullOfOrNull {
        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field ->
            it.opcode == Opcode.IGET_OBJECT && field.definingClass == factoryOwner.type && field.type == contextField.definingClass
        }
    } ?: throw PatchException("Gboard recognizer factory no longer holds the Context owner")
    val registers = factory.implementation!!.registerCount
    if (registers - factory.params().size - 1 < 1) throw PatchException("Gboard recognizer factory has no free register")
    val ramblerSessionField = ramblerSessionField(factory, registers)

    val recognizerDef = context.classDefBy(recognizer)
    if (!AccessFlags.INTERFACE.isSet(recognizerDef.accessFlags)) throw PatchException("$recognizer is not an interface")
    val own = recognizerDef.methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) }
    val inheritedAbstract = recognizerDef.interfaces.flatMap { name ->
        context.classDefBy(name).methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) }
    }

    val template = classesWith("shutdown() [Lite]").singleOrNull { recognizer in it.interfaces }
        ?: throw PatchException("Gboard's on-device Lite recognizer is missing")
    if (template.methods.none { TEMPLATE_CLASS in it.strings() }) throw PatchException("Unexpected Lite recognizer template")
    val roles = mutableMapOf<Role, Method>()
    for ((log, role) in templateRoles) {
        val implementation = template.methods.singleOrNull { log in it.strings() }
            ?: throw PatchException("Lite recognizer lacks \"$log\"")
        roles[role] = own.singleOrNull { it.name == implementation.name && it.params() == implementation.params() }
            ?: throw PatchException("\"$log\" is not a recognizer method")
    }
    roles[Role.TYPE] = own.singleOrNull { it.params().isEmpty() && it.returnType != "V" }
        ?: throw PatchException("Recognizer type accessor not found")
    if (roles.values.toSet().size != Role.entries.size || own.size != Role.entries.size) {
        throw PatchException("Gboard recognizer interface changed: ${own.map { it.sig() }}")
    }
    val start = roles.getValue(Role.START)
    val callback = start.params().last()
    if (roles.getValue(Role.RETRY).params().let { it.size != 4 || it[0] != "[B" || it[3] != callback } ||
        start.params().size != 3 || roles.getValue(Role.STOP_LISTENING).params().size != 1) {
        throw PatchException("Gboard recognizer method signatures changed")
    }
    // Methods inherited from the recognizer's super-interfaces are copied from the Lite
    // recognizer; they must not touch that class's own state.
    val inherited = inheritedAbstract.map { abstract ->
        val implementation = template.methods.singleOrNull { it.name == abstract.name && it.params() == abstract.params() }
            ?: throw PatchException("Lite recognizer does not implement ${abstract.sig()}")
        val touchesTemplate = implementation.instructionsOrEmpty().any {
            when (val reference = (it as? ReferenceInstruction)?.reference) {
                is FieldReference -> reference.definingClass == template.type
                is MethodReference -> reference.definingClass == template.type
                else -> false
            }
        }
        if (touchesTemplate) throw PatchException("${abstract.sig()} depends on the Lite recognizer")
        implementation
    }

    val typeEnum = context.classDefBy(roles.getValue(Role.TYPE).returnType)
    val typeField = enumFields(typeEnum)["FALLBACK_ON_DEVICE"] ?: throw PatchException("Recognizer type FALLBACK_ON_DEVICE missing")

    val callbackDef = context.classDefBy(callback)
    val callbackImpl = classesWith(CALLBACK_CLASS).singleOrNull { callback in it.interfaces }
        ?: throw PatchException("Gboard RecognizerCallback is missing")
    val abstractCallbacks = callbackDef.methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) }
    fun callbackFor(log: String): Method {
        val implementation = callbackImpl.methods.singleOrNull { log in it.strings() }
            ?: throw PatchException("RecognizerCallback lacks \"$log\"")
        return abstractCallbacks.singleOrNull { it.name == implementation.name && it.params() == implementation.params() }
            ?: throw PatchException("\"$log\" is not a callback method")
    }
    val callbackMethods = callbackRoles.mapValues { (_, log) -> callbackFor(log) }.toMutableMap()
    // Gboard's on-device engine opens the keyboard's dictation session with one callback right
    // before it reports listening; that callback has no log message of its own.
    val listening = callbackMethods.getValue("cbListening")
    val ready = ON_DEVICE_ENGINES.flatMap { classesWith(it) }.distinct().flatMap { it.methods }.flatMap { method ->
        val calls = method.instructionsOrEmpty().filter { it.opcode == Opcode.INVOKE_INTERFACE }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
        calls.zipWithNext().filter { (first, second) ->
            second.definingClass == callback && second.name == listening.name && second.params().isEmpty() &&
                first.definingClass == callback && first.params().isEmpty() && first.name != listening.name
        }.map { it.first.name }
    }.distinct().singleOrNull() ?: throw PatchException("Gboard's dictation-session callback was not found")
    callbackMethods["cbReady"] = abstractCallbacks.single { it.name == ready && it.params().isEmpty() }
    val errorMethod = callbackFor("onRecognitionError()")
    val levelMethod = abstractCallbacks.singleOrNull { it.params() == listOf("I") }
        ?: throw PatchException("Callback level method not found")
    val errorEnum = errorMethod.params().singleOrNull() ?: throw PatchException("Callback error signature changed")
    val resultMethod = abstractCallbacks.singleOrNull {
        it.params().size == 1 && it.params()[0].startsWith("L") && it.params()[0] != errorEnum
    } ?: throw PatchException("Callback result method not found")
    if (callbackMethods.values.any { it.params().isNotEmpty() || it.returnType != "V" }) {
        throw PatchException("Callback signatures changed")
    }
    val errorFields = enumFields(context.classDefBy(errorEnum))
    for (name in listOf("AUDIO", "NO_SPEECH_DETECTED", "OTHER")) {
        if (name !in errorFields) throw PatchException("Recognition error $name missing")
    }

    val result = resolveResultBuilder(resultMethod.params()[0], callback)
    return Contract(
        factory, ramblerSessionField, holderField, contextField, recognizer, roles, inherited, typeField, callback,
        callbackMethods, levelMethod, resultMethod, errorMethod, errorFields, result,
    )
}

/**
 * The factory opens with `if (request.<flag>) { ... Jetson branch ... }`: the first boolean it reads
 * from the request feeds an `if-eqz` (only string constants in between), and [JETSON_FACTORY_LOG]
 * is logged after that branch. That boolean is the request's Rambler flag.
 */
private fun ramblerSessionField(factory: Method, registers: Int): FieldReference {
    val requestType = factory.params().single()
    val requestRegister = registers - 1
    val instructions = factory.instructionsOrEmpty()
    val readIndex = instructions.indexOfFirst {
        it.opcode == Opcode.IGET_BOOLEAN && (it as TwoRegisterInstruction).registerB == requestRegister &&
            ((it as ReferenceInstruction).reference as FieldReference).definingClass == requestType
    }
    if (readIndex < 0) throw PatchException("Gboard recognizer factory no longer reads its Rambler session flag")
    val read = instructions[readIndex] as TwoRegisterInstruction
    val branchIndex = (readIndex + 1 until instructions.size).firstOrNull { instructions[it].opcode != Opcode.CONST_STRING }
    val branch = branchIndex?.let(instructions::get)
    val clobbered = instructions.subList(readIndex + 1, branchIndex ?: readIndex + 1)
        .any { (it as OneRegisterInstruction).registerA == read.registerA }
    val jetsonIndex = instructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == JETSON_FACTORY_LOG
    }
    if (branch?.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != read.registerA ||
        clobbered || jetsonIndex <= branchIndex
    ) {
        throw PatchException("Gboard recognizer factory no longer branches on its Rambler session flag")
    }
    return (instructions[readIndex] as ReferenceInstruction).reference as FieldReference
}

context(context: BytecodePatchContext)
private fun resolveResultBuilder(listType: String, callback: String): ResultBuilder {
    val (_, method) = methodWith(RESULT_LOG)
    val instructions = method.instructionsOrEmpty()
    val references = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }
    if (references.none { it is MethodReference && it.definingClass == callback && it.params() == listOf(listType) }) {
        throw PatchException("Result template no longer delivers $listType")
    }
    val writes = instructions.filter { it.opcode == Opcode.IPUT_OBJECT || it.opcode == Opcode.IPUT_BOOLEAN || it.opcode == Opcode.IPUT }
        .map { it.opcode to ((it as ReferenceInstruction).reference as FieldReference) }
    val text = writes.filter { it.first == Opcode.IPUT_OBJECT && it.second.type == STRING }.map { it.second }.distinct().singleOrNull()
        ?: throw PatchException("Result template text field not unique")
    val hypothesis = text.definingClass
    val isFinal = writes.filter { it.first == Opcode.IPUT_BOOLEAN && it.second.definingClass == hypothesis }.map { it.second }.distinct().singleOrNull()
        ?: throw PatchException("Result template final flag not unique")
    val presence = writes.filter { it.first == Opcode.IPUT && it.second.definingClass == hypothesis && it.second.type == "I" }
        .map { it.second }.distinct().singleOrNull() ?: throw PatchException("Result template presence bits not unique")

    fun defaultOf(type: String) = references.filterIsInstance<FieldReference>()
        .filter { it.definingClass == type && it.type == type }.distinct().singleOrNull()
        ?: throw PatchException("Default instance of $type not found")
    val listDefault = defaultOf(listType)
    val hypothesisDefault = defaultOf(hypothesis)

    val calls = references.filterIsInstance<MethodReference>()
    val newBuilder = calls.filter { it.params().isEmpty() && it.name.isNotEmpty() && it.returnType.startsWith("L") &&
        instructions.zipWithNext().any { (a, b) ->
            a.opcode == Opcode.SGET_OBJECT && (a as ReferenceInstruction).reference == hypothesisDefault &&
                (b as? ReferenceInstruction)?.reference == it
        }
    }.distinct().singleOrNull() ?: throw PatchException("Result builder factory not found")
    val builder = newBuilder.returnType
    val message = newBuilder.definingClass
    val builderCalls = calls.filter { it.definingClass == builder }.distinct()
    val copyOnWrite = builderCalls.singleOrNull { it.params().isEmpty() && it.returnType == "V" }
        ?: throw PatchException("Result builder copy method not unique")
    val build = builderCalls.singleOrNull { it.params().isEmpty() && it.returnType == message }
        ?: throw PatchException("Result builder build method not unique")
    val addAll = builderCalls.singleOrNull { it.params() == listOf("Ljava/lang/Iterable;") && it.returnType == "V" }
        ?: throw PatchException("Result builder addAll method not unique")
    val instance = references.filterIsInstance<FieldReference>()
        .filter { it.definingClass == builder && it.type == message }.distinct().singleOrNull()
        ?: throw PatchException("Result builder instance field not unique")
    return ResultBuilder(listType, listDefault, hypothesis, hypothesisDefault, newBuilder, copyOnWrite, instance, build,
        addAll, presence, text, isFinal)
}

private fun MethodReference.params(): List<String> = parameterTypes.map(CharSequence::toString)

private fun FieldReference.smali() = "$definingClass->$name:$type"

private fun MethodReference.smali() = "$definingClass->$name(${params().joinToString("")})$returnType"

private fun Method.smaliRef() = "$definingClass->$name(${params().joinToString("")})$returnType"

private fun MutableClass.replaceStatic(name: String, params: List<String>, registers: Int, smali: String) {
    val existing = methods.singleOrNull { it.name == name && it.params() == params && AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("Extension placeholder $name missing")
    methods.remove(existing)
    methods.add(ImmutableMethod(
        type, name, params.map { ImmutableMethodParameter(it, null, null) }, "V",
        existing.accessFlags, null, null, MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructions(0, smali) })
}

private fun MutableClass.addInstance(method: Method, registers: Int, smali: String) {
    if (methods.any { it.name == method.name && it.params() == method.params() }) {
        throw PatchException("Parakeet recognizer already implements ${method.sig()}")
    }
    methods.add(ImmutableMethod(
        type, method.name, method.params().map { ImmutableMethodParameter(it, null, null) }, method.returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructions(0, smali) })
}

@Suppress("unused")
val parakeetVoiceTyping = bytecodePatch(
    name = "Parakeet voice typing",
    description = "Adds Gboard settings → Voice typing → Parakeet voice typing. After downloading NVIDIA Parakeet " +
        "(Moondream's Parakeet Ultra or the original TDT v3), the microphone key transcribes on the phone and " +
        "recognises Dutch, English and 23 more languages per sentence without switching. Gives the patched Gboard the Parakeet launcher icon.",
) {
    compatibleWith(gboard)
    extendWith("extensions/gboard.mpe")

    val settings = resourcePatch {
        execute {
            // The manifest's current package: Change package name may already have run. If it
            // runs later, it moves this target along with Gboard's own settings screens.
            var packageName = packageMetadata.packageName
            document("AndroidManifest.xml").use { manifest ->
                packageName = manifest.documentElement.getAttribute("package").ifEmpty { packageName }
                val application = manifest.getElementsByTagName("application").item(0) as? Element
                    ?: throw PatchException("Gboard manifest has no application")
                val activities = manifest.getElementsByTagName("activity")
                if ((0 until activities.length).any { (activities.item(it) as Element).getAttributeNS(ANDROID, "name") == SETTINGS_ACTIVITY }) {
                    throw PatchException("Parakeet settings are already declared")
                }
                application.appendChild(manifest.createElement("activity").apply {
                    setAttributeNS(ANDROID, "android:name", SETTINGS_ACTIVITY)
                    setAttributeNS(ANDROID, "android:exported", "false")
                    setAttributeNS(ANDROID, "android:label", "@string/morphe_parakeet_title")
                })
            }
            for ((folder, texts) in listOf(
                "values" to listOf(
                    "Parakeet voice typing", "On-device speech recognition, Dutch and English without switching",
                    "Parakeet", "Voice typing on your phone with NVIDIA Parakeet, set up under Parakeet voice typing",
                ),
                "values-nl" to listOf(
                    "Parakeet-spraakinvoer", "Spraakherkenning op de telefoon, Nederlands en Engels zonder wisselen",
                    "Parakeet", "Spraakinvoer op je telefoon met NVIDIA Parakeet, in te stellen onder Parakeet-spraakinvoer",
                ),
            )) {
                val path = "res/$folder/strings.xml"
                if (folder != "values" && !get(path).isFile) continue
                document(path).use { strings ->
                    val root = strings.documentElement
                    val keys = listOf("morphe_parakeet_title", "morphe_parakeet_summary",
                        "morphe_parakeet_selector_title", "morphe_parakeet_selector_summary")
                    for ((key, value) in keys.zip(texts)) {
                        root.appendChild(strings.createElement("string").apply {
                            setAttribute("name", key)
                            textContent = value
                        })
                    }
                }
            }
            var screens = 0
            for (screen in listOf("res/xml/setting_voice.xml", "res/xml/setting_voice_unified.xml")) {
                if (!get(screen).isFile) continue
                document(screen).use { xml ->
                    val root = xml.documentElement
                    val first = (0 until root.childNodes.length).map(root.childNodes::item).firstOrNull { it is Element }
                        ?: throw PatchException("$screen is empty")
                    val preference = xml.createElement("Preference").apply {
                        setAttributeNS(ANDROID, "android:key", "morphe_parakeet_voice_typing")
                        setAttributeNS(ANDROID, "android:persistent", "false")
                        setAttributeNS(ANDROID, "android:title", "@string/morphe_parakeet_title")
                        setAttributeNS(ANDROID, "android:summary", "@string/morphe_parakeet_summary")
                        appendChild(xml.createElement("intent").apply {
                            setAttributeNS(ANDROID, "android:targetPackage", packageName)
                            setAttributeNS(ANDROID, "android:targetClass", SETTINGS_ACTIVITY)
                        })
                    }
                    root.insertBefore(preference, first.nextSibling)
                    // With Rambler offered, Gboard's dictation choice is Rambler or Standard; Standard
                    // voice typing is Parakeet once set up, so name the choice after it.
                    if (screen.endsWith("setting_voice_unified.xml")) {
                        val selectors = xml.getElementsByTagName("*").let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }
                            .filter { it.getAttributeNS(ANDROID, "fragment").endsWith(".TraditionalVoiceSettingsFragment") }
                        val standard = selectors.singleOrNull()
                            ?: throw PatchException("Expected one Standard voice typing choice, found ${selectors.size}")
                        standard.setAttributeNS(ANDROID, "android:title", "@string/morphe_parakeet_selector_title")
                        standard.setAttributeNS(ANDROID, "android:summary", "@string/morphe_parakeet_selector_summary")
                    }
                }
                screens++
            }
            if (screens == 0) throw PatchException("Gboard voice typing settings screens not found")
        }
    }
    dependsOn(originalInput, settings, gboardParakeetIconPatch)

    execute {
        val contract = resolveContract()
        val owner = mutableClassDefBy(RECOGNIZER)
        if (contract.recognizer in owner.interfaces) throw PatchException("Parakeet voice typing is already applied")
        owner.interfaces.add(contract.recognizer)

        val methods = contract.methods
        owner.addInstance(methods.getValue(Role.TYPE), 2, """
            sget-object v0, ${contract.typeField.smali()}
            return-object v0
        """)
        owner.addInstance(methods.getValue(Role.SHUTDOWN), 1, """
            invoke-virtual {p0}, $RECOGNIZER->shutdown()V
            return-void
        """)
        owner.addInstance(methods.getValue(Role.STOP_LISTENING), 2, """
            invoke-virtual {p0}, $RECOGNIZER->stopListening()V
            return-void
        """)
        owner.addInstance(methods.getValue(Role.STOP_RECOGNITION), 1, """
            invoke-virtual {p0}, $RECOGNIZER->stopRecognition()V
            return-void
        """)
        owner.addInstance(methods.getValue(Role.RETRY), 5, """
            invoke-virtual {p0, p4}, $RECOGNIZER->retry($OBJECT)V
            return-void
        """)
        owner.addInstance(methods.getValue(Role.START), 4, """
            invoke-virtual {p0, p3}, $RECOGNIZER->start($OBJECT)V
            return-void
        """)
        for (implementation in contract.inherited) {
            owner.methods.add(ImmutableMethod(
                owner.type, implementation.name, implementation.parameters, implementation.returnType,
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
                MutableMethodImplementation(implementation.implementation!!),
            ).toMutable())
        }

        val cb = contract.callback
        for ((placeholder, method) in contract.callbackMethods) {
            owner.replaceStatic(placeholder, listOf(OBJECT), 1, """
                check-cast p0, $cb
                invoke-interface {p0}, ${method.smaliRef()}
                return-void
            """)
        }
        owner.replaceStatic("cbLevel", listOf(OBJECT, "I"), 2, """
            check-cast p0, $cb
            invoke-interface {p0, p1}, ${contract.levelMethod.smaliRef()}
            return-void
        """)
        val errors = contract.errorFields
        owner.replaceStatic("cbError", listOf(OBJECT, "I"), 4, """
            sget-object v0, ${errors.getValue("OTHER").smali()}
            if-nez p1, :not_audio
            sget-object v0, ${errors.getValue("AUDIO").smali()}
            :not_audio
            const/4 v1, 0x1
            if-ne p1, v1, :deliver
            sget-object v0, ${errors.getValue("NO_SPEECH_DETECTED").smali()}
            :deliver
            check-cast p0, $cb
            invoke-interface {p0, v0}, ${contract.errorMethod.smaliRef()}
            return-void
        """)
        val r = contract.result
        // Presence bits 1 and 2 belong to the hypothesis text and final flag, as in Gboard's own builder.
        owner.replaceStatic("cbResult", listOf(OBJECT, STRING, "Z"), 6, """
            sget-object v0, ${r.hypothesisDefault.smali()}
            invoke-virtual {v0}, ${r.newBuilder.smali()}
            move-result-object v0
            invoke-virtual {v0}, ${r.copyOnWrite.smali()}
            iget-object v1, v0, ${r.instance.smali()}
            check-cast v1, ${r.hypothesisType}
            iget v2, v1, ${r.presence.smali()}
            or-int/lit8 v2, v2, 0x3
            iput v2, v1, ${r.presence.smali()}
            iput-object p1, v1, ${r.text.smali()}
            iput-boolean p2, v1, ${r.isFinal.smali()}
            invoke-virtual {v0}, ${r.build.smali()}
            move-result-object v1
            invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
            move-result-object v1
            sget-object v0, ${r.listDefault.smali()}
            invoke-virtual {v0}, ${r.newBuilder.smali()}
            move-result-object v0
            invoke-virtual {v0, v1}, ${r.addAll.smali()}
            invoke-virtual {v0}, ${r.build.smali()}
            move-result-object v0
            check-cast v0, ${r.listType}
            check-cast p0, $cb
            invoke-interface {p0, v0}, ${contract.resultMethod.smaliRef()}
            return-void
        """)

        // Gboard's keyboard service (its manifest name is stable): let the recognizer reach the
        // text field to restore capitals Gboard drops from later sentences.
        val keyboard = mutableClassDefBy("Lcom/android/inputmethod/latin/LatinIME;")
        val constructor = keyboard.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.isEmpty() }
            ?: throw PatchException("Gboard keyboard service constructor changed")
        val returnIndex = constructor.instructionsOrEmpty().indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (returnIndex < 0) throw PatchException("Gboard keyboard service constructor has no return")
        constructor.addInstructions(returnIndex, """
            invoke-static {p0}, $RECOGNIZER->attachService(Landroid/inputmethodservice/InputMethodService;)V
        """)

        val factory = mutableClassDefBy(contract.factory.definingClass).methods
            .single { it.name == contract.factory.name && it.params() == contract.factory.params() && it.returnType == contract.factory.returnType }
        // Rambler sessions stay with Google's cloud recognizer, so the user's Rambler/Standard choice in
        // Gboard's Voice settings picks between Rambler and Parakeet instead of Parakeet taking both.
        factory.addInstructionsWithLabels(0, """
            iget-boolean v0, p1, ${contract.ramblerSessionField.smali()}
            if-nez v0, :original
            iget-object v0, p0, ${contract.holderField.smali()}
            iget-object v0, v0, ${contract.contextField.smali()}
            invoke-static {v0}, $RECOGNIZER->create($CONTEXT)$RECOGNIZER
            move-result-object v0
            if-eqz v0, :original
            return-object v0
        """, ExternalLabel("original", factory.getInstruction(0)))
    }
}
