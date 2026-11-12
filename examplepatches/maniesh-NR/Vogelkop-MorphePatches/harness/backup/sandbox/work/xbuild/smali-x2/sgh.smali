.class public final Lsgh;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lsgh;->a:B

    iput-object p1, p0, Lsgh;->b:Ljava/lang/Object;

    iput-object p2, p0, Lsgh;->c:Ljava/lang/Object;

    .line 12
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/media/QuickJumpPlayerView;Lpgh;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lsgh;->a:B

    iput-object p1, p0, Lsgh;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    iput-object p2, p0, Lsgh;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lsgh;->a:B

    iput-object p2, p0, Lsgh;->b:Ljava/lang/Object;

    iput-object p1, p0, Lsgh;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-byte v0, p0, Lsgh;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lsgh;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_44

    :pswitch_8
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_d
    check-cast v2, Landroid/view/View$OnClickListener;

    iget-object p0, p0, Lsgh;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-interface {v2, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    return v1

    :pswitch_17
    check-cast v2, Lpgh;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p0

    iget-object p1, v2, Lpgh;->c:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    cmpg-float p0, p0, p1

    const/4 p1, 0x0

    if-gez p0, :cond_31

    move p0, v1

    goto :goto_32

    :cond_31
    move p0, p1

    :goto_32
    iget-boolean v0, v2, Lpgh;->i:Z

    if-eqz v0, :cond_38

    if-nez p0, :cond_3e

    :cond_38
    iget-boolean v0, v2, Lpgh;->j:Z

    if-eqz v0, :cond_42

    if-nez p0, :cond_42

    :cond_3e
    invoke-virtual {v2, p0}, Lpgh;->b(Z)V

    goto :goto_43

    :cond_42
    move v1, p1

    :goto_43
    return v1

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_17
        :pswitch_8
        :pswitch_d
    .end packed-switch
.end method

.method public final onDown(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-byte v0, p0, Lsgh;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lsgh;->c:Ljava/lang/Object;

    check-cast p0, Lw6j;

    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/OverScroller;

    invoke-virtual {p0}, Landroid/widget/OverScroller;->abortAnimation()V

    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 15

    iget-byte v0, p0, Lsgh;->a:B

    packed-switch v0, :pswitch_data_ac

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p1, p0, Lsgh;->c:Ljava/lang/Object;

    check-cast p1, Lw6j;

    invoke-virtual {p1}, Lw6j;->k()Z

    move-result p2

    iget-object v0, p1, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Lzjn;

    const/4 v1, 0x0

    if-eqz p2, :cond_ab

    iget-object p0, p0, Lsgh;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result p0

    if-nez p0, :cond_ab

    iget-object p0, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast p0, Llkn;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    iget-object p2, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast p2, Llkn;

    invoke-virtual {p2}, Llkn;->b()I

    move-result p2

    iget-object v2, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Llkn;

    invoke-virtual {v2}, Llkn;->a()I

    move-result v2

    invoke-virtual {v0, p0, p2, v2}, Lzjn;->b(Landroid/graphics/Rect;II)Landroid/graphics/RectF;

    move-result-object p0

    iget-object p2, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast p2, Llkn;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p2

    iget-object v2, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Llkn;

    invoke-virtual {v2}, Llkn;->b()I

    move-result v2

    iget-object v3, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast v3, Llkn;

    invoke-virtual {v3}, Llkn;->a()I

    move-result v3

    invoke-virtual {v0, p2, v2, v3}, Lzjn;->a(Landroid/graphics/Rect;II)F

    move-result v0

    int-to-float v2, v2

    mul-float/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v4

    sub-int/2addr v2, v4

    int-to-float v3, v3

    mul-float/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result p2

    sub-int/2addr v0, p2

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, v2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v0, p1, Lw6j;->d:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Landroid/widget/OverScroller;

    iget v0, p0, Landroid/graphics/RectF;->left:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget p0, p0, Landroid/graphics/RectF;->top:F

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p0

    neg-int v4, p0

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p0

    neg-int v5, p0

    iget v6, p2, Landroid/graphics/Rect;->left:I

    iget v7, p2, Landroid/graphics/Rect;->right:I

    iget v8, p2, Landroid/graphics/Rect;->top:I

    iget v9, p2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual/range {v1 .. v9}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    iget-object p0, p1, Lw6j;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    new-instance p2, Ly1n;

    const/16 p3, 0x16

    invoke-direct {p2, p1, p3}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    const/4 v1, 0x1

    :cond_ab
    return v1

    :pswitch_data_ac
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final onLongPress(Landroid/view/MotionEvent;)V
    .registers 4

    iget-byte v0, p0, Lsgh;->a:B

    packed-switch v0, :pswitch_data_38

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Lsgh;->b:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    iget-object p0, p0, Lsgh;->c:Ljava/lang/Object;

    check-cast p0, Lvwj;

    iget-object v0, p0, Lvwj;->a:Lagc;

    instance-of v1, v0, Lp0d;

    if-eqz v1, :cond_2b

    check-cast v0, Lp0d;

    invoke-interface {v0}, Lp0d;->b()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-virtual {p1}, Landroid/widget/TextView;->cancelLongPress()V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_36

    :cond_2b
    iget-object v0, p0, Lvwj;->a:Lagc;

    if-nez v0, :cond_36

    iget-object p0, p0, Lvwj;->d:Lzt;

    if-eqz p0, :cond_36

    invoke-virtual {p0, p1}, Lzt;->onLongClick(Landroid/view/View;)Z

    :cond_36
    :goto_36
    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 7

    iget-byte v0, p0, Lsgh;->a:B

    packed-switch v0, :pswitch_data_4c

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p1, p0, Lsgh;->c:Ljava/lang/Object;

    check-cast p1, Lw6j;

    invoke-virtual {p1}, Lw6j;->k()Z

    move-result p2

    if-eqz p2, :cond_1e

    iget-object p0, p0, Lsgh;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result p0

    if-eqz p0, :cond_20

    :cond_1e
    const/4 p0, 0x0

    goto :goto_4a

    :cond_20
    iget-object p0, p1, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Lzjn;

    iget-object p2, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast p2, Llkn;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p2

    iget-object v0, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Llkn;

    invoke-virtual {v0}, Llkn;->b()I

    move-result v0

    iget-object v1, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast v1, Llkn;

    invoke-virtual {v1}, Llkn;->a()I

    move-result v1

    invoke-virtual {p0, p2, v0, v1}, Lzjn;->b(Landroid/graphics/Rect;II)Landroid/graphics/RectF;

    move-result-object p0

    iget p2, p0, Landroid/graphics/RectF;->left:F

    add-float/2addr p2, p3

    iget p0, p0, Landroid/graphics/RectF;->top:F

    add-float/2addr p0, p4

    invoke-virtual {p1, p2, p0}, Lw6j;->r(FF)V

    const/4 p0, 0x1

    :goto_4a
    return p0

    nop

    :pswitch_data_4c
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-byte v0, p0, Lsgh;->a:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p1, p0, Lsgh;->b:Ljava/lang/Object;

    check-cast p1, Lpgh;

    iget p1, p1, Lpgh;->e:I

    if-lez p1, :cond_14

    const/4 p0, 0x1

    goto :goto_1c

    :cond_14
    iget-object p0, p0, Lsgh;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/QuickJumpPlayerView;

    invoke-virtual {p0}, Landroidx/media3/ui/PlayerView;->performClick()Z

    move-result p0

    :goto_1c
    return p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-byte v0, p0, Lsgh;->a:B

    iget-object v1, p0, Lsgh;->c:Ljava/lang/Object;

    iget-object v2, p0, Lsgh;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    :pswitch_9
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_e
    check-cast v1, Laoo;

    check-cast v2, Landroid/view/View;

    invoke-virtual {v1, v2}, Laoo;->q(Landroid/view/View;)V

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_1a
    check-cast v2, Landroid/widget/TextView;

    check-cast v1, Lvwj;

    iget-object p0, v1, Lvwj;->a:Lagc;

    if-eqz p0, :cond_26

    invoke-virtual {p0, v2}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    goto :goto_2d

    :cond_26
    iget-object p0, v1, Lvwj;->c:Lyk4;

    if-eqz p0, :cond_2d

    invoke-virtual {p0, v2}, Lyk4;->onClick(Landroid/view/View;)V

    :cond_2d
    :goto_2d
    const/4 p0, 0x1

    return p0

    :pswitch_2f
    check-cast v2, Lpgh;

    invoke-virtual {v2, p1}, Lpgh;->a(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_1a
        :pswitch_9
        :pswitch_9
        :pswitch_e
    .end packed-switch
.end method
