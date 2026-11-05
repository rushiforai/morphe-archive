.class public final Le/e/a/DownloadWorker115;
.super Ljava/lang/Object;
.source "DownloadWorker115.java"


# static fields
.field static final MAIN:Landroid/os/Handler;

.field static volatile active:Le/e/a/DownloadJobs115$Job;

.field static destroyed:Z

.field static notified:J

.field static service:Landroid/app/Service;

.field static transfer:Le/e/a/Mp4Transfer115;

.field static worker:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static cancel(Le/e/a/DownloadJobs115$Job;)V
    .registers 2

    .line 9
    sget-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    if-eq v0, p0, :cond_5

    return-void

    :cond_5
    sget-object p0, Le/e/a/DownloadWorker115;->transfer:Le/e/a/Mp4Transfer115;

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->cancel()V

    :cond_c
    sget-object p0, Le/e/a/DownloadWorker115;->worker:Ljava/lang/Thread;

    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    :cond_13
    return-void
.end method

.method public static command(Landroid/app/Service;Landroid/content/Intent;)Z
    .registers 5

    .line 6
    const/4 v0, 0x0

    if-eqz p1, :cond_1e

    const-string v1, "nicoid_mp4_cancel115"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_c

    goto :goto_1e

    :cond_c
    invoke-static {p0}, Le/e/a/DownloadJobs115;->init(Landroid/content/Context;)V

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DownloadJobs115;->find(Ljava/lang/String;)Le/e/a/DownloadJobs115$Job;

    move-result-object p0

    if-eqz p0, :cond_1c

    invoke-static {p0, v0}, Le/e/a/DownloadJobs115;->control(Le/e/a/DownloadJobs115$Job;Z)V

    :cond_1c
    const/4 p0, 0x1

    return p0

    :cond_1e
    :goto_1e
    return v0
.end method

.method public static destroyed(Ljava/lang/Object;)V
    .registers 2

    .line 10
    sget-object v0, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;

    if-eq p0, v0, :cond_5

    return-void

    :cond_5
    const/4 p0, 0x1

    sput-boolean p0, Le/e/a/DownloadWorker115;->destroyed:Z

    sget-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    if-eqz v0, :cond_11

    iput-boolean p0, v0, Le/e/a/DownloadJobs115$Job;->paused:Z

    invoke-static {v0}, Le/e/a/DownloadWorker115;->cancel(Le/e/a/DownloadJobs115$Job;)V

    :cond_11
    const/4 p0, 0x0

    sput-object p0, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;

    return-void
.end method

.method static finish(Landroid/app/Service;)V
    .registers 6

    .line 12
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "u"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/util/List;

    const/4 v3, 0x0

    if-eqz v2, :cond_2b

    monitor-enter v0
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_7f

    :try_start_15
    move-object v2, v0

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_25

    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;

    goto :goto_26

    :cond_25
    move-object v2, v1

    :goto_26
    monitor-exit v0

    goto :goto_2c

    :catchall_28
    move-exception v1

    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_15 .. :try_end_2a} :catchall_28

    :try_start_2a
    throw v1

    :cond_2b
    move-object v2, v1

    :goto_2c
    if-eqz v2, :cond_68

    const-string v0, "nicoid_mp4_job115"

    invoke-virtual {v2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_50

    invoke-static {p0}, Le/e/a/CacheProgress;->start(Landroid/content/Context;)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_39} :catch_7f

    :try_start_39
    const-string v0, "i"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    const-string v1, "l"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    const-wide/16 v3, 0x3e8

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_4e} :catch_4f

    goto :goto_50

    :catch_4f
    move-exception v0

    :cond_50
    :goto_50
    :try_start_50
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "b"

    const-class v3, Landroid/content/Intent;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8a

    :cond_68
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "v"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Service;->stopForeground(Z)V

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    sput-object v1, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_7e} :catch_7f

    goto :goto_8a

    :catch_7f
    move-exception v0

    const-string v1, "nicoid-download"

    const-string v2, "Cannot continue download queue"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :goto_8a
    return-void
