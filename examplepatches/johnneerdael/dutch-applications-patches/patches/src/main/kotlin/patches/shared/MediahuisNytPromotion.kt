package patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val GROUP_ADAPTER = "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;"
private const val NYT_PREDICATE = "morpheIsNytPromotionGroup"

/** Hide only the positively identified singleton HTML subscriber-benefit card. */
context(context: BytecodePatchContext)
internal fun suppressMediahuisNytPromotion() {
    val target = Fingerprint(definingClass = GROUP_ADAPTER, name = "isHidden_delegate\$lambda\$0",
        returnType = "Z", parameters = listOf(GROUP_ADAPTER)).uniqueMatch()
    check(target.classDef.methods.none { it.name == NYT_PREDICATE }) { "Duplicate Mediahuis NYT predicate" }
    val helper = MutableMethod(ImmutableMethod(GROUP_ADAPTER, NYT_PREDICATE,
        listOf(ImmutableMethodParameter(GROUP_ADAPTER, emptySet(), null)), "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList())))
    val source = NYT_PROMOTION_CODE.trimIndent()
    helper.addInstructions(0, source)
    // InlineSmaliCompiler returns instructions, so retain the parser guard explicitly.
    fun index(label: String) = source.lineSequence().takeWhile { it.trim() != label }
        .count { it.isNotBlank() && !it.trim().startsWith(":") && !it.trim().startsWith(".") }
    helper.implementation!!.let { body ->
        body.addCatch("Ljava/lang/Exception;", body.newLabelForIndex(index(":try_start")),
            body.newLabelForIndex(index(":try_end")), body.newLabelForIndex(index(":parser_error")))
    }
    check(target.classDef.methods.add(helper)) { "Could not add Mediahuis NYT predicate" }
    val visibility = target.method
    visibility.addInstructionsWithLabels(0, """
        invoke-static {p0}, $GROUP_ADAPTER->$NYT_PREDICATE($GROUP_ADAPTER)Z
        move-result v0
        if-eqz v0, :originalNytVisibility
        const/4 v0, 0x1
        return v0
    """.trimIndent(), ExternalLabel("originalNytVisibility", visibility.getInstruction(0)))
}

private val NYT_PROMOTION_CODE = """
    const/4 v0, 0x0
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
    invoke-virtual {v1}, Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/common/CueTeaser${'$'}HtmlBlock;->getHtmlBlock()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :not_promotion
    const/4 v2, 0x0
    invoke-static {v1, v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;
    move-result-object v1
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I
    move-result v2
    const-class v3, Landroid/text/style/URLSpan;
    const/4 v4, 0x0
    invoke-interface {v1, v4, v2, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;
    move-result-object v1
    array-length v2, v1
    const/4 v3, 0x1
    if-ne v2, v3, :not_promotion
    const/4 v2, 0x0
    aget-object v1, v1, v2
    check-cast v1, Landroid/text/style/URLSpan;
    invoke-virtual {v1}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;
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
    const-string v3, "standaard.be"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :canonical_host
    const-string v3, "www.standaard.be"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :not_promotion
    :canonical_host
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;
    move-result-object v1
    const-string v2, "/thenewyorktimes"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    :not_promotion
    :try_end
    return v0
    :parser_error
    move-exception v1
    const/4 v0, 0x0
    return v0
"""
