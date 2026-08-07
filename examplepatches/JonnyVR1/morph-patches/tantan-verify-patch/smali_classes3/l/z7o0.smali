.class public Ll/z7o0;
.super Ll/h7o0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/h7o0<",
        "TD;",
        "Ll/t7o0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/h7o0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t7o0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/t7o0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/z7o0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic W3(Ll/z7o0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z7o0;->b4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X3(Ll/z7o0;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z7o0;->c4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/z7o0;Ll/rsn0;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z7o0;->d4(Ll/rsn0;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a4(Ll/z7o0;Ll/psn0;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z7o0;->e4(Ll/psn0;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    return-void
.end method

.method private synthetic b4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic c4(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->N0()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/z7o0;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/u8o0;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->hj:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/u8o0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/t7o0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/t7o0;->c()Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-direct {v1, v0, p0, v2}, Ll/u8o0;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z7o0;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/v1n0;->n()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Ll/v1n0;->q()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic d4(Ll/rsn0;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->W0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ll/rsn0;->b(Z)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic e4(Ll/psn0;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/oo2;->B:Ll/x7g;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/x7g;->A()Ll/cm0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, p2, v0}, Ll/psn0;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/t7o0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/psn0;->C()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Ll/t7o0;->e(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/oo2;->n2()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, p0, v0}, Ll/oo2;->Q1(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public init()V
    .locals 4

    .line 1
    new-instance v0, Ll/psn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/u7o0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/u7o0;-><init>(Ll/z7o0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v3}, Ll/vp20;->p()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-direct {v0, v1, v2, v3}, Ll/psn0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v1, Ll/t7o0;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ll/t7o0;->d(Ll/jic0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/oo2;->m2()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/v7o0;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/v7o0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/w7o0;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/w7o0;-><init>(Ll/z7o0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/x7o0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/x7o0;-><init>(Ll/z7o0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0, v1}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    new-instance v2, Ll/y7o0;

    .line 70
    .line 71
    invoke-direct {v2, p0, v0}, Ll/y7o0;-><init>(Ll/z7o0;Ll/psn0;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    return-void
.end method
