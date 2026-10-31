.class public final Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress14;
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
.field private final callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
# direct methods
.method public constructor <init>(Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;)V
    .locals 1
    iput-object p1, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress14;->callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
    const/4 v0, 0x0
    invoke-direct {p0, v0}, LX/Chc;-><init>(I)V
    return-void
.end method
# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0
    invoke-virtual {p0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress14;->invoke()V
    sget-object p0, LX/Cbr;->A00:LX/Cbr;
    return-object p0
.end method
.method public final invoke()V
    .locals 1
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress14;->callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;
    invoke-virtual {v0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback14;->openInternalSettings()V
    return-void
.end method
