/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 450 and checked against 451 (2026-10-12).
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.patchLog
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.theme.holdsNote
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "HushThreads settings"

internal const val THREADS_LOGO = "$EXTENSION_PACKAGE/settings/ThreadsLogo;"
internal const val THREADS_LOGO_LONG_PRESS = "$EXTENSION_PACKAGE/settings/ThreadsLogo\$LongPress;"
internal const val LOGO_CLICKABLE = "$THREADS_LOGO->clickable(Ljava/lang/Object;Ljava/lang/Object;" +
    "Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;"
/** The long press for each draw of the logo, or null with its switch off. */
internal const val LOGO_LONG_PRESS = "$THREADS_LOGO->longPress()Ljava/lang/Object;"
internal const val THREADS_LOGO_DESCRIBE = "$EXTENSION_PACKAGE/settings/ThreadsLogo\$Describe;"
internal const val LOGO_DESCRIBE_FIELD = "$THREADS_LOGO->DESCRIBE:$THREADS_LOGO_DESCRIBE"
internal const val LOGO_DESCRIBE = "$THREADS_LOGO->describe(Ljava/lang/Object;Ljava/lang/String;)V"
internal const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"

/**
 * The name Compose gives the semantics key a content description is kept under. The key carries
 * its name for Compose's own tests and inspector, so Threads' build keeps the string.
 */
internal const val CONTENT_DESCRIPTION = "ContentDescription"

private const val SINGLETON_LIST = "Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;"

/**
 * Compose's note in the main feed's lambdas, cut before the rest of the lambda's name. The feed
 * header that draws the logo is one of them.
 */
internal const val MAIN_FEED_SCREEN_NOTE = "com.instagram.barcelona.feed.ui.MainFeedScreen"

/**
 * The reason Threads' feed refresh logs for a refresh a tap on its logo starts. Redex keeps an enum
 * constant's name, and the logo's tap is the one lambda that hands the feed this reason.
 */
internal const val LOGO_TAP = "LogoTap"

private const val STRING = "Ljava/lang/String;"

/**
 * Where the long press goes: the feed header [method], the [call] in it that hands the logo's
 * modifier and Threads' [tap] lambda to Compose's [clickable], and Compose's [combined] clickable,
 * which takes a long press as well.
 */
internal class LogoSite(
    val method: Method,
    val call: Int,
    val tap: String,
    val clickable: MethodReference,
    val combined: Method,
)

/**
 * Compose's semantics as Threads' build keeps them: the [setter] that gives a semantics receiver
 * of type [receiver] a content description, and [clearAndSet], Compose's clearAndSetSemantics,
 * which appends to a modifier an element that drops the semantics of everything drawn inside it
 * and sets its own.
 */
internal class LogoSemantics(
    val setter: Method,
    val receiver: String,
    val clearAndSet: Method,
)

/**
 * Lets a long press on the Threads logo at the top of the home feed open the HushThreads screen.
 * Threads makes the logo clickable with Compose's clickable(interaction source, indication,
 * modifier, role, label, onClick, enabled), and Compose's combined clickable takes the same plus a
 * long press label, a long press and a double tap. That one call now goes to the extension's
 * stand-in, which hands everything Threads passed to the combined clickable along with the
 * extension's long press, so Threads' own tap, which refreshes the feed, stays exactly as it was.
 * The logo is a Compose drawing with no view behind it, so there's no listener to wrap or set.
 *
 * The site is found by the refresh reason Threads' logo tap sends ([LOGO_TAP]), the main feed's
 * Compose note, and the shapes of the two clickable functions, and everything is checked before
 * anything is written. A build it doesn't fit throws, and the settings patch turns that into a
 * warning and keeps the rest.
 *
 * The logo also shows Threads' refresh spinner, and TalkBack used to stop on that spinner, say
 * "Progress bar" and offer no long press. So the stand-in ends the logo's modifier with Compose's
 * clearAndSetSemantics, naming the logo "Threads" and leaving out what's drawn inside it, and
 * TalkBack lands on the clickable with its tap and long press. Compose reads a node's semantics
 * from the innermost modifier out, so the clickable's actions and role still land on that node. A
 * build without the semantics calls gets the long press and a warning ([logoSemantics]).
 */
