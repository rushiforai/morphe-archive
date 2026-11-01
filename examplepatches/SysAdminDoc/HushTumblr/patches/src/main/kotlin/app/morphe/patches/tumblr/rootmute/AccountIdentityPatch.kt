/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.rootmute

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Verified account identity"
internal const val ACCOUNT_USER_INFO = "Lcom/tumblr/UserInfo;"
internal const val ACCOUNT_REQUEST = "Lvu5;"
internal const val ACCOUNT_SERVICE = "Lou5;"
internal const val ACCOUNT_CREDENTIALS = "Lnw0;"
internal const val ACCOUNT_LOGOUT = "Lo4c;"
internal const val ACCOUNT_RESPONSE = "Lcom/tumblr/rumblr/response/UserInfoResponse;"
internal const val HUSH_ACCOUNT = "$EXTENSION_PACKAGE/rootmute/HushAccountIdentity;"
internal const val ROOT_MUTES = "$EXTENSION_PACKAGE/rootmute/RootPostMutes;"
private const val STRING = "Ljava/lang/String;"
private const val REMEMBER = "Lcom/tumblr/Remember;"

/** Shared by local mutes and mature eligibility. These fences also run while paused. */
internal val accountIdentityPatch = bytecodePatch {
    dependsOn(tumblrExtensionPatch)
    execute { applyAccountIdentity(resolveAccountIdentity()) }
}

internal data class AccountIdentityPlan(
    val persist: MutableMethod, val replace: MutableMethod, val reset: MutableMethod,
    val logout: MutableMethod, val requestConstructor: MutableMethod, val accept: MutableMethod,
    val uuidField: String, val replaceEnd: Int,
)

