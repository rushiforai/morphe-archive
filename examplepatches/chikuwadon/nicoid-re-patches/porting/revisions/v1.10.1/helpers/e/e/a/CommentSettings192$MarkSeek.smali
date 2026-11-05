.class final Le/e/a/CommentSettings192$MarkSeek;
.super Landroid/widget/SeekBar;
.source "CommentSettings192.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings192;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MarkSeek"
.end annotation


# instance fields
.field final index:I

.field final marker:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .registers 5

    .line 20
    invoke-direct {p0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/CommentSettings192$MarkSeek;->marker:Landroid/graphics/Paint;

    iput p2, p0, Le/e/a/CommentSettings192$MarkSeek;->index:I

    iget-object p2, p0, Le/e/a/CommentSettings192$MarkSeek;->marker:Landroid/graphics/Paint;

    invoke-static {p1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p2, p0, Le/e/a/CommentSettings192$MarkSeek;->marker:Landroid/graphics/Paint;

    invoke-static {p1, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .registers 11

    monitor-enter p0

    .line 20
    :try_start_1
    iget v0, p0, Le/e/a/CommentSettings192$MarkSeek;->index:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_9

    const/high16 v0, 0x3e800000    # 0.25f

    goto :goto_26

    :cond_9
    sget-object v0, Le/e/a/CommentAppearance192;->DEFAULT:[I

    iget v2, p0, Le/e/a/CommentSettings192$MarkSeek;->index:I

    aget v0, v0, v2

    sget-object v2, Le/e/a/CommentAppearance192;->MIN:[I

    iget v3, p0, Le/e/a/CommentSettings192$MarkSeek;->index:I

    aget v2, v2, v3

    sub-int/2addr v0, v2

    int-to-float v0, v0

    sget-object v2, Le/e/a/CommentAppearance192;->MAX:[I

    iget v3, p0, Le/e/a/CommentSettings192$MarkSeek;->index:I

    aget v2, v2, v3

    sget-object v3, Le/e/a/CommentAppearance192;->MIN:[I

    iget v4, p0, Le/e/a/CommentSettings192$MarkSeek;->index:I

    aget v3, v3, v4

    sub-int/2addr v2, v3

    int-to-float v2, v2

    div-float/2addr v0, v2

    :goto_26
    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getLayoutDirection()I

    move-result v2

    if-ne v2, v1, :cond_30

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    :cond_30
    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    mul-float v2, v2, v0

    add-float v6, v1, v2

    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x9

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float v5, v1, v0

    invoke-virtual {p0}, Le/e/a/CommentSettings192$MarkSeek;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    add-float v7, v1, v0

    iget-object v8, p0, Le/e/a/CommentSettings192$MarkSeek;->marker:Landroid/graphics/Paint;

    move-object v3, p1

    move v4, v6

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_6f
    .catchall {:try_start_1 .. :try_end_6f} :catchall_71

    monitor-exit p0

    return-void

    .line 20
    :catchall_71
    move-exception p1

    monitor-exit p0

    throw p1
.end method
