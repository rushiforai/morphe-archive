.class public final Le/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/p;
.implements Li/k0;
.implements Lh/y;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le/B;


# direct methods
.method public synthetic constructor <init>(Le/B;I)V
    .locals 0

    iput p2, p0, Le/q;->a:I

    iput-object p1, p0, Le/q;->b:Le/B;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Ly/f0;)Ly/f0;
    .locals 17

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v2, Ly/f0;->a:Ly/d0;

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v0

    iget v4, v0, Lr/c;->b:I

    move-object/from16 v5, p0

    iget-object v6, v5, Le/q;->b:Le/B;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v0

    iget v7, v0, Lr/c;->b:I

    iget-object v0, v6, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    const/16 v8, 0x1d

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_11

    iget-object v0, v6, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v0, v6, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v12, 0x1

    if-eqz v0, :cond_f

    iget-object v0, v6, Le/B;->c0:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, v6, Le/B;->c0:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, v6, Le/B;->d0:Landroid/graphics/Rect;

    :cond_0
    iget-object v13, v6, Le/B;->c0:Landroid/graphics/Rect;

    iget-object v0, v6, Le/B;->d0:Landroid/graphics/Rect;

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v14

    iget v14, v14, Lr/c;->a:I

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v15

    iget v15, v15, Lr/c;->b:I

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v9

    iget v9, v9, Lr/c;->c:I

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v10

    iget v10, v10, Lr/c;->d:I

    invoke-virtual {v13, v14, v15, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v9, v6, Le/B;->A:Landroid/view/ViewGroup;

    const-class v10, Landroid/graphics/Rect;

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v14, v8, :cond_1

    sget-boolean v10, Li/m1;->a:Z

    invoke-static {v9, v13, v0}, Li/l1;->a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    goto :goto_1

    :cond_1
    sget-boolean v14, Li/m1;->a:Z

    const-string v15, "ViewUtils"

    if-nez v14, :cond_2

    sput-boolean v12, Li/m1;->a:Z

    :try_start_0
    const-class v14, Landroid/view/View;

    const-string v8, "computeFitSystemWindows"

    filled-new-array {v10, v10}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v14, v8, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    sput-object v8, Li/m1;->b:Ljava/lang/reflect/Method;

    invoke-virtual {v8}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v8

    if-nez v8, :cond_2

    sget-object v8, Li/m1;->b:Ljava/lang/reflect/Method;

    invoke-virtual {v8, v12}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v8, "Could not find method computeFitSystemWindows. Oh well."

    invoke-static {v15, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    sget-object v8, Li/m1;->b:Ljava/lang/reflect/Method;

    if-eqz v8, :cond_3

    :try_start_1
    filled-new-array {v13, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v8, v9, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v8, "Could not invoke computeFitSystemWindows"

    invoke-static {v15, v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_1
    iget v0, v13, Landroid/graphics/Rect;->top:I

    iget v8, v13, Landroid/graphics/Rect;->left:I

    iget v9, v13, Landroid/graphics/Rect;->right:I

    iget-object v10, v6, Le/B;->A:Landroid/view/ViewGroup;

    sget-object v13, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {v10}, Ly/B;->a(Landroid/view/View;)Ly/f0;

    move-result-object v10

    if-nez v10, :cond_4

    const/4 v13, 0x0

    goto :goto_2

    :cond_4
    iget-object v13, v10, Ly/f0;->a:Ly/d0;

    invoke-virtual {v13}, Ly/d0;->j()Lr/c;

    move-result-object v13

    iget v13, v13, Lr/c;->a:I

    :goto_2
    if-nez v10, :cond_5

    const/4 v10, 0x0

    goto :goto_3

    :cond_5
    iget-object v10, v10, Ly/f0;->a:Ly/d0;

    invoke-virtual {v10}, Ly/d0;->j()Lr/c;

    move-result-object v10

    iget v10, v10, Lr/c;->c:I

    :goto_3
    iget v14, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v14, v0, :cond_7

    iget v14, v11, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v14, v8, :cond_7

    iget v14, v11, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eq v14, v9, :cond_6

    goto :goto_4

    :cond_6
    const/4 v8, 0x0

    goto :goto_5

    :cond_7
    :goto_4
    iput v0, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v8, v11, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v9, v11, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    move v8, v12

    :goto_5
    iget-object v9, v6, Le/B;->k:Landroid/content/Context;

    if-lez v0, :cond_8

    iget-object v0, v6, Le/B;->C:Landroid/view/View;

    if-nez v0, :cond_8

    new-instance v0, Landroid/view/View;

    invoke-direct {v0, v9}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, v6, Le/B;->C:Landroid/view/View;

    const/16 v14, 0x8

    invoke-virtual {v0, v14}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v15, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    const/16 v12, 0x33

    const/4 v14, -0x1

    invoke-direct {v0, v14, v15, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iput v13, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v10, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iget-object v10, v6, Le/B;->A:Landroid/view/ViewGroup;

    iget-object v12, v6, Le/B;->C:Landroid/view/View;

    invoke-virtual {v10, v12, v14, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_6

    :cond_8
    iget-object v0, v6, Le/B;->C:Landroid/view/View;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v12, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iget v14, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v12, v14, :cond_9

    iget v12, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v12, v13, :cond_9

    iget v12, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eq v12, v10, :cond_a

    :cond_9
    iput v14, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iput v13, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v10, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget-object v10, v6, Le/B;->C:Landroid/view/View;

    invoke-virtual {v10, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_a
    :goto_6
    iget-object v0, v6, Le/B;->C:Landroid/view/View;

    if-eqz v0, :cond_b

    const/4 v12, 0x1

    goto :goto_7

    :cond_b
    const/4 v12, 0x0

    :goto_7
    if-eqz v12, :cond_d

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, v6, Le/B;->C:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWindowSystemUiVisibility()I

    move-result v10

    and-int/lit16 v10, v10, 0x2000

    if-eqz v10, :cond_c

    const v10, 0x7f050006

    invoke-static {v9, v10}, Lp/b;->a(Landroid/content/Context;I)I

    move-result v9

    goto :goto_8

    :cond_c
    const v10, 0x7f050005

    invoke-static {v9, v10}, Lp/b;->a(Landroid/content/Context;I)I

    move-result v9

    :goto_8
    invoke-virtual {v0, v9}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_d
    iget-boolean v0, v6, Le/B;->H:Z

    if-nez v0, :cond_e

    if-eqz v12, :cond_e

    const/4 v7, 0x0

    :cond_e
    move/from16 v16, v8

    move v0, v12

    const/4 v12, 0x0

    goto :goto_9

    :cond_f
    iget v0, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    const/4 v12, 0x0

    if-eqz v0, :cond_10

    iput v12, v11, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    move v0, v12

    const/16 v16, 0x1

    goto :goto_9

    :cond_10
    move v0, v12

    move/from16 v16, v0

    :goto_9
    if-eqz v16, :cond_12

    iget-object v8, v6, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v8, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_a

    :cond_11
    const/4 v12, 0x0

    move v0, v12

    :cond_12
    :goto_a
    iget-object v6, v6, Le/B;->C:Landroid/view/View;

    if-eqz v6, :cond_14

    if-eqz v0, :cond_13

    move v9, v12

    goto :goto_b

    :cond_13
    const/16 v9, 0x8

    :goto_b
    invoke-virtual {v6, v9}, Landroid/view/View;->setVisibility(I)V

    :cond_14
    if-eq v4, v7, :cond_17

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v0

    iget v0, v0, Lr/c;->a:I

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v4

    iget v4, v4, Lr/c;->c:I

    invoke-virtual {v3}, Ly/d0;->j()Lr/c;

    move-result-object v3

    iget v3, v3, Lr/c;->d:I

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1e

    if-lt v6, v8, :cond_15

    new-instance v6, Ly/W;

    invoke-direct {v6, v2}, Ly/W;-><init>(Ly/f0;)V

    goto :goto_c

    :cond_15
    const/16 v8, 0x1d

    if-lt v6, v8, :cond_16

    new-instance v6, Ly/V;

    invoke-direct {v6, v2}, Ly/V;-><init>(Ly/f0;)V

    goto :goto_c

    :cond_16
    new-instance v6, Ly/U;

    invoke-direct {v6, v2}, Ly/U;-><init>(Ly/f0;)V

    :goto_c
    invoke-static {v0, v7, v4, v3}, Lr/c;->a(IIII)Lr/c;

    move-result-object v0

    invoke-virtual {v6, v0}, Ly/X;->d(Lr/c;)V

    invoke-virtual {v6}, Ly/X;->b()Ly/f0;

    move-result-object v0

    goto :goto_d

    :cond_17
    move-object v0, v2

    :goto_d
    sget-object v2, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ly/f0;->b()Landroid/view/WindowInsets;

    move-result-object v2

    if-eqz v2, :cond_18

    invoke-static {v1, v2}, Ly/y;->b(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/WindowInsets;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_18

    invoke-static {v3, v1}, Ly/f0;->c(Landroid/view/WindowInsets;Landroid/view/View;)Ly/f0;

    move-result-object v0

    :cond_18
    return-object v0
.end method

.method public b(Lh/n;Z)V
    .locals 9

    iget v0, p0, Le/q;->a:I

    packed-switch v0, :pswitch_data_0

    invoke-virtual {p1}, Lh/n;->k()Lh/n;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, p1, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    if-eqz v3, :cond_1

    move-object p1, v0

    :cond_1
    iget-object v4, p0, Le/q;->b:Le/B;

    iget-object v5, v4, Le/B;->L:[Le/A;

    if-eqz v5, :cond_2

    array-length v6, v5

    goto :goto_1

    :cond_2
    move v6, v1

    :goto_1
    if-ge v1, v6, :cond_4

    aget-object v7, v5, v1

    if-eqz v7, :cond_3

    iget-object v8, v7, Le/A;->h:Lh/n;

    if-ne v8, p1, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    const/4 v7, 0x0

    :goto_2
    if-eqz v7, :cond_6

    if-eqz v3, :cond_5

    iget p1, v7, Le/A;->a:I

    invoke-virtual {v4, p1, v7, v0}, Le/B;->p(ILe/A;Lh/n;)V

    invoke-virtual {v4, v7, v2}, Le/B;->r(Le/A;Z)V

    goto :goto_3

    :cond_5
    invoke-virtual {v4, v7, p2}, Le/B;->r(Le/A;Z)V

    :cond_6
    :goto_3
    return-void

    :pswitch_0
    iget-object p2, p0, Le/q;->b:Le/B;

    invoke-virtual {p2, p1}, Le/B;->q(Lh/n;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public m(Lh/n;)Z
    .locals 2

    iget v0, p0, Le/q;->a:I

    packed-switch v0, :pswitch_data_0

    invoke-virtual {p1}, Lh/n;->k()Lh/n;

    move-result-object v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Le/q;->b:Le/B;

    iget-boolean v1, v0, Le/B;->F:Z

    if-eqz v1, :cond_0

    iget-object v1, v0, Le/B;->l:Landroid/view/Window;

    invoke-virtual {v1}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-boolean v0, v0, Le/B;->Q:Z

    if-nez v0, :cond_0

    const/16 v0, 0x6c

    invoke-interface {v1, v0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    :cond_0
    const/4 p1, 0x1

    return p1

    :pswitch_0
    iget-object v0, p0, Le/q;->b:Le/B;

    iget-object v0, v0, Le/B;->l:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x6c

    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    :cond_1
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method
