.class public abstract Lk73;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x5

    iput-byte v0, p0, Lk73;->a:B

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 52
    iput-object v0, p0, Lk73;->b:Ljava/lang/Object;

    .line 53
    iput-object v0, p0, Lk73;->c:Ljava/lang/Object;

    .line 54
    iput-object v0, p0, Lk73;->d:Ljava/lang/Object;

    .line 55
    iput-object v0, p0, Lk73;->e:Ljava/lang/Object;

    .line 56
    iput-object v0, p0, Lk73;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;La5o;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lk73;->a:B

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p2, p0, Lk73;->b:Ljava/lang/Object;

    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lk73;->c:Ljava/lang/Object;

    .line 49
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk73;->d:Ljava/lang/Object;

    .line 50
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lk73;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Ljs5;Lg1j;Ljv0;Lwln;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lk73;->a:B

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lk73;->b:Ljava/lang/Object;

    .line 42
    iput-object p2, p0, Lk73;->c:Ljava/lang/Object;

    .line 43
    iput-object p3, p0, Lk73;->d:Ljava/lang/Object;

    .line 44
    iput-object p4, p0, Lk73;->e:Ljava/lang/Object;

    .line 45
    iput-object p5, p0, Lk73;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lvnd;Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lk73;->a:B

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lk73;->b:Ljava/lang/Object;

    .line 65
    iput-object p2, p0, Lk73;->c:Ljava/lang/Object;

    .line 66
    invoke-static {}, Lorg/chromium/components/media_router/BrowserMediaRouter;->a()Ldod;

    move-result-object p1

    iput-object p1, p0, Lk73;->d:Ljava/lang/Object;

    .line 67
    iput-object p3, p0, Lk73;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lwjh;La64;)V
    .registers 7

    const/4 v0, 0x4

    iput-byte v0, p0, Lk73;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk73;->b:Ljava/lang/Object;

    iput-object p2, p0, Lk73;->c:Ljava/lang/Object;

    iput-object p3, p0, Lk73;->d:Ljava/lang/Object;

    iget-object p1, p2, Lwjh;->e:Ljava/lang/Object;

    check-cast p1, Ljg8;

    sget-object p2, Lrx5;->b:Lrx5;

    new-instance v0, Lbz1;

    const/4 v1, 0x0

    const/16 v2, 0x9

    invoke-direct {v0, v2, v1, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p3, p1, p2, v0}, Lna2;->f(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;)Li07;

    move-result-object p1

    iput-object p1, p0, Lk73;->e:Ljava/lang/Object;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lk73;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lp83;)V
    .registers 5

    const/4 v0, 0x3

    iput-byte v0, p0, Lk73;->a:B

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lk73;->c:Ljava/lang/Object;

    .line 59
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lk73;->d:Ljava/lang/Object;

    .line 60
    new-instance v1, Landroid/graphics/PathMeasure;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    iput-object v1, p0, Lk73;->e:Ljava/lang/Object;

    .line 61
    iput-object p1, p0, Lk73;->b:Ljava/lang/Object;

    .line 62
    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lk73;->f:Ljava/lang/Object;

    return-void
.end method