internal fun BytecodePatchContext.addLogoLongPress() {
    val site = logoSite()
    val method = mutableClassDefBy(site.method.definingClass).findMutableMethodOf(site.method)
    val body = method.body()
    // The site was read from the class as it came in, so check the copy that's written is the same.
    if (body.getOrNull(site.call)?.method()?.signature() != site.clickable.signature() ||
        body.getOrNull(site.call + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
    ) throw PatchException("$PATCH: ${site.method.signature()} changed before the logo's long press could go in")
    val result = (body[site.call + 1] as OneRegisterInstruction).registerA
    val semantics = try {
        logoSemantics(site.clickable.returnType).also { implementFunction1(THREADS_LOGO_DESCRIBE) }
    } catch (e: PatchException) {
        patchLog.warning("${e.message?.trimEnd('.')}. The logo's long press goes in, but TalkBack keeps stopping on its refresh spinner.")
        null
    }

    implementFunction0(THREADS_LOGO_LONG_PRESS)
    val types = site.combined.parameterTypes.map { it.toString() }
    // The description goes innermost, after the clickable, so it clears what's drawn inside the
    // logo and not the clickable's own tap, long press and role.
    val describe = semantics?.let {
        writeStub(THREADS_LOGO, "describe", 2, """
            check-cast p0, ${it.receiver}
            invoke-static { p0, p1 }, ${it.setter.signature()}
            return-void
        """)
        """
        sget-object v1, $LOGO_DESCRIBE_FIELD
        invoke-static { v0, v1 }, ${it.clearAndSet.signature()}
        move-result-object v0
        """
    }.orEmpty()
    // Threads' arguments in Compose's order, the translated long press label, its handler (none
    // with its switch off), no double tap, and Threads' tap last, the way the combined clickable
    // takes them.
    writeStub(THREADS_LOGO, "clickable", 17, """
        move-object/from16 v0, p0
        check-cast v0, ${types[0]}
        move-object/from16 v1, p1
        check-cast v1, ${types[1]}
        move-object/from16 v2, p2
        check-cast v2, ${types[2]}
        move-object/from16 v3, p3
        check-cast v3, ${types[3]}
        move-object/from16 v4, p4
        invoke-static {}, $THREADS_LOGO->longClickLabel()Ljava/lang/String;
        move-result-object v5
        invoke-static {}, $LOGO_LONG_PRESS
        move-result-object v6
        check-cast v6, $FUNCTION0
        const/4 v7, 0x0
        move-object/from16 v8, p5
        check-cast v8, $FUNCTION0
        move/from16 v9, p6
        invoke-static/range { v0 .. v9 }, ${site.combined.signature()}
        move-result-object v0
        $describe
        return-object v0
    """)
    // The stand-in answers an Object, so the modifier is cast back before Threads uses it.
    method.sendToStandIn(site.call, LOGO_CLICKABLE)
    method.addInstruction(site.call + 2, "check-cast v$result, ${site.clickable.returnType}")
    // Last, so a build refused above leaves the settings screen without the long press's switch.
    answerInBuild(THREADS_LOGO)
}

/**
 * Reads where the long press goes and refuses a build where any of it differs from what was read
 * on 450 and 451: one refresh reason named [LOGO_TAP], one call in the main feed's lambdas to a
 * clickable(source, indication, modifier, role, String, Function0, boolean) that answers its
 * modifier's type and is handed, through copies and casts, a new lambda whose invoke() sends that
 * reason, its answer taken right after it, and one combined clickable beside it taking (source,
 * indication, modifier, role, String, String, Function0, Function0, Function0, boolean) that passes
 * its last Function0 on as the tap and the first as the long press.
 */
internal fun BytecodePatchContext.logoSite(): LogoSite {
    val reason = logoTapReason()
    val sites = classDefByStrings(MAIN_FEED_SCREEN_NOTE, StringComparisonType.STARTS_WITH)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .filter { it.holdsNote(MAIN_FEED_SCREEN_NOTE) }
        .distinctBy { it.signature() }
        .flatMap { method -> logoTaps(method, reason).map { (call, tap) -> Triple(method, call, tap) } }
    val (method, call, tap) = sites.singleOrPatchException(
        "$PATCH: the Threads logo's tap, a clickable in the main feed handed a lambda that refreshes by $LOGO_TAP",
    )
    val body = method.body()
    val clickable = body[call].method()!!
    if (body.getOrNull(call + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("$PATCH: ${method.signature()} doesn't take the logo's modifier right after its clickable")
    }
    if ((body[call + 1] as OneRegisterInstruction).registerA > 0xff) {
        throw PatchException("$PATCH: ${method.signature()} keeps the logo's modifier above v255, where no cast reaches")
    }
    val params = clickable.parameterTypes.map { it.toString() }
    val wanted = listOf(params[0], params[1], params[2], params[3], STRING, STRING, FUNCTION0, FUNCTION0, FUNCTION0, "Z")
    val owner = classDefByOrNull(clickable.definingClass)
        ?: throw PatchException("$PATCH: Threads carries no ${clickable.definingClass}")
    val combined = owner.methods.filter { candidate ->
        AccessFlags.STATIC.isSet(candidate.accessFlags) && candidate.returnType == clickable.returnType &&
            candidate.parameterTypes.map { it.toString() } == wanted
    }.singleOrPatchException("$PATCH: Compose's combined clickable beside ${clickable.signature()}")
    val order = handlerOrder(combined)
    if (order != listOf(8, 6, 7)) {
        throw PatchException("$PATCH: ${combined.signature()} hands its node parameters $order as the tap, long press " +
            "and double tap, not 8, 6 and 7, so the long press could land on the tap")
    }
    return LogoSite(method, call, tap, clickable, combined)
}

/**
 * Reads Compose's semantics calls and refuses a build where they differ from what was read on 451
 * (2026-10-18): the static field a static initializer stores right after it loads
 * [CONTENT_DESCRIPTION]; one static (receiver, String) method that reads that key, wraps its
 * String with Collections.singletonList and hands both to the receiver's (key, Object) setter;
 * and one static ([modifier], Function1) [modifier] that builds an element from the Function1 alone
 * and chains it onto the modifier, where the element builds a node holding one Function1 and two
 * flags, sets one flag on and the other off, and hands the Function1 the setter's receiver.
 * clearAndSetSemantics is the only such element: the other semantics element takes a flag too.
 */
internal fun BytecodePatchContext.logoSemantics(modifier: String): LogoSemantics {
    val keys = classDefByStrings(CONTENT_DESCRIPTION, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { holder -> holder.methods.filter { it.name == "<clinit>" } }
        .mapNotNull { semanticsKey(it) }
        .distinctBy { "${it.definingClass}->${it.name}" }
    if (keys.isEmpty()) throw PatchException("$PATCH: Compose's \"$CONTENT_DESCRIPTION\" semantics key, a static field stored after that name")
    val setters = mutableListOf<Method>()
    val appenders = mutableListOf<Pair<Method, String>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in classDef.methods) {
            if (!AccessFlags.STATIC.isSet(method.accessFlags)) continue
            if (isDescriptionSetter(method, keys)) setters += method
            appendedElement(method, modifier)?.let { appenders += method to it }
        }
    }
    val setter = setters.singleOrPatchException(
        "$PATCH: Compose's contentDescription setter, a static (receiver, String) that hands the \"$CONTENT_DESCRIPTION\" key a singleton list",
    )
    val receiver = setter.parameterTypes[0].toString()
    val clearAndSet = appenders.filter { (_, element) -> clearsSemantics(element, receiver) }
        .map { it.first }
        .singleOrPatchException("$PATCH: Compose's clearAndSetSemantics, a static ($modifier, Function1) that appends a clearing semantics element")
    return LogoSemantics(setter, receiver, clearAndSet)
}

/** The field [initializer] stores first after it loads [CONTENT_DESCRIPTION], before any other string, or null. */
private fun semanticsKey(initializer: Method): FieldReference? {
    val body = initializer.body()
    val named = body.indexOfFirst { it.getReference<StringReference>()?.string == CONTENT_DESCRIPTION }
    if (named < 0) return null
    val store = (named + 1 until body.size).firstOrNull { at ->
        body[at].opcode == Opcode.SPUT_OBJECT || body[at].getReference<StringReference>() != null
    } ?: return null
    if (body[store].opcode != Opcode.SPUT_OBJECT) return null
    return body[store].getReference<FieldReference>()?.takeIf { it.definingClass == initializer.definingClass }
}

/**
 * Whether [method] is Compose's contentDescription setter as R8 leaves it: static (receiver,
 * String) void reading one of [keys], wrapping the String in a singleton list and handing the key
 * and the list to the receiver's (key, Object) setter, and nothing else.
 */
private fun isDescriptionSetter(method: Method, keys: List<FieldReference>): Boolean {
    val params = method.parameterTypes.map { it.toString() }
    if (params.size != 2 || params[1] != STRING || method.returnType != "V") return false
    val body = method.body().filter { it.opcode != Opcode.NOP }
    if (body.map { it.opcode } != listOf(
            Opcode.SGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID,
        )
    ) return false
    val first = method.implementation!!.registerCount - 2
    val key = body[0].getReference<FieldReference>() ?: return false
    if (keys.none { it.sameAs(key) }) return false
    if (body[1].method()?.signature() != SINGLETON_LIST || body[1].registers() != listOf(first + 1)) return false
    val set = body[3].method() ?: return false
    if (set.definingClass != params[0] || set.returnType != "V" ||
        set.parameterTypes.map { it.toString() } != listOf(key.type, "Ljava/lang/Object;")
    ) return false
    val keyRegister = (body[0] as OneRegisterInstruction).registerA
    val list = (body[2] as OneRegisterInstruction).registerA
    return body[3].registers() == listOf(first, keyRegister, list)
}

/**
 * The element [method] builds when it's a static ([modifier], Function1) [modifier] that does
 * nothing but build an element from its Function1 and chain it onto its modifier, or null.
 */
private fun appendedElement(method: Method, modifier: String): String? {
    if (method.parameterTypes.map { it.toString() } != listOf(modifier, FUNCTION1) || method.returnType != modifier) return null
    val body = method.body().filter { it.opcode != Opcode.NOP }
    if (body.map { it.opcode } != listOf(
            Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT,
        )
    ) return null
    val first = method.implementation!!.registerCount - 2
    val element = body[0].getReference<TypeReference>()?.type ?: return null
    val made = (body[0] as OneRegisterInstruction).registerA
    val init = body[1].method() ?: return null
    if (init.definingClass != element || init.name != "<init>" || init.parameterTypes.map { it.toString() } != listOf(FUNCTION1) ||
        body[1].registers() != listOf(made, first + 1)
    ) return null
    val then = body[2].method() ?: return null
    if (then.definingClass != modifier || then.returnType != modifier || then.parameterTypes.map { it.toString() } != listOf(modifier) ||
        body[2].registers() != listOf(first, made)
    ) return null
    val result = (body[3] as OneRegisterInstruction).registerA
    return element.takeIf { (body[4] as OneRegisterInstruction).registerA == result }
}

/**
 * Whether [element] builds, in one place, a semantics node for [receiver]: a class holding one
 * Function1 and two flags whose (receiver) method hands the receiver to that Function1, with one
 * flag stored on and the other off. That's Compose's clearing element: the node's flags say
 * whether it merges what's inside it and whether it clears it, and the merging element takes its
 * merge flag from its caller. The place is one of the element's methods or its branch of a
 * superclass method ([branchFor]).
 */
private fun BytecodePatchContext.clearsSemantics(element: String, receiver: String): Boolean {
    val owner = classDefByOrNull(element) ?: return false
    val inherited = owner.superclass?.let { classDefByOrNull(it) }?.methods?.mapNotNull { it.body().branchFor(element) }.orEmpty()
    val built = (owner.methods.map { it.body() } + inherited).flatMap { create ->
        create.filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { made ->
            val node = classDefByOrNull(made.getReference<TypeReference>()!!.type) ?: return@mapNotNull null
            val fields = node.instanceFields.toList()
            val flags = fields.filter { it.type == "Z" }
            if (fields.count { it.type == FUNCTION1 } != 1 || flags.size != 2) return@mapNotNull null
            // The Function1 gets the receiver itself (p1), not something built from it.
            val applies = node.methods.any { apply ->
                !AccessFlags.STATIC.isSet(apply.accessFlags) && apply.returnType == "V" &&
                    apply.parameterTypes.map { it.toString() } == listOf(receiver) &&
                    apply.body().any { it.opcode == Opcode.INVOKE_INTERFACE && it.method()?.let { invoke ->
                        invoke.definingClass == FUNCTION1 && invoke.name == "invoke" } == true &&
                        it.registers().getOrNull(1) == apply.implementation!!.registerCount - 1 }
            }
            if (applies) Triple(create, node.type, flags.map { it.name }) else null
        }
    }
    val (create, node, flags) = built.singleOrNull() ?: return false
    val stored = flags.map { flag -> literalStored(create, node, flag) }
    return stored.sortedBy { it ?: -1 } == listOf(0, 1)
}

/**
 * The branch of [this] body that casts its receiver to [element], up to that branch's return, or
 * null. 454 (2026-11-02) builds the nodes of clearAndSetSemantics' element and several others in
 * one method of their shared superclass, one instance-of branch per element.
 */
private fun List<Instruction>.branchFor(element: String): List<Instruction>? {
    val cast = indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == element }
    if (cast < 0) return null
    val end = (cast until size).firstOrNull { this[it].opcode == Opcode.RETURN_OBJECT } ?: return null
    return subList(cast, end + 1)
}

