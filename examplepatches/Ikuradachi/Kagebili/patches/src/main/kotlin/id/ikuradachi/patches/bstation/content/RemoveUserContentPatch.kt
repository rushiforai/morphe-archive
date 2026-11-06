package id.ikuradachi.patches.bstation.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

private const val BASIC = "Lcom/bilibili/pegasus/api/model/BasicIndexItem;"
private const val MODELS = "Lcom/bilibili/pegasus/api/modelv2/"
private const val SEARCH = "Lcom/bilibili/search/api/model/"
private const val RECOMMEND = "Lcom/biliintl/play/model/recommend/"
private const val HISTORY = "Lcom/bilibili/app/history/model/HistoryRawReplyX\$HistoryRawItem;"

@Suppress("unused")
val removeUserContentPatch = bytecodePatch(
    name = "Remove user content",
    description = "Filters known user videos and creator surfaces, keeps Anime search, and preserves unknown official content and download management.",
    default = false,
) {
    category("Layout")
    compatibleWith(COMPATIBILITY_BSTATION)
    execute {
        listOf(HomeContentAcceptanceFingerprint, SearchContentResponseFingerprint,
            PlayerContentResponseFingerprint, HistoryPresentationFingerprint).forEach { it.matchAll(1..1) }

        val host = HomeContentAcceptanceFingerprint.classDef
        val owner = host.type
        installPredicates(host)
        installHomeFilter(host)
        installSearchFilter(host)
        installRecommendationFilter(host)
        installHistoryFilter(host)

        val home = HomeContentAcceptanceFingerprint.method
        val homeReturn = home.implementation!!.instructions.toList().indexOfLast { it.opcode == Opcode.RETURN }
        val accepted = (home.implementation!!.instructions.toList()[homeReturn] as OneRegisterInstruction).registerA
        home.addInstructions(homeReturn, """
            invoke-static {p1, v$accepted}, $owner->morpheAcceptHome(${BASIC}Z)Z
            move-result v$accepted
        """.trimIndent())

        SearchContentResponseFingerprint.method.filterObjectReturns(owner, "morpheFilterSearch", "${SEARCH}SearchResultAll;")
        // Branches target the final return directly; intercept completed responses after their cast.
        val recommendations = PlayerContentResponseFingerprint
        val completedResponse = recommendations.instructionMatches.first()
        val responseRegister = completedResponse.getInstruction<OneRegisterInstruction>().registerA
        recommendations.method.addInstructions(completedResponse.index + 1, """
            invoke-static/range {v$responseRegister .. v$responseRegister}, $owner->morpheFilterRecommendations(${RECOMMEND}RecommendResponse;)${RECOMMEND}RecommendResponse;
            move-result-object v$responseRegister
        """.trimIndent())
        HistoryPresentationFingerprint.method.filterObjectReturns(owner, "morpheFilterHistory", "Ljava/util/ArrayList;")
        applyPlaybackFilters()
    }
}

private fun MutableClass.helper(name: String, parameters: List<String>, result: String, locals: Int, body: String) {
    check(methods.none { it.name == name }) { "Duplicate injected helper $name" }
    val parameterWords = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val method = MutableMethod(ImmutableMethod(type, name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        MutableMethodImplementation(locals + parameterWords)))
    method.addInstructions(0, body.trimIndent())
    methods.add(method)
}

private fun MutableMethod.filterObjectReturns(owner: String, helper: String, type: String) {
    val returns = implementation!!.instructions.toList().withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    check(returns.isNotEmpty())
    returns.asReversed().forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        addInstructions(index, """
            invoke-static/range {v$register .. v$register}, $owner->$helper($type)$type
            move-result-object v$register
        """.trimIndent())
    }
}

private fun equalsAny(register: String, values: List<String>, label: String) = values.joinToString("\n") { value ->
    """
        const-string v0, "$value"
        invoke-virtual {v0, $register}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-nez v0, :$label
    """.trimIndent()
}

