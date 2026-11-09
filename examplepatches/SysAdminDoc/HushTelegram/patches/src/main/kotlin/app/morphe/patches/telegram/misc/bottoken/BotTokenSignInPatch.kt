/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.bottoken

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.api.DEBUG_TEST_BACKEND
import app.morphe.patches.telegram.misc.api.IS_TEST_BACKEND
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.SendRequestGate
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.resolveSendRequestGate
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import app.morphe.util.refusedByVerifier
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val BOT_SIGN_IN = "$EXTENSION_PACKAGE/misc/BotSignIn;"
internal const val BOT_TOKEN_REQUEST = "$EXTENSION_PACKAGE/misc/BotTokenRequest;"
internal const val BOT_SIGN_IN_PHONE_SCREEN = "$BOT_SIGN_IN->phoneScreen(Ljava/lang/Object;)V"
internal const val BOT_SIGN_IN_DROP = "$BOT_SIGN_IN->drop(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"
private const val STATUS = "botTokenSignIn"
private const val OBJECT = "Ljava/lang/Object;"
private const val CONTEXT = "Landroid/content/Context;"
private const val TLOBJECT = "Lorg/telegram/tgnet/TLObject;"
private const val OUTPUT_DATA = "Lorg/telegram/tgnet/OutputSerializedData;"
private const val INPUT_DATA = "Lorg/telegram/tgnet/InputSerializedData;"
private const val AUTHORIZATION = "Lorg/telegram/tgnet/TLRPC\$TL_auth_authorization;"
private const val ANY_AUTHORIZATION = "Lorg/telegram/tgnet/TLRPC\$auth_Authorization;"
private const val READ_AUTHORIZATION = "$ANY_AUTHORIZATION->TLdeserialize(${INPUT_DATA}IZ)$ANY_AUTHORIZATION"
private const val DELEGATE = "Lorg/telegram/tgnet/RequestDelegate;"
private const val DELEGATE_ANSWER = "run(${TLOBJECT}Lorg/telegram/tgnet/TLRPC\$TL_error;)V"
private const val MANAGER = "Lorg/telegram/tgnet/ConnectionsManager;"
private const val MANAGER_INSTANCE = "$MANAGER->getInstance(I)$MANAGER"
private const val MANAGER_SEND = "$MANAGER->sendRequest($TLOBJECT${DELEGATE}I)I"
private const val SET_USER_ID = "$MANAGER->setUserId(J)V"
private const val CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val CONFIG_INSTANCE = "$CONFIG->getInstance(I)$CONFIG"
private const val CURRENT_USER = "$CONFIG->getCurrentUser()Lorg/telegram/tgnet/TLRPC\$User;"
private const val SYNC_CONTACTS = "$CONFIG->syncContacts:Z"
private const val USER_IS_BOT = "Lorg/telegram/tgnet/TLRPC\$User;->bot:Z"
private const val BUILD_SETTINGS = "Lorg/telegram/messenger/BuildVars;"
private const val SUPER_INIT = "Ljava/lang/Object;-><init>()V"

/** FailOnServerErrors and WithoutLogin, the flags the phone screen sends its own requests with. */
private const val SIGN_IN_FLAGS = 10

/**
 * Everything the patch reads or writes, found and checked before any of it is edited: the phone
 * number screen's constructor and the index of its one return, the screen's login field, the login
 * screen's mode and contact sync fields, its sign-in ending and account getter, and the request send
 * the bot gate goes on.
 */
internal class BotSignInSites(
    val constructor: MutableMethod,
    val end: Int,
    val viewType: String,
    val loginType: String,
    val loginField: String,
    val modeField: String,
    val syncField: String,
    val ending: String,
    val account: String,
    val request: MutableClass,
    val superCall: Int,
    val gate: SendRequestGate,
)

