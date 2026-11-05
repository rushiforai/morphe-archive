.class public final Le/e/a/SearchSwipe;
.super Landroid/widget/FrameLayout;
.source "SearchSwipe.java"


# instance fields
.field final fragment:Ljava/lang/Object;

.field final list:Landroid/widget/ListView;

.field refreshing:Z

.field final swipe:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/Object;Landroid/widget/ListView;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 7
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/SearchSwipe;->list:Landroid/widget/ListView;

    .line 8
    const-string p2, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    .line 9
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Landroid/util/AttributeSet;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-virtual {p2, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const/4 v2, 0x0

    aput-object v2, v0, v4

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    .line 10
    iget-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p3, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p3, v0}, Le/e/a/SearchSwipe;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 11
    invoke-virtual {p2}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object p3

    array-length v0, p3

    const/4 v1, 0x0

    :goto_4d
    if-lt v1, v0, :cond_50

    goto :goto_7f

    :cond_50
    aget-object v2, p3, v1

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "setOnRefreshListener"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e2

    .line 12
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object p3

    aget-object p3, p3, v3

    .line 13
    iget-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    invoke-virtual {p3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    new-array v5, v4, [Ljava/lang/Class;

    aput-object p3, v5, v3

    new-instance p3, Le/e/a/SearchSwipe$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0}, Le/e/a/SearchSwipe$$ExternalSyntheticLambda1;-><init>(Le/e/a/SearchSwipe;)V

    invoke-static {v1, v5, p3}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p3

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p3, v1, v3

    invoke-virtual {v2, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    nop

    .line 18
    :goto_7f
    new-array p3, v4, [Ljava/lang/Class;

    const-class v0, [I

    aput-object v0, p3, v3

    const-string v0, "setColorSchemeColors"

    invoke-virtual {p2, v0, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    iget-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    filled-new-array {v1}, [I

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    aput-object v1, v2, v3

    invoke-virtual {p3, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    new-array p3, v4, [Ljava/lang/Class;

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v0, p3, v3

    const-string v0, "setProgressBackgroundColorSchemeColor"

    invoke-virtual {p2, v0, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    iget-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_b6

    const v2, -0xd6d4cf

    goto :goto_b9

    :cond_b6
    const v2, -0x50506

    :goto_b9
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p3, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    new-array p3, v4, [Ljava/lang/Class;

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v0, p3, v3

    const-string v0, "setDistanceToTriggerSync"

    invoke-virtual {p2, v0, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    iget-object p3, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    const/16 v0, 0x40

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-array v0, v4, [Ljava/lang/Object;

    aput-object p1, v0, v3

    invoke-virtual {p2, p3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    return-void

    .line 11
    :cond_e2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_4d
.end method

.method public static install(Ljava/lang/Object;)V
    .registers 9

    .line 25
    :try_start_0
    const-string v0, "d0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SearchSwipe;->refreshable(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    return-void

    .line 26
    :cond_11
    const-string v0, "b0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    if-eqz v0, :cond_90

    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-nez v1, :cond_25

    goto/16 :goto_90

    .line 27
    :cond_25
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    instance-of v2, v1, Le/e/a/SearchSwipe;

    if-nez v2, :cond_8f

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Le/e/a/SearchSwipe;

    if-eqz v2, :cond_38

    goto :goto_8f

    .line 28
    :cond_38
    nop

    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_51

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    move-object v3, v1

    goto :goto_53

    :cond_51
    move-object v3, v0

    move-object v2, v1

    .line 30
    :goto_53
    if-nez v2, :cond_56

    return-void

    :cond_56
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 31
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_61} :catch_91

    .line 32
    :try_start_61
    new-instance v6, Le/e/a/SearchSwipe;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7, p0, v0}, Le/e/a/SearchSwipe;-><init>(Landroid/content/Context;Ljava/lang/Object;Landroid/widget/ListView;)V

    if-eq v3, v0, :cond_6f

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_6f
    invoke-virtual {v2, v6, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_72} :catch_73

    goto :goto_99

    .line 33
    :catch_73
    move-exception p0

    :try_start_74
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_85

    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_85
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    throw p0
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_74 .. :try_end_8f} :catch_91

    .line 27
    :cond_8f
    :goto_8f
    return-void

    .line 26
    :cond_90
    :goto_90
    return-void

    .line 34
    :catch_91
    move-exception p0

    const-string v0, "nicoid-refresh"

    const-string v1, "Refresh binding failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_99
    return-void
.end method

.method static refreshable(Ljava/lang/String;)Z
    .registers 2

    .line 23
    if-eqz p0, :cond_34

    const-string v0, "/search/video"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "nicovideo.jp/search/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "nicovideo.jp/tag/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "/ranking/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "/by_ranking"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "/watch/history"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_34

    :cond_32
    const/4 p0, 0x1

    return p0

    :cond_34
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method begin()V
    .registers 2

    .line 22
    iget-boolean v0, p0, Le/e/a/SearchSwipe;->refreshing:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/SearchSwipe;->refreshing:Z

    iget-object v0, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    invoke-static {v0, p0}, Le/e/a/Refresh192;->start(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public c()V
    .registers 2

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-SearchSwipe(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 14
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
    const-string p1, "NicoidRefresh"

    return-object p1

    .line 15
    :cond_3c
    invoke-virtual {p0}, Le/e/a/SearchSwipe;->begin()V

    const/4 p1, 0x0

    return-object p1
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 40
    iget-object v0, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/Refresh192;->detach(Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    .line 35
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    .line 36
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2

    .line 37
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public setRefreshing(Z)V
    .registers 8

    .line 39
    iput-boolean p1, p0, Le/e/a/SearchSwipe;->refreshing:Z

    :try_start_2
    iget-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setRefreshing"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_23} :catch_24

    goto :goto_25

    :catch_24
    move-exception p1

    :goto_25
    return-void
.end method
