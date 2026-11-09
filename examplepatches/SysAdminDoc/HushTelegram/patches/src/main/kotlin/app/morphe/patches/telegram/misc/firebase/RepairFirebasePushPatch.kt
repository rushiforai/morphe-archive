/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.firebase

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels as rawAddInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterKind
import app.morphe.util.RegisterKinds
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Repair Firebase push registration"
internal const val FIREBASE_PUSH = "$EXTENSION_PACKAGE/misc/FirebasePush;"
internal const val CERTIFICATE_HOOK = "$FIREBASE_PUSH->certificateHeader(Ljava/net/URLConnection;Ljava/lang/String;)Ljava/lang/String;"
private const val STRING = "Ljava/lang/String;"
private const val HTTP = "Ljava/net/HttpURLConnection;"
private const val CONNECTION = "Ljava/net/URLConnection;"
private const val URL = "Ljava/net/URL;"
internal const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
internal const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
internal const val TOKEN_READER = "hushTelegramTokenPresence"
internal const val ACCOUNT_READER = "hushTelegramAccountCounts"
internal const val PUSH_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val BASE_CONTROLLER = "Lorg/telegram/messenger/BaseController;"
internal const val ANSWER_HOOK = "$FIREBASE_PUSH->registerDeviceAnswer(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V"
internal const val SENT_HOOK = "$FIREBASE_PUSH->registerDeviceSent(Ljava/lang/Object;I)V"
private const val OBJECT = "Ljava/lang/Object;"
private const val REGISTER_DEVICE = "Lorg/telegram/tgnet/tl/TL_account\$registerDevice;"
private const val SEND_REQUEST = "Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I"
private const val TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
private const val TL_ERROR = "Lorg/telegram/tgnet/TLRPC\$TL_error;"
private const val BOOL_TRUE = "Lorg/telegram/tgnet/TLRPC\$TL_boolTrue;"

/**
 * Fresh implementation from Firebase's documented header path. Telegram 12.10.6 inlines
 * getFingerprintHashForPackage into openHttpURLConnection, so only its header value is wrapped.
 * Reference: firebase/firebase-android-sdk FirebaseInstallationServiceClient.java.
 */
@Suppress("unused")
val repairFirebasePushPatch = bytecodePatch(
    name = PATCH,
    description = "Tries to help a patched Telegram sign up for push notifications, by giving Google's Firebase service" +
        " Telegram's original certificate. If Telegram's server still turns the sign-up down, as it does with your own" +
        " API ID, it turns on Telegram's own Keep-Alive Service and Background Connection instead, unless you've set" +
        " either one yourself. While Keep-Alive Service is on, it runs with a quiet notification so Android doesn't stop" +
        " it in the background. On by default. Turn it off in HushTelegram settings > Notifications.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch, telegramExtensionPatch, keepAliveServicePatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("repairFirebasePush")
        requireStatusMethod("firebaseCertificateHeader")
        requireStatusMethod("firebaseLocalStatus")
        val plan = resolveFirebaseHeader()
        val local = resolveLocalNotificationReaders()
        val answer = resolvePushAnswer()
        plan.method.addInstructionsAtControlFlowLabel(plan.index, """
            invoke-static {v${plan.connection}, v${plan.value}}, $CERTIFICATE_HOOK
            move-result-object v${plan.value}
        """)
        answer.method.addInstructionsAtControlFlowLabel(answer.index, answer.hook)
        // this and the push type sit side by side past registerForPush's locals, so a range reaches them however many there are.
        answer.sender.addInstructionsAtControlFlowLabel(answer.send, """
            invoke-static/range {v${answer.senderSelf} .. v${answer.senderType}}, $SENT_HOOK
        """)
        for ((owner, original, replacement) in local.methods) {
            if (original != null) owner.methods.remove(original)
            owner.methods.add(replacement)
        }
        enableCapability("firebaseCertificateHeader")
        enableCapability("firebaseLocalStatus")
        enableStatus("repairFirebasePush")
    }
}

internal data class FirebaseHeaderPlan(
    val method: MutableMethod, val index: Int, val connection: Int, val value: Int,
    val requests: Map<FirebaseRequest, Method>,
)
internal enum class FirebaseRequest { CREATE, TOKEN, DELETE }

internal data class LocalNotificationPlan(val methods: List<Triple<MutableClass, MutableMethod?, MutableMethod>>)

