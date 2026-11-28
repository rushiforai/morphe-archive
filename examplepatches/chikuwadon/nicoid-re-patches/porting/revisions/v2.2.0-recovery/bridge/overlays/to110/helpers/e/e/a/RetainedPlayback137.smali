.class public final Le/e/a/RetainedPlayback137;
.super Ljava/lang/Object;
.source "RetainedPlayback137.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/RetainedPlayback137$Session;,
        Le/e/a/RetainedPlayback137$VideoMetadata;
    }
.end annotation


# static fields
.field private static final CHANNEL:Ljava/lang/String; = "nicoid_retained_audio"

.field private static final EXTRA:Ljava/lang/String; = "nicoid_retained_player_137"

.field private static final MAIN:Landroid/os/Handler;

.field private static final NOTIFICATION:I = 0x359c

.field private static final TAG:Ljava/lang/String; = "nicoid-retained"

.field private static current:Le/e/a/RetainedPlayback137$Session;

.field private static serial:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 36
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/RetainedPlayback137;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()J
    .registers 2

    .line 38
    sget-wide v0, Le/e/a/RetainedPlayback137;->serial:J

    return-wide v0
.end method

.method static synthetic access$1(J)V
    .registers 2

    .line 38
    sput-wide p0, Le/e/a/RetainedPlayback137;->serial:J

    return-void
.end method

