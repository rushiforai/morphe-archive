.class public final Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;
.super LX/9V4;
.implements LX/0Sp;

.method public final invoke(Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;)V
    .locals 4

    .line 0
    const/4 v2, 0x0

    .line 1
    invoke-static {p1, v2}, LX/Esx;->A0d(Ljava/lang/Object;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onDismiss:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iget v1, p1, Lcom/facebook/aura/vds/compose/contextmenu/AuraContextMenuItem;->id:I

    move v3, v1

    .line 10
    .line 11
    if-eqz v3, :cond_5

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-eq v3, v0, :cond_4

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    if-eq v3, v0, :cond_3

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    if-ne v3, v0, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$clearingOverridesToast:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onClearOverrides:Lkotlin/jvm/functions/Function0;

    .line 34
    .line 35
    :goto_0
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
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

    .line 39
    :cond_3
    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$forcingEmergencyPushToast:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onForceEmergencyPush:Lkotlin/jvm/functions/Function0;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_4
    iget-object v1, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$context:Landroid/content/Context;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$refreshingConfigsToast:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onForceRefresh:Lkotlin/jvm/functions/Function0;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_5
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugScreenKt$OptionsMenu$1$1$1;->$onOpenOverlayConfigs:Lkotlin/jvm/functions/Function0;

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    goto :goto_0
.end method
