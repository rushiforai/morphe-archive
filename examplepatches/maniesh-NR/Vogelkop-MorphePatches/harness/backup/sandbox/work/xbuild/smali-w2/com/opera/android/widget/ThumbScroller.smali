.class public Lcom/opera/android/widget/ThumbScroller;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic q:I


# instance fields
.field public final a:Lqa2;

.field public b:Ls03;

.field public c:Landroid/view/ViewPropertyAnimator;

.field public final d:Landroid/graphics/Rect;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/ImageView;

.field public g:I

.field public h:I

.field public i:Lzy9;

.field public final j:I

.field public k:I

.field public l:I

.field public m:J

.field public n:J

.field public o:Z

.field public final p:Lcbl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Lqa2;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lqa2;-><init>(Landroid/widget/FrameLayout;B)V

    iput-object p2, p0, Lcom/opera/android/widget/ThumbScroller;->a:Lqa2;

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/opera/android/widget/ThumbScroller;->d:Landroid/graphics/Rect;

    const/4 p2, 0x2

    iput p2, p0, Lcom/opera/android/widget/ThumbScroller;->g:I

    iput p2, p0, Lcom/opera/android/widget/ThumbScroller;->h:I

    new-instance p2, Lcbl;

    const/16 v0, 0xa

    invoke-direct {p2, p0, v0}, Lcbl;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lcom/opera/android/widget/ThumbScroller;->p:Lcbl;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/ThumbScroller;->j:I

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iput-object v1, p0, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    :cond_a
    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->b:Ls03;

    if-eqz v0, :cond_13

    const/4 v2, 0x1

    iput-boolean v2, v0, Ls03;->b:Z

    iput-object v1, p0, Lcom/opera/android/widget/ThumbScroller;->b:Ls03;

    :cond_13
    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->p:Lcbl;

    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final b()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Luz4;

    iget p0, p0, Luz4;->g:I

    return p0
.end method

.method public final c(I)V
    .registers 5

    iput p1, p0, Lcom/opera/android/widget/ThumbScroller;->g:I

    const-wide/16 v0, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_19

    iget-object p0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Luz4;

    iget-object p0, p0, Luz4;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    cmp-long v0, p0, v0

    if-eqz v0, :cond_2e

    invoke-static {p0, p1, v2}, LJ/N;->MpcV7a8V(JZ)V

    return-void

    :cond_19
    const/4 v2, 0x2

    if-ne p1, v2, :cond_2e

    iget-object p0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Luz4;

    iget-object p0, p0, Luz4;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    cmp-long v0, p0, v0

    if-eqz v0, :cond_2e

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, LJ/N;->MpcV7a8V(JZ)V

    :cond_2e
    return-void
.end method

.method public final d(ZZ)V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->a:Lqa2;

    iget-boolean v1, v0, Lqa2;->b:Z

    if-eqz v1, :cond_c

    const/4 v1, 0x0

    iput-boolean v1, v0, Lqa2;->b:Z

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_c
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/ThumbScroller;->c(I)V

    if-eqz p1, :cond_3a

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->a()V

    iget-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x190

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lz89;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0, p2}, Lz89;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void

    :cond_3a
    iget-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final e()V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->a:Lqa2;

    iget-boolean v1, v0, Lqa2;->b:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_c

    iput-boolean v2, v0, Lqa2;->b:Z

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_c
    const/4 v1, 0x1

    iput-boolean v1, v0, Lqa2;->b:Z

    iget-object v3, v0, Lqa2;->d:Landroid/widget/FrameLayout;

    check-cast v3, Lcom/opera/android/widget/ThumbScroller;

    iget-object v3, v3, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v3, v3, Lzy9;->a:Ljava/lang/Object;

    check-cast v3, Luz4;

    iget v4, v3, Luz4;->i:I

    if-eqz v4, :cond_23

    iget v3, v3, Luz4;->j:I

    if-eq v4, v3, :cond_23

    move v3, v2

    goto :goto_24

    :cond_23
    move v3, v1

    :goto_24
    xor-int/lit8 v4, v3, 0x1

    iput-boolean v4, v0, Lqa2;->c:Z

    if-nez v3, :cond_2d

    const-wide/16 v3, 0x5dc

    goto :goto_2f

    :cond_2d
    const-wide/16 v3, 0x12c

    :goto_2f
    invoke-static {v0, v3, v4}, Lvml;->d(Ljava/lang/Runnable;J)V

    iget v0, p0, Lcom/opera/android/widget/ThumbScroller;->g:I

    if-eq v0, v1, :cond_64

    invoke-virtual {p0, v1}, Lcom/opera/android/widget/ThumbScroller;->c(I)V

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->a()V

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v2, Lonl;

    invoke-direct {v2, p0, v1}, Lonl;-><init>(Lcom/opera/android/widget/ThumbScroller;B)V

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_64
    return-void
