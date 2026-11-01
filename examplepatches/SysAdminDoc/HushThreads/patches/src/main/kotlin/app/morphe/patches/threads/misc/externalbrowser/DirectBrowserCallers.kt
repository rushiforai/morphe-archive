/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.externalbrowser

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.feed.reaching
import app.morphe.patches.threads.misc.extension.freeLocalsAt
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.util.ControlFlow
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Open links in browser"
private const val CONTEXT = "Landroid/content/Context;"
private const val TEXT = "Ljava/lang/String;"
private const val INTENT = "Landroid/content/Intent;"
private const val URI = "Landroid/net/Uri;"
private const val SESSION = "Lcom/instagram/common/session/UserSession;"
private const val STATE = "Landroidx/compose/runtime/MutableState;"
private const val VIEW_MODE = "Lcom/facebook/browser/common/viewmode/IABViewModeLaunchConfig;"

/** Two of the strings Threads' browser Intent factory puts in the Intent it makes. Only the factory has both. */
internal const val FACTORY_MODULE = "TrackingInfo.ARG_MODULE_NAME"
internal const val FACTORY_OPEN = "BrowserLiteIntent.OPEN_WITH_URL"

/** The name of the ad destination a web call to action has. */
internal const val WEB_DESTINATION = "AD_DESTINATION_WEB"

/** The start of the Compose trace the immersive browser screen carries, before its line number. */
internal const val IMMERSIVE_SCREEN = "com.instagram.barcelona.inappbrowser.compose.ImmersiveBrowserScreen ("

/**
 * One place that makes Threads' browser Intent without the launcher asking first. [at] is where the
 * hook goes in front of: the method's first instruction, or the factory call itself. A link that
 * went out leaves by `return-void` at the method's start, or by a jump to [done], the method's own
 * ending for an opened browser. A link that stays runs the instruction at [at] as before.
 */
internal class DirectBrowserSite(
    val method: MutableMethod,
    val at: Int,
    val done: Int?,
    val context: Int,
    val url: Int,
    /** A String field the link is read from, for a site that keeps it in one rather than in a register. */
    val urlField: FieldReference? = null,
    /** Answer true and return, for a site whose method returns a boolean rather than void. */
    val returnsTrue: Boolean = false,
) {
    // Picked before anything changes: free where the hook goes in and, past a jump, where it lands.
    private val scratch = method.freeLocalsAt(PATCH, at, 2, listOfNotNull(done))

    fun inject() {
        val (answer, link) = scratch
        if (urlField != null && link > 0xF) {
            throw PatchException("$PATCH: ${method.name}'s free locals start at v$link, past the four-bit field read")
        }
        val success = when {
            returnsTrue -> "const/4 v$answer, 0x1\n                return v$answer"
            done == null -> "return-void"
            else -> "goto/16 :done"
        }
        val labels = listOfNotNull(
            ExternalLabel("stock", method.getInstruction(at)),
            done?.let { ExternalLabel("done", method.getInstruction(it)) },
        )
        val loadLink = if (urlField != null) {
            // iget-object only reaches four-bit registers, so keep `this` in the scratch link
            // register and read the field through it before loading the context over the other.
            """
                move-object/from16 v$link, p0
                iget-object v$link, v$link, $urlField
            """
        } else {
            """
                move-object/from16 v$link, v$url
            """
        }
        method.addInstructionsWithLabels(
            at,
            loadLink + """
                move-object/from16 v$answer, v$context
                invoke-static { v$answer, v$link }, $OPEN_LINK
                move-result v$answer
                if-eqz v$answer, :stock
                $success
            """,
            *labels.toTypedArray(),
        )
    }
}

/**
 * The three places on 451 through 453 that make Threads' browser Intent themselves rather than through the
 * launcher: the lead form and privacy policy helper, the ad browser opened from a call to action,
 * and the media viewer's swipe up on an ad. Everything is read and proven before anything changes.
 *
 * Read from 451 (2026-10-13), 452 (2026-10-22) and 453 (2026-10-26): the factory that builds the browser Intent has
 * five callers. The launcher calls it twice, once for each way it shows the browser. The immersive
 * browser screen calls it after the launcher already asked, so it's left alone, and so is the
 * factory. A sixth caller, or one of these gone, stops the patch.
 */