/** The literal [body] stores into [owner]'s boolean [field], when it stores one exactly once, or null. */
private fun literalStored(body: List<Instruction>, owner: String, field: String): Int? {
    val stores = body.indices.filter { at ->
        body[at].opcode == Opcode.IPUT_BOOLEAN && body[at].getReference<FieldReference>()?.let {
            it.definingClass == owner && it.name == field } == true
    }
    val at = stores.singleOrNull() ?: return null
    val value = (body[at] as TwoRegisterInstruction).registerA
    val write = (at - 1 downTo 0).firstOrNull { body[it].writes(value) } ?: return null
    return (body[write] as? NarrowLiteralInstruction)?.narrowLiteral
}

/** Makes the extension's [type] a Kotlin Function1, which it already answers with invoke(Object). */
private fun BytecodePatchContext.implementFunction1(type: String) {
    val function1 = classDefByOrNull(FUNCTION1)
        ?: throw PatchException("$PATCH: Threads carries no $FUNCTION1")
    fun Method.isInvoke() = name == "invoke" && returnType == "Ljava/lang/Object;" &&
        parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;")
    if (!AccessFlags.INTERFACE.isSet(function1.accessFlags) || function1.methods.none { it.isInvoke() }) {
        throw PatchException("$PATCH: $FUNCTION1 isn't an interface with invoke(Object)")
    }
    val describe = mutableClassDefBy(type)
    if (describe.methods.none {
            it.isInvoke() && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
    ) throw PatchException("$PATCH: $type has no public invoke(Object)")
    if (FUNCTION1 !in describe.interfaces) describe.interfaces.add(FUNCTION1)
}

/**
 * The static field Threads' refresh reason enum keeps [LOGO_TAP] in: its static initializer builds
 * the constant from that name and stores it straight away.
 */
internal fun BytecodePatchContext.logoTapReason(): FieldReference =
    classDefByStrings(LOGO_TAP, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .filter { it.superclass == "Ljava/lang/Enum;" }
        .flatMap { enum -> enum.methods.filter { it.name == "<clinit>" } }
        .mapNotNull { enumConstant(it, LOGO_TAP) }
        .distinctBy { "${it.definingClass}->${it.name}" }
        .singleOrPatchException("$PATCH: Threads' refresh reason \"$LOGO_TAP\", an enum constant")

/** The field [initializer] stores the constant it names [name] in, or null when it doesn't build one that way. */
private fun enumConstant(initializer: Method, name: String): FieldReference? {
    val body = initializer.body()
    val named = body.indexOfFirst { it.getReference<StringReference>()?.string == name }
    if (named < 0) return null
    val nameRegister = (body[named] as OneRegisterInstruction).registerA
    val build = (named + 1 until body.size).firstOrNull { at ->
        body[at].method()?.let { it.name == "<init>" && it.definingClass == initializer.definingClass } == true
    } ?: return null
    val registers = body[build].registers()
    if (registers.size < 2 || registers[1] != nameRegister) return null
    if ((named + 1 until build).any { body[it].writes(nameRegister) }) return null
    val store = body.getOrNull(build + 1)?.takeIf { it.opcode == Opcode.SPUT_OBJECT } ?: return null
    if ((store as OneRegisterInstruction).registerA != registers[0]) return null
    return store.getReference<FieldReference>()
        ?.takeIf { it.definingClass == initializer.definingClass && it.type == initializer.definingClass }
}

/**
 * Each call in [method] to a clickable-shaped function whose Function0 argument is, through copies
 * and casts, a new lambda whose invoke() reads [reason], with that lambda's type. Read in order, as
 * Compose's remember block leaves it: the lambda is built just before the call.
 */
private fun BytecodePatchContext.logoTaps(method: Method, reason: FieldReference): List<Pair<Int, String>> {
    val body = method.body()
    return body.indices.mapNotNull { at ->
        val instruction = body[at]
        if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@mapNotNull null
        val target = instruction.method() ?: return@mapNotNull null
        if (!target.isClickable()) return@mapNotNull null
        val made = madeBy(body, at, instruction.registers()[5]) ?: return@mapNotNull null
        val tap = classDefByOrNull(made) ?: return@mapNotNull null
        val sends = tap.methods.any { invoke ->
            invoke.name == "invoke" && invoke.parameterTypes.isEmpty() && invoke.returnType == "Ljava/lang/Object;" &&
                invoke.body().any { it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.sameAs(reason) == true }
        }
        if (sends) at to made else null
    }
}

/** Compose's clickable as Threads' build keeps it: (source, indication, modifier, role, String, Function0, boolean), answering the modifier's type. */
private fun MethodReference.isClickable(): Boolean {
    val params = parameterTypes.map { it.toString() }
    return params.size == 7 && params[4] == STRING && params[5] == FUNCTION0 && params[6] == "Z" &&
        params.take(4).none { it.length == 1 } && returnType == params[2]
}

/** The type [register] holds at [before] when the code before it, read in order, put a new instance there through copies and casts. */
private fun madeBy(body: List<Instruction>, before: Int, register: Int): String? {
    var at = before
    var holding = register
    while (true) {
        at = (at - 1 downTo 0).firstOrNull { body[it].writes(holding) } ?: return null
        val writer = body[at]
        when (writer.opcode) {
            Opcode.NEW_INSTANCE -> return writer.getReference<TypeReference>()?.type
            Opcode.CHECK_CAST -> continue
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 -> holding = (writer as TwoRegisterInstruction).registerB
            else -> return null
        }
    }
}

/**
 * Which of [combined]'s parameters, by index, it hands each constructor that takes three Function0s
 * in a row, in the order the constructor takes them. Compose's node takes the tap, the long press
 * and the double tap, so this answers the tap's parameter first. Null when the constructors don't
 * agree or a Function0 doesn't come straight from a parameter.
 */
internal fun handlerOrder(combined: Method): List<Int>? {
    val body = combined.body()
    val widths = combined.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val first = (combined.implementation ?: return null).registerCount - widths.sum()
    val byRegister = widths.indices.associateBy { first + widths.take(it).sum() }
    val orders = body.indices.mapNotNull { at ->
        val instruction = body[at]
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) return@mapNotNull null
        val target = instruction.method()?.takeIf { it.name == "<init>" } ?: return@mapNotNull null
        val types = target.parameterTypes.map { it.toString() }
        val start = types.windowed(3).indexOfFirst { window -> window.all { it == FUNCTION0 } }
        if (start < 0) return@mapNotNull null
        val registers = instruction.registers()
        // The receiver comes first, then each parameter, two registers for a wide one.
        val slot = { index: Int -> 1 + types.take(index).sumOf { if (it == "J" || it == "D") 2 else 1 } }
        (start until start + 3).map { index -> parameterOf(body, at, registers[slot(index)], byRegister) }
    }
    if (orders.isEmpty() || orders.any { order -> order.any { it == null } } || orders.distinct().size != 1) return null
    return orders.first().map { it!! }
}

/** The parameter [register] still holds at [before], following copies back in code order, or null. */
private fun parameterOf(body: List<Instruction>, before: Int, register: Int, byRegister: Map<Int, Int>): Int? {
    var at = before
    var holding = register
    while (true) {
        val write = (at - 1 downTo 0).firstOrNull { body[it].writes(holding) } ?: return byRegister[holding]
        val writer = body[write]
        if (writer.opcode !in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)) return null
        holding = (writer as TwoRegisterInstruction).registerB
        at = write
    }
}

private fun Instruction.registers(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = (this as? OneRegisterInstruction)?.registerA ?: return false
    return destination == register || (opcode.setsWideRegister() && destination + 1 == register)
}

private fun FieldReference.sameAs(other: FieldReference) =
    definingClass == other.definingClass && name == other.name && type == other.type

private fun Instruction.method(): MethodReference? = getReference<MethodReference>()

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun MethodReference.signature(): String = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
