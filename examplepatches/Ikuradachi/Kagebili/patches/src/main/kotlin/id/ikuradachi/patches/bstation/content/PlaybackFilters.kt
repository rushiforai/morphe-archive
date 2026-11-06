package id.ikuradachi.patches.bstation.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val STORY_CARD = "Lcom/bapis/bilibili/intl/app/interfaces/v2/StoryFeedCardType;"
private const val STORY_ID = "Lcom/bapis/bilibili/intl/app/interfaces/v2/StoryFeedIdType;"
private const val REQUEST = "Lcom/bilibili/lib/blrouter/RouteRequest;"
private const val RESPONSE = "Lcom/bilibili/lib/blrouter/RouteResponse;"

private object ShortsAcceptedTypesFingerprint : Fingerprint(
    definingClass = "Lcom/biliintl/shorts/page/scope/item/ShortsPageState\$FeedList;",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = STORY_CARD, name = "STORY_FEED_CARD_TYPE_UNKNOWN"),
        methodCall(definingClass = "Ljava/util/Set;", name = "remove"),
        fieldAccess(definingClass = STORY_CARD, name = "UNRECOGNIZED"),
        methodCall(definingClass = "Ljava/util/Set;", name = "remove"),
    ),
)

private object ShortsRequestFingerprint : Fingerprint(
    definingClass = "Lcom/biliintl/shorts/page/loader/ShortsPageLoader;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("J", STORY_ID,
        "Lcom/biliintl/shorts/page/incoming/ShortsPageMode\$FeedType;",
        "Lcom/bapis/bilibili/intl/app/interfaces/v2/StoryPageType;", "J",
        "Ljava/lang/String;", "Lkotlin/Pair;", "Ljava/lang/String;", "L"),
    filters = listOf(
        methodCall(definingClass = "Lcom/bapis/bilibili/intl/app/interfaces/v2/StoryFeedReq;", name = "newBuilder"),
        string("bstar-main.shorts-detail.0.0"),
        methodCall(definingClass = "Lcom/bapis/bilibili/intl/app/interfaces/v2/ApiMossKtxKt;", name = "suspendStoryFeed"),
    ),
)

private object OnlinePageDriverFingerprint : Fingerprint(
    definingClass = "Lcom/biliintl/playdetail/page/scope/videopage/VideoPageScopeDriver;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    filters = listOf(
        fieldAccess(type = "Ljava/util/Set;"),
        methodCall(definingClass = "Ljava/util/Set;", name = "iterator"),
        string("VideoPageScopeDriver"),
        methodCall(definingClass = "Ltv/danmaku/android/log/BLog;", name = "w"),
    ),
)

private object IncomingClassificationFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("bstar-main.off-ugc-video-detail.0.0.pv", "bstar-main.off-pgc-video-detail.0.0.pv",
        "bstar-main.ugc-video-detail.0.0.pv", "bstar-main.pgc-video-detail.0.0.pv"),
    filters = listOf(fieldAccess(
        definingClass = "Lcom/biliintl/playdetail/page/scope/videopage/VideoPageType;", name = "Ugc")),
)

private object RouterDispatchFingerprint : Fingerprint(
    name = "execute",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = RESPONSE,
    parameters = emptyList(),
    strings = listOf("Executed!"),
    filters = listOf(
        methodCall(name = "getRequest", returnType = REQUEST),
        methodCall(parameters = listOf(REQUEST), returnType = RESPONSE),
    ),
)

private object RequestTargetFingerprint : Fingerprint(
    definingClass = REQUEST,
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(string("RouteRequest(targetUri="),
        methodCall(definingClass = REQUEST, returnType = "Landroid/net/Uri;")),
)

private fun Method.playbackCalls(): List<MethodReference> = implementation!!.instructions.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}

private fun MutableClass.addPlaybackHelper(name: String, parameters: List<String>, result: String,
    registers: Int, body: String): String {
    check(methods.none { it.name == name }) { "Duplicate injected method $name" }
    val method = MutableMethod(ImmutableMethod(type, name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        MutableMethodImplementation(registers)))
    method.addInstructions(0, body.trimIndent())
    methods.add(method)
    return "$type->$name(${parameters.joinToString("")})$result"
}

private val deniedCommunityRoute = "(?i)^(?:" +
    "bstar://(?:author|space|user)/[0-9]+/?|bstar://space/?|bstar://main/authorspace/?|" +
    "bstar://space/module/(?:main|archive|post|preview)/?|activity://main/authorspace/?|" +
    "activity://uper/(?:web|transweb)/?|" +
    "https?://(?:www\\.)?(?:bilibili\\.tv|biliintl\\.com)/[^/?#]+/space/[0-9]+/?" +
    ")(?:[?#].*)?$"

