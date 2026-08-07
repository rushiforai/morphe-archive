.class public Ll/bma;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/fma;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic f0(Ll/bma;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bma;->A0(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/bma;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bma;->D0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/bma;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bma;->x0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic i0(Ll/bma;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bma;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/bma;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bma;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/bma;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bma;->y0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/bma;Lcom/p1/mobile/putong/core/data/Sticker;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bma;->t0(Lcom/p1/mobile/putong/core/data/Sticker;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m0(Ll/bma;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bma;->z0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic n0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic o0(Ll/bma;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bma;->C0(Ljava/util/List;)V

    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/fma;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fma;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic A0(ZLjava/lang/Throwable;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/bma;->b:Ljava/util/List;

    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/fma;

    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ll/fma;->l(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    const-string p2, "limit=40&offset=0"

    .line 16
    .line 17
    iput-object p2, p0, Ll/bma;->a:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/fma;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/fma;->f()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic C0(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/fma;

    .line 4
    .line 5
    iget-object v0, v0, Ll/fma;->j:Ll/fma$d;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Ll/fma$d;->U(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/fma;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/fma;->l(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic D0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/fma;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fma;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bma;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bma;->q0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "&channel="

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v1, ""

    .line 29
    .line 30
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v3, "/stickers?search=trending&"

    .line 55
    .line 56
    invoke-static {v3}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/z;->l3(Ljava/lang/String;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/wla;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/wla;-><init>(Ll/bma;)V

    .line 81
    .line 82
    .line 83
    new-instance v2, Ll/xla;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Ll/xla;-><init>(Ll/bma;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public F0(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bma;->q0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/z;->m3(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/ula;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/ula;-><init>(Ll/bma;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/vla;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1}, Ll/vla;-><init>(Ll/bma;Z)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public G0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "search_word"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    filled-new-array {v0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "e_gif_search"

    .line 12
    .line 13
    const-string v2, "p_stickers_from_suggest"

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/z;->p3(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/qla;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/qla;-><init>(Ll/bma;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/sla;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/sla;-><init>(Ll/bma;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public H0(ZZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bma;->c:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/bma;->d:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/bma;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/tla;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tla;-><init>(Ll/bma;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/bma;->F0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    const/16 v1, 0x12c

    .line 93
    .line 94
    if-lt v0, v1, :cond_0

    .line 95
    .line 96
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 107
    .line 108
    const/4 v2, 0x1

    .line 109
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 110
    .line 111
    .line 112
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 117
    .line 118
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/z$c;->O(Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v1, Ll/yla;

    .line 127
    .line 128
    invoke-direct {v1, p0, p1}, Ll/yla;-><init>(Ll/bma;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 129
    .line 130
    .line 131
    new-instance p1, Ll/zla;

    .line 132
    .line 133
    invoke-direct {p1, p0}, Ll/zla;-><init>(Ll/bma;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public q0()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/bma;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "chat_gif"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-boolean v0, p0, Ll/bma;->d:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const-string p0, "chat_favorite"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    iget-boolean p0, p0, Ll/bma;->e:Z

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    const-string p0, "chat_text_associate_second_page"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const-string p0, ""

    .line 23
    .line 24
    return-object p0
.end method

.method public r0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bma;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 13
    .line 14
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 15
    .line 16
    const p1, 0x9d87

    .line 17
    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g6:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 33
    .line 34
    new-instance p1, Ll/ama;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/ama;-><init>()V

    .line 37
    .line 38
    .line 39
    const-wide/16 v0, 0x32

    .line 40
    .line 41
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/core/data/Sticker;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_0

    .line 40
    .line 41
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 69
    .line 70
    .line 71
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->h6:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 74
    .line 75
    .line 76
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 77
    .line 78
    new-instance p1, Ll/rla;

    .line 79
    .line 80
    invoke-direct {p1}, Ll/rla;-><init>()V

    .line 81
    .line 82
    .line 83
    const-wide/16 v0, 0x32

    .line 84
    .line 85
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic x0(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/fma;

    .line 4
    .line 5
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/fma;->l(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/fma;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/fma;->m()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Ll/bma;->a:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Ljava/util/List;

    .line 28
    .line 29
    iput-object p1, p0, Ll/bma;->b:Ljava/util/List;

    .line 30
    .line 31
    return-void
.end method

.method public final synthetic y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/fma;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fma;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic z0(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/fma;

    .line 4
    .line 5
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/fma;->l(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Ll/bma;->a:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Ljava/util/List;

    .line 21
    .line 22
    iput-object p1, p0, Ll/bma;->b:Ljava/util/List;

    .line 23
    .line 24
    return-void
.end method
