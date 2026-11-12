.class public abstract Ln1f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    packed-switch p1, :pswitch_data_20

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 68
    iput-boolean p1, p0, Ln1f;->a:Z

    return-void

    .line 69
    :pswitch_a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 70
    iput-boolean p1, p0, Ln1f;->a:Z

    .line 71
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Ln1f;->c:Ljava/lang/Object;

    .line 72
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Ln1f;->d:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;Lywg;)V
    .registers 4

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 64
    iput-boolean v0, p0, Ln1f;->a:Z

    .line 65
    iput-object p1, p0, Ln1f;->c:Ljava/lang/Object;

    .line 66
    iput-object p2, p0, Ln1f;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljg8;Ljg8;)V
    .registers 7

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object v0

    invoke-static {p1, v0}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p1

    invoke-static {p1}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object p1

    sget-object v0, Lrx5;->b:Lrx5;

    new-instance v1, Lp71;

    const/16 v2, 0x19

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, p2, v0, v1}, Lna2;->A(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    move-result-object p2

    iput-object p2, p0, Ln1f;->b:Ljava/lang/Object;

    new-instance p2, Lr4k;

    const/16 v1, 0x1c

    invoke-direct {p2, v1}, Lr4k;-><init>(B)V

    const/4 v1, 0x2

    const/4 v2, -0x1

    invoke-static {v2, v3, p2, v1}, Lxf8;->h(ILh04;Lkotlin/jvm/functions/Function1;I)Lp04;

    move-result-object p2

    iput-object p2, p0, Ln1f;->c:Ljava/lang/Object;

    new-instance p2, Lrf4;

    const/16 v1, 0x12

    invoke-direct {p2, v1, v3, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-static {p1, v3, v0, p2, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    iput-object p1, p0, Ln1f;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public abstract a(Ls9i;)V
.end method

.method public b()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract c()Landroid/view/View;
.end method

.method public final d(Ljava/lang/Throwable;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Louk;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Louk;

    iget v1, v0, Louk;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Louk;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Louk;

    invoke-direct {v0, p0, p2}, Louk;-><init>(Ln1f;Lnt5;)V

    :goto_18
    iget-object p2, v0, Louk;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v1, v0, Louk;->w:I

    const/4 v2, 0x1

    if-eqz v1, :cond_30

    if-ne v1, v2, :cond_29

    iget-object p1, v0, Louk;->t:Ljava/lang/Throwable;

    :try_start_25
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_28
    .catchall {:try_start_25 .. :try_end_28} :catchall_41

    goto :goto_3c

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_33
    iput-object p1, v0, Louk;->t:Ljava/lang/Throwable;

    iput v2, v0, Louk;->w:I

    invoke-virtual {p0}, Ln1f;->i()V

    sget-object p2, Lmuk;->a:Lmuk;

    :goto_3c
    sget-object p0, Lmuk;->a:Lmuk;
    :try_end_3e
    .catchall {:try_start_33 .. :try_end_3e} :catchall_41

    if-ne p2, p0, :cond_41

    const/4 v2, 0x0

    :catchall_41
    :cond_41
    sget-object p0, Ly55;->h:Ljava/lang/Object;

    monitor-enter p0

    :try_start_44
    sget-object p2, Ly55;->i:Lvk2;
    :try_end_46
    .catchall {:try_start_44 .. :try_end_46} :catchall_51

    monitor-exit p0

    if-eqz p2, :cond_4c

    invoke-virtual {p2, p1}, Lvk2;->run(Ljava/lang/Object;)V

    :cond_4c
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :catchall_51
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public e(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V
    .registers 3

    iget-boolean v0, p0, Ln1f;->a:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipToOutline(Z)V

    iget-boolean p0, p0, Ln1f;->a:Z

    if-eqz p0, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void

    :cond_f
    invoke-virtual {p1}, Landroid/view/View;->invalidateOutline()V

    return-void
.end method

.method public abstract f(Lmt5;)Ljava/lang/Object;
.end method

.method public g()V
    .registers 1

    return-void
.end method

.method public h()V
    .registers 1

    return-void
.end method

.method public i()V
    .registers 1

    sget-object p0, Lmuk;->a:Lmuk;

    return-void
.end method

.method public abstract j(Lbuk;La32;)V
.end method

.method public final k()V
    .registers 10

    iget-object v0, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Ln1f;->c()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_e9

    iget-boolean v2, p0, Ln1f;->a:Z

    if-eqz v2, :cond_e9

    iget-object p0, p0, Ln1f;->d:Ljava/lang/Object;

    check-cast p0, Lywg;

    new-instance v2, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v3

    if-eqz v3, :cond_e6

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    if-eqz v3, :cond_e6

    invoke-virtual {p0}, Lywg;->d()Z

    move-result v3

    if-eqz v3, :cond_e9

    instance-of v3, v1, Landroid/view/TextureView;

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v3, :cond_72

    move-object v3, v1

    check-cast v3, Landroid/view/TextureView;

    invoke-virtual {p0}, Lywg;->d()Z

    move-result v6

    invoke-static {v4, v6}, Ljpo;->n(Ljava/lang/String;Z)V

    new-instance v6, Landroid/graphics/RectF;

    iget-object v7, p0, Lywg;->a:Landroid/util/Size;

    invoke-virtual {v7}, Landroid/util/Size;->getWidth()I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lywg;->a:Landroid/util/Size;

    invoke-virtual {v8}, Landroid/util/Size;->getHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v6, v5, v5, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-boolean v7, p0, Lywg;->g:Z

    if-nez v7, :cond_62

    iget v7, p0, Lywg;->c:I

    goto :goto_69

    :cond_62
    iget v7, p0, Lywg;->e:I

    invoke-static {v7}, Lkfo;->f0(I)I

    move-result v7

    neg-int v7, v7

    :goto_69
    const/4 v8, 0x0

    invoke-static {v6, v6, v7, v8}, Ld2m;->a(Landroid/graphics/RectF;Landroid/graphics/RectF;IZ)Landroid/graphics/Matrix;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    goto :goto_8a

    :cond_72
    invoke-virtual {v1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v3

    iget-boolean v6, p0, Lywg;->g:Z

    if-eqz v6, :cond_7f

    if-eqz v3, :cond_7f

    invoke-virtual {v3}, Landroid/view/Display;->getRotation()I

    :cond_7f
    iget-boolean v3, p0, Lywg;->g:Z

    if-nez v3, :cond_8a

    if-eqz v3, :cond_8a

    iget v3, p0, Lywg;->e:I

    invoke-static {v3}, Lkfo;->f0(I)I

    :cond_8a
    :goto_8a
    invoke-virtual {p0}, Lywg;->d()Z

    move-result v3

    invoke-static {v4, v3}, Ljpo;->n(Ljava/lang/String;Z)V

    invoke-virtual {p0, v0, v2}, Lywg;->c(ILandroid/util/Size;)Landroid/graphics/Matrix;

    move-result-object v0

    new-instance v2, Landroid/graphics/RectF;

    iget-object v3, p0, Lywg;->a:Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lywg;->a:Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v1, v5}, Landroid/view/View;->setPivotX(F)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setPivotY(F)V

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v3, p0, Lywg;->a:Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v0, v3

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget-object p0, p0, Lywg;->a:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr v0, p0

    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    iget p0, v2, Landroid/graphics/RectF;->left:F

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p0, v0

    invoke-virtual {v1, p0}, Landroid/view/View;->setTranslationX(F)V

    iget p0, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p0, v0

    invoke-virtual {v1, p0}, Landroid/view/View;->setTranslationY(F)V

    return-void

    :cond_e6
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_e9
    return-void
.end method

.method public final l(Ljava/lang/Object;)V
    .registers 6

    new-instance v0, Lnuk;

    invoke-direct {v0, p0}, Lnuk;-><init>(Ln1f;)V

    sget-object v1, Lngh;->b:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_12

    :try_start_9
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_9 .. :try_end_11} :catch_17
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_9 .. :try_end_11} :catch_17

    goto :goto_17

    :cond_12
    sget-object v1, Lngh;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :catch_17
    :goto_17
    iget-object p0, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast p0, Lp04;

    new-instance v1, Lkotlin/Pair;

    invoke-direct {v1, p1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p0, v1}, Lc1j;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public m()Z
    .registers 1

    iget-boolean p0, p0, Ln1f;->a:Z

    return p0
.end method

.method public abstract n(Ljava/lang/Object;)V
.end method

.method public final o()V
    .registers 9

    iget-object v0, p0, Ln1f;->c:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Landroid/graphics/RectF;

    iget v0, v5, Landroid/graphics/RectF;->left:F

    iget v1, v5, Landroid/graphics/RectF;->right:F

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_2a

    iget v0, v5, Landroid/graphics/RectF;->top:F

    iget v1, v5, Landroid/graphics/RectF;->bottom:F

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_2a

    iget-object v0, p0, Ln1f;->b:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lsaj;

    if-eqz v2, :cond_2a

    sget-object v1, Ltaj;->a:Lvq8;

    iget-object p0, p0, Ln1f;->d:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Landroid/graphics/Path;

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual/range {v1 .. v7}, Lvq8;->c(Lsaj;[FFLandroid/graphics/RectF;Lga6;Landroid/graphics/Path;)V

    :cond_2a
    return-void
.end method

.method public p()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 1

    sget-object p0, Lq0b;->c:Lq0b;

    return-object p0
.end method