private fun installPredicates(host: MutableClass) {
    host.helper("morpheIsUserType", listOf("Ljava/lang/String;"), "Z", 1, """
        ${equalsAny("p0", listOf("ugc", "ugc_ip", "uploader", "audio_room", "intl_single_ugc", "intl_double_ugc", "intl_ugc_ip"), "user")}
        const/4 v0, 0x0
        return v0
        :user
        const/4 v0, 0x1
        return v0
    """)
    // shortcut: unknown server card types remain visible; extend only with proven type semantics.
    host.helper("morpheFilterHomeList", listOf("Ljava/util/List;"), "Ljava/util/List;", 4, """
        if-eqz p0, :null_list
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v2
        :loop
        invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
        move-result v0
        if-eqz v0, :done
        invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v3
        instance-of v0, v3, $BASIC
        if-eqz v0, :keep
        move-object v0, v3
        check-cast v0, $BASIC
        const/4 p0, 0x1
        invoke-static {v0, p0}, ${host.type}->morpheAcceptHome(${BASIC}Z)Z
        move-result v0
        if-eqz v0, :loop
        :keep
        invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :loop
        :done
        return-object v1
        :null_list
        return-object p0
    """)
}

private fun installHomeFilter(host: MutableClass) {
    val nested = listOf("PegasusAnimeItem" to "cards", "OperationThemeItem" to "items", "OperationBannerItem" to "items")
    val containers = nested.mapIndexed { index, (type, field) -> """
        instance-of v0, p0, $MODELS$type;
        if-eqz v0, :container_$index
        move-object v1, p0
        check-cast v1, $MODELS$type;
        iget-object v2, v1, $MODELS$type;->$field:Ljava/util/List;
        invoke-static {v2}, ${host.type}->morpheFilterHomeList(Ljava/util/List;)Ljava/util/List;
        move-result-object v2
        iput-object v2, v1, $MODELS$type;->$field:Ljava/util/List;
        :container_$index
    """.trimIndent() }.joinToString("\n")
    host.helper("morpheAcceptHome", listOf(BASIC, "Z"), "Z", 3, """
        if-eqz p1, :reject
        if-eqz p0, :keep
        instance-of v0, p0, ${MODELS}SingleUgcItem;
        if-nez v0, :reject
        instance-of v0, p0, ${MODELS}OperationCreatorItem;
        if-nez v0, :reject
        iget-object v1, p0, ${BASIC}->cardType:Ljava/lang/String;
        invoke-static {v1}, ${host.type}->morpheIsUserType(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :reject
        ${equalsAny("v1", listOf("intl_single_variety"), "reject")}
        iget-object v1, p0, ${BASIC}->cardGoto:Ljava/lang/String;
        invoke-static {v1}, ${host.type}->morpheIsUserType(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :reject
        $containers
        :keep
        const/4 v0, 0x1
        return v0
        :reject
        const/4 v0, 0x0
        return v0
    """)
}

private fun installSearchFilter(host: MutableClass) {
    host.helper("morpheFilterSearch", listOf("${SEARCH}SearchResultAll;"), "${SEARCH}SearchResultAll;", 8, """
        if-eqz p0, :done
        iget-object v2, p0, ${SEARCH}SearchResultAll;->items:Ljava/util/ArrayList;
        if-eqz v2, :navigation
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
        move-result-object v2
        :items
        invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
        move-result v0
        if-eqz v0, :set_items
        invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v3
        instance-of v0, v3, ${SEARCH}BaseSearchItem;
        if-eqz v0, :keep_item
        move-object v4, v3
        check-cast v4, ${SEARCH}BaseSearchItem;
        iget-object v4, v4, ${SEARCH}BaseSearchItem;->module:Ljava/lang/String;
        invoke-static {v4}, ${host.type}->morpheIsUserType(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :items
        :keep_item
        invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :items
        :set_items
        iput-object v1, p0, ${SEARCH}SearchResultAll;->items:Ljava/util/ArrayList;
        :navigation
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        iget-object v2, p0, ${SEARCH}SearchResultAll;->nav:Ljava/util/ArrayList;
        if-eqz v2, :fallback
        invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
        move-result-object v2
        :nav_loop
        invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
        move-result v0
        if-eqz v0, :fallback
        invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v3
        check-cast v3, ${SEARCH}SearchResultAll${'$'}NavInfo;
        if-eqz v3, :nav_loop
        iget-wide v4, v3, ${SEARCH}SearchResultAll${'$'}NavInfo;->type:J
        const-wide/16 v6, 0x7
        cmp-long v4, v4, v6
        if-nez v4, :nav_loop
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :set_nav
        :fallback
        new-instance v3, ${SEARCH}SearchResultAll${'$'}NavInfo;
        invoke-direct {v3}, ${SEARCH}SearchResultAll${'$'}NavInfo;-><init>()V
        const-wide/16 v4, 0x7
        iput-wide v4, v3, ${SEARCH}SearchResultAll${'$'}NavInfo;->type:J
        invoke-static {}, Lcom/bilibili/base/BiliContext;->application()Landroid/app/Application;
        move-result-object v2
        invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
        move-result-object v2
        const-string v0, "category_bangumi_new"
        const-string v4, "string"
        const-string v5, "com.bstar.intl"
        invoke-virtual {v2, v0, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
        move-result v0
        invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
        move-result-object v0
        iput-object v0, v3, ${SEARCH}SearchResultAll${'$'}NavInfo;->name:Ljava/lang/String;
        invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        :set_nav
        iput-object v1, p0, ${SEARCH}SearchResultAll;->nav:Ljava/util/ArrayList;
        :done
        return-object p0
    """)
}

