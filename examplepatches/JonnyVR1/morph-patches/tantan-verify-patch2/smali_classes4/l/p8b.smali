.class public Ll/p8b;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/r8b;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/xyd0;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xyd0;

    .line 5
    .line 6
    new-instance v0, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "realPictureShownToastMediaUrls"

    .line 12
    .line 13
    invoke-direct {p1, v1, v0}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/p8b;->a:Ll/xyd0;

    .line 17
    .line 18
    return-void
.end method

.method private synthetic A0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/r8b;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/r8b;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic C0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p8b;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u5f00\u542f\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g0(Ll/p8b;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p8b;->y0(Ll/x20;)V

    return-void
.end method

.method public static synthetic h0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic i0(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic j0(Ll/p8b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p8b;->z0()V

    return-void
.end method

.method public static synthetic k0(Ll/p8b;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p8b;->x0(Ll/x20;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l0(Ll/p8b;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p8b;->u0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m0(Ll/p8b;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p8b;->A0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic n0(Ll/p8b;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p8b;->C0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic o0(Ll/p8b;Lcom/p1/mobile/putong/core/data/RealPicturesInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p8b;->t0(Lcom/p1/mobile/putong/core/data/RealPicturesInfo;)V

    return-void
.end method

.method public static synthetic p0()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string v1, "boost \u5f00\u542f\u5931\u8d25"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic q0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public D0(Lcom/p1/mobile/putong/data/Media;IILl/x20;Ll/x20;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-ne p2, v2, :cond_0

    .line 15
    .line 16
    const-string p2, "WITH_OUTDOOR"

    .line 17
    .line 18
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    filled-new-array {p2}, [Lcom/p1/mobile/putong/data/MediaLabel;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v2, 0x2

    .line 34
    if-ne p2, v2, :cond_1

    .line 35
    .line 36
    const-string p2, "WITH_FULL_BODY"

    .line 37
    .line 38
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    filled-new-array {p2}, [Lcom/p1/mobile/putong/data/MediaLabel;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 51
    .line 52
    :cond_1
    :goto_0
    if-lez p3, :cond_2

    .line 53
    .line 54
    iget-object p2, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-ge p3, p2, :cond_2

    .line 61
    .line 62
    iget-object p2, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p2, p3, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iget-object p2, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p2}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance p1, Ll/e8b;

    .line 90
    .line 91
    invoke-direct {p1, p4}, Ll/e8b;-><init>(Ll/x20;)V

    .line 92
    .line 93
    .line 94
    new-instance p2, Ll/f8b;

    .line 95
    .line 96
    invoke-direct {p2, p5}, Ll/f8b;-><init>(Ll/x20;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/p8b;->r0()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/c8b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/c8b;-><init>(Ll/p8b;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/g8b;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/g8b;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

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
    new-instance v1, Ll/h8b;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/h8b;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/i8b;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/i8b;-><init>(Ll/p8b;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final r0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->G7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/j8b;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/j8b;-><init>(Ll/p8b;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/k8b;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/k8b;-><init>(Ll/p8b;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public s0(Ll/x20;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/m27;->F3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "\u4f18\u5148\u63a8\u8350\u4e2d\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5"

    .line 12
    .line 13
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->E1:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/l8b;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1}, Ll/l8b;-><init>(Ll/p8b;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1, v2}, Ll/u73;->x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/core/data/RealPicturesInfo;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/r8b;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/r8b;->b(Z)V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_5

    .line 10
    .line 11
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/r8b;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/r8b;->d(Lcom/p1/mobile/putong/core/data/RealPicturesInfo;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->fullBody:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 19
    .line 20
    const-string v2, "stock"

    .line 21
    .line 22
    const-string v3, "other"

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->source:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->fullBody:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 44
    .line 45
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->source:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    move v0, v4

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move v0, v1

    .line 56
    :goto_0
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->outdoor:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 57
    .line 58
    if-eqz v5, :cond_1

    .line 59
    .line 60
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->source:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-nez v5, :cond_1

    .line 67
    .line 68
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->outdoor:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 77
    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->source:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_1

    .line 85
    .line 86
    move v2, v4

    .line 87
    goto :goto_1

    .line 88
    :cond_1
    move v2, v1

    .line 89
    :goto_1
    iget-object v3, p0, Ll/p8b;->a:Ll/xyd0;

    .line 90
    .line 91
    invoke-virtual {v3}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ljava/util/HashSet;

    .line 96
    .line 97
    const-string v5, "\u5df2\u81ea\u52a8\u66ff\u6362\u4e3a\u7b26\u5408\u8981\u6c42\u7684\u56fe\u7247"

    .line 98
    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->fullBody:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v3, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_2

    .line 112
    .line 113
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->fullBody:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    invoke-static {v5}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    move v1, v4

    .line 126
    :cond_2
    if-eqz v2, :cond_3

    .line 127
    .line 128
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->outdoor:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v3, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_3

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->outdoor:Lcom/p1/mobile/putong/core/data/RealPictureInfo;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RealPictureInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 143
    .line 144
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v3, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    if-nez v1, :cond_4

    .line 150
    .line 151
    invoke-static {v5}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_3
    move v4, v1

    .line 156
    :cond_4
    :goto_2
    if-eqz v4, :cond_5

    .line 157
    .line 158
    iget-object p0, p0, Ll/p8b;->a:Ll/xyd0;

    .line 159
    .line 160
    invoke-virtual {p0, v3}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    :cond_5
    return-void
.end method

.method public final synthetic u0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/r8b;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ll/r8b;->b(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic x0(Ll/x20;Ll/uxj0;)V
    .locals 1

    .line 1
    new-instance p2, Ll/k83$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p2, v0}, Ll/k83$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p2, v0}, Ll/k83$a;->d(Z)Ll/k83$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/o8b;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/o8b;-><init>(Ll/p8b;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ll/k83$a;->g(Ll/x20;)Ll/k83$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p1}, Ll/k83$a;->f(Ll/x20;)Ll/k83$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/d8b;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/d8b;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/k83$a;->e(Ll/x20;)Ll/k83$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/k83;->k(Ll/k83$a;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic y0(Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->F7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/m8b;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/m8b;-><init>(Ll/p8b;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/n8b;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/n8b;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic z0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/xwa;->f(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
