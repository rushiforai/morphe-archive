.class Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;
.super Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediautils/download/DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/ttmediautils/download/DownloadManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;->this$0:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    :try_start_0
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;->this$0:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->getNextTask()Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;->this$0:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->addDoingTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :try_start_1
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->run()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_1

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    :try_start_2
    invoke-static {v1}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onFail(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    :goto_1
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isPaused()Z

    .line 31
    .line 32
    .line 33
    move-result v1
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    .line 34
    iget-object v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;->this$0:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    :try_start_3
    invoke-virtual {v2, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->addPauseTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_0
    invoke-virtual {v2, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->removeDoingTask(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onDestroy()V

    .line 46
    .line 47
    .line 48
    :goto_2
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadManager$1;->this$0:Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->getNextTask()Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 51
    .line 52
    .line 53
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_0

    .line 54
    goto :goto_0

    .line 55
    :catch_0
    move-exception p0

    .line 56
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    goto :goto_3

    .line 60
    :catch_1
    move-exception p0

    .line 61
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_3
    return-void
.end method
