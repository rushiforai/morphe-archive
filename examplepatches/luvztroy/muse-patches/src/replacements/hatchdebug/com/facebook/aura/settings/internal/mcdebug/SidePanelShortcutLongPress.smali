.class public final Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress;
.super LX/9V4;
.source ""
# interfaces
.implements Lkotlin/jvm/functions/Function0;
# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "LX/9V4;",
        "Lkotlin/jvm/functions/Function0<",
        "LX/9dE;",
        ">;"
    }
.end annotation
# instance fields
.field private final callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback;
# direct methods
.method public constructor <init>(Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback;)V
    .locals 1
    iput-object p1, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress;->callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback;
    const/4 v0, 0x0
    invoke-direct {p0, v0}, LX/9V4;-><init>(I)V
    return-void
.end method
# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0
    invoke-virtual {p0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress;->invoke()V
    sget-object p0, LX/9dE;->A00:LX/9dE;
    return-object p0
.end method
.method public final invoke()V
    .locals 1
    iget-object v0, p0, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutLongPress;->callback:Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback;
    invoke-virtual {v0}, Lcom/facebook/aura/settings/internal/mcdebug/SidePanelShortcutCallback;->openInternalSettings()V
    return-void
.end method
