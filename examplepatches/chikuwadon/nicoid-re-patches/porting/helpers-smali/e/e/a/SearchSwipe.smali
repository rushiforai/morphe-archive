.class public final Le/e/a/SearchSwipe;
.super Landroid/widget/FrameLayout;
.source "SearchSwipe.java"


# instance fields
.field delta:F

.field downTime:J

.field dragging:Z

.field eligible:Z

.field final fragment:Ljava/lang/Object;

.field lastRefresh:J

.field final list:Landroid/widget/ListView;

.field final progress:Landroid/widget/ProgressBar;

.field refreshing:Z

.field x:F

.field y:F


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/Object;Landroid/widget/ListView;)V
    .registers 6

    .line 6
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/SearchSwipe;->list:Landroid/widget/ListView;

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p3, p2}, Le/e/a/SearchSwipe;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p2, Landroid/widget/ProgressBar;

    invoke-direct {p2, p1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    iget-object p2, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    invoke-static {p1}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result p3

    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 p3, 0x20

    invoke-static {p1, p3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-static {p1, p3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result p3

    const/16 v1, 0x31

    invoke-direct {p2, v0, p3, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 p3, 0xc

    invoke-static {p1, p3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result p1

    iput p1, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {p0, p1, p2}, Le/e/a/SearchSwipe;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public static install(Ljava/lang/Object;)V
    .registers 7

    .line 7
    :try_start_0
    const-string v0, "d0"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Le/e/a/CommentListRules;->refreshable(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_f

    return-void

    :cond_f
    const-string v0, "b0"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    if-eqz v0, :cond_69

    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-nez v1, :cond_22

    goto :goto_69

    :cond_22
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    instance-of v2, v1, Le/e/a/SearchSwipe;

    if-eqz v2, :cond_2d

    return-void

    :cond_2d
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_45

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    move-object v3, v1

    goto :goto_47

    :cond_45
    move-object v3, v0

    move-object v2, v1

    :goto_47
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    if-eq v3, v0, :cond_57

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_57
    new-instance v1, Le/e/a/SearchSwipe;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3, p0, v0}, Le/e/a/SearchSwipe;-><init>(Landroid/content/Context;Ljava/lang/Object;Landroid/widget/ListView;)V

    invoke-virtual {v2, v1, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    const-string p0, "search swipe installed"

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_68} :catch_6a

    goto :goto_8c

    :cond_69
    :goto_69
    return-void

    :catch_6a
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "search swipe install failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_8c
    return-void
.end method


# virtual methods
.method public c()V
    .registers 2

    .line 11
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9

    .line 9
    iget-boolean v0, p0, Le/e/a/SearchSwipe;->refreshing:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_c6

    :cond_e
    goto/16 :goto_c5

    :pswitch_10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget v3, p0, Le/e/a/SearchSwipe;->y:F

    sub-float/2addr v0, v3

    iput v0, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-gt v0, v2, :cond_52

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v3, p0, Le/e/a/SearchSwipe;->x:F

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_54

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v3, p0, Le/e/a/SearchSwipe;->x:F

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v3, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_54

    :cond_52
    iput-boolean v1, p0, Le/e/a/SearchSwipe;->eligible:Z

    :cond_54
    iget-boolean v0, p0, Le/e/a/SearchSwipe;->eligible:Z

    if-eqz v0, :cond_e

    iget v0, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_e

    iget v0, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget v3, p0, Le/e/a/SearchSwipe;->x:F

    sub-float/2addr p1, v3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v3, 0x40000000    # 2.0f

    mul-float p1, p1, v3

    cmpl-float p1, v0, p1

    if-lez p1, :cond_e

    iput-boolean v2, p0, Le/e/a/SearchSwipe;->dragging:Z

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    iget-object p1, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return v2

    :pswitch_91
    iput-boolean v1, p0, Le/e/a/SearchSwipe;->eligible:Z

    goto :goto_c5

    :pswitch_94
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Le/e/a/SearchSwipe;->x:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Le/e/a/SearchSwipe;->y:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v3

    iput-wide v3, p0, Le/e/a/SearchSwipe;->downTime:J

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/SearchSwipe;->delta:F

    iput-boolean v1, p0, Le/e/a/SearchSwipe;->dragging:Z

    iget-object v0, p0, Le/e/a/SearchSwipe;->list:Landroid/widget/ListView;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_c2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v3

    iget-wide v5, p0, Le/e/a/SearchSwipe;->lastRefresh:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x320

    cmp-long p1, v3, v5

    if-lez p1, :cond_c2

    goto :goto_c3

    :cond_c2
    const/4 v2, 0x0

    :goto_c3
    iput-boolean v2, p0, Le/e/a/SearchSwipe;->eligible:Z

    :goto_c5
    return v1

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_94
        :pswitch_91
        :pswitch_10
        :pswitch_91
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 10

    .line 10
    iget-boolean v0, p0, Le/e/a/SearchSwipe;->dragging:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_1c

    iput-boolean v1, p0, Le/e/a/SearchSwipe;->dragging:Z

    iput-boolean v1, p0, Le/e/a/SearchSwipe;->eligible:Z

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    invoke-virtual {p0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return v2

    :cond_1c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget v3, p0, Le/e/a/SearchSwipe;->y:F

    sub-float/2addr v0, v3

    iput v0, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_62

    iget-object p1, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    iget v0, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v3, v4

    invoke-static {v3}, Le/e/a/PullGestureRules;->threshold(F)F

    move-result v3

    mul-float v1, v1, v3

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const v1, 0x3e4ccccd    # 0.2f

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setAlpha(F)V

    return v2

    :cond_62
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-ne v0, v2, :cond_d7

    iput-boolean v1, p0, Le/e/a/SearchSwipe;->dragging:Z

    iput-boolean v1, p0, Le/e/a/SearchSwipe;->eligible:Z

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "swipe release distanceDp="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    iget v0, p0, Le/e/a/SearchSwipe;->delta:F

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v3

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    iget-wide v6, p0, Le/e/a/SearchSwipe;->downTime:J

    sub-long/2addr v4, v6

    invoke-static {v0, v3, v4, v5}, Le/e/a/PullGestureRules;->accepts(FFJ)Z

    move-result v0

    if-eqz v0, :cond_d3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/SearchSwipe;->lastRefresh:J

    invoke-virtual {p0, v2}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    iget-object p1, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    invoke-static {p1, p0}, Le/e/a/Followup3;->refresh(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_d6

    :cond_d3
    invoke-virtual {p0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    :goto_d6
    return v2

    :cond_d7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_ec

    iput-boolean v1, p0, Le/e/a/SearchSwipe;->dragging:Z

    iput-boolean v1, p0, Le/e/a/SearchSwipe;->eligible:Z

    invoke-virtual {p0}, Le/e/a/SearchSwipe;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    invoke-virtual {p0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    :cond_ec
    return v2
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 3

    .line 8
    if-eqz p1, :cond_b

    iget-boolean v0, p0, Le/e/a/SearchSwipe;->eligible:Z

    if-eqz v0, :cond_b

    iget-boolean v0, p0, Le/e/a/SearchSwipe;->refreshing:Z

    if-nez v0, :cond_b

    return-void

    :cond_b
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public setRefreshing(Z)V
    .registers 4

    .line 11
    iput-boolean p1, p0, Le/e/a/SearchSwipe;->refreshing:Z

    iget-object v0, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setAlpha(F)V

    iget-object v0, p0, Le/e/a/SearchSwipe;->progress:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_f

    const/4 p1, 0x0

    goto :goto_11

    :cond_f
    const/16 p1, 0x8

    :goto_11
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method
