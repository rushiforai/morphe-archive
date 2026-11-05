.class final Le/e/a/CommentSettings193$SnapSeek;
.super Landroid/widget/SeekBar;
.source "CommentSettings193.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings193;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SnapSeek"
.end annotation


# instance fields
.field final initial:I

.field final marker:Landroid/graphics/Paint;

.field snapped:Z

.field tracking:Z


# direct methods
.method constructor <init>(Landroid/content/Context;II)V
    .registers 6

    .line 38
    invoke-direct {p0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/CommentSettings193$SnapSeek;->marker:Landroid/graphics/Paint;

    .line 38
    iput p2, p0, Le/e/a/CommentSettings193$SnapSeek;->initial:I

    invoke-virtual {p0, p3}, Le/e/a/CommentSettings193$SnapSeek;->setMax(I)V

    iget-object p2, p0, Le/e/a/CommentSettings193$SnapSeek;->marker:Landroid/graphics/Paint;

    invoke-static {p1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p2, p0, Le/e/a/CommentSettings193$SnapSeek;->marker:Landroid/graphics/Paint;

    invoke-static {p1, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method initialX()F
    .registers 5

    .line 39
    iget v0, p0, Le/e/a/CommentSettings193$SnapSeek;->initial:I

    int-to-float v0, v0

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getMax()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_14

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    :cond_14
    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getPaddingRight()I

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

    .line 48
    :try_start_1
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x9

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->initialX()F

    move-result v3

    sub-float v4, v0, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->initialX()F

    move-result v5

    add-float v6, v0, v1

    iget-object v7, p0, Le/e/a/CommentSettings193$SnapSeek;->marker:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V
    :try_end_29
    .catchall {:try_start_1 .. :try_end_29} :catchall_2b

    monitor-exit p0

    return-void

    .line 48
    :catchall_2b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9

    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_c

    iput-boolean v1, p0, Le/e/a/CommentSettings193$SnapSeek;->tracking:Z

    iput-boolean v2, p0, Le/e/a/CommentSettings193$SnapSeek;->snapped:Z

    .line 41
    :cond_c
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    .line 42
    iget-boolean v4, p0, Le/e/a/CommentSettings193$SnapSeek;->tracking:Z

    if-eqz v4, :cond_5d

    const/4 v4, 0x2

    if-eq v0, v4, :cond_19

    if-nez v0, :cond_5d

    :cond_19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->initialX()F

    move-result v4

    sub-float/2addr p1, v4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x5

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p0}, Le/e/a/CommentSettings193$SnapSeek;->getContext()Landroid/content/Context;

    move-result-object v5

    const/16 v6, 0xb

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    int-to-float v5, v5

    .line 43
    iget-boolean v6, p0, Le/e/a/CommentSettings193$SnapSeek;->snapped:Z

    if-nez v6, :cond_4a

    cmpg-float v4, p1, v4

    if-gtz v4, :cond_4a

    iput-boolean v1, p0, Le/e/a/CommentSettings193$SnapSeek;->snapped:Z

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Le/e/a/CommentSettings193$SnapSeek;->performHapticFeedback(I)Z

    goto :goto_54

    :cond_4a
    iget-boolean v4, p0, Le/e/a/CommentSettings193$SnapSeek;->snapped:Z

    if-eqz v4, :cond_54

    cmpl-float p1, p1, v5

    if-lez p1, :cond_54

    iput-boolean v2, p0, Le/e/a/CommentSettings193$SnapSeek;->snapped:Z

    .line 44
    :cond_54
    :goto_54
    iget-boolean p1, p0, Le/e/a/CommentSettings193$SnapSeek;->snapped:Z

    if-eqz p1, :cond_5d

    iget p1, p0, Le/e/a/CommentSettings193$SnapSeek;->initial:I

    invoke-virtual {p0, p1}, Le/e/a/CommentSettings193$SnapSeek;->setProgress(I)V

    .line 46
    :cond_5d
    if-eq v0, v1, :cond_62

    const/4 p1, 0x3

    if-ne v0, p1, :cond_66

    :cond_62
    iput-boolean v2, p0, Le/e/a/CommentSettings193$SnapSeek;->tracking:Z

    iput-boolean v2, p0, Le/e/a/CommentSettings193$SnapSeek;->snapped:Z

    :cond_66
    return v3
.end method
