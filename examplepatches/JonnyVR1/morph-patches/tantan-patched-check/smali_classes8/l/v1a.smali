.class public Ll/v1a;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/e2a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/v1a;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/v1a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v1a;->q0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/v1a;Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v1a;->t0(Lcom/p1/mobile/putong/core/data/CoreData;)V

    return-void
.end method

.method public static synthetic g0(Ll/v1a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v1a;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/v1a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v1a;->u0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ll/v1a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v1a;->x0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/v1a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v1a;->s0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic s0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e2a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2a;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/p1a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p1a;-><init>(Ll/v1a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

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
    new-instance v1, Ll/q1a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/q1a;-><init>(Ll/v1a;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public k0(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    iget-object v2, p0, Ll/v1a;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/z$c;->P(Lcom/p1/mobile/putong/core/data/UserSticker;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/t1a;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/t1a;-><init>(Ll/v1a;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/u1a;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/u1a;-><init>(Ll/v1a;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public m0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public n0(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public o0()[Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x9

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic q0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e2a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2a;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e2a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2a;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserSticker;

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
    move-result-object p1

    .line 26
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

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
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerPackage;->new_()Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 42
    .line 43
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 44
    .line 45
    const-string p1, "custom_stickers"

    .line 46
    .line 47
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p0, Ll/e2a;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/e2a;->x(Lcom/p1/mobile/putong/core/data/StickerPackage;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic u0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e2a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2a;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic x0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e2a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2a;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    iget-object v2, p0, Ll/v1a;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/z$c;->W(Lcom/p1/mobile/putong/core/data/UserSticker;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/r1a;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/r1a;-><init>(Ll/v1a;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/s1a;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/s1a;-><init>(Ll/v1a;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public z0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
