package patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val SHOP_GROUP = "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;"
private const val SHOP_PARSER = "Lcom/mediahuis/oneapps/cueappsdk/toclean/usecases/DefaultExtractiFrameSourceUseCase;"
private const val SHOP_PREDICATE = "morpheIsShopPromotionGroup"

/** Identify the neutral-theme footer feed using its actual CMS/renderer contract. */
context(context: BytecodePatchContext)
internal fun suppressMediahuisShopPromotion(additionalHost: String? = null) {
    check(additionalHost == null || additionalHost.matches(Regex("[a-z0-9]+(?:[.-][a-z0-9]+)*"))) {
        "Expected an exact publisher Shop hostname"
    }
    Fingerprint(definingClass = SHOP_PARSER, name = "<init>", returnType = "V", parameters = emptyList()).uniqueMatch()
    Fingerprint(definingClass = SHOP_PARSER, name = "execute", returnType = "Ljava/lang/String;",
        parameters = listOf("Ljava/lang/String;")).uniqueMatch()
    val adapter = Fingerprint(definingClass = SHOP_GROUP, name = "getGroupOptions",
        returnType = "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions;", parameters = emptyList()).uniqueMatch().classDef
    check(adapter.methods.none { it.name == SHOP_PREDICATE }) { "Duplicate Mediahuis footer Shop predicate" }
    val helper = MutableMethod(ImmutableMethod(SHOP_GROUP, SHOP_PREDICATE,
        listOf(ImmutableMethodParameter(SHOP_GROUP, emptySet(), null)), "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList())))
    val additionalHostCheck = additionalHost?.let { host -> """
        const-string v3, "$host"
        invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
        move-result v3
        if-nez v3, :shop_host
    """.trimIndent() + "\n" } ?: ""
    val source = SHOP_PROMOTION_CODE.trimIndent().replace(
        "const-string v3, \"interactief.standaard.be\"",
        additionalHostCheck + "const-string v3, \"interactief.standaard.be\"",
    )
    helper.addInstructions(0, source)
    fun index(label: String) = source.lineSequence().takeWhile { it.trim() != label }
        .count { it.isNotBlank() && !it.trim().startsWith(":") && !it.trim().startsWith(".") }
    helper.implementation!!.let { body ->
        body.addCatch("Ljava/lang/Exception;", body.newLabelForIndex(index(":try_start")),
            body.newLabelForIndex(index(":try_end")), body.newLabelForIndex(index(":parser_error")))
    }
    check(adapter.methods.add(helper)) { "Could not add Mediahuis footer Shop predicate" }
}

private val SHOP_PROMOTION_CODE = """
    const/4 v0, 0x0
    if-eqz p0, :not_promotion
    :try_start
    invoke-virtual {p0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;->getType()Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter${'$'}GroupType;
    move-result-object v1
    sget-object v2, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter${'$'}GroupType;->Html:Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter${'$'}GroupType;
    if-ne v1, v2, :not_promotion
    invoke-virtual {p0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;->getMainTeasers()Ljava/util/List;
    move-result-object v1
    if-eqz v1, :not_promotion
    invoke-interface {v1}, Ljava/util/List;->size()I
    move-result v2
    const/4 v3, 0x1
    if-ne v2, v3, :not_promotion
    const/4 v2, 0x0
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/models/TeaserItem;
    invoke-virtual {v1}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/models/TeaserItem;->getTeaser()Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/common/CueTeaser;
    move-result-object v1
    instance-of v2, v1, Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/common/CueTeaser${'$'}HtmlBlock;
    if-eqz v2, :not_promotion
    check-cast v1, Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/common/CueTeaser${'$'}HtmlBlock;
    invoke-virtual {v1}, Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/common/CueTeaser${'$'}HtmlBlock;->getName()Ljava/lang/String;
    move-result-object v2
    const-string v3, "HTML | Webshop feed large"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :not_promotion
    invoke-virtual {v1}, Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/common/CueTeaser${'$'}HtmlBlock;->getHtmlBlock()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :not_promotion
    const-string v2, "data-allow-resize"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-eqz v2, :not_promotion
    new-instance v2, Lcom/mediahuis/oneapps/cueappsdk/toclean/usecases/DefaultExtractiFrameSourceUseCase;
    invoke-direct {v2}, Lcom/mediahuis/oneapps/cueappsdk/toclean/usecases/DefaultExtractiFrameSourceUseCase;-><init>()V
    invoke-virtual {v2, v1}, Lcom/mediahuis/oneapps/cueappsdk/toclean/usecases/DefaultExtractiFrameSourceUseCase;->execute(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :not_promotion
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    invoke-virtual {v1}, Landroid/net/Uri;->getUserInfo()Ljava/lang/String;
    move-result-object v2
    if-nez v2, :not_promotion
    invoke-virtual {v1}, Landroid/net/Uri;->getPort()I
    move-result v2
    const/4 v3, -0x1
    if-ne v2, v3, :not_promotion
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v2
    const-string v3, "https"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :not_promotion
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v2
    const-string v3, "interactief.nieuwsblad.be"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :shop_host
    const-string v3, "interactief.standaard.be"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :not_promotion
    :shop_host
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;
    move-result-object v2
    const-string v3, "/optiext/optiextension.dll"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :not_promotion
    const-string v2, "ID"
    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :not_promotion
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :not_promotion
    const/4 v0, 0x1
    :not_promotion
    :try_end
    return v0
    :parser_error
    move-exception v1
    const/4 v0, 0x0
    return v0
"""
