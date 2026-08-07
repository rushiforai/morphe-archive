.class public final Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;
.super Lcom/tantanapp/sharelib/workmanager/Worker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0003\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016J \u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\rH\u0002J \u0010\u000f\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\rH\u0002J\u0010\u0010\u0010\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u0012H\u0002\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "appContext",
        "Landroid/content/Context;",
        "workInfo",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "doWork",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "download",
        "zipFileInfo",
        "Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;",
        "obbFilePath",
        "",
        "obbModuleFilePath",
        "procedureDownloadFile",
        "shouldRetry",
        "t",
        "",
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

.method public static final synthetic access$procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$shouldRetry(Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final download(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 15

    .line 1
    new-instance v6, Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {v6, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-array v1, v0, [Lcom/tantanapp/sharelib/workmanager/Result;

    .line 8
    .line 9
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->d()Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v7, 0x0

    .line 16
    aput-object v2, v1, v7

    .line 17
    .line 18
    :try_start_0
    sget-object v2, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->Companion:Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    move-object/from16 v3, p1

    .line 25
    .line 26
    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    const-string v2, "Target zip file info is empty"

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :catch_0
    move-exception v0

    .line 40
    goto :goto_3

    .line 41
    :cond_0
    invoke-virtual {v3}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getUrl()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    const-string v0, "file://assets/"

    .line 46
    .line 47
    const/4 v2, 0x2

    .line 48
    const/4 v14, 0x0

    .line 49
    invoke-static {v8, v0, v7, v2, v14}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getAppContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v9, "file://assets/"

    .line 64
    .line 65
    const-string v10, ""

    .line 66
    .line 67
    const/4 v12, 0x4

    .line 68
    const/4 v13, 0x0

    .line 69
    const/4 v11, 0x0

    .line 70
    invoke-static/range {v8 .. v13}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v0, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    new-instance v4, Ljava/io/FileOutputStream;

    .line 82
    .line 83
    new-instance v5, Ljava/io/File;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 84
    .line 85
    move-object/from16 v8, p3

    .line 86
    .line 87
    :try_start_2
    invoke-direct {v5, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v4, v7, v2, v14}, Lkotlin/io/ByteStreamsKt;->b(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    .line 94
    .line 95
    .line 96
    invoke-direct/range {p0 .. p3}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 97
    .line 98
    .line 99
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 100
    goto :goto_1

    .line 101
    :catch_1
    move-exception v0

    .line 102
    goto :goto_0

    .line 103
    :catch_2
    move-exception v0

    .line 104
    move-object/from16 v8, p3

    .line 105
    .line 106
    :goto_0
    :try_start_3
    invoke-direct {p0, v0}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    :goto_1
    aput-object v0, v1, v7

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_1
    move-object/from16 v8, p3

    .line 114
    .line 115
    :goto_2
    sget-object v0, Ll/r3f0;->Companion:Ll/r3f0$a;

    .line 116
    .line 117
    invoke-virtual {v0}, Ll/r3f0$a;->a()Ll/r3f0;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ll/r3f0;->g()Ll/eyl;

    .line 122
    .line 123
    .line 124
    new-instance v0, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker$a;

    .line 125
    .line 126
    move-object v2, p0

    .line 127
    move-object/from16 v4, p2

    .line 128
    .line 129
    move-object v5, v8

    .line 130
    invoke-direct/range {v0 .. v6}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker$a;-><init>([Lcom/tantanapp/sharelib/workmanager/Result;Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;Ljava/lang/String;Ljava/util/concurrent/CountDownLatch;)V

    .line 131
    .line 132
    .line 133
    throw v14
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 134
    :goto_3
    invoke-direct {p0, v0}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    aput-object p0, v1, v7

    .line 139
    .line 140
    return-object p0
.end method

.method private final procedureDownloadFile(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 6

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
    new-instance p3, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v0, "After download file not exists: "

    .line 36
    .line 37
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, p1}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

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
    const/4 v2, 0x1

    .line 69
    invoke-static {v0, v1, v2}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    new-instance p3, Ljava/lang/Exception;

    .line 76
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v1, "File md5 not match: file->"

    .line 80
    .line 81
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Ljava/io/File;

    .line 85
    .line 86
    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/o1m;->g(Ljava/io/File;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string p2, ", info->"

    .line 97
    .line 98
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getMd5()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-direct {p3, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-direct {p0, p3}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->shouldRetry(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :cond_2
    new-instance v0, Ljava/io/File;

    .line 121
    .line 122
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    new-instance v1, Ljava/io/File;

    .line 126
    .line 127
    invoke-direct {v1, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    const/4 v4, 0x4

    .line 131
    const/4 v5, 0x0

    .line 132
    const/4 v2, 0x1

    .line 133
    const/4 v3, 0x0

    .line 134
    invoke-static/range {v0 .. v5}, Ll/yki;->q(Ljava/io/File;Ljava/io/File;ZIILjava/lang/Object;)Ljava/io/File;

    .line 135
    .line 136
    .line 137
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 138
    .line 139
    new-instance p2, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 140
    .line 141
    invoke-direct {p2}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 142
    .line 143
    .line 144
    const-string v0, "key_file_path"

    .line 145
    .line 146
    invoke-virtual {p2, v0, p3}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->e(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    const-string p3, "key_download_info"

    .line 151
    .line 152
    invoke-virtual {p2, p3, p1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-direct {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 161
    .line 162
    .line 163
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
    .locals 7
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
    move-result-object v2

    .line 15
    const-string v3, "key_obb_file_path"

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    sget-object v4, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->Companion:Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;

    .line 26
    .line 27
    invoke-virtual {v4}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const-string v5, "key_download_info"

    .line 32
    .line 33
    invoke-virtual {v3, v5, v4}, Lcom/tantanapp/sharelib/workmanager/Data;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string v6, "key_module_path"

    .line 44
    .line 45
    invoke-virtual {v4, v6}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    invoke-static {v2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    if-eqz v6, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 59
    .line 60
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 61
    .line 62
    invoke-direct {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->e(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, v5, v3}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 78
    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_1
    :goto_0
    new-instance v2, Ljava/io/File;

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-direct {v2, v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    invoke-static {v0}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-eqz v4, :cond_2

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    new-instance p0, Ljava/io/File;

    .line 107
    .line 108
    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Ljava/io/File;

    .line 112
    .line 113
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const/4 v4, 0x1

    .line 117
    const/16 v6, 0x1000

    .line 118
    .line 119
    invoke-static {p0, v0, v4, v6}, Ll/yki;->p(Ljava/io/File;Ljava/io/File;ZI)Ljava/io/File;

    .line 120
    .line 121
    .line 122
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 123
    .line 124
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 125
    .line 126
    invoke-direct {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->e(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0, v5, v3}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 142
    .line 143
    .line 144
    return-object p0

    .line 145
    :cond_3
    :goto_1
    new-instance v0, Ljava/io/File;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getAppContext()Landroid/content/Context;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v1}, Landroid/content/Context;->getObbDir()Ljava/io/File;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v3}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getName()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-direct {v0, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    invoke-direct {p0, v3, v0, v2}, Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileDownloadWorker;->download(Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0
.end method
