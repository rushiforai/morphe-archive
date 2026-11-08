.class public final Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress15;
.super LX/DvA;
.source ""
.implements Lkotlin/jvm/functions/Function0;
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LX/DvA;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation
.field private final callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback15;
.method public constructor <init>(Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback15;)V
    .locals 1
    iput-object p1, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress15;->callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback15;
    const/4 v0, 0x0
    invoke-direct {p0, v0}, LX/DvA;-><init>(I)V
    return-void
.end method
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0
    invoke-virtual {p0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress15;->invoke()V
    sget-object p0, Lkotlin/Unit;->A00:Lkotlin/Unit;
    return-object p0
.end method
.method public final invoke()V
    .locals 1
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress15;->callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback15;
    invoke-virtual {v0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback15;->openInternalSettings()V
    return-void
.end method
