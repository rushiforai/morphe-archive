.class public final Le/e/a/MediaControls;
.super Ljava/lang/Object;
.source "MediaControls.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/MediaControls$State;
    }
.end annotation


# static fields
.field private static final ACTION:Ljava/lang/String; = "com.sauzask.nicoid.RE_MEDIA"

.field private static final MAIN:Landroid/os/Handler;

.field private static volatile active:Le/e/a/MediaControls$State;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 15
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/MediaControls;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Le/e/a/MediaControls$State;
    .registers 1

    .line 12
    sget-object v0, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    return-object v0
.end method

.method static action(Le/e/a/MediaControls$State;Ljava/lang/String;I)Landroid/app/PendingIntent;
    .registers 5

    .line 49
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.sauzask.nicoid.RE_MEDIA"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "command"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object p0, p0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    const/high16 v0, 0xc000000

    invoke-static {p0, p2, p1, v0}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized attach(Ljava/lang/Object;Z)V
    .registers 8

    const-class v0, Le/e/a/MediaControls;

    monitor-enter v0

    .line 22
    :try_start_3
    sget-object v1, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    if-eqz v1, :cond_f

    sget-object v1, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    iget-object v1, v1, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    if-ne v1, p0, :cond_f

    sget-object v1, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    iget-object v2, v1, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    iget-object v3, v1, Le/e/a/MediaControls$State;->video:Ljava/lang/String;

    invoke-static {p0, p1, v2, v3}, Le/e/a/PlaybackRouting;->sameMediaBinding(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_b} :catch_ed
    .catchall {:try_start_3 .. :try_end_b} :catchall_eb

    monitor-exit v0

    return-void

    .line 23
    :cond_f
    :try_start_f
    invoke-static {}, Le/e/a/MediaControls;->clear()V

    new-instance v1, Le/e/a/MediaControls$State;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Le/e/a/MediaControls$State;-><init>(Le/e/a/MediaControls$1;)V

    iput-object p0, v1, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    iput-boolean p1, v1, Le/e/a/MediaControls$State;->popup:Z

    if-eqz p1, :cond_22

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    goto :goto_2a

    :cond_22
    const-string v2, "A1"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    :goto_2a
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, v1, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    .line 24
    if-eqz p1, :cond_35

    const-string v2, "e"

    goto :goto_37

    :cond_35
    const-string v2, "a0"

    :goto_37
    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, v1, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    if-eqz p1, :cond_42

    const-string v2, "f"

    goto :goto_44

    :cond_42
    const-string v2, "b0"

    :goto_44
    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Le/e/a/MediaControls$State;->video:Ljava/lang/String;

    iget-object v2, v1, Le/e/a/MediaControls$State;->video:Ljava/lang/String;

    invoke-static {p0, v2}, Le/e/a/MediaControls;->title(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Le/e/a/MediaControls$State;->title:Ljava/lang/String;

    .line 25
    if-eqz p1, :cond_65

    const-string v2, "c0"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    goto :goto_68

    :cond_65
    const v2, 0xa067

    :goto_68
    iput v2, v1, Le/e/a/MediaControls$State;->notificationId:I

    .line 26
    new-instance v2, Landroid/media/session/MediaSession;

    iget-object v3, v1, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    const-string v4, "nicoid Re"

    invoke-direct {v2, v3, v4}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, v1, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    iget-object v2, v1, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/media/session/MediaSession;->setFlags(I)V

    .line 27
    iget-object v2, v1, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    new-instance v3, Le/e/a/MediaControls$1;

    invoke-direct {v3, v1}, Le/e/a/MediaControls$1;-><init>(Le/e/a/MediaControls$State;)V

    sget-object v4, Le/e/a/MediaControls;->MAIN:Landroid/os/Handler;

    invoke-virtual {v2, v3, v4}, Landroid/media/session/MediaSession;->setCallback(Landroid/media/session/MediaSession$Callback;Landroid/os/Handler;)V

    .line 34
    new-instance v2, Le/e/a/MediaControls$2;

    invoke-direct {v2, v1}, Le/e/a/MediaControls$2;-><init>(Le/e/a/MediaControls$State;)V

    iput-object v2, v1, Le/e/a/MediaControls$State;->receiver:Landroid/content/BroadcastReceiver;

    .line 35
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x21

    if-lt v2, v3, :cond_a4

    iget-object v2, v1, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    iget-object v3, v1, Le/e/a/MediaControls$State;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "com.sauzask.nicoid.RE_MEDIA"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x4

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_b2

    :cond_a4
    iget-object v2, v1, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    iget-object v3, v1, Le/e/a/MediaControls$State;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "com.sauzask.nicoid.RE_MEDIA"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_b2
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_b2} :catch_ed
    .catchall {:try_start_f .. :try_end_b2} :catchall_eb

    .line 36
    :goto_b2
    if-eqz p1, :cond_cd

    :try_start_b4
    const-string p1, "W"

    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/RemoteControlClient;

    if-eqz p0, :cond_cd

    iget-object p1, v1, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    invoke-virtual {p1, p0}, Landroid/media/AudioManager;->unregisterRemoteControlClient(Landroid/media/RemoteControlClient;)V
    :try_end_cb
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_cb} :catch_cc
    .catchall {:try_start_b4 .. :try_end_cb} :catchall_eb

    goto :goto_cd

    :catch_cc
    move-exception p0

    .line 37
    :cond_cd
    :goto_cd
    :try_start_cd
    iget-object p0, v1, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    invoke-static {v1}, Le/e/a/MediaControls;->open(Le/e/a/MediaControls$State;)Landroid/app/PendingIntent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/media/session/MediaSession;->setSessionActivity(Landroid/app/PendingIntent;)V

    iget-object p0, v1, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/media/session/MediaSession;->setActive(Z)V

    sput-object v1, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    .line 38
    new-instance p0, Le/e/a/MediaControls$$ExternalSyntheticLambda0;

    invoke-direct {p0, v1}, Le/e/a/MediaControls$$ExternalSyntheticLambda0;-><init>(Le/e/a/MediaControls$State;)V

    iput-object p0, v1, Le/e/a/MediaControls$State;->tick:Ljava/lang/Runnable;

    iget-object p0, v1, Le/e/a/MediaControls$State;->tick:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_ea
    .catch Ljava/lang/Exception; {:try_start_cd .. :try_end_ea} :catch_ed
    .catchall {:try_start_cd .. :try_end_ea} :catchall_eb

    goto :goto_f4

    .line 21
    :catchall_eb
    move-exception p0

    goto :goto_f7

    .line 39
    :catch_ed
    move-exception p0

    :try_start_ee
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    invoke-static {}, Le/e/a/MediaControls;->clear()V
    :try_end_f4
    .catchall {:try_start_ee .. :try_end_f4} :catchall_eb

    :goto_f4
    nop

    .line 40
    monitor-exit v0

    return-void

    .line 21
    :goto_f7
    monitor-exit v0

    throw p0
