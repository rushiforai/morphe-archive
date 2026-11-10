.class public final Li/h1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnHoverListener;
.implements Landroid/view/View$OnAttachStateChangeListener;


# static fields
.field public static k:Li/h1;

.field public static l:Li/h1;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Ljava/lang/CharSequence;

.field public final c:I

.field public final d:Li/g1;

.field public final e:Li/g1;

.field public f:I

.field public g:I

.field public h:Li/i1;

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/CharSequence;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li/g1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Li/g1;-><init>(Li/h1;I)V

    iput-object v0, p0, Li/h1;->d:Li/g1;

    new-instance v0, Li/g1;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Li/g1;-><init>(Li/h1;I)V

    iput-object v0, p0, Li/h1;->e:Li/g1;

    iput-object p1, p0, Li/h1;->a:Landroid/view/View;

    iput-object p2, p0, Li/h1;->b:Ljava/lang/CharSequence;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    sget v0, Ly/N;->a:I

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_0

    invoke-static {p2}, Ly/L;->a(Landroid/view/ViewConfiguration;)I

    move-result p2

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    :goto_0
    iput p2, p0, Li/h1;->c:I

    iput-boolean v1, p0, Li/h1;->j:Z

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    return-void
.end method

.method public static b(Li/h1;)V
    .locals 3

    sget-object v0, Li/h1;->k:Li/h1;

    if-eqz v0, :cond_0

    iget-object v1, v0, Li/h1;->d:Li/g1;

    iget-object v0, v0, Li/h1;->a:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    sput-object p0, Li/h1;->k:Li/h1;

    if-eqz p0, :cond_1

    iget-object v0, p0, Li/h1;->d:Li/g1;

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v1

    int-to-long v1, v1

    iget-object p0, p0, Li/h1;->a:Landroid/view/View;

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    sget-object v0, Li/h1;->l:Li/h1;

    iget-object v1, p0, Li/h1;->a:Landroid/view/View;

    const/4 v2, 0x0

    if-ne v0, p0, :cond_2

    sput-object v2, Li/h1;->l:Li/h1;

    iget-object v0, p0, Li/h1;->h:Li/i1;

    if-eqz v0, :cond_1

    iget-object v3, v0, Li/i1;->b:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v0, v0, Li/i1;->a:Landroid/content/Context;

    const-string v4, "window"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0, v3}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    :cond_0
    iput-object v2, p0, Li/h1;->h:Li/i1;

    const/4 v0, 0x1

    iput-boolean v0, p0, Li/h1;->j:Z

    invoke-virtual {v1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    goto :goto_0

    :cond_1
    const-string v0, "TooltipCompatHandler"

    const-string v3, "sActiveHandler.mPopup == null"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    sget-object v0, Li/h1;->k:Li/h1;

    if-ne v0, p0, :cond_3

    invoke-static {v2}, Li/h1;->b(Li/h1;)V

    :cond_3
    iget-object v0, p0, Li/h1;->e:Li/g1;

    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final c(Z)V
    .locals 20

    move-object/from16 v0, p0

    iget-object v1, v0, Li/h1;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Li/h1;->b(Li/h1;)V

    sget-object v2, Li/h1;->l:Li/h1;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Li/h1;->a()V

    :cond_1
    sput-object v0, Li/h1;->l:Li/h1;

    move/from16 v2, p1

    iput-boolean v2, v0, Li/h1;->i:Z

    new-instance v2, Li/i1;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Li/i1;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Li/h1;->h:Li/i1;

    iget v3, v0, Li/h1;->f:I

    iget v4, v0, Li/h1;->g:I

    iget-boolean v5, v0, Li/h1;->i:Z

    iget-object v6, v2, Li/i1;->b:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    const-string v8, "window"

    iget-object v9, v2, Li/i1;->a:Landroid/content/Context;

    if-eqz v7, :cond_2

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    if-eqz v7, :cond_2

    invoke-virtual {v9, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/WindowManager;

    invoke-interface {v7, v6}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    :cond_2
    iget-object v7, v2, Li/i1;->c:Landroid/widget/TextView;

    iget-object v10, v0, Li/h1;->b:Ljava/lang/CharSequence;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v7, v2, Li/i1;->d:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v1}, Landroid/view/View;->getApplicationWindowToken()Landroid/os/IBinder;

    move-result-object v10

    iput-object v10, v7, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f060079

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v10

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v11

    const/4 v12, 0x2

    if-lt v11, v10, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/2addr v3, v12

    :goto_0
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v11

    if-lt v11, v10, :cond_4

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f060078

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v10

    add-int v11, v4, v10

    sub-int/2addr v4, v10

    goto :goto_1

    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v11

    const/4 v4, 0x0

    :goto_1
    const/16 v10, 0x31

    iput v10, v7, Landroid/view/WindowManager$LayoutParams;->gravity:I

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    if-eqz v5, :cond_5

    const v14, 0x7f06007c

    goto :goto_2

    :cond_5
    const v14, 0x7f06007b

    :goto_2
    invoke-virtual {v10, v14}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v10

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    instance-of v13, v15, Landroid/view/WindowManager$LayoutParams;

    if-eqz v13, :cond_6

    check-cast v15, Landroid/view/WindowManager$LayoutParams;

    iget v13, v15, Landroid/view/WindowManager$LayoutParams;->type:I

    if-ne v13, v12, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    :goto_3
    instance-of v15, v13, Landroid/content/ContextWrapper;

    if-eqz v15, :cond_8

    instance-of v15, v13, Landroid/app/Activity;

    if-eqz v15, :cond_7

    check-cast v13, Landroid/app/Activity;

    invoke-virtual {v13}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v14

    goto :goto_4

    :cond_7
    check-cast v13, Landroid/content/ContextWrapper;

    invoke-virtual {v13}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v13

    goto :goto_3

    :cond_8
    :goto_4
    if-nez v14, :cond_9

    const-string v2, "TooltipPopup"

    const-string v3, "Cannot find app view"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v17, 0x1

    goto/16 :goto_7

    :cond_9
    iget-object v15, v2, Li/i1;->e:Landroid/graphics/Rect;

    invoke-virtual {v14, v15}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    move/from16 v16, v12

    iget v12, v15, Landroid/graphics/Rect;->left:I

    if-gez v12, :cond_b

    iget v12, v15, Landroid/graphics/Rect;->top:I

    if-gez v12, :cond_b

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const/16 v17, 0x1

    const-string v13, "dimen"

    move/from16 v18, v3

    const-string v3, "android"

    move/from16 v19, v4

    const-string v4, "status_bar_height"

    invoke-virtual {v12, v4, v13, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_a

    invoke-virtual {v12, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    goto :goto_5

    :cond_a
    const/4 v3, 0x0

    :goto_5
    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v12, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v4, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    const/4 v13, 0x0

    invoke-virtual {v15, v13, v3, v12, v4}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_6

    :cond_b
    move/from16 v18, v3

    move/from16 v19, v4

    const/4 v13, 0x0

    const/16 v17, 0x1

    :goto_6
    iget-object v3, v2, Li/i1;->g:[I

    invoke-virtual {v14, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v2, v2, Li/i1;->f:[I

    invoke-virtual {v1, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v4, v2, v13

    aget v12, v3, v13

    sub-int/2addr v4, v12

    aput v4, v2, v13

    aget v12, v2, v17

    aget v3, v3, v17

    sub-int/2addr v12, v3

    aput v12, v2, v17

    add-int v4, v4, v18

    invoke-virtual {v14}, Landroid/view/View;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v4, v3

    iput v4, v7, Landroid/view/WindowManager$LayoutParams;->x:I

    invoke-static {v13, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {v6, v3, v3}, Landroid/view/View;->measure(II)V

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    aget v2, v2, v17

    add-int v4, v2, v19

    sub-int/2addr v4, v10

    sub-int/2addr v4, v3

    add-int/2addr v2, v11

    add-int/2addr v2, v10

    if-eqz v5, :cond_d

    if-ltz v4, :cond_c

    iput v4, v7, Landroid/view/WindowManager$LayoutParams;->y:I

    goto :goto_7

    :cond_c
    iput v2, v7, Landroid/view/WindowManager$LayoutParams;->y:I

    goto :goto_7

    :cond_d
    add-int/2addr v3, v2

    invoke-virtual {v15}, Landroid/graphics/Rect;->height()I

    move-result v5

    if-gt v3, v5, :cond_e

    iput v2, v7, Landroid/view/WindowManager$LayoutParams;->y:I

    goto :goto_7

    :cond_e
    iput v4, v7, Landroid/view/WindowManager$LayoutParams;->y:I

    :goto_7
    invoke-virtual {v9, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    invoke-interface {v2, v6, v7}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-boolean v2, v0, Li/h1;->i:Z

    if-eqz v2, :cond_f

    const-wide/16 v2, 0x9c4

    goto :goto_9

    :cond_f
    sget-object v2, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Landroid/view/View;->getWindowSystemUiVisibility()I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    move/from16 v3, v17

    if-ne v2, v3, :cond_10

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0xbb8

    :goto_8
    sub-long v2, v4, v2

    goto :goto_9

    :cond_10
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0x3a98

    goto :goto_8

    :goto_9
    iget-object v4, v0, Li/h1;->e:Li/g1;

    invoke-virtual {v1, v4}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-virtual {v1, v4, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object p1, p0, Li/h1;->h:Li/i1;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Li/h1;->i:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Li/h1;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "accessibility"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x7

    if-eq v1, v2, :cond_3

    const/16 p1, 0xa

    if-eq v1, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    iput-boolean p1, p0, Li/h1;->j:Z

    invoke-virtual {p0}, Li/h1;->a()V

    return v0

    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Li/h1;->h:Li/i1;

    if-nez p1, :cond_5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    float-to-int p2, p2

    iget-boolean v1, p0, Li/h1;->j:Z

    if-nez v1, :cond_4

    iget v1, p0, Li/h1;->f:I

    sub-int v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Li/h1;->c:I

    if-gt v1, v2, :cond_4

    iget v1, p0, Li/h1;->g:I

    sub-int v1, p2, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-le v1, v2, :cond_5

    :cond_4
    iput p1, p0, Li/h1;->f:I

    iput p2, p0, Li/h1;->g:I

    iput-boolean v0, p0, Li/h1;->j:Z

    invoke-static {p0}, Li/h1;->b(Li/h1;)V

    :cond_5
    :goto_0
    return v0
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Li/h1;->f:I

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Li/h1;->g:I

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Li/h1;->c(Z)V

    return p1
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Li/h1;->a()V

    return-void
.end method
