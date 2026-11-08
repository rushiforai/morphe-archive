.class public final Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;
.super LX/DvA;
.implements LX/Fc9;

.method public final invoke(Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;)V
    .locals 4

    const/4 v2, 0x0

    invoke-static {p1, v2}, LX/CPK;->A0k(Ljava/lang/Object;I)V

    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onDismiss:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    iget v1, p1, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;->id:I

    move v3, v1

    if-eqz v3, :cond_5

    const/4 v0, 0x1

    if-eq v3, v0, :cond_4

    const/4 v0, 0x2

    if-eq v3, v0, :cond_3

    const/4 v0, 0x3

    if-ne v3, v0, :cond_0

    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$clearingOverridesToast:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onClearOverrides:Lkotlin/jvm/functions/Function0;

    :goto_0
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_0
    const/4 v0, 0x4

    if-ne v3, v0, :cond_1

    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugJsonBridge;->exportOverrides(Landroid/content/Context;)V

    return-void

    :cond_1
    const/4 v0, 0x5

    if-ne v3, v0, :cond_2

    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    invoke-static {v1}, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugJsonBridge;->importOverrides(Landroid/content/Context;)V

    :cond_2
    return-void

    :cond_3
    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$forcingEmergencyPushToast:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onForceEmergencyPush:Lkotlin/jvm/functions/Function0;

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$refreshingConfigsToast:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onForceRefresh:Lkotlin/jvm/functions/Function0;

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onOpenOverlayConfigs:Lkotlin/jvm/functions/Function0;

    if-eqz v0, :cond_2

    goto :goto_0
.end method
