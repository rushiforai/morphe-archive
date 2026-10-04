package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val BUBBLE_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
internal const val BUBBLE_ROLLOUT = 36312032932401152L
/** 581 renumbered the specifier of the same rollout read. Exactly these two are accepted. */
internal const val BUBBLE_ROLLOUT_581 = 36312028637433857L
internal val BUBBLE_ROLLOUTS = setOf(BUBBLE_ROLLOUT, BUBBLE_ROLLOUT_581)
internal const val BUBBLE_ACTIVITY = "com.facebook.messaging.msys.thread.bubbles.activity.StaxThreadViewBubblesActivity"
internal const val NATIVE_BUBBLE_ROUTES = "$HOST_SCREENS->nativeBubbleRoutes()Z"
internal const val NATIVE_BUBBLE_METADATA = "hush.native_bubble_routes"
private const val MOBILE_CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"
private const val SHORTCUT_BUILDER = "Landroid/content/pm/ShortcutInfo\$Builder;"
private const val MESSAGING_STYLE = "Landroidx/core/app/NotificationCompat\$MessagingStyle;"

private fun Method.bubbleCode() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.bubbleRef() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.bubbleRegister() = (this as? OneRegisterInstruction)?.registerA
private fun List<Instruction>.jumpsTo(at: Int, target: Int) =
    take(at).sumOf { it.codeUnits } + ((get(at) as? OffsetInstruction)?.codeOffset ?: Int.MIN_VALUE) ==
        take(target).sumOf { it.codeUnits }
private fun Instruction.calls(vararg registers: Int) = this is FiveRegisterInstruction &&
    registerCount == registers.size && listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount) == registers.toList()
private fun bubbleChanged(): Nothing = throw PatchException("Messenger controls: the native bubble gate differs from the tested build")

