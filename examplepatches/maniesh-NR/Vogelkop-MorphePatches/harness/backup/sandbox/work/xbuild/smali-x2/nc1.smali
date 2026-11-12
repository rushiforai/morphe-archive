.class public final Lnc1;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lnc1;->a:B

    .line 29
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 31
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lnc1;->b:Ljava/lang/Object;

    .line 32
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lnc1;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lnc1;->a:B

    iput-object p1, p0, Lnc1;->c:Ljava/lang/Object;

    const/4 p1, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p2, p1, v1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lnc1;->b:Ljava/lang/Object;

    new-instance p1, Landroid/view/View;

    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method private final a(Landroid/graphics/Canvas;)V
    .registers 2

    return-void
.end method

.method private final b(Landroid/view/View;Landroid/view/View;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 3

    iget-byte v0, p0, Lnc1;->a:B

    packed-switch v0, :pswitch_data_a

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    :pswitch_8
    return-void

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-byte v0, p0, Lnc1;->a:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x1

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;
    .registers 4

    iget-byte v0, p0, Lnc1;->a:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->invalidateChildInParent([ILandroid/graphics/Rect;)Landroid/view/ViewParent;

    move-result-object p0

    return-object p0

    :pswitch_a
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Lnc1;->a:B

    packed-switch v0, :pswitch_data_a

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onDescendantInvalidated(Landroid/view/View;Landroid/view/View;)V

    :pswitch_8
    return-void

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    iget-byte p1, p0, Lnc1;->a:B

    iget-object p2, p0, Lnc1;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_48

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p2, Landroid/graphics/Rect;

    iget p1, p2, Landroid/graphics/Rect;->left:I

    iget p3, p2, Landroid/graphics/Rect;->top:I

    iget p4, p2, Landroid/graphics/Rect;->right:I

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, p1, p3, p4, p2}, Landroid/view/View;->layout(IIII)V

    return-void

    :pswitch_1a
    check-cast p2, Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_26
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_46

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc6n;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result p4

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p5

    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/view/View;->layout(IIII)V

    goto :goto_26

    :cond_46
    return-void

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method

.method public final onMeasure(II)V
    .registers 13

    iget-byte v0, p0, Lnc1;->a:B

    const/4 v1, 0x0

    const/high16 v2, -0x80000000

    iget-object v3, p0, Lnc1;->b:Ljava/lang/Object;

    const/high16 v4, 0x40000000    # 2.0f

    packed-switch v0, :pswitch_data_f4

    check-cast v3, Landroid/graphics/Rect;

    iget-object v0, p0, Lnc1;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object v5, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    iget-object v6, v5, Lb4g;->j:Landroid/graphics/Rect;

    if-nez v6, :cond_2f

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, v5, Lb4g;->j:Landroid/graphics/Rect;

    iget-object v6, v5, Lo73;->a:Ldkf;

    const v7, 0x7f0407b8

    invoke-static {v7, v6}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_2f

    iget-object v7, v5, Lb4g;->j:Landroid/graphics/Rect;

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    :cond_2f
    iget-object v5, v5, Lb4g;->j:Landroid/graphics/Rect;

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    if-eq p1, v2, :cond_41

    if-ne p1, v4, :cond_61

    :cond_41
    iget-object p1, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->c:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    iget v8, v5, Landroid/graphics/Rect;->left:I

    iget v9, v5, Landroid/graphics/Rect;->right:I

    sub-int v9, v6, v9

    invoke-static {p1, v8, v9}, Lcs5;->t(III)I

    move-result p1

    iput p1, v3, Landroid/graphics/Rect;->left:I

    iget-object p1, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->c:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    iget v8, v5, Landroid/graphics/Rect;->left:I

    iget v9, v5, Landroid/graphics/Rect;->right:I

    sub-int v9, v6, v9

    invoke-static {p1, v8, v9}, Lcs5;->t(III)I

    move-result p1

    iput p1, v3, Landroid/graphics/Rect;->right:I

    :cond_61
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    if-eq p1, v2, :cond_69

    if-ne p1, v4, :cond_89

    :cond_69
    iget-object p1, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->c:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iget p2, v5, Landroid/graphics/Rect;->top:I

    iget v2, v5, Landroid/graphics/Rect;->bottom:I

    sub-int v2, v7, v2

    invoke-static {p1, p2, v2}, Lcs5;->t(III)I

    move-result p1

    iput p1, v3, Landroid/graphics/Rect;->top:I

    iget-object p1, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->c:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    iget p2, v5, Landroid/graphics/Rect;->top:I

    iget v0, v5, Landroid/graphics/Rect;->bottom:I

    sub-int v0, v7, v0

    invoke-static {p1, p2, v0}, Lcs5;->t(III)I

    move-result p1

    iput p1, v3, Landroid/graphics/Rect;->bottom:I

    :cond_89
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result p2

    invoke-static {p2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-static {v0, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p1, p2, v0}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0, v6, v7}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :pswitch_a4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/4 v5, 0x1

    if-ne v0, v4, :cond_ad

    move v0, v5

    goto :goto_ae

    :cond_ad
    move v0, v1

    :goto_ae
    if-nez v0, :cond_b5

    const-string v0, "widthMeasureSpec should be EXACTLY"

    invoke-static {v0}, La8b;->a(Ljava/lang/String;)V

    :cond_b5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-ne v0, v4, :cond_bc

    move v1, v5

    :cond_bc
    if-nez v1, :cond_c3

    const-string v0, "heightMeasureSpec should be EXACTLY"

    invoke-static {v0}, La8b;->a(Ljava/lang/String;)V

    :cond_c3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_da
    :goto_da
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_f2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc6n;

    iget p2, p1, Lc6n;->v:I

    if-eq p2, v2, :cond_da

    iget v0, p1, Lc6n;->w:I

    if-eq v0, v2, :cond_da

    invoke-virtual {p1, p2, v0}, Landroid/view/View;->measure(II)V

    goto :goto_da

    :cond_f2
    return-void

    nop

    :pswitch_data_f4
    .packed-switch 0x0
        :pswitch_a4
    .end packed-switch
.end method

.method public final requestLayout()V
    .registers 6

    iget-byte v0, p0, Lnc1;->a:B

    packed-switch v0, :pswitch_data_32

    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_9
    invoke-virtual {p0, p0}, Landroid/view/ViewGroup;->cleanupLayoutState(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_12
    if-ge v2, v0, :cond_31

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lnc1;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lm3c;

    invoke-virtual {v3}, Landroid/view/View;->isLayoutRequested()Z

    move-result v3

    if-eqz v3, :cond_2e

    if-eqz v4, :cond_2e

    const/4 v3, 0x7

    invoke-static {v4, v1, v3}, Lm3c;->V(Lm3c;ZI)V

    :cond_2e
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_31
    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final shouldDelayChildPressedState()Z
    .registers 2

    iget-byte v0, p0, Lnc1;->a:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Landroid/view/ViewGroup;->shouldDelayChildPressedState()Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x0

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
