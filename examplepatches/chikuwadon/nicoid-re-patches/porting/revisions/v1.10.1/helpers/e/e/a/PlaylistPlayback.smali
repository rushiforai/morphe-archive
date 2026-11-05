.class public final Le/e/a/PlaylistPlayback;
.super Ljava/lang/Object;
.source "PlaylistPlayback.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/app/Activity;Landroid/content/Intent;Ljava/util/ArrayList;IZ)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroid/content/Intent;",
            "Ljava/util/ArrayList<",
            "*>;IZ)V"
        }
    .end annotation

    const-string v0, "nicoid_explicit_queue110"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 18
    new-instance p0, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;

    invoke-direct {p0, p1, p2, p3}, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;-><init>(Landroid/content/Intent;Ljava/util/ArrayList;I)V

    invoke-static {p4, p0}, Le/e/a/PlaylistPlayback;->withMode(ZLjava/lang/Runnable;)V

    .line 28
    return-void
.end method

.method static synthetic lambda$0(Landroid/content/Intent;Ljava/util/ArrayList;I)V
    .registers 12

    .line 20
    :try_start_0
    const-string v0, "e.e.a.v0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 21
    const-string v1, "a"

    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Intent;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/util/ArrayList;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    .line 22
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x2

    aput-object v4, v3, v7

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x3

    aput-object v4, v3, v8

    .line 21
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 23
    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    aput-object p1, v1, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v1, v7

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    aput-object p0, v1, v8

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_39} :catch_3a

    .line 24
    goto :goto_42

    :catch_3a
    move-exception p0

    .line 25
    const-string p1, "nicoid-playlist"

    const-string p2, "Unable to attach folder playback queue"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 27
    :goto_42
    return-void
.end method

.method public static launchTap(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;IZZ)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "*>;IZZ)V"
        }
    .end annotation

    .line 34
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 35
    const-string v2, "videolist_tap"

    const-string v3, "0"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 34
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_11} :catch_12

    .line 35
    goto :goto_14

    .line 36
    :catch_12
    move-exception v1

    const/4 v1, 0x0

    .line 37
    :goto_14
    const/4 v2, 0x3

    if-ltz v1, :cond_19

    if-le v1, v2, :cond_1a

    :cond_19
    const/4 v1, 0x0

    .line 39
    :cond_1a
    const-string v3, "android.intent.action.VIEW"

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eq v1, v4, :cond_46

    if-ne v1, v2, :cond_23

    goto :goto_46

    .line 46
    :cond_23
    if-ne v1, v5, :cond_28

    const-string v6, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    goto :goto_2a

    .line 47
    :cond_28
    const-string v6, "com.sauzask.nicoid.NicoidVideoActivity"

    .line 46
    :goto_2a
    nop

    .line 48
    new-instance v7, Landroid/content/Intent;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v7, v3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v7, p0, v6}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 49
    if-nez v1, :cond_74

    const-string v3, "intentselect"

    invoke-virtual {p1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v3

    const-string v6, "title"

    invoke-virtual {v3, v6, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_74

    .line 40
    :cond_46
    :goto_46
    const-string v6, "^.*?/watch/(nm|sm|so|)([0-9]+).*?$"

    const-string v7, "$1$2"

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 41
    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 42
    nop

    .line 41
    const-string v3, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v6, p0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    .line 43
    const-string v6, "url"

    invoke-virtual {v3, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    if-ne v1, v2, :cond_64

    const/4 v3, 0x1

    goto :goto_65

    :cond_64
    const/4 v3, 0x0

    :goto_65
    const-string v6, "isBackgroundPlay"

    invoke-virtual {p1, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    .line 41
    nop

    .line 44
    if-ne v1, v2, :cond_74

    const-string v3, "tickerText"

    invoke-virtual {p1, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    nop

    .line 51
    :cond_74
    :goto_74
    if-eqz p5, :cond_79

    invoke-static {p0, p1, p3, p4, p6}, Le/e/a/PlaylistPlayback;->attach(Landroid/app/Activity;Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 52
    :cond_79
    if-eq v1, v4, :cond_82

    if-ne v1, v2, :cond_7e

    goto :goto_82

    .line 56
    :cond_7e
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_ac

    .line 53
    :cond_82
    :goto_82
    :try_start_82
    const-string p2, "e.e.a.v0"

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    const-string p3, "a"

    new-array p4, v4, [Ljava/lang/Class;

    const-class p5, Landroid/content/Context;

    aput-object p5, p4, v0

    .line 54
    const-class p5, Landroid/content/Intent;

    aput-object p5, p4, v5

    .line 53
    invoke-virtual {p2, p3, p4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    .line 54
    new-array p3, v4, [Ljava/lang/Object;

    aput-object p0, p3, v0

    aput-object p1, p3, v5

    const/4 p0, 0x0

    invoke-virtual {p2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_a2} :catch_a3

    goto :goto_ac

    .line 55
    :catch_a3
    move-exception p0

    const-string p1, "nicoid-playlist"

    const-string p2, "Unable to open selected playback mode"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    nop

    .line 57
    :goto_ac
    return-void
.end method

.method static withMode(ZLjava/lang/Runnable;)V
    .registers 8

    .line 60
    const-string v0, "Unable to restore playback mode"

    const-string v1, "nicoid-playlist"

    .line 61
    nop

    .line 63
    const/4 v2, 0x0

    :try_start_6
    const-string v3, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "J"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_12} :catch_28

    .line 64
    :try_start_12
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_1a} :catch_25

    .line 65
    if-eqz p0, :cond_1e

    const/4 p0, 0x2

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    :try_start_1f
    invoke-virtual {v3, v2, p0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_22} :catch_23

    .line 66
    goto :goto_30

    :catch_23
    move-exception p0

    goto :goto_2b

    :catch_25
    move-exception p0

    move-object v4, v2

    goto :goto_2b

    :catch_28
    move-exception p0

    move-object v3, v2

    move-object v4, v3

    .line 67
    :goto_2b
    const-string v5, "Unable to apply folder playback mode"

    invoke-static {v1, v5, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 69
    :goto_30
    :try_start_30
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_33
    .catchall {:try_start_30 .. :try_end_33} :catchall_42

    .line 70
    if-eqz v4, :cond_41

    :try_start_35
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-virtual {v3, v2, p0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_3c} :catch_3d

    goto :goto_41

    .line 71
    :catch_3d
    move-exception p0

    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 72
    :cond_41
    :goto_41
    return-void

    .line 70
    :catchall_42
    move-exception p0

    if-eqz v4, :cond_51

    :try_start_45
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v3, v2, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_4c} :catch_4d

    goto :goto_51

    .line 71
    :catch_4d
    move-exception p1

    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_51
    :goto_51
    throw p0
.end method
