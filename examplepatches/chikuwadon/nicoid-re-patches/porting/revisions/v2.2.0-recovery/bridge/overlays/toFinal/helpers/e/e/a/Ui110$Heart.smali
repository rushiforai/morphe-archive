.class final Le/e/a/Ui110$Heart;
.super Landroid/graphics/drawable/Drawable;
.source "Ui110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Ui110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Heart"
.end annotation


# instance fields
.field private backing:Landroid/graphics/drawable/GradientDrawable;

.field final c:Landroid/content/Context;

.field final filled:Z

.field private inset:I

.field final p:Landroid/graphics/Paint;

.field final path:Landroid/graphics/Path;


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .registers 5

    .line 15
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/Ui110$Heart;->p:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/Ui110$Heart;->path:Landroid/graphics/Path;

    iput-object p1, p0, Le/e/a/Ui110$Heart;->c:Landroid/content/Context;

    iput-boolean p2, p0, Le/e/a/Ui110$Heart;->filled:Z

    return-void
.end method

.method constructor <init>(Landroid/content/Context;ZZ)V
    .registers 6

    invoke-direct {p0, p1, p2}, Le/e/a/Ui110$Heart;-><init>(Landroid/content/Context;Z)V

    if-eqz p3, :cond_0

    invoke-static {p1}, Le/e/a/Ui110;->actionColor(Landroid/content/Context;)I

    move-result v0

    const/16 v1, 0x64

    invoke-static {p1, v0, v1}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    iput-object v0, p0, Le/e/a/Ui110$Heart;->backing:Landroid/graphics/drawable/GradientDrawable;

    const/16 v0, 0x9

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Le/e/a/Ui110$Heart;->inset:I

    :cond_0
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 21

    .line 15
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Le/e/a/Ui110$Heart;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget-object v5, v0, Le/e/a/Ui110$Heart;->backing:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v5, :cond_0

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {v5, v1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    iget v6, v0, Le/e/a/Ui110$Heart;->inset:I

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget v3, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, v6

    int-to-float v3, v3

    iget v4, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v6

    int-to-float v4, v4

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    sub-int/2addr v3, v6

    sub-int/2addr v3, v6

    if-lez v3, :cond_3

    int-to-float v3, v3

    const/high16 v4, 0x41c00000    # 24.0f

    div-float/2addr v3, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr v2, v6

    sub-int/2addr v2, v6

    if-lez v2, :cond_3

    int-to-float v2, v2

    div-float/2addr v2, v4

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v2, v0, Le/e/a/Ui110$Heart;->p:Landroid/graphics/Paint;

    iget-boolean v3, v0, Le/e/a/Ui110$Heart;->filled:Z

    if-eqz v3, :cond_1

    iget-object v3, v0, Le/e/a/Ui110$Heart;->c:Landroid/content/Context;

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    goto :goto_0

    :cond_1
    iget-object v3, v0, Le/e/a/Ui110$Heart;->c:Landroid/content/Context;

    invoke-static {v3}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v3

    :goto_0
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Le/e/a/Ui110$Heart;->p:Landroid/graphics/Paint;

    iget-boolean v3, v0, Le/e/a/Ui110$Heart;->filled:Z

    if-eqz v3, :cond_2

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_1

    :cond_2
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_1
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Le/e/a/Ui110$Heart;->p:Landroid/graphics/Paint;

    const v3, 0x3fcccccd    # 1.6f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, v0, Le/e/a/Ui110$Heart;->path:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    iget-object v2, v0, Le/e/a/Ui110$Heart;->path:Landroid/graphics/Path;

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41a80000    # 21.0f

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v5, v0, Le/e/a/Ui110$Heart;->path:Landroid/graphics/Path;

    const/high16 v10, 0x41400000    # 12.0f

    const/high16 v11, 0x40a00000    # 5.0f

    const/high16 v6, -0x3f600000    # -5.0f

    const/high16 v7, 0x41200000    # 10.0f

    const/high16 v8, 0x40a00000    # 5.0f

    const/high16 v9, -0x3fc00000    # -3.0f

    invoke-virtual/range {v5 .. v11}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v12, v0, Le/e/a/Ui110$Heart;->path:Landroid/graphics/Path;

    const/high16 v17, 0x41400000    # 12.0f

    const/high16 v18, 0x41a80000    # 21.0f

    const/high16 v13, 0x41980000    # 19.0f

    const/high16 v14, -0x3fc00000    # -3.0f

    const/high16 v15, 0x41e80000    # 29.0f

    const/high16 v16, 0x41200000    # 10.0f

    invoke-virtual/range {v12 .. v18}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v2, v0, Le/e/a/Ui110$Heart;->path:Landroid/graphics/Path;

    iget-object v3, v0, Le/e/a/Ui110$Heart;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 3

    .line 15
    iget-object v0, p0, Le/e/a/Ui110$Heart;->c:Landroid/content/Context;

    const/16 v1, 0x16

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iget v1, p0, Le/e/a/Ui110$Heart;->inset:I

    add-int/2addr v0, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 3

    .line 15
    iget-object v0, p0, Le/e/a/Ui110$Heart;->c:Landroid/content/Context;

    const/16 v1, 0x16

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iget v1, p0, Le/e/a/Ui110$Heart;->inset:I

    add-int/2addr v0, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 15
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 15
    iget-object v0, p0, Le/e/a/Ui110$Heart;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Le/e/a/Ui110$Heart;->backing:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 15
    iget-object v0, p0, Le/e/a/Ui110$Heart;->p:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    iget-object v0, p0, Le/e/a/Ui110$Heart;->backing:Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    :cond_0
    return-void
.end method
