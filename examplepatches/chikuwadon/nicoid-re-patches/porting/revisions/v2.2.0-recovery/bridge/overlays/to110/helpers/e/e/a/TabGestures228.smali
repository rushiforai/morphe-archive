.class public final Le/e/a/TabGestures228;
.super Ljava/lang/Object;
.source "TabGestures228.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/TabGestures228$Gesture;
    }
.end annotation


# static fields
.field static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/TabGestures228$Gesture;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabGestures228;->STATES:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static destroy(Landroid/app/Activity;)V
    .registers 2

    .line 10
    sget-object v0, Le/e/a/TabGestures228;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V

    return-void
.end method

.method static direction(FFF)Z
    .registers 5

    .line 8
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x42900000    # 72.0f

    mul-float/2addr p2, v1

    cmpl-float p2, v0, p2

    if-ltz p2, :cond_0

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const p2, 0x3fe66666    # 1.8f

    mul-float/2addr p1, p2

    cmpl-float p0, p0, p1

    if-lez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static horizontal(Landroid/view/View;FF)Z
    .registers 7

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_6

    float-to-int v2, p1

    float-to-int v3, p2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_2

    :cond_1
    instance-of v0, p0, Landroid/widget/HorizontalScrollView;

    const/4 v2, 0x1

    if-nez v0, :cond_5

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_5

    instance-of v0, p0, Le/e/a/Ui110$Swipe;

    if-nez v0, :cond_5

    instance-of v0, p0, Landroidx/viewpager/widget/ViewPager;

    if-nez v0, :cond_5

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v0

    if-nez v0, :cond_5

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_0
    if-gez v0, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2}, Le/e/a/TabGestures228;->horizontal(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_3

    return v2

    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_4
    :goto_1
    return v1

    :cond_5
    return v2

    :cond_6
    :goto_2
    return v1
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 3

    invoke-static {p0, p1}, Le/e/a/AppBarPlacement202;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    invoke-static {p0, p1}, Le/e/a/TabPager233;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
