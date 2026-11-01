/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.mature

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.compat.AppCompatibilities
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
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.patches.tumblr.rootmute.accountIdentityPatch
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Reveal allowed mature content"
internal const val MATURE = "$EXTENSION_PACKAGE/mature/AllowedMatureContent;"
internal const val MATURE_COVER = "$MATURE->cover(Z)Z"
internal const val MATURE_AGE_PARSED = "$MATURE->ageGateParsed(Ljava/lang/Object;I)V"
internal const val MATURE_PERMISSION_PARSED = "$MATURE->permissionParsed(Ljava/lang/Object;I)V"
internal const val MATURE_SERVICE_CAPTURE = "$MATURE->service(Ljava/lang/Object;)V"
internal const val MATURE_RECEIVED = "$MATURE->received(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val MATURE_USER = "Lcom/tumblr/UserInfo;"
internal const val MATURE_AGE = "Lcom/tumblr/rumblr/model/AgeVerification;"
internal const val MATURE_GATE = "Lxg4;"
internal const val MATURE_REPOSITORY = "Lcom/tumblr/communitylabel/data/settings/a;"
internal const val MATURE_NATIVE_SERVICE = "Lcom/tumblr/communitylabel/data/settings/CommunityLabelService;"
internal const val MATURE_PERMISSION = "Lcom/tumblr/communitylabel/data/settings/CommunityLabelUserConfigResponse;"
internal const val MATURE_API_RESPONSE = "Lcom/tumblr/rumblr/response/ApiResponse;"
internal const val MATURE_METADATA = "Lcom/tumblr/rumblr/response/Metadata;"
internal const val MATURE_REQUESTER = "$EXTENSION_PACKAGE/mature/NativeMatureService;"
internal const val MATURE_CONTINUATION = "$EXTENSION_PACKAGE/mature/NativeMatureContinuation;"
private const val OBJECT = "Ljava/lang/Object;"
private const val BOOLEAN = "Ljava/lang/Boolean;"
private const val COROUTINE = "Lox5;"
private const val COROUTINE_CONTEXT = "Ll86;"

@Suppress("unused")
val revealAllowedMatureContentPatch = bytecodePatch(
    name = PATCH,
    description = "Removes mature-content covers only when Tumblr explicitly allows them for the signed-in adult account. " +
        "Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(accountIdentityPatch, settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("revealAllowedMatureContent")
        requireStatusMethod("accountSafeMatureReveal")
        applyMatureReveal(resolveMatureReveal())
        enableCapability("accountSafeMatureReveal")
        enableStatus("revealAllowedMatureContent")
    }
}

internal data class MatureBridge(val contract: String, val methods: List<MutableMethod>)
internal data class MatureRevealPlan(
    val cover: MutableMethod, val ageParser: MutableMethod, val permissionParser: MutableMethod, val repository: MutableMethod,
    val bridges: List<MatureBridge>, val fetch: MutableMethod, val context: MutableMethod,
)

