package patches.marktplaats

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val list = "Ljava/util/List;"
private const val response = "Lcom/horizon/android/feature/search/search/model/FlexibleSearchResponse;"
private const val request = "Lcom/horizon/android/feature/search/search/api/LrpItemsRequest;"
private const val item = "Lcom/horizon/android/core/datamodel/search/SearchResultItem;"
private const val type = "Lcom/horizon/android/core/datamodel/search/SearchResultItemType;"
private const val order = "Lcom/horizon/android/feature/vip/contentorder/VipContentOrder;"
private const val section = "Lcom/horizon/android/feature/vip/VipContentSection;"
private val displayAdTypes = listOf("SRP_HEADER_NATIVE_AD", "SRP_LIST_NATIVE_AD", "DISPLAY_BANNER")

/** Nulls/unknown values pass through; lists without removed elements retain identity. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun listFilter(owner: String, name: String, predicate: String) = MutableMethod(ImmutableMethod(
    owner, name, listOf(ImmutableMethodParameter(list, emptySet(), null)), list, 9, emptySet(), emptySet(),
    ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()),
)).apply {
    addInstructions(0, """
        if-eqz p0, :same
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        $predicate
        :keep
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
        move-result v2
        invoke-interface {p0}, Ljava/util/List;->size()I
        move-result v3
        if-eq v2, v3, :same
        return-object v0
        :same
        return-object p0
    """.trimIndent())
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressAdSlots(removePaidPlacements: Boolean = false) {
    val adTypes = displayAdTypes + if (removePaidPlacements) listOf(
        "ICAS_TOPBLOCK_LISTING", "ICAS_SIBLING_LISTING", "SHIPPING_PROMOTION", "GENAI_PROMOTION",
    ) else emptyList()
    val responseCtor = "<init>(${list}Lcom/horizon/android/core/datamodel/search/Histograms;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Lcom/horizon/android/feature/search/search/api/RecommendedCategoryDataDto;)V"
    val responseMethod = exact(response, responseCtor, 65537, 7, 8)
    val responseClass = target(response, responseCtor).classDef
    check(responseClass.methods.none { it.name == "morpheAdSlots" })
    val typeChecks = adTypes.joinToString("\n") { name -> """
        sget-object v4, $type->$name:$type
        if-eq v3, v4, :next
    """.trimIndent() }
    val rankingCheck = if (removePaidPlacements) """
        invoke-virtual {v2}, $item->getListing()Lcom/horizon/android/core/datamodel/CapiAd;
        move-result-object v3
        if-eqz v3, :keep
        invoke-virtual {v3}, Lcom/horizon/android/core/datamodel/CapiAd;->isAdmarktAd()Z
        move-result v4
        if-nez v4, :next
        invoke-virtual {v3}, Lcom/horizon/android/core/datamodel/CapiAd;->getRankingLabel()Lcom/horizon/android/core/datamodel/RankingLabel;
        move-result-object v3
        if-nez v3, :next
    """.trimIndent() else ""
    responseClass.methods.add(listFilter(response, "morpheAdSlots", """
        instance-of v3, v2, $item
        if-eqz v3, :keep
        check-cast v2, $item
        invoke-virtual {v2}, $item->getItemType()$type
        move-result-object v3
        $typeChecks
        $rankingCheck
    """.trimIndent()))
    // All normal/default/copy paths delegate here; nullable response items stay null.
    responseMethod.addInstructions(1, "invoke-static {p1}, $response->morpheAdSlots($list)$list\nmove-result-object p1")
    // Also guard reads of fields populated after construction by caches/serializers.
    for (signature in listOf("getItems()$list", "component1()$list")) {
        exact(response, signature, 17, 1, 2).addInstructions(1,
            "invoke-static {p0}, $response->morpheAdSlots($list)$list\nmove-result-object p0")
    }
    exact(response, "toAdSearchResult()Lcom/horizon/android/core/datamodel/search/AdSearchResult;", 17, 20, 51)
        .addInstructions(2, "invoke-static {v1}, $response->morpheAdSlots($list)$list\nmove-result-object v1")

    val requestCtor = "<init>($list${list}Lcom/horizon/android/feature/search/search/api/LrpSearchRequest;)V"
    val requestMethod = exact(request, requestCtor, 65537, 4, 7)
    val requestClass = target(request, requestCtor).classDef
    check(requestClass.methods.none { it.name == "morpheAdTypes" })
    val capabilityChecks = adTypes.joinToString("\n") { name -> """
        sget-object v3, $type->$name:$type
        invoke-virtual {v3}, $type->getValue()Ljava/lang/String;
        move-result-object v3
        invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v4
        if-nez v4, :next
    """.trimIndent() }
    requestClass.methods.add(listFilter(request, "morpheAdTypes", capabilityChecks))
    requestMethod.addInstructions(0, "invoke-static {p1}, $request->morpheAdTypes($list)$list\nmove-result-object p1")

    val phone = "getPhoneSections\$vip()$list"
    val phoneMethod = exact(order, phone, 17, 1, 2)
    val tabletMethod = exact(order, "getTabletSections\$vip()$list", 17, 1, 2)
    val orderClass = target(order, phone).classDef
    check(orderClass.methods.none { it.name == "morpheAdSections" })
    orderClass.methods.add(listFilter(order, "morpheAdSections", """
        sget-object v3, $section->DISPLAY_BANNER:$section
        if-eq v2, v3, :next
    """.trimIndent()))
    for (method in listOf(phoneMethod, tabletMethod)) {
        method.addInstructions(1, "invoke-static {p0}, $order->morpheAdSections($list)$list\nmove-result-object p0")
    }
}