/** Where the answer hook goes and its code, then registerForPush with its request's index and the registers it keeps this and the push type in. */
internal data class PushAnswerPlan(
    val method: MutableMethod, val index: Int, val hook: String,
    val sender: MutableMethod, val send: Int, val senderSelf: Int, val senderType: Int,
)

/**
 * Telegram's account.registerDevice callback keeps its lambda$registerForPush$N name and is the only place the
 * server's answer arrives. Telegram drops a refusal without a trace, so "confirmed for push: 0" couldn't say why.
 * The hook goes in front of the boolTrue test and only reads the callback's own controller, push type, response
 * and error. A second hook just ahead of the request in registerForPush reads the controller and push type, so
 * an answer goes to the account that asked rather than to whoever holds its place when it's back.
 */
internal fun BytecodePatchContext.resolvePushAnswer(): PushAnswerPlan {
    val owners = mutableListOf<String>()
    classDefForEach { if (it.origType == PUSH_CONTROLLER) owners += it.type }
    shape(owners.size == 1, "push registration owner is missing or ambiguous")
    val controller = tgMutableClassDefBy(PUSH_CONTROLLER)
    val sender = controller.methods.filter { it.origName == "registerForPush" && it.hasShape(listOf("I", STRING), "V") }
        .unique("push registration request method")
    shape(!AccessFlags.STATIC.isSet(sender.accessFlags) && sender.implementation != null,
        "push registration request method is static or has no body")
    val sending = sender.instructions()
    val send = sending.indices.filter { sending[it].call()?.toString() == SEND_REQUEST }.unique("push registration request")
    val senderSelf = sender.localRegisterCount()
    val senderType = sender.parameterRegisterNumber(0)
    shape(senderType == senderSelf + 1 &&
        sending.count { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.origString() == REGISTER_DEVICE } == 1 &&
        sending.count { it.opcode == Opcode.IPUT && it.field()?.toString() == "$REGISTER_DEVICE->token_type:I" &&
            (it as TwoRegisterInstruction).registerA == senderType } == 1,
        "push registration no longer sends one account.registerDevice with its push type")
    sender.requireThisIntact(PATCH, listOf(send))
    sender.requireParameterIntact(PATCH, 0, listOf(send))
    // Through 13.1 the answer is a lambda of the controller's own. registerForPush also owns a
    // no-argument lambda that clears its in-flight flag, so the name alone isn't enough. 13.2's R8
    // took both out, and the answer is a case of a merged delegate.
    val (callback, at, hook) = if (controller.methods.any { it.origName.startsWith("lambda\$registerForPush\$") }) {
        lambdaPushAnswer(controller)
    } else {
        mergedPushAnswer(sender, send, senderSelf, senderType, controller.type)
    }

    // The hooks ask the controller who's signed in by these two names, and can only reach public ones.
    fun reader(owner: String, name: String, result: String) = tgClassDefByOrNull(owner)?.let { host ->
        AccessFlags.PUBLIC.isSet(host.accessFlags) && host.methods.any {
            it.origName == name && it.hasShape(emptyList(), result) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }
    } == true
    shape(controller.origSuperclass == BASE_CONTROLLER && reader(BASE_CONTROLLER, "getUserConfig", USER_CONFIG) &&
        reader(USER_CONFIG, "getClientUserId", "J"), "push registration owner can no longer say who's signed in")
    for ((name, parameters) in listOf("registerDeviceAnswer" to listOf(OBJECT, "I", OBJECT, OBJECT), "registerDeviceSent" to listOf(OBJECT, "I"))) {
        val hook = tgMutableClassDefBy(FIREBASE_PUSH).methods.filter { it.origName == name }.unique("extension $name hook")
        shape(hook.hasShape(parameters, "V") && hook.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "extension $name hook is not callable")
    }
    return PushAnswerPlan(callback, at, hook, sender, send, senderSelf, senderType)
}

private fun lambdaPushAnswer(controller: MutableClass): Triple<MutableMethod, Int, String> {
    val callback = controller.methods.filter {
        it.origName.startsWith("lambda\$registerForPush\$") && it.hasShape(listOf("I", STRING, TL_OBJECT, TL_ERROR), "V")
    }.unique("push registration answer callback")
    shape(!AccessFlags.STATIC.isSet(callback.accessFlags) && callback.implementation != null,
        "push registration answer callback is static or has no body")
    // Parameters fill the last registers: this, push type, token, response, error.
    val registers = callback.implementation!!.registerCount
    val response = registers - 2
    val error = registers - 1
    shape(error <= 15, "push registration answer parameters are out of a hook's reach")
    val body = callback.instructions()
    val test = body.firstOrNull()
    shape(test?.opcode == Opcode.INSTANCE_OF && (test as ReferenceInstruction).reference.origString() == BOOL_TRUE &&
        (test as TwoRegisterInstruction).registerB == response && body.count { it.opcode == Opcode.INSTANCE_OF } == 1,
        "push registration answer is no longer tested for boolTrue first")
    shape(body.count { it.opcode == Opcode.IPUT_BOOLEAN && it.origRef() == "$USER_CONFIG->registeredForPush:Z" } == 1,
        "push registration answer no longer records an accepted registration")
    return Triple(callback, 0, "invoke-static {v${registers - 5}, v${registers - 4}, v$response, v$error}, $ANSWER_HOOK")
}

