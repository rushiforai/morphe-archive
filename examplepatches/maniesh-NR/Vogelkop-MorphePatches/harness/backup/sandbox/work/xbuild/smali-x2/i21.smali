.class public final Li21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public b:Lf1p;

.field public final c:Lj39;

.field public final d:Landroid/os/Handler;

.field public final e:Landroid/view/View;

.field public final f:Lh21;

.field public final g:La36;

.field public final h:Leq1;

.field public final i:Lq8n;

.field public final j:Ljava/util/function/Supplier;

.field public final k:Lig;

.field public final l:Lh7f;

.field public final m:Lf21;

.field public n:Landroid/view/View;

.field public o:I

.field public final p:I

.field public final q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public final u:Z

.field public v:Z

.field public w:I

.field public final x:Z

.field public final y:Z

.field public z:Lv1o;


# direct methods
.method public constructor <init>(Le21;)V
    .registers 16

    iget-object v0, p1, Le21;->a:Landroid/content/Context;

    iget-object v1, p1, Le21;->b:Landroid/view/View;

    iget-object v2, p1, Le21;->e:Landroid/graphics/drawable/Drawable;

    iget-object v3, p1, Le21;->c:Ljava/util/function/Supplier;

    iget-object v4, p1, Le21;->d:Lq8n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Li21;->a:Landroid/graphics/Rect;

    new-instance v5, Lig;

    const/4 v6, 0x2

    invoke-direct {v5, p0, v6}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v5, p0, Li21;->k:Lig;

    new-instance v5, Lc21;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lc21;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Lh7f;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v7, p0, Li21;->l:Lh7f;

    iput-boolean v6, p0, Li21;->q:Z

    new-instance v8, Lj39;

    const v9, 0x7f1506a6

    invoke-direct {v8, v0, v9}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v8, p0, Li21;->c:Lj39;

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Li21;->e:Landroid/view/View;

    iput-object v3, p0, Li21;->j:Ljava/util/function/Supplier;

    new-instance v1, Lh21;

    invoke-direct {v1, v0}, Lh21;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Li21;->f:Lh21;

    new-instance v0, La36;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li21;->g:La36;

    sget-object v0, Lurj;->c:Lurj;

    if-nez v0, :cond_57

    new-instance v0, Lurj;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lurj;-><init>(B)V

    sput-object v0, Lurj;->c:Lurj;

    :cond_57
    new-instance v0, Leq1;

    invoke-direct {v0, v8}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Li21;->h:Leq1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Li21;->d:Landroid/os/Handler;

    iput-object v4, p0, Li21;->i:Lq8n;

    new-instance v1, Lf1p;

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    new-instance v8, Lg21;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v8 .. v13}, Lg21;-><init>(IZZZZ)V

    invoke-direct {v1, v3, v8, v6}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v1, p0, Li21;->b:Lf1p;

    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p0}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    iget-object v1, p1, Le21;->f:Landroid/widget/PopupWindow$OnDismissListener;

    if-eqz v1, :cond_94

    invoke-virtual {v7, v1}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_94
    iget-object v1, p1, Le21;->g:Lf21;

    iput-object v1, p0, Li21;->m:Lf21;

    iget-boolean v1, p1, Le21;->h:Z

    iput-boolean v1, p0, Li21;->q:Z

    invoke-virtual {v0, v6}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iput-boolean v6, p0, Li21;->y:Z

    iput-boolean v6, p0, Li21;->s:Z

    iput-boolean v6, p0, Li21;->t:Z

    iget-boolean v1, p1, Le21;->i:Z

    iput-boolean v1, p0, Li21;->u:Z

    iput-boolean v6, p0, Li21;->x:Z

    invoke-virtual {v0, v6}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result p0

    if-eqz p0, :cond_b7

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->update()V

    :cond_b7
    iget p0, p1, Le21;->j:F

    invoke-virtual {v0, p0}, Landroid/widget/PopupWindow;->setElevation(F)V

    invoke-virtual {v0, v6}, Landroid/widget/PopupWindow;->setTouchModal(Z)V

    iget-boolean p0, p1, Le21;->l:Z

    if-eqz p0, :cond_c8

    iget-boolean p0, p1, Le21;->k:Z

    invoke-virtual {v0, p0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    :cond_c8
    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Li21;->z:Lv1o;

    if-eqz v0, :cond_c

    iget-object v1, v0, Lv1o;->a:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Li21;->z:Lv1o;

    :cond_c
    iget-object p0, p0, Li21;->h:Leq1;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method

.method public final b()I
    .registers 5

    iget-object p0, p0, Li21;->c:Lj39;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const v1, 0x7f0406fc

    invoke-static {v1, p0}, Lna2;->u(ILandroid/content/Context;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_21

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f0705ed

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    :cond_21
    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int p0, v2

    shl-int/lit8 p0, p0, 0x1

    add-int/2addr v1, p0

    return v1
.end method

.method public final c()Z
    .registers 3

    invoke-virtual {p0}, Li21;->b()I

    move-result v0

    iget-object v1, p0, Li21;->b:Lf1p;

    iget-object v1, v1, Lf1p;->b:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-lt v1, v0, :cond_1e

    iget-object p0, p0, Li21;->b:Lf1p;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    if-lt p0, v0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Li21;->h:Leq1;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_32

    iget-boolean v0, p0, Li21;->y:Z

    if-eqz v0, :cond_1c

    new-instance v0, Lv1o;

    new-instance v1, Lc4;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lc4;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p0, Li21;->e:Landroid/view/View;

    invoke-direct {v0, v2, v1}, Lv1o;-><init>(Landroid/view/View;Lc4;)V

    iput-object v0, p0, Li21;->z:Lv1o;

    :cond_1c
    iget-object v0, p0, Li21;->i:Lq8n;

    invoke-virtual {v0, p0}, Lq8n;->n0(Li21;)V

    iget-object v0, p0, Li21;->f:Lh21;

    invoke-virtual {v0, p0}, Lk8;->n0(Li21;)V

    invoke-virtual {p0}, Li21;->f()V

    invoke-virtual {p0}, Li21;->c()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Li21;->e()V

    :cond_32
    return-void
.end method

.method public final e()V
    .registers 6

    iget-boolean v0, p0, Li21;->x:Z

    iget-object v1, p0, Li21;->h:Leq1;

    if-eqz v0, :cond_2c

    iget v0, p0, Li21;->w:I

    if-nez v0, :cond_2c

    iget-object v0, p0, Li21;->b:Lf1p;

    iget-object v0, v0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Lg21;

    iget-boolean v2, v0, Lg21;->b:Z

    iget-boolean v0, v0, Lg21;->a:Z

    if-eqz v0, :cond_20

    if-eqz v2, :cond_1c

    const v0, 0x7f150027

    goto :goto_29

    :cond_1c
    const v0, 0x7f150026

    goto :goto_29

    :cond_20
    if-eqz v2, :cond_26

    const v0, 0x7f150029

    goto :goto_29

    :cond_26
    const v0, 0x7f150028

    :goto_29
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    :cond_2c
    iget-object v0, p0, Li21;->n:Landroid/view/View;

    if-nez v0, :cond_3a

    iget-object v0, p0, Li21;->j:Ljava/util/function/Supplier;

    invoke-interface {v0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Li21;->n:Landroid/view/View;

    :cond_3a
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Li21;->b:Lf1p;

    iget-object v0, v0, Lf1p;->b:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Li21;->e:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, v3, Landroid/view/WindowManager$LayoutParams;

    if-eqz v4, :cond_59

    check-cast v3, Landroid/view/WindowManager$LayoutParams;

    iget v4, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    add-int/2addr v2, v4

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->y:I

    add-int/2addr v0, v3

    :cond_59
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    new-instance v0, Ld21;

    iget-object v2, p0, Li21;->c:Lj39;

    const/4 v4, 0x0

    invoke-direct {v0, p0, v2, v4}, Ld21;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    :try_start_66
    iget p0, v3, Landroid/graphics/Point;->x:I

    iget v2, v3, Landroid/graphics/Point;->y:I

    const v3, 0x800033

    invoke-virtual {v1, v0, v3, p0, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_70
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_66 .. :try_end_70} :catch_70

    :catch_70
    return-void
.end method

.method public final f()V
    .registers 28

    move-object/from16 v1, p0

    iget-object v0, v1, Li21;->e:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_297

    iget-object v2, v1, Li21;->h:Leq1;

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget-object v4, v1, Li21;->a:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget v3, v4, Landroid/graphics/Rect;->left:I

    iget v5, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v5

    iget v5, v4, Landroid/graphics/Rect;->top:I

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v4

    iget-object v4, v1, Li21;->i:Lq8n;

    iget-object v4, v4, Lk8;->a:Ljava/lang/Object;

    check-cast v4, Landroid/graphics/Rect;

    iget-object v6, v1, Li21;->b:Lf1p;

    iget-object v6, v6, Lf1p;->a:Ljava/lang/Object;

    check-cast v6, Lg21;

    iget-boolean v7, v6, Lg21;->b:Z

    iget-boolean v6, v6, Lg21;->a:Z

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v8

    if-eqz v8, :cond_3b

    iget-boolean v8, v1, Li21;->u:Z

    if-nez v8, :cond_3b

    const/4 v8, 0x1

    goto :goto_3c

    :cond_3b
    const/4 v8, 0x0

    :goto_3c
    iget-object v11, v1, Li21;->f:Lh21;

    iget-object v12, v11, Lk8;->a:Ljava/lang/Object;

    check-cast v12, Landroid/graphics/Rect;

    iget-object v11, v11, Lk8;->a:Ljava/lang/Object;

    check-cast v11, Landroid/graphics/Rect;

    iget-object v13, v1, Li21;->n:Landroid/view/View;

    if-nez v13, :cond_54

    iget-object v13, v1, Li21;->j:Ljava/util/function/Supplier;

    invoke-interface {v13}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/View;

    iput-object v13, v1, Li21;->n:Landroid/view/View;

    :cond_54
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v14

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v11

    iget v15, v1, Li21;->o:I

    iget-boolean v9, v1, Li21;->t:Z

    iget-boolean v10, v1, Li21;->s:Z

    move-object/from16 v22, v0

    iget-object v0, v1, Li21;->g:La36;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v15, :cond_6e

    if-ge v15, v14, :cond_6e

    move v14, v15

    :cond_6e
    if-le v14, v3, :cond_73

    sub-int v0, v14, v3

    goto :goto_74

    :cond_73
    const/4 v0, 0x0

    :goto_74
    iget v14, v1, Li21;->p:I

    if-eqz v14, :cond_7b

    if-ge v14, v11, :cond_7b

    move v11, v14

    :cond_7b
    if-le v11, v5, :cond_7f

    sub-int/2addr v11, v5

    goto :goto_80

    :cond_7f
    const/4 v11, 0x0

    :goto_80
    const/high16 v14, -0x80000000

    invoke-static {v0, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    const/4 v15, 0x0

    invoke-virtual {v13, v0, v15}, Landroid/view/View;->measure(II)V

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    move/from16 v23, v3

    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v15, v14}, Landroid/util/Size;-><init>(II)V

    iget-boolean v14, v1, Li21;->q:Z

    if-nez v14, :cond_d7

    if-eqz v9, :cond_a4

    iget v15, v4, Landroid/graphics/Rect;->right:I

    :goto_a1
    move-object/from16 v16, v3

    goto :goto_a7

    :cond_a4
    iget v15, v4, Landroid/graphics/Rect;->left:I

    goto :goto_a1

    :goto_a7
    iget v3, v12, Landroid/graphics/Rect;->left:I

    sub-int/2addr v15, v3

    iget v3, v12, Landroid/graphics/Rect;->right:I

    move/from16 v17, v3

    if-eqz v9, :cond_b3

    iget v3, v4, Landroid/graphics/Rect;->left:I

    goto :goto_b5

    :cond_b3
    iget v3, v4, Landroid/graphics/Rect;->right:I

    :goto_b5
    sub-int v3, v17, v3

    invoke-virtual/range {v16 .. v16}, Landroid/util/Size;->getWidth()I

    move-result v17

    move/from16 v25, v5

    add-int v5, v17, v23

    move/from16 v17, v8

    if-lt v15, v3, :cond_c5

    const/4 v8, 0x1

    goto :goto_c6

    :cond_c5
    const/4 v8, 0x0

    :goto_c6
    if-eqz v17, :cond_d5

    if-eq v8, v6, :cond_d5

    if-eqz v6, :cond_cf

    if-gt v5, v15, :cond_cf

    const/4 v8, 0x1

    :cond_cf
    if-nez v6, :cond_d5

    if-gt v5, v3, :cond_d5

    const/4 v6, 0x0

    goto :goto_e4

    :cond_d5
    move v6, v8

    goto :goto_e4

    :cond_d7
    move-object/from16 v16, v3

    move/from16 v25, v5

    move/from16 v17, v8

    const/4 v3, 0x2

    if-ne v14, v3, :cond_e4

    invoke-static {}, Lorg/chromium/ui/base/LocalizationUtils;->isLayoutRtl()Z

    move-result v6

    :cond_e4
    :goto_e4
    move/from16 v18, v6

    if-eqz v10, :cond_eb

    iget v3, v4, Landroid/graphics/Rect;->bottom:I

    goto :goto_ed

    :cond_eb
    iget v3, v4, Landroid/graphics/Rect;->top:I

    :goto_ed
    iget v5, v12, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v5

    sub-int v3, v3, v25

    iget v5, v12, Landroid/graphics/Rect;->bottom:I

    if-eqz v10, :cond_f9

    iget v6, v4, Landroid/graphics/Rect;->top:I

    goto :goto_fb

    :cond_f9
    iget v6, v4, Landroid/graphics/Rect;->bottom:I

    :goto_fb
    sub-int/2addr v5, v6

    sub-int v5, v5, v25

    invoke-virtual/range {v16 .. v16}, Landroid/util/Size;->getHeight()I

    move-result v6

    if-gt v6, v5, :cond_106

    const/4 v6, 0x1

    goto :goto_107

    :cond_106
    const/4 v6, 0x0

    :goto_107
    invoke-virtual/range {v16 .. v16}, Landroid/util/Size;->getHeight()I

    move-result v8

    if-gt v8, v3, :cond_10f

    const/4 v8, 0x1

    goto :goto_110

    :cond_10f
    const/4 v8, 0x0

    :goto_110
    if-lt v5, v3, :cond_114

    const/4 v15, 0x1

    goto :goto_115

    :cond_114
    const/4 v15, 0x0

    :goto_115
    if-eq v6, v8, :cond_118

    move v15, v6

    :cond_118
    if-eqz v17, :cond_128

    if-eq v7, v15, :cond_128

    if-eqz v7, :cond_121

    if-eqz v6, :cond_121

    const/4 v15, 0x1

    :cond_121
    if-nez v7, :cond_128

    if-eqz v8, :cond_128

    const/16 v19, 0x0

    goto :goto_12a

    :cond_128
    move/from16 v19, v15

    :goto_12a
    if-eqz v10, :cond_134

    iget v3, v12, Landroid/graphics/Rect;->bottom:I

    iget v5, v12, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v5

    sub-int v3, v3, v25

    goto :goto_137

    :cond_134
    if-eqz v19, :cond_137

    move v3, v5

    :cond_137
    :goto_137
    invoke-static {v3, v11}, Ljava/lang/Math;->min(II)I

    move-result v17

    new-instance v16, Lg21;

    move/from16 v20, v9

    move/from16 v21, v10

    invoke-direct/range {v16 .. v21}, Lg21;-><init>(IZZZZ)V

    move-object/from16 v5, v16

    move/from16 v3, v17

    const/high16 v6, -0x80000000

    invoke-static {v3, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {v13, v0, v3}, Landroid/view/View;->measure(II)V

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int v0, v0, v23

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    add-int v3, v3, v25

    move-object v6, v13

    check-cast v6, Landroid/view/ViewGroup;

    instance-of v8, v6, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_1a0

    move-object v8, v6

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v8

    if-nez v8, :cond_1a0

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_1a0

    invoke-virtual {v13}, Landroid/view/View;->getPaddingStart()I

    move-result v0

    invoke-virtual {v13}, Landroid/view/View;->getPaddingEnd()I

    move-result v8

    add-int/2addr v8, v0

    const/4 v0, 0x0

    :goto_17d
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v9

    if-ge v0, v9, :cond_19e

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    if-lez v10, :cond_19b

    add-int/2addr v8, v10

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/widget/LinearLayout$LayoutParams;

    iget v10, v9, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget v9, v9, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    add-int/2addr v10, v9

    add-int/2addr v10, v8

    move v8, v10

    :cond_19b
    add-int/lit8 v0, v0, 0x1

    goto :goto_17d

    :cond_19e
    add-int v0, v8, v23

    :cond_1a0
    new-instance v6, Landroid/util/Size;

    invoke-direct {v6, v0, v3}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v0

    const/4 v3, 0x1

    if-ne v14, v3, :cond_1b9

    iget v3, v4, Landroid/graphics/Rect;->left:I

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v8

    sub-int/2addr v8, v0

    const/16 v24, 0x2

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v3

    goto :goto_1d2

    :cond_1b9
    iget-boolean v3, v5, Lg21;->c:Z

    iget-boolean v8, v5, Lg21;->a:Z

    if-eqz v8, :cond_1c9

    if-eqz v3, :cond_1c4

    iget v3, v4, Landroid/graphics/Rect;->right:I

    goto :goto_1c6

    :cond_1c4
    iget v3, v4, Landroid/graphics/Rect;->left:I

    :goto_1c6
    sub-int v8, v3, v0

    goto :goto_1d2

    :cond_1c9
    if-eqz v3, :cond_1cf

    iget v3, v4, Landroid/graphics/Rect;->left:I

    :goto_1cd
    move v8, v3

    goto :goto_1d2

    :cond_1cf
    iget v3, v4, Landroid/graphics/Rect;->right:I

    goto :goto_1cd

    :goto_1d2
    iget v3, v12, Landroid/graphics/Rect;->right:I

    sub-int v0, v3, v0

    if-gez v0, :cond_1db

    move v3, v0

    const/4 v0, 0x0

    goto :goto_1dc

    :cond_1db
    const/4 v3, 0x0

    :goto_1dc
    if-ge v8, v3, :cond_1e0

    move v8, v3

    goto :goto_1e3

    :cond_1e0
    if-le v8, v0, :cond_1e3

    move v8, v0

    :cond_1e3
    :goto_1e3
    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v0

    iget-boolean v3, v5, Lg21;->b:Z

    iget-boolean v9, v5, Lg21;->d:Z

    if-eqz v3, :cond_1f5

    if-eqz v9, :cond_1f2

    iget v10, v4, Landroid/graphics/Rect;->top:I

    goto :goto_1fd

    :cond_1f2
    iget v10, v4, Landroid/graphics/Rect;->bottom:I

    goto :goto_1fd

    :cond_1f5
    if-eqz v9, :cond_1fa

    iget v10, v4, Landroid/graphics/Rect;->bottom:I

    goto :goto_1fc

    :cond_1fa
    iget v10, v4, Landroid/graphics/Rect;->top:I

    :goto_1fc
    sub-int/2addr v10, v0

    :goto_1fd
    if-eqz v9, :cond_212

    iget v9, v12, Landroid/graphics/Rect;->top:I

    iget v11, v12, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v11, v0

    if-gt v9, v11, :cond_20b

    move/from16 v26, v11

    move v11, v9

    move/from16 v9, v26

    :cond_20b
    if-ge v10, v11, :cond_20f

    move v10, v11

    goto :goto_212

    :cond_20f
    if-le v10, v9, :cond_212

    move v10, v9

    :cond_212
    :goto_212
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, v8, v10}, Landroid/graphics/Point;-><init>(II)V

    iget v8, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    new-instance v9, Lf1p;

    new-instance v10, Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v11

    add-int/2addr v11, v8

    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v6

    add-int/2addr v6, v0

    invoke-direct {v10, v8, v0, v11, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v15, 0x0

    invoke-direct {v9, v10, v5, v15}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iput-object v9, v1, Li21;->b:Lf1p;

    iget-object v0, v1, Li21;->m:Lf21;

    if-eqz v0, :cond_23f

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    invoke-interface {v0, v4, v3}, Lf21;->b(Landroid/graphics/Rect;Z)V

    :cond_23f
    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_24f

    invoke-virtual {v1}, Li21;->c()Z

    move-result v0

    if-nez v0, :cond_24f

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->dismiss()V

    goto :goto_269

    :cond_24f
    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_269

    if-eq v3, v7, :cond_269

    const/4 v3, 0x1

    :try_start_258
    iput-boolean v3, v1, Li21;->r:Z

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->dismiss()V

    invoke-virtual {v1}, Li21;->e()V
    :try_end_260
    .catchall {:try_start_258 .. :try_end_260} :catchall_264

    const/4 v15, 0x0

    iput-boolean v15, v1, Li21;->r:Z

    goto :goto_269

    :catchall_264
    move-exception v0

    const/4 v15, 0x0

    iput-boolean v15, v1, Li21;->r:Z

    throw v0

    :cond_269
    :goto_269
    invoke-virtual {v1}, Li21;->c()Z

    move-result v0

    if-eqz v0, :cond_297

    iget v0, v10, Landroid/graphics/Rect;->left:I

    iget v1, v10, Landroid/graphics/Rect;->top:I

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, v3, Landroid/view/WindowManager$LayoutParams;

    if-eqz v4, :cond_283

    check-cast v3, Landroid/view/WindowManager$LayoutParams;

    iget v4, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    add-int/2addr v0, v4

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->y:I

    add-int/2addr v1, v3

    :cond_283
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    iget v0, v3, Landroid/graphics/Point;->x:I

    iget v1, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-virtual {v2, v0, v1, v3, v4}, Landroid/widget/PopupWindow;->update(IIII)V

    :cond_297
    return-void
.end method

.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p0

    const/4 p1, 0x4

    if-ne p0, p1, :cond_a

    const-string p0, "InProductHelp.OutsideTouch"

    goto :goto_c

    :cond_a
    const-string p0, "InProductHelp.InsideTouch"

    :goto_c
    invoke-static {p0}, Ljoh;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
