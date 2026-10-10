/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.contacts

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Quiet contacts nag"
internal const val CONTACTS_NAG = "$EXTENSION_PACKAGE/misc/ContactsNag;"
internal const val PREFS = "Landroid/content/SharedPreferences;"
internal const val READ_CONTACTS = "android.permission.READ_CONTACTS"
internal const val ASKED_ANYWHERE = "askAboutContacts"
internal const val ASKED_IN_CONTACTS = "askAboutContacts2"
private const val ACTIVITY = "Landroid/app/Activity;"

@Suppress("unused")
val quietContactsNagPatch = bytecodePatch(
    name = PATCH,
    description = "Once you've said no, stops the Contacts tab from asking for contacts access again and clears its " +
        "warning badge. On by default. Turn it off in HushTelegram settings > Chats.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("quietContactsNag")
        val sites = resolveContactsNagSites()
        sites.apply()
        enableStatus("quietContactsNag")
    }
}

/**
 * [ask] is the Contacts tab's onBecomeFullyVisible: [askGate] is the first instruction after it
 * finds contacts permission missing, from which it only shows a dialog or asks Android, and
 * [askDone] is the return it takes when permission is there. [badge] sets the Contacts tab's
 * badge: [badgeGate] starts the "!" and [badgeClear] the clear Telegram uses when permission is
 * granted. [prefs] is Telegram's getter for the settings that hold both prompt flags.
 */
internal class ContactsNagSites(
    val ask: MutableMethod,
    val askGate: Int,
    val askDone: Int,
    val badge: MutableMethod,
    val badgeGate: Int,
    val badgeClear: Int,
    val prefs: MethodReference,
)

