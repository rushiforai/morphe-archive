.class public Ll/mlk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/clk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/kcg0;

.field public b:Ljava/lang/String;

.field public c:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/data/Links;

.field public f:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/mlk;->b:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/mlk;->c:Ljava/util/Set;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/mlk;->d:Ljava/util/List;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Ll/mlk;->f:Z

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic e0(Ll/mlk;Ljava/lang/String;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mlk;->s0(Ljava/lang/String;Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic f0(Ll/mlk;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mlk;->o0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g0(Ll/mlk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mlk;->n0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h0(Ll/mlk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mlk;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/mlk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mlk;->t0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/mlk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mlk;->p0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/mlk;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mlk;->q0(Landroid/util/Pair;)V

    return-void
.end method

.method private synthetic o0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/clk;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/clk;->F(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic p0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/clk;

    .line 4
    .line 5
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/clk;->F(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->A6()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/elk;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/elk;-><init>(Ll/mlk;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/flk;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/flk;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->e9()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/glk;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/glk;-><init>(Ll/mlk;)V

    .line 70
    .line 71
    .line 72
    new-instance v2, Ll/hlk;

    .line 73
    .line 74
    invoke-direct {v2, p0}, Ll/hlk;-><init>(Ll/mlk;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m0(Ljava/lang/String;Landroid/util/Pair;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 20
    .line 21
    iget-object v2, p0, Ll/mlk;->c:Ljava/util/Set;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Ll/mlk;->c:Ljava/util/Set;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ll/mlk;->d:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v0, Ll/clk;

    .line 47
    .line 48
    iget-object p0, p0, Ll/mlk;->d:Ljava/util/List;

    .line 49
    .line 50
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p2, Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {v0, p0, p2, p1}, Ll/clk;->G(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic n0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/clk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clk;->J()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q0(Landroid/util/Pair;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/mlk;->f:Z

    .line 3
    .line 4
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 7
    .line 8
    iput-object v0, p0, Ll/mlk;->e:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iget-object v0, p0, Ll/mlk;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Landroid/util/Pair;

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Ll/mlk;->m0(Ljava/lang/String;Landroid/util/Pair;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/mlk;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s0(Ljava/lang/String;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/mlk;->e:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object v0, p0, Ll/mlk;->c:Ljava/util/Set;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/mlk;->d:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 15
    .line 16
    .line 17
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p2, Landroid/util/Pair;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/mlk;->m0(Ljava/lang/String;Landroid/util/Pair;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/clk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clk;->E()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mlk;->e:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/mlk;->f:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/mlk;->f:Z

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 24
    .line 25
    iget-object v1, p0, Ll/mlk;->b:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, p0, Ll/mlk;->e:Lcom/p1/mobile/putong/data/Links;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/e;->c9(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/klk;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/klk;-><init>(Ll/mlk;)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ll/llk;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/llk;-><init>(Ll/mlk;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public x0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/mlk;->f:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/mlk;->b:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/mlk;->y0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/mlk;->e:Lcom/p1/mobile/putong/data/Links;

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/mlk;->b:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, p0, Ll/mlk;->a:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/mlk;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Ll/clk;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/clk;->H()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 34
    .line 35
    const-string v1, ""

    .line 36
    .line 37
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/api/e;->c9(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/ilk;

    .line 46
    .line 47
    invoke-direct {v1, p0, p1}, Ll/ilk;-><init>(Ll/mlk;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance p1, Ll/jlk;

    .line 51
    .line 52
    invoke-direct {p1, p0}, Ll/jlk;-><init>(Ll/mlk;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Ll/mlk;->a:Ll/kcg0;

    .line 64
    .line 65
    return-void
.end method