@Suppress("unused")
val botTokenSignInPatch = bytecodePatch(
    name = "Bot token sign-in",
    description = "Adds a Sign in with a bot token button to the phone number screen, so an account can sign in " +
        "as a bot made with @BotFather. The bot sees a chat once someone messages it, without older history, " +
        "contacts or stickers. Starts off. Turn it on in HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveBotSignIn()
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertPhoneScreenHook(MutableMethod(ImmutableMethod.of(sites.constructor)), sites.end)
        val graft = requestGraft(sites)
        writeBotSignInStubs(sites)
        graftRequest(sites, graft)
        insertPhoneScreenHook(sites.constructor, sites.end)
        sites.gate.apply(BOT_SIGN_IN_DROP)
        enableStatus("botTokenSignIn")
    }
}

/**
 * The end of the phone number screen's constructor hands the screen to the extension, which adds
 * the bot token button while the switch is on and the screen signs in. Before the return, at its
 * label, so a branch onto the return runs the hook too.
 */
internal fun insertPhoneScreenHook(target: MutableMethod, end: Int) {
    target.addInstructionsAtControlFlowLabel(end, "invoke-static/range { p0 .. p0 }, $BOT_SIGN_IN_PHONE_SCREEN")
}

internal fun BytecodePatchContext.resolveBotSignIn(): BotSignInSites {
    requireStatusMethod(STATUS)
    controlHook(BOT_SIGN_IN, "phoneScreen", listOf(OBJECT), "V")
    controlHook(BOT_SIGN_IN, "drop", listOf(OBJECT, OBJECT, OBJECT), "Z")
    controlHook(BOT_SIGN_IN, "login", listOf(OBJECT), OBJECT)
    controlHook(BOT_SIGN_IN, "mode", listOf(OBJECT), "I")
    controlHook(BOT_SIGN_IN, "account", listOf(OBJECT), "I")
    controlHook(BOT_SIGN_IN, "requestDelegate", emptyList(), "Ljava/lang/Class;")
    controlHook(BOT_SIGN_IN, "sendRequest", listOf("I", OBJECT, OBJECT), "V")
    controlHook(BOT_SIGN_IN, "signedIn", listOf(OBJECT, OBJECT), "V")
    controlHook(BOT_SIGN_IN, "isBot", listOf("I"), "Z")

    // The phone number screen is the one view that labels a box DebugTestBackend after asking isTestBackend().
    val hosts = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.reference(DEBUG_TEST_BACKEND) and Mention.reference(IS_TEST_BACKEND)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (method in cls.methods) {
            val body = method.controlBody()
            if (body.any { it.controlRef() == DEBUG_TEST_BACKEND } && body.any { it.controlRef() == IS_TEST_BACKEND }) {
                hosts += cls.type to method
            }
        }
    }
    val (viewType, found) = hosts.controlSingle("the phone number screen")
    val view = tgMutableClassDefBy(viewType)
    val constructor = view.methods.single { it.signature() == found.signature() }
    val parameters = constructor.parameterTypes.map { it.toString() }
    controlShape(constructor.name == "<init>" && parameters.size == 2 && parameters[1] == CONTEXT && parameters[0].startsWith("L"),
        "the phone number screen is no longer built from its login screen and a context")
    val loginType = parameters[0]
    controlShape(AccessFlags.PUBLIC.isSet(view.accessFlags), "the phone number screen isn't reachable from the extension")
    val body = constructor.controlBody()

    // The view keeps its login screen in a field of its own, set from the constructor's first parameter.
    val loginFields = body.mapNotNull { instruction ->
        instruction.takeIf { it.opcode == Opcode.IPUT_OBJECT }?.controlField()
            ?.takeIf { it.definingClass == view.type && it.type == loginType }
    }.distinctBy { it.toString() }
    val loginField = loginFields.controlSingle("the phone number screen's login screen field")
    controlShape(view.fields.any { it.name == loginField.name && it.type == loginField.type && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }, "the phone number screen's login screen field isn't reachable")

    // Signing in is mode 0: the screen tests the login screen's mode against zero before its sign-in rows.
    val modeFields = body.indices.mapNotNull { index ->
        val read = body[index]
        val test = body.getOrNull(index + 1)
        val field = read.takeIf { it.opcode == Opcode.IGET }?.controlField()
        if (field == null || field.definingClass != loginType || field.type != "I" || test?.opcode != Opcode.IF_NEZ ||
            (test as OneRegisterInstruction).registerA != (read as TwoRegisterInstruction).registerA) null else field
    }.distinctBy { it.toString() }
    val modeField = modeFields.controlSingle("the login screen's mode")

    val login = tgMutableClassDefByOrNull(loginType)
    controlShape(login != null && AccessFlags.PUBLIC.isSet(login.accessFlags), "the login screen isn't reachable from the extension")
    controlShape(login!!.fields.any { it.name == modeField.name && it.type == "I" && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }, "the login screen's mode isn't reachable")

    // The sign-in ending every code, password and passkey sign-in reaches: it takes the authorization
    // and sets the account's user id.
    val endings = login.methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameterTypes.map { it.toString() } == listOf(TelegramNames.of(this).type(AUTHORIZATION), "Z") &&
            method.controlBody().any { it.controlRef() == SET_USER_ID }
    }
    val ending = endings.controlSingle("the login screen's sign-in ending")
    controlShape(AccessFlags.PUBLIC.isSet(ending.accessFlags) && !AccessFlags.ABSTRACT.isSet(ending.accessFlags),
        "the login screen's sign-in ending isn't reachable")
    val endingBody = ending.controlBody()
    val store = endingBody.indices.filter { endingBody[it].opcode == Opcode.IPUT_BOOLEAN && endingBody[it].controlRef() == SYNC_CONTACTS }
        .controlSingle("the sign-in ending's contact sync")
    val stored = (endingBody[store] as TwoRegisterInstruction).registerA
    val source = (store - 1 downTo 0).firstOrNull { index ->
        val instruction = endingBody[index]
        instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA == stored
    }
    val syncField = source?.let { endingBody[it] }?.takeIf { it.opcode == Opcode.IGET_BOOLEAN }?.controlField()
    controlShape(syncField != null && syncField.definingClass == loginType &&
        (endingBody[source!!] as TwoRegisterInstruction).registerB == ending.implementation!!.registerCount - 3 &&
        login.fields.any { it.name == syncField.name && it.type == "Z" && AccessFlags.PUBLIC.isSet(it.accessFlags) },
        "the sign-in ending no longer copies the login screen's contact sync choice")

    val account = accountGetter(loginType)

    val end = body.indices.filter { body[it].opcode == Opcode.RETURN_VOID }.controlSingle("the phone number screen's end")
    try {
        constructor.requireThisIntact("Bot token sign-in", listOf(end))
    } catch (spoiled: PatchException) {
        controlShape(false, "the phone number screen's constructor reuses its own register (${spoiled.message})")
    }

    // Telegram calls a request's callback through RequestDelegate's one method, and the extension answers
    // it with a Proxy that knows only that method.
    val delegate = tgMutableClassDefByOrNull(DELEGATE)
    controlShape(delegate != null && AccessFlags.PUBLIC.isSet(delegate.accessFlags) && AccessFlags.INTERFACE.isSet(delegate.accessFlags) &&
        delegate.methods.map { "${it.origName}${it.origDescriptor}" } == listOf(DELEGATE_ANSWER), "Telegram's request callback changed")
    for ((reference, static) in listOf(MANAGER_INSTANCE to true, MANAGER_SEND to false, CONFIG_INSTANCE to true,
        CURRENT_USER to false, USER_IS_BOT to false, READ_AUTHORIZATION to true)) {
        requireReachable(reference, static)
    }
    // The extension reads the app's API ID and hash at run time, the pair Telegram signs in with.
    controlMembers(BUILD_SETTINGS, "static APP_ID:I", "static APP_HASH:Ljava/lang/String;")
    val authorization = tgClassDefByOrNull(AUTHORIZATION)
    controlShape(authorization != null && authorization.superclass == TelegramNames.of(this).type(ANY_AUTHORIZATION) &&
        tgClassDefByOrNull(ANY_AUTHORIZATION)?.superclass == TelegramNames.of(this).type(TLOBJECT),
        "Telegram's sign-in answer is no longer a request answer")

    // The request is the extension's own class, made a TLObject here so Telegram can send it.
    val tl = tgClassDefByOrNull(TLOBJECT)
    controlShape(tl != null && AccessFlags.PUBLIC.isSet(tl.accessFlags) && !AccessFlags.FINAL.isSet(tl.accessFlags) &&
        !AccessFlags.ABSTRACT.isSet(tl.accessFlags) && !AccessFlags.INTERFACE.isSet(tl.accessFlags) &&
        tl.methods.none { AccessFlags.ABSTRACT.isSet(it.accessFlags) }, "Telegram's request base class changed")
    controlMembers(TLOBJECT, "<init>()V", "serializeToStream($OUTPUT_DATA)V", "deserializeResponse(${INPUT_DATA}IZ)$TLOBJECT")
    val output = tgClassDefByOrNull(OUTPUT_DATA)
    controlShape(output != null && AccessFlags.PUBLIC.isSet(output.accessFlags) && AccessFlags.INTERFACE.isSet(output.accessFlags) &&
        listOf("writeInt32(I)V", "writeString(Ljava/lang/String;)V").all { wanted ->
            output.methods.any { "${it.origName}${it.origDescriptor}" == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        }, "Telegram's request writer changed")
    val request = tgMutableClassDefByOrNull(BOT_TOKEN_REQUEST)
    controlShape(request != null && request.superclass == OBJECT && AccessFlags.PUBLIC.isSet(request.accessFlags) &&
        request.methods.none { it.name == "serializeToStream" || it.name == "deserializeResponse" } &&
        request.methods.any { it.name == "write" && it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) &&
            it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) }, "the bot token request changed")
    val requestInit = request!!.methods.filter { it.name == "<init>" }.controlSingle("the bot token request's constructor")
    controlShape(requestInit.parameterTypes.map(CharSequence::toString) == listOf("I", "Ljava/lang/String;", "Ljava/lang/String;"),
        "the bot token request's constructor changed")
    val initBody = requestInit.controlBody()
    val superCall = initBody.indices.filter { initBody[it].opcode == Opcode.INVOKE_DIRECT && initBody[it].controlRef() == SUPER_INIT }
        .controlSingle("the bot token request's super call")

    val gate = resolveSendRequestGate(BOT_SIGN_IN_DROP)
    controlShape(gate.missing == null, "a bot account's requests can't be answered: ${gate.missing}")
    return BotSignInSites(constructor, end, view.origType, login.origType, loginField.origString(), modeField.origString(),
        syncField!!.origString(), ending.origString(), account, request, superCall, gate)
}