/** Raw nullable responses, JSON presence and every native ABI are proven before any changes. */
internal fun BytecodePatchContext.resolveMatureReveal(): MatureRevealPlan {
    listOf(MATURE_COVER, MATURE_AGE_PARSED, MATURE_PERMISSION_PARSED, MATURE_SERVICE_CAPTURE, MATURE_RECEIVED).forEach { requireExtensionHook(PATCH, it) }
    val cover = matureMethod(MATURE_GATE, "k", listOf("Lyzf;"), "Z")
    val body = cover.instructionList()
    requireShape(PATCH, cover.implementation!!.registerCount == 4 && cover.implementation!!.tryBlocks.isEmpty()
        && body.map { it.opcode } == listOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT,
            Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_DIRECT, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.INVOKE_DIRECT, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN,
            Opcode.RETURN, Opcode.INVOKE_DIRECT, Opcode.MOVE_RESULT, Opcode.RETURN, Opcode.RETURN)
        && listOf(12 to 2, 13 to 1, 16 to 2, 17 to 1).all { (index, register) ->
            (body[index] as OneRegisterInstruction).registerA == register
        } && body[1].methodRef()?.toString() == "$MATURE_GATE->l(Lyzf;)Z"
        && body[5].methodRef()?.toString() == "$MATURE_GATE->f(Lyzf;)Z"
        && listOf(8, 14).all { body[it].methodRef()?.toString() == "$MATURE_GATE->j(Lyzf;)Z" },
        "the native content-label cover result changed")
    val nsfw = matureMethod("Ls7n;", "b", listOf("Lyzf;", MATURE_GATE), "Luan;").instructionList()
    requireShape(PATCH, nsfw.indexOfFirst { it.methodRef()?.toString() == "Led1;->U0()Z" } in 0..8
        && nsfw.indexOfFirst { it.methodRef()?.toString() == "$MATURE_GATE->k(Lyzf;)Z" } == 10,
        "the separate native NSFW restriction no longer precedes content-label covers")

    val fresh = matureMethod(MATURE_USER, "<init>", listOf("Lcom/tumblr/rumblr/response/UserInfoResponse;"), "V").instructionList()
    requireShape(PATCH, fresh.size == 127 && listOf(44 to "$MATURE_USER->l:Z", 96 to "$MATURE_USER->C:I",
        125 to "$MATURE_USER->J:$MATURE_AGE").all { (index, field) -> fresh[index].fieldRef()?.toString() == field }
        && fresh[42].methodRef()?.toString() == "Lcom/tumblr/rumblr/model/UserInfo;->getCanModifySafeMode()Z"
        && fresh[87].methodRef()?.toString() == "Lcom/tumblr/rumblr/model/UserInfo;->getAge()Ljava/lang/Integer;"
        && fresh[123].methodRef()?.toString() == "Lcom/tumblr/rumblr/model/UserInfo;->getAgeVerification()$MATURE_AGE",
        "the fresh native age and eligibility fields changed")
    val nativeUser = classDefByOrNull("Lcom/tumblr/rumblr/model/UserInfo;")
    val defaults = nativeUser?.methods?.filter { it.name == "<init>" && AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
        .orEmpty().only(PATCH, "native account defaults").instructionList()
    requireShape(PATCH, defaults.size == 224 && defaults[3].opcode == Opcode.CONST_4
        && (defaults[3] as NarrowLiteralInstruction).narrowLiteral == 0
        && (defaults[23] as? NarrowLiteralInstruction)?.narrowLiteral == 0x400
        && defaults[25].opcode == Opcode.MOVE && (defaults[25] as TwoRegisterInstruction).let {
            it.registerA == 15 && it.registerB == 3
        } && defaults[222].opcode == Opcode.INVOKE_DIRECT_RANGE
        && (defaults[222] as RegisterRangeInstruction).startRegister == 4,
        "a missing can_modify_safe_mode value no longer defaults to restricted")

    val ageParser = matureMethod(MATURE_AGE.removeSuffix(";") + "JsonAdapter;", "fromJson", listOf("Le9b;"), OBJECT)
    val parsed = ageParser.instructionList()
    val nativeBlock = matureJsonGetter(MATURE_AGE, "block_app", "Z")
    requireShape(PATCH, nativeBlock == "$MATURE_AGE->getBlockApp()Z" && parsed.size == 97
        && ageParser.implementation!!.registerCount == 16 && ageParser.implementation!!.tryBlocks.isEmpty()
        && parsed[6].opcode == Opcode.CONST_4 && (parsed[6] as NarrowLiteralInstruction).narrowLiteral == -1
        && parsed[11].opcode == Opcode.MOVE && (parsed[11] as TwoRegisterInstruction).let { it.registerA == 9 && it.registerB == 3 }
        && parsed[65].opcode == Opcode.AND_INT_LIT8 && (parsed[65] as NarrowLiteralInstruction).narrowLiteral == -2
        && (parsed[65] as TwoRegisterInstruction).let { it.registerA == 9 && it.registerB == 9 }
        && parsed[77].methodRef()?.toString() == "$MATURE_AGE-><init>(ZLjava/lang/String;Ljava/lang/String;Lcom/tumblr/rumblr/model/AgeGroup;)V"
        && parsed[81].methodRef()?.toString() == "$MATURE_AGE-><init>(ZLjava/lang/String;Ljava/lang/String;Lcom/tumblr/rumblr/model/AgeGroup;ILh27;)V"
        && (parsed[81] as RegisterRangeInstruction).let { it.startRegister == 4 && it.registerCount == 7 }
        && listOf(78 to 14, 82 to 4, 96 to 2).all { (index, register) ->
            parsed[index].opcode == Opcode.RETURN_OBJECT && (parsed[index] as OneRegisterInstruction).registerA == register
        }, "the age_verification JSON presence mask or successful constructor paths changed")

    val permissionParser = matureMethod(MATURE_PERMISSION.removeSuffix(";") + "JsonAdapter;", "fromJson", listOf("Le9b;"), OBJECT)
    val permissionBody = permissionParser.instructionList()
    requireShape(PATCH, permissionBody.size == 110 && permissionParser.implementation!!.registerCount == 15
        && permissionParser.implementation!!.tryBlocks.isEmpty()
        && permissionBody[5].opcode == Opcode.CONST_4 && (permissionBody[5] as NarrowLiteralInstruction).narrowLiteral == -1
        && permissionBody[13].opcode == Opcode.MOVE && (permissionBody[13] as TwoRegisterInstruction).let { it.registerA == 11 && it.registerB == 2 }
        && listOf(34 to -33, 41 to -17).all { (index, mask) -> permissionBody[index].opcode == Opcode.AND_INT_LIT8
            && (permissionBody[index] as NarrowLiteralInstruction).narrowLiteral == mask
            && (permissionBody[index] as TwoRegisterInstruction).let { it.registerA == 11 && it.registerB == 11 } }
        && permissionBody[81].methodRef()?.definingClass == MATURE_PERMISSION && permissionBody[81].methodRef()?.name == "<init>"
        && (permissionBody[81] as? RegisterRangeInstruction)?.let { it.startRegister == 2 && it.registerCount == 8 } == true
        && permissionBody[93].methodRef()?.definingClass == MATURE_PERMISSION && permissionBody[93].methodRef()?.name == "<init>"
        && (permissionBody[93] as? RegisterRangeInstruction)?.let { it.startRegister == 3 && it.registerCount == 10 } == true
        && listOf(82 to 2, 94 to 3, 108 to 1).all { (index, register) -> permissionBody[index].opcode == Opcode.RETURN_OBJECT
            && (permissionBody[index] as OneRegisterInstruction).registerA == register },
        "the native permission JSON presence masks or successful constructor paths changed")

    val repository = matureMethod(MATURE_REPOSITORY, "<init>", listOf("Lii7;", MATURE_NATIVE_SERVICE), "V")
    val made = repository.instructionList()
    requireShape(PATCH, made.size == 14 && made.last().opcode == Opcode.RETURN_VOID
        && repository.implementation!!.registerCount == 9 && repository.implementation!!.tryBlocks.isEmpty()
        && made[4].fieldRef()?.toString() == "$MATURE_REPOSITORY->b:$MATURE_NATIVE_SERVICE"
        && (made[4] as TwoRegisterInstruction).let { it.registerA == 8 && it.registerB == 6 }
        && 0 !in RegisterLiveness.of(repository).liveInto(13), "the native permission service constructor or free local changed")
    val service = classDefByOrNull(MATURE_NATIVE_SERVICE)
    val get = service?.methods?.filter { it.name == "getCommunityLabelUserConfig" && it.hasShape(listOf(COROUTINE), OBJECT) }
        .orEmpty().only(PATCH, "native permission GET")
    requireShape(PATCH, service != null && AccessFlags.INTERFACE.isSet(service.accessFlags)
        && AccessFlags.ABSTRACT.isSet(get.accessFlags) && get.annotations.any { it.type == "Lretrofit2/http/GET;" },
        "the native permission read is no longer an annotated GET")
    val continuation = classDefByOrNull(COROUTINE)
    requireShape(PATCH, continuation != null && AccessFlags.INTERFACE.isSet(continuation.accessFlags)
        && continuation.methods.any { it.name == "getContext" && it.hasShape(emptyList(), COROUTINE_CONTEXT) }
        && continuation.methods.any { it.name == "resumeWith" && it.hasShape(listOf(OBJECT), "V") }
        && COROUTINE_CONTEXT in classDefByOrNull("Lo68;")?.interfaces.orEmpty()
        && matureMethod("Lo68;", "toString", emptyList(), "Ljava/lang/String;").instructionList().first().stringRef() == "EmptyCoroutineContext"
        && classDefByOrNull("Lo68;")?.fields?.any { it.name == "a" && it.type == "Lo68;" && AccessFlags.PUBLIC.isSet(it.accessFlags)
            && AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) } == true
        && classDefByOrNull("Lu3b;")?.superclass == "Lw3b;"
        && matureMethod("Lw3b;", "g", emptyList(), OBJECT).instructionList().first().fieldRef()?.toString() == "Lc96;->COROUTINE_SUSPENDED:Lc96;",
        "the native continuation context or suspension marker changed")
    val fetch = matureMethod(MATURE_REQUESTER, "hushFetchMaturePermission", listOf(OBJECT), "V")
    requireShape(PATCH, classDefByOrNull(MATURE_REQUESTER)?.fields?.any { it.name == "service" && it.type == OBJECT
        && AccessFlags.PRIVATE.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) } == true
        && classDefByOrNull(MATURE_CONTINUATION)?.let { COROUTINE !in it.interfaces && it.methods.none { method -> method.name == "getContext" } } == true
        && matureMethod(MATURE_CONTINUATION, "resumeWith", listOf(OBJECT), "V").instructionList().any {
            it.opcode == Opcode.INVOKE_STATIC && it.methodRef()?.toString() == MATURE_RECEIVED
        }, "the extension native request stubs changed")
    matureMethod(MATURE_REQUESTER, "<init>", listOf(OBJECT), "V")
    matureMethod(MATURE_CONTINUATION, "<init>", listOf(OBJECT), "V")
    val bridges = listOf(
        matureBridge(MATURE_USER, "HushMatureAccount", listOf(
            "hushAge" to ("I" to "iget v0, p0, $MATURE_USER->C:I\nreturn v0"),
            "hushCanModifySafeMode" to ("Z" to "iget-boolean v0, p0, $MATURE_USER->l:Z\nreturn v0"),
            "hushAgeVerification" to (OBJECT to "iget-object v0, p0, $MATURE_USER->J:$MATURE_AGE\nreturn-object v0"),
        )),
        matureBridge(MATURE_AGE, "HushAgeVerification", listOf("hushBlockApp" to ("Z" to
            "invoke-virtual { p0 }, $nativeBlock\nmove-result v0\nreturn v0"))),
        matureBridge(MATURE_PERMISSION, "HushMaturePermission", listOf(
            "hushShowMatureContent" to (BOOLEAN to "invoke-virtual { p0 }, ${matureJsonGetter(MATURE_PERMISSION, "show_mature_content", BOOLEAN)}\nmove-result-object v0\nreturn-object v0"),
            "hushCanEditMatureContent" to (BOOLEAN to "invoke-virtual { p0 }, ${matureJsonGetter(MATURE_PERMISSION, "can_edit", BOOLEAN)}\nmove-result-object v0\nreturn-object v0"),
        )),
        matureBridge(MATURE_API_RESPONSE, "HushMatureResponse", listOf(
            "hushResponse" to (OBJECT to "invoke-virtual { p0 }, $MATURE_API_RESPONSE->getResponse()$OBJECT\nmove-result-object v0\nreturn-object v0"),
            "hushStatus" to ("I" to "invoke-virtual { p0 }, $MATURE_API_RESPONSE->getMetaData()$MATURE_METADATA\nmove-result-object v0\nif-eqz v0, :unknown\ninvoke-virtual { v0 }, $MATURE_METADATA->getStatus()I\nmove-result v0\nreturn v0\n:unknown\nconst/4 v0, 0x0\nreturn v0"),
        )),
    )
    matureMethod(MATURE_API_RESPONSE, "getResponse", emptyList(), OBJECT)
    matureMethod(MATURE_API_RESPONSE, "getMetaData", emptyList(), MATURE_METADATA)
    matureMethod(MATURE_METADATA, "getStatus", emptyList(), "I")
    val context = matureNewMethod(MATURE_CONTINUATION, "getContext", COROUTINE_CONTEXT,
        "sget-object v0, Lo68;->a:Lo68;\nreturn-object v0")
    return MatureRevealPlan(mutableOf(cover), mutableOf(ageParser), mutableOf(permissionParser), mutableOf(repository), bridges, mutableOf(fetch), context)
}