.end method

.method public final onFinishInflate()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a0b86

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    const v0, 0x7f0a0b87

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    iget v1, p0, Lcom/opera/android/widget/ThumbScroller;->h:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_30

    const v1, 0x7f080703

    goto :goto_33

    :cond_30
    const v1, 0x7f080704

    :goto_33
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p0, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Animatable;

    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->start()V

    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 11

    iget-boolean v0, p0, Lcom/opera/android/widget/ThumbScroller;->o:Z

    const/4 v1, 0x0

    if-nez v0, :cond_220

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x3

    const-wide/16 v4, 0x0

    if-nez v0, :cond_5d

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    iget-object v6, p0, Lcom/opera/android/widget/ThumbScroller;->d:Landroid/graphics/Rect;

    invoke-virtual {v0, v6}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {v6, v0, v7}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-eqz v0, :cond_220

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/opera/android/widget/ThumbScroller;->l:I

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getY()F

    move-result v0

    float-to-int v0, v0

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/opera/android/widget/ThumbScroller;->k:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/opera/android/widget/ThumbScroller;->n:J

    iput-wide v4, p0, Lcom/opera/android/widget/ThumbScroller;->m:J

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->a()V

    iget-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->a:Lqa2;

    iget-boolean v0, p1, Lqa2;->b:Z

    if-eqz v0, :cond_4d

    iput-boolean v1, p1, Lqa2;->b:Z

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_4d
    iget-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    iget-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    iput v3, p0, Lcom/opera/android/widget/ThumbScroller;->g:I

    return v2

    :cond_5d
    iget v0, p0, Lcom/opera/android/widget/ThumbScroller;->g:I

    if-ne v0, v3, :cond_220

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v6, 0x2

    if-eq v0, v6, :cond_76

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v0, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast v0, Luz4;

    iget-object v7, v0, Luz4;->d:Lysl;

    invoke-interface {v7}, Lysl;->q()Z

    invoke-interface {v7, v0}, Lysl;->f0(Ljava/lang/Object;)V

    :cond_76
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v3, :cond_80

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->e()V

    return v2

    :cond_80
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_ee

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/opera/android/widget/ThumbScroller;->n:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x1f4

    cmp-long p1, v3, v5

    if-gez p1, :cond_ea

    iget p1, p0, Lcom/opera/android/widget/ThumbScroller;->h:I

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    if-ne p1, v2, :cond_a2

    iget-object p1, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Luz4;

    iget p1, p1, Luz4;->i:I

    if-lez p1, :cond_e4

    goto :goto_ac

    :cond_a2
    iget-object p1, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Luz4;

    iget v0, p1, Luz4;->i:I

    iget p1, p1, Luz4;->j:I

    if-ge v0, p1, :cond_e4

    :goto_ac
    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->a()V

    new-instance p1, Ls03;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Ls03;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->b:Ls03;

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget p0, p0, Lcom/opera/android/widget/ThumbScroller;->h:I

    iget-object v0, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast v0, Luz4;

    if-ne p0, v2, :cond_e0

    iget-object p0, v0, Luz4;->d:Lysl;

    invoke-interface {p0}, Lysl;->n()Z

    move-result v1

    if-nez v1, :cond_e0

    invoke-interface {p0}, Lysl;->q()Z

    move-result v1

    if-eqz v1, :cond_e0

    invoke-interface {p0}, Lysl;->H()I

    move-result v1

    invoke-interface {p0}, Lysl;->h()I

    move-result v3

    if-ge v1, v3, :cond_e0

    iput-object p1, v0, Luz4;->e:Ls03;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lysl;->b0(Ljava/lang/Runnable;)V

    return v2

    :cond_e0
    invoke-virtual {p1}, Ls03;->run()V

    return v2

    :cond_e4
    iput-boolean v2, p0, Lcom/opera/android/widget/ThumbScroller;->o:Z

    invoke-virtual {p0, v2, v1}, Lcom/opera/android/widget/ThumbScroller;->d(ZZ)V

    return v2

    :cond_ea
    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->e()V

    return v2

    :cond_ee
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v6, :cond_220

    iget v0, p0, Lcom/opera/android/widget/ThumbScroller;->l:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    sub-int/2addr v0, v1

    iget-wide v7, p0, Lcom/opera/android/widget/ThumbScroller;->n:J

    cmp-long v1, v7, v4

    iget v3, p0, Lcom/opera/android/widget/ThumbScroller;->j:I

    if-lez v1, :cond_10c

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-lt v1, v3, :cond_21f

    iput-wide v4, p0, Lcom/opera/android/widget/ThumbScroller;->n:J

    :cond_10c
    if-lez v0, :cond_110

    move v1, v2

    goto :goto_111

    :cond_110
    move v1, v6

    :goto_111
    iget v4, p0, Lcom/opera/android/widget/ThumbScroller;->h:I

    if-eq v1, v4, :cond_151

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-lt v4, v3, :cond_21f

    iget v4, p0, Lcom/opera/android/widget/ThumbScroller;->h:I

    if-eq v4, v1, :cond_13a

    iput v1, p0, Lcom/opera/android/widget/ThumbScroller;->h:I

    iget-object v4, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    if-ne v1, v6, :cond_129

    const v5, 0x7f080703

    goto :goto_12c

    :cond_129
    const v5, 0x7f080704

    :goto_12c
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v4, p0, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/Animatable;

    invoke-interface {v4}, Landroid/graphics/drawable/Animatable;->start()V

    :cond_13a
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    sub-int/2addr v0, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget-object v4, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/view/View;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    if-ne v1, v6, :cond_14e

    neg-int v0, v0

    :cond_14e
    add-int/2addr v3, v0

    iput v3, p0, Lcom/opera/android/widget/ThumbScroller;->k:I

    :cond_151
    iget-wide v0, p0, Lcom/opera/android/widget/ThumbScroller;->m:J

    const-wide/16 v3, 0x19

    add-long/2addr v0, v3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    cmp-long v0, v0, v3

    if-gtz v0, :cond_21f

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/widget/ThumbScroller;->m:J

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v0, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast v0, Luz4;

    iget-object v1, v0, Luz4;->d:Lysl;

    invoke-interface {v1}, Lysl;->q()Z

    move-result v3

    if-eqz v3, :cond_176

    invoke-interface {v1, v0}, Lysl;->r(Ljava/lang/Object;)V

    goto :goto_179

    :cond_176
    invoke-interface {v1, v0}, Lysl;->f0(Ljava/lang/Object;)V

    :goto_179
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/opera/android/widget/ThumbScroller;->l:I

    iget v0, p0, Lcom/opera/android/widget/ThumbScroller;->k:I

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v0

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v1

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v3

    iget-object v4, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v4, v4, Lzy9;->a:Ljava/lang/Object;

    check-cast v4, Luz4;

    iget v4, v4, Luz4;->h:I

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int/2addr v5, v3

    sub-int/2addr v5, v4

    iget-object v3, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v5, v3

    add-int/2addr v5, v1

    invoke-static {p1, v0, v5}, Lcs5;->t(III)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_21f

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    iget-object p1, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    invoke-virtual {p0}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v1, v1, Lzy9;->a:Ljava/lang/Object;

    check-cast v1, Luz4;

    iget v1, v1, Luz4;->h:I

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    sub-int/2addr v3, v0

    sub-int/2addr v3, v1

    iget-object v0, p0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr v3, v0

    int-to-float v0, v3

    div-float/2addr p1, v0

    iget-object p0, p0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Luz4;

    iget v0, p0, Luz4;->j:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    float-to-int p1, v0

    invoke-virtual {p0}, Luz4;->a()Lhuh;

    move-result-object v0

    iget v1, v0, Lhuh;->a:F

    invoke-virtual {v0, v1}, Lhuh;->a(F)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget-object p0, p0, Luz4;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    int-to-float v0, v0

    int-to-float p1, p1

    invoke-virtual {p0, v0, p1}, Lorg/chromium/ui/base/EventForwarder;->g(FF)V

    :cond_21f
    return v2

    :cond_220
    return v1
.end method