private fun Method.signature() = name + parameterTypes.joinToString("", "(", ")") + returnType

/** The login screen's public getCurrentAccount(), from the screen or the fragment class it extends. */
private fun BytecodePatchContext.accountGetter(loginType: String): String {
    var type: String? = loginType
    val seen = mutableSetOf<String>()
    while (type != null && seen.add(type)) {
        val owner = classDefByOrNull(type) ?: break
        val getter = owner.methods.filter { it.origName == "getCurrentAccount" && it.parameterTypes.isEmpty() && it.returnType == "I" }
        if (getter.isNotEmpty()) {
            val found = getter.controlSingle("the login screen's account getter")
            controlShape(AccessFlags.PUBLIC.isSet(owner.accessFlags) && AccessFlags.PUBLIC.isSet(found.accessFlags) &&
                !AccessFlags.STATIC.isSet(found.accessFlags), "the login screen's account getter isn't reachable")
            return found.origString()
        }
        type = owner.superclass
    }
    controlShape(false, "the login screen has no account getter")
    throw IllegalStateException()
}

/** serializeToStream and deserializeResponse for the bot token request, built and checked off the class. */
internal class RequestGraft(val serialize: MutableMethod, val deserialize: MutableMethod)

private fun BytecodePatchContext.requestGraft(sites: BotSignInSites): RequestGraft {
    val names = TelegramNames.of(this)
    val type = sites.request.type
    fun method(name: String, parameters: List<String>, result: String, registers: Int, smali: String): MutableMethod {
        val method = ImmutableMethod(type, name, parameters.map { ImmutableMethodParameter(names.type(it), null, null) }, names.type(result),
            AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(registers)).toMutable()
        method.addInstructions(0, smali)
        val refusals = try {
            refusedByVerifier(method, { tgClassDefByOrNull(it)?.superclass }, { tgClassDefByOrNull(it)?.let { found -> AccessFlags.INTERFACE.isSet(found.accessFlags) } })
        } catch (unreadable: IllegalArgumentException) {
            listOf("its body can't be checked: ${unreadable.message}")
        }
        controlShape(refusals.isEmpty(), "the bot token request's $name would fail Android's verifier: ${refusals.joinToString("; ")}")
        return method
    }
    // Telegram writes a request out through serializeToStream, and reads the answer through the
    // request's deserializeResponse: auth.importBotAuthorization answers with an auth.Authorization.
    val serialize = method("serializeToStream", listOf(OUTPUT_DATA), "V", 2, """
        invoke-virtual { p0, p1 }, $BOT_TOKEN_REQUEST->write(Ljava/lang/Object;)V
        return-void
    """)
    val deserialize = method("deserializeResponse", listOf(INPUT_DATA, "I", "Z"), TLOBJECT, 5, """
        invoke-static { p1, p2, p3 }, $READ_AUTHORIZATION
        move-result-object v0
        return-object v0
    """)
    return RequestGraft(serialize, deserialize)
}