internal fun BytecodePatchContext.applyPlaybackFilters() {
    listOf(ShortsAcceptedTypesFingerprint, ShortsRequestFingerprint, OnlinePageDriverFingerprint,
        IncomingClassificationFingerprint, RouterDispatchFingerprint, RequestTargetFingerprint)
        .forEach { it.matchAll(1..1) }
    val routePattern = Regex(deniedCommunityRoute)
    check(routePattern.matches("bstar://space/123/"))
    check(routePattern.matches("https://www.bilibili.tv/en/space/123?from=home"))
    check(!routePattern.matches("bstar://user_center/mine"))
    check(!routePattern.matches("bstar://user/edit"))
    check(!routePattern.matches("https://evil.example/?url=https://www.bilibili.tv/en/space/123"))

    val accepted = ShortsAcceptedTypesFingerprint
    val remove = accepted.instructionMatches.last()
    val registers = remove.getInstruction<Instruction35c>()
    accepted.method.addInstructions(remove.index + 1, """
        sget-object v${registers.registerD}, $STORY_CARD->STORY_FEED_CARD_TYPE_UGC:$STORY_CARD
        invoke-interface {v${registers.registerC}, v${registers.registerD}}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    """.trimIndent())

    val shorts = ShortsRequestFingerprint
    val rejectShorts = shorts.classDef.addPlaybackHelper("rejectUserShorts", listOf(STORY_ID), "V", 3, """
        sget-object v0, $STORY_ID->STORY_FEED_ID_TYPE_UGC:$STORY_ID
        if-ne p0, v0, :allowed
        new-instance v0, Ljava/lang/UnsupportedOperationException;
        const-string v1, "User content hidden"
        invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V
        throw v0
        :allowed
        return-void
    """)
    // The builder is reached only on initial invocation, not coroutine resumption.
    shorts.method.addInstructions(shorts.instructionMatches.first().index,
        "invoke-static {p3}, $rejectShorts")

    val driver = OnlinePageDriverFingerprint
    val incoming = driver.originalMethod.parameterTypes.first().toString()
    val classification = IncomingClassificationFingerprint.originalMethod.playbackCalls()
    val ids = classification.filter { it.definingClass == incoming && it.returnType == "J" && it.parameterTypes.isEmpty() }
    check(ids.size == 3 && ids.distinct().size == 3) { "Expected season, episode and AV getter provenance" }
    val offline = classification.single { it.definingClass == incoming &&
        it.returnType == "Lcom/biliintl/play/model/offline/OfflinePageEnterInfo;" && it.parameterTypes.isEmpty() }
    val rejectOnline = driver.classDef.addPlaybackHelper("rejectOnlineUserVideo", listOf(incoming), "V", 6, """
        if-eqz p0, :allowed
        invoke-virtual {p0}, $offline
        move-result-object v4
        if-nez v4, :allowed
        const-wide/16 v2, 0x0
        invoke-virtual {p0}, ${ids[0]}
        move-result-wide v0
        cmp-long v4, v0, v2
        if-gtz v4, :allowed
        invoke-virtual {p0}, ${ids[1]}
        move-result-wide v0
        cmp-long v4, v0, v2
        if-gtz v4, :allowed
        invoke-virtual {p0}, ${ids[2]}
        move-result-wide v0
        cmp-long v4, v0, v2
        if-lez v4, :allowed
        new-instance v0, Ljava/lang/UnsupportedOperationException;
        const-string v1, "User content hidden"
        invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V
        throw v0
        :allowed
        return-void
    """)
    // Insert after the Set field read so rejection stays inside the existing failure-state try block.
    val driverIndex = driver.instructionMatches.first().index + 1
    check(driver.originalMethod.implementation!!.instructions.elementAt(driverIndex).opcode == Opcode.INVOKE_INTERFACE)
    driver.method.addInstructions(driverIndex, "invoke-static {p1}, $rejectOnline")

    val dispatch = RouterDispatchFingerprint
    val chainCallMatch = dispatch.instructionMatches.last()
    val chainCall = chainCallMatch.getInstruction<Instruction35c>()
    val chain = chainCall.reference as MethodReference
    check(chainCall.opcode == Opcode.INVOKE_VIRTUAL && chainCall.registerCount == 2)
    val uriGetter = RequestTargetFingerprint.instructionMatches.last().getInstruction<ReferenceInstruction>().reference as MethodReference
    val escapedPattern = deniedCommunityRoute.replace("\\", "\\\\")
    val routeHelper = dispatch.classDef.addPlaybackHelper("dispatchWithoutCommunity", listOf(chain.definingClass, REQUEST), RESPONSE, 6, """
        invoke-virtual {p1}, $uriGetter
        move-result-object v0
        if-eqz v0, :allowed
        invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;
        move-result-object v0
        const-string v1, "$escapedPattern"
        invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :allowed
        new-instance v0, $RESPONSE
        sget-object v1, Lcom/bilibili/lib/blrouter/RouteResponse${'$'}Code;->FORBIDDEN:Lcom/bilibili/lib/blrouter/RouteResponse${'$'}Code;
        const-string v2, "User content hidden"
        invoke-direct {v0, v1, p1, v2}, $RESPONSE-><init>(Lcom/bilibili/lib/blrouter/RouteResponse${'$'}Code;$REQUEST${"Ljava/lang/String;"})V
        return-object v0
        :allowed
        invoke-virtual {p0, p1}, $chain
        move-result-object v0
        return-object v0
    """)
    dispatch.method.replaceInstruction(chainCallMatch.index,
        "invoke-static {v${chainCall.registerC}, v${chainCall.registerD}}, $routeHelper")
}
