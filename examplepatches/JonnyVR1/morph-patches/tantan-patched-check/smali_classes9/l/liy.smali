.class public Ll/liy;
.super Ll/bhy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/bhy<",
        "TD;",
        "Ll/zhy;",
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
    invoke-direct {p0, p1}, Ll/bhy;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/zhy;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/zhy;-><init>(Lcom/p1/mobile/android/app/Act;Ll/liy;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic W3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X3(Ll/liy;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/liy;->b4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/liy;Ll/zbr;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/liy;->c4(Ll/zbr;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    return-void
.end method

.method public static synthetic Z3(Ll/liy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/liy;->a4(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic a4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kny;->c(Ll/i6t;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/liy;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/ely;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->we:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ely;

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/zhy;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/zhy;->c()Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberLeaderView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-direct {v1, v0, p0, v2}, Ll/ely;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/liy;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b4(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->m1()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic c4(Ll/zbr;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
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
    invoke-virtual {p1, p2, v0}, Ll/zbr;->I(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/zhy;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/zbr;->C()I

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
    invoke-virtual {p0, p1}, Ll/zhy;->e(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public d4()V
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
    invoke-virtual {v1, p0, v0}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public init()V
    .locals 3

    .line 1
    new-instance v0, Ll/zbr;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/giy;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/giy;-><init>(Ll/liy;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/zbr;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v1, Ll/zhy;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ll/zhy;->d(Ll/jic0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/oo2;->m2()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/hiy;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/hiy;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ll/iiy;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/iiy;-><init>(Ll/liy;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/jiy;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/jiy;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p0, v1}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ll/kiy;

    .line 62
    .line 63
    invoke-direct {v2, p0, v0}, Ll/kiy;-><init>(Ll/liy;Ll/zbr;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method
