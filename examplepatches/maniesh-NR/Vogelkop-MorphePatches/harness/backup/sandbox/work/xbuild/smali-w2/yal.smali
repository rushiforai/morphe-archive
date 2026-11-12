.class public final Lyal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/style/LineHeightSpan;
.implements Landroid/text/style/LineBackgroundSpan;


# instance fields
.field public final a:Lfr;

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lfr;ZZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyal;->a:Lfr;

    iput-boolean p2, p0, Lyal;->b:Z

    iput-boolean p3, p0, Lyal;->c:Z

    iput-boolean p4, p0, Lyal;->d:Z

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lyal;->e:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public final chooseHeight(Ljava/lang/CharSequence;IIIILandroid/graphics/Paint$FontMetricsInt;)V
    .registers 7

    iget p1, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget p2, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int p2, p1, p2

    if-gtz p2, :cond_9

    return-void

    :cond_9
    iget-object p0, p0, Lyal;->a:Lfr;

    iget p0, p0, Lfr;->b:I

    shl-int/lit8 p0, p0, 0x1

    add-int/2addr p0, p2

    int-to-float p3, p0

    int-to-float p2, p2

    div-float/2addr p3, p2

    int-to-float p1, p1

    mul-float/2addr p1, p3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    sub-int/2addr p1, p0

    iput p1, p6, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    return-void
.end method

.method public final drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIIILjava/lang/CharSequence;III)V
    .registers 20

    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    move-result v3

    const/4 v4, 0x0

    iget-boolean v5, p0, Lyal;->b:Z

    if-eqz v5, :cond_d

    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1b

    :cond_d
    iget-boolean v5, p0, Lyal;->c:Z

    if-eqz v5, :cond_18

    const v4, 0x3dcccccd    # 0.1f

    invoke-static {v4, v3}, Lp37;->a0(FI)I

    move-result v4

    :cond_18
    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setColor(I)V

    :goto_1b
    iget-object v4, p0, Lyal;->e:Landroid/graphics/Rect;

    iput p3, v4, Landroid/graphics/Rect;->left:I

    iput p5, v4, Landroid/graphics/Rect;->top:I

    iput p4, v4, Landroid/graphics/Rect;->right:I

    iput p7, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v4, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    const v5, 0x3e99999a    # 0.3f

    invoke-static {v5, v3}, Lp37;->a0(FI)I

    move-result v5

    invoke-virtual {p2, v5}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    move-result v5

    if-eqz v5, :cond_81

    invoke-virtual {p2}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v5

    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v6

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v7, p0, Lyal;->a:Lfr;

    iget v7, v7, Lfr;->c:I

    int-to-float v7, v7

    invoke-virtual {p2, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-boolean p0, p0, Lyal;->d:Z

    if-eqz p0, :cond_55

    invoke-virtual {p1, v4, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_7b

    :cond_55
    int-to-float p0, p3

    int-to-float p3, p5

    int-to-float v1, p7

    move v2, p0

    move p6, p0

    move-object p5, p1

    move-object/from16 p10, p2

    move p7, p3

    move/from16 p9, v1

    move/from16 p8, v2

    invoke-virtual/range {p5 .. p10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    int-to-float v0, p4

    move v2, v0

    move-object/from16 p8, p2

    move p5, p3

    move p4, v0

    move p7, v1

    move p6, v2

    move-object p3, p1

    invoke-virtual/range {p3 .. p8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move p3, p4

    move v0, v1

    move p4, p0

    move p6, p3

    move p7, v0

    move p5, v1

    move-object p3, p1

    invoke-virtual/range {p3 .. p8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :goto_7b
    invoke-virtual {p2, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {p2, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_81
    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method
