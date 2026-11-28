.class final Le/e/a/TapRegionSettings141$Preview;
.super Landroid/view/View;
.source "TapRegionSettings141.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/TapRegionSettings141;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Preview"
.end annotation


# instance fields
.field downX:F

.field downY:F

.field final editor:Le/e/a/TapRegionSettings141$Editor;

.field final frame:Landroid/graphics/RectF;

.field horizontal:I

.field original:[I

.field final paint:Landroid/graphics/Paint;

.field vertical:I


# direct methods
.method constructor <init>(Le/e/a/TapRegionSettings141$Editor;)V
    .registers 5
    .param p1, "editor"    # Le/e/a/TapRegionSettings141$Editor;

    .line 550
    iget-object v0, p1, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 543
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    .line 544
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    .line 546
    const/4 v0, -0x1

    iput v0, p0, Le/e/a/TapRegionSettings141$Preview;->horizontal:I

    iput v0, p0, Le/e/a/TapRegionSettings141$Preview;->vertical:I

    .line 551
    iput-object p1, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    .line 552
    const-string v0, "Area preview"

    const-string v1, "\u5340\u57df\u9810\u89bd"

    const-string/jumbo v2, "\u9818\u57df\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-virtual {p1, v2, v0, v1}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/TapRegionSettings141$Preview;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 553
    return-void
.end method

.method private begin(FF)Z
    .registers 10
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 598
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 599
    :cond_0
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v0, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v0

    int-to-float v0, v0

    .line 600
    .local v0, "slop":F
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget v2, v2, Le/e/a/TapRegionSettings141$Editor;->selected:I

    .line 601
    .local v2, "index":I
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget-object v3, v3, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    invoke-direct {p0, v3, p1, p2, v0}, Le/e/a/TapRegionSettings141$Preview;->hit([IFFF)Z

    move-result v3

    if-nez v3, :cond_2

    .line 602
    const/4 v2, 0x0

    .line 603
    :goto_0
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget-object v3, v3, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget-object v3, v3, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    invoke-direct {p0, v3, p1, p2, v0}, Le/e/a/TapRegionSettings141$Preview;->hit([IFFF)Z

    move-result v3

    if-nez v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 604
    :cond_1
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget-object v3, v3, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_2

    return v1

    .line 606
    :cond_2
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    invoke-virtual {v3, v2}, Le/e/a/TapRegionSettings141$Editor;->select(I)V

    .line 607
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget-object v3, v3, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    invoke-virtual {v3}, [I->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    iput-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    .line 608
    iput p1, p0, Le/e/a/TapRegionSettings141$Preview;->downX:F

    .line 609
    iput p2, p0, Le/e/a/TapRegionSettings141$Preview;->downY:F

    .line 610
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    aget v3, v3, v1

    invoke-direct {p0, v3}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v3

    iget-object v4, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    invoke-direct {p0, v4}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v4

    invoke-static {p1, v3, v4, v0, v1}, Le/e/a/TapRegionSettings141$Preview;->near(FFFFI)I

    move-result v1

    iput v1, p0, Le/e/a/TapRegionSettings141$Preview;->horizontal:I

    .line 611
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    const/4 v3, 0x2

    aget v1, v1, v3

    invoke-direct {p0, v1}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v1

    iget-object v4, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    const/4 v6, 0x3

    aget v4, v4, v6

    invoke-direct {p0, v4}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v4

    invoke-static {p2, v1, v4, v0, v3}, Le/e/a/TapRegionSettings141$Preview;->near(FFFFI)I

    move-result v1

    iput v1, p0, Le/e/a/TapRegionSettings141$Preview;->vertical:I

    .line 612
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Preview;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 613
    return v5
.end method

.method private drag(FF)V
    .registers 12
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 617
    iget v0, p0, Le/e/a/TapRegionSettings141$Preview;->downX:F

    sub-float v0, p1, v0

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float v0, v0, v1

    iget-object v2, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 618
    .local v0, "dx":I
    iget v2, p0, Le/e/a/TapRegionSettings141$Preview;->downY:F

    sub-float v2, p2, v2

    mul-float v2, v2, v1

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 619
    .local v1, "dy":I
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    invoke-virtual {v2}, [I->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    .line 620
    .local v2, "next":[I
    iget v3, p0, Le/e/a/TapRegionSettings141$Preview;->horizontal:I

    if-gez v3, :cond_0

    iget v3, p0, Le/e/a/TapRegionSettings141$Preview;->vertical:I

    if-gez v3, :cond_0

    .line 621
    const/4 v3, 0x0

    aget v4, v2, v3

    neg-int v4, v4

    const/4 v5, 0x1

    aget v6, v2, v5

    rsub-int/lit8 v6, v6, 0x64

    # invokes: Le/e/a/TapRegionSettings141;->clamp(III)I
    invoke-static {v0, v4, v6}, Le/e/a/TapRegionSettings141;->access$100(III)I

    move-result v0

    .line 622
    const/4 v4, 0x2

    aget v6, v2, v4

    neg-int v6, v6

    const/4 v7, 0x3

    aget v8, v2, v7

    rsub-int/lit8 v8, v8, 0x64

    # invokes: Le/e/a/TapRegionSettings141;->clamp(III)I
    invoke-static {v1, v6, v8}, Le/e/a/TapRegionSettings141;->access$100(III)I

    move-result v1

    .line 623
    aget v6, v2, v3

    add-int/2addr v6, v0

    aput v6, v2, v3

    .line 624
    aget v3, v2, v5

    add-int/2addr v3, v0

    aput v3, v2, v5

    .line 625
    aget v3, v2, v4

    add-int/2addr v3, v1

    aput v3, v2, v4

    .line 626
    aget v3, v2, v7

    add-int/2addr v3, v1

    aput v3, v2, v7

    goto :goto_0

    .line 628
    :cond_0
    iget v3, p0, Le/e/a/TapRegionSettings141$Preview;->horizontal:I

    if-ltz v3, :cond_1

    iget v3, p0, Le/e/a/TapRegionSettings141$Preview;->horizontal:I

    iget-object v4, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    iget v5, p0, Le/e/a/TapRegionSettings141$Preview;->horizontal:I

    aget v4, v4, v5

    add-int/2addr v4, v0

    invoke-static {v2, v3, v4}, Le/e/a/TapRegionSettings141;->changeEdge([III)V

    .line 629
    :cond_1
    iget v3, p0, Le/e/a/TapRegionSettings141$Preview;->vertical:I

    if-ltz v3, :cond_2

    iget v3, p0, Le/e/a/TapRegionSettings141$Preview;->vertical:I

    iget-object v4, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    iget v5, p0, Le/e/a/TapRegionSettings141$Preview;->vertical:I

    aget v4, v4, v5

    add-int/2addr v4, v1

    invoke-static {v2, v3, v4}, Le/e/a/TapRegionSettings141;->changeEdge([III)V

    .line 631
    :cond_2
    :goto_0
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    invoke-virtual {v3, v2}, Le/e/a/TapRegionSettings141$Editor;->edit([I)V

    .line 632
    return-void
.end method

.method private endDrag()V
    .registers 3

    .line 655
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    .line 656
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Preview;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 657
    return-void
.end method

.method private hit([IFFF)Z
    .registers 8
    .param p1, "r"    # [I
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "pad"    # F

    .line 588
    const/4 v0, 0x0

    aget v1, p1, v0

    invoke-direct {p0, v1}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v1

    sub-float/2addr v1, p4

    cmpl-float v1, p2, v1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    aget v2, p1, v1

    invoke-direct {p0, v2}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v2

    add-float/2addr v2, p4

    cmpg-float v2, p2, v2

    if-gtz v2, :cond_0

    const/4 v2, 0x2

    aget v2, p1, v2

    .line 589
    invoke-direct {p0, v2}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v2

    sub-float/2addr v2, p4

    cmpl-float v2, p3, v2

    if-ltz v2, :cond_0

    const/4 v2, 0x3

    aget v2, p1, v2

    invoke-direct {p0, v2}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v2

    add-float/2addr v2, p4

    cmpg-float v2, p3, v2

    if-gtz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 588
    :goto_0
    return v0
.end method

.method private static near(FFFFI)I
    .registers 8
    .param p0, "point"    # F
    .param p1, "first"    # F
    .param p2, "last"    # F
    .param p3, "pad"    # F
    .param p4, "edge"    # I

    .line 593
    sub-float v0, p0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .local v0, "a":F
    sub-float v1, p0, p2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 594
    .local v1, "b":F
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    cmpg-float v2, v2, p3

    if-gtz v2, :cond_1

    cmpg-float v2, v0, v1

    if-gtz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    :goto_0
    add-int/2addr v2, p4

    goto :goto_1

    :cond_1
    const/4 v2, -0x1

    :goto_1
    return v2
.end method

.method private x(I)F
    .registers 5
    .param p1, "percent"    # I

    .line 562
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    int-to-float v2, p1

    mul-float v1, v1, v2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method private y(I)F
    .registers 5
    .param p1, "percent"    # I

    .line 563
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    int-to-float v2, p1

    mul-float v1, v1, v2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 566
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 567
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    iget-object v2, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget v2, v2, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    const v6, 0xffffff

    and-int/2addr v2, v6

    const/high16 v3, 0x20000000

    or-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 568
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    iget-object v2, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 569
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    iget-object v2, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget v2, v2, Le/e/a/TapRegionSettings141$Editor;->accent:I

    and-int/2addr v2, v6

    const/high16 v3, -0x79000000

    or-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 570
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget-object v1, v1, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eqz v1, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, [I

    .local v12, "r":[I
    aget v1, v12, v9

    invoke-direct {p0, v1}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v1

    aget v2, v12, v10

    invoke-direct {p0, v2}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v2

    aget v3, v12, v11

    invoke-direct {p0, v3}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v3

    aget v4, v12, v8

    invoke-direct {p0, v4}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v4

    iget-object v5, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .end local v12    # "r":[I
    goto :goto_0

    .line 571
    :cond_0
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget v1, v1, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    and-int/2addr v1, v6

    const/high16 v2, 0x28000000

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 572
    const/16 v0, 0x14

    move v6, v0

    .local v6, "mark":I
    :goto_1
    const/16 v0, 0x64

    if-ge v6, v0, :cond_1

    .line 573
    invoke-direct {p0, v6}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v1

    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->top:F

    invoke-direct {p0, v6}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v3

    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 574
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    invoke-direct {p0, v6}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v2

    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->right:F

    invoke-direct {p0, v6}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v4

    iget-object v5, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 572
    add-int/lit8 v6, v6, 0x14

    goto :goto_1

    .line 576
    .end local v6    # "mark":I
    :cond_1
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget-object v0, v0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget v1, v1, Le/e/a/TapRegionSettings141$Editor;->selected:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, [I

    .line 577
    .local v6, "r":[I
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    iget v1, v1, Le/e/a/TapRegionSettings141$Editor;->accent:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 578
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 579
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {v1, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 580
    aget v0, v6, v9

    invoke-direct {p0, v0}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v1

    aget v0, v6, v10

    invoke-direct {p0, v0}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v2

    aget v0, v6, v11

    invoke-direct {p0, v0}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v3

    aget v0, v6, v8

    invoke-direct {p0, v0}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v4

    iget-object v5, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 581
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 582
    const/4 v1, 0x0

    .local v1, "h":I
    :goto_2
    if-ge v1, v10, :cond_3

    .line 583
    const/4 v2, 0x2

    .local v2, "v":I
    :goto_3
    const/4 v3, 0x4

    if-ge v2, v3, :cond_2

    aget v3, v6, v1

    invoke-direct {p0, v3}, Le/e/a/TapRegionSettings141$Preview;->x(I)F

    move-result v3

    aget v4, v6, v2

    invoke-direct {p0, v4}, Le/e/a/TapRegionSettings141$Preview;->y(I)F

    move-result v4

    iget-object v5, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    const/high16 v7, 0x40800000    # 4.0f

    invoke-virtual {v5, v7}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v5

    int-to-float v5, v5

    iget-object v7, p0, Le/e/a/TapRegionSettings141$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 582
    .end local v2    # "v":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 585
    .end local v1    # "h":I
    :cond_3
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 14
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldW"    # I
    .param p4, "oldH"    # I

    .line 556
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->editor:Le/e/a/TapRegionSettings141$Editor;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {v0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v0

    int-to-float v0, v0

    .line 557
    .local v0, "inset":F
    int-to-float v1, p1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v3, v0, v2

    sub-float/2addr v1, v3

    int-to-float v3, p2

    mul-float v4, v0, v2

    sub-float/2addr v3, v4

    const/high16 v4, 0x41800000    # 16.0f

    mul-float v3, v3, v4

    const/high16 v5, 0x41100000    # 9.0f

    div-float/2addr v3, v5

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 558
    .local v1, "width":F
    mul-float v5, v5, v1

    div-float/2addr v5, v4

    .line 559
    .local v5, "height":F
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Preview;->frame:Landroid/graphics/RectF;

    int-to-float v4, p1

    sub-float/2addr v4, v1

    div-float/2addr v4, v2

    int-to-float v6, p2

    sub-float/2addr v6, v5

    div-float/2addr v6, v2

    int-to-float v7, p1

    add-float/2addr v7, v1

    div-float/2addr v7, v2

    int-to-float v8, p2

    add-float/2addr v8, v5

    div-float/2addr v8, v2

    invoke-virtual {v3, v4, v6, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    .line 560
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 635
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    .line 650
    :pswitch_0
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    goto :goto_0

    .line 646
    :pswitch_1
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    if-nez v0, :cond_0

    return v1

    .line 647
    :cond_0
    invoke-direct {p0}, Le/e/a/TapRegionSettings141$Preview;->endDrag()V

    .line 648
    return v2

    .line 640
    :pswitch_2
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Preview;->original:[I

    if-nez v0, :cond_1

    return v1

    .line 641
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-direct {p0, v0, v1}, Le/e/a/TapRegionSettings141$Preview;->drag(FF)V

    .line 642
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v2, :cond_2

    invoke-direct {p0}, Le/e/a/TapRegionSettings141$Preview;->endDrag()V

    .line 643
    :cond_2
    return v2

    .line 637
    :pswitch_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-direct {p0, v0, v1}, Le/e/a/TapRegionSettings141$Preview;->begin(FF)Z

    move-result v0

    return v0

    .line 650
    :cond_3
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
