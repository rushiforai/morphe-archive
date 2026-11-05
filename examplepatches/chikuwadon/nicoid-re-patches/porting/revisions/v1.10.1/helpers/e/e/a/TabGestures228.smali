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

    if-ltz p2, :cond_1d

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const p2, 0x3fe66666    # 1.8f

    mul-float/2addr p1, p2

    cmpl-float p0, p0, p1

    if-lez p0, :cond_1d

    const/4 p0, 0x1

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method static horizontal(Landroid/view/View;FF)Z
    .registers 7

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_64

    float-to-int v2, p1

    float-to-int v3, p2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_1c

    goto :goto_64

    :cond_1c
    instance-of v0, p0, Landroid/widget/HorizontalScrollView;

    const/4 v2, 0x1

    if-nez v0, :cond_63

    instance-of v0, p0, Landroid/widget/SeekBar;

    if-nez v0, :cond_63

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "Ui110$Swipe"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_63

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "ViewPager"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_46

    goto :goto_63

    :cond_46
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_62

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_51
    if-gez v0, :cond_54

    goto :goto_62

    :cond_54
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2}, Le/e/a/TabGestures228;->horizontal(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_5f

    return v2

    :cond_5f
    add-int/lit8 v0, v0, -0x1

    goto :goto_51

    :cond_62
    :goto_62
    return v1

    :cond_63
    :goto_63
    return v2

    :cond_64
    :goto_64
    return v1
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 2

    .line 9
    invoke-static {p0, p1}, Le/e/a/TabPager233;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