.end method

.method static clear()V
    .registers 3

    .line 78
    sget-object v0, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    const/4 v1, 0x0

    sput-object v1, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    if-nez v0, :cond_8

    return-void

    :cond_8
    sget-object v1, Le/e/a/MediaControls;->MAIN:Landroid/os/Handler;

    iget-object v2, v0, Le/e/a/MediaControls$State;->tick:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v1, v0, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/session/MediaSession;->setActive(Z)V

    iget-object v1, v0, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    invoke-virtual {v1}, Landroid/media/session/MediaSession;->release()V

    :try_start_1a
    iget-object v1, v0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    iget-object v2, v0, Le/e/a/MediaControls$State;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_21} :catch_22

    goto :goto_23

    :catch_22
    move-exception v1

    :goto_23
    iget-object v1, v0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    const-string v2, "notification"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    iget v0, v0, Le/e/a/MediaControls$State;->notificationId:I

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method static command(Le/e/a/MediaControls$State;Ljava/lang/String;)V
    .registers 7

    .line 52
    sget-object v0, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    if-eq v0, p0, :cond_5

    return-void

    :cond_5
    :try_start_5
    iget-object v0, p0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    const-string v1, "isPlaying"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const-string v1, "toggle"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1e} :catch_59

    const-string v3, "pause"

    const-string v4, "start"

    if-eqz v1, :cond_29

    if-eqz v0, :cond_27

    :cond_26
    goto :goto_32

    :cond_27
    :goto_27
    move-object v3, v4

    goto :goto_32

    :cond_29
    :try_start_29
    const-string v0, "play"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    goto :goto_27

    :goto_32
    iget-object v0, p0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    new-array v1, v2, [Ljava/lang/Class;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v3, v1, v2}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    iget-boolean v1, p0, Le/e/a/MediaControls$State;->popup:Z

    invoke-static {v0, v1}, Le/e/a/PlaybackSession;->interaction(Ljava/lang/Object;Z)V

    invoke-static {p0}, Le/e/a/MediaControls;->update(Le/e/a/MediaControls$State;)V

    const-string v0, "stop"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5d

    iget-boolean p1, p0, Le/e/a/MediaControls$State;->popup:Z

    if-eqz p1, :cond_5d

    iget-object p0, p0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    check-cast p0, Landroid/app/Service;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_58} :catch_59

    goto :goto_5d

    :catch_59
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :cond_5d
    :goto_5d
    return-void
