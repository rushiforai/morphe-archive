.class public Ll/l9g;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/h9g;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h9g;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/h9g;-><init>(Lcom/p1/mobile/android/app/Act;Ll/l9g;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic i4(Ll/l9g;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l9g;->m4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j4(Ll/l9g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l9g;->l4()V

    return-void
.end method

.method private synthetic m4(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/h9g;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {v0, p1}, Ll/h9g;->M(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/h9g;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public k4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/h9g;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->q(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic l4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/16 v1, 0x1b59

    .line 12
    .line 13
    invoke-static {v1}, Ll/px50;->c(I)Ll/px50$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Ll/efv;->j:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/h9g;

    .line 30
    .line 31
    iget-object p0, p0, Ll/h9g;->k:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    const/high16 v3, 0x41200000    # 10.0f

    .line 38
    .line 39
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    add-int/2addr p0, v4

    .line 44
    invoke-virtual {v1, v2, p0}, Ll/px50$a;->A(II)Ll/px50$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p0, v1}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/16 v1, 0x50

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/px50$a;->q()Ll/px50;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final n4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/h9g;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/h9g;->J()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/lag;

    .line 9
    .line 10
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 11
    .line 12
    invoke-direct {v0, v1, p0}, Ll/lag;-><init>(Ll/dum;Ll/tk2;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public o4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/h9g;

    .line 4
    .line 5
    iget-object v0, v0, Ll/h9g;->k:Landroid/view/View;

    .line 6
    .line 7
    new-instance v1, Ll/k9g;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/k9g;-><init>(Ll/l9g;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubBigEventDialog()Ll/v3f$d;

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
    new-instance v1, Ll/j9g;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/j9g;-><init>(Ll/l9g;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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