internal fun BytecodePatchContext.directBrowserSites(launcher: Method): List<DirectBrowserSite> {
    val factory = browserFactory()
    val reference = factory.toString()
    val callers = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in classDef.methods) {
            if (method.implementation?.instructions?.any { it.method()?.sameAs(factory) == true } == true) callers += method
        }
    }
    fun one(what: String, pick: (Method) -> Boolean): Method =
        callers.singleOrNull(pick) ?: refuse("$PATCH: $what is ${callers.count(pick)} of the ${callers.size} callers of Threads' browser Intent")

    val launcherHelper = one("the launcher's Intent helper") { it.definingClass == launcher.definingClass }
    val adBuilder = one("the ad browser's Intent builder") { method ->
        method !== launcherHelper && method.returnType == INTENT && !AccessFlags.STATIC.isSet(method.accessFlags)
    }
    val immersive = one("the immersive browser screen") { method ->
        method !== launcherHelper && method !== adBuilder && method.strings().any { it.startsWith(IMMERSIVE_SCREEN) }
    }
    val media = one("the media viewer's swipe up") { method ->
        method !== launcherHelper && method !== adBuilder && method !== immersive &&
            method.name == "invokeSuspend" && method.strings().any { it == WEB_DESTINATION }
    }
    val lead = one("the lead form helper") { method ->
        method !== launcherHelper && method !== adBuilder && method !== immersive && method !== media &&
            method.name == "invoke" && method.returnType == "Ljava/lang/Object;"
    }
    ensure(callers.size == 5, "Threads' browser Intent has ${callers.size} callers, not five")
    ensure(launcherHelper.body().count { it.method()?.sameAs(factory) == true } == 1,
        "the launcher's Intent helper makes Threads' browser Intent more than once")

    val leadCall = lead.soleFactoryCall(factory, "the lead form helper")
    val leadArgs = lead.body()[leadCall].namedRegisters()
    val leadUrl = lead.origins(leadCall, leadArgs[5]).mapNotNull { (index, _) -> lead.body().getOrNull(index) }
        .firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.field()?.type == TEXT && it.field()?.definingClass == lead.definingClass }
        ?: refuse("the lead form helper's browser gets a link other than one of its own String fields")
    val leadDone = lead.body().indices.firstOrNull { index ->
        index > leadCall && lead.body()[index].opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) &&
            lead.body().target(index) > index
    }?.let { lead.body().target(it) } ?: refuse("the lead form helper's browser has no successful ending")

    val mediaCall = media.soleFactoryCall(factory, "the media viewer's swipe up")
    val mediaArgs = media.body()[mediaCall].namedRegisters()
    val webUrl = media.origins(mediaCall, mediaArgs[5]).mapNotNull { (index, _) -> media.body().getOrNull(index) }
        .firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.field()?.type == TEXT }?.field()
        ?: refuse("the media viewer's browser gets a link other than a call to action's String field")

    return listOf(
        DirectBrowserSite(mutable(lead), leadCall, leadDone, leadArgs[0], leadArgs[5]),
        adBrowserSite(adBuilder, factory),
        mediaSite(mutable(media), factory, webUrl),
    )
}

/** The one factory call in [this] method, at the index its own body calls it. */
private fun Method.soleFactoryCall(factory: Method, what: String): Int {
    val body = body()
    return body.indices.filter { body[it].method()?.sameAs(factory) == true }.singleOrNull()
        ?: refuse("$what makes Threads' browser Intent a number of times other than one")
}

/**
 * The ad browser: 453 builds its Intent in [builder] and opens it from the method of the same class
 * that takes the Activity and calls the builder. The hook goes at the start of the opener, before
 * the Intent is made, and answers true when the link went out.
 */