.end method

.method public static declared-synchronized detach(Ljava/lang/Object;)V
    .registers 3

    const-class v0, Le/e/a/MediaControls;

    monitor-enter v0

    .line 75
    :try_start_3
    sget-object v1, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    if-eqz v1, :cond_10

    sget-object v1, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    iget-object v1, v1, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    if-ne v1, p0, :cond_10

    invoke-static {}, Le/e/a/MediaControls;->clear()V
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    :cond_10
    monitor-exit v0

    return-void

    .line 75
    :catchall_12
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static foreground(Landroid/app/Service;ILandroid/app/Notification;)V
    .registers 5

    .line 76
    sget-object v0, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    if-eqz v0, :cond_e

    iget-object v1, v0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    if-ne v1, p0, :cond_e

    iget-object v1, v0, Le/e/a/MediaControls$State;->notification:Landroid/app/Notification;

    if-eqz v1, :cond_e

    iget-object p2, v0, Le/e/a/MediaControls$State;->notification:Landroid/app/Notification;

    :cond_e
    invoke-virtual {p0, p1, p2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method

.method static synthetic lambda$attach$0(Le/e/a/MediaControls$State;)V
    .registers 4

    .line 38
    sget-object v0, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    if-eq v0, p0, :cond_5

    return-void

    :cond_5
    invoke-static {p0}, Le/e/a/MediaControls;->update(Le/e/a/MediaControls$State;)V

    sget-object v0, Le/e/a/MediaControls;->MAIN:Landroid/os/Handler;

    iget-object p0, p0, Le/e/a/MediaControls$State;->tick:Ljava/lang/Runnable;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static notify(Landroid/app/NotificationManager;ILandroid/app/Notification;)V
    .registers 5

    .line 77
    sget-object v0, Le/e/a/MediaControls;->active:Le/e/a/MediaControls$State;

    if-eqz v0, :cond_12

    iget-boolean v1, v0, Le/e/a/MediaControls$State;->popup:Z

    if-eqz v1, :cond_12

    iget v1, v0, Le/e/a/MediaControls$State;->notificationId:I

    if-ne v1, p1, :cond_12

    iget-object v1, v0, Le/e/a/MediaControls$State;->notification:Landroid/app/Notification;

    if-eqz v1, :cond_12

    iget-object p2, v0, Le/e/a/MediaControls$State;->notification:Landroid/app/Notification;

    :cond_12
    invoke-virtual {p0, p1, p2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method static open(Le/e/a/MediaControls$State;)Landroid/app/PendingIntent;
    .registers 6

    .line 48
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/MediaControls$State;->video:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v1, p0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    const-string v2, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10020000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-wide/32 v1, 0x7fffffff

    invoke-static {p0}, Le/e/a/MediaControls;->position(Le/e/a/MediaControls$State;)J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v2, v1

    const-string v1, "playposition"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p0, p0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    const v1, 0xa067

    const/high16 v2, 0xc000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method static position(Le/e/a/MediaControls$State;)J
    .registers 4

    .line 50
    :try_start_0
    iget-object p0, p0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    const-string v0, "getCurrentPosition"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v2, v1}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_14

    return-wide v0

    :catch_14
    move-exception p0

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method static seek(Le/e/a/MediaControls$State;J)V
    .registers 13

    .line 51
    :try_start_0
    iget-object v0, p0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    const-string v1, "getDuration"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iget-object v3, p0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    const-string v4, "seekTo"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v2

    new-array v5, v5, [Ljava/lang/Object;

    const-wide/16 v7, 0x0

    cmp-long v9, v0, v7

    if-lez v9, :cond_2a

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    :cond_2a
    invoke-static {v7, v8, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v5, v2

    invoke-static {v3, v4, v6, v5}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/MediaControls;->update(Le/e/a/MediaControls$State;)V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3a} :catch_3b

    goto :goto_3f

    :catch_3b
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_3f
    return-void
.end method

.method static title(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    invoke-static {p0}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;
    move-result-object v0
    invoke-static {v0}, Le/e/a/FeedbackFixes;->bundleTitle(Landroid/os/Bundle;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :fragment_title
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :fragment_title
    return-object v0
    :fragment_title
    :try_start_title
    const-string v0, "c0"
    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Ljava/lang/String;
    if-eqz v1, :fallback
    check-cast v0, Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :fallback
    return-object v0
    :try_end_title
    .catch Ljava/lang/Exception; {:try_start_title .. :try_end_title} :title_error
    :title_error
    move-exception v0
    :fallback
    return-object p1
.end method

.method static update(Le/e/a/MediaControls$State;)V
    .registers 19

    .line 54
    move-object/from16 v0, p0

    const-string v1, "nicoid Re"

    :try_start_4
    iget-object v2, v0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    const-string v3, "isPlaying"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v2, v3, v5, v6}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, v0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    const-string v5, "getDuration"

    new-array v6, v4, [Ljava/lang/Class;

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {v3, v5, v6, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    # Refresh even if metadata arrives after attach without a duration/play-state change.
    iget-object v3, v0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;
    invoke-static {v3}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;
    move-result-object v3
    iget-object v7, v0, Le/e/a/MediaControls$State;->lastInfo:Landroid/os/Bundle;
    if-eq v3, v7, :info_unchanged
    iput-object v3, v0, Le/e/a/MediaControls$State;->lastInfo:Landroid/os/Bundle;
    const-wide/16 v7, -0x1
    iput-wide v7, v0, Le/e/a/MediaControls$State;->lastDuration:J
    :info_unchanged
    .line 55
    iget-object v3, v0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    iget-boolean v7, v0, Le/e/a/MediaControls$State;->popup:Z

    if-eqz v7, :cond_32

    const-string v7, "f"

    goto :goto_34

    :cond_32
    const-string v7, "b0"

    :goto_34
    invoke-static {v3, v7}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v7, v0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    invoke-static {v7, v3}, Le/e/a/MediaControls;->title(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v0, Le/e/a/MediaControls$State;->video:Ljava/lang/String;

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_52

    iget-object v8, v0, Le/e/a/MediaControls$State;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5a

    :cond_52
    iput-object v3, v0, Le/e/a/MediaControls$State;->video:Ljava/lang/String;

    iput-object v7, v0, Le/e/a/MediaControls$State;->title:Ljava/lang/String;

    const-wide/16 v7, -0x1

    iput-wide v7, v0, Le/e/a/MediaControls$State;->lastDuration:J

    .line 56
    :cond_5a
    iget-object v3, v0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    .line 57
    nop

    .line 58
    iget-object v3, v0, Le/e/a/MediaControls$State;->player:Ljava/lang/Object;

    const-string v7, "getPlaybackSpeed"

    new-array v8, v4, [Ljava/lang/Class;

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v3, v7, v8, v9}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    .line 59
    iget-object v7, v0, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    invoke-static/range {p0 .. p0}, Le/e/a/MediaControls;->open(Le/e/a/MediaControls$State;)Landroid/app/PendingIntent;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/media/session/MediaSession;->setSessionActivity(Landroid/app/PendingIntent;)V

    .line 60
    iget-object v7, v0, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    new-instance v8, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v8}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    const-wide/16 v9, 0x34f

    invoke-virtual {v8, v9, v10}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    move-result-object v11

    const/4 v8, 0x2

    if-eqz v2, :cond_8b

    const/4 v9, 0x3

    const/4 v12, 0x3

    goto :goto_8c

    :cond_8b
    const/4 v12, 0x2

    :goto_8c
    invoke-static/range {p0 .. p0}, Le/e/a/MediaControls;->position(Le/e/a/MediaControls$State;)J

    move-result-wide v13

    if-eqz v2, :cond_94

    move v15, v3

    goto :goto_96

    :cond_94
    const/4 v3, 0x0

    const/4 v15, 0x0

    :goto_96
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v16

    invoke-virtual/range {v11 .. v17}, Landroid/media/session/PlaybackState$Builder;->setState(IJFJ)Landroid/media/session/PlaybackState$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v3

    invoke-virtual {v7, v3}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    .line 61
    iget-wide v9, v0, Le/e/a/MediaControls$State;->lastDuration:J

    cmp-long v3, v5, v9

    if-nez v3, :cond_af

    iget-boolean v3, v0, Le/e/a/MediaControls$State;->lastPlaying:Z

    if-eq v2, v3, :cond_1af

    .line 62
    :cond_af
    iget-object v3, v0, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    new-instance v7, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v7}, Landroid/media/MediaMetadata$Builder;-><init>()V

    const-string v9, "android.media.metadata.TITLE"

    iget-object v10, v0, Le/e/a/MediaControls$State;->title:Ljava/lang/String;

    invoke-virtual {v7, v9, v10}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v7

    const-string v9, "android.media.metadata.DISPLAY_SUBTITLE"

    invoke-virtual {v7, v9, v1}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v7

    const-string v9, "android.media.metadata.DURATION"

    const-wide/16 v10, 0x0

    invoke-static {v10, v11, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    invoke-virtual {v7, v9, v10, v11}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v7

    iget-object v9, v0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    invoke-static {v3, v7, v9}, Le/e/a/FeedbackMedia;->apply(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;Ljava/lang/Object;)V

    .line 63
    iget-object v3, v0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    const-string v7, "notification"

    invoke-virtual {v3, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    const-string v7, "nicoid-media"

    .line 64
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1a

    if-lt v9, v10, :cond_101

    new-instance v9, Landroid/app/NotificationChannel;

    const-string v11, "\u52d5\u753b\u518d\u751f"

    invoke-static/range {v11 .. v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static/range {v11 .. v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v7, v11, v8}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v3, v9}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 65
    :cond_101
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v9, v10, :cond_10d

    new-instance v9, Landroid/app/Notification$Builder;

    iget-object v10, v0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    invoke-direct {v9, v10, v7}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_114

    :cond_10d
    new-instance v9, Landroid/app/Notification$Builder;

    iget-object v7, v0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    invoke-direct {v9, v7}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 66
    :goto_114
    iget-object v7, v0, Le/e/a/MediaControls$State;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->icon:I

    .line 67
    invoke-virtual {v9, v7}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v7

    iget-object v10, v0, Le/e/a/MediaControls$State;->title:Ljava/lang/String;

    invoke-virtual {v7, v10}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    invoke-virtual {v7, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-static/range {p0 .. p0}, Le/e/a/MediaControls;->open(Le/e/a/MediaControls$State;)Landroid/app/PendingIntent;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 68
    if-eqz v2, :cond_145

    const v10, 0x1080023

    goto :goto_148

    :cond_145
    const v10, 0x1080024

    :goto_148
    if-eqz v2, :cond_14d

    const-string v11, "\u4e00\u6642\u505c\u6b62"

    goto :goto_157

    :cond_14d
    const-string v11, "\u518d\u751f\u3059\u308b"

    invoke-static/range {v11 .. v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static/range {v11 .. v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    :goto_157
    invoke-static {v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "toggle"

    invoke-static {v0, v12, v7}, Le/e/a/MediaControls;->action(Le/e/a/MediaControls$State;Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v12

    invoke-virtual {v1, v10, v11, v12}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    const-string v10, "\u505c\u6b62"

    .line 69
    invoke-static {v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "stop"

    invoke-static {v0, v11, v8}, Le/e/a/MediaControls;->action(Le/e/a/MediaControls$State;Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v8

    const v11, 0x1080038

    invoke-virtual {v1, v11, v10, v8}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    new-instance v8, Landroid/app/Notification$MediaStyle;

    invoke-direct {v8}, Landroid/app/Notification$MediaStyle;-><init>()V

    iget-object v10, v0, Le/e/a/MediaControls$State;->session:Landroid/media/session/MediaSession;

    .line 70
    invoke-virtual {v10}, Landroid/media/session/MediaSession;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/app/Notification$MediaStyle;->setMediaSession(Landroid/media/session/MediaSession$Token;)Landroid/app/Notification$MediaStyle;

    move-result-object v8

    filled-new-array {v4, v7}, [I

    move-result-object v4

    invoke-virtual {v8, v4}, Landroid/app/Notification$MediaStyle;->setShowActionsInCompactView([I)Landroid/app/Notification$MediaStyle;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 71
    invoke-virtual {v9}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    iput-object v1, v0, Le/e/a/MediaControls$State;->notification:Landroid/app/Notification;

    iget-boolean v4, v0, Le/e/a/MediaControls$State;->popup:Z

    if-eqz v4, :cond_1a6

    iget-object v3, v0, Le/e/a/MediaControls$State;->owner:Ljava/lang/Object;

    check-cast v3, Landroid/app/Service;

    iget v4, v0, Le/e/a/MediaControls$State;->notificationId:I

    invoke-virtual {v3, v4, v1}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    goto :goto_1ab

    :cond_1a6
    iget v4, v0, Le/e/a/MediaControls$State;->notificationId:I

    invoke-virtual {v3, v4, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 72
    :goto_1ab
    iput-wide v5, v0, Le/e/a/MediaControls$State;->lastDuration:J

    iput-boolean v2, v0, Le/e/a/MediaControls$State;->lastPlaying:Z
    :try_end_1af
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1af} :catch_1b0

    .line 74
    :cond_1af
    goto :goto_1b4

    :catch_1b0
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_1b4
    return-void
.end method
