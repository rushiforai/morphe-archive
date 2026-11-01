/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.mutual

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.*
import app.morphe.patches.tumblr.misc.extension.*
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.patches.tumblr.rootmute.accountIdentityPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Show mutual markers"
internal const val MUTUAL = "$EXTENSION_PACKAGE/mutual/MutualMarkers;"
internal const val MUTUAL_BIND = "$MUTUAL->bind(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V"
internal const val MUTUAL_CLEAR = "$MUTUAL->clear(Ljava/lang/Object;)V"
internal const val MUTUAL_HEADER = "Lcom/tumblr/ui/widget/PostCardHeader;"
internal const val MUTUAL_SOURCE = "$EXTENSION_PACKAGE/mutual/NativeMutualSource;"
internal const val MUTUAL_USER = "Lcom/tumblr/UserInfo;"
internal const val MUTUAL_PRIMARY = "Lcom/tumblr/rumblr/model/blog/UserBlogInfo;"
internal const val MUTUAL_SHORT = "Lcom/tumblr/rumblr/model/blog/ShortBlogInfo;"
internal const val MUTUAL_BLOG = "Lcom/tumblr/bloginfo/BlogInfo;"
internal const val MUTUAL_FOLLOWER = "Lcom/tumblr/rumblr/model/User;"
internal const val MUTUAL_PAGE = "Lcom/tumblr/rumblr/response/FollowerResponse;"
internal const val MUTUAL_PAGINATION = "Lcom/tumblr/rumblr/model/PaginationLink;"
internal const val MUTUAL_LINK = "Lcom/tumblr/rumblr/model/link/LinkImpl;"
internal const val MUTUAL_RESPONSE = "Lcom/tumblr/rumblr/response/ApiResponse;"
internal const val MUTUAL_METADATA = "Lcom/tumblr/rumblr/response/Metadata;"
internal const val MUTUAL_SERVICE = "Lcom/tumblr/rumblr/TumblrService;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val LIST = "Ljava/util/List;"
private const val CALL = "Lretrofit2/Call;"
private const val RESPONSE = "Lretrofit2/Response;"

@Suppress("unused")
val showMutualMarkersPatch = bytecodePatch(
    name = PATCH,
    description = "Marks blogs that follow your primary blog when you follow them. " +
        "Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(accountIdentityPatch, settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())
    execute {
        requireStatusMethod("showMutualMarkers")
        requireStatusMethod("primaryBlogMutuals")
        applyMutualMarkers(resolveMutualMarkers())
        enableCapability("primaryBlogMutuals")
        enableStatus("showMutualMarkers")
    }
}

internal data class MutualBridge(val owner: String, val contract: String, val methods: List<MutableMethod>)
internal data class MutualPlan(val bind: MutableMethod, val fullBind: MutableMethod, val detach: MutableMethod,
    val bridges: List<MutualBridge>, val sourceMethods: List<MutableMethod>)

