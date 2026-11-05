.class public final Le/e/a/PlaybackTransfer;
.super Ljava/lang/Object;
.source "PlaybackTransfer.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    invoke-static {p0, p1, p2, p3}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static capture(Landroid/app/Activity;)Ljava/lang/Runnable;
    .registers 2

    invoke-static {p0}, Le/e/a/PlaybackHandoff110;->capture(Landroid/app/Activity;)Ljava/lang/Runnable;

    move-result-object v0

    return-object v0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0([ZLjava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;ILjava/lang/Object;Landroid/content/Intent;Z)V
    .registers 13

    .line 36
    const/4 v0, 0x0

    aget-boolean v1, p0, v0

    if-eqz v1, :cond_6

    return-void

    .line 37
    :cond_6
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    .line 38
    if-eqz p1, :cond_79

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_79

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_1b

    goto :goto_79

    .line 40
    :cond_1b
    :try_start_1b
    const-string v1, "v"

    invoke-static {p1, v1}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 41
    if-ne v1, p2, :cond_73

    const-string v2, "b0"

    invoke-static {v1, v2}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_30

    goto :goto_73

    .line 42
    :cond_30
    const-string v1, "t0"

    invoke-virtual {p4, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p4

    const/4 v1, 0x0

    invoke-virtual {p4, v1, p5}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 43
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    const-string p4, "V1"

    invoke-virtual {p2, p4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p2

    invoke-virtual {p2, v1, p6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    const-string p2, "e.e.a.v0"

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    const-string p4, "a"

    const/4 p5, 0x2

    new-array p6, p5, [Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    aput-object v2, p6, v0

    const-class v2, Landroid/content/Intent;

    const/4 v3, 0x1

    aput-object v2, p6, v3

    invoke-virtual {p2, p4, p6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    new-array p4, p5, [Ljava/lang/Object;

    aput-object p1, p4, v0

    aput-object p7, p4, v3

    invoke-virtual {p2, v1, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    aput-boolean v3, p0, v0

    .line 46
    if-eqz p8, :cond_6f

    invoke-static {p3}, Le/e/a/PlaybackReturn;->arm(Ljava/lang/String;)V

    .line 47
    :cond_6f
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_72} :catch_74

    .line 48
    goto :goto_78

    .line 41
    :cond_73
    :goto_73
    return-void

    .line 48
    :catch_74
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackTransfer;->log(Ljava/lang/Exception;)V

    .line 49
    :goto_78
    return-void

    .line 38
    :cond_79
    :goto_79
    return-void
.end method

.method private static log(Ljava/lang/Exception;)V
    .registers 3

    .line 12
    const-string v0, "nicoid-session"

    const-string v1, "Playback transfer failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
