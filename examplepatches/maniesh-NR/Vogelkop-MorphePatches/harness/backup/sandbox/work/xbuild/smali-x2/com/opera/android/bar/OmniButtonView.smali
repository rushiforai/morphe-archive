.class public Lcom/opera/android/bar/OmniButtonView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final synthetic m:I


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public b:I

.field public final c:I

.field public final d:I

.field public e:Lbp;

.field public f:Lbp;

.field public g:Lbp;

.field public h:Landroid/animation/ValueAnimator;

.field public i:Landroid/animation/ValueAnimator;

.field public j:Lbp;

.field public k:Z

.field public l:Lwub;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->a:Landroid/graphics/Paint;

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bar/OmniButtonView;->c:I

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lcom/opera/android/bar/OmniButtonView;->d:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;Lbp;Landroid/animation/ValueAnimator;)V
    .registers 11

    if-eqz p2, :cond_77

    iget-object p2, p2, Lbp;->b:Ljava/lang/Object;

    check-cast p2, Luaf;

    iget-object p2, p2, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    if-eqz p2, :cond_77

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v0

    float-to-int v3, v3

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    sub-int/2addr v4, v2

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v5

    sub-int/2addr v5, v3

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v6

    if-eqz p3, :cond_56

    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Float;

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v1

    :cond_56
    mul-float/2addr v1, v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p3

    int-to-float p3, p3

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p3, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr p0, v0

    invoke-virtual {p1, v1, v1, p3, p0}, Landroid/graphics/Canvas;->scale(FFFF)V

    int-to-float p0, v4

    int-to-float p3, v5

    invoke-virtual {p1, p0, p3}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 p0, 0x0

    invoke-virtual {p2, p0, p0, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_77
    return-void
.end method

.method public final b(Lbp;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->e:Lbp;

    if-eqz v0, :cond_14

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->g:Lkce;

    if-eqz v0, :cond_14

    iget-object v1, v0, Lkce;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lkce;->a()V

    :cond_14
    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->e:Lbp;

    if-eqz p1, :cond_28

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget-object p1, p1, Luaf;->g:Lkce;

    if-eqz p1, :cond_28

    iget-object v0, p1, Lkce;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lkce;->a()V

    :cond_28
    return-void
.end method

.method public final c(Lwub;)V
    .registers 3

    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->l:Lwub;

    new-instance v0, Lyaf;

    invoke-direct {v0, p0, p1}, Lyaf;-><init>(Lcom/opera/android/bar/OmniButtonView;Lwub;)V

    invoke-super {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-super {p0, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public final d(Lbp;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    :cond_a
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    :cond_13
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v0, :cond_27

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->g:Lkce;

    if-eqz v0, :cond_27

    iget-object v2, v0, Lkce;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lkce;->a()V

    :cond_27
    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    iget p1, p1, Lbp;->a:I

    and-int/lit8 p1, p1, 0x2

    const/4 v0, 0x0

    if-nez p1, :cond_36

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->l:Lwub;

    if-eqz p1, :cond_36

    const/4 p1, 0x1

    goto :goto_37

    :cond_36
    move p1, v0

    :goto_37
    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz p1, :cond_4e

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget-object p1, p1, Luaf;->g:Lkce;

    if-eqz p1, :cond_4e

    iget-object v2, p1, Lkce;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lkce;->a()V

    :cond_4e
    invoke-virtual {p0, v1}, Lcom/opera/android/bar/OmniButtonView;->e(Lbp;)V

    invoke-virtual {p0, v1}, Lcom/opera/android/bar/OmniButtonView;->b(Lbp;)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget p1, p1, Luaf;->b:I

    if-eqz p1, :cond_67

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_68

    :cond_67
    move-object p1, v1

    :goto_68
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget v2, p1, Luaf;->c:I

    iget p1, p1, Luaf;->d:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v2, :cond_7f

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_7f
    invoke-static {p0, v1, p1}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget-object p1, p1, Luaf;->a:Ltaf;

    sget-object v1, Ltaf;->O:Ltaf;

    if-ne p1, v1, :cond_8f

    const/4 v0, 0x4

    :cond_8f
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v0, :cond_c

    iget v0, v0, Lbp;->a:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final e(Lbp;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz v0, :cond_14

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->g:Lkce;

    if-eqz v0, :cond_14

    iget-object v1, v0, Lkce;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lkce;->a()V

    :cond_14
    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz p1, :cond_28

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget-object p1, p1, Luaf;->g:Lkce;

    if-eqz p1, :cond_28

    iget-object v0, p1, Lkce;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lkce;->a()V

    :cond_28
    return-void
.end method

.method public final f(Lbp;Z)V
    .registers 9

    if-nez p2, :cond_12

    iget-object p2, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_e

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Lcom/opera/android/bar/OmniButtonView;->b(Lbp;)V

    invoke-virtual {p0, p1}, Lcom/opera/android/bar/OmniButtonView;->e(Lbp;)V

    return-void

    :cond_e
    invoke-virtual {p0, p1}, Lcom/opera/android/bar/OmniButtonView;->d(Lbp;)V

    return-void

    :cond_12
    iget-object p2, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz p2, :cond_27

    iget-object v0, p2, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->a:Ltaf;

    iget-object v1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Luaf;

    iget-object v1, v1, Luaf;->a:Ltaf;

    if-ne v0, v1, :cond_27

    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    return-void

    :cond_27
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_4e

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->a:Ltaf;

    iget-object v4, p1, Lbp;->b:Ljava/lang/Object;

    check-cast v4, Luaf;

    iget-object v4, v4, Luaf;->a:Ltaf;

    if-ne v0, v4, :cond_4e

    if-nez p2, :cond_4e

    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    iget p1, p1, Lbp;->a:I

    and-int/2addr p1, v1

    if-nez p1, :cond_4a

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->l:Lwub;

    if-eqz p1, :cond_4a

    move v2, v3

    :cond_4a
    invoke-virtual {p0, v2}, Landroid/view/View;->setFocusable(Z)V

    return-void

    :cond_4e
    iget-object p2, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_5d

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p2

    const/4 v0, 0x0

    cmpl-float p2, p2, v0

    if-lez p2, :cond_5d

    move p2, v3

    goto :goto_5e

    :cond_5d
    move p2, v2

    :goto_5e
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_64

    move v0, v3

    goto :goto_65

    :cond_64
    move v0, v2

    :goto_65
    if-eqz p2, :cond_6b

    invoke-virtual {p0, p1}, Lcom/opera/android/bar/OmniButtonView;->b(Lbp;)V

    return-void

    :cond_6b
    invoke-virtual {p0, p1}, Lcom/opera/android/bar/OmniButtonView;->e(Lbp;)V

    if-eqz v0, :cond_71

    return-void

    :cond_71
    new-array p1, v1, [F

    fill-array-data p1, :array_d6

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    const-wide/16 v4, 0x64

    invoke-virtual {p1, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    sget-object p2, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    new-instance v0, Lxaf;

    invoke-direct {v0, p0, v2}, Lxaf;-><init>(Lcom/opera/android/bar/OmniButtonView;B)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    new-instance v0, Lkc;

    invoke-direct {v0, p0}, Lkc;-><init>(Lcom/opera/android/bar/OmniButtonView;)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-array p1, v1, [F

    fill-array-data p1, :array_de

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x32

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    new-instance p2, Lxaf;

    invoke-direct {p2, p0, v3}, Lxaf;-><init>(Lcom/opera/android/bar/OmniButtonView;B)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    new-instance p2, Ldf1;

    invoke-direct {p2, p0}, Ldf1;-><init>(Lcom/opera/android/bar/OmniButtonView;)V

    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    iget-object p0, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_d6
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_de
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final jumpDrawablesToCurrentState()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v0, :cond_12

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_12
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->e:Lbp;

    if-eqz v0, :cond_21

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_21
    iget-object p0, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz p0, :cond_30

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Luaf;

    iget-object p0, p0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    if-eqz p0, :cond_30

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_30
    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v0, p0, Lcom/opera/android/bar/OmniButtonView;->b:I

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 11

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    iget-object v1, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    invoke-virtual {p0, p1, v0, v1}, Lcom/opera/android/bar/OmniButtonView;->a(Landroid/graphics/Canvas;Lbp;Landroid/animation/ValueAnimator;)V

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    iget-object v1, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    invoke-virtual {p0, p1, v0, v1}, Lcom/opera/android/bar/OmniButtonView;->a(Landroid/graphics/Canvas;Lbp;Landroid/animation/ValueAnimator;)V

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_21

    iget-object v3, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v3, Luaf;

    iget-boolean v3, v3, Luaf;->m:Z

    if-eqz v3, :cond_21

    move v3, v1

    goto :goto_22

    :cond_21
    move v3, v2

    :goto_22
    iget-object v4, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz v4, :cond_2e

    iget-object v4, v4, Lbp;->b:Ljava/lang/Object;

    check-cast v4, Luaf;

    iget-boolean v4, v4, Luaf;->m:Z

    if-nez v4, :cond_2f

    :cond_2e
    move v1, v2

    :cond_2f
    const/high16 v4, 0x3f800000    # 1.0f

    if-nez v3, :cond_4d

    if-nez v1, :cond_36

    return-void

    :cond_36
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_44

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    :cond_44
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->n:Landroid/content/res/ColorStateList;

    goto :goto_6c

    :cond_4d
    if-eqz v1, :cond_56

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->n:Landroid/content/res/ColorStateList;

    goto :goto_6c

    :cond_56
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_64

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    :cond_64
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->n:Landroid/content/res/ColorStateList;

    :goto_6c
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    invoke-static {v4, v0}, Lp37;->a0(FI)I

    move-result v0

    iget-object v8, p0, Lcom/opera/android/bar/OmniButtonView;->a:Landroid/graphics/Paint;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v0

    iget v1, p0, Lcom/opera/android/bar/OmniButtonView;->d:I

    if-nez v0, :cond_93

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    sub-int v2, v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    :cond_93
    int-to-float v4, v2

    iget v0, p0, Lcom/opera/android/bar/OmniButtonView;->c:I

    int-to-float v5, v0

    int-to-float v6, v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    sub-int/2addr p0, v0

    int-to-float v7, p0

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;

    move-result-object p1

    if-nez p1, :cond_1d

    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result p2

    if-eqz p2, :cond_1d

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result p2

    if-eqz p2, :cond_1d

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/16 p1, 0x3ea

    invoke-static {p0, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object p0

    return-object p0

    :cond_1d
    return-object p1
.end method

.method public final onVisibilityAggregated(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onVisibilityAggregated(Z)V

    iput-boolean p1, p0, Lcom/opera/android/bar/OmniButtonView;->k:Z

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz p1, :cond_14

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget-object p1, p1, Luaf;->g:Lkce;

    if-eqz p1, :cond_14

    invoke-virtual {p1}, Lkce;->a()V

    :cond_14
    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz p1, :cond_23

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Luaf;

    iget-object p1, p1, Luaf;->g:Lkce;

    if-eqz p1, :cond_23

    invoke-virtual {p1}, Lkce;->a()V

    :cond_23
    iget-object p0, p0, Lcom/opera/android/bar/OmniButtonView;->e:Lbp;

    if-eqz p0, :cond_32

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Luaf;

    iget-object p0, p0, Luaf;->g:Lkce;

    if-eqz p0, :cond_32

    invoke-virtual {p0}, Lkce;->a()V

    :cond_32
    return-void
.end method

.method public final setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2

    return-void
.end method

.method public final setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 2

    return-void
.end method

.method public final verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v0, :cond_c

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    if-eq v0, p1, :cond_2a

    :cond_c
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz v0, :cond_18

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    if-eq v0, p1, :cond_2a

    :cond_18
    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->e:Lbp;

    if-eqz v0, :cond_24

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    if-eq v0, p1, :cond_2a

    :cond_24
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p0

    if-eqz p0, :cond_2c

    :cond_2a
    const/4 p0, 0x1

    return p0

    :cond_2c
    const/4 p0, 0x0

    return p0
.end method