private fun BytecodePatchContext.adBrowserSite(builder: Method, factory: Method): DirectBrowserSite {
    val body = builder.body()
    val calls = body.indices.filter { body[it].method()?.sameAs(factory) == true }
    if (calls.size != 1) refuse("the ad browser makes Threads' browser Intent ${calls.size} time(s), not 1")
    val call = calls.single()
    val args = body[call].namedRegisters()
    val url = builder.origins(call, args[5]).mapNotNull { (index, _) -> body.getOrNull(index) }
        .firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.field()?.type == TEXT && it.field()?.definingClass == builder.definingClass }
        ?.field() ?: refuse("the ad browser's browser gets a link other than one of its own String fields")
    val opener = classDefByOrNull(builder.definingClass)?.methods?.singleOrNull { method ->
        method !== builder && method.returnType == "Z" && method.parameterTypes.firstOrNull()?.toString() == "Landroid/app/Activity;" &&
            method.body().any { it.method()?.sameAs(builder) == true }
    } ?: refuse("the ad browser's opener is gone from ${builder.definingClass}")
    // Code put in front of a try block's first instruction would land in the block.
    ensure(opener.implementation!!.tryBlocks.none { it.startCodeAddress == 0 }, "the ad browser's opener starts inside a try block")
    val context = opener.implementation!!.registerCount - opener.parameterTypes.size
    return DirectBrowserSite(mutableClassDefBy(opener.definingClass).methods.single { it.name == opener.name && it.parameterTypes == opener.parameterTypes }, 0, null, context, 0, url, returnsTrue = true)
}

/**
 * The static method that builds Threads' browser Intent from a context, the post, the session, where
 * the tap came from and the link, parameter 5. It parses the link with one static String-to-Uri
 * helper, and the Intent gets that Uri, or Uri.EMPTY when it parsed nothing.
 */
