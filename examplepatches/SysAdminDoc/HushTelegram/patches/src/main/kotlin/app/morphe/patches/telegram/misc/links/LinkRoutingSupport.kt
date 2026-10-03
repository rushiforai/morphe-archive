/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.links

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

/** Android 11+ filters browser queries unless the host declares the intents it resolves. */
internal val browserVisibilityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val existing = document.getElementsByTagName("queries")
            checkShape(existing.length <= 1 && (existing.length == 0 || existing.item(0).parentNode == root),
                "ambiguous package-visibility declarations")
            val queries = existing.item(0) as? Element ?: document.createElement("queries").also(root::appendChild)
            for (scheme in listOf("http", "https")) {
                val intents = queries.getElementsByTagName("intent")
                val declared = (0 until intents.length).map { intents.item(it) as Element }.any { intent ->
                    val actions = intent.getElementsByTagName("action")
                    val categories = intent.getElementsByTagName("category")
                    val data = intent.getElementsByTagName("data")
                    (0 until actions.length).any { (actions.item(it) as Element).getAttribute("android:name") == "android.intent.action.VIEW" } &&
                        (0 until categories.length).any { (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.BROWSABLE" } &&
                        (0 until data.length).any {
                            val entry = data.item(it) as Element
                            entry.getAttribute("android:scheme") == scheme && !entry.hasAttribute("android:host")
                        }
                }
                if (!declared) queries.appendChild(document.createElement("intent").apply {
                    appendChild(document.createElement("action").apply { setAttribute("android:name", "android.intent.action.VIEW") })
                    appendChild(document.createElement("category").apply { setAttribute("android:name", "android.intent.category.BROWSABLE") })
                    appendChild(document.createElement("data").apply { setAttribute("android:scheme", scheme) })
                })
            }
        }
    }
}

internal const val LINKS = "$EXTENSION_PACKAGE/misc/LinkRouting;"
internal const val CONTEXT = "Landroid/content/Context;"
internal const val URI = "Landroid/net/Uri;"
private const val URI_BUILDER = "Landroid/net/Uri\$Builder;"
internal const val INTENT = "Landroid/content/Intent;"
private const val MC = "Lorg/telegram/messenger/MessagesController;"
private const val UC = "Lorg/telegram/messenger/UserConfig;"
private const val TITLE = "Lorg/telegram/messenger/R\$string;->ShareLink:I"
private const val CHOOSER = "$INTENT->createChooser($INTENT" + "Ljava/lang/CharSequence;)$INTENT"
private const val TEXT_EXTRA = "$INTENT->putExtra(Ljava/lang/String;Ljava/lang/String;)$INTENT"

internal data class ShareSite(val method: MutableMethod, val index: Int, val register: Int)
internal data class LinkPlan(
    val browser: MutableMethod, val classifier: MethodReference,
    val cleanIndex: Int, val cleanCode: String, val routingIndex: Int, val routingCode: String,
    val shares: List<ShareSite>,
)

