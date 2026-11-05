.class public final Le/e/a/PlaybackHandoff110;
.super Ljava/lang/Object;
.source "PlaybackHandoff110.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static capture(Landroid/app/Activity;)Ljava/lang/Runnable;
    .registers 14

    .line 5
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "app_switch_playback"

    const-string v3, "none"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "background"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1e

    const-string v2, "popup"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return-object v0

    :cond_1e
    if-nez v7, :cond_27

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_27

    return-object v0

    :cond_27
    const-string v1, "v"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    const-string v1, "a0"

    invoke-static {v5, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    const-string v1, "b0"

    invoke-static {v5, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v1, "getCurrentPosition"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v9, v1, v3, v4}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v10

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "isPlaying"

    new-array v4, v2, [Ljava/lang/Class;

    new-array v8, v2, [Ljava/lang/Object;

    invoke-static {v9, v3, v4, v8}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v8
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_5e} :catch_97

    const/high16 v1, 0x3f800000    # 1.0f

    :try_start_60
    const-string v3, "getPlaybackSpeed"

    new-array v4, v2, [Ljava/lang/Class;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v9, v3, v4, v2}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_70} :catch_71

    goto :goto_73

    :catch_71
    move-exception v2

    move v2, v1

    :goto_73
    :try_start_73
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_87

    invoke-static {v2}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v3

    if-nez v3, :cond_87

    const/4 v3, 0x0

    cmpg-float v3, v2, v3

    if-gtz v3, :cond_85

    goto :goto_87

    :cond_85
    move v12, v2

    goto :goto_88

    :cond_87
    :goto_87
    move v12, v1

    :goto_88
    if-nez v8, :cond_8b

    return-object v0

    :cond_8b
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;

    move-object v3, p0

    invoke-direct/range {v3 .. v12}, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;ZZLjava/lang/Object;JF)V
    :try_end_96
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_96} :catch_97

    return-object p0

    :catch_97
    move-exception p0

    const-string v1, "nicoid-transfer"

    const-string v2, "Cannot capture app exit"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;ZZLjava/lang/Object;JF)V
    .registers 13

    .line 5
    const-string v0, "playing"

    const-string v1, "position"

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_b7

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_b7

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_1a

    goto/16 :goto_b7

    :cond_1a
    :try_start_1a
    const-string v2, "v"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_ae

    const-string p0, "b0"

    invoke-static {p1, p0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    goto/16 :goto_ae

    :cond_34
    invoke-static {p1, p3}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    move-result p0

    if-nez p0, :cond_3b

    return-void

    :cond_3b
    const/4 p0, 0x0

    if-eqz p4, :cond_64

    invoke-static {p1}, Le/e/a/PlaybackSession;->allowRetry(Ljava/lang/Object;)Z

    move-result p1
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_42} :catch_af

    if-eqz p1, :cond_64

    :try_start_44
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string p2, "audioFocusHelper"

    invoke-static {p5, p2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    const-string p3, "pausedForLoss"

    invoke-static {p2, p3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_56} :catch_57

    goto :goto_59

    :catch_57
    move-exception p1

    move p1, p0

    :goto_59
    if-nez p1, :cond_64

    :try_start_5b
    const-string p1, "start"

    new-array p2, p0, [Ljava/lang/Class;

    new-array p3, p0, [Ljava/lang/Object;

    invoke-static {p5, p1, p2, p3}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_64
    const-class p1, Le/e/a/PlaybackTransfer221;

    const-string p2, "pending"

    invoke-virtual {p1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_b7

    const-string p3, "speed"

    filled-new-array {v1, v0, p3}, [Ljava/lang/String;

    move-result-object p3

    :goto_7d
    const/4 p5, 0x3

    if-lt p0, p5, :cond_81

    goto :goto_b7

    :cond_81
    aget-object p5, p3, p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {p5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_99

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    goto :goto_a8

    :cond_99
    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_a4

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p5

    goto :goto_a8

    :cond_a4
    invoke-static {p8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    :goto_a8
    invoke-virtual {v2, p1, p5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_ab
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_ab} :catch_af

    add-int/lit8 p0, p0, 0x1

    goto :goto_7d

    :cond_ae
    :goto_ae
    return-void

    :catch_af
    move-exception p0

    const-string p1, "nicoid-transfer"

    const-string p2, "Deferred handoff failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_b7
    :goto_b7
    return-void
.end method