/** A00's SDK 30 and low-memory checks must remain stock whenever no verified native override is selected. */
internal fun Method.validateBubbleEligibility() {
    val c = bubbleCode()
    val opcodes = listOf(Opcode.SGET, Opcode.CONST_16, Opcode.IF_LT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
        Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN)
    if (hookId() !in activeProfile.hooks.getValue("bubbles") || AccessFlags.STATIC.isSet(accessFlags) ||
        bubbleParameters().isNotEmpty() || returnType != "Z" || implementation?.registerCount != 3 ||
        implementation?.tryBlocks?.isNotEmpty() == true || c.map { it.opcode } != opcodes ||
        c[0].bubbleRef() != "Landroid/os/Build\$VERSION;->SDK_INT:I" || c[0].bubbleRegister() != 1 ||
        (c[1] as? NarrowLiteralInstruction)?.narrowLiteral != 30 || c[1].bubbleRegister() != 0 ||
        (c[2] as? TwoRegisterInstruction)?.let { it.registerA != 1 || it.registerB != 0 } != false ||
        !c.jumpsTo(2, 13) || c[7].bubbleRef() != "Landroid/app/ActivityManager;" ||
        c[8].bubbleRef() != "Landroid/app/ActivityManager;->isLowRamDevice()Z" || !c[8].calls(0) ||
        c[9].bubbleRegister() != 0 || c[10].bubbleRegister() != 0 || !c.jumpsTo(10, 13) ||
        (c[11] as? NarrowLiteralInstruction)?.narrowLiteral != 1 || c[11].bubbleRegister() != 0 ||
        c[12].bubbleRegister() != 0 || (c[13] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        c[13].bubbleRegister() != 0 || c[14].bubbleRegister() != 0) bubbleChanged()
}

/** Both false branches precede the rollout read. Never override the account capability or either return. */
internal fun Method.validateNativeBubbleMode() {
    val c = bubbleCode()
    val opcodes = listOf(Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT,
        Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
        Opcode.CHECK_CAST, Opcode.CONST_16, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
        Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT, Opcode.CONST_WIDE, Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE,
        Opcode.MOVE_RESULT, Opcode.RETURN, Opcode.RETURN)
    if (hookId() !in activeProfile.hooks.getValue("bubble_mode") || AccessFlags.STATIC.isSet(accessFlags) ||
        returnType != "Z" || bubbleParameters() != listOf(BUBBLE_SESSION) || implementation?.registerCount != 5 ||
        implementation?.tryBlocks?.isNotEmpty() == true || c.map { it.opcode } != opcodes ||
        c[0].bubbleRegister() != 2 || (c[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        !c[1].calls(4, 2) || c[2].bubbleRef() != activeProfile.hooks.getValue("bubbles").single() ||
        !c[2].calls(3) || c[3].bubbleRegister() != 0 || c[4].bubbleRegister() != 0 || !c.jumpsTo(4, 24) ||
        c[9].bubbleRef() != activeProfile.bubbleCapabilityGetter.substringBefore("->") || c[9].bubbleRegister() != 1 ||
        c[10].bubbleRegister() != 0 || (c[10] as? NarrowLiteralInstruction)?.narrowLiteral != 28 ||
        c[11].bubbleRef() != activeProfile.bubbleCapabilityGetter || !c[11].calls(1, 4, 0) ||
        c[12].bubbleRegister() != 0 || c[13].bubbleRegister() != 0 || !c.jumpsTo(13, 24) ||
        c[18].bubbleRegister() != 2 || c[19].bubbleRegister() != 0 ||
        (c[19] as? WideLiteralInstruction)?.wideLiteral?.let { it in BUBBLE_ROLLOUTS } != true ||
        c[20].bubbleRegister() != 2 || c[20].bubbleRef() != MOBILE_CONFIG ||
        c[21].bubbleRef() != activeProfile.bubbleRolloutGetter || !c[21].calls(2, 0, 1) ||
        c[22].bubbleRegister() != 0 || c[23].bubbleRegister() != 0 || c[24].bubbleRegister() != 2) bubbleChanged()
}

internal fun MutableMethod.injectNativeBubbleMode() {
    validateNativeBubbleMode()
    // The account check has already returned false if unavailable. Only its later rollout result is changed.
    addInstructions(23, "invoke-static {v0}, $SETTINGS->nativeBubbleRollout(Z)Z\nmove-result v0")
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->forceChatHeads()Z
        move-result v0
        if-eqz v0, :stock_bubble_mode
        const/4 v0, 0x0
        return v0
    """.trimIndent(), ExternalLabel("stock_bubble_mode", getInstruction(0)))
}

internal fun Method.validateNativeBubbleRoutesStub() {
    val c = bubbleCode()
    if (hookId() != NATIVE_BUBBLE_ROUTES || !AccessFlags.STATIC.isSet(accessFlags) || c.size != 2 ||
        c[0].opcode != Opcode.CONST_4 || (c[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        c[1].opcode != Opcode.RETURN || c[0].bubbleRegister() != c[1].bubbleRegister())
        throw PatchException("Messenger controls: the extension's native bubble capability differs from this patch version")
}

/** Validate the two host targets and compiled capability before editing any of them. */
internal fun injectNativeBubbles(eligibility: MutableMethod, mode: MutableMethod, capability: MutableMethod, routes: Boolean) {
    eligibility.validateBubbleEligibility()
    mode.validateNativeBubbleMode()
    capability.validateNativeBubbleRoutesStub()
    if (!routes) return
    eligibility.injectSwitch("enableBubbles", "0x1")
    mode.injectNativeBubbleMode()
    capability.replaceInstruction(0, "const/4 v${capability.bubbleCode()[0].bubbleRegister()}, 0x1")
}

/** Root Mount retains this stock declaration; aliases, separate processes and disabled activities are unsupported. */
internal fun Document.hasNativeBubbleActivity(): Boolean {
    val apps = getElementsByTagName("application")
    if (apps.length != 1) return false
    val app = apps.item(0) as Element
    val entries = (0 until app.childNodes.length).mapNotNull { app.childNodes.item(it) as? Element }
        .filter { it.tagName in setOf("activity", "activity-alias") && it.getAttribute("android:name") == BUBBLE_ACTIVITY }
    val activity = entries.singleOrNull() ?: return false
    return activity.tagName == "activity" && activity.getAttribute("android:exported") == "false" &&
        activity.getAttribute("android:allowEmbedded") == "true" && activity.getAttribute("android:resizeableActivity") == "true" &&
        activity.getAttribute("android:enabled") != "false" && activity.getAttribute("android:process").isEmpty() &&
        activity.getAttribute("android:permission").isEmpty()
}

internal fun Document.requireNativeBubbleRoutesAbsent() {
    val application = getElementsByTagName("application").item(0) as Element
    val metadata = application.getElementsByTagName("meta-data")
    if ((0 until metadata.length).any { (metadata.item(it) as Element).getAttribute("android:name") == NATIVE_BUBBLE_METADATA })
        throw PatchException("Messenger controls: native bubble capability is already installed")
}

internal fun Document.addNativeBubbleRoutesMetadata() {
    requireNativeBubbleRoutesAbsent()
    val application = getElementsByTagName("application").item(0) as Element
    application.appendChild(createElement("meta-data").apply {
        setAttribute("android:name", NATIVE_BUBBLE_METADATA)
        setAttribute("android:value", "true")
    })
}

/** 581 reads the gate through a static (session, lazy holder) helper. Only one returning the gate's own answer counts. */
private fun Method.bubbleGateHelper(gate: String): Boolean {
    val c = bubbleCode()
    val p = bubbleParameters()
    val opcodes = listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST,
        Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN)
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || p.size != 2 || p[0] != BUBBLE_SESSION ||
        implementation?.registerCount != 3 || implementation?.tryBlocks?.isEmpty() != true || c.map { it.opcode } != opcodes) return false
    val read = c[0] as? TwoRegisterInstruction ?: return false
    val holder = (c[0] as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    val fetch = (c[1] as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return read.registerA == 0 && read.registerB == 2 && holder.definingClass == p[1] && fetch.definingClass == holder.type &&
        fetch.name == "get" && fetch.parameterTypes.isEmpty() && fetch.returnType == "Ljava/lang/Object;" && c[1].calls(0) &&
        c[2].bubbleRegister() == 0 && c[3].bubbleRegister() == 0 && c[3].bubbleRef() == gate.substringBefore("->") &&
        c[4].bubbleRef() == gate && c[4].calls(0, 1) && c[5].bubbleRegister() == 0 && c[6].bubbleRegister() == 0
}

/** Discover only existing, connected host routes; these methods are inspected, never rewritten. */
internal fun findNativeBubbleRoutes(classes: List<ClassDef>, gate: String): String? {
    val byType = classes.associateBy { it.type }
    val activity = byType["L${BUBBLE_ACTIVITY.replace('.', '/')};"] ?: return null
    if (activity.superclass != "Lcom/facebook/messaging/msys/thread/fragment/MsysThreadViewActivity;" ||
        activity.methods.none { it.name == "onPostResume" && it.bubbleCode().any { i -> i.bubbleRef() == gate } }) return null
    val shortcuts = mutableListOf<Method>()
    val attachments = mutableListOf<Method>()
    val conversations = mutableListOf<Method>()
    for (cls in classes) for (m in cls.methods) {
        val c = m.bubbleCode()
        val refs = c.mapNotNull { it.bubbleRef() }.toSet()
        if (m.bubbleParameters() == listOf("Landroid/content/Context;", "Landroid/graphics/Bitmap;",
                "Lcom/facebook/messaging/model/threadkey/ThreadKey;", "Ljava/lang/String;") &&
            "thread_shortcut_" in refs && "$SHORTCUT_BUILDER->setPerson(Landroid/app/Person;)$SHORTCUT_BUILDER" in refs &&
            "$SHORTCUT_BUILDER->setIntent(Landroid/content/Intent;)$SHORTCUT_BUILDER" in refs &&
            "$SHORTCUT_BUILDER->build()Landroid/content/pm/ShortcutInfo;" in refs) {
            val set = c.indexOfFirst { it.bubbleRef() == "$SHORTCUT_BUILDER->setLongLived(Z)$SHORTCUT_BUILDER" }
            val call = c.getOrNull(set) as? FiveRegisterInstruction
            if (call != null && call.registerCount == 2 && m.implementation?.tryBlocks?.isEmpty() == true) {
                val write = c.take(set).indexOfLast { it.opcode.setsRegister() && it.bubbleRegister() == call.registerD }
                if (write in 0..2 && c[write].opcode == Opcode.CONST_4 &&
                    (c[write] as? NarrowLiteralInstruction)?.narrowLiteral == 1) shortcuts.add(m)
            }
        }
        if ("shouldAttachBubbleMetadataToNotification" in refs && "attach_bubble_metadata" in refs &&
            (gate in refs || c.any { i -> i.opcode == Opcode.INVOKE_STATIC &&
                ((i as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                    byType[ref.definingClass]?.methods?.singleOrNull { it.hookId() == ref.toString() }?.bubbleGateHelper(gate)
                } == true }) &&
            c.any { it.opcode == Opcode.IPUT_OBJECT && (it as? ReferenceInstruction)?.reference is FieldReference }) attachments.add(m)
        if (MESSAGING_STYLE in refs && "Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;" in refs &&
            "Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V" in refs) conversations.add(m)
    }
    val shortcut = shortcuts.singleOrNull() ?: return null
    val attachment = attachments.singleOrNull() ?: return null
    val conversation = conversations.singleOrNull() ?: return null
    val attachedFields = attachment.bubbleCode().filter { it.opcode == Opcode.IPUT_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
    val field = attachedFields.singleOrNull() ?: return null
    val conversationCode = conversation.bubbleCode()
    if (conversationCode.none { it.opcode == Opcode.IPUT_OBJECT && it.bubbleRef() == field.toString() } ||
        conversationCode.none { it.opcode == Opcode.IPUT_OBJECT &&
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { f ->
                f.definingClass == field.definingClass && f.type == "Ljava/lang/String;"
            } == true }) return null
    val builder = byType[field.definingClass] ?: return null
    val roots = builder.methods.filter { it.returnType == "Landroid/app/Notification;" }
    fun reaches(api: String): Boolean {
        val seen = mutableMapOf<String, Int>()
        fun visit(m: Method, depth: Int): Boolean {
            if ((seen[m.hookId()] ?: -1) >= depth) return false
            seen[m.hookId()] = depth
            val calls = m.bubbleCode().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            if (calls.any { it.toString() == api }) return true
            if (depth == 0) return false
            return calls.any { ref -> byType[ref.definingClass]?.methods?.singleOrNull { it.hookId() == ref.toString() }
                ?.let { visit(it, depth - 1) } == true }
        }
        return roots.any { visit(it, 4) }
    }
    if (!reaches("Landroid/app/Notification\$Builder;->setBubbleMetadata(Landroid/app/Notification\$BubbleMetadata;)Landroid/app/Notification\$Builder;") ||
        !reaches("Landroid/app/Notification\$Builder;->setShortcutId(Ljava/lang/String;)Landroid/app/Notification\$Builder;") ||
        !connectedBubbleValues(classes, shortcut, attachment, conversation, field)) return null
    return listOf(attachment.hookId(), shortcut.hookId(), conversation.hookId()).joinToString("|")
}

private const val SHORTCUT = "Landroid/content/pm/ShortcutInfo;"
private const val THREAD_KEY = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
private const val NOTIFICATION_BUILDER = "Landroid/app/Notification\$Builder;"
private const val PLATFORM_METADATA = "Landroid/app/Notification\$BubbleMetadata;"
private const val METADATA_BUILDER = "Landroid/app/Notification\$BubbleMetadata\$Builder;"
private const val PENDING_INTENT = "Landroid/app/PendingIntent;"

private fun MethodReference.bubbleParameters() = parameterTypes.map { it.toString() }

private fun Instruction.bubbleArgs(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/** Reaching definitions, including branch joins. Unknown writes and excessive work fail closed. */
private class BubbleValues(val method: Method) {
    val code = method.bubbleCode()
    private val predecessors = List(code.size) { mutableListOf<Int>() }
    private val parameterStart = (method.implementation?.registerCount ?: 0) -
        method.bubbleParameters().sumOf { if (it == "J" || it == "D") 2 else 1 } -
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    private val valid: Boolean
    init {
        val offsets = code.runningFold(0) { offset, i -> offset + i.codeUnits }.dropLast(1)
        val indices = offsets.withIndex().associate { it.value to it.index }
        var supported = code.size in 1..2048
        if (code.isNotEmpty()) predecessors[0].add(-1)
        for ((at, instruction) in code.withIndex()) {
            val op = instruction.opcode.toString()
            if ("SWITCH" in op || "PAYLOAD" in op) supported = false
            if (op.startsWith("INVOKE") && ((instruction as? ReferenceInstruction)?.reference !is MethodReference ||
                "POLYMORPHIC" in op)) supported = false
            if (op.startsWith("IF_") || op.startsWith("GOTO")) {
                val target = (instruction as? OffsetInstruction)?.let { indices[offsets[at] + it.codeOffset] }
                if (target == null) supported = false else predecessors[target].add(at)
            }
            if (!op.startsWith("GOTO") && !op.startsWith("RETURN") && op != "THROW" && at + 1 < code.size)
                predecessors[at + 1].add(at)
        }
        val normal = predecessors.map { it.toList() }
        val blocks = method.implementation?.tryBlocks.orEmpty()
        if (blocks.size > 32) supported = false
        var edges = normal.sumOf { it.size }
        for (block in blocks.take(32)) for (handler in block.exceptionHandlers) {
            val target = indices[handler.handlerCodeAddress]
            if (target == null) { supported = false; continue }
            for (at in code.indices) if (offsets[at] in block.startCodeAddress until block.startCodeAddress + block.codeUnitCount &&
                code[at].opcode.canThrow()) {
                // A throwing instruction may not write its destination. Use its incoming values.
                edges += normal[at].size
                if (edges > 8192) supported = false else predecessors[target].addAll(normal[at])
            }
        }
        valid = supported
    }
    fun parameter(type: String): Int? {
        var register = parameterStart + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
        val found = mutableListOf<Int>()
        for (p in method.bubbleParameters()) {
            if (p == type) found.add(register)
            register += if (p == "J" || p == "D") 2 else 1
        }
        return found.singleOrNull()
    }
    fun self() = parameterStart
    fun parameterAt(index: Int) = parameterStart + (if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1) +
        method.bubbleParameters().take(index).sumOf { if (it == "J" || it == "D") 2 else 1 }
    fun definitions(before: Int, register: Int): Set<Int> {
        if (!valid || before !in code.indices) return emptySet()
        val pending = ArrayDeque<Pair<Int, Int>>()
        pending.add(before to register)
        val seen = mutableSetOf<Pair<Int, Int>>()
        val result = mutableSetOf<Int>()
        while (pending.isNotEmpty()) {
            val (at, r) = pending.removeFirst()
            if (!seen.add(at to r)) continue
            if (seen.size > 4096 || result.size > 8) return emptySet()
            if (predecessors[at].isEmpty()) return emptySet()
            for (previous in predecessors[at]) {
                if (previous < 0) {
                    if (r < parameterStart) return emptySet()
                    result.add(-r - 1)
                    continue
                }
                val i = code[previous]
                if (!i.opcode.setsRegister() || i.bubbleRegister() != r) {
                    pending.add(previous to r)
                } else if (i.opcode.toString().startsWith("MOVE") && i is TwoRegisterInstruction) {
                    pending.add(previous to i.registerB)
                } else if (i.opcode == Opcode.CHECK_CAST) {
                    pending.add(previous to r)
                } else {
                    val call = code.getOrNull(previous - 1)
                    val ref = (call as? ReferenceInstruction)?.reference as? MethodReference
                    if (i.opcode == Opcode.MOVE_RESULT_OBJECT && ref != null &&
                        ref.definingClass in setOf(SHORTCUT_BUILDER, NOTIFICATION_BUILDER, METADATA_BUILDER, "Landroid/content/Intent;") &&
                        ref.returnType == ref.definingClass && ref.name != "build" && call.bubbleArgs().isNotEmpty())
                        pending.add(previous - 1 to call.bubbleArgs().first())
                    else result.add(previous)
                }
            }
        }
        return result
    }
    fun key(before: Int, register: Int, depth: Int = 8): String? {
        if (depth == 0) return null
        val definitions = definitions(before, register)
        if (definitions.isEmpty()) return null
        return definitions.sorted().map { at ->
            if (at < 0) "p" + (-at - 1)
            else {
                val i = code[at]
                if (i.opcode == Opcode.IGET_OBJECT && i is TwoRegisterInstruction)
                    i.bubbleRef() + "[" + (key(at, i.registerB, depth - 1) ?: return null) + "]"
                else i.opcode.toString() + ":" + at + ":" + i.bubbleRef()
            }
        }.joinToString("|")
    }
    fun callValue(before: Int, register: Int): Int? = definitions(before, register).singleOrNull()?.let { at ->
        if (at > 0 && code[at].opcode == Opcode.MOVE_RESULT_OBJECT && code[at - 1].opcode.toString().startsWith("INVOKE")) at - 1 else null
    }
    fun fieldValue(before: Int, register: Int): Pair<FieldReference, Int>? = definitions(before, register).singleOrNull()?.let { at ->
        val i = code.getOrNull(at)
        if (i?.opcode == Opcode.IGET_OBJECT && i is TwoRegisterInstruction)
            ((i as ReferenceInstruction).reference as? FieldReference)?.let { it to i.registerB } else null
    }
    fun fieldKey(before: Int, register: Int): Pair<FieldReference, String>? {
        val at = definitions(before, register).singleOrNull() ?: return null
        val field = fieldValue(before, register) ?: return null
        return field.first to (key(at, field.second) ?: return null)
    }
    fun fieldDefinitions(before: Int, register: Int): Set<Int> {
        val at = definitions(before, register).singleOrNull() ?: return emptySet()
        val read = fieldValue(before, register) ?: return emptySet()
        return definitions(at, read.second)
    }
    fun returns(expected: String?) = expected != null && code.indices.any { at ->
        code[at].opcode == Opcode.RETURN_OBJECT && key(at, code[at].bubbleRegister()!!) == expected
    }
    fun calls() = if (!valid) emptyList() else code.indices.filter { code[it].opcode.toString().startsWith("INVOKE") }
    fun reference(at: Int) = (code[at] as? ReferenceInstruction)?.reference as? MethodReference
    fun argument(at: Int, argument: Int) = code[at].bubbleArgs().getOrNull(argument)
}

private fun bubbleShortcutField(byType: Map<String, ClassDef>, shortcut: Method): FieldReference? {
    fun target(ref: MethodReference?) = ref?.let { byType[it.definingClass]?.methods?.singleOrNull { m -> m.hookId() == it.toString() } }
    val s = BubbleValues(shortcut)
    val build = s.calls().singleOrNull { s.reference(it)?.toString() == SHORTCUT_BUILDER + "->build()" + SHORTCUT } ?: return null
    val builderKey = s.key(build, s.argument(build, 0)!!) ?: return null
    for ((name, type) in listOf("setLongLived" to "Z", "setPerson" to "Landroid/app/Person;", "setIntent" to "Landroid/content/Intent;")) {
        val at = s.calls().singleOrNull { s.reference(it)?.name == name && s.reference(it)?.definingClass == SHORTCUT_BUILDER } ?: return null
        if (s.key(at, s.argument(at, 0)!!) != builderKey) return null
        val arg = s.argument(at, 1) ?: return null
        if (name == "setLongLived") {
            val d = s.definitions(at, arg).singleOrNull() ?: return null
            if (d < 0 || (s.code[d] as? NarrowLiteralInstruction)?.narrowLiteral != 1) return null
        } else if (s.callValue(at, arg)?.let { s.reference(it)?.returnType == type } != true) return null
    }
    val containerCtor = s.calls().singleOrNull { at ->
        val ref = s.reference(at)
        ref?.name == "<init>" && ref.definingClass == shortcut.returnType &&
            ref.bubbleParameters().toList().contains(SHORTCUT) &&
            s.argument(at, ref.bubbleParameters().indexOf(SHORTCUT) + 1)?.let { s.callValue(at, it) == build } == true
    } ?: return null
    if (!s.returns(s.key(containerCtor, s.argument(containerCtor, 0)!!))) return null
    val constructor = target(s.reference(containerCtor)) ?: return null
    val cf = BubbleValues(constructor)
    val shortcutRegister = cf.parameter(SHORTCUT) ?: return null
    val shortcutField = cf.code.indices.mapNotNull { at ->
        val i = cf.code[at] as? TwoRegisterInstruction ?: return@mapNotNull null
        val ref = (i as? ReferenceInstruction)?.reference as? FieldReference ?: return@mapNotNull null
        ref.takeIf { cf.code[at].opcode == Opcode.IPUT_OBJECT && it.type == SHORTCUT &&
            cf.key(at, i.registerA) == cf.key(0, shortcutRegister) && cf.key(at, i.registerB) == cf.key(0, cf.self()) }
    }.singleOrNull() ?: return null
    return shortcutField
}

private fun connectedBubbleValues(classes: List<ClassDef>, shortcut: Method, attachment: Method,
                                  conversation: Method, metadata: FieldReference): Boolean {
    val byType = classes.associateBy { it.type }
    fun target(ref: MethodReference?) = ref?.let { byType[it.definingClass]?.methods?.singleOrNull { m -> m.hookId() == it.toString() } }
    fun flow(m: Method) = BubbleValues(m)
    fun resultField(f: BubbleValues, at: Int, r: Int, type: String) =
        f.fieldKey(at, r)?.takeIf { it.first.type == type }
    fun returnsCall(m: Method, id: String, depth: Int, seen: MutableMap<String, Int> = mutableMapOf()): Boolean {
        if (m.hookId() == id || (m.definingClass == shortcut.definingClass && m.returnType == shortcut.returnType &&
            bubbleShortcutField(byType, m)?.toString() == bubbleShortcutField(byType, shortcut)?.toString())) return true
        if (depth == 0 || (seen[m.hookId()] ?: -1) >= depth) return false
        seen[m.hookId()] = depth
        val f = flow(m)
        return f.code.indices.filter { f.code[it].opcode == Opcode.RETURN_OBJECT }.any { at ->
            f.definitions(at, f.code[at].bubbleRegister()!!).any { definition ->
                definition > 0 && f.code[definition].opcode == Opcode.MOVE_RESULT_OBJECT &&
                    target(f.reference(definition - 1))?.let { returnsCall(it, id, depth - 1, seen) } == true
            }
        }
    }
    val shortcutField = bubbleShortcutField(byType, shortcut) ?: return false
    val a = flow(attachment)
    val c = flow(conversation)
    val attachmentStore = a.code.indices.singleOrNull { a.code[it].opcode == Opcode.IPUT_OBJECT && a.code[it].bubbleRef() == metadata.toString() } ?: return false
    val conversationStore = c.code.indices.singleOrNull { c.code[it].opcode == Opcode.IPUT_OBJECT && c.code[it].bubbleRef() == metadata.toString() } ?: return false
    fun factory(f: BubbleValues, store: Int, container: String): MethodReference? {
        val write = f.code[store] as TwoRegisterInstruction
        val pack = f.callValue(store, write.registerA) ?: return null
        val packRef = f.reference(pack) ?: return null
        if (packRef.returnType != metadata.type || packRef.bubbleParameters().isNotEmpty()) return null
        val make = f.argument(pack, 0)?.let { f.callValue(pack, it) } ?: return null
        val ref = f.reference(make) ?: return null
        val arg = ref.bubbleParameters().indexOf(shortcut.returnType) + if (f.code[make].opcode.toString().startsWith("INVOKE_STATIC")) 0 else 1
        if (ref.returnType != packRef.definingClass || ref.bubbleParameters().count { it == shortcut.returnType } != 1 ||
            f.argument(make, arg)?.let { f.key(make, it) } != container) return null
        return ref
    }
    val ap = a.parameter(shortcut.returnType) ?: return false
    val notificationParameter = a.parameter(metadata.definingClass) ?: return false
    if (a.key(attachmentStore, (a.code[attachmentStore] as TwoRegisterInstruction).registerB) != a.key(0, notificationParameter)) return false
    val attachedFactory = factory(a, attachmentStore, a.key(0, ap) ?: return false) ?: return false
    val push = c.calls().singleOrNull { c.reference(it)?.toString() == "Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(" + SHORTCUT + ")V" } ?: return false
    val pushed = c.argument(push, 1)?.let { c.fieldKey(push, it) } ?: return false
    if (pushed.first.toString() != shortcutField.toString()) return false
    val ids = c.calls().filter { c.reference(it)?.toString() == SHORTCUT + "->getId()Ljava/lang/String;" }
    val idStores = c.code.indices.filter { at ->
        val i = c.code[at] as? TwoRegisterInstruction
        c.code[at].opcode == Opcode.IPUT_OBJECT && ((i as? ReferenceInstruction)?.reference as? FieldReference)?.let {
            it.definingClass == metadata.definingClass && it.type == "Ljava/lang/String;"
        } == true && c.callValue(at, i.registerA) in ids
    }
    val idStore = idStores.singleOrNull() ?: return false
    val idWrite = c.code[idStore] as TwoRegisterInstruction
    val idCall = c.callValue(idStore, idWrite.registerA)!!
    val readArgument = c.argument(idCall, 0) ?: return false
    val idRead = c.fieldKey(idCall, readArgument) ?: return false
    if (idRead.first.toString() != pushed.first.toString() ||
        !c.fieldDefinitions(idCall, readArgument).containsAll(c.fieldDefinitions(push, c.argument(push, 1)!!)) ||
        c.fieldDefinitions(idCall, readArgument).any { d -> d <= 0 || c.code[d].opcode != Opcode.MOVE_RESULT_OBJECT ||
            target(c.reference(d - 1))?.let { returnsCall(it, shortcut.hookId(), 5) } != true } ||
        c.key(idStore, idWrite.registerB) != c.key(conversationStore, (c.code[conversationStore] as TwoRegisterInstruction).registerB) ||
        factory(c, conversationStore, idRead.second)?.toString() != attachedFactory.toString()) return false
    val idField = ((c.code[idStore] as ReferenceInstruction).reference as FieldReference)
    val notificationKey = c.key(idStore, idWrite.registerB) ?: return false
    if (c.calls().none { at ->
        c.reference(at)?.definingClass == metadata.definingClass &&
            c.argument(at, 0)?.let { c.key(at, it) } == notificationKey &&
            c.argument(at, 1)?.let { r -> c.definitions(at, r).singleOrNull()?.let { d ->
                d >= 0 && c.code[d].opcode == Opcode.NEW_INSTANCE && c.code[d].bubbleRef() == MESSAGING_STYLE
            } } == true
    }) return false
    val make = target(attachedFactory) ?: return false
    val mf = flow(make)
    val containerParameter = mf.parameter(shortcut.returnType) ?: return false
    val packAt = a.callValue(attachmentStore, (a.code[attachmentStore] as TwoRegisterInstruction).registerA) ?: return false
    val packMethod = target(a.reference(packAt)) ?: return false
    val pending = mf.code.indices.mapNotNull { at ->
        val i = mf.code[at] as? TwoRegisterInstruction ?: return@mapNotNull null
        val field = (i as? ReferenceInstruction)?.reference as? FieldReference ?: return@mapNotNull null
        if (mf.code[at].opcode != Opcode.IPUT_OBJECT ||
            field.type != PENDING_INTENT || !mf.returns(mf.key(at, i.registerB))) return@mapNotNull null
        val call = mf.callValue(at, i.registerA) ?: return@mapNotNull null
        val ref = mf.reference(call) ?: return@mapNotNull null
        val index = ref.bubbleParameters().indexOf(THREAD_KEY) + if (mf.code[call].opcode.toString().startsWith("INVOKE_STATIC")) 0 else 1
        if (ref.returnType != PENDING_INTENT || ref.bubbleParameters().count { it == THREAD_KEY } != 1 ||
            mf.argument(call, index)?.let { resultField(mf, call, it, THREAD_KEY) }?.let {
                it.first.definingClass == shortcut.returnType && it.second == mf.key(0, containerParameter)
            } != true) return@mapNotNull null
        bubbleMetadataField(byType, packMethod, field)
    }
    if (pending.none { bubbleNotificationBridge(byType, metadata, idField, it) }) return false
    // Arrival must use a returned shortcut, write its ID, attach metadata to that same builder, then build it.
    return classes.any { cls -> cls.methods.any { m ->
        if (m.bubbleCode().none { it.opcode.toString().startsWith("INVOKE") && it.bubbleRef() == attachment.hookId() }) return@any false
        val f = flow(m)
        f.calls().any { at ->
            if (f.reference(at)?.toString() != attachment.hookId()) return@any false
            val args = f.code[at].bubbleArgs()
            val wrapper = args.getOrNull(2)?.let { f.key(at, it) } ?: return@any false
            val producerAt = args.getOrNull(4)?.let { f.callValue(at, it) } ?: return@any false
            val producer = target(f.reference(producerAt)) ?: return@any false
            if (producer.returnType != shortcut.returnType || !returnsCall(producer, shortcut.hookId(), 5) ||
                f.calls().none { site -> site > at && bubbleBuildCall(byType, f, site, wrapper, metadata.definingClass) }) return@any false
            val p = flow(producer)
            val parent = p.parameter(metadata.definingClass) ?: return@any false
            val passed = producer.bubbleParameters().indexOf(metadata.definingClass) + if (AccessFlags.STATIC.isSet(producer.accessFlags)) 0 else 1
            if (f.argument(producerAt, passed)?.let { f.key(producerAt, it) } != wrapper) return@any false
            p.code.indices.any { site ->
                val i = p.code[site] as? TwoRegisterInstruction ?: return@any false
                if (p.code[site].opcode != Opcode.IPUT_OBJECT || p.code[site].bubbleRef() != idField.toString() ||
                    p.key(site, i.registerB) != p.key(0, parent)) return@any false
                val id = p.callValue(site, i.registerA) ?: return@any false
                val read = p.argument(id, 0)?.let { p.fieldKey(id, it) } ?: return@any false
                p.reference(id)?.toString() == SHORTCUT + "->getId()Ljava/lang/String;" &&
                    read.first.toString() == shortcutField.toString() && p.returns(read.second)
            }
        }
    } }
}

private fun bubbleBuildCall(byType: Map<String, ClassDef>, f: BubbleValues, at: Int, wrapper: String, type: String): Boolean {
    val ref = f.reference(at) ?: return false
    if (ref.returnType != "Landroid/app/Notification;") return false
    if (ref.definingClass == type) return f.argument(at, 0)?.let { f.key(at, it) } == wrapper
    val index = ref.bubbleParameters().indexOf(type) + if (f.code[at].opcode.toString().startsWith("INVOKE_STATIC")) 0 else 1
    if (ref.bubbleParameters().count { it == type } != 1 || f.argument(at, index)?.let { f.key(at, it) } != wrapper) return false
    val helper = byType[ref.definingClass]?.methods?.singleOrNull { it.hookId() == ref.toString() } ?: return false
    val h = BubbleValues(helper)
    val parent = h.parameter(type) ?: return false
    return h.calls().any { site -> h.reference(site)?.definingClass == type &&
        h.reference(site)?.returnType == "Landroid/app/Notification;" && h.argument(site, 0)?.let { h.key(site, it) } == h.key(0, parent) &&
        h.code.indices.any { r -> h.code[r].opcode == Opcode.RETURN_OBJECT && h.callValue(r, h.code[r].bubbleRegister()!!) == site }
    }
}

private fun bubbleStoredField(byType: Map<String, ClassDef>, constructor: Method, index: Int, depth: Int = 2): FieldReference? {
    val f = BubbleValues(constructor)
    val value = f.key(0, f.parameterAt(index)) ?: return null
    val direct = f.code.indices.mapNotNull { at ->
        val i = f.code[at] as? TwoRegisterInstruction ?: return@mapNotNull null
        ((i as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf {
            f.code[at].opcode == Opcode.IPUT_OBJECT && it.type == PENDING_INTENT &&
                f.key(at, i.registerA) == value && f.key(at, i.registerB) == f.key(0, f.self())
        }
    }
    if (direct.isNotEmpty()) return direct.singleOrNull()
    if (depth == 0) return null
    return f.calls().mapNotNull { at ->
        val ref = f.reference(at) ?: return@mapNotNull null
        if (ref.name != "<init>" || ref.definingClass != constructor.definingClass ||
            f.argument(at, 0)?.let { f.key(at, it) } != f.key(0, f.self())) return@mapNotNull null
        val forwarded = ref.bubbleParameters().indices.singleOrNull { n ->
            ref.bubbleParameters()[n] == PENDING_INTENT && f.argument(at, n + 1)?.let { f.key(at, it) } == value
        } ?: return@mapNotNull null
        byType[ref.definingClass]?.methods?.singleOrNull { it.hookId() == ref.toString() }
            ?.let { bubbleStoredField(byType, it, forwarded, depth - 1) }
    }.singleOrNull()
}

private fun bubbleMetadataField(byType: Map<String, ClassDef>, pack: Method, pending: FieldReference): FieldReference? {
    val f = BubbleValues(pack)
    return f.calls().mapNotNull { at ->
        val ref = f.reference(at) ?: return@mapNotNull null
        val index = ref.bubbleParameters().indexOf(PENDING_INTENT)
        if (ref.name != "<init>" || ref.definingClass != pack.returnType || index < 0 ||
            !f.returns(f.argument(at, 0)?.let { f.key(at, it) }) ||
            f.argument(at, index + 1)?.let { f.fieldKey(at, it) }?.let {
                it.first.toString() == pending.toString() && it.second == f.key(0, f.self())
            } != true) return@mapNotNull null
        byType[ref.definingClass]?.methods?.singleOrNull { it.hookId() == ref.toString() }
            ?.let { bubbleStoredField(byType, it, index) }
    }.singleOrNull()
}

private fun bubbleConversion(byType: Map<String, ClassDef>, conversion: Method, pending: FieldReference, depth: Int = 3): Boolean {
    val f = BubbleValues(conversion)
    val parent = f.parameter(pending.definingClass) ?: return false
    for (at in f.calls()) {
        val ref = f.reference(at) ?: continue
        if (ref.toString() == METADATA_BUILDER + "-><init>(" + PENDING_INTENT + "Landroid/graphics/drawable/Icon;)V") {
            val read = f.argument(at, 1)?.let { f.fieldKey(at, it) } ?: continue
            val receiver = f.argument(at, 0) ?: continue
            if (read.first.toString() != pending.toString() || read.second != f.key(0, parent)) continue
            if (f.calls().any { site -> f.reference(site)?.toString() == METADATA_BUILDER + "->build()" + PLATFORM_METADATA &&
                f.argument(site, 0)?.let { f.definitions(site, it).containsAll(f.definitions(at, receiver)) } == true &&
                f.code.indices.any { r -> f.code[r].opcode == Opcode.RETURN_OBJECT &&
                    f.callValue(r, f.code[r].bubbleRegister()!!) == site } }) return true
        } else if (depth > 0 && ref.returnType == PLATFORM_METADATA && ref.bubbleParameters().toList() == listOf(pending.definingClass) &&
            f.argument(at, 0)?.let { f.key(at, it) } == f.key(0, parent) &&
            f.code.indices.any { r -> f.code[r].opcode == Opcode.RETURN_OBJECT &&
                f.definitions(r, f.code[r].bubbleRegister()!!).contains(at + 1) }) {
            val target = byType[ref.definingClass]?.methods?.singleOrNull { it.hookId() == ref.toString() } ?: continue
            if (bubbleConversion(byType, target, pending, depth - 1)) return true
        }
    }
    return false
}

private fun bubbleNotificationBridge(byType: Map<String, ClassDef>, metadata: FieldReference, id: FieldReference, pending: FieldReference): Boolean {
    fun target(ref: MethodReference?) = ref?.let { byType[it.definingClass]?.methods?.singleOrNull { m -> m.hookId() == it.toString() } }
    val root = byType[metadata.definingClass]?.methods?.singleOrNull {
        it.returnType == "Landroid/app/Notification;" && it.bubbleParameters().isEmpty()
    } ?: return false
    val r = BubbleValues(root)
    val build = r.calls().singleOrNull { r.reference(it)?.toString() == NOTIFICATION_BUILDER + "->build()Landroid/app/Notification;" } ?: return false
    if (r.code.indices.none { at -> r.code[at].opcode == Opcode.RETURN_OBJECT && r.callValue(at, r.code[at].bubbleRegister()!!) == build }) return false
    val builder = r.argument(build, 0)?.let { r.fieldKey(build, it) } ?: return false
    val ctorAt = r.calls().singleOrNull { at ->
        r.reference(at)?.name == "<init>" && r.reference(at)?.definingClass == builder.first.definingClass &&
            r.argument(at, 0)?.let { r.key(at, it) } == builder.second &&
            r.argument(at, 1)?.let { r.key(at, it) } == r.key(0, r.self())
    } ?: return false
    val constructor = target(r.reference(ctorAt)) ?: return false
    val f = BubbleValues(constructor)
    val parent = f.parameter(metadata.definingClass) ?: return false
    val platformStore = f.code.indices.singleOrNull { at -> f.code[at].opcode == Opcode.IPUT_OBJECT && f.code[at].bubbleRef() == builder.first.toString() } ?: return false
    val write = f.code[platformStore] as TwoRegisterInstruction
    val value = f.definitions(platformStore, write.registerA).singleOrNull() ?: return false
    if (value < 0 || f.code[value].opcode != Opcode.NEW_INSTANCE || f.code[value].bubbleRef() != NOTIFICATION_BUILDER ||
        f.key(platformStore, write.registerB) != f.key(0, f.self())) return false
    val platformKey = builder.first.toString() + "[" + f.key(0, f.self()) + "]"
    fun reads(at: Int, register: Int, field: FieldReference) =
        f.fieldKey(at, register)?.let { it.first.toString() == field.toString() && it.second == f.key(0, parent) } == true
    val shortcut = f.calls().singleOrNull { f.reference(it)?.toString() == NOTIFICATION_BUILDER + "->setShortcutId(Ljava/lang/String;)" + NOTIFICATION_BUILDER } ?: return false
    if (f.argument(shortcut, 0)?.let { f.key(shortcut, it) } != platformKey ||
        f.argument(shortcut, 1)?.let { reads(shortcut, it, id) } != true) return false
    return f.calls().any { at ->
        val ref = f.reference(at) ?: return@any false
        if (ref.bubbleParameters().toList() != listOf(PLATFORM_METADATA, NOTIFICATION_BUILDER) || ref.returnType != "V") return@any false
        val args = f.code[at].bubbleArgs()
        if (args.size != 2 || f.key(at, args[1]) != platformKey) return@any false
        val convert = f.callValue(at, args[0]) ?: return@any false
        val conversion = f.reference(convert) ?: return@any false
        if (conversion.bubbleParameters().toList() != listOf(metadata.type) || conversion.returnType != PLATFORM_METADATA ||
            f.argument(convert, 0)?.let { reads(convert, it, metadata) } != true) return@any false
        if (target(conversion)?.let { bubbleConversion(byType, it, pending) } != true) return@any false
        val delegate = target(ref) ?: return@any false
        val d = BubbleValues(delegate)
        val mp = d.parameter(PLATFORM_METADATA) ?: return@any false
        val bp = d.parameter(NOTIFICATION_BUILDER) ?: return@any false
        d.calls().any { site ->
            d.reference(site)?.toString() == NOTIFICATION_BUILDER + "->setBubbleMetadata(" + PLATFORM_METADATA + ")" + NOTIFICATION_BUILDER &&
                d.argument(site, 0)?.let { d.key(site, it) } == d.key(0, bp) &&
                d.argument(site, 1)?.let { d.key(site, it) } == d.key(0, mp)
        }
    }
}