private fun BytecodePatchContext.browserFactory(): Method {
    val matched = Fingerprint(
        returnType = INTENT,
        parameters = listOf(CONTEXT, "L", "L", SESSION, "L", TEXT, TEXT, TEXT, TEXT, TEXT),
        filters = listOf(string(FACTORY_MODULE), string(FACTORY_OPEN)),
        custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
    ).matchAllOrNull().orEmpty().map { it.originalMethod }.one("Threads' browser Intent factory")
    // The factory as the build has it now, which is what its callers will run, read like the census reads them.
    val factory = classDefByOrNull(matched.definingClass)?.methods?.singleOrNull { it.sameAs(matched) }
        ?: refuse("Threads' browser Intent factory is gone from its class")
    val body = factory.body()
    val parse = body.indices.filter { n ->
        body[n].opcode.isStatic() && body[n].method()?.let {
            it.returnType == URI && it.parameterTypes.map(CharSequence::toString) == listOf(TEXT)
        } == true
    }.one("the browser Intent factory's link parser")
    ensure(
        factory.origins(parse, body[parse].namedRegisters().single()) == setOf(ENTRY to factory.entry(5)),
        "the browser Intent factory parses something other than its link, parameter 5",
    )
    ensure(body.getOrNull(parse + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "the browser Intent factory drops the parsed link")
    val data = body.indices.filter { body[it].method()?.toString() == "$INTENT->setData($URI)$INTENT" }
        .one("the browser Intent factory's setData")
    // On 451 the parse sits in a try whose handler leaves the null the Uri started as, and a null
    // Uri becomes Uri.EMPTY before setData. Read without the branch's sense, the null reaches it too.
    val uris = factory.origins(data, body[data].namedRegisters()[1])
    ensure(
        uris.any { it.first == parse + 1 } && uris.all { (n, _) ->
            n == parse + 1 || n >= 0 && (
                body[n].opcode == Opcode.SGET_OBJECT && body[n].field()?.toString() == "$URI->EMPTY:$URI" ||
                    body[n].opcode == Opcode.CONST_4 && (body[n] as NarrowLiteralInstruction).narrowLiteral == 0
                )
        },
        "the browser Intent factory's Intent gets a Uri other than the parsed link",
    )
    return factory
}

/**
 * The media viewer's swipe up on an ad, a coroutine whose captured context, post and state it reads
 * from its own fields. It opens the web link of the post's first call to action in a sheet, then
 * sets its state to true. Without a web link it sets the state to false. The hook goes in front of
 * its factory call, and a link that went out goes on to the true ending.
 */
private fun BytecodePatchContext.mediaSite(media: MutableMethod, factory: Method, webUrl: FieldReference): DirectBrowserSite {
    val code = media.body()
    val at = media.soleEntry(factory, "the media viewer's swipe up")
    val args = code[at].namedRegisters()
    val context = media.origins(at, args[0]).singleOrNull()?.first ?: refuse("the media viewer's context has more than one source")
    ensure(
        context >= 0 && code[context].field()?.type == CONTEXT && media.captured(context),
        "the media viewer's browser gets a context other than the one it captured",
    )
    val guard = callToAction(media, at, args, factory, webUrl, "the media viewer's swipe up")
    val failed = code.target(guard)
    media.viewModes(at, "the media viewer's swipe up")

    // The true ending joins the false one at a state setter: move-object vState; invoke
    // (MutableState, Z)V; sget-object Unit; return-object. Jumping to the move runs it with the
    // true flag the browser path computed, while the no-web branch jumps there with false.
    val setter = code.indices.filter { n ->
        n > 0 && n + 2 < code.size && code[n - 1].opcode == Opcode.MOVE_OBJECT_FROM16 &&
            code[n].method()?.parameterTypes?.map(CharSequence::toString) == listOf(STATE, "Z") &&
            code[n + 1].opcode == Opcode.SGET_OBJECT && code[n + 2].opcode == Opcode.RETURN_OBJECT
    }.one("the media viewer's ending for an opened browser")
    val done = setter - 1
    val copy = code[done] as TwoRegisterInstruction
    val flag = code[setter].namedRegisters()[1]
    ensure(code[setter].namedRegisters() == listOf(copy.registerA, flag), "the media viewer sets its state from other registers")
    val state = media.origins(done, copy.registerB).singleOrNull()?.first ?: refuse("the media viewer's state has more than one source")
    ensure(
        state >= 0 && code[state].field()?.type == STATE && media.captured(state) &&
            media.origins(at, copy.registerB) == media.origins(done, copy.registerB),
        "the media viewer's state isn't its captured state before the browser opens",
    )
    ensure(
        code[failed].opcode == Opcode.CONST_4 && (code[failed] as NarrowLiteralInstruction).narrowLiteral == 0 &&
            (code[failed] as OneRegisterInstruction).registerA == flag &&
            code.getOrNull(failed + 1)?.let { it.opcode == Opcode.GOTO || it.opcode == Opcode.GOTO_16 || it.opcode == Opcode.GOTO_32 } == true &&
            code.target(failed + 1) == done,
        "the media viewer's ending for an ad with no web link no longer sets its state to false",
    )
    return DirectBrowserSite(media, at, done, args[0], args[5])
}

/**
 * Proves the factory call at [at] opens the web link of the post's first call to action, and only
 * after the check that the call to action's destination is the web: the link is [webUrl] read from
 * the first item of a list the post holds, the post is the one the factory gets, and the check
 * compares that call to action's destination with the AD_DESTINATION_WEB constant. Answers the
 * check's index; its branch is taken when the destination isn't the web.
 */
private fun BytecodePatchContext.callToAction(
    caller: Method, at: Int, args: List<Int>, factory: Method, webUrl: FieldReference, what: String,
): Int {
    val code = caller.body()
    val (read, _) = caller.origins(at, args[5]).singleOrNull() ?: refuse("$what's link has more than one source")
    ensure(
        code[read].opcode == Opcode.IGET_OBJECT && code[read].field()?.toString() == webUrl.toString(),
        "$what opens something other than a call to action's web link",
    )
    val cta = caller.origins(read, (code[read] as TwoRegisterInstruction).registerB)
    val first = cta.singleOrNull()?.first ?: refuse("$what's call to action has more than one source")
    ensure(
        first > 0 && code[first].opcode == Opcode.MOVE_RESULT_OBJECT && code[first - 1].method()?.let {
            it.returnType == "Ljava/lang/Object;" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;")
        } == true,
        "$what's call to action isn't the first item of a list",
    )
    val list = caller.origins(first - 1, code[first - 1].namedRegisters().single()).singleOrNull()?.first
        ?: refuse("$what's call to action list has more than one source")
    ensure(
        list >= 0 && code[list].opcode == Opcode.IGET_OBJECT && code[list].field()?.definingClass == factory.parameterTypes[2].toString() &&
            caller.origins(list, (code[list] as TwoRegisterInstruction).registerB) == caller.origins(at, args[2]),
        "$what's call to action belongs to another post than the one its browser gets",
    )
    val guard = code.indices.filter { n ->
        if (n < 3 || n >= at || code[n].opcode != Opcode.IF_NE) return@filter false
        if (code[n - 1].opcode != Opcode.SGET_OBJECT || code[n - 2].opcode != Opcode.MOVE_RESULT_OBJECT) return@filter false
        val destination = code[n - 1].field() ?: return@filter false
        val getter = code[n - 3].method() ?: return@filter false
        getter.definingClass == webUrl.definingClass && getter.parameterTypes.isEmpty() && getter.returnType == destination.type &&
            caller.origins(n - 3, code[n - 3].namedRegisters().single()) == cta &&
            code[n].namedRegisters().toSet() == setOf(
                (code[n - 1] as OneRegisterInstruction).registerA, (code[n - 2] as OneRegisterInstruction).registerA,
            ) &&
            isWebDestination(destination)
    }.one("$what's check that the call to action goes to the web")
    ensure(caller.dominates(guard, at), "$what can reach its browser without the web check")
    return guard
}

/** Whether [field] is the enum constant its class's initializer makes with the name AD_DESTINATION_WEB. */
private fun BytecodePatchContext.isWebDestination(field: FieldReference): Boolean {
    val initializer = classDefByOrNull(field.definingClass)?.methods?.singleOrNull { it.name == "<clinit>" } ?: return false
    val code = initializer.body()
    val store = code.indices.singleOrNull {
        code[it].opcode == Opcode.SPUT_OBJECT && code[it].field()?.toString() == field.toString()
    } ?: return false
    val instance = initializer.origins(store, (code[store] as OneRegisterInstruction).registerA)
    return code.indices.count { n ->
        val call = code[n].method()
        if (call?.definingClass != field.definingClass || call.name != "<init>" || call.parameterTypes.firstOrNull()?.toString() != TEXT) {
            return@count false
        }
        val args = code[n].namedRegisters()
        initializer.origins(n, args[0]) == instance && initializer.origins(n, args[1]).singleOrNull()?.first?.let { name ->
            name >= 0 && code[name].getReference<StringReference>()?.string == WEB_DESTINATION
        } == true
    } == 1
}

/**
 * The view modes that reach the call wrapping the factory's Intent right after it, which takes
 * the Intent, an IABViewModeLaunchConfig and a flag. Answers where each mode is made.
 */
private fun Method.viewModes(at: Int, what: String): Set<Int> {
    val code = body()
    ensure(code.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "$what drops its browser Intent")
    val wrap = code.getOrNull(at + 2) ?: refuse("$what ends at its browser Intent")
    ensure(
        wrap.method()?.parameterTypes?.map(CharSequence::toString) == listOf(INTENT, VIEW_MODE, "Z") &&
            wrap.namedRegisters().first() == (code[at + 1] as OneRegisterInstruction).registerA,
        "$what no longer hands its browser Intent straight to the view mode",
    )
    val modes = origins(at + 2, wrap.namedRegisters()[1])
    ensure(
        modes.isNotEmpty() && modes.all { (n, _) ->
            n >= 0 && (code[n].getReference<TypeReference>()?.type ?: code[n].field()?.type)
                ?.startsWith(VIEW_MODE.removeSuffix(";") + "$") == true
        },
        "$what's view mode isn't one of the browser's own",
    )
    return modes.map { it.first }.toSet()
}

/** The index of the one factory call in this method, reached only from the instruction before it. */
private fun Method.soleEntry(factory: Method, what: String): Int {
    val code = body()
    val at = soleFactoryCall(factory, what)
    val flow = ControlFlow.of(this)
    ensure(
        at > 0 && code[at - 1] !is OffsetInstruction && code[at - 1].opcode.canContinue() &&
            flow.normal.indices.none { from -> from != at - 1 && at in flow.normal[from] },
        "$what's browser has a branch straight to it that would miss the hook",
    )
    return at
}

/** Whether the instruction at [at] is an iget-object of one of this method's own fields, read from this. */
private fun Method.captured(at: Int): Boolean {
    val read = body()[at]
    return read.opcode == Opcode.IGET_OBJECT && read.field()?.definingClass == definingClass &&
        origins(at, (read as TwoRegisterInstruction).registerB) == setOf(ENTRY to entry(0) - 1)
}

/** Whether every path from the method's start to [target] runs [guard]. */
private fun Method.dominates(guard: Int, target: Int): Boolean {
    val flow = ControlFlow.of(this)
    val pending = ArrayDeque(listOf(0))
    val seen = mutableSetOf<Int>()
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == guard || !seen.add(at)) continue
        if (at == target) return false
        pending.addAll(flow.normal[at] + flow.exceptional[at])
    }
    return true
}