internal fun BytecodePatchContext.resolveMutualMarkers(): MutualPlan {
    listOf(MUTUAL_BIND, MUTUAL_CLEAR).forEach { requireExtensionHook(PATCH, it) }
    val bind = mutualMethod(MUTUAL_HEADER, "t2", listOf("Lyzf;", "Lmrn;", "Z", MUTUAL_BLOG, "Z"), "V")
    val body = bind.instructionList()
    requireShape(PATCH, bind.implementation!!.registerCount == 21 && body.size == 128 && bind.implementation!!.tryBlocks.isEmpty()
        && body[1].opcode == Opcode.MOVE_OBJECT_FROM16 && body[1].namedRegisters() == listOf(5, 19)
        && body[14].methodRef()?.toString() == "$MUTUAL_HEADER->Z0(Lyzf;$MUTUAL_BLOG)$STRING"
        && body[14].namedRegisters() == listOf(15, 2, 5) && body[15].opcode == Opcode.MOVE_RESULT_OBJECT && body[15].namedRegisters() == listOf(13)
        && body[104].fieldRef()?.toString() == "$MUTUAL_HEADER->K:Landroid/widget/TextView;" && body[104].namedRegisters() == listOf(0, 15)
        && body[105].methodRef()?.toString() == "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V"
        && body[105].namedRegisters() == listOf(0, 8) && body.subList(2, 106).none { writesRegister(it, 5) }
        && body.subList(16, 106).none { writesRegister(it, 13) }, "the native displayed blog, name span or holder changed")
    val name = mutualMethod(MUTUAL_HEADER, "Z0", listOf("Lyzf;", MUTUAL_BLOG), STRING).instructionList()
    requireShape(PATCH, name.size == 17 && name[4].methodRef()?.toString() == "$MUTUAL_BLOG->Z()$STRING",
        "the native displayed-name fallback changed")
    val full = classDefByOrNull(MUTUAL_HEADER)?.methods?.filter { it.name == "S0" && it.returnType == "V" }.orEmpty().only(PATCH, "full post-header bind")
    requireShape(PATCH, full.implementation?.registerCount == 35 && full.parameterTypes.size == 18 && full.parameterTypes.first() == "Lyzf;"
        && full.instructionList().size == 297 && full.instructionList()[7].methodRef()?.toString() == "$MUTUAL_HEADER->X1()V",
        "the unconditional post-header recycle boundary changed")
    val detach = mutualMethod(MUTUAL_HEADER, "onDetachedFromWindow", emptyList(), "V")
    requireShape(PATCH, detach.implementation!!.registerCount == 1 && detach.instructionList().size == 4
        && detach.instructionList().first().opcode == Opcode.INVOKE_SUPER, "the native post-header detach boundary changed")

    val fresh = mutualMethod(MUTUAL_USER, "<init>", listOf("Lcom/tumblr/rumblr/response/UserInfoResponse;"), "V").instructionList()
    requireShape(PATCH, fresh.size == 127 && fresh[39].methodRef()?.toString() == "Lcom/tumblr/rumblr/model/UserInfo;->getBlogs()$LIST"
        && fresh[41].fieldRef()?.toString() == "$MUTUAL_USER->k:$LIST", "the fresh authenticated account blog list changed")
    requireField(MUTUAL_USER, "k", LIST, immutable = true)
    val primary = mutualJsonGetter(MUTUAL_PRIMARY, "primary", "Z")
    requireDirectGetter(primary, "X", "Z")
    val primaryDefaultMethod = classDefByOrNull(MUTUAL_PRIMARY)?.methods?.filter { it.name == "<init>" && AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
        .orEmpty().only(PATCH, "primary-blog defaults")
    val primaryDefaults = primaryDefaultMethod.instructionList()
    val primaryConstructor = mutualMethod(MUTUAL_PRIMARY, "<init>", primaryDefaultMethod.parameterTypes.dropLast(3).map { it.toString() }, "V")
    val primaryBody = primaryConstructor.instructionList()
    requireShape(PATCH, primaryDefaultMethod.implementation?.registerCount == 129 && primaryDefaults.size == 283
        && primaryConstructor.implementation?.registerCount == 110 && primaryBody.size == 83
        && primaryConstructor.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } == 60
        && primaryDefaultMethod.parameterTypes.takeLast(3) == listOf("I", "I", "Lh27;")
        && primaryBody[11].opcode == Opcode.MOVE_OBJECT_FROM16 && primaryBody[11].namedRegisters() == listOf(0, 49)
        && primaryBody.subList(12, 60).none { writesRegister(it, 0) }
        && primaryBody[58].opcode == Opcode.MOVE_FROM16 && primaryBody[58].namedRegisters() == listOf(1, 94)
        && primaryBody[59].opcode == Opcode.IPUT_BOOLEAN && primaryBody[59].namedRegisters() == listOf(1, 0)
        && primaryBody[59].fieldRef()?.toString() == "$MUTUAL_PRIMARY->X:Z"
        && primaryDefaults[1].opcode == Opcode.MOVE_FROM16 && primaryDefaults[1].namedRegisters() == listOf(1, 127)
        && primaryDefaults[19].opcode == Opcode.CONST_4
        && (primaryDefaults[19] as NarrowLiteralInstruction).narrowLiteral == 0 && primaryDefaults[19].namedRegisters() == listOf(3)
        && primaryDefaults.subList(20, 202).none { writesRegister(it, 3) }
        && primaryDefaults[199].opcode == Opcode.AND_INT_LIT16 && primaryDefaults[199].namedRegisters() == listOf(0, 1)
        && (primaryDefaults[199] as NarrowLiteralInstruction).narrowLiteral == 0x1000
        && primaryDefaults[200].opcode == Opcode.IF_EQZ && primaryDefaults[200].namedRegisters() == listOf(0) && primaryDefaults.branchTarget(200) == 203
        && primaryDefaults[201].opcode == Opcode.MOVE_FROM16 && primaryDefaults[201].namedRegisters() == listOf(49, 3)
        && primaryDefaults[202].opcode == Opcode.GOTO && primaryDefaults.branchTarget(202) == 204
        && primaryDefaults[203].opcode == Opcode.MOVE_FROM16 && primaryDefaults[203].namedRegisters() == listOf(49, 110)
        && primaryDefaults.subList(204, 281).none { writesRegister(it, 49) }
        && primaryDefaults[281].opcode == Opcode.INVOKE_DIRECT_RANGE && primaryDefaults[281].methodRef()?.toString() == primaryConstructor.toString()
        && (primaryDefaults[281] as? RegisterRangeInstruction)?.let { it.startRegister == 4 && it.registerCount == 61 } == true,
        "an absent primary-blog flag no longer defaults false")
    val shortName = mutualJsonGetter(MUTUAL_SHORT, "name", STRING)
    val shortUuid = mutualJsonGetter(MUTUAL_SHORT, "uuid", STRING)
    requireDirectGetter(shortName, "a", STRING); requireDirectGetter(shortUuid, "g", STRING)
    requireShape(PATCH, classDefByOrNull(MUTUAL_PRIMARY)?.superclass == "Lcom/tumblr/rumblr/model/blog/BlogInfo;"
        && classDefByOrNull("Lcom/tumblr/rumblr/model/blog/BlogInfo;")?.superclass == MUTUAL_SHORT, "primary blog inheritance changed")
    requireDirectGetter("$MUTUAL_BLOG->Z()$STRING", "a", STRING, immutable = false)
    requireDirectGetter("$MUTUAL_BLOG->t0()$STRING", "E", STRING, immutable = false)
    val copied = mutualMethod(MUTUAL_BLOG, "W0", listOf(MUTUAL_SHORT), MUTUAL_BLOG).instructionList()
    requireShape(PATCH, copied.size == 116 && copied[39].methodRef()?.toString() == shortUuid
        && copied[41].fieldRef()?.toString() == "$MUTUAL_BLOG->E:$STRING", "the post-header UUID provenance changed")

    val following = mutualJsonGetter(MUTUAL_FOLLOWER, "following", "Z")
    val followerBlog = mutualJsonGetter(MUTUAL_FOLLOWER, "blog", MUTUAL_SHORT)
    requireDirectGetter(following, "isFollowing", "Z", immutable = false); requireDirectGetter(followerBlog, "blog", MUTUAL_SHORT, immutable = false)
    val followerDefaultMethod = classDefByOrNull(MUTUAL_FOLLOWER)?.methods?.filter { it.name == "<init>" && AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
        .orEmpty().only(PATCH, "following defaults")
    val followerDefaults = followerDefaultMethod.instructionList()
    val followerConstructor = mutualMethod(MUTUAL_FOLLOWER, "<init>", listOf(STRING, STRING, "J", "Z", MUTUAL_SHORT), "V")
    val followerBody = followerConstructor.instructionList()
    requireShape(PATCH, followerDefaultMethod.implementation?.registerCount == 10 && followerDefaults.size == 18
        && followerConstructor.implementation?.registerCount == 7 && followerBody.size == 7
        && followerDefaultMethod.parameterTypes == followerConstructor.parameterTypes + listOf("I", "Lh27;")
        && followerBody[4].opcode == Opcode.IPUT_BOOLEAN && followerBody[4].namedRegisters() == listOf(5, 0)
        && followerBody[4].fieldRef()?.toString() == "$MUTUAL_FOLLOWER->isFollowing:Z"
        && followerDefaults[10].opcode == Opcode.AND_INT_LIT8 && followerDefaults[10].namedRegisters() == listOf(9, 8)
        && (followerDefaults[10] as NarrowLiteralInstruction).narrowLiteral == 8
        && followerDefaults[11].opcode == Opcode.IF_EQZ && followerDefaults[11].namedRegisters() == listOf(9) && followerDefaults.branchTarget(11) == 13
        && followerDefaults[12].opcode == Opcode.CONST_4 && followerDefaults[12].namedRegisters() == listOf(6)
        && (followerDefaults[12] as NarrowLiteralInstruction).narrowLiteral == 0
        && followerDefaults.subList(13, 16).none { writesRegister(it, 6) }
        && followerDefaults[16].opcode == Opcode.INVOKE_DIRECT_RANGE && followerDefaults[16].methodRef()?.toString() == followerConstructor.toString()
        && (followerDefaults[16] as? RegisterRangeInstruction)?.let { it.startRegister == 1 && it.registerCount == 7 } == true,
        "an absent following relationship no longer defaults false")
    val users = mutualJsonGetter(MUTUAL_PAGE, "users", LIST)
    val pagination = mutualJsonGetter(MUTUAL_PAGE, "_links", MUTUAL_PAGINATION)
    val links = mutualMethod(MUTUAL_PAGE, "getLinks", emptyList(), MUTUAL_PAGINATION).toString()
    val pageCtor = mutualMethod(MUTUAL_PAGE, "<init>", listOf("I", LIST, MUTUAL_PAGINATION), "V").instructionList()
    requireShape(PATCH, pageCtor.size == 6 && pageCtor[3].fieldRef()?.toString() == "$MUTUAL_PAGE->paginationLinks:$MUTUAL_PAGINATION"
        && pageCtor[4].fieldRef()?.toString() == "$MUTUAL_PAGE->links:$MUTUAL_PAGINATION" && pageCtor[3].namedRegisters() == pageCtor[4].namedRegisters(),
        "the native pagination aliases changed")
    val next = mutualJsonGetter(MUTUAL_PAGINATION, "next", "Lcom/tumblr/rumblr/model/link/SimpleLink;")
    mutualMethod(MUTUAL_LINK, "getLink", emptyList(), STRING)
    mutualMethod(MUTUAL_RESPONSE, "getResponse", emptyList(), OBJECT)
    mutualMethod(MUTUAL_RESPONSE, "getMetaData", emptyList(), MUTUAL_METADATA)
    mutualMethod(MUTUAL_METADATA, "getStatus", emptyList(), "I")

    val get = mutualMethod(MUTUAL_SERVICE, "followers", listOf(STRING, STRING), CALL)
    val getNext = mutualMethod(MUTUAL_SERVICE, "followersPagination", listOf(STRING, STRING), CALL)
    requireShape(PATCH, classDefByOrNull(MUTUAL_SERVICE)?.let { AccessFlags.INTERFACE.isSet(it.accessFlags) } == true
        && get.annotations.any { it.type == "Lretrofit2/http/GET;" && it.elements.any { e -> e.name == "value"
            && (e.value as? StringEncodedValue)?.value == "blog/{hostname}/followers?limit=100" } }
        && get.parameters[0].annotations.any { it.type == "Lretrofit2/http/Path;" && it.elements.any { e -> e.name == "value"
            && (e.value as? StringEncodedValue)?.value == "hostname" } }
        && getNext.annotations.any { it.type == "Lretrofit2/http/GET;" && it.elements.none { e -> e.name == "value"
            && (e.value as? StringEncodedValue)?.value != "" } }
        && getNext.parameters[0].annotations.any { it.type == "Lretrofit2/http/Url;" }
        && listOf(get, getNext).all { method -> method.parameters[1].annotations.any { it.type == "Lretrofit2/http/Query;"
            && it.elements.any { e -> e.name == "value" && (e.value as? StringEncodedValue)?.value == "fields[blogs]" } } },
        "the native follower reads are no longer scoped GET requests")
    val original = mutualMethod("Lcom/tumblr/ui/fragment/FollowerFragment;", "c5", emptyList(), CALL).instructionList()
    val fields = original.getOrNull(13)?.stringRef()
    requireShape(PATCH, original.size == 18 && original[9].stringRef() == ".tumblr.com"
        && original[14].methodRef()?.toString() == get.toString() && fields != null && "uuid" in fields.split(','), "the native primary-domain follower request changed")
    requireShape(PATCH, mutualMethod("Lcom/tumblr/CoreApp;", "Z", emptyList(), MUTUAL_SERVICE).isStatic(), "the native authenticated service getter changed")
    listOf("execute" to RESPONSE, "timeout" to "Lvsl;", "cancel" to "V").forEach { (method, result) ->
        val declared = mutualMethod(CALL, method, emptyList(), result)
        requireShape(PATCH, AccessFlags.ABSTRACT.isSet(declared.accessFlags), "the native Retrofit call interface changed")
    }
    mutualMethod("Lvsl;", "timeout", listOf("J", "Ljava/util/concurrent/TimeUnit;"), "Lvsl;")
    mutualMethod(RESPONSE, "isSuccessful", emptyList(), "Z"); mutualMethod(RESPONSE, "body", emptyList(), OBJECT)

    val bridges = listOf(
        mutualBridge(MUTUAL_HEADER, "HushMutualHeader", listOf("hushMutualNameView" to (OBJECT to "iget-object v0, p0, $MUTUAL_HEADER->K:Landroid/widget/TextView;\nreturn-object v0"))),
        mutualBridge(MUTUAL_USER, "HushMutualAccount", listOf("hushMutualBlogs" to (LIST to "iget-object v0, p0, $MUTUAL_USER->k:$LIST\nreturn-object v0"))),
        mutualBridge(MUTUAL_PRIMARY, "HushPrimaryBlog", listOf("hushMutualPrimary" to ("Z" to getter(primary, "Z")))),
        mutualBridge(MUTUAL_SHORT, "HushMutualBlog", listOf("hushMutualName" to (STRING to getter(shortName, STRING)), "hushMutualUuid" to (STRING to getter(shortUuid, STRING)))),
        mutualBridge(MUTUAL_BLOG, "HushMutualBlog", listOf("hushMutualName" to (STRING to getter("$MUTUAL_BLOG->Z()$STRING", STRING)), "hushMutualUuid" to (STRING to getter("$MUTUAL_BLOG->t0()$STRING", STRING)))),
        mutualBridge(MUTUAL_FOLLOWER, "HushMutualFollower", listOf("hushMutualFollowing" to ("Z" to getter(following, "Z")), "hushMutualFollowerBlog" to (OBJECT to getter(followerBlog, OBJECT)))),
        mutualBridge(MUTUAL_PAGE, "HushMutualPage", listOf("hushMutualUsers" to (LIST to getter(users, LIST)), "hushMutualPagination" to (OBJECT to getter(pagination, OBJECT)), "hushMutualLinks" to (OBJECT to getter(links, OBJECT)))),
        mutualBridge(MUTUAL_PAGINATION, "HushMutualPagination", listOf("hushMutualNext" to (OBJECT to getter(next, OBJECT)))),
        mutualBridge(MUTUAL_LINK, "HushMutualLink", listOf("hushMutualLink" to (STRING to getter("$MUTUAL_LINK->getLink()$STRING", STRING)))),
        mutualBridge(MUTUAL_RESPONSE, "HushMutualResponse", listOf(
            "hushMutualResponse" to (OBJECT to getter("$MUTUAL_RESPONSE->getResponse()$OBJECT", OBJECT)),
            "hushMutualStatus" to ("I" to "invoke-virtual { p0 }, $MUTUAL_RESPONSE->getMetaData()$MUTUAL_METADATA\nmove-result-object v0\nif-eqz v0, :unknown\ninvoke-virtual { v0 }, $MUTUAL_METADATA->getStatus()I\nmove-result v0\nreturn v0\n:unknown\nconst/4 v0, 0x0\nreturn v0"))),
    )
    val source = listOf("first" to "followers", "next" to "followersPagination").map { (method, native) ->
        replacement(mutualMethod(MUTUAL_SOURCE, method, listOf(STRING), OBJECT), 4, """
            invoke-static { }, Lcom/tumblr/CoreApp;->Z()$MUTUAL_SERVICE
            move-result-object v0
            const-string v1, "$fields"
            invoke-interface { v0, p1, v1 }, $MUTUAL_SERVICE->$native($STRING$STRING)$CALL
            move-result-object v0
            return-object v0
        """)
    } + listOf(
        replacement(mutualMethod(MUTUAL_SOURCE, "execute", listOf(OBJECT, "J"), OBJECT), 8, """
            move-object v0, p1
            check-cast v0, $CALL
            invoke-interface { v0 }, $CALL->timeout()Lvsl;
            move-result-object v1
            sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;
            invoke-virtual { v1, p2, p3, v2 }, Lvsl;->timeout(JLjava/util/concurrent/TimeUnit;)Lvsl;
            invoke-interface { v0 }, $CALL->execute()$RESPONSE
            move-result-object v1
            invoke-virtual { v1 }, $RESPONSE->isSuccessful()Z
            move-result v2
            if-eqz v2, :failed
            invoke-virtual { v1 }, $RESPONSE->body()$OBJECT
            move-result-object v0
            return-object v0
            :failed
            const/4 v0, 0x0
            return-object v0
        """),
        replacement(mutualMethod(MUTUAL_SOURCE, "cancel", listOf(OBJECT), "V"), 2, """
            check-cast p1, $CALL
            invoke-interface { p1 }, $CALL->cancel()V
            return-void
        """),
    )
    return MutualPlan(mutableOf(bind), mutableOf(full), mutableOf(detach), bridges, source)
}

internal fun BytecodePatchContext.applyMutualMarkers(plan: MutualPlan) {
    plan.bridges.forEach { bridge -> mutableClassDefBy(bridge.owner).apply { interfaces.add(bridge.contract); methods.addAll(bridge.methods) } }
    mutableClassDefBy(MUTUAL_SOURCE).apply { methods.removeAll { old -> plan.sourceMethods.any { it.name == old.name } }; methods.addAll(plan.sourceMethods) }
    plan.bind.addInstructionsAtControlFlowLabel(106, "invoke-static { v0, v5, v13 }, $MUTUAL_BIND")
    plan.fullBind.addInstructionsAtControlFlowLabel(0, "invoke-static/range { p0 .. p0 }, $MUTUAL_CLEAR")
    plan.detach.addInstructionsAtControlFlowLabel(0, "invoke-static { p0 }, $MUTUAL_CLEAR")
}

private fun BytecodePatchContext.mutualMethod(owner: String, name: String, parameters: List<String>, result: String): Method =
    classDefByOrNull(owner)?.methods?.filter { it.name == name && it.hasShape(parameters, result) }.orEmpty().only(PATCH, "$owner->$name native ABI")
private fun List<Instruction>.branchTarget(index: Int): Int {
    val branch = get(index) as? OffsetInstruction ?: return -1
    val addresses = runningFold(0) { address, instruction -> address + instruction.codeUnits }
    return addresses.indexOf(addresses[index] + branch.codeOffset)
}
private fun BytecodePatchContext.requireField(owner: String, field: String, type: String, immutable: Boolean) {
    requireShape(PATCH, classDefByOrNull(owner)?.fields?.any { it.name == field && it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags)
        && AccessFlags.PRIVATE.isSet(it.accessFlags) && (!immutable || AccessFlags.FINAL.isSet(it.accessFlags)) } == true, "$owner->$field provenance changed")
}
private fun BytecodePatchContext.requireDirectGetter(descriptor: String, field: String, type: String, immutable: Boolean = true) {
    val owner = descriptor.substringBefore("->"); val method = mutualMethod(owner, descriptor.substringAfter("->").substringBefore('('), emptyList(), type)
    val body = method.instructionList(); requireField(owner, field, type, immutable)
    requireShape(PATCH, AccessFlags.PUBLIC.isSet(method.accessFlags) && !method.isStatic() && body.size == 2
        && body[0].fieldRef()?.toString() == "$owner->$field:$type" && body[0].namedRegisters() == listOf(0, method.implementation!!.registerCount - 1)
        && body[1].namedRegisters() == listOf(0), "$descriptor direct getter changed")
}
private fun BytecodePatchContext.mutualJsonGetter(owner: String, key: String, result: String): String {
    val writer = mutualMethod(owner.removeSuffix(";") + "JsonAdapter;", "toJson", listOf("Ldab;", OBJECT), "V").instructionList()
    val at = writer.indexOfFirst { it.stringRef() == key }
    requireShape(PATCH, at >= 0, "$owner JSON key $key is missing")
    val getter = writer.drop(at + 1).takeWhile { it.stringRef() == null }.firstNotNullOfOrNull {
        it.methodRef()?.takeIf { ref -> it.opcode == Opcode.INVOKE_VIRTUAL && ref.definingClass == owner }
    }
    requireShape(PATCH, getter != null && getter.hasShape(emptyList(), result), "$owner JSON key $key raw getter changed")
    mutualMethod(owner, getter!!.name, emptyList(), result)
    return getter.toString()
}
private fun getter(method: String, result: String): String = "invoke-virtual { p0 }, $method\nmove-result${if (result == "Z" || result == "I") "" else "-object"} v0\nreturn${if (result == "Z" || result == "I") "" else "-object"} v0"
private fun BytecodePatchContext.mutualBridge(owner: String, name: String, entries: List<Pair<String, Pair<String, String>>>): MutualBridge {
    val face = "$EXTENSION_PACKAGE/mutual/$name;"; val native = classDefByOrNull(owner); val api = classDefByOrNull(face)
    requireShape(PATCH, native != null && face !in native.interfaces && api != null && AccessFlags.INTERFACE.isSet(api.accessFlags)
        && api.methods.count() == entries.size && entries.all { (method, value) -> native.methods.none { it.name == method }
            && api.methods.any { it.name == method && it.hasShape(emptyList(), value.first) && AccessFlags.ABSTRACT.isSet(it.accessFlags) } }, "$name bridge changed or already exists")
    return MutualBridge(owner, face, entries.map { (name, value) -> ImmutableMethod(owner, name, emptyList(), value.first,
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2)).toMutable().apply { addInstructions(0, value.second) } })
}
private fun replacement(method: Method, registers: Int, code: String): MutableMethod = ImmutableMethod(method.definingClass, method.name,
    method.parameters, method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions, MutableMethodImplementation(registers))
    .toMutable().apply { addInstructions(0, code) }