/** Every host shape and extension signature is checked before either patch writes bytecode. */
internal fun BytecodePatchContext.resolveLinkHooks(): LinkPlan {
    val classes = linkedMapOf<String, ClassDef>()
    classDefForEach { if (!it.type.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single { it.same(method) }
    val candidates = classes.values.flatMap { it.methods.toList() }.filter { method ->
        val parameters = method.parameterTypes.map { it.toString() }
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && parameters.size == 10 &&
            parameters.take(5) == listOf(CONTEXT, URI, "Z", "Z", "Z") && parameters[5].startsWith("L") &&
            parameters.drop(6) == listOf("Ljava/lang/String;", "Z", "Z", "Z") &&
            listOf("autologin_token", "android.support.customtabs.extra.SESSION", "android.intent.action.VIEW")
                .all { anchor -> method.instructions().any { it.string() == anchor } } &&
            method.instructions().any { it.ref() == "$MC->isWebBrowserOpenInApp(Ljava/lang/String;)Z" }
    }
    checkShape(candidates.size == 1, "expected one structurally anchored HTTP browser dispatcher, found ${candidates.size}")
    val browser = mutable(candidates.single())
    val code = browser.instructions()
    val classification = code.indices.singleOrNull { index -> code[index].call()?.let {
        it.definingClass == browser.definingClass && it.parameterTypes.map(CharSequence::toString) == listOf(URI, "Z", "[Z") && it.returnType == "Z"
    } == true } ?: fail("no unique native (Uri,boolean,boolean[]) classifier")
    val classifier = code[classification].call()!!
    val classifierBody = classes[classifier.definingClass]?.methods?.singleOrNull { it.same(classifier) }
    checkShape(classifierBody != null && AccessFlags.PUBLIC.isSet(classes.getValue(classifier.definingClass).accessFlags) &&
        AccessFlags.PUBLIC.isSet(classifierBody.accessFlags) &&
        AccessFlags.STATIC.isSet(classifierBody.accessFlags) && classifierBody.instructions().any { it.ref() == "$MC->authDomains:Ljava/util/Set;" },
        "native classifier isn't public static with the kept auth-domain check")
    checkShape(code[classification].opcode == Opcode.INVOKE_STATIC && code[classification + 1].opcode == Opcode.MOVE_RESULT,
        "native classification has no adjacent result")
    val operands = code[classification].namedRegisters()
    val uriAlias = operands[0]
    val flags = operands[2]
    val internal = code[classification + 1].namedRegisters().single()
    checkShape(listOf(uriAlias, flags, internal).all { it <= 15 }, "classification operands exceed invoke registers")
    val cleanAt = classification + 2
    val uriParameter = browser.parameterRegisterNumber(1)
    browser.requireParameterIntact("link URI", 1, listOf(classification))
    checkShape(reachingWrites(browser, uriAlias, classification).singleOrNull()?.let { index ->
        code[index].opcode in OBJECT_MOVES && code[index].namedRegisters() == listOf(uriAlias, uriParameter)
    } == true, "classified URI isn't the original Uri parameter")

    val append = code.indices.singleOrNull { code[it].ref() == "$URI_BUILDER->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)$URI_BUILDER" &&
        code.subList(maxOf(0, it - 2), it).any { instruction -> instruction.string() == "autologin_token" } }
        ?: fail("autologin augmentation no longer has its unique builder call")
    checkShape(code[append + 2].ref() == "$URI_BUILDER->build()$URI" && code[append + 3].opcode == Opcode.MOVE_RESULT_OBJECT &&
        code[append + 4].opcode in GOTOS, "autologin builder has no guarded merge")
    var routingAt = ControlFlow.of(browser).normal[append + 4].single()
    // The other independently selectable patch may already have moved the merge label to its hook.
    if (code.getOrNull(routingAt + 1)?.ref() == "$LINKS->tryOpenExternal($CONTEXT$URI" + "Z[ZLjava/lang/String;)Z") routingAt += 6
    val routingUri = code[append + 3].namedRegisters().single()
    checkShape(routingAt > classification && code[routingAt].opcode == Opcode.IF_EQZ && routingUri <= 15,
        "browser-choice merge changed")
    checkShape(reachingWrites(browser, internal, routingAt) == setOf(classification + 1), "native classification was overwritten")
    val flagsWrite = reachingWrites(browser, flags, classification).singleOrNull() ?: fail("native flag array isn't uniquely initialized")
    checkShape(code[flagsWrite].opcode == Opcode.NEW_ARRAY && code[flagsWrite].ref() == "[Z" &&
        reachingWrites(browser, flags, routingAt) == setOf(flagsWrite), "native routing flags were overwritten")
    checkShape(reachingWrites(browser, code[flagsWrite].namedRegisters()[1], flagsWrite).all {
        (code[it] as? NarrowLiteralInstruction)?.narrowLiteral == 1
    } && reachingWrites(browser, operands[1], classification).all {
        (code[it] as? NarrowLiteralInstruction)?.narrowLiteral == 0
    }, "native classifier doesn't receive a one-element array and its stock false argument")
    val external = code.indices.singleOrNull { code[it].call()?.let { call ->
        call.definingClass == browser.definingClass && call.parameterTypes.map(CharSequence::toString) ==
            listOf(CONTEXT, "Ljava/lang/String;", "Z", "Ljava/lang/String;") && call.returnType == "Z"
    } == true } ?: fail("no unique stock external-browser helper")
    val externalArgs = code[external].namedRegisters()
    val context = externalArgs[0]
    val packageArgument = externalArgs[3]
    checkShape(context <= 15 && code[external - 1].opcode in OBJECT_MOVES &&
        code[external - 1].namedRegisters()[0] == packageArgument, "stock browser package is no longer copied to its helper")
    val chosenPackage = code[external - 1].namedRegisters()[1]
    checkShape(reachingWrites(browser, context, routingAt).singleOrNull()?.let { index ->
        code[index].opcode in OBJECT_MOVES && code[index].namedRegisters() == listOf(context, browser.parameterRegisterNumber(0))
    } == true, "browser context alias changed")
    val scratch = browser.freeLocalsAt("external browser", routingAt, 1).single()
    val routingCode = """
        move-object/from16 v$scratch, v$chosenPackage
        invoke-static {v$context, v$routingUri, v$internal, v$flags, v$scratch}, $LINKS->tryOpenExternal($CONTEXT$URI""" + "Z[ZLjava/lang/String;)Z\n" + """
        move-result v$scratch
        if-eqz v$scratch, :hush_stock_browser
        return-void
        :hush_stock_browser
        nop
    """
    val cleanCode = "invoke-static {v$uriAlias, v$internal, v$flags}, $LINKS->cleanOpenedUri($URI" +
        "Z[Z)$URI\nmove-result-object v$uriAlias\nmove-object/16 v$uriParameter, v$uriAlias\nnop"

    val shares = classes.values.flatMap { it.methods.toList() }.filter { method ->
        method.instructions().any { it.ref() == TITLE } && method.instructions().any { it.string() == "android.intent.action.SEND" }
    }.flatMap { method ->
        val body = method.instructions()
        body.indices.filter { body[it].ref() == TITLE }.map { title ->
            val chooser = (title + 1..minOf(title + 8, body.lastIndex)).firstOrNull { body[it].ref() == CHOOSER }
                ?: fail("Share Link has no nearby external chooser in ${method.definingClass}->${method.name}")
            val register = body[chooser].namedRegisters().first()
            val text = (maxOf(0, title - 15) until title).lastOrNull { body[it].ref() == TEXT_EXTRA && body[it].namedRegisters().first() == register }
                ?: fail("Share Link chooser isn't fed by a String EXTRA_TEXT")
            val textKey = body[text].namedRegisters()[1]
            checkShape(reachingWrites(method, textKey, text).all { body[it].string() == "android.intent.extra.TEXT" }, "share text key changed")
            val type = (maxOf(0, text - 15) until text).lastOrNull { body[it].ref() == "$INTENT->setType(Ljava/lang/String;)$INTENT" &&
                body[it].namedRegisters().first() == register } ?: fail("share has no distinct text/plain type")
            checkShape(reachingWrites(method, body[type].namedRegisters()[1], type).all { body[it].string() == "text/plain" }, "share MIME type changed")
            val constructor = (maxOf(0, type - 8) until type).lastOrNull { body[it].ref() == "$INTENT-><init>(Ljava/lang/String;)V" &&
                body[it].namedRegisters().first() == register } ?: fail("share doesn't construct a fresh SEND intent")
            checkShape(reachingWrites(method, body[constructor].namedRegisters()[1], constructor).all { body[it].string() == "android.intent.action.SEND" },
                "share constructor isn't ACTION_SEND on every path")
            checkShape(reachingWrites(method, register, constructor).all { body[it].opcode == Opcode.NEW_INSTANCE && body[it].ref() == INTENT }, "share receiver isn't a fresh Intent")
            checkShape(register <= 15 && body[chooser].opcode == Opcode.INVOKE_STATIC && body[chooser + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                body.drop(chooser + 2).take(7).any { it.ref() == "$CONTEXT->startActivity($INTENT)V" }, "share chooser isn't an external Context launch")
            ShareSite(mutable(method), chooser, register)
        }
    }
    checkShape(shares.any { it.method.definingClass == "Lorg/telegram/messenger/ShareBroadcastReceiver;" && it.method.name == "onReceive" &&
        it.method.parameterTypes == listOf(CONTEXT, INTENT) }, "the kept Share Link broadcast receiver has no verified outgoing chooser")
    return LinkPlan(browser, classifier, cleanAt, cleanCode, routingAt, routingCode, shares)
}

internal fun BytecodePatchContext.requireRuntime(name: String, parameters: List<String>, result: String) {
    val owner = mutableClassDefBy(LINKS)
    // A static method's frame has to hold its parameters, and a body of only payloads never runs.
    val parameterWords = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    checkShape(AccessFlags.PUBLIC.isSet(owner.accessFlags) && owner.methods.count {
        it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.implementation?.let { body -> body.registerCount >= parameterWords &&
                body.instructions.any { instruction -> !instruction.opcode.format.isPayloadFormat } } == true
    } == 1, "no callable public static runtime $name with the expected signature")
}

internal fun BytecodePatchContext.writeProtection(plan: LinkPlan) {
    val stub = mutableClassDefBy(LINKS).methods.singleOrNull { it.name == "protectedByTelegram" &&
        it.parameterTypes == listOf(URI) && it.returnType == "Z" && AccessFlags.STATIC.isSet(it.accessFlags) }
    checkShape(stub != null, "no native-protection stub")
    for ((owner, name, type) in listOf(Triple(MC, "authDomains", "Ljava/util/Set;"),
        Triple(MC, "autologinDomains", "Ljava/util/Set;"), Triple(UC, "selectedAccount", "I"))) {
        val field = classDefByOrNull(owner)?.fields?.singleOrNull { it.name == name && it.type == type }
        checkShape(field != null && AccessFlags.PUBLIC.isSet(field.accessFlags) &&
            AccessFlags.STATIC.isSet(field.accessFlags) == (owner == UC), "kept protection field $owner->$name is inaccessible")
    }
    val getter = classDefByOrNull(MC)?.methods?.singleOrNull { it.name == "getInstance" && it.parameterTypes == listOf("I") && it.returnType == MC }
    checkShape(getter != null && AccessFlags.PUBLIC.isSet(getter.accessFlags) && AccessFlags.STATIC.isSet(getter.accessFlags), "account controller getter changed")
    writeStub(LINKS, "protectedByTelegram", 7, """
        const/4 v0, 0x1
        new-array v1, v0, [Z
        const/4 v2, 0x0
        invoke-static {p0, v2, v1}, ${plan.classifier}
        move-result v0
        if-nez v0, :hush_protected
        aget-boolean v0, v1, v2
        if-nez v0, :hush_protected
        invoke-virtual {p0}, $URI->getHost()Ljava/lang/String;
        move-result-object v3
        if-eqz v3, :hush_protected
        sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v3
        sget v4, $UC->selectedAccount:I
        invoke-static {v4}, $MC->getInstance(I)$MC
        move-result-object v4
        iget-object v5, v4, $MC->authDomains:Ljava/util/Set;
        invoke-interface {v5, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
        move-result v0
        if-nez v0, :hush_protected
        iget-object v5, v4, $MC->autologinDomains:Ljava/util/Set;
        invoke-interface {v5, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
        move-result v0
        return v0
        :hush_protected
        const/4 v0, 0x1
        return v0
    """)
}

/** Definitions reaching a read, including branch and handler predecessors, before a write kills them. */
private fun reachingWrites(method: Method, register: Int, at: Int): Set<Int> {
    val flow = ControlFlow.of(method)
    val predecessors = Array(flow.instructions.size) { mutableSetOf<Int>() }
    for (index in flow.instructions.indices) for (next in flow.normal[index] + flow.exceptional[index]) predecessors[next] += index
    val pending = ArrayDeque<Int>()
    pending.addAll(predecessors[at])
    val visited = mutableSetOf<Int>()
    val writes = mutableSetOf<Int>()
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (!visited.add(index)) continue
        val instruction = flow.instructions[index]
        if (instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA == register) writes += index
        else pending.addAll(predecessors[index])
    }
    checkShape(writes.isNotEmpty(), "v$register has no provable definition before instruction $at")
    return writes
}

private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Method.same(other: MethodReference) = name == other.name && parameterTypes == other.parameterTypes && returnType == other.returnType
internal fun checkShape(ok: Boolean, reason: String) { if (!ok) fail(reason) }
private fun fail(reason: String): Nothing = throw PatchException("Link routing: $reason")
