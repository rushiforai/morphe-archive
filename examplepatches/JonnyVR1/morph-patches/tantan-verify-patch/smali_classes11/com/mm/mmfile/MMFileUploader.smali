.class Lcom/mm/mmfile/MMFileUploader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mmfile/MMFileUploader$ClockHandler;,
        Lcom/mm/mmfile/MMFileUploader$TimeConfig;,
        Lcom/mm/mmfile/MMFileUploader$Holder;
    }
.end annotation


# static fields
.field private static final THREAD_NAME:Ljava/lang/String; = "MMFileUploader"


# instance fields
.field private configs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/mm/mmfile/MMFileUploader$TimeConfig;",
            ">;"
        }
    .end annotation
.end field

.field private isPause:Z

.field private lock:Ljava/util/concurrent/locks/Lock;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private nextConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/mm/mmfile/MMFileUploader;->isPause:Z

    .line 20
    .line 21
    return-void
.end method

.method public synthetic constructor <init>(Lcom/mm/mmfile/MMFileUploader$1;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/mm/mmfile/MMFileUploader;-><init>()V

    return-void
.end method

.method public static synthetic access$200(Lcom/mm/mmfile/FileUploadConfig;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/mm/mmfile/MMFileUploader;->uploadFile(Lcom/mm/mmfile/FileUploadConfig;Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/mm/mmfile/MMFileUploader;->performUpload(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/mm/mmfile/MMFileUploader;)Ljava/util/concurrent/locks/Lock;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/mm/mmfile/MMFileUploader;)Lcom/mm/mmfile/MMFileUploader$TimeConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->nextConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$502(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/MMFileUploader$TimeConfig;)Lcom/mm/mmfile/MMFileUploader$TimeConfig;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/MMFileUploader;->nextConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$600(Lcom/mm/mmfile/MMFileUploader;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/mm/mmfile/MMFileUploader;->enqueueUploadConfig(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private declared-synchronized checkThread()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->mHandlerThread:Landroid/os/HandlerThread;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Landroid/os/HandlerThread;

    .line 7
    .line 8
    const-string v1, "MMFileUploader"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->mHandlerThread:Landroid/os/HandlerThread;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/mm/mmfile/MMFileUploader$ClockHandler;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/mm/mmfile/MMFileUploader;->mHandlerThread:Landroid/os/HandlerThread;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, p0, v1}, Lcom/mm/mmfile/MMFileUploader$ClockHandler;-><init>(Lcom/mm/mmfile/MMFileUploader;Landroid/os/Looper;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw v0
.end method

.method private enqueueUploadConfig(Lcom/mm/mmfile/FileUploadConfig;)V
    .locals 1

    .line 79
    :try_start_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 80
    new-instance v0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    invoke-direct {v0, p0, p1}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;-><init>(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/FileUploadConfig;)V

    .line 81
    invoke-direct {p0, v0}, Lcom/mm/mmfile/MMFileUploader;->enqueueUploadConfig(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 83
    throw p1
.end method

.method private enqueueUploadConfig(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/lit8 v0, v0, -0x1

    .line 20
    .line 21
    :goto_0
    if-ltz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getNextClockTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-object v3, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getNextClockTime()J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    cmp-long v1, v1, v3

    .line 40
    .line 41
    if-lez v1, :cond_1

    .line 42
    .line 43
    iget-object v1, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 44
    .line 45
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    invoke-interface {v1, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :goto_1
    invoke-virtual {p1}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string v0, "MMFile"

    .line 69
    .line 70
    const-string v1, "MMFileUploader: enqueueUploadConfig add uploadConfig: %s"

    .line 71
    .line 72
    invoke-static {v0, v1, p1}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Lcom/mm/mmfile/MMFileUploader;->launchNextTask()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static get()Lcom/mm/mmfile/MMFileUploader;
    .locals 1

    .line 1
    invoke-static {}, Lcom/mm/mmfile/MMFileUploader$Holder;->access$100()Lcom/mm/mmfile/MMFileUploader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private launchNextTask()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/mm/mmfile/MMFileUploader;->isPause:Z

    .line 2
    .line 3
    const-string v1, "MMFile"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const-string p0, "mmfile upload task is paused"

    .line 9
    .line 10
    new-array v0, v2, [Ljava/lang/Object;

    .line 11
    .line 12
    invoke-static {v1, p0, v0}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->nextConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v4, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-ne v0, v4, :cond_1

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    const-string v0, "MMFileUploader: \u63d2\u4e2a\u961f"

    .line 31
    .line 32
    new-array v4, v2, [Ljava/lang/Object;

    .line 33
    .line 34
    invoke-static {v1, v0, v4}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->mHandler:Landroid/os/Handler;

    .line 38
    .line 39
    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->nextConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getNextClockTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide v6

    .line 64
    sub-long/2addr v4, v6

    .line 65
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const-string v4, "MMFileUploader: next config: %s, time clock after: %d"

    .line 74
    .line 75
    invoke-static {v1, v4, v2}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->mHandler:Landroid/os/Handler;

    .line 79
    .line 80
    invoke-static {p0, v3, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getNextClockTime()J

    .line 85
    .line 86
    .line 87
    move-result-wide v2

    .line 88
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendMessageAtTime(Landroid/os/Message;J)Z

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private static performUpload(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/mm/mmfile/MMFileRegister;->getFileWriteConfig(Lcom/mm/mmfile/FileUploadConfig;)Lcom/mm/mmfile/core/FileWriteConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/mm/mmfile/MMFile;->getIfCreated(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/MMFile;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    if-eqz v6, :cond_0

    .line 14
    .line 15
    invoke-virtual {v6}, Lcom/mm/mmfile/MMFile;->flush()V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget-object v1, Lcom/mm/mmfile/SortType;->POSITIVE:Lcom/mm/mmfile/SortType;

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    const/4 v5, 0x1

    .line 22
    const/4 v2, 0x7

    .line 23
    const/16 v3, 0x14

    .line 24
    .line 25
    invoke-static/range {v0 .. v5}, Lcom/mm/mmfile/MMFileUtil;->getFiles(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/SortType;IIZZ)[Ljava/io/File;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v6, :cond_1

    .line 30
    .line 31
    invoke-virtual {v6}, Lcom/mm/mmfile/MMFile;->openNewLogFile()V

    .line 32
    .line 33
    .line 34
    :cond_1
    const/4 v1, 0x0

    .line 35
    const-string v2, "MMFile"

    .line 36
    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    array-length v3, v0

    .line 40
    if-nez v3, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    array-length v3, v0

    .line 44
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const-string v4, "prepare to upload file size: %d"

    .line 53
    .line 54
    invoke-static {v2, v4, v3}, Lcom/mm/mmfile/Logger;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    array-length v2, v0

    .line 58
    :goto_0
    if-ge v1, v2, :cond_3

    .line 59
    .line 60
    aget-object v3, v0, v1

    .line 61
    .line 62
    invoke-static {p0, v3}, Lcom/mm/mmfile/MMFileUploader;->uploadFile(Lcom/mm/mmfile/FileUploadConfig;Ljava/io/File;)V

    .line 63
    .line 64
    .line 65
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    return-void

    .line 69
    :cond_4
    :goto_1
    const-string p0, "no file need to upload"

    .line 70
    .line 71
    new-array v0, v1, [Ljava/lang/Object;

    .line 72
    .line 73
    invoke-static {v2, p0, v0}, Lcom/mm/mmfile/Logger;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private static uploadFile(Lcom/mm/mmfile/FileUploadConfig;Ljava/io/File;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "MMFile"

    .line 10
    .line 11
    const-string v2, "MMFileUploader: uploadFile, %s"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, "_"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/mm/mmfile/FileUploadConfig;->getUploader()Lcom/mm/mmfile/IMMFileUploader;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v1, v0}, Lcom/mm/mmfile/IMMFileUploader;->upload(Ljava/io/File;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/mm/mmfile/FileUploadConfig;->isDeleteAfterUploaded()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_2

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    invoke-virtual {v0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    invoke-virtual {v0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 97
    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public forceUploadMMFile()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v1, "MMFile"

    .line 5
    .line 6
    const-string v2, "MMFileUploader: forceUploadMMFile"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 47
    .line 48
    new-instance v2, Lcom/mm/mmfile/MMFileUploader$2;

    .line 49
    .line 50
    invoke-direct {v2, p0, v1}, Lcom/mm/mmfile/MMFileUploader$2;-><init>(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v2}, Lcom/mm/mmfile/RadarThreadUtil;->run(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception v0

    .line 58
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 61
    .line 62
    .line 63
    throw v0
.end method

.method public forceUploadMMFile(Ljava/lang/String;)V
    .locals 2

    .line 64
    invoke-static {p1}, Lcom/mm/mmfile/MMFileUtil;->getUploadConfigByFile(Ljava/lang/String;)Lcom/mm/mmfile/FileUploadConfig;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {v0}, Lcom/mm/mmfile/FileUploadConfig;->getUploader()Lcom/mm/mmfile/IMMFileUploader;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 66
    new-instance v1, Lcom/mm/mmfile/MMFileUploader$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/mm/mmfile/MMFileUploader$1;-><init>(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/FileUploadConfig;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/mm/mmfile/RadarThreadUtil;->run(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public register(Lcom/mm/mmfile/FileUploadConfig;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/mm/mmfile/FileUploadConfig;->getUploadClockTimeSeconds()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/mm/mmfile/FileUploadConfig;->getUploader()Lcom/mm/mmfile/IMMFileUploader;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-direct {p0}, Lcom/mm/mmfile/MMFileUploader;->checkThread()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/mm/mmfile/MMFileUploader;->enqueueUploadConfig(Lcom/mm/mmfile/FileUploadConfig;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public setPause(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/mm/mmfile/MMFileUploader;->isPause:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/mm/mmfile/MMFileUploader;->isPause:Z

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    const-string v1, "MMFile"

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const-string v0, "resume upload task"

    .line 14
    .line 15
    new-array p1, p1, [Ljava/lang/Object;

    .line 16
    .line 17
    invoke-static {v1, v0, p1}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/mm/mmfile/MMFileUploader;->launchNextTask()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const-string v0, "pause upload task"

    .line 25
    .line 26
    new-array p1, p1, [Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {v1, v0, p1}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-object p1, p0, Lcom/mm/mmfile/MMFileUploader;->nextConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->mHandler:Landroid/os/Handler;

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public setUploadClockTimeSeconds(Lcom/mm/mmfile/FileUploadConfig;J)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v1, "MMFile"

    .line 5
    .line 6
    const-string v2, "MMFileUploader: setUploadClockTimeSeconds"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Lcom/mm/mmfile/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/mm/mmfile/MMFileUploader;->forceUploadMMFile()V

    .line 12
    .line 13
    .line 14
    :try_start_0
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;

    .line 39
    .line 40
    .line 41
    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    if-ne v3, p1, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_2

    .line 47
    :cond_1
    move-object v1, v2

    .line 48
    :goto_0
    if-nez v1, :cond_2

    .line 49
    .line 50
    :goto_1
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 51
    .line 52
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    :try_start_1
    invoke-virtual {p1, p2, p3}, Lcom/mm/mmfile/FileUploadConfig;->setUploadClockTimeSeconds(J)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->nextTime()V

    .line 60
    .line 61
    .line 62
    iput-object v2, p0, Lcom/mm/mmfile/MMFileUploader;->nextConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 63
    .line 64
    iget-object p1, p0, Lcom/mm/mmfile/MMFileUploader;->mHandler:Landroid/os/Handler;

    .line 65
    .line 66
    const/4 p2, 0x1

    .line 67
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeMessages(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/mm/mmfile/MMFileUploader;->configs:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    invoke-direct {p0, v1}, Lcom/mm/mmfile/MMFileUploader;->enqueueUploadConfig(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :goto_2
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader;->lock:Ljava/util/concurrent/locks/Lock;

    .line 80
    .line 81
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 82
    .line 83
    .line 84
    throw p1
.end method
