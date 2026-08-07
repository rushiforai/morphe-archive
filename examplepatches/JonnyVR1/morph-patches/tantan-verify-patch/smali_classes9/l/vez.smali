.class public Ll/vez;
.super Ll/j3z;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/j3z<",
        "Ll/n2;",
        ">;"
    }
.end annotation


# instance fields
.field public b:I

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j3z;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/vez;->b:I

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/vez;->c:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/vez;->d:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/vez;->e:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/vez;->f:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Ll/vez;->g:Z

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/vez;->h:Lrx/subjects/a;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic h0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object p0, Ll/clz;->F0:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/StickerBundle;Ljava/util/HashMap;Ljava/lang/String;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/rgj;->a(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic l0(Ljava/util/HashMap;Lcom/p1/mobile/putong/core/data/StickerBundle;)Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/lez;

    .line 4
    .line 5
    invoke-direct {v1, p1, p0}, Ll/lez;-><init>(Lcom/p1/mobile/putong/core/data/StickerBundle;Ljava/util/HashMap;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic m0(Ll/vez;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vez;->J0(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n0(Ll/vez;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vez;->H0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic o0(Ll/vez;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vez;->z0(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic q0(Ll/vez;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vez;->G0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic r0(Ljava/util/List;Ljava/lang/Throwable;)Ljava/util/List;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic s0(Ll/y20;Ljava/util/List;)V
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
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic t0(Ll/vez;Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vez;->I0(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A0()V
    .locals 1

    .line 1
    new-instance v0, Ll/iez;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/iez;-><init>(Ll/vez;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public C0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vez;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public D0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vez;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public E0()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/vez;->b:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public F0()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/vez;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final synthetic G0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/n2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->D(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic H0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/vez;->e:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/vez;->e:Z

    .line 7
    .line 8
    sget-object p1, Ll/qzz;->I1:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/nez;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/nez;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/oez;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/oez;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-boolean p1, p0, Ll/vez;->d:Z

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iput-boolean v0, p0, Ll/vez;->d:Z

    .line 46
    .line 47
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p0, Ll/n2;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/n2;->f()V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public final synthetic I0(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vez;->S0(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic J0(Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/jez;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/jez;-><init>(Ll/vez;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/kez;

    .line 35
    .line 36
    invoke-direct {v0, p1}, Ll/kez;-><init>(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final L0(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->S:Lcom/p1/mobile/putong/core/api/z$b;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/a0a;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/a0a;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/pez;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/pez;-><init>(Ll/vez;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/qez;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/qez;-><init>(Ll/vez;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v0, Ll/rez;

    .line 43
    .line 44
    invoke-direct {v0, p1}, Ll/rez;-><init>(Ll/y20;)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ll/sez;

    .line 48
    .line 49
    invoke-direct {p1}, Ll/sez;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public N0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/vez;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public O0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/n2;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/n2;->n(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/vez;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public Q0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vez;->h:Lrx/subjects/a;

    .line 2
    .line 3
    float-to-int p1, p1

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public R0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/vez;->b:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/u1z;->y2(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final S0(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    :goto_1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerPackage;->new_()Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 42
    .line 43
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 44
    .line 45
    const-string p2, "custom_stickers"

    .line 46
    .line 47
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_3

    .line 54
    .line 55
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ll/pf60;

    .line 60
    .line 61
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 62
    .line 63
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Ll/pf60;

    .line 74
    .line 75
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eqz p2, :cond_3

    .line 86
    .line 87
    invoke-interface {p1, p0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerBundle;->new_()Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-interface {p1, p0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-object p1
.end method

.method public Z()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "keyboardUp"

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput-boolean v0, p0, Ll/vez;->d:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "media_keyboard"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput-boolean v0, p0, Ll/vez;->e:Z

    .line 36
    .line 37
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/vez;->A0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public u0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/d3z;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Ll/n2;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/n2;->a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v2, Ll/n2;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v2, v3, v0}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 67
    .line 68
    check-cast v0, Ll/n2;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/n2;->i()V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ll/mez;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/mez;-><init>(Ll/vez;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/vez;->L0(Ll/y20;)V

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method public x0()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vez;->h:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public y0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/vez;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final z0(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 23
    .line 24
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 31
    .line 32
    new-instance v1, Ll/tez;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ll/tez;-><init>(Ljava/util/HashMap;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v1}, Ll/jyb;->w(Ljava/util/List;Ll/qcj;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_5

    .line 50
    .line 51
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ll/pf60;

    .line 56
    .line 57
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 58
    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 70
    .line 71
    const-string v3, "4"

    .line 72
    .line 73
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_3

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 86
    .line 87
    const-string v3, "purchased"

    .line 88
    .line 89
    invoke-static {v3}, Lcom/p1/mobile/putong/data/BundleStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BundleStatus;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 108
    .line 109
    const-string v3, "zh"

    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_4

    .line 120
    .line 121
    const-string v3, "CN"

    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    if-nez v2, :cond_1

    .line 132
    .line 133
    :cond_4
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 134
    .line 135
    move-object v2, v1

    .line 136
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 137
    .line 138
    check-cast v1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 141
    .line 142
    new-instance v3, Ll/uez;

    .line 143
    .line 144
    invoke-direct {v3}, Ll/uez;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-static {v1, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_5
    return-object p1
.end method