internal fun BytecodePatchContext.applyMatureReveal(plan: MatureRevealPlan) {
    plan.bridges.forEach { bridge ->
        val model = mutableClassDefBy(bridge.methods.first().definingClass)
        model.interfaces.add(bridge.contract)
        model.methods.addAll(bridge.methods)
    }
    val continuation = mutableClassDefBy(MATURE_CONTINUATION)
    continuation.interfaces.add(COROUTINE)
    continuation.methods.add(plan.context)
    val requester = mutableClassDefBy(MATURE_REQUESTER)
    requester.methods.remove(plan.fetch)
    requester.methods.add(ImmutableMethod(MATURE_REQUESTER, plan.fetch.name, plan.fetch.parameters, "V",
        plan.fetch.accessFlags, plan.fetch.annotations, plan.fetch.hiddenApiRestrictions, MutableMethodImplementation(6)).toMutable().apply {
        addInstructions(0, """
            iget-object v0, p0, $MATURE_REQUESTER->service:$OBJECT
            check-cast v0, $MATURE_NATIVE_SERVICE
            new-instance v1, $MATURE_CONTINUATION
            invoke-direct { v1, p1 }, $MATURE_CONTINUATION-><init>($OBJECT)V
            invoke-interface { v0, v1 }, $MATURE_NATIVE_SERVICE->getCommunityLabelUserConfig($COROUTINE)$OBJECT
            move-result-object v2
            invoke-static { }, Lu3b;->g()$OBJECT
            move-result-object v3
            if-eq v2, v3, :suspended
            invoke-static { p1, v2 }, $MATURE_RECEIVED
            :suspended
            return-void
        """)
    })
    plan.repository.addInstructionsAtControlFlowLabel(13, """
        new-instance v0, $MATURE_REQUESTER
        invoke-direct { v0, p2 }, $MATURE_REQUESTER-><init>($OBJECT)V
        invoke-static { v0 }, $MATURE_SERVICE_CAPTURE
    """)
    for ((index, register) in listOf(82 to 4, 78 to 14)) plan.ageParser.addInstructionsAtControlFlowLabel(index,
        "invoke-static { v$register, v9 }, $MATURE_AGE_PARSED")
    for ((index, register) in listOf(94 to 3, 82 to 2)) plan.permissionParser.addInstructionsAtControlFlowLabel(index,
        "invoke-static { v$register, v11 }, $MATURE_PERMISSION_PARSED")
    for (index in listOf(17, 16, 13, 12)) {
        val register = (plan.cover.instructionList()[index] as OneRegisterInstruction).registerA
        plan.cover.addInstructionsAtControlFlowLabel(index, """
            invoke-static/range { v$register .. v$register }, $MATURE_COVER
            move-result v$register
        """)
    }
}

