.class public final Ll/ue10;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/mu40;",
        "Ll/qe10;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0015\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\n\u00a8\u0006\r"
    }
    d2 = {
        "Ll/ue10;",
        "Ll/y8s;",
        "Ll/mu40;",
        "Ll/qe10;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "O3",
        "P3",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/qe10;

    .line 8
    .line 9
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-direct {p1, v0, p0}, Ll/qe10;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ue10;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static S3(Ll/ue10;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/qe10;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static T3(Ll/ue10;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object p1, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/ifv;

    .line 8
    .line 9
    iget-object p1, p1, Ll/ifv;->g:Ll/vxd0;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Ll/vxd0;->a(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/qe10;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static U3(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public O3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    const/4 v2, 0x4

    .line 11
    invoke-static {p0, v0, v1, v2}, Ll/bf10;->a0(Ll/i6t;Ll/dum;II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/qe10;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/qe10;->K()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->showMultiCallUpgradeEntryDlg()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/re10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/re10;-><init>(Ll/ue10;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/se10;

    .line 30
    .line 31
    invoke-direct {v2, v1}, Ll/se10;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/te10;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/te10;-><init>(Ll/ue10;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method