private fun BytecodePatchContext.graftRequest(sites: BotSignInSites, graft: RequestGraft) {
    val request = sites.request
    val init = request.methods.single { it.name == "<init>" }
    val self = (init.controlBody()[sites.superCall] as FiveRegisterInstruction).registerC
    request.setSuperClass(TelegramNames.of(this).type(TLOBJECT))
    init.replaceInstruction(sites.superCall, "invoke-direct/range { v$self .. v$self }, $TLOBJECT-><init>()V")
    request.methods.add(graft.serialize)
    request.methods.add(graft.deserialize)
}

/** The stubs the extension calls, each a few instructions on the classes found for this build. */
private fun BytecodePatchContext.writeBotSignInStubs(sites: BotSignInSites) {
    writeStub(BOT_SIGN_IN, "login", 2, """
        check-cast p0, ${sites.viewType}
        iget-object v0, p0, ${sites.loginField}
        return-object v0
    """)
    writeStub(BOT_SIGN_IN, "mode", 2, """
        check-cast p0, ${sites.loginType}
        iget v0, p0, ${sites.modeField}
        return v0
    """)
    writeStub(BOT_SIGN_IN, "account", 2, """
        check-cast p0, ${sites.loginType}
        invoke-virtual { p0 }, ${sites.account}
        move-result v0
        return v0
    """)
    writeStub(BOT_SIGN_IN, "requestDelegate", 1, """
        const-class v0, $DELEGATE
        return-object v0
    """)
    writeStub(BOT_SIGN_IN, "sendRequest", 5, """
        invoke-static { p0 }, $MANAGER_INSTANCE
        move-result-object v0
        check-cast p1, $TLOBJECT
        check-cast p2, $DELEGATE
        const/16 v1, $SIGN_IN_FLAGS
        invoke-virtual { v0, p1, p2, v1 }, $MANAGER_SEND
        return-void
    """)
    // A bot has no contacts to sync, so the account starts with sync off, then signs in the way a code does.
    writeStub(BOT_SIGN_IN, "signedIn", 3, """
        check-cast p0, ${sites.loginType}
        const/4 v0, 0x0
        iput-boolean v0, p0, ${sites.syncField}
        check-cast p1, $AUTHORIZATION
        invoke-virtual { p0, p1, v0 }, ${sites.ending}
        return-void
    """)
    writeStub(BOT_SIGN_IN, "isBot", 2, """
        invoke-static { p0 }, $CONFIG_INSTANCE
        move-result-object v0
        invoke-virtual { v0 }, $CURRENT_USER
        move-result-object v0
        if-eqz v0, :not_signed_in
        iget-boolean v0, v0, $USER_IS_BOT
        return v0
        :not_signed_in
        const/4 v0, 0x0
        return v0
    """)
}
