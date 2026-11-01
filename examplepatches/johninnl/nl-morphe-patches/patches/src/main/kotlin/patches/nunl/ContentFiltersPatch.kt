package patches.nunl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel

private const val BLOCK = "Lnl/nu/performance/api/client/interfaces/Block;"
private const val TARGET = "Lnl/nu/performance/api/client/interfaces/Target;"
private const val FLAVORS = "Lnl/nu/performance/api/client/unions/"

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installCommercialFilter() {
    val entry = exact(TRANSFORMER,"transformBlockData","Ljava/util/List;","Ljava/util/List;")
    val cls = entry.classDef
    fun add(name: String, result: String, params: List<String>, locals: Int, code: String, guarded: Boolean = false) {
        check(cls.methods.none { it.name == name }) { "Duplicate NU.nl filter $name" }
        cls.methods.add(helper(TRANSFORMER,name,result,params,locals,code,catchParserErrors=guarded))
    }
    add("morpheCommercialUrl","Z",listOf("Ljava/lang/String;"),4,"""
        if-eqz p0, :allow
        invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
        move-result-object v0
        invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;
        move-result-object v1
        if-eqz v1, :allow
        sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v1
        const-string v2, "shop.nu.nl"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v3
        if-nez v3, :block
        const-string v2, "nu.nl"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v3
        if-nez v3, :own
        const-string v2, "www.nu.nl"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v3
        if-eqz v3, :allow
        :own
        invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :allow
        const-string v1, "/nushop"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v3
        if-nez v3, :block
        const-string v1, "/nushop/"
        invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v3
        if-nez v3, :block
        :allow
        const/4 v0, 0x0
        return v0
        :block
        const/4 v0, 0x1
        return v0
    """)
    add("morpheCommercialTarget","Z",listOf(TARGET),8,"""
        if-eqz p0, :allow
        instance-of v0, p0, ${OBJECTS}UrlTarget;
        if-eqz v0, :screen
        move-object v0, p0
        check-cast v0, ${OBJECTS}UrlTarget;
        invoke-virtual {v0}, ${OBJECTS}UrlTarget;->getUrl()Ljava/lang/String;
        move-result-object v0
        goto :url
        :screen
        instance-of v0, p0, ${OBJECTS}ScreenTarget;
        if-eqz v0, :events
        move-object v0, p0
        check-cast v0, ${OBJECTS}ScreenTarget;
        invoke-virtual {v0}, ${OBJECTS}ScreenTarget;->getUrl()Ljava/lang/String;
        move-result-object v0
        :url
        invoke-static {v0}, $TRANSFORMER->morpheCommercialUrl(Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :block
        :events
        invoke-virtual {p0}, $TARGET->getTrackers()${OBJECTS}TargetTrackers;
        move-result-object v0
        if-eqz v0, :allow
        invoke-virtual {v0}, ${OBJECTS}TargetTrackers;->getActivate()Ljava/util/List;
        move-result-object v0
        if-eqz v0, :allow
        invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :events_loop
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v0
        if-eqz v0, :allow
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        instance-of v0, v2, ${OBJECTS}FirebaseTrackingEvent;
        if-eqz v0, :events_loop
        check-cast v2, ${OBJECTS}FirebaseTrackingEvent;
        invoke-virtual {v2}, ${OBJECTS}FirebaseTrackingEvent;->getEventName()Ljava/lang/String;
        move-result-object v0
        const-string v3, "teaser_click"
        invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :events_loop
        invoke-virtual {v2}, ${OBJECTS}FirebaseTrackingEvent;->getFields()Ljava/util/List;
        move-result-object v0
        if-eqz v0, :events_loop
        invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v3
        :fields_loop
        invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
        move-result v0
        if-eqz v0, :events_loop
        invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v4
        check-cast v4, ${OBJECTS}FirebaseTrackingKeyValue;
        invoke-virtual {v4}, ${OBJECTS}FirebaseTrackingKeyValue;->getKey()Ljava/lang/String;
        move-result-object v5
        const-string v6, "teaser_type"
        invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v7
        if-eqz v7, :fields_loop
        invoke-virtual {v4}, ${OBJECTS}FirebaseTrackingKeyValue;->getValue()Ljava/lang/String;
        move-result-object v5
        const-string v6, "advertorial"
        invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v7
        if-nez v7, :block
        goto :fields_loop
        :allow
        const/4 v0, 0x0
        return v0
        :block
        const/4 v0, 0x1
        return v0
    """)
    add("morpheCommercialLink","Z",listOf("${OBJECTS}Link;"),2,"""
        if-eqz p0, :allow
        invoke-virtual {p0}, ${OBJECTS}Link;->getLinkFlavor()${FLAVORS}LinkFlavor;
        move-result-object v0
        instance-of v1, v0, ${FLAVORS}SmallArticleLinkFlavor;
        if-eqz v1, :target
        check-cast v0, ${FLAVORS}SmallArticleLinkFlavor;
        invoke-virtual {v0}, ${FLAVORS}SmallArticleLinkFlavor;->isPartner()Ljava/lang/Boolean;
        move-result-object v0
        if-eqz v0, :target
        invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
        move-result v0
        if-nez v0, :block
        :target
        invoke-virtual {p0}, ${OBJECTS}Link;->getTarget()$TARGET
        move-result-object v0
        invoke-static {v0}, $TRANSFORMER->morpheCommercialTarget($TARGET)Z
        move-result v0
        return v0
        :allow
        const/4 v0, 0x0
        return v0
        :block
        const/4 v0, 0x1
        return v0
    """)
    add("morpheCommercialBlock","Z",listOf(BLOCK),2,"""
        instance-of v0, p0, ${OBJECTS}DpgBannerBlock;
        if-nez v0, :block
        instance-of v0, p0, ${OBJECTS}LinkBlock;
        if-eqz v0, :text
        move-object v0, p0
        check-cast v0, ${OBJECTS}LinkBlock;
        invoke-virtual {v0}, ${OBJECTS}LinkBlock;->getLink()${OBJECTS}Link;
        move-result-object v0
        invoke-static {v0}, $TRANSFORMER->morpheCommercialLink(${OBJECTS}Link;)Z
        move-result v0
        if-nez v0, :block
        :text
        instance-of v0, p0, ${OBJECTS}TextBlock;
        if-eqz v0, :target
        move-object v0, p0
        check-cast v0, ${OBJECTS}TextBlock;
        invoke-virtual {v0}, ${OBJECTS}TextBlock;->getTextFlavor()${FLAVORS}TextFlavor;
        move-result-object v0
        instance-of v0, v0, ${FLAVORS}SponsoredByTextFlavor;
        if-nez v0, :block
        :target
        invoke-virtual {p0}, $BLOCK->getTarget()$TARGET
        move-result-object v0
        invoke-static {v0}, $TRANSFORMER->morpheCommercialTarget($TARGET)Z
        move-result v0
        return v0
        :block
        const/4 v0, 0x1
        return v0
    """)
    // Only structurally decoded CMS section identities are grouped. Plain/invalid IDs fail open.
    add("morpheSection","Ljava/lang/String;",listOf(BLOCK),5,"""
        :try_start
        invoke-virtual {p0}, $BLOCK->getId()Ljava/lang/String;
        move-result-object v0
        const/4 v1, 0x0
        invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
        move-result-object v0
        new-instance v1, Ljava/lang/String;
        const-string v2, "UTF-8"
        invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
        new-instance v0, Lorg/json/JSONObject;
        invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
        const-string v1, "id"
        const-string v2, ""
        invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v1
        const-string v2, ".*-section-[0-9]+-[0-9]+-[0-9]+"
        invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
        move-result v2
        if-eqz v2, :no_section
        const/16 v2, 0x2d
        invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I
        move-result v2
        const/4 v3, 0x0
        invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
        move-result-object v1
        const-string v2, "containerId"
        const-string v3, ""
        invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        const-string v2, "|"
        invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        :try_end
        return-object v0
        :parse_error
        move-exception v0
        :no_section
        const/4 v0, 0x0
        return-object v0
        .catch Ljava/lang/Exception; {:try_start .. :try_end} :parse_error
    """,guarded=true)
    add("morpheFilterAds","Ljava/util/List;",listOf("Ljava/util/List;"),7,"""
        new-instance v0, Ljava/util/HashSet;
        invoke-direct {v0}, Ljava/util/HashSet;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :learn
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :filter_start
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        check-cast v2, ${APP}bff/domain/models/BlockData;
        invoke-interface {v2}, ${APP}bff/domain/models/BlockData;->getBlock()$BLOCK
        move-result-object v2
        instance-of v3, v2, ${OBJECTS}DpgBannerBlock;
        if-nez v3, :learn
        invoke-static {v2}, $TRANSFORMER->morpheCommercialBlock($BLOCK)Z
        move-result v3
        if-eqz v3, :learn
        invoke-static {v2}, $TRANSFORMER->morpheSection($BLOCK)Ljava/lang/String;
        move-result-object v3
        if-eqz v3, :learn
        invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
        goto :learn
        :filter_start
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v2
        :filter
        invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
        move-result v3
        if-eqz v3, :done
        invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v3
        move-object v4, v3
        check-cast v4, ${APP}bff/domain/models/BlockData;
        invoke-interface {v4}, ${APP}bff/domain/models/BlockData;->getBlock()$BLOCK
        move-result-object v4
        invoke-static {v4}, $TRANSFORMER->morpheCommercialBlock($BLOCK)Z
        move-result v5
        if-nez v5, :filter
        invoke-static {v4}, $TRANSFORMER->morpheSection($BLOCK)Ljava/lang/String;
        move-result-object v5
        if-eqz v5, :keep
        invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
        move-result v6
        if-nez v6, :filter
        :keep
        invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
        goto :filter
        :done
        return-object v1
    """)
    entry.method.addInstructions(0,"invoke-static {p1}, $TRANSFORMER->morpheFilterAds(Ljava/util/List;)Ljava/util/List;\nmove-result-object p1")
    val child = exact("${APP}bff/data/mappers/BlockMapper;","adaptToLinkDataOrNull","${APP}bff/domain/models/LinkData;","${OBJECTS}Link;","Ljava/lang/String;").method
    child.addInstructionsWithLabels(0,"""
        invoke-static {p1}, $TRANSFORMER->morpheCommercialLink(${OBJECTS}Link;)Z
        move-result v0
        if-eqz v0, :editorial
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), ExternalLabel("editorial",child.getInstruction(0)))
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun installPremiumFilter() {
    val entry = exact(TRANSFORMER,"transformBlockData","Ljava/util/List;","Ljava/util/List;")
    check(entry.classDef.methods.none { it.name == "morpheFilterPremium" })
    entry.classDef.methods.add(helper(TRANSFORMER,"morpheFilterPremium","Ljava/util/List;",listOf("Ljava/util/List;"),5,"""
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :loop
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        move-object v3, v2
        check-cast v3, ${APP}bff/domain/models/BlockData;
        invoke-interface {v3}, ${APP}bff/domain/models/BlockData;->getBlock()$BLOCK
        move-result-object v3
        instance-of v4, v3, ${OBJECTS}WebAppBlock;
        if-eqz v4, :keep
        invoke-virtual {v3}, $BLOCK->getId()Ljava/lang/String;
        move-result-object v3
        if-eqz v3, :keep
        const-string v4, "contentBlocker-"
        invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v3
        if-nez v3, :loop
        :keep
        invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
        goto :loop
        :done
        return-object v0
    """))
    entry.method.addInstructions(0,"invoke-static {p1}, $TRANSFORMER->morpheFilterPremium(Ljava/util/List;)Ljava/util/List;\nmove-result-object p1")
}