.method public static D([F)F
    .registers 5

    const/4 v0, 0x1

    aget v0, p0, v0

    float-to-double v0, v0

    const/4 v2, 0x0

    aget p0, p0, v2

    float-to-double v2, p0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method


# virtual methods
.method public abstract A()V
.end method

.method public B()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final C()V
    .registers 4

    iget-object v0, p0, Lk73;->e:Ljava/lang/Object;

    check-cast v0, Lk73;

    if-eqz v0, :cond_d

    iget-object v1, p0, Lk73;->f:Ljava/lang/Object;

    check-cast v1, Lk73;

    iput-object v1, v0, Lk73;->f:Ljava/lang/Object;

    goto :goto_19

    :cond_d
    iget-object v1, p0, Lk73;->b:Ljava/lang/Object;

    check-cast v1, Lk73;

    if-eqz v1, :cond_19

    iget-object v2, p0, Lk73;->f:Ljava/lang/Object;

    check-cast v2, Lk73;

    iput-object v2, v1, Lk73;->c:Ljava/lang/Object;

    :cond_19
    :goto_19
    iget-object v1, p0, Lk73;->f:Ljava/lang/Object;

    check-cast v1, Lk73;

    if-eqz v1, :cond_22

    iput-object v0, v1, Lk73;->e:Ljava/lang/Object;

    goto :goto_2a

    :cond_22
    iget-object v1, p0, Lk73;->b:Ljava/lang/Object;

    check-cast v1, Lk73;

    if-eqz v1, :cond_2a

    iput-object v0, v1, Lk73;->d:Ljava/lang/Object;

    :cond_2a
    :goto_2a
    const/4 v0, 0x0

    iput-object v0, p0, Lk73;->b:Ljava/lang/Object;

    iput-object v0, p0, Lk73;->f:Ljava/lang/Object;

    iput-object v0, p0, Lk73;->e:Ljava/lang/Object;

    return-void
.end method

.method public abstract a(Lxan;)V
.end method

.method public abstract b(Landroid/graphics/Canvas;Landroid/graphics/Rect;FZZ)V
.end method

.method public final c(Lk73;)V
    .registers 3

    invoke-virtual {p1}, Lk73;->C()V

    invoke-virtual {p1, p0}, Lk73;->w(Lk73;)V

    iget-object v0, p0, Lk73;->d:Ljava/lang/Object;

    check-cast v0, Lk73;

    if-eqz v0, :cond_13

    iput-object p1, v0, Lk73;->f:Ljava/lang/Object;

    iput-object v0, p1, Lk73;->e:Ljava/lang/Object;

    iput-object p1, p0, Lk73;->d:Ljava/lang/Object;

    return-void

    :cond_13
    iput-object p1, p0, Lk73;->c:Ljava/lang/Object;

    iput-object p1, p0, Lk73;->d:Ljava/lang/Object;

    return-void
.end method

.method public abstract d()Ljava/lang/Object;
.end method

.method public final e()V
    .registers 6

    iget-object v0, p0, Lk73;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_c

    return-void

    :cond_c
    iget-object v0, p0, Lk73;->e:Ljava/lang/Object;

    check-cast v0, Li07;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    iget-object v0, p0, Lk73;->d:Ljava/lang/Object;

    check-cast v0, La64;

    iget-object v2, p0, Lk73;->c:Ljava/lang/Object;

    check-cast v2, Lwjh;

    iget-object v2, v2, Lwjh;->d:Ljava/lang/Object;

    check-cast v2, Ljg8;

    new-instance v3, Lyf;

    const/16 v4, 0x14

    invoke-direct {v3, v4, v1, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x2

    invoke-static {v0, v2, v1, v3, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public f(IILandroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 5

    return-void
.end method

.method public abstract g(Landroid/graphics/Canvas;Landroid/graphics/Paint;Lrl7;I)V
.end method

.method public abstract h(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFIII)V
.end method

.method public i()Lk73;
    .registers 1

    iget-object p0, p0, Lk73;->b:Ljava/lang/Object;

    check-cast p0, Lk73;

    return-object p0
.end method

.method public j()I
    .registers 2

    iget-object p0, p0, Lk73;->b:Ljava/lang/Object;

    check-cast p0, Lp83;

    move-object v0, p0

    check-cast v0, Lhfc;

    iget v0, v0, Lp83;->a:I

    check-cast p0, Lhfc;

    iget p0, p0, Lp83;->l:I

    shl-int/lit8 p0, p0, 0x1

    add-int/2addr v0, p0

    return v0
.end method

.method public k()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public final l(Lk73;)V
    .registers 3

    invoke-virtual {p1}, Lk73;->C()V

    iget-object v0, p0, Lk73;->f:Ljava/lang/Object;

    check-cast v0, Lk73;

    iput-object v0, p1, Lk73;->f:Ljava/lang/Object;

    if-eqz v0, :cond_d

    iput-object p1, v0, Lk73;->e:Ljava/lang/Object;

    :cond_d
    iput-object p0, p1, Lk73;->e:Ljava/lang/Object;

    iput-object p1, p0, Lk73;->f:Ljava/lang/Object;

    iget-object p0, p0, Lk73;->b:Ljava/lang/Object;

    check-cast p0, Lk73;

    iput-object p0, p1, Lk73;->b:Ljava/lang/Object;

    iget-object v0, p1, Lk73;->f:Ljava/lang/Object;

    check-cast v0, Lk73;

    if-nez v0, :cond_1f

    iput-object p1, p0, Lk73;->d:Ljava/lang/Object;

    :cond_1f
    return-void
.end method

.method public final m(Lk73;)V
    .registers 3

    invoke-virtual {p1}, Lk73;->C()V

    iget-object v0, p0, Lk73;->e:Ljava/lang/Object;

    check-cast v0, Lk73;

    iput-object v0, p1, Lk73;->e:Ljava/lang/Object;

    if-eqz v0, :cond_d

    iput-object p1, v0, Lk73;->f:Ljava/lang/Object;

    :cond_d
    iput-object p0, p1, Lk73;->f:Ljava/lang/Object;

    iput-object p1, p0, Lk73;->e:Ljava/lang/Object;

    iget-object p0, p0, Lk73;->b:Ljava/lang/Object;

    check-cast p0, Lk73;

    iput-object p0, p1, Lk73;->b:Ljava/lang/Object;

    iget-object v0, p1, Lk73;->e:Ljava/lang/Object;

    check-cast v0, Lk73;

    if-nez v0, :cond_1f

    iput-object p1, p0, Lk73;->c:Ljava/lang/Object;

    :cond_1f
    return-void
.end method

.method public abstract n()V
.end method

.method public o()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final p()V
    .registers 3

    iget-object v0, p0, Lk73;->e:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;

    sget-object v1, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lorg/chromium/base/ApplicationStatus;->d:Landroid/app/Activity;

    check-cast v1, Landroidx/fragment/app/r;

    if-nez v1, :cond_11

    const/4 v1, 0x0

    goto :goto_15

    :cond_11
    invoke-virtual {v1}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    :goto_15
    if-nez v1, :cond_1b

    invoke-virtual {v0}, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a()V

    return-void

    :cond_1b
    invoke-virtual {p0, v1}, Lk73;->q(Landroidx/fragment/app/w;)Landroidx/fragment/app/i;

    move-result-object v1

    iput-object v1, p0, Lk73;->f:Ljava/lang/Object;

    if-nez v1, :cond_26

    invoke-virtual {v0}, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a()V

    :cond_26
    return-void
.end method

.method public abstract q(Landroidx/fragment/app/w;)Landroidx/fragment/app/i;
.end method

.method public abstract r(Lizd;)Ljava/lang/Object;
.end method

.method public abstract s()Ljava/lang/Object;
.end method

.method public abstract t(Lge5;)V
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lk73;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lk73;->B()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x5
        :pswitch_a
    .end packed-switch
.end method

.method public abstract u(Lge5;)V
.end method

.method public abstract v(ILks5;Lls5;)V
.end method

.method public w(Lk73;)V
    .registers 2

    iput-object p1, p0, Lk73;->b:Ljava/lang/Object;

    return-void
.end method

.method public final x(Ljava/lang/Object;)V
    .registers 6

    iget-object v0, p0, Lk73;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lk73;->f:Ljava/lang/Object;

    if-eqz v1, :cond_f

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_2b

    if-eqz v1, :cond_f

    monitor-exit v0

    return-void

    :cond_f
    :try_start_f
    iput-object p1, p0, Lk73;->f:Ljava/lang/Object;

    iget-object p1, p0, Lk73;->e:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iget-object v1, p0, Lk73;->b:Ljava/lang/Object;

    check-cast v1, La5o;

    iget-object v1, v1, La5o;->d:Leba;

    new-instance v2, Lfh4;

    const/16 v3, 0xd

    invoke-direct {v2, p1, p0, v3}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Leba;->execute(Ljava/lang/Runnable;)V
    :try_end_29
    .catchall {:try_start_f .. :try_end_29} :catchall_2b

    monitor-exit v0

    return-void

    :catchall_2b
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public y(Lqs5;Z)Z
    .registers 5

    iget-object v0, p0, Lk73;->c:Ljava/lang/Object;

    check-cast v0, Ljs5;

    invoke-interface {v0, p1, p2}, Ljs5;->a(Lqs5;Z)Z

    move-result p2

    if-eqz p2, :cond_1f

    iget-object p2, p0, Lk73;->b:Ljava/lang/Object;

    check-cast p2, Landroid/view/ViewGroup;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    if-eqz p2, :cond_1f

    invoke-interface {v0, p1, p0}, Ljs5;->e(Lqs5;Lk73;)V

    const/4 p0, 0x1

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method

.method public abstract z()V
.end method
