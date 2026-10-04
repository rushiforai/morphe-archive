/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.firebase

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterKind
import app.morphe.util.RegisterKinds
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

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

/**
 * Fresh implementation from Firebase's documented header path. Telegram 12.10.6 inlines
 * getFingerprintHashForPackage into openHttpURLConnection, so only its header value is wrapped.
 * Reference: firebase/firebase-android-sdk FirebaseInstallationServiceClient.java.
 */
@Suppress("unused")
val repairFirebasePushPatch = bytecodePatch(
    name = PATCH,
    description = "Restores Telegram's official certificate header in Firebase Installations requests " +
        "on re-signed builds. Other signature checks keep their usual behavior.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("repairFirebasePush")
        requireStatusMethod("firebaseCertificateHeader")
        requireStatusMethod("firebaseLocalStatus")
        val plan = resolveFirebaseHeader()
        val local = resolveLocalNotificationReaders()
        plan.method.addInstructionsAtControlFlowLabel(plan.index, """
            invoke-static {v${plan.connection}, v${plan.value}}, $CERTIFICATE_HOOK
            move-result-object v${plan.value}
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

/** The bridges read existing loaded memory. No account creation, configuration loading or registration. */
internal fun BytecodePatchContext.resolveLocalNotificationReaders(): LocalNotificationPlan {
    val retained = mutableListOf<String>()
    classDefForEach { if (it.type == SHARED_CONFIG || it.type == USER_CONFIG) retained += it.type }
    shape(retained.count { it == SHARED_CONFIG } == 1 && retained.count { it == USER_CONFIG } == 1,
        "local configuration owner is missing or ambiguous")
    val shared = mutableClassDefBy(SHARED_CONFIG)
    val user = mutableClassDefBy(USER_CONFIG)
    shape(AccessFlags.PUBLIC.isSet(shared.accessFlags) && shared.superclass == "Ljava/lang/Object;" &&
        AccessFlags.PUBLIC.isSet(user.accessFlags) && user.superclass == "Lorg/telegram/messenger/BaseController;",
        "local configuration owners changed")
    fun field(owner: ClassDef, name: String, type: String, flags: Int) = owner.fields.filter { it.name == name }
        .unique("${owner.type} local $name field").also {
            shape(it.type == type && it.accessFlags == flags, "local $name field lost its type or access")
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
    val limit = field(user, "MAX_ACCOUNT_COUNT", "I", publicStatic or AccessFlags.FINAL.value)
    shape((limit.initialValue as? IntEncodedValue)?.value == 4, "local account slot limit changed")
    fun read(owner: ClassDef, name: String, result: String, static: Boolean): Method = owner.methods
        .filter { it.name == name }.unique("local $name reader").also {
            shape(it.hasShape(emptyList(), result) && it.accessFlags ==
                (AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0) && it.implementation != null,
                "local $name reader is no longer callable")
        }
    val loaded = read(user, "isConfigLoaded", "Z", false)
    shape(loaded.implementation!!.registerCount == 2 && loaded.instructions().map { it.opcode } ==
        listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN) && loaded.instructions()[0].field()?.toString() == "$USER_CONFIG->configLoaded:Z" &&
        loaded.instructions().map { it.namedRegisters() } == listOf(listOf(0, 1), listOf(0)), "account readiness reader changed")
    val active = read(user, "isClientActivated", "Z", false)
    val body = active.instructions()
    val flow = ControlFlow.of(active)
    shape(active.implementation!!.registerCount == 3 && body.map { it.opcode } == listOf(
        Opcode.IGET_OBJECT, Opcode.MONITOR_ENTER, Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.CONST_4,
        Opcode.GOTO, Opcode.CONST_4, Opcode.MONITOR_EXIT, Opcode.RETURN, Opcode.MOVE_EXCEPTION, Opcode.MONITOR_EXIT, Opcode.THROW,
    ) && body.map { it.namedRegisters() } == listOf(listOf(0, 2), listOf(0), listOf(1, 2), listOf(1), listOf(1),
        emptyList(), listOf(1), listOf(0), listOf(1), listOf(1), listOf(0), listOf(1)) &&
        body[0].field()?.toString() == "$USER_CONFIG->sync:Ljava/lang/Object;" &&
        body[2].field()?.toString() == "$USER_CONFIG->currentUser:Lorg/telegram/tgnet/TLRPC\$User;" &&
        (body[4] as NarrowLiteralInstruction).narrowLiteral == 1 && (body[6] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        flow.normal[3].toSet() == setOf(4, 6) && flow.normal[5] == listOf(7), "active account reader changed")
    val initialize = user.methods.filter { it.name == "<clinit>" }.unique("local account array initializer").instructions()
    shape(initialize.map { it.opcode } == listOf(Opcode.CONST_4, Opcode.NEW_ARRAY, Opcode.SPUT_OBJECT, Opcode.RETURN_VOID) &&
        (initialize[0] as NarrowLiteralInstruction).narrowLiteral == 4 &&
        initialize.map { it.namedRegisters() } == listOf(listOf(0), listOf(0, 0), listOf(0), emptyList()) &&
        (initialize[1] as? ReferenceInstruction)?.reference?.toString() == "[$USER_CONFIG" &&
        initialize[2].field()?.toString() == "$USER_CONFIG->Instance:[$USER_CONFIG", "existing account array shape changed")
    for ((owner, key, target) in listOf(
        Triple(shared, "pushString2", Opcode.SPUT_OBJECT to "pushString"),
        Triple(user, "registeredForPush", Opcode.IPUT_BOOLEAN to "registeredForPush"),
    )) {
        val load = read(owner, "loadConfig", "V", owner === shared).instructions()
        val at = load.indices.filter { load[it].field()?.name == target.second && load[it].opcode == target.first }
            .unique("local $key configuration load")
        val keyOffset = if (owner === shared) 4 else 3
        val preference = if (owner === shared) "getString" else "getBoolean"
        val operands = load.getOrNull(at - 2)?.namedRegisters().orEmpty()
        val value = load[at].namedRegisters().firstOrNull()
        shape(at >= keyOffset && load[at - keyOffset].string() == key && load[at - 2].opcode == Opcode.INVOKE_INTERFACE &&
            load[at - 2].call()?.let { it.definingClass == "Landroid/content/SharedPreferences;" && it.name == preference &&
                it.hasShape(listOf(STRING, if (owner === shared) STRING else "Z"), if (owner === shared) STRING else "Z") } == true &&
            load[at - 1].opcode == (if (owner === shared) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT) &&
            operands.size == 3 && operands.distinct().size == 3 && value == operands[1] &&
            load[at - keyOffset].namedRegisters() == listOf(operands[1]) &&
            load[at - 1].namedRegisters() == listOf(value) &&
            (owner !== shared || load[at - 3].string() == "" && load[at - 3].namedRegisters() == listOf(operands[2])),
            "local $key no longer comes from preferences")
        shape(load[0].field()?.name == "sync" &&
            load[1].opcode == Opcode.MONITOR_ENTER && load[2].field()?.name == "configLoaded" &&
            load.count { it.field()?.name == "configLoaded" && it.opcode in setOf(Opcode.SPUT_BOOLEAN, Opcode.IPUT_BOOLEAN) } == 1,
            "local $key load readiness changed")
        val ready = load.indexOfFirst { it.field()?.name == "configLoaded" && it.opcode in setOf(Opcode.SPUT_BOOLEAN, Opcode.IPUT_BOOLEAN) }
        shape(load.getOrNull(ready + 1)?.opcode == Opcode.MONITOR_EXIT && load.getOrNull(ready + 2)?.opcode == Opcode.RETURN_VOID,
            "local $key readiness no longer marks the completed load")
    }
    shape(shared.methods.none { it.name == TOKEN_READER } && user.methods.none { it.name == ACCOUNT_READER },
        "a local status bridge already exists")
    fun method(owner: String, name: String, registers: Int, smali: String, original: Method? = null): MutableMethod =
        ImmutableMethod(owner, name, original?.parameters ?: emptyList(), "I", original?.accessFlags ?: publicStatic,
            original?.annotations ?: emptySet(), original?.hiddenApiRestrictions ?: emptySet(), MutableMethodImplementation(registers))
            .toMutable().apply { addInstructionsWithLabels(0, smali) }
    val runtime = mutableClassDefBy(FIREBASE_PUSH)
    fun stub(name: String, target: String): Triple<MutableClass, MutableMethod?, MutableMethod> {
        val original = runtime.methods.filter { it.name == name }.unique("extension $name stub")
        shape(original.hasShape(emptyList(), "I") && original.accessFlags == privateStatic &&
            original.instructions().map { it.opcode } == listOf(Opcode.CONST_4, Opcode.RETURN) &&
            (original.instructions()[0] as NarrowLiteralInstruction).narrowLiteral == -1, "extension $name is not an unknown fallback")
        return Triple(runtime, original, method(FIREBASE_PUSH, name, 1, """
            invoke-static {}, $target
            move-result v0
            return v0
        """, original))
    }
    val token = method(SHARED_CONFIG, TOKEN_READER, 3, """
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
    val accounts = method(USER_CONFIG, ACCOUNT_READER, 8, """
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
        stub("nativeTokenPresence", "$SHARED_CONFIG->$TOKEN_READER()I"),
        stub("nativeAccountCounts", "$USER_CONFIG->$ACCOUNT_READER()I")))
}

/** Every retained request must reach the same scoped sink before any mutation is made. */
internal fun BytecodePatchContext.resolveFirebaseHeader(): FirebaseHeaderPlan {
    val classes = linkedMapOf<String, ClassDef>()
    classDefForEach { if (!it.type.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    val methods = classes.values.flatMap { it.methods.toList() }
    val header = methods.filter { it.hasShape(listOf(URL, STRING), HTTP) &&
        listOf("X-Android-Cert", "X-Android-Package", "x-goog-api-key", "SHA1",
            "Could not get fingerprint hash for package: ").all { anchor -> anchor in it.strings() }
    }.unique("Firebase certificate header method")
    shape(!AccessFlags.STATIC.isSet(header.accessFlags), "header method lost its receiver")
    val owner = classes.getValue(header.definingClass)
    val uri = owner.methods.filter { it.hasShape(listOf(STRING), URL) &&
        "https://firebaseinstallations.googleapis.com/v1/" in it.strings()
    }.unique("Firebase request URL factory")
    val callers = methods.filter { method -> method.instructions().any { it.call()?.same(header) == true } }
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

    val method = mutableClassDefBy(header.definingClass).methods.single { it.same(header) }
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
    // R8 reuses a different scratch register in beta. Bind that literal to its own header write,
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
    val runtime = mutableClassDefBy(FIREBASE_PUSH)
    shape(AccessFlags.PUBLIC.isSet(runtime.accessFlags) && runtime.methods.count { hook ->
        hook.name == "certificateHeader" && hook.hasShape(listOf(CONNECTION, STRING), STRING) &&
            AccessFlags.PUBLIC.isSet(hook.accessFlags) && AccessFlags.STATIC.isSet(hook.accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(hook.accessFlags) && !AccessFlags.NATIVE.isSet(hook.accessFlags) &&
            (hook.implementation?.registerCount ?: 0) >= 2 && hook.instructions().any { !it.opcode.format.isPayloadFormat }
    } == 1, "extension certificate hook is not callable")
    return FirebaseHeaderPlan(method, sink, operands[0], operands[2], requests)
}

private fun Instruction.isHeaderWrite() = opcode == Opcode.INVOKE_VIRTUAL && call()?.let {
    it.definingClass in setOf(CONNECTION, HTTP) && it.name == "addRequestProperty" && it.hasShape(listOf(STRING, STRING), "V")
} == true
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Method.strings() = instructions().mapNotNull { it.string() }.toSet()
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun MethodReference.hasShape(parameters: List<String>, result: String) =
    parameterTypes.map(CharSequence::toString) == parameters && returnType == result
private fun MethodReference.same(other: MethodReference) = definingClass == other.definingClass && name == other.name &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString) && returnType == other.returnType
private fun shape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses changed Firebase geometry before editing")
}
private fun <T> List<T>.unique(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
