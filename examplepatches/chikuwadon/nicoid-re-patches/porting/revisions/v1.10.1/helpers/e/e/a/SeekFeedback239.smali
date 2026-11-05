.class public final Le/e/a/SeekFeedback239;
.super Ljava/lang/Object;
.source "SeekFeedback239.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SeekFeedback239$Ink;
    }
.end annotation


# static fields
.field static final INK:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Le/e/a/SeekFeedback239$Ink;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6
    new-instance v0, Le/e/a/SeekFeedback239$1;

    invoke-direct {v0}, Le/e/a/SeekFeedback239$1;-><init>()V

    sput-object v0, Le/e/a/SeekFeedback239;->INK:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static draw(Ljava/lang/Object;Landroid/graphics/Canvas;[Ljava/lang/String;)Z
    .registers 16

    .line 10
    instance-of v0, p0, Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_d6

    invoke-static {p2}, Le/e/a/SeekFeedback239;->seek([Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d6

    move-object v0, p0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Le/e/a/SeekMode242;->normal(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_16

    goto/16 :goto_d6

    .line 11
    :cond_16
    sget-object v2, Le/e/a/SeekFeedback239;->INK:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/SeekFeedback239$Ink;

    iget-object v10, v2, Le/e/a/SeekFeedback239$Ink;->paint:Landroid/graphics/Paint;

    invoke-virtual {v10}, Landroid/graphics/Paint;->reset()V

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v10, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v10, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v12, v3, Landroid/util/DisplayMetrics;->density:F

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v3, 0x2

    invoke-static {p0}, Le/e/a/SeekMode242;->main(Ljava/lang/Object;)F

    move-result v4

    invoke-static {v3, v4, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    .line 14
    invoke-static {p0, p1}, Le/e/a/CommentViewport190;->width(Ljava/lang/Object;Landroid/graphics/Canvas;)I

    move-result v3

    invoke-static {p0, p1}, Le/e/a/CommentViewport190;->height(Ljava/lang/Object;Landroid/graphics/Canvas;)I

    move-result v5

    .line 15
    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    int-to-float v3, v3

    const v6, 0x3f333333    # 0.7f

    mul-float/2addr v6, v3

    aget-object v7, p2, v1

    invoke-virtual {v10, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    div-float/2addr v6, v7

    invoke-static {v8, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    mul-float v7, v0, v6

    .line 16
    invoke-virtual {v10, v7}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, v2, Le/e/a/SeekFeedback239$Ink;->main:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    invoke-static {p0}, Le/e/a/SeekMode242;->delta(Ljava/lang/Object;)F

    move-result v0

    mul-float/2addr v0, v7

    div-float/2addr v0, v4

    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v4, v2, Le/e/a/SeekFeedback239$Ink;->delta:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {v10, v4}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 17
    const/high16 v4, 0x40800000    # 4.0f

    mul-float/2addr v4, v12

    iget-object v6, v2, Le/e/a/SeekFeedback239$Ink;->main:Landroid/graphics/Paint$FontMetrics;

    iget v6, v6, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget-object v8, v2, Le/e/a/SeekFeedback239$Ink;->main:Landroid/graphics/Paint$FontMetrics;

    iget v8, v8, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v6, v8

    add-float/2addr v6, v4

    iget-object v8, v2, Le/e/a/SeekFeedback239$Ink;->delta:Landroid/graphics/Paint$FontMetrics;

    iget v8, v8, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v6, v8

    iget-object v8, v2, Le/e/a/SeekFeedback239$Ink;->delta:Landroid/graphics/Paint$FontMetrics;

    iget v8, v8, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v6, v8

    .line 18
    int-to-float v5, v5

    sub-float/2addr v5, v6

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    iget-object v8, v2, Le/e/a/SeekFeedback239$Ink;->main:Landroid/graphics/Paint$FontMetrics;

    iget v8, v8, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float v8, v5, v8

    iget-object v5, v2, Le/e/a/SeekFeedback239$Ink;->main:Landroid/graphics/Paint$FontMetrics;

    iget v5, v5, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v5, v8

    add-float/2addr v5, v4

    iget-object v2, v2, Le/e/a/SeekFeedback239$Ink;->delta:Landroid/graphics/Paint$FontMetrics;

    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float v2, v5, v2

    .line 19
    invoke-static {p0, p1}, Le/e/a/CommentViewport190;->begin(Ljava/lang/Object;Landroid/graphics/Canvas;)V

    .line 20
    :try_start_b6
    aget-object v4, p2, v1

    div-float p0, v3, v6

    move-object v3, p1

    move v5, p0

    move v6, v8

    move v8, v12

    move-object v9, v10

    invoke-static/range {v3 .. v9}, Le/e/a/SeekFeedback239;->line(Landroid/graphics/Canvas;Ljava/lang/String;FFFFLandroid/graphics/Paint;)V

    aget-object v4, p2, v11

    move-object v3, p1

    move v5, p0

    move v6, v2

    move v7, v0

    move v8, v12

    move-object v9, v10

    invoke-static/range {v3 .. v9}, Le/e/a/SeekFeedback239;->line(Landroid/graphics/Canvas;Ljava/lang/String;FFFFLandroid/graphics/Paint;)V
    :try_end_cd
    .catchall {:try_start_b6 .. :try_end_cd} :catchall_d1

    invoke-static {p1}, Le/e/a/CommentViewport190;->end(Landroid/graphics/Canvas;)V

    .line 21
    return v11

    .line 20
    :catchall_d1
    move-exception p0

    invoke-static {p1}, Le/e/a/CommentViewport190;->end(Landroid/graphics/Canvas;)V

    throw p0

    .line 10
    :cond_d6
    :goto_d6
    return v1
.end method

.method static line(Landroid/graphics/Canvas;Ljava/lang/String;FFFFLandroid/graphics/Paint;)V
    .registers 7

    .line 23
    invoke-virtual {p6, p4}, Landroid/graphics/Paint;->setTextSize(F)V

    const/high16 p4, -0x1000000

    invoke-virtual {p6, p4}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p6, p5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object p4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, p4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p0, p1, p2, p3, p6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    sget-object p4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, p4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 p4, -0x1

    invoke-virtual {p6, p4}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0, p1, p2, p3, p6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method static seek([Ljava/lang/String;)Z
    .registers 7

    .line 8
    const/4 v0, 0x0

    if-eqz p0, :cond_50

    array-length v1, p0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_50

    aget-object v1, p0, v0

    if-eqz v1, :cond_50

    const/4 v1, 0x1

    aget-object v3, p0, v1

    if-nez v3, :cond_11

    goto :goto_50

    :cond_11
    aget-object v3, p0, v1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    aget-object v5, p0, v0

    aget-object p0, p0, v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {v5, v0, p0}, Le/e/a/SeekFeedback239;->time(Ljava/lang/String;II)Z

    move-result p0

    if-eqz p0, :cond_50

    const/4 p0, 0x7

    if-lt v4, p0, :cond_50

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v5, 0x5b

    if-ne p0, v5, :cond_50

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v5, 0x5d

    if-ne p0, v5, :cond_50

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v5, 0x2b

    if-eq p0, v5, :cond_49

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v5, 0x2d

    if-ne p0, v5, :cond_50

    :cond_49
    invoke-static {v3, v2, v4}, Le/e/a/SeekFeedback239;->time(Ljava/lang/String;II)Z

    move-result p0

    if-eqz p0, :cond_50

    return v1

    :cond_50
    :goto_50
    return v0
.end method

.method static time(Ljava/lang/String;II)Z
    .registers 9

    .line 7
    const/4 v0, 0x0

    if-eqz p0, :cond_34

    sub-int v1, p2, p1

    const/4 v2, 0x4

    if-ge v1, v2, :cond_9

    goto :goto_34

    :cond_9
    move v1, v0

    move v2, v1

    :goto_b
    const/4 v3, 0x2

    if-lt p1, p2, :cond_15

    const/4 p0, 0x1

    if-lt v1, p0, :cond_14

    if-ne v2, v3, :cond_14

    return p0

    :cond_14
    return v0

    :cond_15
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3a

    if-ne v4, v5, :cond_27

    if-eqz v2, :cond_26

    if-lt v1, v3, :cond_22

    goto :goto_26

    :cond_22
    add-int/lit8 v1, v1, 0x1

    move v2, v0

    goto :goto_31

    :cond_26
    :goto_26
    return v0

    :cond_27
    const/16 v3, 0x30

    if-lt v4, v3, :cond_34

    const/16 v3, 0x39

    if-gt v4, v3, :cond_34

    add-int/lit8 v2, v2, 0x1

    :goto_31
    add-int/lit8 p1, p1, 0x1

    goto :goto_b

    :cond_34
    :goto_34
    return v0
.end method