.end method

.method static synthetic lambda$0(Le/e/a/Mp4Transfer115;Landroid/app/Service;Le/e/a/DownloadJobs115$Job;Ljava/lang/Object;)V
    .registers 8

    .line 11
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    if-eqz v1, :cond_18

    const-string v2, "nicoid:mp4-save"

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    const-wide/32 v1, 0x1499700

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    :cond_18
    invoke-virtual {p0, p3}, Le/e/a/Mp4Transfer115;->run(Ljava/lang/Object;)Ljava/io/File;

    move-result-object p3

    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    invoke-static {p1, p2, p3}, Le/e/a/DownloadJobs115;->export(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;Ljava/io/File;)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_22} :catch_42
    .catchall {:try_start_1 .. :try_end_22} :catchall_3f

    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->clean()V

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p0

    if-eqz p0, :cond_30

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_30
    invoke-static {p1}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    sget-object p0, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;

    invoke-direct {p3, p2, p1}, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;-><init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    :goto_3a
    invoke-virtual {p0, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_c5

    :catchall_3f
    move-exception p3

    goto/16 :goto_c6

    :catch_42
    move-exception p3

    :try_start_43
    iget-boolean v1, p2, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-eqz v1, :cond_4a

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    goto :goto_53

    :cond_4a
    iget-boolean v1, p2, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-eqz v1, :cond_51

    const-string v1, "\u4e00\u6642\u505c\u6b62"

    goto :goto_53

    :cond_51
    const-string v1, "\u30a8\u30e9\u30fc"

    :goto_53
    iput-object v1, p2, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    iget-boolean v1, p2, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-eqz v1, :cond_5c

    const-string v1, "\u518d\u958b\u6642\u306f\u53d6\u5f97\u3092\u3084\u308a\u76f4\u3057\u307e\u3059"

    goto :goto_8d

    :cond_5c
    iget-boolean v1, p2, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-eqz v1, :cond_63

    const-string v1, ""

    goto :goto_8d

    :cond_63
    instance-of v1, p3, Ljava/io/IOException;

    if-eqz v1, :cond_70

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_8d

    :cond_70
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MP4\u306e\u4fdd\u5b58\u306b\u5931\u6557\u3057\u307e\u3057\u305f ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_8d
    iput-object v1, p2, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    const-string v1, "nicoid-download"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "MP4 save did not complete: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v1, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_ab
    .catchall {:try_start_43 .. :try_end_ab} :catchall_3f

    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->clean()V

    if-eqz v0, :cond_b9

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p0

    if-eqz p0, :cond_b9

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_b9
    invoke-static {p1}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    sget-object p0, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;

    invoke-direct {p3, p2, p1}, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;-><init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    goto/16 :goto_3a

    :goto_c5
    return-void

    :goto_c6
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->clean()V

    if-eqz v0, :cond_d4

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p0

    if-eqz p0, :cond_d4

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_d4
    invoke-static {p1}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    sget-object p0, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2, p1}, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda1;-><init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw p3
.end method

