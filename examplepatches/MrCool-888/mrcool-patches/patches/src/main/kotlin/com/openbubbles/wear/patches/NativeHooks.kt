package com.openbubbles.wear.patches

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction32x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val APPLICATION = "Lcom/localob/messaging/app/LocalObApplication;"
private const val NOTIFICATIONS = "Lcom/localob/messaging/app/notifications/ChatNotifications;"
private const val NOTIFICATION_MANAGER = "Landroidx/core/app/NotificationManagerCompat;"
private const val EMBEDDED_HOOKS = "Lcom/openbubbles/wear/patch/EmbeddedHooks;"

private val startHook = ImmutableMethodReference(
    EMBEDDED_HOOKS, "start", listOf("Landroid/content/Context;"), "V",
)
private val prepareNotificationHook = ImmutableMethodReference(
    EMBEDDED_HOOKS, "prepareNotification",
    listOf("Landroid/content/Context;", "Landroid/app/Notification;"), "V",
)
private val alertHook = ImmutableMethodReference(
    EMBEDDED_HOOKS,
    "onNotificationPosted",
    listOf("Landroid/content/Context;", "Landroid/app/Notification;", "Z"),
    "V",
)

/** Adds only the two native lifecycle hooks; all instructions are fingerprinted before mutation. */
internal fun BytecodePatchContext.addEmbeddedHooks() {
    requireHookMethod("start(Landroid/content/Context;)V")
    requireHookMethod("prepareNotification(Landroid/content/Context;Landroid/app/Notification;)V")
    requireHookMethod("onNotificationPosted(Landroid/content/Context;Landroid/app/Notification;Z)V")
    val app = classDefBy(APPLICATION)
    val onCreate = app.methods.filter { signature(it) == "onCreate()V" }
    if (onCreate.size != 1) throw PatchException("Expected one native LocalObApplication.onCreate()V")
    val mutableAppMethod = mutableClassDefBy(APPLICATION).methods.single { signature(it) == "onCreate()V" }
    val appImpl = mutableAppMethod.implementation ?: throw PatchException("LocalObApplication.onCreate() has no bytecode")
    val returns = appImpl.instructions.indices.filter { appImpl.instructions[it].opcode == Opcode.RETURN_VOID }
    if (returns.size != 1) throw PatchException("Expected one LocalObApplication.onCreate() return")
    val (backendIndex, contextRegister) = backendStartTarget(appImpl.instructions)
    if (backendIndex >= returns.single()) {
        throw PatchException("Expected one native backend start call before LocalObApplication.onCreate() returns")
    }
    // Optimized code reuses p0; use the Context operand of the verified native call.
    appImpl.addInstruction(backendIndex + 1,
        BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, contextRegister, 1, startHook))

    val notificationMethods = classDefBy(NOTIFICATIONS).methods.filter {
        it.name == "post" && it.parameterTypes.map(CharSequence::toString) ==
            listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z") && it.returnType == "V"
    }
    if (notificationMethods.size != 1) throw PatchException("Expected one ChatNotifications.post(Context,String,boolean)")
    if (notificationMethods.single().accessFlags and 0x0a != 0x02) {
        throw PatchException("ChatNotifications.post must remain a private instance method")
    }
    val mutableNotifications = mutableClassDefBy(NOTIFICATIONS)
    val mutablePost = mutableNotifications.methods.single { signature(it) ==
        "post(Landroid/content/Context;Ljava/lang/String;Z)V" }
    injectConversationNotifyHook(mutableNotifications, mutablePost)
}

private fun BytecodePatchContext.requireHookMethod(required: String) {
    val methods = classDefBy(EMBEDDED_HOOKS).methods
    if (methods.count { signature(it) == required && it.accessFlags and 0x9 == 0x9 } != 1) {
        throw PatchException("Expected one public static EmbeddedHooks->$required")
    }
}

internal fun injectConversationNotifyHook(owner: MutableClass, originalMethod: MutableMethod) {
    var method = originalMethod
    val implementation = method.implementation ?: throw PatchException("ChatNotifications.post has no bytecode")
    val (index, notificationRegister) = conversationNotifyTarget(implementation.instructions)
    val registerCount = implementation.registerCount
    // Keep the actual parameters above every original register: the optimizer may reuse old p slots.
    method = allocateRegisters(owner, method, 7)
    val grownImplementation = method.implementation ?: throw PatchException("Expanded ChatNotifications.post has no bytecode")
    parameterShiftInstructions(registerCount).forEachIndexed { offset, instruction ->
        grownImplementation.addInstruction(offset, instruction)
    }
    val shiftedNotifyIndex = index + 4
    val additions = preservedAlertHookInstructions(registerCount, notificationRegister)
    additions.forEachIndexed { offset, instruction -> grownImplementation.addInstruction(shiftedNotifyIndex + 1 + offset, instruction) }
    // Android copies notification extras during notify(), so link dismissals before posting.
    val prepare = preservedAlertHookInstructions(registerCount, notificationRegister).take(2) +
        BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, registerCount, 2, prepareNotificationHook)
    prepare.forEachIndexed { offset, instruction -> grownImplementation.addInstruction(shiftedNotifyIndex + offset, instruction) }
}

