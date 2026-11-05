.class final Le/e/a/BikeRun$SwipeScroll;
.super Landroid/widget/ScrollView;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRun;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SwipeScroll"
.end annotation


# instance fields
.field axis:I

.field downX:F

.field downY:F

.field final pane:Le/e/a/BikeRun$RecordsPane;

.field final slop:I


# direct methods
.method constructor <init>(Landroid/content/Context;Le/e/a/BikeRun$RecordsPane;)V
    .registers 3

    .line 223
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/BikeRun$SwipeScroll;->pane:Le/e/a/BikeRun$RecordsPane;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Le/e/a/BikeRun$SwipeScroll;->slop:I

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 12

    .line 225
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_15

    .line 226
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, p0, Le/e/a/BikeRun$SwipeScroll;->downX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, p0, Le/e/a/BikeRun$SwipeScroll;->downY:F

    iput v1, p0, Le/e/a/BikeRun$SwipeScroll;->axis:I

    .line 227
    :cond_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iget v3, p0, Le/e/a/BikeRun$SwipeScroll;->downX:F

    sub-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget v4, p0, Le/e/a/BikeRun$SwipeScroll;->downY:F

    sub-float/2addr v3, v4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const v6, 0x3f99999a    # 1.2f

    const/4 v7, 0x1

    if-ne v0, v5, :cond_70

    .line 228
    iget v8, p0, Le/e/a/BikeRun$SwipeScroll;->axis:I

    if-nez v8, :cond_70

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iget v9, p0, Le/e/a/BikeRun$SwipeScroll;->slop:I

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_70

    .line 229
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v9

    mul-float v9, v9, v6

    cmpl-float v8, v8, v9

    if-lez v8, :cond_60

    .line 230
    iput v7, p0, Le/e/a/BikeRun$SwipeScroll;->axis:I

    .line 231
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/view/MotionEvent;->setAction(I)V

    .line 232
    invoke-super {p0, v5}, Landroid/widget/ScrollView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v5}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_70

    .line 233
    :cond_60
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v9

    mul-float v9, v9, v6

    cmpl-float v8, v8, v9

    if-lez v8, :cond_70

    iput v5, p0, Le/e/a/BikeRun$SwipeScroll;->axis:I

    .line 235
    :cond_70
    :goto_70
    iget v5, p0, Le/e/a/BikeRun$SwipeScroll;->axis:I

    if-ne v5, v7, :cond_ae

    if-ne v0, v7, :cond_a7

    .line 236
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v5, p0, Le/e/a/BikeRun$SwipeScroll;->pane:Le/e/a/BikeRun$RecordsPane;

    const/high16 v8, 0x42400000    # 48.0f

    invoke-virtual {v5, v8}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v5

    int-to-float v5, v5

    cmpl-float p1, p1, v5

    if-ltz p1, :cond_a7

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float v3, v3, v6

    cmpl-float p1, p1, v3

    if-lez p1, :cond_a7

    .line 237
    iget-object p1, p0, Le/e/a/BikeRun$SwipeScroll;->pane:Le/e/a/BikeRun$RecordsPane;

    iget-object v3, p1, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    iget v3, v3, Le/e/a/BikeRun$Track;->recordsPage:I

    const/4 v5, 0x0

    cmpg-float v2, v2, v5

    if-gez v2, :cond_a2

    const/4 v2, 0x1

    goto :goto_a3

    :cond_a2
    const/4 v2, -0x1

    :goto_a3
    add-int/2addr v3, v2

    invoke-virtual {p1, v3}, Le/e/a/BikeRun$RecordsPane;->select(I)V

    :cond_a7
    if-eq v0, v7, :cond_ab

    if-ne v0, v4, :cond_ad

    .line 238
    :cond_ab
    iput v1, p0, Le/e/a/BikeRun$SwipeScroll;->axis:I

    :cond_ad
    return v7

    .line 241
    :cond_ae
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
