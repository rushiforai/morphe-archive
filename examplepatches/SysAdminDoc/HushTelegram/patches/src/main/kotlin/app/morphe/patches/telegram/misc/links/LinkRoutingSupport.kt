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
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.call
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
import java.util.BitSet
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

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
    classDefForEach { if (!it.origType.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    fun mutable(method: Method) = tgMutableClassDefBy(method.definingClass).methods.single { it.same(method) }
    // Each search reads only the methods of classes that might mention its anchors, in the app's
    // order, and checks them in full.
    fun methods(mentioning: Mention) = classDefsMentioning(mentioning).mapNotNull { classes[it.type] }.flatMap { it.methods.toList() }
    val anchors = listOf("autologin_token", "android.support.customtabs.extra.SESSION", "android.intent.action.VIEW")
    val candidates = methods(Mention.allOf(anchors.map { Mention.string(it) }) and
        Mention.reference("$MC->isWebBrowserOpenInApp(Ljava/lang/String;)Z")).filter { method ->
        val parameters = method.parameterTypes.map { it.toString() }
        // 13.2 added a fourth trailing flag, which skips its own cleanup of the link's query.
        AccessFlags.STATIC.isSet(method.accessFlags) && method.origReturnType == "V" && parameters.size in 10..11 &&
            parameters.take(5) == listOf(CONTEXT, URI, "Z", "Z", "Z") && parameters[5].startsWith("L") &&
            parameters.drop(6) == listOf("Ljava/lang/String;") + List(parameters.size - 7) { "Z" } &&
            anchors.all { anchor -> method.instructions().any { it.string() == anchor } } &&
            method.instructions().any { it.ref() == "$MC->isWebBrowserOpenInApp(Ljava/lang/String;)Z" }
    }
    checkShape(candidates.size == 1, "expected one structurally anchored HTTP browser dispatcher, found ${candidates.size}")
    val browser = mutable(candidates.single())
    val code = browser.instructions()
    val classification = code.indices.singleOrNull { index -> code[index].call()?.let {
        it.origDefiningClass == browser.origDefiningClass && it.parameterTypes.map(CharSequence::toString) == listOf(URI, "Z", "[Z") && it.origReturnType == "Z"
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
    checkShape(listOf(uriAlias, flags).all { it <= 15 }, "classification operands exceed invoke registers")
    // 13.2 keeps the classification's answer above v15, out of an invoke's reach, so each hook copies
    // it into a free local first.
    val carried = internal > 15
    val cleanAt = classification + 2
    val uriParameter = browser.parameterRegisterNumber(1)
    browser.requireParameterIntact("link URI", 1, listOf(classification))
    checkShape(holdsLinkUri(browser, uriAlias, classification, uriParameter), "classified URI isn't the original Uri parameter")

    val append = autologinAppend(code) ?: fail("autologin augmentation no longer has its unique builder call")
    val built = code[append + 3].namedRegisters().singleOrNull()
    // 13.2 copies the signed-in link back to the link's own register and falls through to the merge.
    val copied = code[append + 4].opcode in OBJECT_MOVES && code[append + 4].namedRegisters()[1] == built
    checkShape(code[append + 2].ref() == "$URI_BUILDER->build()$URI" && code[append + 3].opcode == Opcode.MOVE_RESULT_OBJECT &&
        (code[append + 4].opcode in GOTOS || copied), "autologin builder has no guarded merge")
    var routingAt = ControlFlow.of(browser).normal[append + 4].single()
    // Web 13.2.0 jumps from that copy to the merge rather than falling through to it.
    if (copied && code[routingAt].opcode in GOTOS) routingAt = ControlFlow.of(browser).normal[routingAt].single()
    // The other independently selectable patch may already have moved the merge label to its hook.
    val routingLength = if (carried) 7 else 6
    if (code.getOrNull(routingAt + routingLength - 5)?.ref() == "$LINKS->tryOpenExternal($CONTEXT$URI" + "Z[ZLjava/lang/String;)Z") {
        routingAt += routingLength
    }
    val routingUri = if (copied) code[append + 4].namedRegisters()[0] else built!!
    checkShape(routingAt > classification && code[routingAt].opcode == Opcode.IF_EQZ && routingUri <= 15,
        "browser-choice merge changed")
    checkShape(reachingWrites(browser, internal, routingAt) == setOf(classification + 1), "native classification was overwritten")
    val flagsWrite = reachingWrites(browser, flags, classification).singleOrNull() ?: fail("native flag array isn't uniquely initialized")
    // The array reaches the merge in its own register, or (web 13.2.0) in the one copy of it made on
    // every path before its register is reused.
    val routingFlags = (listOf(flags) + code.indices.filter { code[it].opcode in OBJECT_MOVES && code[it].namedRegisters()[1] == flags }
        .map { code[it].namedRegisters()[0] }).distinct().filter { register ->
        reachingWrites(browser, register, routingAt, required = false).let { writes ->
            writes.isNotEmpty() && writes.all { write ->
                if (register == flags) write == flagsWrite
                else code[write].opcode in OBJECT_MOVES && code[write].namedRegisters() == listOf(register, flags) &&
                    reachingWrites(browser, flags, write) == setOf(flagsWrite)
            }
        }
    }.singleOrNull() ?: fail("native routing flags were overwritten")
    checkShape(code[flagsWrite].opcode == Opcode.NEW_ARRAY && code[flagsWrite].ref() == "[Z" && routingFlags <= 15,
        "native routing flags were overwritten")
    checkShape(reachingWrites(browser, code[flagsWrite].namedRegisters()[1], flagsWrite).all {
        (code[it] as? NarrowLiteralInstruction)?.narrowLiteral == 1
    } && reachingWrites(browser, operands[1], classification).all {
        (code[it] as? NarrowLiteralInstruction)?.narrowLiteral == 0
    }, "native classifier doesn't receive a one-element array and its stock false argument")
    val external = code.indices.singleOrNull { code[it].call()?.let { call ->
        call.origDefiningClass == browser.origDefiningClass && call.parameterTypes.map(CharSequence::toString) ==
            listOf(CONTEXT, "Ljava/lang/String;", "Z", "Ljava/lang/String;") && call.origReturnType == "Z"
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
    val routingLocals = browser.freeLocalsAt("external browser", routingAt, if (carried) 2 else 1)
    val scratch = routingLocals[0]
    val routingInternal = if (carried) routingLocals[1] else internal
    val routingCode = (if (carried) "move/from16 v$routingInternal, v$internal\n" else "") + """
        move-object/from16 v$scratch, v$chosenPackage
        invoke-static {v$context, v$routingUri, v$routingInternal, v$routingFlags, v$scratch}, $LINKS->tryOpenExternal($CONTEXT$URI""" + "Z[ZLjava/lang/String;)Z\n" + """
        move-result v$scratch
        if-eqz v$scratch, :hush_stock_browser
        return-void
        :hush_stock_browser
        nop
    """
    val cleanInternal = if (carried) browser.freeLocalsAt("opened-link cleaner", cleanAt, 1).single() else internal
    val cleanCode = (if (carried) "move/from16 v$cleanInternal, v$internal\n" else "") +
        "invoke-static {v$uriAlias, v$cleanInternal, v$flags}, $LINKS->cleanOpenedUri($URI" +
        "Z[Z)$URI\nmove-result-object v$uriAlias\nmove-object/16 v$uriParameter, v$uriAlias\nnop"

    val shares = methods(Mention.reference(TITLE) and Mention.string("android.intent.action.SEND")).filter { method ->
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
    checkShape(shares.any { it.method.origDefiningClass == "Lorg/telegram/messenger/ShareBroadcastReceiver;" && it.method.origName == "onReceive" &&
        it.method.origParameterTypes == listOf(CONTEXT, INTENT) }, "the kept Share Link broadcast receiver has no verified outgoing chooser")
    return LinkPlan(browser, classifier, cleanAt, cleanCode, routingAt, routingCode, shares)
}

/** The autologin domain check's answer at [index], where [code] hands it to the switch first. */
internal data class AutologinGate(val index: Int, val code: String)

/**
 * Telegram's dispatcher adds the account's sign-in token only when the link's host is on the
 * server's autologin list: it reads autologinDomains, asks the set, and skips the append when the
 * answer is false. The switch sits on that answer, so a token left off takes Telegram's own way for
 * an unlisted site, rejoining routing exactly where the append would have.
 */
internal fun resolveAutologinGate(plan: LinkPlan): AutologinGate {
    val browser = plan.browser
    val code = browser.instructions()
    val domains = code.indices.singleOrNull { code[it].opcode == Opcode.IGET_OBJECT && code[it].ref() == "$MC->autologinDomains:Ljava/util/Set;" }
        ?: fail("autologin domain check isn't unique")
    val set = code[domains].namedRegisters()[0]
    val contains = code.getOrNull(domains + 1) ?: fail("autologin domain check no longer asks the set")
    checkShape(contains.opcode == Opcode.INVOKE_INTERFACE && contains.ref() == "Ljava/util/Set;->contains(Ljava/lang/Object;)Z" &&
        contains.namedRegisters().firstOrNull() == set, "autologin domain check no longer asks the set")
    val answer = code.getOrNull(domains + 2)?.takeIf { it.opcode == Opcode.MOVE_RESULT }?.namedRegisters()?.single()
        ?: fail("autologin domain check has no adjacent answer")
    val gate = domains + 3
    checkShape(gate > plan.cleanIndex && code.getOrNull(gate)?.opcode == Opcode.IF_EQZ && code[gate].namedRegisters().single() == answer,
        "autologin domain answer no longer decides the token")
    val flow = ControlFlow.of(browser)
    val skip = flow.normal[gate].filter { it != gate + 1 }.singleOrNull() ?: fail("autologin skip has no single target")
    val append = autologinAppend(code) ?: fail("autologin augmentation no longer has its unique builder call")
    // 13.2 copies the signed-in link back first, and web 13.2.0 then jumps to where the skip lands.
    var rejoin = flow.normal.getOrNull(append + 4)?.singleOrNull()
    if (rejoin != null && code[append + 4].opcode in OBJECT_MOVES && code[rejoin].opcode in GOTOS) rejoin = flow.normal[rejoin].singleOrNull()
    checkShape(append > gate && rejoin == skip, "autologin token doesn't rejoin where it's skipped")
    val reads = code.indices.filter { code[it].ref() == "$MC->autologinToken:Ljava/lang/String;" }
    checkShape(reads.size == 1 && reads.single() in gate + 1 until append, "autologin token is read outside its branch")
    // Nothing reaches the append, or the token read, without passing the check.
    val seen = BitSet()
    val pending = ArrayDeque(listOf(0))
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (index == gate || seen[index]) continue
        seen.set(index)
        pending += flow.normal[index]
        pending += flow.exceptional[index]
    }
    checkShape(!seen[append] && !seen[reads.single()], "autologin token is added without the domain check")
    return AutologinGate(gate, "invoke-static/range {v$answer .. v$answer}, $LINKS->addAutologinToken(Z)Z\nmove-result v$answer")
}

private fun autologinAppend(code: List<Instruction>): Int? = code.indices.singleOrNull {
    code[it].ref() == "$URI_BUILDER->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)$URI_BUILDER" &&
        code.subList(maxOf(0, it - 2), it).any { instruction -> instruction.string() == "autologin_token" }
}

internal fun BytecodePatchContext.requireRuntime(name: String, parameters: List<String>, result: String) {
    val owner = tgMutableClassDefBy(LINKS)
    // A static method's frame has to hold its parameters, and a body of only payloads never runs.
    val parameterWords = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    checkShape(AccessFlags.PUBLIC.isSet(owner.accessFlags) && owner.methods.count {
        it.origName == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.origReturnType == result &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.implementation?.let { body -> body.registerCount >= parameterWords &&
                body.instructions.any { instruction -> !instruction.opcode.format.isPayloadFormat } } == true
    } == 1, "no callable public static runtime $name with the expected signature")
}

internal fun BytecodePatchContext.writeProtection(plan: LinkPlan) {
    val stub = tgMutableClassDefBy(LINKS).methods.singleOrNull { it.origName == "protectedByTelegram" &&
        it.origParameterTypes == listOf(URI) && it.origReturnType == "Z" && AccessFlags.STATIC.isSet(it.accessFlags) }
    checkShape(stub != null, "no native-protection stub")
    for ((owner, name, type) in listOf(Triple(MC, "authDomains", "Ljava/util/Set;"),
        Triple(MC, "autologinDomains", "Ljava/util/Set;"), Triple(UC, "selectedAccount", "I"))) {
        val field = tgClassDefByOrNull(owner)?.fields?.singleOrNull { it.origName == name && it.origType == type }
        checkShape(field != null && AccessFlags.PUBLIC.isSet(field.accessFlags) &&
            AccessFlags.STATIC.isSet(field.accessFlags) == (owner == UC), "kept protection field $owner->$name is inaccessible")
    }
    val getter = tgClassDefByOrNull(MC)?.methods?.singleOrNull { it.origName == "getInstance" && it.origParameterTypes == listOf("I") && it.origReturnType == MC }
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

/**
 * Definitions reaching a read, including branch and handler predecessors, before a write kills them.
 * Unless [required], a register nothing defines answers no definitions rather than refusing.
 */
private fun reachingWrites(method: Method, register: Int, at: Int, required: Boolean = true): Set<Int> {
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
    checkShape(!required || writes.isNotEmpty(), "v$register has no provable definition before instruction $at")
    return writes
}

/**
 * Whether [register] holds the link at [at] on every path: a copy of [parameter], or (since 13.2)
 * Telegram's own rebuild of it through [parameter]'s buildUpon(), which drops tracking from the
 * query and fragment. The parameter is checked intact up to the classification, which every read
 * here reaches.
 */
private fun holdsLinkUri(method: Method, register: Int, at: Int, parameter: Int, depth: Int = 0): Boolean {
    if (depth > 4) return false
    val code = method.instructions()
    val firstParameter = method.parameterRegisterNumber(0)
    return reachingWrites(method, register, at).all { write ->
        val instruction = code[write]
        val source = instruction.namedRegisters().getOrNull(1)
        when {
            instruction.opcode in OBJECT_MOVES && source != null ->
                if (source >= firstParameter) source == parameter else holdsLinkUri(method, source, write, parameter, depth + 1)
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT && write > 0 && code[write - 1].ref() == "$URI_BUILDER->build()$URI" -> {
                val builder = code[write - 1].namedRegisters().single()
                builder < firstParameter && reachingWrites(method, builder, write - 1).all { start ->
                    code[start].opcode == Opcode.MOVE_RESULT_OBJECT && start > 0 &&
                        code[start - 1].ref() == "$URI->buildUpon()$URI_BUILDER" && code[start - 1].namedRegisters() == listOf(parameter)
                }
            }
            else -> false
        }
    }
}

private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref() = origRef()
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Method.same(other: MethodReference) = name == other.name && parameterTypes == other.parameterTypes && returnType == other.returnType
internal fun checkShape(ok: Boolean, reason: String) { if (!ok) fail(reason) }
private fun fail(reason: String): Nothing = throw PatchException("Link routing: $reason")