internal fun allocateRegisters(owner: MutableClass, method: MutableMethod, extraRegisters: Int): MutableMethod {
    if (extraRegisters <= 0) throw PatchException("Additional method registers must be positive")
    val implementation = method.implementation ?: throw PatchException("Cannot expand a method without bytecode")
    val expandedImplementation = growImplementation(implementation, extraRegisters)
    val source = ImmutableMethod(
        method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
        method.annotations, method.hiddenApiRestrictions, expandedImplementation,
    )
    val replacement = MutableMethod(source)
    val methods = if (method.accessFlags and 0x8 != 0 || method.accessFlags and 0x2 != 0) owner.directMethods
        else owner.virtualMethods
    if (!methods.remove(method) || !methods.add(replacement)) {
        throw PatchException("Could not replace ChatNotifications.post with expanded register file")
    }
    return replacement
}

internal fun growImplementation(
    implementation: com.android.tools.smali.dexlib2.iface.MethodImplementation,
    extraRegisters: Int,
): ImmutableMethodImplementation {
    if (extraRegisters <= 0) throw PatchException("Additional method registers must be positive")
    return ImmutableMethodImplementation(
        implementation.registerCount + extraRegisters,
        implementation.instructions,
        implementation.tryBlocks,
        implementation.debugItems,
    )
}

internal fun parameterShiftInstructions(oldRegisterCount: Int): List<BuilderInstruction> {
    if (oldRegisterCount < 4) throw PatchException("ChatNotifications.post has an invalid parameter register layout")
    val oldStart = oldRegisterCount - 4
    val newStart = oldRegisterCount + 3
    return listOf(
        moveObject(oldStart, newStart),
        moveObject(oldStart + 1, newStart + 1),
        moveObject(oldStart + 2, newStart + 2),
        move(oldStart + 3, newStart + 3),
    )
}

internal fun preservedAlertHookInstructions(oldRegisterCount: Int, notificationRegister: Int): List<BuilderInstruction> = listOf(
    moveObject(oldRegisterCount, oldRegisterCount + 4),
    moveObject(oldRegisterCount + 1, notificationRegister),
    move(oldRegisterCount + 2, oldRegisterCount + 6),
    BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, oldRegisterCount, 3, alertHook),
)

internal fun backendStartTarget(instructions: List<Instruction>): Pair<Int, Int> {
    val calls = instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.calls("Lcom/localob/messaging/app/service/BackendForegroundService\$Companion;", "start",
                listOf("Landroid/content/Context;"), "V")) index to instruction else null
    }
    if (calls.size != 1) throw PatchException("Expected one native backend start invocation")
    val (index, instruction) = calls.single()
    val context = when {
        instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction is Instruction35c && instruction.registerCount == 2 -> instruction.registerD
        instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE && instruction is RegisterRangeInstruction && instruction.registerCount == 2 -> instruction.startRegister + 1
        else -> throw PatchException("Unsupported native backend start invocation")
    }
    return index to context
}

internal fun conversationNotifyTarget(instructions: List<Instruction>): Pair<Int, Int> {
    val notifyCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (instruction.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) &&
            reference?.definingClass == NOTIFICATION_MANAGER && reference.name == "notify" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("I", "Landroid/app/Notification;") &&
            reference.returnType == "V") index to instruction else null
    }
    if (notifyCalls.size != 2) throw PatchException("Expected conversation and summary notification calls")
    val (index, call) = notifyCalls.first()
    val notificationRegister = when (call) {
        is Instruction35c -> if (call.registerCount == 3) call.registerE else null
        is RegisterRangeInstruction -> if (call.registerCount == 3) call.startRegister + 2 else null
        else -> null
    } ?: throw PatchException("Unsupported conversation notification call")
    return index to notificationRegister
}

private fun moveObject(destination: Int, source: Int): BuilderInstruction = when {
    destination <= 255 -> BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, destination, source)
    else -> BuilderInstruction32x(Opcode.MOVE_OBJECT_16, destination, source)
}

private fun move(destination: Int, source: Int): BuilderInstruction = when {
    destination <= 255 -> BuilderInstruction22x(Opcode.MOVE_FROM16, destination, source)
    else -> BuilderInstruction32x(Opcode.MOVE_16, destination, source)
}

private fun Instruction.calls(owner: String, name: String, parameters: List<String>, returnType: String): Boolean {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass == owner && reference.name == name &&
        reference.parameterTypes.map(CharSequence::toString) == parameters && reference.returnType == returnType
}

private fun signature(method: com.android.tools.smali.dexlib2.iface.Method): String =
    "${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
