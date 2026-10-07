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

    .line 6
    if-eqz p1, :cond_3d

    if-nez p2, :cond_5

    goto :goto_3d

    :cond_5
    :try_start_5
    const-string p1, "c"

    invoke-static {p0, p1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_14

    return-void

    :cond_14
    const-string p1, "b"

    invoke-static {p0, p1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_38

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    const-string v0, "e.e.a.PullRefresh"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2d

    goto :goto_38

    :cond_2d
    sget-object p2, Le/e/a/RefreshDispatch;->main:Landroid/os/Handler;

    new-instance v0, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_37} :catch_39

    goto :goto_3d

    :cond_38
    :goto_38
    return-void

    :catch_39
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :cond_3d
    :goto_3d
    return-void
.end method

.method public static enter(Ljava/lang/Object;)V
    .registers 3

    .line 7
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
    const-string p0, "refresh callback entered"

    invoke-static {p0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$accept$0(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 6
    const-string v0, "I"

    :try_start_2
    const-string v1, "c"

    invoke-static {p0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1d

    goto :goto_34

    :cond_1d
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p0, v0, v2}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "refresh gesture accepted"

    invoke-static {v0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    const-string v0, "a"

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v2, v1}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_33} :catch_35

    goto :goto_5a

    :cond_34
    :goto_34
    return-void

    :catch_35
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refresh dispatch failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Followup3;->record(Ljava/lang/String;)V

    invoke-static {p0}, Le/e/a/RefreshDispatch;->stop(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_5a
    return-void
.end method

.method public static stop(Ljava/lang/Object;)V
    .registers 4

    .line 8
    instance-of v0, p0, Le/e/a/SearchSwipe;

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    check-cast p0, Le/e/a/SearchSwipe;

    invoke-virtual {p0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return-void

    :cond_b
    invoke-static {p0}, Le/e/a/FeedbackFixes;->stop(Ljava/lang/Object;)V

    :try_start_e
    const-string v0, "I"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p0, v0, v2}, Le/e/a/FeedbackFixes;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "c"

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v2, v1}, Le/e/a/FeedbackFixes;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_20} :catch_21

    goto :goto_25

    :catch_21
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_25
    return-void
.end method
