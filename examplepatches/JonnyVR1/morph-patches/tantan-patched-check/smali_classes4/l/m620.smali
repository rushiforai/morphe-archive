.class public Ll/m620;
.super Ll/p520;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/p520<",
        "Ll/p620;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Frag;

.field public b:Ll/oby;

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/bkj0<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/p520;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/m620;->c:Lrx/subjects/a;

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/android/app/Frag;

    .line 11
    .line 12
    iput-object p1, p0, Ll/m620;->a:Lcom/p1/mobile/android/app/Frag;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A0(Ll/vg60;)Ll/pf60;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vg60;->d()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic C0(Ll/m620;Lcom/p1/mobile/putong/core/data/MyTabTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m620;->R0(Lcom/p1/mobile/putong/core/data/MyTabTask;)V

    return-void
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic E0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    :cond_0
    const/4 v0, 0x1

    .line 51
    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method private F0()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    const-string v2, ""

    .line 32
    .line 33
    const/16 v3, 0x19

    .line 34
    .line 35
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->j7(IJLjava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 42
    .line 43
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Ljava/lang/Long;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    const/16 v4, 0x19

    .line 56
    .line 57
    const-string v5, ""

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Z6(Lcom/p1/mobile/putong/data/Links;JILjava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_1

    .line 76
    .line 77
    invoke-static {}, Ll/zxv;->c()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 86
    .line 87
    const/16 v0, 0x14

    .line 88
    .line 89
    const/4 v1, 0x1

    .line 90
    const/4 v2, 0x0

    .line 91
    invoke-virtual {p0, v2, v0, v1}, Ll/f4a;->D3(Lcom/p1/mobile/putong/data/Links;IZ)Lrx/c;

    .line 92
    .line 93
    .line 94
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/dkb;->A7()Lrx/c;

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private synthetic I0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p620;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p620;->q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic J0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p620;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p620;->s()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic L0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p620;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p620;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic N0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p620;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p620;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic O0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p620;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p620;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Q0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p620;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/p620;->l(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private U0(Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->N6()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/v520;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/v520;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->V6()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic h0(Ll/m620;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m620;->L0()V

    return-void
.end method

.method public static synthetic i0(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic j0(Ll/m620;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m620;->U0(Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Ll/m620;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m620;->I0()V

    return-void
.end method

.method public static synthetic l0(Ll/m620;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m620;->N0()V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/data/MyTabTask;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->exposed:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic n0(Ll/m620;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m620;->J0()V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->A7()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic q0(Ll/m620;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m620;->O0()V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic t0(Ll/m620;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m620;->Q0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic u0(Ll/m620;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m620;->P0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->A7()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic y0(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/MyTabTask;
    .locals 1

    .line 1
    new-instance v0, Ll/u520;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u520;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 11
    .line 12
    return-object p0
.end method

.method public static synthetic z0(Ll/m620;Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/m620;->S0(Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public G0()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m620;->a:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    return-object p0
.end method

.method public H0()Ll/dzl;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m620;->b:Ll/oby;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/oby;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/oby;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/m620;->b:Ll/oby;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Ll/oby;->l(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/m620;->b:Ll/oby;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic P0(Ll/bkj0;)V
    .locals 7

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/pf60;

    .line 5
    .line 6
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ljava/util/List;

    .line 9
    .line 10
    check-cast v0, Ll/pf60;

    .line 11
    .line 12
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/lang/Integer;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x0

    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Yp()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/s;->w4()Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->userIds:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-nez v4, :cond_1

    .line 62
    .line 63
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->userIds:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Ljava/lang/String;

    .line 70
    .line 71
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    invoke-virtual {v5, v4}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    new-instance v6, Ll/w520;

    .line 80
    .line 81
    invoke-direct {v6, v4, v5}, Ll/w520;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 82
    .line 83
    .line 84
    const/4 v4, 0x4

    .line 85
    invoke-static {v1, v6, v4}, Ll/jyb;->v(Ljava/util/List;Ll/qcj;I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    if-nez v4, :cond_0

    .line 92
    .line 93
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-eqz v4, :cond_2

    .line 98
    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->reminderType:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminderType;

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iput-object v2, v5, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 106
    .line 107
    invoke-interface {v1, v3, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_0
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->reminderType:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminderType;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    iput-object v2, v4, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_1
    new-instance v2, Ll/x520;

    .line 121
    .line 122
    invoke-direct {v2}, Ll/x520;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 126
    .line 127
    .line 128
    :cond_2
    :goto_0
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 129
    .line 130
    check-cast v2, Ll/p620;

    .line 131
    .line 132
    new-instance v4, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;

    .line 133
    .line 134
    iget-object v5, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast v5, Ljava/lang/Integer;

    .line 137
    .line 138
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    invoke-direct {v4, v0, v1, v5}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;-><init>(ILjava/util/List;I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ll/m620;->H0()Ll/dzl;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v2, v4, v1}, Ll/p620;->i(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;Ll/dzl;)V

    .line 150
    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_3

    .line 165
    .line 166
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 167
    .line 168
    check-cast v1, Ll/p620;

    .line 169
    .line 170
    new-instance v2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;

    .line 171
    .line 172
    iget-object v4, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 173
    .line 174
    check-cast v4, Ll/vg60;

    .line 175
    .line 176
    iget-object v4, v4, Ll/vg60;->a:Ljava/util/List;

    .line 177
    .line 178
    invoke-direct {v2, v4}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;-><init>(Ljava/util/List;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1, v2}, Ll/p620;->j(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;)V

    .line 182
    .line 183
    .line 184
    :cond_3
    iget-object v1, p0, Ll/m620;->c:Lrx/subjects/a;

    .line 185
    .line 186
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    check-cast v1, Ll/bkj0;

    .line 191
    .line 192
    const/4 v2, 0x1

    .line 193
    if-nez v1, :cond_5

    .line 194
    .line 195
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 196
    .line 197
    if-nez v0, :cond_4

    .line 198
    .line 199
    move v3, v2

    .line 200
    :cond_4
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 205
    .line 206
    check-cast p1, Ll/vg60;

    .line 207
    .line 208
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 209
    .line 210
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-static {v1, v0, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    goto :goto_1

    .line 223
    :cond_5
    if-nez v0, :cond_6

    .line 224
    .line 225
    move v3, v2

    .line 226
    :cond_6
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iput-object v0, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 231
    .line 232
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 233
    .line 234
    check-cast p1, Ll/vg60;

    .line 235
    .line 236
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 237
    .line 238
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    iput-object p1, v1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 247
    .line 248
    :goto_1
    iget-object p0, p0, Ll/m620;->c:Lrx/subjects/a;

    .line 249
    .line 250
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/core/data/MyTabTask;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p620;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/p620;->k(Lcom/p1/mobile/putong/core/data/MyTabTask;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/m620;->c:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/bkj0;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, 0x1

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    move v1, v2

    .line 23
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-static {p1, v0, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    if-nez p1, :cond_2

    .line 35
    .line 36
    move v1, v2

    .line 37
    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 42
    .line 43
    :goto_0
    iget-object p0, p0, Ll/m620;->c:Lrx/subjects/a;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic S0(Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V
    .locals 8

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eq p2, p3, :cond_1

    .line 12
    .line 13
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 14
    .line 15
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-ne p2, p3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v4, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    move v4, v0

    .line 25
    :goto_1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-ne p2, p3, :cond_2

    .line 32
    .line 33
    move v5, v0

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move v5, v1

    .line 36
    :goto_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    if-eqz v5, :cond_3

    .line 51
    .line 52
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 53
    .line 54
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->gl()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L8()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_3

    .line 99
    .line 100
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_3

    .line 105
    .line 106
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_3

    .line 111
    .line 112
    :goto_3
    move-object v7, v0

    .line 113
    goto :goto_4

    .line 114
    :cond_3
    const/4 v0, 0x0

    .line 115
    goto :goto_3

    .line 116
    :goto_4
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_4

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string p3, "e_iliked_letter"

    .line 131
    .line 132
    invoke-static {p3, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-eqz p2, :cond_5

    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->new_()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    const-string p3, "localLikersUser"

    .line 154
    .line 155
    invoke-static {p3}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    iput-object p3, p2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 160
    .line 161
    new-instance v3, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 162
    .line 163
    invoke-direct {v3, p1, p2}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Ll/m620;->H0()Ll/dzl;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    const/4 v6, 0x0

    .line 171
    invoke-interface/range {v2 .. v7}, Ll/dzl;->d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    :cond_5
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/e620;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/e620;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/g620;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/g620;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/h620;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/h620;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/m620;->c:Lrx/subjects/a;

    .line 58
    .line 59
    new-instance v1, Ll/i620;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/i620;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/j620;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/j620;-><init>(Ll/m620;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 91
    .line 92
    iget-object v0, v0, Ll/dkb;->i7:Lrx/subjects/a;

    .line 93
    .line 94
    new-instance v1, Ll/k620;

    .line 95
    .line 96
    invoke-direct {v1}, Ll/k620;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/l620;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/l620;-><init>(Ll/m620;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 126
    .line 127
    const-string v1, "svip"

    .line 128
    .line 129
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/r520;

    .line 138
    .line 139
    invoke-direct {v1}, Ll/r520;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Ll/s520;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/s520;-><init>(Ll/m620;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 160
    .line 161
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 162
    .line 163
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->w5()Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 168
    .line 169
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 170
    .line 171
    invoke-virtual {v2}, Ll/f4a;->K3()Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    new-instance v3, Ll/t520;

    .line 176
    .line 177
    invoke-direct {v3}, Ll/t520;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    new-instance v1, Ll/f620;

    .line 193
    .line 194
    invoke-direct {v1, p0}, Ll/f620;-><init>(Ll/m620;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "+",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/y520;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/y520;-><init>(Ll/m620;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "task verify 1"

    .line 12
    .line 13
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/z520;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/z520;-><init>(Ll/m620;)V

    .line 23
    .line 24
    .line 25
    const-string v2, "task verify 2"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/a620;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/a620;-><init>(Ll/m620;)V

    .line 37
    .line 38
    .line 39
    const-string v2, "task boost"

    .line 40
    .line 41
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/c620;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/c620;-><init>(Ll/m620;)V

    .line 51
    .line 52
    .line 53
    const-string v2, "task mbti"

    .line 54
    .line 55
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/d620;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/d620;-><init>(Ll/m620;)V

    .line 65
    .line 66
    .line 67
    const-string p0, "task game"

    .line 68
    .line 69
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    return-object v0
.end method

.method public f0(IILandroid/content/Intent;)V
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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->re()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eq p2, p1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eq p2, p1, :cond_0

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-ne p2, p1, :cond_1

    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/q520;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/q520;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/b620;

    .line 53
    .line 54
    invoke-direct {v0, p0, p3, p2}, Ll/b620;-><init>(Ll/m620;Landroid/content/Intent;I)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public g0(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Ll/m620;->F0()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method
