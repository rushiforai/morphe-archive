.class public final Lz13;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final q:Landroid/graphics/Rect;

.field public static final r:Ljava/util/List;


# instance fields
.field public a:Leq;

.field public b:Ljava/lang/String;

.field public c:Lro9;

.field public d:Lguo;

.field public volatile e:Z

.field public f:Z

.field public g:Z

.field public h:Lguo;

.field public i:Z

.field public j:Z

.field public k:I

.field public l:J

.field public m:Ld3k;

.field public n:Z

.field public volatile o:Z

.field public final p:Llmo;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lz13;->q:Landroid/graphics/Rect;

    sget-object v0, Leq;->c:Leq;

    sget-object v1, Leq;->d:Leq;

    filled-new-array {v0, v1}, [Leq;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lz13;->r:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lz13;->f:Z

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lz13;->l:J

    new-instance v0, Llmo;

    new-instance v1, Ly13;

    invoke-direct {v1, p0, v2}, Ly13;-><init>(Lz13;B)V

    invoke-direct {v0, v1, v2}, Llmo;-><init>(Lkotlin/jvm/functions/Function0;B)V

    iput-object v0, p0, Lz13;->p:Llmo;

    sget-object p0, Lfko;->a:Lejo;

    invoke-static {p1}, Lfko;->a(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Lguo;Z)V
    .registers 4

    iget-object v0, p0, Lz13;->d:Lguo;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lz13;->h:Lguo;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    :cond_10
    iget-boolean v0, p0, Lz13;->i:Z

    if-eqz v0, :cond_1e

    if-eqz p2, :cond_1e

    iget-object v0, p0, Lz13;->d:Lguo;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_27

    :cond_1e
    iget-boolean p1, p0, Lz13;->g:Z

    if-eq p1, p2, :cond_27

    iput-boolean p2, p0, Lz13;->g:Z

    invoke-virtual {p0}, Lz13;->e()V

    :cond_27
    return-void
.end method

.method public final b(Z)V
    .registers 8

    sget-object v0, Lwjo;->b:Lwjo;

    iget-boolean v0, p0, Lz13;->o:Z

    if-nez v0, :cond_bd

    iget-object v0, p0, Lz13;->c:Lro9;

    if-eqz v0, :cond_bd

    iget-object v1, p0, Lz13;->a:Leq;

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-nez v1, :cond_1b

    new-instance p0, Lcm;

    const-string p1, "No AdSize for Banner!"

    invoke-direct {p0, v3, p1, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {v0, p0}, Lro9;->a(Lcm;)V

    return-void

    :cond_1b
    iget-object v1, p0, Lz13;->b:Ljava/lang/String;

    if-eqz v1, :cond_b3

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b3

    const/4 v1, 0x1

    if-eqz p1, :cond_85

    sget-object p1, Lz13;->q:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p1

    if-nez p1, :cond_3a

    iget-object p1, p0, Lz13;->d:Lguo;

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Lpxo;->d()Z

    move-result p1

    if-eqz p1, :cond_bd

    :cond_3a
    iget-boolean p1, p0, Lz13;->i:Z

    if-nez p1, :cond_bd

    iget-object p1, p0, Lz13;->h:Lguo;

    if-eqz p1, :cond_47

    iget-object p1, p1, Lpxo;->d:Lvoo;

    check-cast p1, Lylp;

    goto :goto_48

    :cond_47
    const/4 p1, 0x0

    :goto_48
    if-eqz p1, :cond_58

    iget-object p1, p0, Lz13;->h:Lguo;

    if-eqz p1, :cond_58

    invoke-virtual {p1}, Lpxo;->d()Z

    move-result p1

    if-nez p1, :cond_58

    invoke-virtual {p0}, Lz13;->d()V

    return-void

    :cond_58
    iget p1, p0, Lz13;->k:I

    add-int/2addr p1, v1

    iput p1, p0, Lz13;->k:I

    iget-object p1, p0, Lz13;->h:Lguo;

    if-eqz p1, :cond_64

    invoke-virtual {p1}, Lguo;->a()V

    :cond_64
    new-instance p1, Lguo;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lz13;->b:Ljava/lang/String;

    iget-object v4, p0, Lz13;->a:Leq;

    sget-object v5, Lwjo;->b:Lwjo;

    invoke-direct {p1, v1, v3, v4}, Lguo;-><init>(Landroid/content/Context;Ljava/lang/String;Leq;)V

    iput-object p1, p0, Lz13;->h:Lguo;

    new-instance p0, Ls6h;

    invoke-direct {p0, p1, v0, v2}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v0, Luuj;

    invoke-direct {v0, p0}, Luuj;-><init>(Lroo;)V

    iput-object v0, p1, Lpxo;->c:Luuj;

    invoke-virtual {p1}, Lpxo;->c()V

    return-void

    :cond_85
    iget-object p1, p0, Lz13;->d:Lguo;

    if-nez p1, :cond_a8

    new-instance p1, Lguo;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lz13;->b:Ljava/lang/String;

    iget-object v4, p0, Lz13;->a:Leq;

    invoke-direct {p1, v1, v3, v4}, Lguo;-><init>(Landroid/content/Context;Ljava/lang/String;Leq;)V

    iput-object p1, p0, Lz13;->d:Lguo;

    new-instance p0, Ls6h;

    invoke-direct {p0, p1, v0, v2}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v0, Luuj;

    invoke-direct {v0, p0}, Luuj;-><init>(Lroo;)V

    iput-object v0, p1, Lpxo;->c:Luuj;

    invoke-virtual {p1}, Lpxo;->c()V

    return-void

    :cond_a8
    new-instance p0, Lcm;

    const-string p1, "Ad has been started or used!"

    invoke-direct {p0, v1, p1, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {v0, p0}, Lro9;->a(Lcm;)V

    return-void

    :cond_b3
    new-instance p0, Lcm;

    const-string p1, "No valid placement ID for Banner!"

    invoke-direct {p0, v3, p1, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-virtual {v0, p0}, Lro9;->a(Lcm;)V

    :cond_bd
    return-void
.end method

.method public final c()V
    .registers 3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lz13;->l:J

    return-void
.end method

.method public final d()V
    .registers 13

    iget-boolean v0, p0, Lz13;->o:Z

    if-nez v0, :cond_9f

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_9f

    iget-object v0, p0, Lz13;->d:Lguo;

    const/4 v8, 0x0

    if-nez v0, :cond_18

    iget-object v1, p0, Lz13;->h:Lguo;

    if-eqz v1, :cond_18

    iput-object v1, p0, Lz13;->d:Lguo;

    iput-object v8, p0, Lz13;->h:Lguo;

    move-object v0, v1

    :cond_18
    if-eqz v0, :cond_1d

    iget-object v0, v0, Lpxo;->e:Lbap;

    goto :goto_1e

    :cond_1d
    move-object v0, v8

    :goto_1e
    instance-of v0, v0, Lt9p;

    if-eqz v0, :cond_56

    iget-object v0, p0, Lz13;->d:Lguo;

    if-eqz v0, :cond_2d

    iget-object v0, v0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_2d

    invoke-virtual {v0}, Lp7p;->f()V

    :cond_2d
    iget-object v9, p0, Lz13;->d:Lguo;

    if-eqz v9, :cond_56

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0xb

    const/4 v1, 0x1

    const-class v3, Lz13;

    const-string v4, "onAdRenderFailed"

    const-string v5, "onAdRenderFailed(I)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v10, v0

    new-instance v0, Ls2;

    const/4 v7, 0x5

    const/4 v1, 0x2

    const-string v4, "onMraidAutoRefreshPauseChanged"

    const-string v5, "onMraidAutoRefreshPauseChanged(Lcom/opera/ads/internal/ad/BannerAdImpl;Z)V"

    invoke-direct/range {v0 .. v7}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p0

    move-object v5, v0

    move-object v0, v9

    move-object v4, v10

    invoke-virtual/range {v0 .. v5}, Lguo;->f(Lz13;Lguo;Ly13;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    :cond_56
    iget-object v0, p0, Lz13;->h:Lguo;

    if-eqz v0, :cond_5c

    iget-object v8, v0, Lpxo;->e:Lbap;

    :cond_5c
    instance-of v0, v8, Lt9p;

    if-eqz v0, :cond_9f

    iget-boolean v0, p0, Lz13;->i:Z

    if-nez v0, :cond_9f

    iget-boolean v0, p0, Lz13;->g:Z

    if-nez v0, :cond_9f

    const/4 v0, 0x1

    iput-boolean v0, p0, Lz13;->i:Z

    iget-object v1, p0, Lz13;->h:Lguo;

    if-eqz v1, :cond_76

    iget-object v1, v1, Lpxo;->i:Lp7p;

    if-eqz v1, :cond_76

    invoke-virtual {v1}, Lp7p;->f()V

    :cond_76
    iget-object v8, p0, Lz13;->h:Lguo;

    if-eqz v8, :cond_9f

    iget-object v9, p0, Lz13;->d:Lguo;

    new-instance v10, Ly13;

    invoke-direct {v10, p0, v0}, Ly13;-><init>(Lz13;B)V

    new-instance v11, Lb11;

    const/4 v0, 0x4

    invoke-direct {v11, p0, v0}, Lb11;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Ls2;

    const/4 v6, 0x0

    const/4 v7, 0x6

    const/4 v1, 0x2

    const-class v3, Lz13;

    const-string v4, "onMraidAutoRefreshPauseChanged"

    const-string v5, "onMraidAutoRefreshPauseChanged(Lcom/opera/ads/internal/ad/BannerAdImpl;Z)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v5, v0

    move-object v1, v2

    move-object v0, v8

    move-object v2, v9

    move-object v3, v10

    move-object v4, v11

    invoke-virtual/range {v0 .. v5}, Lguo;->f(Lz13;Lguo;Ly13;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    :cond_9f
    return-void
.end method

.method public final e()V
    .registers 7

    iget-boolean v0, p0, Lz13;->o:Z

    const/4 v1, 0x0

    if-nez v0, :cond_70

    iget-boolean v0, p0, Lz13;->j:Z

    if-nez v0, :cond_70

    iget-boolean v0, p0, Lz13;->f:Z

    if-eqz v0, :cond_70

    iget-boolean v0, p0, Lz13;->g:Z

    if-nez v0, :cond_70

    iget-object v0, p0, Lz13;->d:Lguo;

    if-eqz v0, :cond_2b

    iget-object v0, v0, Lpxo;->d:Lvoo;

    check-cast v0, Lylp;

    if-eqz v0, :cond_1e

    iget-object v0, v0, Lylp;->F:Ljava/lang/Integer;

    goto :goto_1f

    :cond_1e
    move-object v0, v1

    :goto_1f
    if-eqz v0, :cond_2b

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-lez v0, :cond_29

    const/4 v0, 0x1

    goto :goto_33

    :cond_29
    const/4 v0, 0x0

    goto :goto_33

    :cond_2b
    sget-object v0, Lz13;->r:Ljava/util/List;

    iget-object v2, p0, Lz13;->a:Leq;

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v0

    :goto_33
    if-eqz v0, :cond_70

    iget-object v0, p0, Lz13;->c:Lro9;

    if-eqz v0, :cond_70

    iget-wide v2, p0, Lz13;->l:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_70

    iget-object v0, p0, Lz13;->d:Lguo;

    if-eqz v0, :cond_5b

    invoke-virtual {v0}, Lpxo;->d()Z

    move-result v0

    if-nez v0, :cond_5b

    sget-boolean v0, Lfko;->c:Z

    if-eqz v0, :cond_70

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_70

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_70

    :cond_5b
    iget-object v0, p0, Lz13;->m:Ld3k;

    if-eqz v0, :cond_60

    return-void

    :cond_60
    sget-object v0, Lw2p;->a:La64;

    new-instance v2, Lr3;

    const/4 v3, 0x5

    invoke-direct {v2, v3, v1, p0}, Lr3;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v3, 0x3

    invoke-static {v0, v1, v1, v2, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, p0, Lz13;->m:Ld3k;

    return-void

    :cond_70
    iget-object v0, p0, Lz13;->m:Ld3k;

    if-eqz v0, :cond_77

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_77
    iput-object v1, p0, Lz13;->m:Ld3k;

    return-void
.end method

.method public final f()V
    .registers 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lz13;->o:Z

    iget-object v0, p0, Lz13;->c:Lro9;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    iput-object v1, v0, Lro9;->c:Ljava/lang/Object;

    :cond_a
    iput-object v1, p0, Lz13;->c:Lro9;

    invoke-virtual {p0}, Lz13;->e()V

    iget-boolean v0, p0, Lz13;->n:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_1d

    new-instance v0, Lx13;

    invoke-direct {v0, p0, v2}, Lx13;-><init>(Lz13;B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void

    :cond_1d
    iget-object v0, p0, Lz13;->d:Lguo;

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Lguo;->a()V

    :cond_24
    iput-object v1, p0, Lz13;->d:Lguo;

    iget-object v0, p0, Lz13;->h:Lguo;

    if-eqz v0, :cond_2d

    invoke-virtual {v0}, Lguo;->a()V

    :cond_2d
    iput-object v1, p0, Lz13;->h:Lguo;

    iput-boolean v2, p0, Lz13;->i:Z

    return-void
.end method

.method public final g(Lu13;)V
    .registers 3

    sget-object v0, Lwjo;->b:Lwjo;

    invoke-static {p1}, Lfcp;->a(Lcn;)Lkotlin/Unit;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lfcp;->b(Lcn;Landroid/content/Context;)Lkotlin/Unit;

    move-result-object v0

    if-eqz v0, :cond_1a

    iget-boolean v0, p0, Lz13;->o:Z

    if-nez v0, :cond_1a

    iget-object v0, p0, Lz13;->c:Lro9;

    if-eqz v0, :cond_1b

    :cond_1a
    return-void

    :cond_1b
    new-instance v0, Lro9;

    invoke-direct {v0, p0, p1}, Lro9;-><init>(Lz13;Lu13;)V

    iput-object v0, p0, Lz13;->c:Lro9;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lz13;->b(Z)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    sget-object v0, Lfko;->a:Lejo;

    invoke-static {p0}, Lfko;->b(Landroid/view/ViewGroup;)V

    iget-object v0, p0, Lz13;->p:Llmo;

    sget-object v1, Lfko;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lz13;->d()V

    invoke-virtual {p0}, Lz13;->e()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    sget-object v0, Lfko;->a:Lejo;

    iget-object v0, p0, Lz13;->p:Llmo;

    sget-object v1, Lfko;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    new-instance v0, Lx13;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lx13;-><init>(Lz13;B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onVisibilityAggregated(Z)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onVisibilityAggregated(Z)V

    new-instance p1, Lx13;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lx13;-><init>(Lz13;B)V

    invoke-static {p1}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method
