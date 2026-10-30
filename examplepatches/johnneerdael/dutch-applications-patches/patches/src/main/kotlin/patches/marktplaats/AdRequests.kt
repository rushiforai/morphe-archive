package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

private const val root = "Lcom/horizon/android/"
private const val container = "${root}core/advertising/nativead/view/NativeAdContainer;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressAdRequests() {
    // Return the native absent-view state before reading/marking the banner cache.
    exact("Le13;", "q(Landroid/content/Context;I${root}core/datamodel/TargetingConfiguration;${root}core/datamodel/search/ItemsVisualisation;)Landroid/view/View;",
        1, 12, 108).addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    // This factory already returns null when no context is available; every
    // original caller has the corresponding nullable-view branch.
    exact("Lecc;", "a(Landroid/content/Context;Lrcc;Lwbc;Lnkg;)Lcom/pubmatic/sdk/openwrap/banner/POBBannerView;",
        17, 11, 36).addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    // Finish with the real no-content callback; never leave on-start pending or
    // claim a loaded ad without a view. VIP callbacks write their failed state.
    exact("Ls2i;", "a(Landroid/content/Context;Landroid/view/ViewGroup;${root}core/datamodel/TargetingConfiguration;[Lok;Ljava/lang/String;" +
        "Lkotlin/jvm/functions/Function0;".repeat(3) + ")V", 17, 12, 32)
        .addInstructions(0, "invoke-interface {p8}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;\nreturn-void")

    // The same dispatcher also handles real tabs, favorites and refresh actions.
    // Only the four advertising actions are suppressed. Mirror high p1 to a
    // low local before instance-of (its DEX format uses four-bit registers).
    exact("${root}feature/feeds/homepage/ui/e;", "c(Ldx6;)V", 17, 22, 407).addInstructions(0, """
        move-object/from16 v0, p1
        instance-of v1, v0, Lww6;
        if-nez v1, :no_ad
        instance-of v1, v0, Lsw6;
        if-nez v1, :no_ad
        instance-of v1, v0, Low6;
        if-nez v1, :no_ad
        instance-of v1, v0, Lyw6;
        if-nez v1, :no_ad
        goto :original
        :no_ad
        return-void
        :original
    """.trimIndent())

    // Preserve View's native attachment while preventing observer registration
    // and delayed viewability work. Detachment/disposal remain unchanged.
    exact(container, "onAttachedToWindow()V", 17, 4, 18).addInstructions(1, "return-void")
    suppressAdAdmission()
    suppressAdFallbacks()
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun suppressAdAdmission() {
    // Close admission as well as transport: disabled senders must not leave
    // measurement maps, Handler callbacks or per-event coroutines growing.
    exact(container, "a(Z)V", 17, 14, 82).addInstructions(0, "return-void")
    exact("Lal;", "b($container)V", 17, 12, 44).addInstructions(0, "return-void")
    exact("Lida;", "a($container)V", 17, 5, 12).addInstructions(0, "return-void")
    val metrics = "${root}core/advertising/banners/tracking/"
    val data = "${metrics}BannerMetricsData;"
    exact("${metrics}b;", "a($data)V", 17, 5, 10).addInstructions(0, "return-void")
    val discard = "sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;\nreturn-object v0"
    exact("${metrics}a;", "a(${data}Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;",
        17, 9, 59).addInstructions(0, discard)

    val repository = "${root}core/advertising/nativead/a;"
    exact(repository, "a(${root}core/datamodel/nativead/NativeAdvertisementRequest;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;",
        17, 8, 43).addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    exact(repository, "c(${root}core/datamodel/nativead/NativeAdEvent;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;",
        17, 8, 39).addInstructions(0, discard)
    val search = "${root}feature/search/search/usecase/a;"
    exact(search, "b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/jvm/internal/SuspendLambda;)Ljava/lang/Object;",
        17, 13, 13).addInstructions(0, discard)
    exact(search, "c(Ljava/util/List;${root}core/datamodel/search/ItemsVisualisation;Lkotlin/coroutines/jvm/internal/SuspendLambda;)Ljava/lang/Object;",
        17, 6, 11).addInstructions(0, discard)
}
