.class public final Le/e/a/RefreshDispatch;
.super Ljava/lang/Object;
.source "RefreshDispatch.java"


# static fields
.field static final main:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/RefreshDispatch;->main:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accept(Ljava/lang/Object;ZZ)V
    .registers 4

    invoke-static {p0, p1, p2}, Le/e/a/FeedRefresh209;->accept(Ljava/lang/Object;ZZ)V

    .line 7
    if-eqz p1, :cond_4e

    if-nez p2, :cond_8

    goto :goto_4e

    .line 8
    :cond_8
    instance-of p1, p0, Landroid/view/View;

    if-eqz p1, :cond_14

    move-object p1, p0

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    goto :goto_15

    :cond_14
    const/4 p1, 0x0

    .line 9
    :goto_15
    instance-of p2, p1, Le/e/a/SearchSwipe;

    if-eqz p2, :cond_24

    .line 10
    sget-object p2, Le/e/a/RefreshDispatch;->main:Landroid/os/Handler;

    new-instance v0, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 12
    :cond_24
    :try_start_24
    const-string p1, "b"

    invoke-static {p0, p1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_48

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    const-string v0, "e.e.a.PullRefresh"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3d

    goto :goto_48

    .line 13
    :cond_3d
    sget-object p2, Le/e/a/RefreshDispatch;->main:Landroid/os/Handler;

    new-instance v0, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_47} :catch_49

    .line 14
    goto :goto_4d

    .line 12
    :cond_48
    :goto_48
    return-void

    .line 14
    :catch_49
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    .line 15
    :goto_4d
    return-void

    .line 7
    :cond_4e
    :goto_4e
    return-void
.end method

.method public static enter(Ljava/lang/Object;)V
    .registers 3

    .line 16
    :try_start_0
    const-string v0, "I"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    goto :goto_f

    :catch_b
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_f
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 10
    const-string v0, "I"

    :try_start_2
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "c"

    invoke-static {p0, v2}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    check-cast p1, Le/e/a/SearchSwipe;

    invoke-virtual {p1}, Le/e/a/SearchSwipe;->begin()V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_29} :catch_2a

    goto :goto_31

    :catch_2a
    move-exception p1

    invoke-static {p0}, Le/e/a/RefreshDispatch;->stop(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :cond_31
    :goto_31
    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 13
    const-string v0, "I"

    :try_start_2
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "c"

    invoke-static {p0, v2}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p0, v0, v2}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "a"

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v2, v1}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2d} :catch_2e

    goto :goto_35

    :catch_2e
    move-exception p1

    invoke-static {p0}, Le/e/a/RefreshDispatch;->stop(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :cond_35
    :goto_35
    return-void
.end method

.method public static stop(Ljava/lang/Object;)V
    .registers 7

    .line 17
    instance-of v0, p0, Le/e/a/SearchSwipe;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v0, :cond_f

    check-cast p0, Le/e/a/SearchSwipe;

    invoke-virtual {p0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return-void

    :cond_f
    :try_start_f
    const-string v0, "I"

    invoke-static {p0, v0, v2}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "setRefreshing"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v1

    invoke-static {p0, v0, v4, v3}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_24} :catch_25

    goto :goto_29

    :catch_25
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_29
    return-void
.end method
