.class public final Lbn8;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Lxbf;

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Rect;

.field public final d:I

.field public final e:I

.field public f:Z

.field public g:I

.field public h:I

.field public i:I

.field public final j:I

.field public final synthetic k:Lcom/opera/android/bar/ExtraSideActionsAppbar;


# direct methods
.method public constructor <init>(Lcom/opera/android/bar/ExtraSideActionsAppbar;Landroid/content/res/Resources;)V
    .registers 5

    iput-object p1, p0, Lbn8;->k:Lcom/opera/android/bar/ExtraSideActionsAppbar;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance p1, Lxbf;

    const/16 v0, 0xc

    invoke-direct {p1, v0}, Lxbf;-><init>(B)V

    iput-object p1, p0, Lbn8;->a:Lxbf;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lbn8;->b:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lbn8;->c:Landroid/graphics/Rect;

    const p1, 0x7f070a00

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lbn8;->d:I

    sget-object p1, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lbn8;->e:I

    const p1, 0x7f070817

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lbn8;->j:I

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 24

    move-object/from16 v0, p0

    iget-object v1, v0, Lbn8;->k:Lcom/opera/android/bar/ExtraSideActionsAppbar;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v7

    iget v8, v0, Lbn8;->i:I

    iget v9, v0, Lbn8;->g:I

    iget-boolean v2, v0, Lbn8;->f:Z

    if-eqz v2, :cond_18

    iget v2, v0, Lbn8;->e:I

    :goto_16
    move v12, v2

    goto :goto_1b

    :cond_18
    iget v2, v0, Lbn8;->d:I

    goto :goto_16

    :goto_1b
    const/4 v13, 0x1

    iget-object v2, v0, Lbn8;->a:Lxbf;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v13}, Lxbf;->y(Landroid/graphics/Canvas;IIIIIIIIIZ)V

    iget-object v2, v1, Lcom/opera/android/bar/ExtraSideActionsAppbar;->e:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    iget-object v3, v1, Lcom/opera/android/bar/ExtraSideActionsAppbar;->e:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    iget v4, v0, Lbn8;->j:I

    add-int/2addr v3, v4

    iget-object v5, v1, Lcom/opera/android/bar/ExtraSideActionsAppbar;->e:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v5

    iget-object v1, v1, Lcom/opera/android/bar/ExtraSideActionsAppbar;->e:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v1

    sub-int/2addr v1, v4

    iget-object v4, v0, Lbn8;->c:Landroid/graphics/Rect;

    invoke-virtual {v4, v2, v3, v5, v1}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    iget-object v3, v0, Lbn8;->b:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v0, v0, Lbn8;->h:I

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, v4, Landroid/graphics/Rect;->left:I

    int-to-float v15, v0

    iget v0, v4, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    iget v2, v4, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    int-to-float v1, v1

    move/from16 v20, v1

    move-object/from16 v14, p1

    move/from16 v16, v0

    move/from16 v19, v1

    move/from16 v17, v2

    move-object/from16 v21, v3

    move/from16 v18, v4

    invoke-virtual/range {v14 .. v21}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 2

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method