internal fun BytecodePatchContext.resolveContactsNagSites(): ContactsNagSites {
    requireRuntimeHooks()

    // The badge: the one method that reads the Contacts tab's prompt flag back.
    val readers = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(readers) { method -> method.instructions().let { body ->
            body.any { it.string() == ASKED_IN_CONTACTS } && body.any { it.isGetBoolean() }
        } }
    }
    val reader = readers.one("reader of the Contacts tab's prompt flag")
    val badge = mutableClassDefBy(reader.definingClass).methods.single { it.sameAs(reader) }
    val badgeBody = badge.instructions()
    val read = badgeBody.indices.filter { badgeBody[it].isGetBoolean() }.one("prompt flag read in the badge")
    val (prefsRegister, keyRegister) = badgeBody[read].namedRegisters()
    shape(read >= 2 && badgeBody[read - 2].opcode == Opcode.INVOKE_STATIC && badgeBody[read - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
        badgeBody[read - 1].namedRegisters() == listOf(prefsRegister), "the badge no longer reads the flag from a settings getter")
    val prefs = badgeBody[read - 2].call()!!
    shape(prefs.parameterTypes.isEmpty() && prefs.returnType == PREFS, "the badge's settings getter no longer returns plain settings")
    shape(keyRegister.writtenLastBy(badgeBody, read)?.string() == ASKED_IN_CONTACTS, "the badge no longer reads the Contacts tab's flag")
    shape(badgeBody.getOrNull(read + 1)?.opcode == Opcode.MOVE_RESULT && badgeBody.getOrNull(read + 2)?.opcode == Opcode.IF_EQZ &&
        badgeBody[read + 2].namedRegisters() == badgeBody[read + 1].namedRegisters(), "the badge no longer acts on the flag")
    val badgeGate = read + 3
    val badgeClear = badgeBody.target(read + 2)
    // "!" and the clear: the same badge call, one with "!" and one with null, each followed by a return.
    val mark = (badgeGate until badgeClear).filter { badgeBody[it].string() == "!" }.one("badge mark")
    val setMark = badgeBody.getOrNull(mark + 1)
    val setter = setMark?.call()
    shape(setter != null && setMark.opcode == Opcode.INVOKE_VIRTUAL && setter.parameterTypes.map(CharSequence::toString) ==
        listOf("Ljava/lang/String;", "Z", "Z") && setter.returnType == "V" &&
        setMark.namedRegisters()[1] == badgeBody[mark].namedRegisters()[0] && badgeBody.getOrNull(mark + 2)?.opcode == Opcode.RETURN_VOID,
        "the badge no longer sets \"!\" and returns")
    shape((badgeGate until mark).none { badgeBody[it] is OffsetInstruction || badgeBody[it].call() != null },
        "the badge does more than set \"!\" after reading the flag")
    val clearSet = (badgeClear until badgeBody.size).firstOrNull { badgeBody[it].call() != null }
    shape(clearSet != null && badgeBody[clearSet].call() == setter && badgeBody[clearSet - 1].isZero(badgeBody[clearSet].namedRegisters()[1]) &&
        badgeBody.getOrNull(clearSet + 1)?.opcode == Opcode.RETURN_VOID &&
        (badgeClear until clearSet).none { badgeBody[it] is OffsetInstruction }, "the badge no longer clears through the same call")

    // The Contacts tab: the one onBecomeFullyVisible that checks contacts permission, in the class
    // that writes both prompt flags.
    val visibles = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        val strings = classDef.methods.flatMap { it.instructions() }.mapNotNullTo(mutableSetOf()) { it.string() }
        if (ASKED_ANYWHERE !in strings || ASKED_IN_CONTACTS !in strings) return@classDefForEach
        classDef.methods.filterTo(visibles) { method -> method.name == "onBecomeFullyVisible" && method.parameterTypes.isEmpty() &&
            method.instructions().any { it.string() == READ_CONTACTS } }
    }
    val visible = visibles.one("Contacts tab check")
    val ask = mutableClassDefBy(visible.definingClass).methods.single { it.sameAs(visible) }
    val askBody = ask.instructions()
    val check = askBody.indices.filter { askBody[it].call()?.let { call -> call.name == "checkSelfPermission" && call.definingClass == ACTIVITY } == true }
        .one("permission check in the Contacts tab")
    shape(askBody[check].namedRegisters()[1].writtenLastBy(askBody, check)?.string() == READ_CONTACTS,
        "the Contacts tab no longer checks contacts permission")
    shape(askBody.getOrNull(check + 1)?.opcode == Opcode.MOVE_RESULT && askBody.getOrNull(check + 2)?.opcode == Opcode.IF_EQZ &&
        askBody[check + 2].namedRegisters() == askBody[check + 1].namedRegisters(), "the Contacts tab no longer branches on the permission")
    val askGate = check + 3
    val askDone = askBody.target(check + 2)
    shape(askBody[askDone].opcode == Opcode.RETURN_VOID && askDone > askGate, "granted permission no longer leaves the Contacts tab check")
    // From the gate, the tab only asks: Android's rationale check, a dialog, or its own request.
    val flow = ControlFlow.of(ask)
    val region = reach(flow, askGate)
    shape(region.all { it >= askGate } && region.all { flow.normal[it].isNotEmpty() || askBody[it].opcode == Opcode.RETURN_VOID },
        "the Contacts tab's prompt no longer stands alone at the end of the check")
    shape(askBody[askGate].call()?.name == "shouldShowRequestPermissionRationale", "the prompt no longer starts with Android's rationale check")
    val calls = region.sorted().mapNotNull { askBody[it].call() }
    val request = calls.filter { it.definingClass == ask.definingClass && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
        .one("Contacts tab's own request")
    shape(calls.count { it.name == "showDialog" } == 1, "the prompt no longer shows one dialog")
    shape(calls.all { it.name in setOf("shouldShowRequestPermissionRationale", "<init>", "showDialog") || it == request ||
        it.returnType.endsWith("AlertDialog\$Builder;") }, "the prompt does more than ask for contacts")
    shape(region.none { askBody[it].opcode.isFieldWrite() && askBody[it].opcode != Opcode.IPUT_OBJECT },
        "the prompt writes more than its dialog")
    val requester = classDefBy(ask.definingClass).methods.single { it.name == request.name &&
        it.parameterTypes.map(CharSequence::toString) == listOf("Z") && it.returnType == request.returnType }
    shape(requester.instructions().let { body -> body.any { it.string() == READ_CONTACTS } && body.any { it.call()?.name == "requestPermissions" } },
        "the Contacts tab's own request no longer asks Android for contacts")

    return ContactsNagSites(ask, askGate, askDone, badge, badgeGate, badgeClear, prefs)
}

