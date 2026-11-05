.class final Le/e/a/CommentSettings194$SnapSeek;
.super Landroid/widget/SeekBar;
.source "CommentSettings194.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings194;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SnapSeek"
.end annotation


# instance fields
.field final initial:I

.field final mark:Landroid/graphics/Paint;

.field snapped:Z

.field final track:Landroid/graphics/Paint;

.field tracking:Z


# direct methods
.method constructor <init>(Landroid/content/Context;II)V
    .registers 6

    .line 586
    invoke-direct {p0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 587
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/CommentSettings194$SnapSeek;->mark:Landroid/graphics/Paint;

    .line 588
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    .line 589
    iput p2, p0, Le/e/a/CommentSettings194$SnapSeek;->initial:I

    .line 590
    invoke-virtual {p0, p3}, Le/e/a/CommentSettings194$SnapSeek;->setMax(I)V

    .line 591
    iget-object p2, p0, Le/e/a/CommentSettings194$SnapSeek;->mark:Landroid/graphics/Paint;

    invoke-static {p1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 592
    iget-object p2, p0, Le/e/a/CommentSettings194$SnapSeek;->mark:Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-static {p1, p3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 593
    return-void
.end method


# virtual methods
.method initialX()F
    .registers 5

    .line 596
    iget v0, p0, Le/e/a/CommentSettings194$SnapSeek;->initial:I

    int-to-float v0, v0

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getMax()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 597
    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_14

    .line 598
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    .line 600
    :cond_14
    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    mul-float v0, v0, v2

    add-float/2addr v1, v0

    return v1
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    monitor-enter p0

    .line 632
    :try_start_1
    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 633
    iget-object v1, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x4

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 634
    iget-object v1, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 635
    iget-object v1, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 636
    iget-object v1, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    const/16 v2, 0x48

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 637
    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingLeft()I

    move-result v1

    int-to-float v3, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v5, v1

    iget-object v7, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v0

    move v6, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 638
    iget-object v1, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 639
    iget-object v1, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 640
    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingLeft()I

    move-result v1

    int-to-float v3, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getPaddingRight()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getProgress()I

    move-result v4

    mul-int v2, v2, v4

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getMax()I

    move-result v4

    div-int/2addr v2, v4

    add-int/2addr v1, v2

    int-to-float v5, v1

    iget-object v7, p0, Le/e/a/CommentSettings194$SnapSeek;->track:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v0

    move v6, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 641
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onDraw(Landroid/graphics/Canvas;)V

    .line 642
    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0xa

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    .line 643
    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->initialX()F

    move-result v3

    sub-float v4, v0, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->initialX()F

    move-result v5

    add-float v6, v0, v1

    iget-object v7, p0, Le/e/a/CommentSettings194$SnapSeek;->mark:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    :try_end_aa
    .catchall {:try_start_1 .. :try_end_aa} :catchall_ac

    .line 644
    monitor-exit p0

    return-void

    .line 631
    :catchall_ac
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    .line 605
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 606
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_c

    .line 607
    iput-boolean v1, p0, Le/e/a/CommentSettings194$SnapSeek;->tracking:Z

    .line 608
    iput-boolean v2, p0, Le/e/a/CommentSettings194$SnapSeek;->snapped:Z

    .line 610
    :cond_c
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    .line 611
    iget-boolean v4, p0, Le/e/a/CommentSettings194$SnapSeek;->tracking:Z

    if-eqz v4, :cond_5f

    const/4 v4, 0x2

    if-eq v0, v4, :cond_19

    if-nez v0, :cond_5f

    .line 612
    :cond_19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->initialX()F

    move-result v4

    sub-float/2addr p1, v4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    .line 613
    iget-boolean v4, p0, Le/e/a/CommentSettings194$SnapSeek;->snapped:Z

    if-nez v4, :cond_3f

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x5

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    cmpg-float v4, p1, v4

    if-gtz v4, :cond_3f

    .line 614
    iput-boolean v1, p0, Le/e/a/CommentSettings194$SnapSeek;->snapped:Z

    .line 615
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Le/e/a/CommentSettings194$SnapSeek;->performHapticFeedback(I)Z

    goto :goto_55

    .line 616
    :cond_3f
    iget-boolean v4, p0, Le/e/a/CommentSettings194$SnapSeek;->snapped:Z

    if-eqz v4, :cond_55

    invoke-virtual {p0}, Le/e/a/CommentSettings194$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v4

    const/16 v5, 0xb

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    cmpl-float p1, p1, v4

    if-lez p1, :cond_55

    .line 617
    iput-boolean v2, p0, Le/e/a/CommentSettings194$SnapSeek;->snapped:Z

    goto :goto_56

    .line 616
    :cond_55
    :goto_55
    nop

    .line 619
    :goto_56
    iget-boolean p1, p0, Le/e/a/CommentSettings194$SnapSeek;->snapped:Z

    if-eqz p1, :cond_5f

    .line 620
    iget p1, p0, Le/e/a/CommentSettings194$SnapSeek;->initial:I

    invoke-virtual {p0, p1}, Le/e/a/CommentSettings194$SnapSeek;->setProgress(I)V

    .line 623
    :cond_5f
    if-eq v0, v1, :cond_64

    const/4 p1, 0x3

    if-ne v0, p1, :cond_68

    .line 624
    :cond_64
    iput-boolean v2, p0, Le/e/a/CommentSettings194$SnapSeek;->tracking:Z

    .line 625
    iput-boolean v2, p0, Le/e/a/CommentSettings194$SnapSeek;->snapped:Z

    .line 627
    :cond_68
    return v3
.end method
