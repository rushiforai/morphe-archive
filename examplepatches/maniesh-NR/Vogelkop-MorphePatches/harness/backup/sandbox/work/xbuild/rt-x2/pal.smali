.class public final Lpal;
.super Landroid/text/style/ReplacementSpan;
.source "SourceFile"


# instance fields
.field public final a:Lfr;

.field public final b:Lral;

.field public final c:I

.field public final d:Z

.field public final e:Z


# direct methods
.method public constructor <init>(Lfr;Lral;IZZ)V
    .registers 6

    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    iput-object p1, p0, Lpal;->a:Lfr;

    iput-object p2, p0, Lpal;->b:Lral;

    iput p3, p0, Lpal;->c:I

    iput-boolean p4, p0, Lpal;->d:Z

    iput-boolean p5, p0, Lpal;->e:Z

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .registers 10

    iget-boolean p2, p0, Lpal;->e:Z

    if-eqz p2, :cond_34

    invoke-virtual {p9}, Landroid/graphics/Paint;->getColor()I

    move-result p2

    iget-object p0, p0, Lpal;->a:Lfr;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const p3, 0x3e99999a    # 0.3f

    invoke-static {p3, p2}, Lp37;->a0(FI)I

    move-result p3

    invoke-virtual {p9, p3}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p9}, Landroid/graphics/Paint;->getColor()I

    move-result p3

    if-eqz p3, :cond_31

    invoke-virtual {p9}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result p3

    iget p0, p0, Lfr;->c:I

    int-to-float p0, p0

    invoke-virtual {p9, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    int-to-float p6, p6

    int-to-float p8, p8

    move p7, p5

    move-object p4, p1

    invoke-virtual/range {p4 .. p9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {p9, p3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_31
    invoke-virtual {p9, p2}, Landroid/graphics/Paint;->setColor(I)V

    :cond_34
    return-void
.end method

.method public final getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .registers 14

    const/4 p2, -0x1

    const/4 p3, 0x0

    if-eqz p5, :cond_c

    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput p3, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iput p3, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    :cond_c
    iget-object p4, p0, Lpal;->a:Lfr;

    iget p4, p4, Lfr;->b:I

    check-cast p1, Landroid/text/TextPaint;

    iget-object p5, p0, Lpal;->b:Lral;

    iget-object p5, p5, Lral;->a:Ljava/util/ArrayList;

    iget v0, p0, Lpal;->c:I

    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqal;

    iget-object v1, v1, Lqal;->d:Lnal;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    iget-boolean p0, p0, Lpal;->d:Z

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eqz v1, :cond_38

    if-eq v1, v2, :cond_36

    if-ne v1, v3, :cond_32

    if-nez p0, :cond_3a

    goto/16 :goto_a0

    :cond_32
    invoke-static {}, Lh9o;->p()V

    return p3

    :cond_36
    move v1, v2

    goto :goto_3b

    :cond_38
    if-nez p0, :cond_a0

    :cond_3a
    move v1, p3

    :goto_3b
    iget v4, p1, Landroid/text/TextPaint;->density:F

    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontSpacing()F

    invoke-virtual {p1}, Landroid/graphics/Paint;->getLetterSpacing()F

    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextScaleX()F

    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSize()F

    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSkewX()F

    invoke-virtual {p1}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    invoke-virtual {p1}, Landroid/graphics/Paint;->getFlags()I

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :cond_57
    :goto_57
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_87

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {p5, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqal;

    iget-object v6, v5, Lqal;->a:Ljava/lang/CharSequence;

    iget v7, v5, Lqal;->b:I

    iget v5, v5, Lqal;->c:I

    invoke-virtual {p1, v6, v7, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v5

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-float v5, v5

    float-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-le v5, p3, :cond_57

    move p3, v5

    goto :goto_57

    :cond_87
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    sub-int/2addr p3, p1

    if-eqz v1, :cond_a0

    rem-int/lit8 p1, p3, 0x2

    if-nez p1, :cond_9b

    div-int/lit8 p3, p3, 0x2

    goto :goto_a0

    :cond_9b
    if-nez p0, :cond_9e

    move p2, v2

    :cond_9e
    add-int/2addr p3, p2

    div-int/2addr p3, v3

    :cond_a0
    :goto_a0
    add-int/2addr p4, p3

    return p4
.end method
