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
    .registers 19

    .line 16
    move-object/from16 v0, p0

    const/4 v1, 0x0

    :try_start_3
    const-string v2, "background"

    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "app_switch_playback"

    const-string v5, "none"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_18

    return-object v1

    .line 17
    :cond_18
    const-string v2, "v"

    invoke-static {v0, v2}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 18
    if-nez v5, :cond_21

    return-object v1

    .line 19
    :cond_21
    const-string v2, "a0"

    invoke-static {v5, v2}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "g1"

    invoke-static {v5, v3}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 20
    if-eqz v9, :cond_de

    const-string v3, "d"

    invoke-static {v9, v3}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_de

    .line 21
    const-string v3, "isPlaying"

    const/4 v4, 0x0

    new-array v6, v4, [Ljava/lang/Class;

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v2, v3, v6, v7}, Le/e/a/PlaybackTransfer;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_4c

    goto/16 :goto_de

    .line 22
    :cond_4c
    const-string v3, "b0"

    invoke-static {v5, v3}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Ljava/lang/String;

    .line 23
    const-string v3, "getCurrentPosition"

    new-array v7, v4, [Ljava/lang/Class;

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v2, v3, v7, v8}, Le/e/a/PlaybackTransfer;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    long-to-int v8, v2

    .line 24
    const-string v2, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 25
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, v0, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "url"

    invoke-virtual {v2, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 26
    const-string v3, "nowpoti"

    invoke-virtual {v2, v3, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "isBackgroundPlay"

    const/4 v10, 0x1

    invoke-virtual {v2, v3, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    .line 25
    nop

    .line 27
    const-string v3, "C1"

    invoke-static {v5, v3}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 28
    if-eqz v3, :cond_d1

    const-string v11, "e.e.a.v0"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    const-string v12, "a"

    const/4 v13, 0x4

    new-array v14, v13, [Ljava/lang/Class;

    const-class v15, Landroid/content/Intent;

    aput-object v15, v14, v4

    const-class v15, Ljava/util/ArrayList;

    aput-object v15, v14, v10

    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v16, 0x2

    aput-object v15, v14, v16

    sget-object v15, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v17, 0x3

    aput-object v15, v14, v17

    invoke-virtual {v11, v12, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .line 29
    new-array v12, v13, [Ljava/lang/Object;

    aput-object v2, v12, v4

    aput-object v3, v12, v10

    const-string v3, "D1"

    invoke-static {v5, v3}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v12, v16

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v12, v17

    invoke-virtual {v11, v1, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    :cond_d1
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 31
    new-instance v0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;

    move-object v3, v0

    move-object v10, v2

    invoke-direct/range {v3 .. v10}, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;ILjava/lang/Object;Landroid/content/Intent;)V
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_dd} :catch_df

    return-object v0

    .line 21
    :cond_de
    :goto_de
    return-object v1

    .line 44
    :catch_df
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackTransfer;->log(Ljava/lang/Exception;)V

    return-object v1
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

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;ILjava/lang/Object;Landroid/content/Intent;)V
    .registers 11

    .line 32
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    .line 33
    if-eqz p0, :cond_70

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_70

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_70

    .line 35
    :cond_15
    :try_start_15
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 36
    if-ne v0, p1, :cond_6a

    const-string v1, "b0"

    invoke-static {v0, v1}, Le/e/a/PlaybackTransfer;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    goto :goto_6a

    .line 37
    :cond_2a
    const-string v0, "t0"

    invoke-virtual {p3, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p3

    const/4 v0, 0x0

    invoke-virtual {p3, v0, p4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string p3, "V1"

    invoke-virtual {p1, p3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, v0, p5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    const-string p1, "e.e.a.v0"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string p3, "a"

    const/4 p4, 0x2

    new-array p5, p4, [Ljava/lang/Class;

    const-class v1, Landroid/content/Context;

    const/4 v2, 0x0

    aput-object v1, p5, v2

    const-class v1, Landroid/content/Intent;

    const/4 v3, 0x1

    aput-object v1, p5, v3

    invoke-virtual {p1, p3, p5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array p3, p4, [Ljava/lang/Object;

    aput-object p0, p3, v2

    aput-object p6, p3, v3

    invoke-virtual {p1, v0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    invoke-static {p2}, Le/e/a/PlaybackReturn;->arm(Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_69} :catch_6b

    .line 42
    goto :goto_6f

    .line 36
    :cond_6a
    :goto_6a
    return-void

    .line 42
    :catch_6b
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackTransfer;->log(Ljava/lang/Exception;)V

    .line 43
    :goto_6f
    return-void

    .line 33
    :cond_70
    :goto_70
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