.method static synthetic lambda$1(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V
    .registers 3

    .line 11
    sget-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    if-ne v0, p0, :cond_16

    const/4 p0, 0x0

    sput-object p0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    sput-object p0, Le/e/a/DownloadWorker115;->transfer:Le/e/a/Mp4Transfer115;

    sput-object p0, Le/e/a/DownloadWorker115;->worker:Ljava/lang/Thread;

    sget-boolean p0, Le/e/a/DownloadWorker115;->destroyed:Z

    if-nez p0, :cond_16

    sget-object p0, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;

    if-ne p0, p1, :cond_16

    invoke-static {p1}, Le/e/a/DownloadWorker115;->finish(Landroid/app/Service;)V

    :cond_16
    return-void
.end method

.method static synthetic lambda$2(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V
    .registers 3

    .line 13
    sget-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    if-ne v0, p0, :cond_b

    sget-boolean v0, Le/e/a/DownloadWorker115;->destroyed:Z

    if-nez v0, :cond_b

    invoke-static {p1, p0}, Le/e/a/DownloadWorker115;->publish(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;)V

    :cond_b
    return-void
.end method

.method static progress()V
    .registers 6

    .line 13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sget-wide v2, Le/e/a/DownloadWorker115;->notified:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long v2, v2, v4

    if-gez v2, :cond_f

    return-void

    :cond_f
    sput-wide v0, Le/e/a/DownloadWorker115;->notified:J

    sget-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    sget-object v1, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;

    if-eqz v0, :cond_23

    if-eqz v1, :cond_23

    sget-object v2, Le/e/a/DownloadWorker115;->MAIN:Landroid/os/Handler;

    new-instance v3, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda2;

    invoke-direct {v3, v0, v1}, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda2;-><init>(Le/e/a/DownloadJobs115$Job;Landroid/app/Service;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_23
    return-void
.end method

.method static publish(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;)V
    .registers 10

    .line 14
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    new-instance v1, Landroid/app/NotificationChannel;

    const-string v2, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9"

    const/4 v3, 0x2

    const-string v4, "nicoid_mp4_download"

    invoke-direct {v1, v4, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1}, Le/e/a/DownloadJobs115$Job;->percent()I

    move-result v1

    const v2, 0x1080081

    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    iget-object v3, p1, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " \u00b7 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p1, Le/e/a/DownloadJobs115$Job;->bytes:J

    invoke-static {v4, v5}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p1, Le/e/a/DownloadJobs115$Job;->total:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_64

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, " / "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v5, p1, Le/e/a/DownloadJobs115$Job;->total:J

    invoke-static {v5, v6}, Le/e/a/DownloadJobs115;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_66

    :cond_64
    const-string v4, ""

    :goto_66
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    const/4 v4, 0x0

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-ltz v1, :cond_8d

    const-string v1, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u4e2d"

    iget-object v6, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8d

    move v3, v4

    :cond_8d
    const/16 v1, 0x64

    invoke-virtual {v2, v1, v5, v3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    invoke-static {p0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_mp4_cancel115"

    iget-object p1, p1, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const/16 v1, 0x73

    const/high16 v2, 0xc000000

    invoke-static {p0, v1, p1, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    const v1, 0x1080038

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {v0, v1, v2, p1}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    :try_start_c0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v1, "a"

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V
    :try_end_d5
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_d5} :catch_d6

    goto :goto_de

    :catch_d6
    move-exception p0

    const-string p1, "nicoid-download"

    const-string v0, "Cannot update download notification"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_de
    return-void
.end method

.method public static ready(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 3

    .line 5
    if-eqz p1, :cond_a

    const-string v0, "nicoid_mp4_job115"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_12

    :cond_a
    invoke-static {p0}, Le/e/a/CacheFolders;->workerReady(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method static running(Le/e/a/DownloadJobs115$Job;)Z
    .registers 2

    .line 7
    sget-object v0, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    if-ne v0, p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public static start(Ljava/lang/Object;Landroid/content/Intent;)Z
    .registers 8

    .line 11
    instance-of v0, p0, Landroid/app/Service;

    const/4 v1, 0x0

    if-eqz v0, :cond_ed

    if-eqz p1, :cond_ed

    const-string v0, "nicoid_mp4_job115"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_11

    goto/16 :goto_ed

    :cond_11
    check-cast p0, Landroid/app/Service;

    invoke-static {p0}, Le/e/a/DownloadJobs115;->init(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/DownloadJobs115;->find(Ljava/lang/String;)Le/e/a/DownloadJobs115$Job;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_e9

    iget-boolean v2, p1, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-nez v2, :cond_e9

    iget-boolean v2, p1, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-nez v2, :cond_e9

    const-string v2, "\u30ad\u30e5\u30fc\u5f85\u3061"

    iget-object v3, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_35

    goto/16 :goto_e9

    :cond_35
    const/4 v2, 0x0

    :try_start_36
    sput-object p0, Le/e/a/DownloadWorker115;->service:Landroid/app/Service;

    sput-boolean v1, Le/e/a/DownloadWorker115;->destroyed:Z

    sput-object p1, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p1, Le/e/a/DownloadJobs115$Job;->started:J

    const-string v1, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u4e2d"

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-static {}, Le/e/a/CacheProgress;->stop()V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_49} :catch_d7

    :try_start_49
    const-string v1, "i"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Handler;

    const-string v3, "l"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_5c} :catch_5d

    goto :goto_5e

    :catch_5d
    move-exception v1

    :goto_5e
    :try_start_5e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "t"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iget-object v3, p1, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v1, "e.e.a.d0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v3, Landroid/content/Context;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v3, "r"

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v1, v3, v4}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "n"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v4

    const-string v5, "user_session="

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v1, v3, v4}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "I"

    const-string v4, "e.e.a.v0"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "b"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v1, v3, v4}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v3, Le/e/a/Mp4Transfer115;

    invoke-direct {v3, p0, p1}, Le/e/a/Mp4Transfer115;-><init>(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)V

    sput-object v3, Le/e/a/DownloadWorker115;->transfer:Le/e/a/Mp4Transfer115;

    invoke-static {p0, p1}, Le/e/a/DownloadWorker115;->publish(Landroid/app/Service;Le/e/a/DownloadJobs115$Job;)V

    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    sget-object v3, Le/e/a/DownloadWorker115;->transfer:Le/e/a/Mp4Transfer115;

    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda0;

    invoke-direct {v5, v3, p0, p1, v1}, Le/e/a/DownloadWorker115$$ExternalSyntheticLambda0;-><init>(Le/e/a/Mp4Transfer115;Landroid/app/Service;Le/e/a/DownloadJobs115$Job;Ljava/lang/Object;)V

    const-string v1, "nicoid-mp4-save"

    invoke-direct {v4, v5, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v4, Le/e/a/DownloadWorker115;->worker:Ljava/lang/Thread;

    sget-object v1, Le/e/a/DownloadWorker115;->worker:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_d6} :catch_d7

    goto :goto_e8

    :catch_d7
    move-exception v1

    const-string v1, "\u30a8\u30e9\u30fc"

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    const-string v1, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u306e\u6e96\u5099\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    sput-object v2, Le/e/a/DownloadWorker115;->active:Le/e/a/DownloadJobs115$Job;

    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/DownloadWorker115;->finish(Landroid/app/Service;)V

    :goto_e8
    return v0

    :cond_e9
    :goto_e9
    invoke-static {p0}, Le/e/a/DownloadWorker115;->finish(Landroid/app/Service;)V

    return v0

    :cond_ed
    :goto_ed
    return v1
.end method

.method static unqueue(Le/e/a/DownloadJobs115$Job;)V
    .registers 6

    .line 8
    :try_start_0
    const-string v0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "u"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_4c

    monitor-enter v0
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_44

    :try_start_16
    move-object v1, v0

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1d
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_25

    monitor-exit v0

    goto :goto_4c

    :cond_25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Landroid/content/Intent;

    if-eqz v3, :cond_1d

    iget-object v3, p0, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    check-cast v2, Landroid/content/Intent;

    const-string v4, "nicoid_mp4_job115"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1d

    :catchall_41
    move-exception p0

    monitor-exit v0
    :try_end_43
    .catchall {:try_start_16 .. :try_end_43} :catchall_41

    :try_start_43
    throw p0
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_44} :catch_44

    :catch_44
    move-exception p0

    const-string v0, "nicoid-download"

    const-string v1, "Cannot remove queued download"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4c
    :goto_4c
    return-void
.end method