private fun BytecodePatchContext.matureMethod(type: String, name: String, parameters: List<String>, result: String): Method =
    classDefByOrNull(type)?.methods?.filter { it.name == name && it.hasShape(parameters, result)
        && AccessFlags.PUBLIC.isSet(it.accessFlags) }.orEmpty().only(PATCH, "$type->$name native ABI")

private fun BytecodePatchContext.matureJsonGetter(type: String, key: String, result: String): String {
    val writer = classDefByOrNull(type.removeSuffix(";") + "JsonAdapter;")?.methods?.filter {
        it.name == "toJson" && it.parameterTypes.size == 2 && it.returnType == "V"
    }.orEmpty().only(PATCH, "$type JSON writer").instructionList()
    val index = writer.indexOfFirst { it.stringRef() == key }
    requireShape(PATCH, index >= 0, "$type JSON key $key is missing")
    val getter = writer.drop(index + 1).takeWhile { it.stringRef() == null }.firstNotNullOfOrNull {
        it.methodRef()?.takeIf { call -> it.opcode == Opcode.INVOKE_VIRTUAL && call.definingClass == type }
    }
    requireShape(PATCH, getter != null && getter.hasShape(emptyList(), result), "$type JSON key $key has no exact raw getter")
    val declared = matureMethod(type, getter!!.name, emptyList(), result)
    requireShape(PATCH, !declared.isStatic(), "$type JSON key $key is no longer an instance getter")
    return getter.toString()
}

