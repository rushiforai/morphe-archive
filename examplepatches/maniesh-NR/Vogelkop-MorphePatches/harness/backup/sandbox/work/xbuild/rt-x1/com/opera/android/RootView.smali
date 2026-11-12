.class public Lcom/opera/android/RootView;
.super Lq2c;
.source "SourceFile"

# interfaces
.implements Lpwe;


# static fields
.field public static final synthetic D:I


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public c:Lmw7;

.field public d:Z

.field public e:F

.field public f:F

.field public final g:Li7f;

.field public h:Z

.field public final i:Lx7i;

.field public final j:Lqwe;

.field public k:I

.field public l:I

.field public m:Z

.field public n:Z

.field public o:I

.field public p:I

.field public final q:Lpde;

.field public final r:Lpde;

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public final x:Lc1f;

.field public final y:Lx7i;

.field public z:Lmcj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v1, Ll2c;

    invoke-direct {v1, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lq2c;->a:Ll2c;

    invoke-static {p1, p2}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object p2

    iput-object p2, p0, Lq2c;->b:Lfr;

    if-eqz p2, :cond_16

    invoke-virtual {p2, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_16
    new-instance p2, Li7f;

    invoke-direct {p2}, Li7f;-><init>()V

    iput-object p2, p0, Lcom/opera/android/RootView;->g:Li7f;

    new-instance p2, Lx7i;

    invoke-direct {p2, p0, v0}, Lx7i;-><init>(Lcom/opera/android/RootView;B)V

    iput-object p2, p0, Lcom/opera/android/RootView;->i:Lx7i;

    new-instance p2, Lpde;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p2, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/opera/android/RootView;->q:Lpde;

    new-instance p2, Lpde;

    sget-object v1, Lr9b;->e:Lr9b;

    invoke-direct {p2, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/opera/android/RootView;->r:Lpde;

    const/high16 p2, -0x1000000

    iput p2, p0, Lcom/opera/android/RootView;->s:I

    const/high16 p2, -0x78000000

    iput p2, p0, Lcom/opera/android/RootView;->t:I

    new-instance p2, Lx7i;

    const/4 v1, 0x1

    invoke-direct {p2, p0, v1}, Lx7i;-><init>(Lcom/opera/android/RootView;B)V

    new-instance p2, Lx7i;

    const/4 v1, 0x2

    invoke-direct {p2, p0, v1}, Lx7i;-><init>(Lcom/opera/android/RootView;B)V

    iput-object p2, p0, Lcom/opera/android/RootView;->y:Lx7i;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/RootView;->j:Lqwe;

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    invoke-static {p0}, Lq9n;->i(Landroid/view/View;)V

    new-instance p1, Lc1f;

    new-instance p2, Lx7i;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lx7i;-><init>(Lcom/opera/android/RootView;B)V

    invoke-direct {p1, p0, p2}, Lc1f;-><init>(Lcom/opera/android/RootView;Lx7i;)V

    iput-object p1, p0, Lcom/opera/android/RootView;->x:Lc1f;

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    invoke-virtual {p0}, Lcom/opera/android/RootView;->f()V

    return-void
.end method

.method public final c(Landroid/util/AttributeSet;)Lp2c;
    .registers 3

    new-instance v0, Ly7i;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Ly7i;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 15

    iget v0, p0, Lcom/opera/android/RootView;->v:I

    int-to-float v1, v0

    iget v0, p0, Lcom/opera/android/RootView;->u:I

    int-to-float v2, v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget v3, p0, Lcom/opera/android/RootView;->w:I

    sub-int/2addr v0, v3

    int-to-float v3, v0

    iget v0, p0, Lcom/opera/android/RootView;->u:I

    iget v4, p0, Lcom/opera/android/RootView;->o:I

    add-int/2addr v0, v4

    int-to-float v4, v0

    const/high16 v6, -0x1000000

    move-object v5, p1

    invoke-static/range {v1 .. v6}, Lvj6;->a(FFFFLandroid/graphics/Canvas;I)V

    move-object v7, v5

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p1

    iget v0, p0, Lcom/opera/android/RootView;->p:I

    sub-int/2addr p1, v0

    int-to-float v8, p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float v9, p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float v10, p1

    iget p1, p0, Lcom/opera/android/RootView;->s:I

    iget-object v0, p0, Lcom/opera/android/RootView;->j:Lqwe;

    iget-object v0, v0, Lqwe;->a:Lbp;

    iget v0, v0, Lbp;->a:I

    invoke-static {p1, v0}, Lp37;->X(II)I

    move-result v12

    move-object v11, v7

    const/4 v7, 0x0

    invoke-static/range {v7 .. v12}, Lvj6;->a(FFFFLandroid/graphics/Canvas;I)V

    move-object v7, v11

    invoke-super {p0, v7}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget p1, p0, Lcom/opera/android/RootView;->v:I

    int-to-float v9, p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float v10, p1

    const/high16 v12, -0x1000000

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v7 .. v12}, Lvj6;->a(FFFFLandroid/graphics/Canvas;I)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    iget v0, p0, Lcom/opera/android/RootView;->w:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v9, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v10, v0

    move v7, p1

    invoke-static/range {v7 .. v12}, Lvj6;->a(FFFFLandroid/graphics/Canvas;I)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float v9, p1

    iget p1, p0, Lcom/opera/android/RootView;->u:I

    int-to-float v10, p1

    const/4 v7, 0x0

    invoke-static/range {v7 .. v12}, Lvj6;->a(FFFFLandroid/graphics/Canvas;I)V

    move-object v7, v11

    iget p1, p0, Lcom/opera/android/RootView;->k:I

    if-lez p1, :cond_c1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v11, v0

    iget v0, p0, Lcom/opera/android/RootView;->k:I

    iget p0, p0, Lcom/opera/android/RootView;->l:I

    const-class v1, Lvj6;

    monitor-enter v1

    :try_start_89
    sget-object v12, Lvj6;->a:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v12, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v12, p0}, Landroid/graphics/Paint;->setColor(I)V

    if-lez v0, :cond_ba

    int-to-float p0, v0

    const/4 v8, 0x0

    add-float v10, v8, p0

    const/4 v9, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move p0, v8

    int-to-float v2, v0

    sub-float v8, p1, v2

    move v10, p1

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move v2, v11

    int-to-float v3, v0

    add-float v8, p0, v3

    sub-float v10, p1, v3

    move v11, v8

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    int-to-float v0, v0

    add-float v8, p0, v0

    sub-float v9, v2, v0

    sub-float v10, p1, v0

    move v11, v2

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    :try_end_ba
    .catchall {:try_start_89 .. :try_end_ba} :catchall_be

    :cond_ba
    monitor-exit v1

    return-void

    :goto_bc
    :try_start_bc
    monitor-exit v1
    :try_end_bd
    .catchall {:try_start_bc .. :try_end_bd} :catchall_be

    throw p0

    :catchall_be
    move-exception v0

    move-object p0, v0

    goto :goto_bc

    :cond_c1
    return-void
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12

    iget-object v0, p0, Lcom/opera/android/RootView;->c:Lmw7;

    if-nez v0, :cond_15

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/opera/android/RootView;->e:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/opera/android/RootView;->f:F

    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :cond_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_13d

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v1, p0, Lcom/opera/android/RootView;->e:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v1, p0, Lcom/opera/android/RootView;->f:F

    sub-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget-boolean v1, p0, Lcom/opera/android/RootView;->d:Z

    if-nez v1, :cond_f2

    iget-object v1, p0, Lcom/opera/android/RootView;->c:Lmw7;

    iget v4, v1, Lmw7;->a:I

    add-int/2addr v4, v0

    iget v5, v1, Lmw7;->b:I

    add-int/2addr v5, p1

    iget-object v6, v1, Lmw7;->d:Ljava/lang/Object;

    check-cast v6, Lns8;

    iget-object v1, v1, Lmw7;->e:Ljava/lang/Object;

    check-cast v1, Lhq8;

    iget-object v7, v6, Lns8;->j:Lflb;

    if-eqz v7, :cond_8d

    iget-object v8, v6, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v8, :cond_8d

    invoke-virtual {v6, v1}, Lns8;->K(Lhq8;)I

    move-result v1

    const/4 v8, -0x1

    if-eq v1, v8, :cond_8d

    iget-object v6, v6, Lns8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v1}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object v1

    if-eqz v1, :cond_8d

    iget-object v6, v7, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v7, Lflb;->N:[I

    invoke-virtual {v6, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v6, v8, v3

    iget-object v9, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v9

    add-int/2addr v9, v6

    aget v6, v8, v2

    iget-object v8, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v8

    add-int/2addr v8, v6

    int-to-float v6, v9

    iput v6, v7, Lflb;->e:F

    iput v6, v7, Lflb;->g:F

    int-to-float v6, v8

    iput v6, v7, Lflb;->f:F

    iput v6, v7, Lflb;->h:F

    iput-boolean v2, v7, Lflb;->d:Z

    invoke-virtual {v7, v1}, Lflb;->s(Landroidx/recyclerview/widget/i;)V

    iget-object v1, v7, Lflb;->c:Landroidx/recyclerview/widget/i;

    if-nez v1, :cond_8f

    iput-boolean v3, v7, Lflb;->d:Z

    :cond_8d
    move v1, v3

    goto :goto_ad

    :cond_8f
    int-to-float v1, v4

    int-to-float v4, v5

    iget v5, v7, Lflb;->s:I

    invoke-virtual {v7, v5, v1, v4}, Lflb;->t(IFF)V

    iget-object v1, v7, Lflb;->c:Landroidx/recyclerview/widget/i;

    invoke-virtual {v7, v1}, Lflb;->q(Landroidx/recyclerview/widget/i;)V

    iget-object v1, v7, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v7, Lflb;->w:Lwkb;

    invoke-virtual {v1, v4}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v1, v7, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v4}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iget-object v1, v7, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    move v1, v2

    :goto_ad
    iput-boolean v1, p0, Lcom/opera/android/RootView;->d:Z

    if-eqz v1, :cond_f2

    iget-object v1, p0, Lcom/opera/android/RootView;->g:Li7f;

    invoke-static {v1, v1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v1

    :goto_b7
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f2

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lxq8;

    iget-object v5, v4, Lxq8;->a:Lcom/opera/android/RootView;

    iget-object v5, v5, Lcom/opera/android/RootView;->g:Li7f;

    invoke-virtual {v5, v4}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v4, v4, Lxq8;->b:Lyq8;

    iget-object v4, v4, Lyq8;->d:Lar8;

    iget-boolean v5, v4, Lar8;->m:Z

    if-eqz v5, :cond_ee

    iput-boolean v3, v4, Lar8;->m:Z

    iget-object v5, v4, Lar8;->o:Lcom/opera/android/favorites/FavoriteFolderRootView;

    invoke-virtual {v5}, Lcom/opera/android/favorites/FavoriteFolderRootView;->a()Landroid/animation/ValueAnimator;

    iput-boolean v3, v4, Lar8;->B:Z

    iget-object v5, v4, Lar8;->y:Lns8;

    iget-object v5, v5, Lns8;->i:Lvi7;

    if-eqz v5, :cond_e3

    iput-boolean v3, v5, Lvi7;->q:Z

    :cond_e3
    iget-object v5, v4, Lar8;->q:Lcom/opera/android/custom_views/OverlayView;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    iget-object v5, v4, Lar8;->i:Lo63;

    invoke-virtual {v5}, Lo63;->i()V

    :cond_ee
    invoke-virtual {v4}, Lar8;->o0()V

    goto :goto_b7

    :cond_f2
    iget-boolean v1, p0, Lcom/opera/android/RootView;->d:Z

    if-eqz v1, :cond_14a

    iget-object p0, p0, Lcom/opera/android/RootView;->c:Lmw7;

    iget-object v1, p0, Lmw7;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, p0, Lmw7;->g:Ljava/io/Serializable;

    check-cast v4, [I

    invoke-virtual {v1, v4}, Landroid/view/View;->getLocationInWindow([I)V

    aget v1, v4, v3

    iget-object v5, p0, Lmw7;->f:Ljava/io/Serializable;

    check-cast v5, [I

    aget v3, v5, v3

    sub-int/2addr v1, v3

    aget v3, v4, v2

    aget v4, v5, v2

    sub-int/2addr v3, v4

    iget v4, p0, Lmw7;->a:I

    add-int/2addr v4, v0

    sub-int/2addr v4, v1

    iget v0, p0, Lmw7;->b:I

    add-int/2addr v0, p1

    sub-int/2addr v0, v3

    iget-object p0, p0, Lmw7;->d:Ljava/lang/Object;

    check-cast p0, Lns8;

    iget-object p0, p0, Lns8;->j:Lflb;

    int-to-float p1, v4

    int-to-float v0, v0

    iget v1, p0, Lflb;->s:I

    invoke-virtual {p0, v1, p1, v0}, Lflb;->t(IFF)V

    iget-object p1, p0, Lflb;->c:Landroidx/recyclerview/widget/i;

    invoke-virtual {p0, p1}, Lflb;->q(Landroidx/recyclerview/widget/i;)V

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lflb;->w:Lwkb;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return v2

    :cond_13d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_14b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eq p1, v2, :cond_14b

    :cond_14a
    return v2

    :cond_14b
    iget-boolean p1, p0, Lcom/opera/android/RootView;->d:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_162

    iput-boolean v3, p0, Lcom/opera/android/RootView;->d:Z

    iget-object p1, p0, Lcom/opera/android/RootView;->c:Lmw7;

    iget-object p1, p1, Lmw7;->d:Ljava/lang/Object;

    check-cast p1, Lns8;

    iget-object p1, p1, Lns8;->j:Lflb;

    invoke-virtual {p1}, Lflb;->j()V

    invoke-virtual {p1, v0, v3}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    iput-boolean v3, p1, Lflb;->d:Z

    :cond_162
    iput-object v0, p0, Lcom/opera/android/RootView;->c:Lmw7;

    return v2
.end method

.method public final e()V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    invoke-virtual {v0}, Ls6e;->c()Z

    move-result v0

    const/high16 v1, 0x40400000    # 3.0f

    if-eqz v0, :cond_49

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    iget-object v0, v0, Ls6e;->b:Lvq8;

    if-eqz v0, :cond_49

    iget-boolean v0, v0, Lvq8;->a:Z

    if-eqz v0, :cond_49

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    iget-object v0, v0, Ls6e;->b:Lvq8;

    if-eqz v0, :cond_31

    iget-object v0, v0, Lvq8;->l:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_33

    :cond_31
    const-string v0, ""

    :goto_33
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_49

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iput v0, p0, Lcom/opera/android/RootView;->k:I

    const v0, -0x55000100

    iput v0, p0, Lcom/opera/android/RootView;->l:I

    return-void

    :cond_49
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    invoke-virtual {v0}, Ls6e;->c()Z

    move-result v0

    if-eqz v0, :cond_8d

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    iget-object v0, v0, Ls6e;->b:Lvq8;

    if-eqz v0, :cond_8d

    iget-boolean v0, v0, Lvq8;->a:Z

    if-eqz v0, :cond_8d

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object v0

    iget v0, v0, Ls6e;->a:I

    if-eqz v0, :cond_7e

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_7e

    const v0, -0x5598c549

    goto :goto_80

    :cond_7e
    const/high16 v0, -0x55010000

    :goto_80
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lcom/opera/android/RootView;->k:I

    iput v0, p0, Lcom/opera/android/RootView;->l:I

    return-void

    :cond_8d
    sget v0, Lcom/opera/android/browser/chromium/BrowserOverrides;->a:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/opera/android/RootView;->k:I

    return-void
.end method

.method public final f()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/RootView;->A:Z

    if-nez v0, :cond_a

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_b

    :cond_a
    return-void

    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/RootView;->A:Z

    iget-object v0, p0, Lcom/opera/android/RootView;->y:Lx7i;

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final fitSystemWindows(Landroid/graphics/Rect;)Z
    .registers 3

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-super {p0, v0}, Landroid/view/View;->fitSystemWindows(Landroid/graphics/Rect;)Z

    const/4 p0, 0x0

    return p0
.end method

.method public final gatherTransparentRegion(Landroid/graphics/Region;)Z
    .registers 11

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->gatherTransparentRegion(Landroid/graphics/Region;)Z

    move-result v0

    if-nez p1, :cond_7

    return v0

    :cond_7
    iget v1, p0, Lcom/opera/android/RootView;->u:I

    iget v2, p0, Lcom/opera/android/RootView;->o:I

    add-int v5, v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/opera/android/RootView;->p:I

    sub-int v7, v1, v2

    iget v4, p0, Lcom/opera/android/RootView;->v:I

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    iget p0, p0, Lcom/opera/android/RootView;->w:I

    sub-int v6, v1, p0

    sget-object v8, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Region;->op(IIIILandroid/graphics/Region$Op;)Z

    return v0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    new-instance v0, Ly7i;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Ly7i;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 12

    const/4 v0, 0x0

    invoke-static {v0, p1}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object p1

    iget-object v0, p1, Lg3o;->a:Ld3o;

    iget-boolean v1, p0, Lcom/opera/android/RootView;->m:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_50

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x24

    if-lt v1, v3, :cond_18

    new-instance v1, Lt2o;

    invoke-direct {v1, p1}, Lt2o;-><init>(Lg3o;)V

    goto :goto_45

    :cond_18
    const/16 v3, 0x23

    if-lt v1, v3, :cond_22

    new-instance v1, Ls2o;

    invoke-direct {v1, p1}, Ls2o;-><init>(Lg3o;)V

    goto :goto_45

    :cond_22
    const/16 v3, 0x22

    if-lt v1, v3, :cond_2c

    new-instance v1, Lr2o;

    invoke-direct {v1, p1}, Lr2o;-><init>(Lg3o;)V

    goto :goto_45

    :cond_2c
    const/16 v3, 0x1f

    if-lt v1, v3, :cond_36

    new-instance v1, Lq2o;

    invoke-direct {v1, p1}, Lq2o;-><init>(Lg3o;)V

    goto :goto_45

    :cond_36
    const/16 v3, 0x1e

    if-lt v1, v3, :cond_40

    new-instance v1, Lp2o;

    invoke-direct {v1, p1}, Lp2o;-><init>(Lg3o;)V

    goto :goto_45

    :cond_40
    new-instance v1, Lo2o;

    invoke-direct {v1, p1}, Lo2o;-><init>(Lg3o;)V

    :goto_45
    invoke-static {v2, v2, v2, v2}, Lr9b;->c(IIII)Lr9b;

    move-result-object p1

    invoke-virtual {v1, p1}, Lo2o;->h(Lr9b;)V

    invoke-virtual {v1}, Lo2o;->b()Lg3o;

    move-result-object p1

    :cond_50
    iget-boolean v1, p0, Lcom/opera/android/RootView;->n:Z

    const/16 v3, 0x80

    if-eqz v1, :cond_59

    sget-object v1, Lr9b;->e:Lr9b;

    goto :goto_5f

    :cond_59
    iget-object v1, p1, Lg3o;->a:Ld3o;

    invoke-virtual {v1, v3}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    :goto_5f
    iget-object v4, p1, Lg3o;->a:Ld3o;

    invoke-virtual {v4}, Ld3o;->n()Lr9b;

    move-result-object v4

    invoke-static {v4, v1}, Lr9b;->a(Lr9b;Lr9b;)Lr9b;

    move-result-object v1

    iget-object v4, p1, Lg3o;->a:Ld3o;

    const/16 v5, 0x207

    invoke-virtual {v4, v5}, Ld3o;->i(I)Lr9b;

    move-result-object v4

    iget v4, v4, Lr9b;->b:I

    iget v6, v1, Lr9b;->b:I

    sub-int/2addr v6, v4

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    iget v7, v1, Lr9b;->d:I

    iget v8, v1, Lr9b;->a:I

    iget v1, v1, Lr9b;->c:I

    iget v9, p0, Lcom/opera/android/RootView;->o:I

    if-ne v4, v9, :cond_94

    iget v9, p0, Lcom/opera/android/RootView;->p:I

    if-ne v7, v9, :cond_94

    iget v9, p0, Lcom/opera/android/RootView;->u:I

    if-ne v6, v9, :cond_94

    iget v9, p0, Lcom/opera/android/RootView;->v:I

    if-ne v8, v9, :cond_94

    iget v9, p0, Lcom/opera/android/RootView;->w:I

    if-eq v1, v9, :cond_b0

    :cond_94
    iput v4, p0, Lcom/opera/android/RootView;->o:I

    iput v7, p0, Lcom/opera/android/RootView;->p:I

    iget-object v4, p0, Lcom/opera/android/RootView;->q:Lpde;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v7}, Lekc;->r(Ljava/lang/Object;)V

    iput v6, p0, Lcom/opera/android/RootView;->u:I

    iput v8, p0, Lcom/opera/android/RootView;->v:I

    iput v1, p0, Lcom/opera/android/RootView;->w:I

    invoke-virtual {p0}, Lcom/opera/android/RootView;->requestLayout()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    invoke-virtual {p0}, Lcom/opera/android/RootView;->f()V

    :cond_b0
    invoke-virtual {v0, v5}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    invoke-virtual {v0, v3}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    invoke-static {v1, v0}, Lr9b;->a(Lr9b;Lr9b;)Lr9b;

    move-result-object v0

    iget v1, v0, Lr9b;->a:I

    iget v3, p0, Lcom/opera/android/RootView;->v:I

    sub-int/2addr v1, v3

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v3, v0, Lr9b;->b:I

    iget v4, p0, Lcom/opera/android/RootView;->o:I

    sub-int/2addr v3, v4

    iget v4, p0, Lcom/opera/android/RootView;->u:I

    sub-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, v0, Lr9b;->c:I

    iget v5, p0, Lcom/opera/android/RootView;->w:I

    sub-int/2addr v4, v5

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget v0, v0, Lr9b;->d:I

    iget v5, p0, Lcom/opera/android/RootView;->p:I

    sub-int/2addr v0, v5

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v1, v3, v4, v0}, Lr9b;->c(IIII)Lr9b;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/RootView;->r:Lpde;

    invoke-static {v1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lg3o;->f()Landroid/view/WindowInsets;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/RootView;->j:Lqwe;

    iget-object v0, v0, Lqwe;->b:Li7f;

    invoke-virtual {v0, p0}, Li7f;->b(Ljava/lang/Object;)Z

    sget v0, Lcom/opera/android/browser/chromium/BrowserOverrides;->a:I

    invoke-virtual {p0}, Lcom/opera/android/RootView;->e()V

    invoke-virtual {p0}, Lcom/opera/android/RootView;->f()V

    return-void
.end method

.method public final onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/RootView;->C:Z

    if-nez v0, :cond_1e

    invoke-static {}, Lvml;->b()Z

    move-result v0

    if-nez v0, :cond_1e

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/RootView;->C:Z

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Invalidate from non-main thread"

    invoke-static {p1, p0}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/view/View;->postInvalidate()V

    return-void

    :cond_1e
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/RootView;->y:Lx7i;

    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/RootView;->A:Z

    iget-object v0, p0, Lcom/opera/android/RootView;->j:Lqwe;

    iget-object v0, v0, Lqwe;->b:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    sget p0, Lcom/opera/android/browser/chromium/BrowserOverrides;->a:I

    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/RootView;->h:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onLayout(ZIIII)V
    .registers 8

    const/4 p1, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    if-ge p1, p2, :cond_3f

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p3

    const/16 p4, 0x8

    if-eq p3, p4, :cond_3c

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Ly7i;

    iget p4, p0, Lcom/opera/android/RootView;->v:I

    iget p5, p3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr p4, p5

    iget p5, p0, Lcom/opera/android/RootView;->u:I

    iget v0, p3, Ly7i;->b:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_29

    iget p3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_2e

    :cond_29
    iget v0, p0, Lcom/opera/android/RootView;->o:I

    iget p3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p3, v0

    :goto_2e
    add-int/2addr p5, p3

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    add-int/2addr p3, p4

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v0, p5

    invoke-virtual {p2, p4, p5, p3, v0}, Landroid/view/View;->layout(IIII)V

    :cond_3c
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_3f
    return-void
.end method

.method public final onMeasure(II)V
    .registers 10

    invoke-super {p0, p1, p2}, Lq2c;->onMeasure(II)V

    const/4 v0, 0x0

    :goto_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_47

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_44

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Ly7i;

    iget v3, p0, Lcom/opera/android/RootView;->u:I

    iget v4, v2, Ly7i;->b:I

    and-int/lit8 v5, v4, 0x1

    const/4 v6, 0x1

    if-eq v5, v6, :cond_28

    iget v5, p0, Lcom/opera/android/RootView;->o:I

    add-int/2addr v3, v5

    :cond_28
    and-int/lit8 v4, v4, 0x2

    const/4 v5, 0x2

    if-eq v4, v5, :cond_30

    iget v4, p0, Lcom/opera/android/RootView;->p:I

    add-int/2addr v3, v4

    :cond_30
    iget v4, p0, Lcom/opera/android/RootView;->v:I

    iget v5, p0, Lcom/opera/android/RootView;->w:I

    add-int/2addr v4, v5

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-static {p1, v4, v5}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v4

    iget v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-static {p2, v3, v2}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v2

    invoke-virtual {v1, v4, v2}, Landroid/view/View;->measure(II)V

    :cond_44
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_47
    return-void
.end method

.method public final requestLayout()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/RootView;->B:Z

    if-nez v0, :cond_1d

    invoke-static {}, Lvml;->b()Z

    move-result v0

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/RootView;->B:Z

    const-string v0, "requestLayout from non-main thread"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lx7i;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lx7i;-><init>(Lcom/opera/android/RootView;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1d
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method
