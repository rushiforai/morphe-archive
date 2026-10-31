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

private const val PROMOTION_GROUP = "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;"
private const val PROMOTION_OPTIONS = "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions;"
private const val PROMOTION_PREDICATE = "morpheIsPublisherPromotionGroup"

/** Cover recirculation and section callers that bypass homepage visibility. */
context(context: BytecodePatchContext)
internal fun suppressMediahuisGroupPromotions() {
    val adapter = Fingerprint(definingClass = PROMOTION_GROUP, name = "getGroupOptions",
        returnType = PROMOTION_OPTIONS, parameters = emptyList()).uniqueMatch().classDef
    check(adapter.methods.any { it.name == "morpheIsNytPromotionGroup" }) { "Expected the precise NYT predicate first" }
    check(adapter.methods.any { it.name == "morpheIsShopPromotionGroup" }) { "Expected the precise footer Shop predicate first" }
    check(adapter.methods.none { it.name == PROMOTION_PREDICATE }) { "Duplicate Mediahuis group predicate" }
    val helper = MutableMethod(ImmutableMethod(PROMOTION_GROUP, PROMOTION_PREDICATE,
        listOf(ImmutableMethodParameter(PROMOTION_GROUP, emptySet(), null)), "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
    helper.addInstructions(0, GROUP_PROMOTION_CODE.trimIndent())
    check(adapter.methods.add(helper)) { "Could not add Mediahuis group predicate" }
    val components = Fingerprint(
        definingClass = "Lcom/mediahuis/oneapps/cueappsdk/domain/internal/griditem/usecases/GetComponentItemsForGroupUseCase;",
        name = "execute", returnType = "Lkotlinx/coroutines/flow/Flow;",
        parameters = listOf(
            "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/StoryBlockType;", PROMOTION_GROUP,
            PROMOTION_OPTIONS, "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/models/GridItemData\$PageConfig;",
            "Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/models/GridItemData\$TeaserConfig;", "Ljava/lang/String;",
            "Lcom/mediahuis/oneapps/cueappsdk/data/personalised/helpers/PersonalisedArticlesRequestCombiner;", "Ljava/util/List;",
        ),
    ).uniqueMatch().method
    check(components.accessFlags and AccessFlags.STATIC.value == 0 &&
        components.implementation!!.registerCount >= 10) { "Expected original instance group component builder with a scratch local" }
    components.addInstructionsWithLabels(0, """
        invoke-static/range {p2 .. p2}, $PROMOTION_GROUP->$PROMOTION_PREDICATE($PROMOTION_GROUP)Z
        move-result v0
        if-eqz v0, :originalPromotionComponents
        invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;
        move-result-object v0
        invoke-static {v0}, Lkotlinx/coroutines/flow/FlowKt;->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;
        move-result-object v0
        return-object v0
    """.trimIndent(), ExternalLabel("originalPromotionComponents", components.getInstruction(0)))
}

private val GROUP_PROMOTION_CODE = """
    if-eqz p0, :unmarked_group
    invoke-virtual {p0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;->getGroupOptions()Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions;
    move-result-object v0
    if-eqz v0, :check_nyt
    invoke-virtual {v0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions;->getGroupTheme()Ljava/lang/String;
    move-result-object v0
    const-string v1, "sponsored-content"
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_nyt
    const/4 v0, 0x1
    return v0
    :check_nyt
    invoke-static {p0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;->morpheIsNytPromotionGroup(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;)Z
    move-result v0
    if-nez v0, :identified_promotion
    invoke-static {p0}, Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;->morpheIsShopPromotionGroup(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;)Z
    move-result v0
    return v0
    :identified_promotion
    const/4 v0, 0x1
    return v0
    :unmarked_group
    const/4 v0, 0x0
    return v0
"""
