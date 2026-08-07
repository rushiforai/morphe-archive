.class public final Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;
.super Lcom/tantanapp/sharelib/workmanager/Worker;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0015B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001f\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "Landroid/content/Context;",
        "appContext",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "workInfo",
        "<init>",
        "(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;",
        "zipFileInfo",
        "",
        "filePath",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "procedureDownloadFile",
        "(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;",
        "",
        "t",
        "shouldRetry",
        "(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;",
        "doWork",
        "()Lcom/tantanapp/sharelib/workmanager/Result;",
        "a",
        "sharedlibrarymanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/sharelib/workmanager/WorkInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/sharelib/workmanager/Worker;-><init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static final synthetic access$procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$shouldRetry(Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getMd5()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 12
    .line 13
    const-string p1, "File info->md5 is empty"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 21
    .line 22
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    new-instance p1, Ljava/lang/Exception;

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "After download file not exists: "

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, p1}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    invoke-virtual {p1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getMd5()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ljava/io/File;

    .line 60
    .line 61
    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/o1m;->g(Ljava/io/File;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    new-instance v0, Ljava/lang/Exception;

    .line 75
    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v2, "File md5 not match: file->"

    .line 79
    .line 80
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    new-instance v2, Ljava/io/File;

    .line 84
    .line 85
    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v2}, Ll/o1m;->g(Ljava/io/File;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string p2, ", info->"

    .line 96
    .line 97
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getMd5()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {p0, v0}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_2
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 120
    .line 121
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 122
    .line 123
    invoke-direct {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 124
    .line 125
    .line 126
    const-string v1, "key_file_path"

    .line 127
    .line 128
    invoke-virtual {v0, v1, p2}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->e(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    const-string v0, "key_download_info"

    .line 133
    .line 134
    invoke-virtual {p2, v0, p1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-direct {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 143
    .line 144
    .line 145
    return-object p0
.end method

.method private final shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Constraints;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->c()Lcom/tantanapp/sharelib/workmanager/Result$Retry;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->b(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method


# virtual methods
.method public doWork()Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 14
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "key_file_path"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->Companion:Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "key_download_info"

    .line 22
    .line 23
    invoke-virtual {v1, v4, v3}, Lcom/tantanapp/sharelib/workmanager/Data;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 28
    .line 29
    new-instance v3, Ljava/util/concurrent/CountDownLatch;

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    invoke-direct {v3, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 33
    .line 34
    .line 35
    new-array v4, v4, [Lcom/tantanapp/sharelib/workmanager/Result;

    .line 36
    .line 37
    sget-object v5, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 38
    .line 39
    invoke-virtual {v5}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->d()Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    const/4 v7, 0x0

    .line 44
    aput-object v6, v4, v7

    .line 45
    .line 46
    :try_start_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-lez v0, :cond_0

    .line 51
    .line 52
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-direct {v0, v1}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 63
    .line 64
    .line 65
    return-object v0

    .line 66
    :catch_0
    move-exception v0

    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :cond_0
    invoke-virtual {v2}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    const-string v0, "Target zip file info is empty"

    .line 80
    .line 81
    invoke-virtual {v5, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const-string v2, "key_module_path"

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v2, Ljava/io/File;

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-direct {v2, v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getUrl()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    const-string v2, "file://assets/"

    .line 114
    .line 115
    const/4 v5, 0x2

    .line 116
    const/4 v6, 0x0

    .line 117
    invoke-static {v8, v2, v7, v5, v6}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    if-eqz v2, :cond_2

    .line 122
    .line 123
    :try_start_1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getAppContext()Landroid/content/Context;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    const-string v9, "file://assets/"

    .line 132
    .line 133
    const-string v10, ""

    .line 134
    .line 135
    const/4 v12, 0x4

    .line 136
    const/4 v13, 0x0

    .line 137
    const/4 v11, 0x0

    .line 138
    invoke-static/range {v8 .. v13}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    new-instance v3, Ljava/io/FileOutputStream;

    .line 150
    .line 151
    new-instance v8, Ljava/io/File;

    .line 152
    .line 153
    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-direct {v3, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 157
    .line 158
    .line 159
    invoke-static {v2, v3, v7, v5, v6}, Lkotlin/io/ByteStreamsKt;->b(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 163
    .line 164
    .line 165
    invoke-direct {p0, v1, v0}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 166
    .line 167
    .line 168
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 169
    return-object p0

    .line 170
    :catch_1
    move-exception v0

    .line 171
    :try_start_2
    invoke-direct {p0, v0}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    :cond_2
    sget-object v2, Ll/r3f0;->Companion:Ll/r3f0$a;

    .line 177
    .line 178
    invoke-virtual {v2}, Ll/r3f0$a;->a()Ll/r3f0;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v2}, Ll/r3f0;->g()Ll/eyl;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 186
    .line 187
    .line 188
    new-instance v0, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$b;

    .line 189
    .line 190
    invoke-direct {v0, v4, p0, v1, v3}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker$b;-><init>([Lcom/tantanapp/sharelib/workmanager/Result;Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/util/concurrent/CountDownLatch;)V

    .line 191
    .line 192
    .line 193
    throw v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 194
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 195
    .line 196
    .line 197
    invoke-direct {p0, v0}, Lcom/tantanapp/common/nativelib/manager/worker/DownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    aput-object p0, v4, v7

    .line 202
    .line 203
    return-object p0
.end method