/** Every transition and its request provenance is checked before the first class changes. */
internal fun BytecodePatchContext.resolveAccountIdentity(): AccountIdentityPlan {
    for (hook in listOf("beginAccountChange(Ljava/lang/Object;)V", "commitAccount()V", "logout()V",
        "credentialsChanging()V", "credentialsChanged()V", "requestCreated(Ljava/lang/Object;)V",
        "requestEntered(Ljava/lang/Object;)V", "requestExited()V")) requireExtensionHook(PATCH, "$ROOT_MUTES->$hook")
    val bridge = classDefByOrNull(HUSH_ACCOUNT)
    requireShape(PATCH, bridge != null && AccessFlags.INTERFACE.isSet(bridge.accessFlags)
        && bridge.methods.count() == 1 && bridge.methods.single().let {
            it.name == "hushAccountId" && it.hasShape(emptyList(), STRING) && AccessFlags.ABSTRACT.isSet(it.accessFlags)
        }, "the UUID bridge interface changed")
    val owner = classDefByOrNull(ACCOUNT_USER_INFO)
    requireShape(PATCH, owner != null && HUSH_ACCOUNT !in owner.interfaces
        && owner.methods.none { it.name == "hushAccountId" }, "the native UUID bridge already exists or its owner is missing")
    val persist = accountMethod(ACCOUNT_USER_INFO, "M", emptyList(), "V")
    val body = persist.instructionList()
    requireShape(PATCH, persist.implementation!!.registerCount == 2 && body.size == 73
        && body.last().opcode == Opcode.RETURN_VOID && body.count { it.opcode == Opcode.RETURN_VOID } == 1
        && body.none { it is OffsetInstruction } && persist.implementation!!.tryBlocks.isEmpty()
        && !persist.isStatic() && AccessFlags.PUBLIC.isSet(persist.accessFlags), "the native UserInfo persistence path changed")
    val uuid = body[50].fieldRef()
    requireShape(PATCH, body[50].opcode == Opcode.IGET_OBJECT && uuid != null && uuid.definingClass == ACCOUNT_USER_INFO
        && uuid.type == STRING && (body[50] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == 1 }
        && body[51].opcode == Opcode.INVOKE_STATIC
        && body[51].methodRef()?.toString() == "$ACCOUNT_USER_INFO->y0($STRING)V"
        && (body[51] as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == 0 },
        "the persisted UUID no longer comes from the fresh account field")
    requireShape(PATCH, owner!!.fields.any { it.name == uuid!!.name && it.type == STRING
        && AccessFlags.PRIVATE.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) }, "the fresh UUID field is not immutable")
    val constructor = accountMethod(ACCOUNT_USER_INFO, "<init>", listOf(ACCOUNT_RESPONSE), "V")
    val constructorBody = constructor.instructionList()
    requireShape(PATCH, constructorBody.windowed(3).count { triple ->
        triple[0].opcode == Opcode.INVOKE_VIRTUAL && triple[0].methodRef()?.toString() ==
            "Lcom/tumblr/rumblr/model/UserInfo;->getUserUuid()$STRING"
            && triple[1].opcode == Opcode.MOVE_RESULT_OBJECT && triple[2].opcode == Opcode.IPUT_OBJECT
            && triple[2].fieldRef()?.toString() == uuid.toString()
            && (triple[1] as OneRegisterInstruction).registerA == (triple[2] as TwoRegisterInstruction).registerA
    } == 1, "the native account constructor no longer binds user_uuid")
    val writeUuid = accountMethod(ACCOUNT_USER_INFO, "y0", listOf(STRING), "V")
    requireShape(PATCH, writeUuid.isStatic() && writeUuid.instructionList().any { it.stringRef() == "user_uuid" }
        && writeUuid.instructionList().any { it.methodRef()?.toString() == "$REMEMBER->o($STRING$STRING)$REMEMBER" },
        "the native UUID writer changed")

    val requestConstructor = accountMethod(ACCOUNT_REQUEST, "<init>", listOf(ACCOUNT_SERVICE), "V")
    val made = requestConstructor.instructionList()
    requireShape(PATCH, requestConstructor.implementation!!.registerCount == 2 && made.map { it.opcode } ==
        listOf(Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.RETURN_VOID)
        && made[0].methodRef()?.toString() == "Ljava/lang/Object;-><init>()V"
        && (made[0] as FiveRegisterInstruction).let { it.registerCount == 1 && it.registerC == 0 }
        && made[1].fieldRef()?.toString() == "$ACCOUNT_REQUEST->a:$ACCOUNT_SERVICE"
        && (made[1] as TwoRegisterInstruction).let { it.registerA == 1 && it.registerB == 0 }
        && requestConstructor.implementation!!.tryBlocks.isEmpty(), "the request callback constructor changed")
    val accept = accountMethod(ACCOUNT_REQUEST, "accept", listOf("Ljava/lang/Object;"), "V")
    val accepted = accept.instructionList()
    requireShape(PATCH, accept.implementation!!.registerCount == 2 && accept.implementation!!.tryBlocks.isEmpty()
        && accepted.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID)
        && accepted[0].fieldRef()?.toString() == "$ACCOUNT_REQUEST->a:$ACCOUNT_SERVICE"
        && (accepted[0] as TwoRegisterInstruction).let { it.registerA == 0 && it.registerB == 0 }
        && (accepted[1] as OneRegisterInstruction).registerA == 1
        && (accepted[1] as ReferenceInstruction).reference.toString() == ACCOUNT_RESPONSE
        && accepted[2].methodRef()?.toString() == "$ACCOUNT_SERVICE->v($ACCOUNT_SERVICE$ACCOUNT_RESPONSE)V"
        && (accepted[2] as FiveRegisterInstruction).let { it.registerCount == 2 && it.registerC == 0 && it.registerD == 1 },
        "the authenticated request callback changed")
    val forward = accountMethod(ACCOUNT_SERVICE, "v", listOf(ACCOUNT_SERVICE, ACCOUNT_RESPONSE), "V")
    requireShape(PATCH, forward.isStatic() && forward.instructionList().any {
        it.methodRef()?.toString() == "$ACCOUNT_SERVICE->D($ACCOUNT_RESPONSE)V"
    }, "the authenticated response no longer reaches the account parser")
    val parser = accountMethod(ACCOUNT_SERVICE, "D", listOf(ACCOUNT_RESPONSE), "V")
    requireShape(PATCH, parser.instructionList().windowed(3).any { triple ->
        triple[0].opcode == Opcode.NEW_INSTANCE && triple[1].methodRef()?.toString() ==
            "$ACCOUNT_USER_INFO-><init>($ACCOUNT_RESPONSE)V"
            && triple[2].methodRef()?.toString() == "$ACCOUNT_USER_INFO->M()V"
            && (triple[1] as FiveRegisterInstruction).registerC == (triple[2] as FiveRegisterInstruction).registerC
    }, "the authenticated parser no longer persists its new account object")
    val fetch = accountMethod(ACCOUNT_SERVICE, "f", emptyList(), "Lsm4;").instructionList()
    val createdAt = fetch.indexOfFirst { it.methodRef()?.toString() == "$ACCOUNT_REQUEST-><init>($ACCOUNT_SERVICE)V" }
    requireShape(PATCH, createdAt >= 0 && fetch.drop(createdAt + 1).any {
        it.methodRef()?.toString() == "Lhoj;->u()Lsm4;"
    }, "the request callback is no longer constructed before subscription")

    val replace = accountMethod(ACCOUNT_CREDENTIALS, "r", listOf(STRING, STRING), "V")
    val replacement = replace.instructionList()
    val end = replacement.indices.filter { replacement[it].opcode == Opcode.RETURN_VOID }.only(PATCH, "credential completion")
    requireShape(PATCH, !replace.isStatic() && replacement.first().opcode == Opcode.MONITOR_ENTER
        && end > 1 && replacement[end - 1].opcode == Opcode.MONITOR_EXIT
        && replacement.any { it.stringRef() == "AuthToken2" } && replacement.any { it.stringRef() == "AuthTokenSecret2" }
        && replacement.count { it.methodRef()?.toString() == "$REMEMBER->o($STRING$STRING)$REMEMBER" } == 2,
        "the credential replacement transaction changed")
    val reset = accountMethod(ACCOUNT_CREDENTIALS, "p", listOf("Llsm;"), "V")
    requireShape(PATCH, reset.instructionList().first().opcode == Opcode.MONITOR_ENTER
        && reset.instructionList().any { it.methodRef()?.toString() == "$ACCOUNT_CREDENTIALS->a()V" },
        "the synchronous credential reset changed")
    val logout = accountMethod(ACCOUNT_LOGOUT, "i", listOf("Landroid/content/Context;", "Z", "Lox5;"), "Ljava/lang/Object;")
    requireShape(PATCH, logout.instructionList().count { it.methodRef()?.toString() == "$REMEMBER->b()V" } == 1,
        "the native logout no longer clears Remember")
    return AccountIdentityPlan(persist, replace, reset, logout, requestConstructor, accept, uuid.toString(), end - 1)
}