/**
 * 13.2's R8 merged registerForPush's answer into a RequestDelegate other requests share. Its run
 * switches on a case number the constructor stores, and keeps the controller and push type in
 * fields. The request names its case, so the hook goes at that case's start, loads the two fields
 * into registers the case writes before it reads them, and passes run's own response and error.
 */
private fun BytecodePatchContext.mergedPushAnswer(
    sender: Method, send: Int, senderSelf: Int, senderType: Int, controller: String,
): Triple<MutableMethod, Int, String> {
    val sending = sender.instructions()
    val delegate = sending[send].namedRegisters().getOrNull(2)
    val made = (0 until send).filter { sending[it].opcode == Opcode.NEW_INSTANCE && sending[it].namedRegisters() == listOf(delegate) }
        .unique("push registration answer delegate")
    val type = (sending[made] as ReferenceInstruction).reference.toString()
    val built = (made + 1 until send).filter {
        sending[it].opcode == Opcode.INVOKE_DIRECT && sending[it].call()?.name == "<init>" && sending[it].namedRegisters().firstOrNull() == delegate
    }.unique("push registration answer delegate constructor")
    val init = sending[built].call()!!
    val operands = sending[built].namedRegisters()
    val case = (made + 1 until built).lastOrNull { operands.size == 5 && sending[it].writesRegister(operands[4]) }
        ?.let { sending[it] as? NarrowLiteralInstruction }?.takeIf { it.opcode in CONSTANTS }?.narrowLiteral
    shape(init.definingClass == type && init.hasShape(listOf(OBJECT, "I", OBJECT, "I"), "V") && operands.size == 5 &&
        operands[1] == senderSelf && operands[2] == senderType && operands[3] == senderType + 1 && case != null &&
        (made + 1 until send).none { it != built && sending[it].writesRegister(delegate!!) },
        "push registration answer delegate no longer takes the controller, push type and token with its case")

    val owner = mutableClassDefByOrNull(type)
        ?: throw PatchException("$PATCH: push registration answer delegate $type is missing; refuses before editing")
    val constructor = owner.methods.filter { it.name == "<init>" && it.hasShape(listOf(OBJECT, "I", OBJECT, "I"), "V") }
        .unique("push answer delegate constructor")
    val self = constructor.implementation!!.registerCount - 5
    val stores = constructor.instructions().filter {
        it.opcode in setOf(Opcode.IPUT, Opcode.IPUT_OBJECT) && it.namedRegisters().getOrNull(1) == self
    }
    fun stored(parameter: Int) = stores.filter { it.namedRegisters()[0] == self + parameter }.mapNotNull { it.field() }.singleOrNull()
    val caseField = stored(4)
    val controllerField = stored(1)
    val typeField = stored(2)
    val kept = listOfNotNull(caseField, controllerField, typeField).map { it.toString() }
    shape(kept.size == 3 && kept.distinct().size == 3 && listOf(caseField, controllerField, typeField).all { it!!.definingClass == type } &&
        caseField!!.type == "I" && controllerField!!.type == OBJECT && typeField!!.type == "I" &&
        constructor.instructions().none { instruction -> (1..4).any { instruction.writesRegister(self + it) } } &&
        owner.methods.filter { it.name != "<init>" }.none { method -> method.instructions().any {
            it.opcode in setOf(Opcode.IPUT, Opcode.IPUT_OBJECT) && it.field()?.toString() in kept
        } },
        "push answer delegate no longer keeps its case, controller and push type as it's built")

    val run = owner.methods.filter { it.name == "run" && it.hasShape(listOf(TL_OBJECT, TL_ERROR), "V") }.unique("push answer delegate run")
    shape(!AccessFlags.STATIC.isSet(run.accessFlags) && run.implementation != null, "push answer delegate run is static or has no body")
    val registers = run.implementation!!.registerCount
    val receiver = registers - 3
    val response = registers - 2
    val error = registers - 1
    shape(error <= 15, "push answer delegate parameters are out of a hook's reach")
    val body = run.instructions()
    val selector = body.getOrNull(0)?.namedRegisters()?.firstOrNull()
    shape(body.getOrNull(0)?.opcode == Opcode.IGET && body[0].field()?.toString() == caseField.toString() &&
        body[0].namedRegisters().getOrNull(1) == receiver && selector !in setOf(receiver, response, error) &&
        body.getOrNull(1)?.opcode in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH) && body[1].namedRegisters() == listOf(selector),
        "push answer delegate no longer switches on its case first")
    val address = IntArray(body.size + 1)
    for (index in body.indices) address[index + 1] = address[index] + body[index].codeUnits
    fun at(offset: Int) = body.indices.firstOrNull { address[it] == address[1] + offset }
    val payload = at((body[1] as OffsetInstruction).codeOffset)?.let { body[it] as? SwitchPayload }
    val start = payload?.switchElements?.filter { it.key == case }?.singleOrNull()?.let { at(it.offset) }
    val flow = ControlFlow.of(run)
    shape(start != null && body.indices.filter { start in flow.normal[it] || start in flow.exceptional[it] } == listOf(1),
        "push answer delegate's case $case is missing or shared")
    // The case's own boolTrue test of the response, with nothing before it but straight-line code.
    val test = (start!! until body.size).firstOrNull { body[it].opcode == Opcode.INSTANCE_OF }
    val reached = mutableSetOf<Int>()
    val pending = ArrayDeque(listOf(start))
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (reached.add(index)) pending.addAll(flow.normal[index] + flow.exceptional[index])
    }
    shape(test != null && (body[test] as ReferenceInstruction).reference.origString() == BOOL_TRUE &&
        (body[test] as TwoRegisterInstruction).registerB == response &&
        (start until test).all { flow.normal[it] == listOf(it + 1) && !body[it].writesRegister(response) } &&
        reached.count { body[it].opcode == Opcode.INSTANCE_OF && (body[it] as ReferenceInstruction).reference.origString() == BOOL_TRUE } == 1,
        "push answer delegate's case is no longer tested for boolTrue first")
    shape(reached.count { body[it].opcode == Opcode.IPUT_BOOLEAN && body[it].origRef() == "$USER_CONFIG->registeredForPush:Z" } == 1,
        "push answer delegate's case no longer records an accepted registration")
    shape(body.getOrNull(start + 1)?.opcode == Opcode.CHECK_CAST && body[start].opcode == Opcode.IGET_OBJECT &&
        body[start].field()?.toString() == controllerField.toString() && body[start].namedRegisters().getOrNull(1) == receiver &&
        (body[start + 1] as ReferenceInstruction).reference.toString() == controller &&
        body[start + 1].namedRegisters() == listOf(body[start].namedRegisters().first()),
        "push answer delegate's case no longer starts from its controller")
    val live = RegisterLiveness.of(run).liveInto(start)
    val scratch = (0..minOf(15, registers - 1)).filter { it !in live && it !in setOf(receiver, response, error) }.take(2)
    shape(scratch.size == 2, "push answer delegate's case leaves no register for the hook")
    return Triple(run, start, """
        iget-object v${scratch[0]}, v$receiver, $controllerField
        iget v${scratch[1]}, v$receiver, $typeField
        invoke-static {v${scratch[0]}, v${scratch[1]}, v$response, v$error}, $ANSWER_HOOK
    """)
}

