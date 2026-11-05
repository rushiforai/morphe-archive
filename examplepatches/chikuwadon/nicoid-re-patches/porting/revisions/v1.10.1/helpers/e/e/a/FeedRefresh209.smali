.class public final Le/e/a/FeedRefresh209;
.super Landroid/widget/FrameLayout;
.source "FeedRefresh209.java"


# instance fields
.field private final content:Landroid/view/View;

.field private horizontal:Z

.field private final refresh:Ljava/lang/Runnable;

.field private final refreshing:Ljava/lang/reflect/Method;

.field private final slop:I

.field final swipe:Landroid/view/ViewGroup;

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 12

    .line 13
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/FeedRefresh209;->content:Landroid/view/View;

    iput-object p3, p0, Le/e/a/FeedRefresh209;->refresh:Ljava/lang/Runnable;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    iput p2, p0, Le/e/a/FeedRefresh209;->slop:I

    .line 15
    :try_start_11
    const-string p2, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    .line 16
    const-class p3, Landroid/content/Context;

    const-class v0, Landroid/util/AttributeSet;

    filled-new-array {p3, v0}, [Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p3

    const/4 v0, 0x0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    iput-object p3, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    .line 17
    iget-object p3, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    invoke-virtual {p3, p0}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    const-string p3, "setRefreshing"

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2, p3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    iput-object p3, p0, Le/e/a/FeedRefresh209;->refreshing:Ljava/lang/reflect/Method;

    .line 18
    invoke-virtual {p2}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object p3

    array-length v1, p3
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_48} :catch_118

    const/4 v2, 0x0

    move v3, v2

    :goto_4a
    const-string v4, "setOnRefreshListener"

    if-lt v3, v1, :cond_4f

    goto :goto_64

    :cond_4f
    :try_start_4f
    aget-object v5, p3, v3

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_114

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    array-length v6, v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_114

    move-object v0, v5

    .line 19
    :goto_64
    if-eqz v0, :cond_10e

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object p3

    aget-object p3, p3, v2

    .line 20
    invoke-virtual {p3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    filled-new-array {p3}, [Ljava/lang/Class;

    move-result-object p3

    new-instance v2, Le/e/a/FeedRefresh209$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Le/e/a/FeedRefresh209$$ExternalSyntheticLambda1;-><init>(Le/e/a/FeedRefresh209;)V

    invoke-static {v1, p3, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p3

    .line 23
    iget-object v1, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {v0, v1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    const-string p3, "setColorSchemeColors"

    const-class v0, [I

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    iget-object v0, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    filled-new-array {v1}, [I

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    const-string p3, "setProgressBackgroundColorSchemeColor"

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    iget-object v0, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    invoke-static {p1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_bb

    const v1, -0xd6d4cf

    goto :goto_be

    :cond_bb
    const v1, -0x50506

    :goto_be
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    const-string p3, "setDistanceToTriggerSync"

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    iget-object p3, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    const/16 v0, 0x40

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    new-instance p2, Le/e/a/FeedRefresh209$1;

    invoke-direct {p2, p0, p1}, Le/e/a/FeedRefresh209$1;-><init>(Le/e/a/FeedRefresh209;Landroid/content/Context;)V

    .line 30
    iget-object p1, p0, Le/e/a/FeedRefresh209;->content:Landroid/view/View;

    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p3, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    new-instance p3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p3, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, p2}, Le/e/a/FeedRefresh209;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    nop

    .line 32
    return-void

    .line 19
    :cond_10e
    new-instance p1, Ljava/lang/NoSuchMethodException;

    invoke-direct {p1, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_114
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_114} :catch_118

    .line 18
    :cond_114
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_4a

    .line 31
    :catch_118
    move-exception p1

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "Cannot initialize native feed refresh"

    invoke-direct {p2, p3, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static accept(Ljava/lang/Object;ZZ)V
    .registers 3

    .line 35
    if-eqz p1, :cond_20

    if-eqz p2, :cond_20

    instance-of p1, p0, Landroid/view/View;

    if-nez p1, :cond_9

    goto :goto_20

    :cond_9
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Le/e/a/FeedRefresh209;

    if-eqz p1, :cond_20

    move-object p1, p0

    check-cast p1, Le/e/a/FeedRefresh209;

    iget-object p1, p1, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    new-instance p2, Le/e/a/FeedRefresh209$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0}, Le/e/a/FeedRefresh209$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    :cond_20
    :goto_20
    return-void
.end method

.method static synthetic access$0(Le/e/a/FeedRefresh209;)Z
    .registers 1

    .line 12
    iget-boolean p0, p0, Le/e/a/FeedRefresh209;->horizontal:Z

    return p0
.end method

.method static synthetic access$1(Le/e/a/FeedRefresh209;)Landroid/view/View;
    .registers 1

    .line 11
    iget-object p0, p0, Le/e/a/FeedRefresh209;->content:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$2(Landroid/view/View;I)Z
    .registers 2

    .line 33
    invoke-static {p0, p1}, Le/e/a/FeedRefresh209;->scrolls(Landroid/view/View;I)Z

    move-result p0

    return p0
.end method

.method private dispatch()V
    .registers 6

    .line 36
    const-string v0, "I"

    const/4 v1, 0x0

    :try_start_3
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v3, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    const-string v4, "c"

    invoke-static {v3, v4}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v3, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    invoke-static {v3, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_22

    goto :goto_31

    :cond_22
    iget-object v2, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v0, v3}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/FeedRefresh209;->refresh:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_30} :catch_32

    goto :goto_3d

    :cond_31
    :goto_31
    return-void

    :catch_32
    move-exception v0

    invoke-virtual {p0, v1}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    const-string v1, "nicoid-feed"

    const-string v2, "Cannot dispatch feed refresh"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3d
    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;)V
    .registers 1

    .line 35
    check-cast p0, Le/e/a/FeedRefresh209;

    invoke-direct {p0}, Le/e/a/FeedRefresh209;->dispatch()V

    return-void
.end method

.method private static scrolls(Landroid/view/View;I)Z
    .registers 6

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_10

    return v2

    :cond_10
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2c

    check-cast p0, Landroid/view/ViewGroup;

    move v0, v1

    :goto_17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-lt v0, v3, :cond_1e

    goto :goto_2c

    :cond_1e
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Le/e/a/FeedRefresh209;->scrolls(Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_29

    return v2

    :cond_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    :cond_2c
    :goto_2c
    return v1
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-FeedRefresh209(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 21
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    if-ne v0, v1, :cond_3c

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hashCode"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :cond_1d
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p2

    const-string v0, "equals"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_39

    const/4 p2, 0x0

    aget-object p3, p3, p2

    if-ne p1, p3, :cond_34

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_34
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_39
    const-string p1, "Feed refresh listener"

    return-object p1

    .line 22
    :cond_3c
    iget-object p1, p0, Le/e/a/FeedRefresh209;->refresh:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    return-object p1
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_16

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Le/e/a/FeedRefresh209;->x:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Le/e/a/FeedRefresh209;->y:F

    iput-boolean v1, p0, Le/e/a/FeedRefresh209;->horizontal:Z

    goto :goto_4c

    :cond_16
    const/4 v2, 0x2

    if-ne v0, v2, :cond_4c

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v2, p0, Le/e/a/FeedRefresh209;->x:F

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v2, p0, Le/e/a/FeedRefresh209;->slop:I

    int-to-float v2, v2

    cmpl-float v0, v0, v2

    if-lez v0, :cond_4c

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v2, p0, Le/e/a/FeedRefresh209;->x:F

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v2, p0, Le/e/a/FeedRefresh209;->y:F

    sub-float/2addr p1, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v2, 0x3fa66666    # 1.3f

    mul-float/2addr p1, v2

    cmpl-float p1, v0, p1

    if-lez p1, :cond_4c

    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/FeedRefresh209;->horizontal:Z

    :cond_4c
    :goto_4c
    return v1
.end method

.method public setRefreshing(Z)V
    .registers 4

    .line 37
    :try_start_0
    iget-object v0, p0, Le/e/a/FeedRefresh209;->refreshing:Ljava/lang/reflect/Method;

    iget-object v1, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    goto :goto_18

    :catch_10
    move-exception p1

    const-string v0, "nicoid-feed"

    const-string v1, "Cannot update native refresh state"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_18
    return-void
.end method
