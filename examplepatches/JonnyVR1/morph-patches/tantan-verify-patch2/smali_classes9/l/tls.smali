.class public final Ll/tls;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/pls;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0017\u0012\u000e\u0010\u0005\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u0015\u0010\r\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001d\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\n\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/tls;",
        "Ll/y8s;",
        "Ll/oo2;",
        "Ll/pls;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "R3",
        "()V",
        "t",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;",
        "V3",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V",
        "",
        "helpUrl",
        "",
        "height",
        "U3",
        "(Ljava/lang/String;I)V",
        "W3",
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
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
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
    return-void
.end method

.method public static S3(Ll/tls;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/pls;

    .line 8
    .line 9
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1, p0}, Ll/pls;-><init>(Lcom/p1/mobile/android/app/Act;Ll/tls;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->n(Ll/y8s;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/pls;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Ll/pls;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p0, Ll/pls;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/pls;->g0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public static T3(Ll/tls;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tls;->W3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public R3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->R3()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xls;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/xls;-><init>(Ll/dum;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final U3(Ljava/lang/String;I)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/16 v0, 0x1b66

    .line 15
    .line 16
    invoke-static {v0}, Ll/px50;->c(I)Ll/px50$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/16 v0, 0x50

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/16 v0, 0x18

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {}, Ll/bnl0;->y0()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p1, v0, p2}, Ll/px50$a;->A(II)Ll/px50$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final V3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkin;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveGiftSkinEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;->showGiftSkinDetail()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final W3()V
    .locals 5

    .line 1
    new-instance v0, Ll/eyj;

    .line 2
    .line 3
    const/16 v1, 0x1b66

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/eyj;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4}, Ll/oo2;->j0()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-static {v3, v4}, Ll/mc50;->R2(Ll/oo2;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-static {v0, v1, v2, v3, v4}, Ll/aiv;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/sls;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/sls;-><init>(Ll/tls;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public t()V
    .locals 2

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveGiftSkinEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveGiftSkinEventGroup;->showGiftSkinList()Ll/v3f$c;

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
    new-instance v1, Ll/rls;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/rls;-><init>(Ll/tls;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