private fun BytecodePatchContext.matureBridge(native: String, name: String, methods: List<Pair<String, Pair<String, String>>>): MatureBridge {
    val contract = "$EXTENSION_PACKAGE/mature/$name;"
    val owner = classDefByOrNull(native)
    val api = classDefByOrNull(contract)
    requireShape(PATCH, owner != null && contract !in owner.interfaces && methods.none { (method, _) -> owner.methods.any { it.name == method } }
        && api != null && AccessFlags.INTERFACE.isSet(api.accessFlags) && api.methods.count() == methods.size
        && methods.all { (method, result) -> api.methods.any { it.name == method && it.hasShape(emptyList(), result.first)
            && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags) } }, "$name bridge changed or already exists")
    if (native == MATURE_USER) requireShape(PATCH, listOf("C" to "I", "l" to "Z", "J" to MATURE_AGE).all { (field, type) ->
        owner!!.fields.any { it.name == field && it.type == type && AccessFlags.PRIVATE.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) }
    }, "the age and eligibility fields are not immutable")
    return MatureBridge(contract, methods.map { (method, result) -> matureNewMethod(native, method, result.first, result.second) })
}

private fun matureNewMethod(owner: String, name: String, result: String, instructions: String): MutableMethod =
    ImmutableMethod(owner, name, emptyList(), result, AccessFlags.PUBLIC.value, null, null,
        MutableMethodImplementation(2)).toMutable().apply { addInstructions(0, instructions) }