.method static synthetic access$2(Ljava/lang/Object;)J
    .registers 3

    .line 69
    invoke-static {p0}, Le/e/a/RetainedPlayback137;->position(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$3(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V
    .registers 2

    .line 315
    invoke-static {p0, p1}, Le/e/a/RetainedPlayback137;->send(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4(Le/e/a/RetainedPlayback137$Session;)Z
    .registers 1

    .line 73
    invoke-static {p0}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$5(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 63
    invoke-static {p0, p1}, Le/e/a/RetainedPlayback137;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$6()Landroid/os/Handler;
    .registers 1

    .line 36
    sget-object v0, Le/e/a/RetainedPlayback137;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$7(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;)V
    .registers 2

    .line 321
    invoke-static {p0, p1}, Le/e/a/RetainedPlayback137;->notifyPlayback(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;)V

    return-void
.end method

.method private static action(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;I)Landroid/app/PendingIntent;
    .registers 7

    .line 310
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 311
    const-string v1, "nicoid_retained_player_137"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    const-string v0, "nicoid_retained_token_137"

    iget-wide v1, p1, Le/e/a/RetainedPlayback137$Session;->token:J

    invoke-virtual {p2, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    const/high16 p2, 0xc000000

    .line 312
    invoke-static {p0, p3, p1, p2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method private static call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized cancelExternal(Landroid/app/Activity;)V
    .registers 4

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 128
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    if-eqz v1, :cond_0

    .line 129
    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    if-ne v2, p0, :cond_0

    iget-boolean p0, v1, Le/e/a/RetainedPlayback137$Session;->committed:Z

    if-nez p0, :cond_0

    const/4 p0, 0x0

    invoke-static {v1, p0}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public static declared-synchronized capture(Landroid/app/Activity;)Ljava/lang/Runnable;
    .registers 3

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    const/4 v1, 0x0

    .line 91
    :try_start_0
    invoke-static {p0, v1}, Le/e/a/RetainedPlayback137;->captureInternal(Landroid/app/Activity;Z)Ljava/lang/Runnable;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public static declared-synchronized captureForExternal(Landroid/app/Activity;)Ljava/lang/Runnable;
    .registers 3

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    const/4 v1, 0x1

    .line 95
    :try_start_0
    invoke-static {p0, v1}, Le/e/a/RetainedPlayback137;->captureInternal(Landroid/app/Activity;Z)Ljava/lang/Runnable;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static declared-synchronized captureInternal(Landroid/app/Activity;Z)Ljava/lang/Runnable;
    .registers 10

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    const/4 v1, 0x0

    if-eqz p0, :cond_7

    .line 98
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_7

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_7

    if-nez p1, :cond_0

    invoke-static {p0}, Le/e/a/RetainedPlayback137;->enabled(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 99
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    .line 100
    const-string v2, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 101
    const-string v2, "com.sauzask.nicoid.intent.NicoidVideoActivityIntent"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_1

    monitor-exit v0

    return-object v1

    .line 103
    :cond_1
    :try_start_1
    invoke-static {p0}, Le/e/a/PlaybackRouting25;->owner(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    move-object v2, v1

    goto :goto_0

    :cond_2
    const-string v2, "a0"

    invoke-static {p1, v2}, Le/e/a/RetainedPlayback137;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    :goto_0
    if-eqz v2, :cond_6

    .line 104
    invoke-static {v2}, Le/e/a/RetainedPlayback137;->playing(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    const-string v3, "getDuration"

    invoke-static {v2, v3}, Le/e/a/RetainedPlayback137;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_6

    .line 105
    const-string v3, "b0"

    invoke-static {p1, v3}, Le/e/a/RetainedPlayback137;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 106
    const-string v4, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_3

    monitor-exit v0

    return-object v1

    .line 107
    :cond_3
    :try_start_2
    sget-object v4, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    invoke-static {v4}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v4

    if-eqz v4, :cond_5

    sget-object p1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    iget-object p1, p1, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    if-ne p1, p0, :cond_4

    new-instance p0, Le/e/a/RetainedPlayback137$0;

    invoke-direct {p0}, Le/e/a/RetainedPlayback137$0;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v1, p0

    :cond_4
    monitor-exit v0

    return-object v1

    .line 108
    :cond_5
    :try_start_3
    new-instance v4, Le/e/a/RetainedPlayback137$Session;

    invoke-direct {v4, p0, p1, v2, v3}, Le/e/a/RetainedPlayback137$Session;-><init>(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v4, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 109
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v3, "setReleaseOnDetachFromWindow"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {p1, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 111
    :catch_0
    :try_start_5
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v3, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {p1, p0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 112
    const-string v3, "nicoid_retained_player_137"

    const-string v5, "begin"

    invoke-virtual {p1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v3, "nicoid_retained_token_137"

    iget-wide v5, v4, Le/e/a/RetainedPlayback137$Session;->token:J

    invoke-virtual {p1, v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 114
    :try_start_6
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 119
    :try_start_7
    invoke-static {v2}, Le/e/a/Dev139;->hold(Ljava/lang/Object;)Le/e/a/Dev139$Retention;

    move-result-object p0

    iput-object p0, v4, Le/e/a/RetainedPlayback137$Session;->retainedSurface:Le/e/a/Dev139$Retention;

    .line 120
    const-string p0, "Original VideoView retained; no player transfer or seek"

    invoke-static {v4, p0}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    .line 121
    new-instance p0, Le/e/a/RetainedPlayback137$2;

    invoke-direct {p0, v4}, Le/e/a/RetainedPlayback137$2;-><init>(Le/e/a/RetainedPlayback137$Session;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit v0

    return-object p0

    :catch_1
    move-exception p0

    .line 117
    :try_start_8
    sput-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    const-string p1, "nicoid-retained"

    const-string v2, "Cannot start foreground keeper; no player transfer"

    invoke-static {p1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    monitor-exit v0

    return-object v1

    .line 104
    :cond_6
    monitor-exit v0

    return-object v1

    :catch_2
    move-exception p0

    .line 125
    :try_start_9
    const-string p1, "nicoid-retained"

    const-string v2, "Original player retention unavailable"

    invoke-static {p1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    monitor-exit v0

    return-object v1

    :goto_1
    :try_start_a
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 98
    :cond_7
    monitor-exit v0

    return-object v1
.end method

.method public static declared-synchronized destroyed(Landroid/app/Activity;)V
    .registers 4

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 153
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    if-eqz v1, :cond_0

    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    if-ne v2, p0, :cond_0

    const/4 p0, 0x0

    invoke-static {v1, p0}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static enabled(Landroid/app/Activity;)Z
    .registers 4

    invoke-static {p0}, Le/e/a/ScreenOffAudio216;->enabled(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 77
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 78
    const-string v0, "app_switch_playback"

    const-string v1, "none"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "background"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static declared-synchronized finish(Le/e/a/RetainedPlayback137$Session;Z)V
    .registers 7

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    if-eqz p0, :cond_7

    .line 391
    :try_start_0
    iget-boolean v1, p0, Le/e/a/RetainedPlayback137$Session;->closing:Z

    if-nez v1, :cond_7

    const/4 v1, 0x1

    .line 392
    iput-boolean v1, p0, Le/e/a/RetainedPlayback137$Session;->closing:Z

    sget-object v2, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    const/4 v3, 0x0

    if-ne v2, p0, :cond_0

    sput-object v3, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    .line 393
    :cond_0
    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->retainedSurface:Le/e/a/Dev139$Retention;

    if-eqz v2, :cond_1

    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->retainedSurface:Le/e/a/Dev139$Retention;

    invoke-virtual {v2}, Le/e/a/Dev139$Retention;->close()V

    iput-object v3, p0, Le/e/a/RetainedPlayback137$Session;->retainedSurface:Le/e/a/Dev139$Retention;

    .line 394
    :cond_1
    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    if-eqz v2, :cond_2

    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/media/session/MediaSession;->setActive(Z)V

    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v2}, Landroid/media/session/MediaSession;->release()V

    iput-object v3, p0, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    .line 395
    :cond_2
    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    iput-object v3, p0, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    if-eqz v2, :cond_4

    .line 397
    invoke-virtual {v2, v1}, Landroid/app/Service;->stopForeground(Z)V

    .line 398
    const-string v1, "notification"

    invoke-virtual {v2, v1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    if-eqz v1, :cond_3

    const/16 v3, 0x359c

    .line 399
    invoke-virtual {v1, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 400
    :cond_3
    invoke-virtual {v2}, Landroid/app/Service;->stopSelf()V

    :cond_4
    if-eqz p1, :cond_5

    .line 402
    iget-object v1, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    :cond_5
    if-eqz p1, :cond_6

    .line 403
    const-string p1, "Notification stopped playback"

    goto :goto_0

    :cond_6
    const-string p1, "Normal video resumed; keeper removed"

    :goto_0
    invoke-static {p0, p1}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    .line 404
    invoke-static {}, Le/e/a/Dev111;->suppressAutoReturn()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 405
    monitor-exit v0

    return-void

    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 391
    :cond_7
    monitor-exit v0

    return-void
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    .line 59
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 58
    :catch_0
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 61
    :cond_0
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic lambda$0()V
    .registers 0

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/RetainedPlayback137$Session;)V
    .registers 3

    .line 122
    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    :try_start_0
    invoke-static {p0}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Le/e/a/RetainedPlayback137$Session;->committed:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    const-string v0, "External switch confirmed; same player continues"

    invoke-static {p0, v0}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    return-void

    .line 122
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method static synthetic lambda$2(Le/e/a/RetainedPlayback137$Session;Landroid/app/Activity;)V
    .registers 6

    .line 174
    invoke-static {p0}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Le/e/a/RetainedPlayback137$Session;->committed:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/RetainedPlayback137;->returnNormal(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 176
    :try_start_0
    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    if-eqz v0, :cond_1

    .line 177
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getAppTasks()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$AppTask;

    .line 178
    invoke-virtual {v1}, Landroid/app/ActivityManager$AppTask;->getTaskInfo()Landroid/app/ActivityManager$RecentTaskInfo;

    move-result-object v2

    iget v2, v2, Landroid/app/ActivityManager$RecentTaskInfo;->id:I

    iget v3, p0, Le/e/a/RetainedPlayback137$Session;->taskId:I

    if-ne v2, v3, :cond_0

    invoke-virtual {v1}, Landroid/app/ActivityManager$AppTask;->moveToFront()V

    .line 180
    :cond_1
    iget-object v0, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    if-eq v0, p1, :cond_2

    iget-object v0, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 181
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x30000

    .line 182
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 183
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    const/4 v0, 0x0

    .line 184
    invoke-virtual {p1, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 186
    :cond_2
    const-string p1, "Existing player Activity reordered; no HLS reload"

    invoke-static {p0, p1}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 187
    const-string p1, "nicoid-retained"

    const-string v0, "Existing player Activity unavailable"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    return-void
.end method

.method static synthetic lambda$3(Le/e/a/RetainedPlayback137$Session;JI)V
    .registers 11

    .line 198
    invoke-static {p0}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Le/e/a/RetainedPlayback137$Session;->returnSettling:Z

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 201
    :try_start_0
    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    .line 202
    iget-object v3, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->hasWindowFocus()Z

    move-result v3

    if-eqz v3, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    move v2, v0

    goto :goto_0

    :catch_0
    :cond_0
    move v2, v1

    .line 204
    :goto_0
    iget-object v3, p0, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-static {v3}, Le/e/a/RetainedPlayback137;->position(Ljava/lang/Object;)J

    move-result-wide v3

    if-eqz v2, :cond_2

    .line 205
    iget-object v2, p0, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-static {v2}, Le/e/a/RetainedPlayback137;->playing(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-wide/16 v5, 0x0

    cmp-long v2, p1, v5

    if-ltz v2, :cond_2

    const-wide/16 v5, 0x78

    add-long/2addr v5, p1

    cmp-long v2, v3, v5

    if-ltz v2, :cond_2

    .line 207
    :cond_1
    iput-boolean v1, p0, Le/e/a/RetainedPlayback137$Session;->returnSettling:Z

    .line 208
    const-string p1, "Original screen focused and playback advancing; retiring notification keeper"

    invoke-static {p0, p1}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    .line 209
    invoke-static {p0, v1}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V

    goto :goto_1

    :cond_2
    const/16 v2, 0x1e

    if-ge p3, v2, :cond_3

    add-int/2addr p3, v0

    .line 211
    invoke-static {p0, p1, p2, p3}, Le/e/a/RetainedPlayback137;->settleNormalReturn(Le/e/a/RetainedPlayback137$Session;JI)V

    goto :goto_1

    .line 213
    :cond_3
    iput-boolean v1, p0, Le/e/a/RetainedPlayback137$Session;->returnSettling:Z

    .line 214
    const-string p1, "Normal screen not yet stable; preserving keeper and decoder"

    invoke-static {p0, p1}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public static declared-synchronized left()V
    .registers 2

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 143
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    if-nez v1, :cond_0

    invoke-static {}, Le/e/a/Dev111;->left()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0
.end method

.method private static varargs legacy(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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

    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "e.e.a."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    .line 227
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 p1, 0x1

    .line 228
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 p1, 0x0

    .line 229
    invoke-virtual {p0, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V
    .registers 5

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " token="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Le/e/a/RetainedPlayback137$Session;->token:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " video="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/RetainedPlayback137$Session;->id:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    const-string p1, " currentPosition="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/RetainedPlayback137;->position(Ljava/lang/Object;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " initialPosition="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Le/e/a/RetainedPlayback137$Session;->initialPosition:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 87
    const-string p1, " isPlaying="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/RetainedPlayback137;->playing(Ljava/lang/Object;)Z

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, " task="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Le/e/a/RetainedPlayback137$Session;->taskId:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 85
    const-string p1, "nicoid-retained"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static nonempty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    if-eqz p0, :cond_0

    .line 219
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "null"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    return-object p1
.end method

.method private static notifyPlayback(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 322
    const-string v2, "notification"

    invoke-virtual {v0, v2}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    if-eqz v2, :cond_7

    .line 325
    new-instance v3, Landroid/app/NotificationChannel;

    const-string v4, "nicoid Re playback"

    const-string v5, "nicoid_retained_audio"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v4, v6}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    const/4 v4, 0x0

    .line 326
    invoke-virtual {v3, v4, v4}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    invoke-virtual {v2, v3}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 328
    iget-object v3, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    const/4 v4, 0x4

    const-string v7, "show"

    const/4 v8, 0x1

    if-nez v3, :cond_0

    .line 329
    new-instance v3, Landroid/media/session/MediaSession;

    const-string v9, "nicoid-retained-137"

    invoke-direct {v3, v0, v9}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v3, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    .line 331
    iget-object v3, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    new-instance v9, Le/e/a/RetainedPlayback137$1;

    invoke-direct {v9, v1}, Le/e/a/RetainedPlayback137$1;-><init>(Le/e/a/RetainedPlayback137$Session;)V

    .line 349
    sget-object v10, Le/e/a/RetainedPlayback137;->MAIN:Landroid/os/Handler;

    .line 331
    invoke-virtual {v3, v9, v10}, Landroid/media/session/MediaSession;->setCallback(Landroid/media/session/MediaSession$Callback;Landroid/os/Handler;)V

    .line 352
    iget-object v3, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    invoke-static {v0, v1, v7, v4}, Le/e/a/RetainedPlayback137;->action(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/media/session/MediaSession;->setSessionActivity(Landroid/app/PendingIntent;)V

    .line 353
    iget-object v3, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v3, v8}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 355
    :cond_0
    invoke-static {v1}, Le/e/a/RetainedPlayback137;->syncMetadata(Le/e/a/RetainedPlayback137$Session;)Le/e/a/RetainedPlayback137$VideoMetadata;

    move-result-object v3

    .line 356
    iget-object v9, v1, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-static {v9}, Le/e/a/RetainedPlayback137;->playing(Ljava/lang/Object;)Z

    move-result v9

    .line 357
    iget-object v10, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    new-instance v11, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v11}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    const-wide/16 v12, 0x107

    .line 358
    invoke-virtual {v11, v12, v13}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    move-result-object v14

    const/4 v11, 0x3

    if-eqz v9, :cond_1

    move v15, v11

    goto :goto_0

    :cond_1
    move v15, v6

    .line 360
    :goto_0
    iget-object v12, v1, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-static {v12}, Le/e/a/RetainedPlayback137;->position(Ljava/lang/Object;)J

    move-result-wide v12

    move-object/from16 v21, v7

    const-wide/16 v6, 0x0

    invoke-static {v6, v7, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v16

    if-eqz v9, :cond_2

    const/high16 v6, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    :goto_1
    move/from16 v18, v6

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v19

    .line 359
    invoke-virtual/range {v14 .. v20}, Landroid/media/session/PlaybackState$Builder;->setState(IJFJ)Landroid/media/session/PlaybackState$Builder;

    move-result-object v6

    .line 360
    invoke-virtual {v6}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v6

    .line 357
    invoke-virtual {v10, v6}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    .line 362
    new-instance v6, Landroid/app/Notification$Builder;

    invoke-direct {v6, v0, v5}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 363
    iget-object v5, v3, Le/e/a/RetainedPlayback137$VideoMetadata;->title:Ljava/lang/String;

    invoke-virtual {v6, v5}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    iget-object v7, v3, Le/e/a/RetainedPlayback137$VideoMetadata;->artist:Ljava/lang/String;

    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    const v7, 0x1080024

    .line 364
    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    move-object/from16 v10, v21

    .line 365
    invoke-static {v0, v1, v10, v4}, Le/e/a/RetainedPlayback137;->action(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 366
    new-instance v5, Landroid/app/Notification$Action$Builder;

    if-eqz v9, :cond_3

    const v7, 0x1080023

    .line 368
    const-string v9, "Pause"

    const-string v10, "pause"

    goto :goto_2

    :cond_3
    const-string v9, "Play"

    const-string v10, "resume"

    :goto_2
    const/4 v12, 0x2

    invoke-static {v0, v1, v10, v12}, Le/e/a/RetainedPlayback137;->action(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 366
    invoke-direct {v5, v7, v9, v10}, Landroid/app/Notification$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 368
    invoke-virtual {v5}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v5

    .line 366
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 369
    new-instance v5, Landroid/app/Notification$Action$Builder;

    .line 370
    const-string v7, "stop"

    invoke-static {v0, v1, v7, v11}, Le/e/a/RetainedPlayback137;->action(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v7

    const v9, 0x1080038

    .line 369
    const-string v10, "Stop"

    invoke-direct {v5, v9, v10, v7}, Landroid/app/Notification$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 370
    invoke-virtual {v5}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v5

    .line 369
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 371
    new-instance v5, Landroid/app/Notification$MediaStyle;

    invoke-direct {v5}, Landroid/app/Notification$MediaStyle;-><init>()V

    iget-object v7, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v7}, Landroid/media/session/MediaSession;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/app/Notification$MediaStyle;->setMediaSession(Landroid/media/session/MediaSession$Token;)Landroid/app/Notification$MediaStyle;

    move-result-object v5

    const/4 v7, 0x0

    .line 372
    filled-new-array {v7, v8}, [I

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/app/Notification$MediaStyle;->setShowActionsInCompactView([I)Landroid/app/Notification$MediaStyle;

    move-result-object v5

    .line 371
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 373
    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 374
    new-instance v4, Landroid/app/Notification$Action$Builder;

    .line 375
    const-string v5, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "popup"

    const/4 v9, 0x5

    invoke-static {v0, v1, v7, v9}, Le/e/a/RetainedPlayback137;->action(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v7

    const v9, 0x1080057

    invoke-direct {v4, v9, v5, v7}, Landroid/app/Notification$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {v4}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v4

    .line 374
    invoke-virtual {v6, v4}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    .line 377
    :cond_4
    iget-boolean v4, v1, Le/e/a/RetainedPlayback137$Session;->foreground:Z

    const/16 v5, 0x359c

    if-nez v4, :cond_6

    .line 378
    invoke-virtual {v6}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    .line 379
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1d

    if-lt v4, v6, :cond_5

    const/4 v12, 0x2

    .line 380
    invoke-virtual {v0, v5, v2, v12}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;I)V

    goto :goto_3

    .line 383
    :cond_5
    invoke-virtual {v0, v5, v2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    .line 385
    :goto_3
    iput-boolean v8, v1, Le/e/a/RetainedPlayback137$Session;->foreground:Z

    goto :goto_4

    .line 387
    :cond_6
    invoke-virtual {v6}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {v2, v5, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 388
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Notification metadata title="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v3, Le/e/a/RetainedPlayback137$VideoMetadata;->title:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " artist="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v3, Le/e/a/RetainedPlayback137$VideoMetadata;->artist:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " (original decoder)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    return-void

    .line 323
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No notification manager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static playing(Ljava/lang/Object;)Z
    .registers 3

    .line 67
    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "isPlaying"

    invoke-static {p0, v1}, Le/e/a/RetainedPlayback137;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public static declared-synchronized popupAdopted(Landroid/app/Service;)V
    .registers 4

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 296
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    if-eqz v1, :cond_0

    .line 297
    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    if-ne v2, p0, :cond_0

    const/4 p0, 0x0

    .line 298
    iput-object p0, v1, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    const/4 p0, 0x0

    .line 299
    invoke-static {v1, p0}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 300
    monitor-exit v0

    return-void

    .line 297
    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static position(Ljava/lang/Object;)J
    .registers 3

    .line 70
    :try_start_0
    const-string v0, "getCurrentPosition"

    invoke-static {p0, v0}, Le/e/a/RetainedPlayback137;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static resumed(Landroid/app/Activity;)V
    .registers 6

    .line 158
    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 159
    invoke-static {p0}, Le/e/a/Dev111;->singleReturnOwner(Landroid/app/Activity;)Z

    invoke-static {p0}, Le/e/a/Dev111;->resumed(Landroid/app/Activity;)V

    return-void

    .line 160
    :cond_0
    invoke-static {}, Le/e/a/Dev111;->suppressAutoReturn()V

    .line 161
    invoke-static {v1}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    invoke-static {v1, v2}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V

    return-void

    .line 162
    :cond_1
    iget-object v0, v1, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    if-ne p0, v0, :cond_3

    .line 163
    iget-object p0, v1, Le/e/a/RetainedPlayback137$Session;->retainedSurface:Le/e/a/Dev139$Retention;

    if-eqz p0, :cond_2

    iget-object p0, v1, Le/e/a/RetainedPlayback137$Session;->retainedSurface:Le/e/a/Dev139$Retention;

    invoke-virtual {p0}, Le/e/a/Dev139$Retention;->restore()V

    .line 164
    :cond_2
    const-string p0, "Normal player Activity resumed; keep keeper until focused/audio stable"

    invoke-static {v1, p0}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V

    .line 165
    iget-boolean p0, v1, Le/e/a/RetainedPlayback137$Session;->returnSettling:Z

    if-nez p0, :cond_5

    const/4 p0, 0x1

    .line 166
    iput-boolean p0, v1, Le/e/a/RetainedPlayback137$Session;->returnSettling:Z

    .line 167
    iget-object p0, v1, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/RetainedPlayback137;->position(Ljava/lang/Object;)J

    move-result-wide v3

    invoke-static {v1, v3, v4, v2}, Le/e/a/RetainedPlayback137;->settleNormalReturn(Le/e/a/RetainedPlayback137$Session;JI)V

    return-void

    .line 171
    :cond_3
    iget-boolean v0, v1, Le/e/a/RetainedPlayback137$Session;->committed:Z

    if-nez v0, :cond_4

    invoke-static {v1, v2}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V

    return-void

    .line 172
    :cond_4
    iget-object v0, v1, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/RetainedPlayback137;->returnNormal(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_6

    :cond_5
    return-void

    .line 173
    :cond_6
    sget-object v0, Le/e/a/RetainedPlayback137;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/RetainedPlayback137$3;

    invoke-direct {v2, v1, p0}, Le/e/a/RetainedPlayback137$3;-><init>(Le/e/a/RetainedPlayback137$Session;Landroid/app/Activity;)V

    const-wide/16 v3, 0x5a

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 158
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public static declared-synchronized retains(Ljava/lang/Object;)Z
    .registers 4

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 141
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    invoke-static {v1}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, v1, Le/e/a/RetainedPlayback137$Session;->fragment:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p0, v1, :cond_0

    monitor-exit v0

    const/4 p0, 0x1

    return p0

    :cond_0
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static returnNormal(Landroid/app/Activity;)Z
    .registers 3

    .line 81
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 82
    const-string v0, "nicoid_app_resume_playback"

    const-string v1, "background"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 81
    const-string v0, "normal"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static send(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V
    .registers 6

    .line 316
    iget-object v0, p0, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    if-nez v0, :cond_0

    return-void

    .line 317
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.sauzask.nicoid.NicoidPopupViewService"

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 318
    const-string v2, "nicoid_retained_player_137"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v1, "nicoid_retained_token_137"

    iget-wide v2, p0, Le/e/a/RetainedPlayback137$Session;->token:J

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p0

    .line 319
    invoke-virtual {v0, p0}, Landroid/app/Service;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static declared-synchronized serviceDestroyed(Landroid/app/Service;)V
    .registers 5

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 302
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    if-eqz v1, :cond_1

    .line 303
    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    if-ne v2, p0, :cond_1

    const/4 p0, 0x0

    .line 304
    iput-object p0, v1, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    .line 305
    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    if-eqz v2, :cond_0

    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/media/session/MediaSession;->setActive(Z)V

    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v2}, Landroid/media/session/MediaSession;->release()V

    iput-object p0, v1, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    .line 306
    :cond_0
    const-string p0, "nicoid-retained"

    const-string v1, "Keeper destroyed; no decoder released"

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 308
    :cond_1
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public static serviceStart(Landroid/app/Service;Landroid/content/Intent;)Z
    .registers 11

    const/4 v0, 0x0

    if-eqz p1, :cond_9

    .line 263
    const-string v1, "nicoid_retained_player_137"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 264
    const-string v1, "nicoid_retained_player_137"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 266
    const-class v2, Le/e/a/RetainedPlayback137;

    monitor-enter v2

    :try_start_0
    sget-object v3, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    invoke-static {v3}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_7

    const-string v2, "nicoid_retained_token_137"

    const-wide/16 v5, -0x1

    invoke-virtual {p1, v2, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    iget-wide v7, v3, Le/e/a/RetainedPlayback137$Session;->token:J

    cmp-long p1, v5, v7

    if-nez p1, :cond_7

    .line 271
    iput-object p0, v3, Le/e/a/RetainedPlayback137$Session;->service:Landroid/app/Service;

    .line 273
    :try_start_1
    const-string p1, "stop"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    .line 274
    :try_start_2
    iget-object p0, v3, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string p1, "pause"

    new-array v1, v0, [Ljava/lang/Class;

    invoke-virtual {p0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    iget-object p1, v3, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-virtual {p0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 275
    :catch_0
    :try_start_3
    invoke-static {v3, v4}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V

    return v4

    .line 277
    :cond_0
    const-string p1, "pause"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "resume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 278
    :cond_1
    iget-object p1, v3, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v5, "pause"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "pause"

    goto :goto_0

    :cond_2
    const-string v5, "start"

    :goto_0
    new-array v6, v0, [Ljava/lang/Class;

    invoke-virtual {p1, v5, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iget-object v5, v3, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-virtual {p1, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    :cond_3
    const-string p1, "popup"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 281
    iget-object p0, v3, Le/e/a/RetainedPlayback137$Session;->fragment:Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/Media3PlaybackHandoff;->requestPopup(Ljava/lang/Object;)V

    return v4

    .line 284
    :cond_4
    const-string p1, "show"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 285
    const-string p1, "activity"

    invoke-virtual {p0, p1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    if-eqz p1, :cond_6

    .line 286
    invoke-virtual {p1}, Landroid/app/ActivityManager;->getAppTasks()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$AppTask;

    .line 287
    invoke-virtual {v1}, Landroid/app/ActivityManager$AppTask;->getTaskInfo()Landroid/app/ActivityManager$RecentTaskInfo;

    move-result-object v2

    iget v2, v2, Landroid/app/ActivityManager$RecentTaskInfo;->id:I

    iget v5, v3, Le/e/a/RetainedPlayback137$Session;->taskId:I

    if-ne v2, v5, :cond_5

    invoke-virtual {v1}, Landroid/app/ActivityManager$AppTask;->moveToFront()V

    .line 289
    :cond_6
    invoke-static {p0, v3}, Le/e/a/RetainedPlayback137;->notifyPlayback(Landroid/app/Service;Le/e/a/RetainedPlayback137$Session;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    return v4

    :catch_1
    move-exception p0

    .line 291
    const-string p1, "nicoid-retained"

    const-string v1, "Notification keeper failed; do not replace decoder"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 292
    invoke-static {v3, v0}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V

    return v4

    .line 268
    :cond_7
    invoke-static {p0}, Le/e/a/Media3PlaybackHandoff;->owns(Landroid/app/Service;)Z

    move-result p1

    if-eqz p1, :cond_8

    return v4

    .line 269
    :cond_8
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return v4

    .line 266
    :goto_1
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_9
    return v0
.end method

.method private static settleNormalReturn(Le/e/a/RetainedPlayback137$Session;JI)V
    .registers 6

    .line 197
    sget-object v0, Le/e/a/RetainedPlayback137;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/RetainedPlayback137$4;

    invoke-direct {v1, p0, p1, p2, p3}, Le/e/a/RetainedPlayback137$4;-><init>(Le/e/a/RetainedPlayback137$Session;JI)V

    const-wide/16 p0, 0x46

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static declared-synchronized started(Landroid/app/Activity;)V
    .registers 1

    const-class p0, Le/e/a/RetainedPlayback137;

    monitor-enter p0

    .line 144
    monitor-exit p0

    return-void
.end method

.method public static declared-synchronized stopExternal(Landroid/app/Activity;)V
    .registers 5

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 133
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    if-eqz v1, :cond_0

    .line 134
    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, p0, :cond_0

    .line 135
    :try_start_1
    iget-object p0, v1, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v2, "pause"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    invoke-virtual {p0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 136
    :try_start_2
    const-string v2, "nicoid-retained"

    const-string v3, "Could not pause retained player on external Stop"

    invoke-static {v2, v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    const/4 p0, 0x1

    .line 137
    invoke-static {v1, p0}, Le/e/a/RetainedPlayback137;->finish(Le/e/a/RetainedPlayback137$Session;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 138
    monitor-exit v0

    return-void

    .line 134
    :cond_0
    monitor-exit v0

    return-void

    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1
.end method

.method public static declared-synchronized stopped(Landroid/app/Activity;)V
    .registers 4

    const-class v0, Le/e/a/RetainedPlayback137;

    monitor-enter v0

    .line 146
    :try_start_0
    sget-object v1, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    .line 147
    invoke-static {v1}, Le/e/a/RetainedPlayback137;->usable(Le/e/a/RetainedPlayback137$Session;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v1, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    if-ne v2, p0, :cond_0

    const/4 p0, 0x0

    .line 148
    iput-boolean p0, v1, Le/e/a/RetainedPlayback137$Session;->returnSettling:Z

    .line 149
    const-string p0, "Original player Activity stopped"

    invoke-static {v1, p0}, Le/e/a/RetainedPlayback137;->log(Le/e/a/RetainedPlayback137$Session;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    :cond_0
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static syncMetadata(Le/e/a/RetainedPlayback137$Session;)Le/e/a/RetainedPlayback137$VideoMetadata;
    .registers 13

    .line 232
    const-class v0, Ljava/lang/Object;

    const-string v1, "nicoid-retained"

    const-string v2, "FeedbackMedia"

    iget-object v3, p0, Le/e/a/RetainedPlayback137$Session;->id:Ljava/lang/String;

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 234
    :try_start_0
    const-string v6, "bundle"

    new-array v7, v4, [Ljava/lang/Class;

    aput-object v0, v7, v5

    iget-object v8, p0, Le/e/a/RetainedPlayback137$Session;->fragment:Ljava/lang/Object;

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v2, v6, v7, v8}, Le/e/a/RetainedPlayback137;->legacy(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v6

    .line 235
    const-string v7, "No video metadata bundle"

    invoke-static {v1, v7, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v6, 0x0

    .line 236
    :goto_0
    const-string v7, ""

    if-eqz v6, :cond_0

    .line 237
    :try_start_1
    const-string v8, "FeedbackFixes"

    const-string v9, "bundleTitle"

    new-array v10, v4, [Ljava/lang/Class;

    const-class v11, Landroid/os/Bundle;

    aput-object v11, v10, v5

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v11

    invoke-static {v8, v9, v10, v11}, Le/e/a/RetainedPlayback137;->legacy(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8, v3}, Le/e/a/RetainedPlayback137;->nonempty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 238
    :catch_1
    const-string v8, "author"

    invoke-virtual {v6, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "uploaderName"

    invoke-virtual {v6, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v7}, Le/e/a/RetainedPlayback137;->nonempty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Le/e/a/RetainedPlayback137;->nonempty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 241
    :cond_0
    :try_start_2
    const-string v6, "PlaybackBar221"

    const-string v8, "media"

    new-array v9, v5, [Ljava/lang/Class;

    new-array v10, v5, [Ljava/lang/Object;

    invoke-static {v6, v8, v9, v10}, Le/e/a/RetainedPlayback137;->legacy(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 242
    const-string v8, "owner"

    invoke-static {v6, v8}, Le/e/a/RetainedPlayback137;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    iget-object v9, p0, Le/e/a/RetainedPlayback137$Session;->fragment:Ljava/lang/Object;

    if-ne v8, v9, :cond_1

    .line 243
    const-string v8, "title"

    invoke-static {v6, v8}, Le/e/a/RetainedPlayback137;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v3}, Le/e/a/RetainedPlayback137;->nonempty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 245
    :catch_2
    :cond_1
    iget-object v6, p0, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    if-eqz v6, :cond_3

    .line 246
    :try_start_3
    new-instance v6, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v6}, Landroid/media/MediaMetadata$Builder;-><init>()V

    .line 247
    const-string v8, "android.media.metadata.MEDIA_ID"

    iget-object v9, p0, Le/e/a/RetainedPlayback137$Session;->id:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v6

    .line 248
    const-string v8, "android.media.metadata.TITLE"

    invoke-virtual {v6, v8, v3}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v6

    .line 249
    const-string v8, "android.media.metadata.DISPLAY_TITLE"

    invoke-virtual {v6, v8, v3}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v6

    .line 250
    const-string v8, "android.media.metadata.ARTIST"

    invoke-virtual {v6, v8, v7}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v6

    .line 251
    const-string v8, "android.media.metadata.DISPLAY_SUBTITLE"

    invoke-virtual {v6, v8, v7}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v6

    .line 252
    iget-object v8, p0, Le/e/a/RetainedPlayback137$Session;->player:Ljava/lang/Object;

    const-string v9, "getDuration"

    invoke-static {v8, v9}, Le/e/a/RetainedPlayback137;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-lez v10, :cond_2

    .line 253
    const-string v10, "android.media.metadata.DURATION"

    invoke-virtual {v6, v10, v8, v9}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;

    .line 254
    :cond_2
    invoke-virtual {v6}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v6

    .line 255
    iget-object v8, p0, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    invoke-virtual {v8, v6}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    .line 257
    const-string v8, "apply"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Class;

    const-class v10, Landroid/media/session/MediaSession;

    aput-object v10, v9, v5

    const-class v5, Landroid/media/MediaMetadata;

    aput-object v5, v9, v4

    const/4 v4, 0x2

    aput-object v0, v9, v4

    iget-object v0, p0, Le/e/a/RetainedPlayback137$Session;->media:Landroid/media/session/MediaSession;

    iget-object p0, p0, Le/e/a/RetainedPlayback137$Session;->fragment:Ljava/lang/Object;

    filled-new-array {v0, v6, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v2, v8, v9, p0}, Le/e/a/RetainedPlayback137;->legacy(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    :catch_3
    move-exception p0

    .line 258
    const-string v0, "Metadata publish failed"

    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 259
    :cond_3
    :goto_1
    new-instance p0, Le/e/a/RetainedPlayback137$VideoMetadata;

    invoke-direct {p0, v3, v7}, Le/e/a/RetainedPlayback137$VideoMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method private static usable(Le/e/a/RetainedPlayback137$Session;)Z
    .registers 2

    if-eqz p0, :cond_0

    .line 74
    iget-boolean v0, p0, Le/e/a/RetainedPlayback137$Session;->closing:Z

    if-nez v0, :cond_0

    sget-object v0, Le/e/a/RetainedPlayback137;->current:Le/e/a/RetainedPlayback137$Session;

    if-ne v0, p0, :cond_0

    iget-object v0, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Le/e/a/RetainedPlayback137$Session;->source:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
