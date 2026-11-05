.class public final Le/e/a/CommentClock;
.super Ljava/lang/Object;
.source "CommentClock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentClock$State;
    }
.end annotation


# static fields
.field private static final clocks:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentClock$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentClock;->clocks:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static playing(Ljava/lang/Object;)Z
    .registers 6
    .param p0, "view"    # Ljava/lang/Object;

    .line 26
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Le/e/a/CommentClock;->state(Ljava/lang/Object;)Le/e/a/CommentClock$State;

    move-result-object v1

    .local v1, "s":Le/e/a/CommentClock$State;
    iget-object v2, v1, Le/e/a/CommentClock$State;->provider:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .local v2, "source":Ljava/lang/Object;
    if-eqz v2, :cond_1e

    iget-object v3, v1, Le/e/a/CommentClock$State;->playing:Ljava/lang/reflect/Method;

    new-array v4, v0, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1b} :catch_1f

    if-eqz v3, :cond_1e

    const/4 v0, 0x1

    :cond_1e
    return v0

    .end local v1    # "s":Le/e/a/CommentClock$State;
    .end local v2    # "source":Ljava/lang/Object;
    :catch_1f
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    return v0
.end method

.method public static position(Ljava/lang/Object;)I
    .registers 13
    .param p0, "view"    # Ljava/lang/Object;

    .line 29
    const/4 v1, 0x0

    :try_start_1
    invoke-static {p0}, Le/e/a/CommentClock;->state(Ljava/lang/Object;)Le/e/a/CommentClock$State;

    move-result-object v0

    .local v0, "s":Le/e/a/CommentClock$State;
    iget-object v2, v0, Le/e/a/CommentClock$State;->provider:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .local v2, "source":Ljava/lang/Object;
    if-nez v2, :cond_e

    return v1

    .line 30
    :cond_e
    iget-object v3, v0, Le/e/a/CommentClock$State;->video:Ljava/lang/reflect/Field;

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .local v3, "player":Ljava/lang/Object;
    if-nez v3, :cond_19

    iget v4, v0, Le/e/a/CommentClock$State;->speed:F

    goto :goto_27

    :cond_19
    iget-object v4, v0, Le/e/a/CommentClock$State;->rate:Ljava/lang/reflect/Method;

    new-array v5, v1, [Ljava/lang/Object;

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    :goto_27
    move v9, v4

    .line 31
    .local v9, "actual":F
    iget-object v5, v0, Le/e/a/CommentClock$State;->clock:Le/e/a/CommentClockRules;

    iget-object v4, v0, Le/e/a/CommentClock$State;->position:Ljava/lang/reflect/Method;

    new-array v6, v1, [Ljava/lang/Object;

    invoke-virtual {v4, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    iget-object v4, v0, Le/e/a/CommentClock$State;->playing:Ljava/lang/reflect/Method;

    new-array v8, v1, [Ljava/lang/Object;

    invoke-virtual {v4, v2, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    invoke-virtual/range {v5 .. v11}, Le/e/a/CommentClockRules;->position(JZFJ)I

    move-result v1
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4e} :catch_4f

    return v1

    .line 32
    .end local v0    # "s":Le/e/a/CommentClock$State;
    .end local v2    # "source":Ljava/lang/Object;
    .end local v3    # "player":Ljava/lang/Object;
    .end local v9    # "actual":F
    :catch_4f
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    return v1
.end method

.method public static rate(Ljava/lang/Object;)F
    .registers 6
    .param p0, "view"    # Ljava/lang/Object;

    .line 25
    :try_start_0
    invoke-static {p0}, Le/e/a/CommentClock;->state(Ljava/lang/Object;)Le/e/a/CommentClock$State;

    move-result-object v0

    .local v0, "s":Le/e/a/CommentClock$State;
    iget-object v1, v0, Le/e/a/CommentClock$State;->provider:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .local v1, "source":Ljava/lang/Object;
    if-nez v1, :cond_e

    const/4 v2, 0x0

    goto :goto_14

    :cond_e
    iget-object v2, v0, Le/e/a/CommentClock$State;->video:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .local v2, "player":Ljava/lang/Object;
    :goto_14
    if-nez v2, :cond_19

    iget v3, v0, Le/e/a/CommentClock$State;->speed:F

    goto :goto_28

    :cond_19
    iget-object v3, v0, Le/e/a/CommentClock$State;->rate:Ljava/lang/reflect/Method;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    :goto_28
    return v3

    .end local v0    # "s":Le/e/a/CommentClock$State;
    .end local v1    # "source":Ljava/lang/Object;
    .end local v2    # "player":Ljava/lang/Object;
    :catch_29
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const/high16 v1, 0x3f800000    # 1.0f

    return v1
.end method

.method public static speed(Ljava/lang/Object;F)V
    .registers 5
    .param p0, "view"    # Ljava/lang/Object;
    .param p1, "speed"    # F

    .line 23
    :try_start_0
    invoke-static {p0}, Le/e/a/CommentClock;->state(Ljava/lang/Object;)Le/e/a/CommentClock$State;

    move-result-object v0

    .local v0, "s":Le/e/a/CommentClock$State;
    iput p1, v0, Le/e/a/CommentClock$State;->speed:F
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_7

    .end local v0    # "s":Le/e/a/CommentClock$State;
    goto :goto_f

    :catch_7
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "nicoid-clock"

    const-string v2, "Speed binding failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_f
    return-void
.end method

.method private static state(Ljava/lang/Object;)Le/e/a/CommentClock$State;
    .registers 4
    .param p0, "view"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    sget-object v0, Le/e/a/CommentClock;->clocks:Ljava/util/WeakHashMap;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/CommentClock;->clocks:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CommentClock$State;

    .local v1, "s":Le/e/a/CommentClock$State;
    if-nez v1, :cond_18

    new-instance v2, Le/e/a/CommentClock$State;

    invoke-direct {v2, p0}, Le/e/a/CommentClock$State;-><init>(Ljava/lang/Object;)V

    move-object v1, v2

    sget-object v2, Le/e/a/CommentClock;->clocks:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    monitor-exit v0

    return-object v1

    .end local v1    # "s":Le/e/a/CommentClock$State;
    :catchall_1a
    move-exception v1

    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_1a

    throw v1
.end method
