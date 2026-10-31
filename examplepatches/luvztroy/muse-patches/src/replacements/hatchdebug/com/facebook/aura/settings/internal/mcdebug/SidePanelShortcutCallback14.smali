.class public final Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
.super LX/Chc;
.source ""
# interfaces
.implements Lkotlin/jvm/functions/Function0;
# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LX/Chc;",
        "Lkotlin/jvm/functions/Function0<",
        "LX/Cbr;",
        ">;"
    }
.end annotation
# instance fields
.field private final originalTap:Lkotlin/jvm/functions/Function0;
.field private final navigator:Lcom/facebook/aura/navigation/AuraNavigator;
# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function0;Lcom/facebook/aura/navigation/AuraNavigator;)V
    .locals 1
    iput-object p1, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;->originalTap:Lkotlin/jvm/functions/Function0;
    iput-object p2, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;->navigator:Lcom/facebook/aura/navigation/AuraNavigator;
    const/4 v0, 0x0
    invoke-direct {p0, v0}, LX/Chc;-><init>(I)V
    return-void
.end method
.method public static maybeWrap(Lcom/facebook/aura/header/view/HeaderLeadingButton;Lkotlin/jvm/functions/Function0;LX/2yV;)Lkotlin/jvm/functions/Function0;
    .locals 2
    sget-object v0, Lcom/facebook/aura/header/view/HeaderLeadingButton;->SidePanel:Lcom/facebook/aura/header/view/HeaderLeadingButton;
    if-ne p0, v0, :return_original
    const/4 v0, 0x0
    invoke-static {p2, p2, v0}, LX/3NK;->A0S(LX/2yV;Ljava/lang/Object;I)Lcom/facebook/aura/navigation/AuraNavigator;
    move-result-object v0
    new-instance v1, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
    invoke-direct {v1, p1, v0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;-><init>(Lkotlin/jvm/functions/Function0;Lcom/facebook/aura/navigation/AuraNavigator;)V
    return-object v1
    :return_original
    return-object p1
.end method
.method public static attachLongPress(LX/2hU;Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;LX/2yV;)LX/2hU;
    .locals 9
    new-instance v0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress14;
    invoke-direct {v0, p1}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress14;-><init>(Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;)V
    move-object/from16 v1, p0
    const-wide/16 v2, 0x0
    move-object/from16 v4, p1
    move-object v5, v0
    move-object/from16 v6, p2
    const/4 v7, 0x0
    const/4 v8, 0x0
    invoke-static/range {v1 .. v8}, Lcom/facebook/aura/vds/compose/ext/ModifierExtKt;->combinedClickableWithDebounce(LX/2hU;JLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;LX/2yV;II)LX/2hU;
    move-result-object v0
    return-object v0
.end method
.method public static maybeAttachLongPress(LX/2hU;Lkotlin/jvm/functions/Function0;LX/2yV;)LX/2hU;
    .locals 1
    instance-of v0, p1, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
    if-eqz v0, :return_original_modifier
    check-cast p1, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
    invoke-static {p0, p1, p2}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;->attachLongPress(LX/2hU;Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;LX/2yV;)LX/2hU;
    move-result-object v0
    return-object v0
    :return_original_modifier
    return-object p0
.end method
.method public static maybeKeepDefaultTap(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
    .locals 1
    instance-of v0, p1, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
    if-eqz v0, :return_original_tap
    const/4 v0, 0x0
    return-object v0
    :return_original_tap
    return-object p0
.end method
# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0
    invoke-virtual {p0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;->invoke()V
    sget-object p0, LX/Cbr;->A00:LX/Cbr;
    return-object p0
.end method
.method public final invoke()V
    .locals 1
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;->originalTap:Lkotlin/jvm/functions/Function0;
    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    move-result-object v0
    return-void
.end method
.method public final openInternalSettings()V
    .locals 3
    sget-object v0, Lcom/facebook/aura/navigation/key/InternalSettingsPage;->MAIN:Lcom/facebook/aura/navigation/key/InternalSettingsPage;
    new-instance v1, Lcom/facebook/aura/navigation/key/AuraInternalSettingsScreenKey;
    invoke-direct {v1, v0}, Lcom/facebook/aura/navigation/key/AuraInternalSettingsScreenKey;-><init>(Lcom/facebook/aura/navigation/key/InternalSettingsPage;)V
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;->navigator:Lcom/facebook/aura/navigation/AuraNavigator;
    const/4 v2, 0x0
    invoke-interface {v0, v1, v2}, Lcom/facebook/aura/navigation/AuraNavigator;->navigate(Lcom/facebook/aura/navigation/AuraNavKey;Z)V
    return-void
.end method
