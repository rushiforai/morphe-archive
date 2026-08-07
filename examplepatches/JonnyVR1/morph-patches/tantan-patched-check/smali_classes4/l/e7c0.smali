.class public Ll/e7c0;
.super Ll/c4k0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c4k0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/e7c0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e7c0;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic g(Ll/e7c0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e7c0;->i()V

    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/OMSAction;)Z
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/a5i0;->s0()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 13
    .line 14
    if-gtz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    new-instance v0, Ll/c7c0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/c7c0;-><init>(Ll/e7c0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->p0()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "p_quickchat_intropopup,e_quickchat_intropopup_trynow,click"

    .line 28
    .line 29
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->o1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->R5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    new-instance v0, Ll/d7c0;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/d7c0;-><init>(Ll/e7c0;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 v1, 0x3e8

    .line 56
    .line 57
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 58
    .line 59
    .line 60
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/c4k0;->b()V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "quickchat"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic i()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->o0(Lcom/p1/mobile/android/app/Act;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