private fun BytecodePatchContext.serializedField(type: String, key: String): Field = classDefBy(type).fields.single { field ->
    field.annotations.any { annotation -> annotation.type == "Lcom/google/gson/annotations/SerializedName;" &&
        annotation.elements.any { it.name == "value" && (it.value as? StringEncodedValue)?.value == key } }
}

private fun BytecodePatchContext.installRecommendationFilter(host: MutableClass) {
    val response = "${RECOMMEND}RecommendResponse;"
    val module = "${RECOMMEND}RecommendModule;"
    val item = "${RECOMMEND}RecommendItem;"
    val modules = listOf("recommend", "recommend_horizontal").map { serializedField(response, it) }
    val list = serializedField(module, "list")
    val card = serializedField(item, "card_type")
    val goto = serializedField(item, "goto")
    require(list.type == "Ljava/util/List;" && card.type == "Ljava/lang/String;" && goto.type == "Ljava/lang/String;")
    host.helper("morpheFilterRecommendModule", listOf(module), "V", 5, """
        if-eqz p0, :done
        iget-object v2, p0, $list
        if-eqz v2, :done
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v2
        :loop
        invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
        move-result v0
        if-eqz v0, :set_list
        invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v3
        if-eqz v3, :keep
        move-object v4, v3
        check-cast v4, $item
        iget-object v0, v4, $card
        invoke-static {v0}, ${host.type}->morpheIsUserType(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :loop
        iget-object v0, v4, $goto
        invoke-static {v0}, ${host.type}->morpheIsUserType(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :loop
        :keep
        invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :loop
        :set_list
        iput-object v1, p0, $list
        :done
        return-void
    """)
    host.helper("morpheFilterRecommendations", listOf(response), response, 1, """
        if-eqz p0, :done
        ${modules.joinToString("\n") { "iget-object v0, p0, $it\ninvoke-static {v0}, ${host.type}->morpheFilterRecommendModule($module)V" }}
        :done
        return-object p0
    """)
}

private fun installHistoryFilter(host: MutableClass) {
    host.helper("morpheFilterHistory", listOf("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;", 5, """
        if-eqz p0, :done
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
        move-result-object v2
        const/4 v4, 0x0
        :loop
        invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
        move-result v0
        if-eqz v0, :finish
        invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v3
        instance-of v0, v3, $HISTORY
        if-eqz v0, :keep
        move-object v0, v3
        check-cast v0, $HISTORY
        iget-object v0, v0, $HISTORY->businessId:Ljava/lang/String;
        const-string p0, "3"
        invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-nez v0, :loop
        const/4 v4, 0x1
        :keep
        invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :loop
        :finish
        if-nez v4, :return_list
        invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V
        :return_list
        return-object v1
        :done
        return-object p0
    """)
}
