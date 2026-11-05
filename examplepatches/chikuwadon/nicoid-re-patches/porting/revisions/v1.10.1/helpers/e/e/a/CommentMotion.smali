.class public final Le/e/a/CommentMotion;
.super Ljava/lang/Object;
.source "CommentMotion.java"


# static fields
.field private static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentMotionRules;",
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

    sput-object v0, Le/e/a/CommentMotion;->states:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fps(Ljava/lang/Object;)I
    .registers 5

    .line 11
    :try_start_0
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "comment_fps"

    const-string v2, "60"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x78

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ChormecastSenderService"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "comment_cast_min"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_4b

    const/16 v1, 0x1e

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_4b
    invoke-static {p0, v0}, Le/e/a/CommentDisplay;->request(Landroid/view/View;I)V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4e} :catch_4f

    return v0

    :catch_4f
    move-exception p0

    const/16 p0, 0x3c

    return p0
.end method

.method public static frame(Ljava/lang/Object;)V
    .registers 7

    .line 7
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {p0}, Le/e/a/CommentClock;->position(Ljava/lang/Object;)I

    move-result v3

    invoke-static {p0}, Le/e/a/CommentClock;->rate(Ljava/lang/Object;)F

    move-result v4

    invoke-static {p0}, Le/e/a/CommentClock;->playing(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentMotionRules;->frame(JIFZ)V

    return-void
.end method

.method public static generation(Ljava/lang/Object;)J
    .registers 3

    .line 8
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;

    move-result-object p0

    invoke-virtual {p0}, Le/e/a/CommentMotionRules;->generation()J

    move-result-wide v0

    return-wide v0
.end method

.method public static nowQ16()J
    .registers 8

    .line 13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    div-long v4, v0, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    rem-long/2addr v0, v2

    const-wide/32 v6, 0x10000

    mul-long/2addr v0, v6

    div-long/2addr v0, v2

    add-long/2addr v4, v0

    return-wide v4
.end method

.method public static period(Ljava/lang/Object;)J
    .registers 5

    .line 16
    invoke-static {p0}, Le/e/a/CommentMotion;->fps(Ljava/lang/Object;)I

    move-result p0

    int-to-long v0, p0

    const-wide/32 v2, 0x3e80000

    div-long/2addr v2, v0

    return-wide v2
.end method

.method public static position(Ljava/lang/Object;)F
    .registers 1

    .line 9
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;

    move-result-object p0

    invoke-virtual {p0}, Le/e/a/CommentMotionRules;->position()F

    move-result p0

    return p0
.end method

.method public static sleepQ16(J)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 15
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_3c

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gtz v2, :cond_d

    return-void

    :cond_d
    const/16 v2, 0x10

    shr-long v3, p0, v2

    const-wide/32 v5, 0xf4240

    mul-long/2addr v3, v5

    const-wide/32 v7, 0xffff

    and-long/2addr p0, v7

    mul-long/2addr p0, v5

    shr-long/2addr p0, v2

    add-long/2addr v3, p0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide p0

    add-long/2addr p0, v3

    :goto_21
    cmp-long v2, v3, v0

    if-gtz v2, :cond_26

    return-void

    :cond_26
    invoke-static {v3, v4}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2

    if-nez v2, :cond_36

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long v3, p0, v2

    goto :goto_21

    :cond_36
    new-instance p0, Ljava/lang/InterruptedException;

    invoke-direct {p0}, Ljava/lang/InterruptedException;-><init>()V

    throw p0

    :cond_3c
    new-instance p0, Ljava/lang/InterruptedException;

    invoke-direct {p0}, Ljava/lang/InterruptedException;-><init>()V

    throw p0
.end method

.method public static start(Ljava/lang/Object;Ljava/lang/Object;F)F
    .registers 3

    .line 10
    invoke-static {p0}, Le/e/a/CommentMotion;->state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Le/e/a/CommentMotionRules;->start(Ljava/lang/Object;F)F

    move-result p0

    return p0
.end method

.method private static declared-synchronized state(Ljava/lang/Object;)Le/e/a/CommentMotionRules;
    .registers 4

    const-class v0, Le/e/a/CommentMotion;

    monitor-enter v0

    .line 6
    :try_start_3
    sget-object v1, Le/e/a/CommentMotion;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CommentMotionRules;

    if-nez v1, :cond_17

    new-instance v1, Le/e/a/CommentMotionRules;

    invoke-direct {v1}, Le/e/a/CommentMotionRules;-><init>()V

    sget-object v2, Le/e/a/CommentMotion;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_19

    :cond_17
    monitor-exit v0

    return-object v1

    .line 6
    :catchall_19
    move-exception p0

    :try_start_1a
    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    throw p0
.end method
