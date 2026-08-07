.class public Lcom/p1/mobile/putong/core/ui/purchase/b$a;
.super Ll/ur2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/b;->L0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ur2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->C(Lcom/p1/mobile/putong/core/ui/purchase/b;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/wib0;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const-string p0, "p_coin_picks_purchase_popup"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    const-string p0, "p_purchase_page"

    .line 31
    .line 32
    return-object p0
.end method
