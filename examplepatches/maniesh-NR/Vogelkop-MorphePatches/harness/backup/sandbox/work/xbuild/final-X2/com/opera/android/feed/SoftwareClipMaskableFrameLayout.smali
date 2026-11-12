.class public final Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lvbj;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0006\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u0000\u00a8\u0006\u0001"
    }
    d2 = {
        "Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:F

.field public final b:Landroid/graphics/RectF;

.field public final c:Landroid/graphics/Rect;

.field public d:Lge5;

.field public e:Lsaj;

.field public final f:Ln1f;

.field public g:Ljava/lang/Boolean;

.field public h:Landroid/view/View$OnHoverListener;

.field public i:Z

.field public final j:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->a:F

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->c:Landroid/graphics/Rect;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_22

    new-instance v1, Lybj;

    invoke-direct {v1, p0}, Lybj;-><init>(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V

    goto :goto_27

    :cond_22
    new-instance v1, Lwbj;

    invoke-direct {v1, p0}, Lwbj;-><init>(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V

    :goto_27
    iput-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->f:Ln1f;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->g:Ljava/lang/Boolean;

    iput-boolean v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->i:Z

    invoke-static {p1, p2, v0, v0}, Lsaj;->j(Landroid/content/Context;Landroid/util/AttributeSet;II)Lala;

    move-result-object p1

    invoke-virtual {p1}, Lala;->i()Lsaj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->k(Lsaj;)V

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->j:Landroid/graphics/Path;

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/RectF;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->f:Ln1f;

    iput-object v0, p1, Ln1f;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Ln1f;->o()V

    invoke-virtual {p1, p0}, Ln1f;->e(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V

    iget-object p0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->d:Lge5;

    if-eqz p0, :cond_55

    iget-object p1, p0, Lge5;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    iget-object p0, p0, Lge5;->c:Ljava/lang/Object;

    check-cast p0, Lov8;

    iget-object p0, p0, Lov8;->l:Lvs;

    sget-object v1, Lov8;->m:Lixh;

    check-cast p1, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Ly7h;->l(Landroid/content/Context;)F

    move-result v1

    sget-object v2, Lov8;->n:Lixh;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v2, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result p1

    iget v0, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v2, v1, p1

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    if-eqz v2, :cond_43

    sub-float/2addr v0, v1

    sub-float/2addr p1, v1

    div-float/2addr v0, p1

    invoke-static {v0, v4, v3}, Ldjh;->b(FFF)F

    move-result v4

    :cond_43
    sub-float/2addr v3, v4

    iget-object p1, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/LinearLayout;

    const/high16 p1, 0x3f400000    # 0.75f

    mul-float/2addr v3, p1

    invoke-virtual {p0, v3}, Landroid/view/View;->setAlpha(F)V

    :cond_55
    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->f:Ln1f;

    iget-object v1, v0, Ln1f;->d:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Path;

    invoke-virtual {v0}, Ln1f;->m()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {v1}, Landroid/graphics/Path;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_1f
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 13

    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v0

    if-nez v0, :cond_6d

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6d

    iget-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->e:Lsaj;

    iget-object v2, v1, Lsaj;->e:Lzw5;

    iget-object v3, v1, Lsaj;->h:Lzw5;

    iget-object v4, v1, Lsaj;->g:Lzw5;

    iget-object v5, v1, Lsaj;->f:Lzw5;

    invoke-interface {v2, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v2

    iget-object v1, v1, Lsaj;->e:Lzw5;

    invoke-interface {v1, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v1

    invoke-interface {v5, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v6

    invoke-interface {v5, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v5

    invoke-interface {v4, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v7

    invoke-interface {v4, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v4

    invoke-interface {v3, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v8

    invoke-interface {v3, v0}, Lzw5;->a(Landroid/graphics/RectF;)F

    move-result v3

    const/16 v9, 0x8

    new-array v9, v9, [F

    const/4 v10, 0x0

    aput v2, v9, v10

    const/4 v2, 0x1

    aput v1, v9, v2

    const/4 v1, 0x2

    aput v6, v9, v1

    const/4 v1, 0x3

    aput v5, v9, v1

    const/4 v1, 0x4

    aput v7, v9, v1

    const/4 v1, 0x5

    aput v4, v9, v1

    const/4 v1, 0x6

    aput v8, v9, v1

    const/4 v1, 0x7

    aput v3, v9, v1

    iget-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->j:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->rewind()V

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v0, v9, v2}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_6d
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final getFocusedRect(Landroid/graphics/Rect;)V
    .registers 5

    iget-object p0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    iget v0, p0, Landroid/graphics/RectF;->left:F

    float-to-int v0, v0

    iget v1, p0, Landroid/graphics/RectF;->top:F

    float-to-int v1, v1

    iget v2, p0, Landroid/graphics/RectF;->right:F

    float-to-int v2, v2

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    float-to-int p0, p0

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public final k(Lsaj;)V
    .registers 5

    new-instance v0, Luac;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Luac;-><init>(B)V

    invoke-virtual {p1, v0}, Lsaj;->n(Lraj;)Lsaj;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->e:Lsaj;

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->f:Ln1f;

    iput-object p1, v0, Ln1f;->b:Ljava/lang/Object;

    invoke-virtual {v0}, Ln1f;->o()V

    invoke-virtual {v0, p0}, Ln1f;->e(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->e:Lsaj;

    const/4 v1, 0x0

    if-eqz p1, :cond_2e

    invoke-static {p1}, Lcom/google/android/material/focus/FocusRingDrawable;->c(Landroid/graphics/drawable/Drawable;)Lcom/google/android/material/focus/FocusRingDrawable;

    move-result-object v2

    if-eqz v2, :cond_30

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lcom/google/android/material/focus/FocusRingDrawable;->c(Landroid/graphics/drawable/Drawable;)Lcom/google/android/material/focus/FocusRingDrawable;

    move-result-object p1

    goto :goto_31

    :cond_2e
    sget-object p1, Lcom/google/android/material/focus/FocusRingDrawable;->p:Landroid/graphics/drawable/ColorDrawable;

    :cond_30
    move-object p1, v1

    :goto_31
    if-eqz p1, :cond_37

    iget-object p1, p1, Lcom/google/android/material/focus/FocusRingDrawable;->o:Lpg9;

    iput-object v0, p1, Lpg9;->t:Lqaj;

    :cond_37
    invoke-virtual {p0}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->e:Lsaj;

    if-eqz p1, :cond_4c

    invoke-static {p1}, Lcom/google/android/material/focus/FocusRingDrawable;->c(Landroid/graphics/drawable/Drawable;)Lcom/google/android/material/focus/FocusRingDrawable;

    move-result-object v0

    if-eqz v0, :cond_4c

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lcom/google/android/material/focus/FocusRingDrawable;->c(Landroid/graphics/drawable/Drawable;)Lcom/google/android/material/focus/FocusRingDrawable;

    move-result-object v1

    :cond_4c
    if-eqz v1, :cond_52

    iget-object p1, v1, Lcom/google/android/material/focus/FocusRingDrawable;->o:Lpg9;

    iput-object p0, p1, Lpg9;->t:Lqaj;

    :cond_52
    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->g:Ljava/lang/Boolean;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->f:Ln1f;

    iget-boolean v2, v1, Ln1f;->a:Z

    if-eq v0, v2, :cond_16

    iput-boolean v0, v1, Ln1f;->a:Z

    invoke-virtual {v1, p0}, Ln1f;->e(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V

    :cond_16
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->f:Ln1f;

    iget-boolean v1, v0, Ln1f;->a:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->g:Ljava/lang/Boolean;

    iget-boolean v1, v0, Ln1f;->a:Z

    const/4 v2, 0x1

    if-eq v2, v1, :cond_14

    iput-boolean v2, v0, Ln1f;->a:Z

    invoke-virtual {v0, p0}, Ln1f;->e(Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;)V

    :cond_14
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method public final onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v2

    const/4 v3, 0x7

    const/16 v4, 0x9

    if-nez v2, :cond_39

    const/16 v2, 0xa

    if-eq v0, v4, :cond_17

    if-eq v0, v2, :cond_17

    if-ne v0, v3, :cond_39

    :cond_17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    invoke-virtual {v1, v5, v6}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v1

    if-nez v1, :cond_39

    iget-boolean v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->i:Z

    if-eqz v0, :cond_35

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->h:Landroid/view/View$OnHoverListener;

    if-eqz v0, :cond_35

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setAction(I)V

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->h:Landroid/view/View$OnHoverListener;

    invoke-interface {v0, p0, p1}, Landroid/view/View$OnHoverListener;->onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z

    :cond_35
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->i:Z

    return p1

    :cond_39
    iget-object v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->h:Landroid/view/View$OnHoverListener;

    if-eqz v1, :cond_54

    iget-boolean v1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->i:Z

    const/4 v2, 0x1

    if-nez v1, :cond_49

    if-ne v0, v3, :cond_49

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->setAction(I)V

    iput-boolean v2, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->i:Z

    :cond_49
    if-eq v0, v3, :cond_4d

    if-ne v0, v4, :cond_4f

    :cond_4d
    iput-boolean v2, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->i:Z

    :cond_4f
    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->h:Landroid/view/View$OnHoverListener;

    invoke-interface {v0, p0, p1}, Landroid/view/View$OnHoverListener;->onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z

    :cond_54
    invoke-super {p0, p1}, Landroid/view/View;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 7

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->c:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Landroid/view/View;->getX()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    iget-object v3, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    if-lez v1, :cond_1c

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v4, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v1, v4

    float-to-int v1, v1

    iput v1, v0, Landroid/graphics/Rect;->left:I

    :cond_1c
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    move-result p0

    cmpl-float p0, p0, v2

    if-lez p0, :cond_2d

    iget p0, v0, Landroid/graphics/Rect;->top:I

    int-to-float p0, p0

    iget v1, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr p0, v1

    float-to-int p0, p0

    iput p0, v0, Landroid/graphics/Rect;->top:I

    :cond_2d
    iget p0, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v1, p0

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget p0, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v1, p0

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInScreen(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_18

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-nez v0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onSizeChanged(IIII)V
    .registers 6

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget p1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->a:F

    const/high16 p2, -0x40800000    # -1.0f

    cmpl-float p3, p1, p2

    if-eqz p3, :cond_31

    cmpl-float p2, p1, p2

    if-eqz p2, :cond_31

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p2

    int-to-float p2, p2

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p2, p3

    const/high16 p3, 0x3f800000    # 1.0f

    const/4 p4, 0x0

    invoke-static {p4, p2, p4, p3, p1}, Lze1;->b(FFFFF)F

    move-result p1

    new-instance p2, Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p3

    int-to-float p3, p3

    sub-float/2addr p3, p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-direct {p2, p1, p4, p3, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p0, p2}, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->a(Landroid/graphics/RectF;)V

    :cond_31
    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-object v0, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->b:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_1e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-nez v0, :cond_1e

    const/4 p0, 0x0

    return p0

    :cond_1e
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final setOnHoverListener(Landroid/view/View$OnHoverListener;)V
    .registers 2

    iput-object p1, p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->h:Landroid/view/View$OnHoverListener;

    return-void
.end method