private fun ContactsNagSites.apply() {
    val quiet = ask.freeLocalsAt(PATCH, askGate, 1, targets = listOf(askDone)).single()
    ask.addInstructionsAtControlFlowLabel(askGate, """
        invoke-static {}, $prefs
        move-result-object v$quiet
        invoke-static {v$quiet}, $CONTACTS_NAG->skipAsk($PREFS)Z
        move-result v$quiet
        if-nez v$quiet, :hush_done
    """.trimIndent(), ExternalLabel("hush_done", ask.getInstruction(askDone)))

    val hidden = badge.freeLocalsAt(PATCH, badgeGate, 1, targets = listOf(badgeClear)).single()
    badge.addInstructionsAtControlFlowLabel(badgeGate, """
        invoke-static {}, $prefs
        move-result-object v$hidden
        invoke-static {v$hidden}, $CONTACTS_NAG->hideBadge($PREFS)Z
        move-result v$hidden
        if-nez v$hidden, :hush_clear
    """.trimIndent(), ExternalLabel("hush_clear", badge.getInstruction(badgeClear)))
}

private fun BytecodePatchContext.requireRuntimeHooks() {
    val owner = classDefByOrNull(CONTACTS_NAG)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public contacts nag runtime")
    for (name in listOf("skipAsk", "hideBadge")) {
        shape(owner!!.methods.count { it.name == name && it.parameterTypes.map(CharSequence::toString) == listOf(PREFS) && it.returnType == "Z" &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.implementation?.instructions?.any { instruction -> !instruction.opcode.format.isPayloadFormat } == true } == 1,
            "no callable public static runtime $name")
    }
}

/** Every index reachable from [from], normal and exceptional flow. */
private fun reach(flow: ControlFlow, from: Int): Set<Int> {
    val found = mutableSetOf<Int>()
    val pending = ArrayDeque(listOf(from))
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (!found.add(index)) continue
        pending.addAll(flow.normal[index])
        pending.addAll(flow.exceptional[index])
    }
    return found
}

/** The instruction that last wrote this register before [index], in code order. */
private fun Int.writtenLastBy(body: List<Instruction>, index: Int): Instruction? =
    (index - 1 downTo 0).map { body[it] }.firstOrNull { it.opcode.setsRegister() && it.namedRegisters().firstOrNull() == this }

/** The index a branch at [index] jumps to. */
private fun List<Instruction>.target(index: Int): Int {
    val branch = this[index] as? OffsetInstruction ?: refuse("instruction $index is no longer a branch")
    var address = 0
    val addresses = IntArray(size)
    for (at in indices) {
        addresses[at] = address
        address += this[at].codeUnits
    }
    val wanted = addresses[index] + branch.codeOffset
    return addresses.indexOfFirst { it == wanted }.takeIf { it >= 0 } ?: refuse("branch $index lands outside the method")
}

private val FIELD_WRITES = setOf(Opcode.IPUT, Opcode.IPUT_WIDE, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN, Opcode.IPUT_BYTE,
    Opcode.IPUT_CHAR, Opcode.IPUT_SHORT, Opcode.SPUT, Opcode.SPUT_WIDE, Opcode.SPUT_OBJECT, Opcode.SPUT_BOOLEAN,
    Opcode.SPUT_BYTE, Opcode.SPUT_CHAR, Opcode.SPUT_SHORT)
private fun Opcode.isFieldWrite() = this in FIELD_WRITES
private fun Instruction.isGetBoolean() =
    opcode == Opcode.INVOKE_INTERFACE && call()?.let { it.definingClass == PREFS && it.name == "getBoolean" } == true
private fun Instruction.isZero(register: Int) = (opcode == Opcode.CONST_4 || opcode == Opcode.CONST_16) &&
    namedRegisters().firstOrNull() == register && (this as NarrowLiteralInstruction).narrowLiteral == 0
private fun Method.sameAs(other: Method) = name == other.name && returnType == other.returnType &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)
private fun refuse(reason: String): Nothing =
    throw PatchException("$PATCH: $reason; refuses changed contacts prompt geometry before editing")
private fun shape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}
private fun <T> List<T>.one(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
@Suppress("unused")
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.string(): String? =
    if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) ((this as ReferenceInstruction).reference as? StringReference)?.string else null