/** The index [ENTRY] stands for in an origin: the value the method got. */
private const val ENTRY = -1

/**
 * Where the value [register] holds at [at] comes from, on every path there: `(index, register)` of
 * each instruction that made it, or `(ENTRY, register)` for what the method got, through object
 * moves and casts. A wide write over one half of it is refused, not followed.
 */
private fun Method.origins(at: Int, register: Int, seen: Set<Pair<Int, Int>> = emptySet()): Set<Pair<Int, Int>> {
    if (at to register in seen) refuse("a browser value that goes round in a loop")
    val code = body()
    val writes = reaching(at, setOf(register))
    val sources = if (writes.fromEntry) mutableSetOf(ENTRY to register) else mutableSetOf()
    for (n in writes.writes) {
        val instruction = code[n]
        ensure((instruction as OneRegisterInstruction).registerA == register, "a browser value with half a long written over it")
        sources += when (instruction.opcode) {
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                origins(n, (instruction as TwoRegisterInstruction).registerB, seen + (at to register))
            Opcode.CHECK_CAST -> origins(n, register, seen + (at to register))
            else -> setOf(n to register)
        }
    }
    return sources
}

/** The register declared parameter [index] arrives in, past the locals and `this`. */
private fun Method.entry(index: Int): Int {
    fun width(type: CharSequence) = if (type.toString() == "J" || type.toString() == "D") 2 else 1
    return implementation!!.registerCount - parameterTypes.sumOf(::width) + parameterTypes.take(index).sumOf(::width)
}

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single { it.sameAs(method) }

private fun MethodReference.sameAs(other: MethodReference) =
    name == other.name && definingClass == other.definingClass && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

private fun Method.describe() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun Method.body() = implementation?.instructions?.toList().orEmpty()
private fun Method.strings() = body().mapNotNull { it.getReference<StringReference>()?.string }
private fun Instruction.method() = getReference<MethodReference>()
private fun Instruction.field() = getReference<FieldReference>()
private fun Opcode.isStatic() = this == Opcode.INVOKE_STATIC || this == Opcode.INVOKE_STATIC_RANGE

/** The index the branch at [at] lands on. */
private fun List<Instruction>.target(at: Int): Int {
    var address = 0
    val offsets = map { instruction -> address.also { address += instruction.codeUnits } }
    val target = offsets.indexOf(offsets[at] + (this[at] as OffsetInstruction).codeOffset)
    ensure(target >= 0, "a browser branch lands between instructions")
    return target
}

private fun <T> List<T>.one(what: String): T = singleOrNull() ?: refuse("$what: expected one, found $size")
private fun ensure(condition: Boolean, what: String) { if (!condition) refuse(what) }
private fun refuse(what: String): Nothing = throw PatchException("$PATCH: $what")