internal fun BytecodePatchContext.applyAccountIdentity(plan: AccountIdentityPlan) {
    val owner = mutableClassDefBy(ACCOUNT_USER_INFO)
    owner.interfaces.add(HUSH_ACCOUNT)
    owner.methods.add(ImmutableMethod(ACCOUNT_USER_INFO, "hushAccountId", emptyList(), STRING,
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2)).toMutable().apply {
        addInstructions(0, "iget-object v0, p0, ${plan.uuidField}\nreturn-object v0")
    })
    plan.persist.addInstructionsAtControlFlowLabel(plan.persist.instructionList().lastIndex, "invoke-static {}, $ROOT_MUTES->commitAccount()V")
    plan.persist.addInstructions(0, "invoke-static/range { p0 .. p0 }, $ROOT_MUTES->beginAccountChange(Ljava/lang/Object;)V")
    // Both sides run under the native credential monitor. A waiting second replacement can't reopen the first one's epoch.
    plan.replace.addInstructionsAtControlFlowLabel(plan.replaceEnd, "invoke-static {}, $ROOT_MUTES->credentialsChanged()V")
    plan.replace.addInstructionsAtControlFlowLabel(1, "invoke-static {}, $ROOT_MUTES->credentialsChanging()V")
    plan.reset.addInstructionsAtControlFlowLabel(1, "invoke-static {}, $ROOT_MUTES->logout()V")
    plan.logout.addInstructions(0, "invoke-static {}, $ROOT_MUTES->logout()V")
    plan.requestConstructor.addInstructions(2, "invoke-static/range { p0 .. p0 }, $ROOT_MUTES->requestCreated(Ljava/lang/Object;)V")
    plan.accept.addInstructions(3, "invoke-static {}, $ROOT_MUTES->requestExited()V")
    plan.accept.addInstructions(0, "invoke-static/range { p0 .. p0 }, $ROOT_MUTES->requestEntered(Ljava/lang/Object;)V")
    plan.accept.addInstructions(6, "move-exception p1\ninvoke-static {}, $ROOT_MUTES->requestExited()V\nthrow p1")
    plan.accept.implementation!!.let { body ->
        body.addCatch(body.newLabelForIndex(1), body.newLabelForIndex(4), body.newLabelForIndex(6))
    }
}

private fun BytecodePatchContext.accountMethod(type: String, name: String, parameters: List<String>, result: String): MutableMethod =
    classDefByOrNull(type)?.methods?.filter { it.name == name && it.hasShape(parameters, result) && it.implementation != null }
        .orEmpty().only(PATCH, "$type->$name(${parameters.joinToString("")})$result").let { mutableOf(it) }
