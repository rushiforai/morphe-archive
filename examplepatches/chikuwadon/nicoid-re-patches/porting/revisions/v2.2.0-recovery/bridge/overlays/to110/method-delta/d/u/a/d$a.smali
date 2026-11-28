.class public Ld/u/a/d$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/u/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/RectF;

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Paint;

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:[I

.field public j:I

.field public k:F

.field public l:F

.field public m:F

.field public n:Z

.field public o:Landroid/graphics/Path;

.field public p:F

.field public q:F

.field public r:I

.field public s:I

.field public t:I

.field public u:I


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Ld/u/a/d$a;->a:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Ld/u/a/d$a;->c:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Ld/u/a/d$a;->d:Landroid/graphics/Paint;

    const/4 v0, 0x0

    iput v0, p0, Ld/u/a/d$a;->e:F

    iput v0, p0, Ld/u/a/d$a;->f:F

    iput v0, p0, Ld/u/a/d$a;->g:F

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Ld/u/a/d$a;->h:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Ld/u/a/d$a;->p:F

    const/16 v0, 0xff

    iput v0, p0, Ld/u/a/d$a;->t:I

    iget-object v0, p0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Ld/u/a/d$a;->c:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Ld/u/a/d$a;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Ld/u/a/d$a;->d:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 3

    iput p1, p0, Ld/u/a/d$a;->j:I

    iget-object p1, p0, Ld/u/a/d$a;->i:[I

    iget v0, p0, Ld/u/a/d$a;->j:I

    aget p1, p1, v0

    iput p1, p0, Ld/u/a/d$a;->u:I

    return-void
.end method

.method public a(Z)V
    .registers 3

    iget-boolean v0, p0, Ld/u/a/d$a;->n:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Ld/u/a/d$a;->n:Z

    :cond_0
    return-void
.end method

.method public a([I)V
    .registers 2

    iput-object p1, p0, Ld/u/a/d$a;->i:[I

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ld/u/a/d$a;->a(I)V

    return-void
.end method

.method draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 13
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "bounds"    # Landroid/graphics/Rect;

    .line 693
    iget-object v1, p0, Ld/u/a/d$a;->a:Landroid/graphics/RectF;

    .line 694
    .local v1, "arcBounds":Landroid/graphics/RectF;
    iget v0, p0, Ld/u/a/d$a;->q:F

    iget v2, p0, Ld/u/a/d$a;->h:F

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    add-float/2addr v0, v2

    .line 695
    .local v0, "arcRadius":F
    iget v2, p0, Ld/u/a/d$a;->q:F

    const/4 v4, 0x0

    cmpg-float v2, v2, v4

    if-gtz v2, :cond_0

    .line 697
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v3

    iget v4, p0, Ld/u/a/d$a;->r:I

    int-to-float v4, v4

    iget v5, p0, Ld/u/a/d$a;->p:F

    mul-float/2addr v4, v5

    div-float/2addr v4, v3

    iget v5, p0, Ld/u/a/d$a;->h:F

    div-float/2addr v5, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    sub-float v0, v2, v4

    move v6, v0

    goto :goto_0

    .line 695
    :cond_0
    move v6, v0

    .line 700
    .end local v0    # "arcRadius":F
    .local v6, "arcRadius":F
    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v0, v6

    .line 701
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v6

    .line 702
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, v6

    .line 703
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerY()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v6

    .line 700
    invoke-virtual {v1, v0, v2, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 705
    iget v0, p0, Ld/u/a/d$a;->e:F

    iget v2, p0, Ld/u/a/d$a;->g:F

    add-float/2addr v0, v2

    const/high16 v2, 0x43b40000    # 360.0f

    mul-float/2addr v0, v2

    .line 706
    .local v0, "startAngle":F
    iget v4, p0, Ld/u/a/d$a;->f:F

    iget v5, p0, Ld/u/a/d$a;->g:F

    add-float/2addr v4, v5

    mul-float v7, v4, v2

    .line 707
    .local v7, "endAngle":F
    move v2, v3

    sub-float v3, v7, v0

    .line 709
    .local v3, "sweepAngle":F
    iget-object v4, p0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    iget v5, p0, Ld/u/a/d$a;->u:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 710
    iget-object v4, p0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    iget v5, p0, Ld/u/a/d$a;->t:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 713
    iget v4, p0, Ld/u/a/d$a;->h:F

    div-float v8, v4, v2

    .line 714
    .local v8, "inset":F
    invoke-virtual {v1, v8, v8}, Landroid/graphics/RectF;->inset(FF)V

    .line 715
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v9

    div-float/2addr v9, v2

    iget-object v2, p0, Ld/u/a/d$a;->d:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5, v9, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 717
    neg-float v2, v8

    neg-float v4, v8

    invoke-virtual {v1, v2, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 719
    const/4 v4, 0x0

    iget-object v5, p0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    move v2, v0

    move-object v0, p1

    .end local p1    # "c":Landroid/graphics/Canvas;
    .local v0, "c":Landroid/graphics/Canvas;
    .local v2, "startAngle":F
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 721
    invoke-virtual {p0, v0, v2, v3, v1}, Ld/u/a/d$a;->drawTriangle(Landroid/graphics/Canvas;FFLandroid/graphics/RectF;)V

    .line 722
    return-void
.end method

.method drawTriangle(Landroid/graphics/Canvas;FFLandroid/graphics/RectF;)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "startAngle"    # F
    .param p3, "sweepAngle"    # F
    .param p4, "bounds"    # Landroid/graphics/RectF;

    .line 725
    iget-boolean v0, p0, Ld/u/a/d$a;->n:Z

    if-eqz v0, :cond_1

    .line 726
    iget-object v0, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    if-nez v0, :cond_0

    .line 727
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    .line 728
    iget-object v0, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    goto :goto_0

    .line 730
    :cond_0
    iget-object v0, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 732
    :goto_0
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 733
    .local v0, "centerRadius":F
    iget v2, p0, Ld/u/a/d$a;->r:I

    int-to-float v2, v2

    iget v3, p0, Ld/u/a/d$a;->p:F

    mul-float/2addr v2, v3

    div-float/2addr v2, v1

    .line 738
    .local v2, "inset":F
    iget-object v3, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 739
    iget-object v3, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    iget v5, p0, Ld/u/a/d$a;->r:I

    int-to-float v5, v5

    iget v6, p0, Ld/u/a/d$a;->p:F

    mul-float/2addr v5, v6

    invoke-virtual {v3, v5, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 740
    iget-object v3, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    iget v4, p0, Ld/u/a/d$a;->r:I

    int-to-float v4, v4

    iget v5, p0, Ld/u/a/d$a;->p:F

    mul-float/2addr v4, v5

    div-float/2addr v4, v1

    iget v5, p0, Ld/u/a/d$a;->s:I

    int-to-float v5, v5

    iget v6, p0, Ld/u/a/d$a;->p:F

    mul-float/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 742
    iget-object v3, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    invoke-virtual {p4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    add-float/2addr v4, v0

    sub-float/2addr v4, v2

    .line 743
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    iget v6, p0, Ld/u/a/d$a;->h:F

    div-float/2addr v6, v1

    add-float/2addr v5, v6

    .line 742
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->offset(FF)V

    .line 744
    iget-object v1, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 746
    iget-object v1, p0, Ld/u/a/d$a;->c:Landroid/graphics/Paint;

    iget v3, p0, Ld/u/a/d$a;->u:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 747
    iget-object v1, p0, Ld/u/a/d$a;->c:Landroid/graphics/Paint;

    iget v3, p0, Ld/u/a/d$a;->t:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 748
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 749
    add-float v1, p2, p3

    invoke-virtual {p4}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    .line 750
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    .line 749
    invoke-virtual {p1, v1, v3, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 751
    iget-object v1, p0, Ld/u/a/d$a;->o:Landroid/graphics/Path;

    iget-object v3, p0, Ld/u/a/d$a;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 752
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 754
    .end local v0    # "centerRadius":F
    .end local v2    # "inset":F
    :cond_1
    return-void
.end method

.method setArrowScale(F)V
    .registers 3
    .param p1, "scale"    # F

    .line 915
    iget v0, p0, Ld/u/a/d$a;->p:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 916
    iput p1, p0, Ld/u/a/d$a;->p:F

    .line 918
    :cond_0
    return-void
.end method

.method setEndTrim(F)V
    .registers 2
    .param p1, "endTrim"    # F

    .line 872
    iput p1, p0, Ld/u/a/d$a;->f:F

    .line 873
    return-void
.end method

.method setRotation(F)V
    .registers 2
    .param p1, "rotation"    # F

    .line 880
    iput p1, p0, Ld/u/a/d$a;->g:F

    .line 881
    return-void
.end method

.method setShowArrow(Z)V
    .registers 3
    .param p1, "show"    # Z

    .line 902
    iget-boolean v0, p0, Ld/u/a/d$a;->n:Z

    if-eq v0, p1, :cond_0

    .line 903
    iput-boolean p1, p0, Ld/u/a/d$a;->n:Z

    .line 905
    :cond_0
    return-void
.end method

.method setStartTrim(F)V
    .registers 2
    .param p1, "startTrim"    # F

    .line 852
    iput p1, p0, Ld/u/a/d$a;->e:F

    .line 853
    return-void
.end method
