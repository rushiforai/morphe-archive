package patches.vi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val RESPONSE = "Lnl/vi/feature/curated/data/CuratedNewsResponse;"
private const val MARKETING = "Lnl/vi/feature/curated/data/CurationItem${'$'}Marketing;"

internal val marketingTargets = listOf(
    OwnedMethod(RESPONSE, "getItems()Ljava/util/List;", 17, 1, 2, listOf(
        OwnedEdit(1, emptyList(), emptyList(), listOf(
            "invoke-static {p0}, $RESPONSE->morpheWithoutMarketing(Ljava/util/List;)Ljava/util/List;",
            "move-result-object p0",
        )),
    )),
    OwnedMethod("Lnl/vi/feature/curated/ui/CuratedMarketingItemKt;", "CuratedMarketingItem-2iUBClk($MARKETING" + "FFFFLandroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V", 25, 29, 425, listOf(
        OwnedEdit(0, emptyList(), emptyList(), listOf("return-void")),
    )),
)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun marketingRequestFilter() {
    val owner = exact(RESPONSE, "getItems()Ljava/util/List;").classDef
    check(owner.methods.none { it.name == "morpheWithoutMarketing" })
    val method = MutableMethod(ImmutableMethod(RESPONSE, "morpheWithoutMarketing",
        listOf(ImmutableMethodParameter("Ljava/util/List;", emptySet(), null)), "Ljava/util/List;",
        9, emptySet(), emptySet(), ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    method.addInstructions(0, """
        if-eqz p0, :original
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        instance-of v3, v2, $MARKETING
        if-nez v3, :next
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        invoke-interface {p0}, Ljava/util/List;->size()I
        move-result v1
        invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
        move-result v2
        if-eq v1, v2, :original
        return-object v0
        :original
        return-object p0
    """.trimIndent())
    owner.methods.add(method)
}