private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

/** The bridges read existing loaded memory. No account creation, configuration loading or registration. */
internal fun BytecodePatchContext.resolveLocalNotificationReaders(): LocalNotificationPlan {
    val retained = mutableListOf<String>()
    classDefForEach { if (it.origType == SHARED_CONFIG || it.origType == USER_CONFIG) retained += it.origType }
    shape(retained.count { it == SHARED_CONFIG } == 1 && retained.count { it == USER_CONFIG } == 1,
        "local configuration owner is missing or ambiguous")
    val shared = tgMutableClassDefBy(SHARED_CONFIG)
    val user = tgMutableClassDefBy(USER_CONFIG)
    shape(AccessFlags.PUBLIC.isSet(shared.accessFlags) && shared.origSuperclass == "Ljava/lang/Object;" &&
        AccessFlags.PUBLIC.isSet(user.accessFlags) && user.origSuperclass == "Lorg/telegram/messenger/BaseController;",
        "local configuration owners changed")
    // 13.2's R8 made these private members public and left the rest of each flag set alone.
    fun widened(flags: Int) = if (AccessFlags.PRIVATE.isSet(flags)) (flags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value else flags
    fun field(owner: ClassDef, name: String, type: String, flags: Int) = owner.fields.filter { it.origName == name }
        .unique("${owner.type} local $name field").also {
            shape(it.origType == type && (it.accessFlags == flags || it.accessFlags == widened(flags)), "local $name field lost its type or access")
        }
    val privateStatic = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value
    val publicStatic = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
    field(shared, "sync", "Ljava/lang/Object;", privateStatic or AccessFlags.FINAL.value)
    field(shared, "configLoaded", "Z", privateStatic)
    field(shared, "pushString", STRING, publicStatic)
    field(user, "Instance", "[$USER_CONFIG", privateStatic or AccessFlags.VOLATILE.value)
    field(user, "sync", "Ljava/lang/Object;", AccessFlags.PRIVATE.value or AccessFlags.FINAL.value)
    field(user, "configLoaded", "Z", AccessFlags.PRIVATE.value or AccessFlags.VOLATILE.value)
    field(user, "currentUser", "Lorg/telegram/tgnet/TLRPC\$User;", AccessFlags.PRIVATE.value)
    field(user, "registeredForPush", "Z", AccessFlags.PUBLIC.value)
    // 13.2's R8 folded the slot limit into its readers and dropped the field. The account array's
    // initializer below still pins the four slots on every build.
    if (user.fields.any { it.origName == "MAX_ACCOUNT_COUNT" }) {
        val limit = field(user, "MAX_ACCOUNT_COUNT", "I", publicStatic or AccessFlags.FINAL.value)
        shape((limit.initialValue as? IntEncodedValue)?.value == 4, "local account slot limit changed")
    }
    // 13.2's R8 also made the readers final, which changes nothing about calling them.
    fun read(owner: ClassDef, name: String, result: String, static: Boolean): Method = owner.methods
        .filter { it.origName == name }.unique("local $name reader").also {
            shape(it.hasShape(emptyList(), result) && (it.accessFlags and AccessFlags.FINAL.value.inv()) ==
                (AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0) && it.implementation != null,
                "local $name reader is no longer callable")
        }
    // 13.2's R8 inlined isConfigLoaded into its one caller. loadConfig's own readiness checks below
    // tie configLoaded to a completed load on every build.
    if (user.methods.any { it.origName == "isConfigLoaded" }) {
        val loaded = read(user, "isConfigLoaded", "Z", false)
        shape(loaded.implementation!!.registerCount == 2 && loaded.instructions().map { it.opcode } ==
            listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN) && loaded.instructions()[0].origRef() == "$USER_CONFIG->configLoaded:Z" &&
            loaded.instructions().map { it.namedRegisters() } == listOf(listOf(0, 1), listOf(0)), "account readiness reader changed")
    }
    val active = read(user, "isClientActivated", "Z", false)
    val body = active.instructions()
    val flow = ControlFlow.of(active)
    shape(active.implementation!!.registerCount == 3 && body.map { it.opcode } == listOf(
        Opcode.IGET_OBJECT, Opcode.MONITOR_ENTER, Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.CONST_4,
        Opcode.GOTO, Opcode.CONST_4, Opcode.MONITOR_EXIT, Opcode.RETURN, Opcode.MOVE_EXCEPTION, Opcode.MONITOR_EXIT, Opcode.THROW,
    ) && body.map { it.namedRegisters() } == listOf(listOf(0, 2), listOf(0), listOf(1, 2), listOf(1), listOf(1),
        emptyList(), listOf(1), listOf(0), listOf(1), listOf(1), listOf(0), listOf(1)) &&
        body[0].origRef() == "$USER_CONFIG->sync:Ljava/lang/Object;" &&
        body[2].origRef() == "$USER_CONFIG->currentUser:Lorg/telegram/tgnet/TLRPC\$User;" &&
        (body[4] as NarrowLiteralInstruction).narrowLiteral == 1 && (body[6] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        flow.normal[3].toSet() == setOf(4, 6) && flow.normal[5] == listOf(7), "active account reader changed")
    val initialize = user.methods.filter { it.origName == "<clinit>" }.unique("local account array initializer").instructions()
    shape(initialize.map { it.opcode } == listOf(Opcode.CONST_4, Opcode.NEW_ARRAY, Opcode.SPUT_OBJECT, Opcode.RETURN_VOID) &&
        (initialize[0] as NarrowLiteralInstruction).narrowLiteral == 4 &&
        initialize.map { it.namedRegisters() } == listOf(listOf(0), listOf(0, 0), listOf(0), emptyList()) &&
        initialize[1].origRef() == "[$USER_CONFIG" &&
        initialize[2].origRef() == "$USER_CONFIG->Instance:[$USER_CONFIG", "existing account array shape changed")
    for ((owner, key, target) in listOf(
        Triple(shared, "pushString2", Opcode.SPUT_OBJECT to "pushString"),
        Triple(user, "registeredForPush", Opcode.IPUT_BOOLEAN to "registeredForPush"),
    )) {
        val load = read(owner, "loadConfig", "V", owner === shared).instructions()
        val at = load.indices.filter { load[it].field()?.origName == target.second && load[it].opcode == target.first }
            .unique("local $key configuration load")
        val keyOffset = if (owner === shared) 4 else 3
        val preference = if (owner === shared) "getString" else "getBoolean"
        val operands = load.getOrNull(at - 2)?.namedRegisters().orEmpty()
        val value = load[at].namedRegisters().firstOrNull()
        shape(at >= keyOffset && load[at - keyOffset].string() == key && load[at - 2].opcode == Opcode.INVOKE_INTERFACE &&
            load[at - 2].call()?.let { it.origDefiningClass == "Landroid/content/SharedPreferences;" && it.origName == preference &&
                it.hasShape(listOf(STRING, if (owner === shared) STRING else "Z"), if (owner === shared) STRING else "Z") } == true &&
            load[at - 1].opcode == (if (owner === shared) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT) &&
            operands.size == 3 && operands.distinct().size == 3 && value == operands[1] &&
            load[at - keyOffset].namedRegisters() == listOf(operands[1]) &&
            load[at - 1].namedRegisters() == listOf(value) &&
            (owner !== shared || load[at - 3].string() == "" && load[at - 3].namedRegisters() == listOf(operands[2])),
            "local $key no longer comes from preferences")
        shape(load[0].field()?.origName == "sync" &&
            load[1].opcode == Opcode.MONITOR_ENTER && load[2].field()?.origName == "configLoaded" &&
            load.count { it.field()?.origName == "configLoaded" && it.opcode in setOf(Opcode.SPUT_BOOLEAN, Opcode.IPUT_BOOLEAN) } == 1,
            "local $key load readiness changed")
        val ready = load.indexOfFirst { it.field()?.origName == "configLoaded" && it.opcode in setOf(Opcode.SPUT_BOOLEAN, Opcode.IPUT_BOOLEAN) }
        shape(load.getOrNull(ready + 1)?.opcode == Opcode.MONITOR_EXIT && load.getOrNull(ready + 2)?.opcode == Opcode.RETURN_VOID,
            "local $key readiness no longer marks the completed load")
    }
    shape(shared.methods.none { it.origName == TOKEN_READER } && user.methods.none { it.origName == ACCOUNT_READER },
        "a local status bridge already exists")
    // Each method goes on its owner as the build names it. [raw] smali already names the build's
    // classes, as a call to a reader added here does: it can't be checked against the build yet.
    fun method(owner: ClassDef, name: String, registers: Int, smali: String, original: Method? = null, raw: Boolean = false): MutableMethod =
        ImmutableMethod(owner.type, name, original?.parameters ?: emptyList(), "I", original?.accessFlags ?: publicStatic,
            original?.annotations ?: emptySet(), original?.hiddenApiRestrictions ?: emptySet(), MutableMethodImplementation(registers))
            .toMutable().apply { if (raw) rawAddInstructionsWithLabels(0, smali) else addInstructionsWithLabels(0, smali) }
    val runtime = tgMutableClassDefBy(FIREBASE_PUSH)
    fun stub(name: String, target: String): Triple<MutableClass, MutableMethod?, MutableMethod> {
        val original = runtime.methods.filter { it.origName == name }.unique("extension $name stub")
        shape(original.hasShape(emptyList(), "I") && original.accessFlags == privateStatic &&
            original.instructions().map { it.opcode } == listOf(Opcode.CONST_4, Opcode.RETURN) &&
            (original.instructions()[0] as NarrowLiteralInstruction).narrowLiteral == -1, "extension $name is not an unknown fallback")
        return Triple(runtime, original, method(runtime, name, 1, """
            invoke-static {}, $target
            move-result v0
            return v0
        """, original, raw = true))
    }
    val token = method(shared, TOKEN_READER, 3, """
        const/4 v1, -0x1
        sget-object v0, $SHARED_CONFIG->sync:Ljava/lang/Object;
        if-eqz v0, :done
        monitor-enter v0
        :read_start
        sget-boolean v2, $SHARED_CONFIG->configLoaded:Z
        if-eqz v2, :read_end
        sget-object v2, $SHARED_CONFIG->pushString:Ljava/lang/String;
        if-eqz v2, :read_end
        invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
        move-result v1
        xor-int/lit8 v1, v1, 0x1
        :read_end
        monitor-exit v0
        :done
        return v1
        :failed
        move-exception v1
        monitor-exit v0
        throw v1
        .catchall {:read_start .. :read_end} :failed
    """)
    val accounts = method(user, ACCOUNT_READER, 8, """
        const/4 v0, -0x1
        sget-object v1, $USER_CONFIG->Instance:[$USER_CONFIG
        if-eqz v1, :unknown
        array-length v2, v1
        const/4 v3, 0x4
        if-ne v2, v3, :unknown
        const/4 v2, 0x0
        const/4 v3, 0x0
        const/4 v4, 0x0
        :next
        const/4 v5, 0x4
        if-ge v2, v5, :finish
        aget-object v5, v1, v2
        if-eqz v5, :unknown
        iget-object v6, v5, $USER_CONFIG->sync:Ljava/lang/Object;
        if-eqz v6, :unknown
        monitor-enter v6
        :read_start
        iget-boolean v7, v5, $USER_CONFIG->configLoaded:Z
        if-eqz v7, :unloaded
        iget-object v7, v5, $USER_CONFIG->currentUser:Lorg/telegram/tgnet/TLRPC${'$'}User;
        if-eqz v7, :read_end
        add-int/lit8 v3, v3, 0x1
        iget-boolean v7, v5, $USER_CONFIG->registeredForPush:Z
        if-eqz v7, :read_end
        add-int/lit8 v4, v4, 0x1
        :read_end
        monitor-exit v6
        add-int/lit8 v2, v2, 0x1
        goto :next
        :unloaded
        monitor-exit v6
        goto :unknown
        :finish
        shl-int/lit8 v4, v4, 0x8
        or-int v0, v3, v4
        :unknown
        return v0
        :failed
        move-exception v5
        monitor-exit v6
        throw v5
        .catchall {:read_start .. :read_end} :failed
    """)
    return LocalNotificationPlan(listOf(Triple(shared, null, token), Triple(user, null, accounts),
        stub("nativeTokenPresence", "${shared.type}->$TOKEN_READER()I"),
        stub("nativeAccountCounts", "${user.type}->$ACCOUNT_READER()I")))
}

/** Every retained request must reach the same scoped sink before any mutation is made. */
internal fun BytecodePatchContext.resolveFirebaseHeader(): FirebaseHeaderPlan {
    val classes = linkedMapOf<String, ClassDef>()
    classDefForEach { if (!it.origType.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    // Each search reads the classes as they were above, among those naming what it looks for.
    fun methods(mentioning: Mention) = classDefsMentioning(mentioning).mapNotNull { classes[it.type] }.flatMap { it.methods.toList() }
    val anchors = listOf("X-Android-Cert", "X-Android-Package", "x-goog-api-key", "SHA1", "Could not get fingerprint hash for package: ")
    val header = methods(Mention.allOf(anchors.map { Mention.string(it) })).filter { it.hasShape(listOf(URL, STRING), HTTP) &&
        anchors.all { anchor -> anchor in it.strings() }
    }.unique("Firebase certificate header method")
    shape(!AccessFlags.STATIC.isSet(header.accessFlags), "header method lost its receiver")
    val owner = classes.getValue(header.definingClass)
    val uri = owner.methods.filter { it.hasShape(listOf(STRING), URL) &&
        "https://firebaseinstallations.googleapis.com/v1/" in it.strings()
    }.unique("Firebase request URL factory")
    val callers = methods(Mention.member(header.definingClass, header.name)).filter { method -> method.instructions().any { it.call()?.same(header) == true } }
    val requests = linkedMapOf<FirebaseRequest, Method>()
    for (caller in callers) {
        val strings = caller.strings()
        val role = when {
            "/authTokens:generate" in strings && "POST" in strings -> FirebaseRequest.TOKEN
            "/installations" in strings && "x-goog-fis-android-iid-migration-auth" in strings && "POST" in strings -> FirebaseRequest.CREATE
            "/installations/" in strings && "DELETE" in strings -> FirebaseRequest.DELETE
            else -> throw PatchException("$PATCH: unrecognized Firebase request caller $caller; refuses before editing")
        }
        shape(requests.put(role, caller) == null, "more than one $role request path")
        shape(caller.instructions().any { it.call()?.same(uri) == true }, "$role request bypasses the Firebase URL factory")
    }
    shape(FirebaseRequest.CREATE in requests && FirebaseRequest.TOKEN in requests,
        "installation creation or token generation no longer reaches the shared header")

    val method = tgMutableClassDefBy(header.definingClass).methods.single { it.same(header) }
    val instructions = method.instructions()
    val literal = instructions.indices.filter { instructions[it].string() == "X-Android-Cert" }.unique("certificate header literal")
    val sink = literal + 1
    val operands = instructions.getOrNull(sink)?.namedRegisters().orEmpty()
    shape(instructions[literal].opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
        operands.size == 3 && operands.distinct().size == 3 && operands.all { it in 0..15 } &&
        instructions[literal].namedRegisters() == listOf(operands[1]) &&
        instructions.getOrNull(sink)?.isHeaderWrite() == true,
        "certificate literal no longer binds a unique header write")
    val flow = ControlFlow.of(method)
    shape(flow.normal.indices.all { at -> sink !in flow.normal[at] || at == literal } &&
        flow.exceptional.none { sink in it }, "an edge bypasses the certificate key")
    val kinds = RegisterKinds.of(method).at(sink)
    shape(kinds != null && kinds.getOrNull(operands[0]) == RegisterKind.ref(HTTP) &&
        kinds.getOrNull(operands[1]) == RegisterKind.ref(STRING) &&
        kinds.getOrNull(operands[2]) in setOf(RegisterKind.ref(STRING), RegisterKind.ZERO),
        "certificate operands are not a verified HTTP connection and nullable string")
    // R8 picks the scratch register per build. Bind that literal to its own header write,
    // while requiring the original API-key parameter and the same returned connection.
    val apiKey = instructions.getOrNull(sink + 1)
    val apiOperands = instructions.getOrNull(sink + 2)?.namedRegisters().orEmpty()
    val apiParameter = method.implementation!!.registerCount - 1
    shape(apiKey?.string() == "x-goog-api-key" &&
        apiKey.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
        apiOperands.size == 3 && apiOperands.distinct().size == 3 &&
        apiKey.namedRegisters() == listOf(apiOperands[1]) &&
        instructions.getOrNull(sink + 2)?.isHeaderWrite() == true &&
        apiOperands[0] == operands[0] && apiOperands[2] == apiParameter &&
        flow.normal.indices.all { at -> sink + 2 !in flow.normal[at] || at == sink + 1 } &&
        flow.exceptional.none { sink + 2 in it } &&
        instructions.getOrNull(sink + 3)?.opcode == Opcode.RETURN_OBJECT &&
        instructions.getOrNull(sink + 3)?.namedRegisters() == listOf(operands[0]),
        "certificate write lost its API-key header and connection return")
    val runtime = tgMutableClassDefBy(FIREBASE_PUSH)
    shape(AccessFlags.PUBLIC.isSet(runtime.accessFlags) && runtime.methods.count { hook ->
        hook.origName == "certificateHeader" && hook.hasShape(listOf(CONNECTION, STRING), STRING) &&
            AccessFlags.PUBLIC.isSet(hook.accessFlags) && AccessFlags.STATIC.isSet(hook.accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(hook.accessFlags) && !AccessFlags.NATIVE.isSet(hook.accessFlags) &&
            (hook.implementation?.registerCount ?: 0) >= 2 && hook.instructions().any { !it.opcode.format.isPayloadFormat }
    } == 1, "extension certificate hook is not callable")
    return FirebaseHeaderPlan(method, sink, operands[0], operands[2], requests)
}

private fun Instruction.isHeaderWrite() = opcode == Opcode.INVOKE_VIRTUAL && call()?.let {
    it.origDefiningClass in setOf(CONNECTION, HTTP) && it.origName == "addRequestProperty" && it.hasShape(listOf(STRING, STRING), "V")
} == true
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Method.strings() = instructions().mapNotNull { it.string() }.toSet()
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun MethodReference.hasShape(parameters: List<String>, result: String) =
    origParameterTypes == parameters && origReturnType == result
private fun MethodReference.same(other: MethodReference) = definingClass == other.definingClass && name == other.name &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString) && returnType == other.returnType
private fun shape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses changed Firebase geometry before editing")
}
private fun <T> List<T>.unique(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
