.class public Lcom/cosmos/photon/push/statistic/PushEventStatistic;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/statistic/PushEventStatistic$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic$1;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/mm/mmfile/MMFileHelper;->setLibraryLoader(Lcom/mm/mmfile/LibraryLoader;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static forceUpload()V
    .locals 0

    return-void

    .line 1
    invoke-static {}, Lcom/mm/mmfile/MMFileHelper;->forceUploadMMFile()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static getCommonBody()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "useragent"

    .line 7
    .line 8
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getUserAgent()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    const-string v2, "MoPush-STATISTIC"

    .line 18
    .line 19
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method private static getCommonHeaders()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const-string v1, "common"

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method private static getCommonInfo()Lcom/mm/mmfile/core/MMLogInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/mm/mmfile/core/MMLogInfo;

    .line 2
    .line 3
    invoke-static {}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->getCommonHeaders()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->getCommonBody()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v0, v1, v2}, Lcom/mm/mmfile/core/MMLogInfo;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private static getMMFileCacheHome(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "mmfile_push_cache"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-object v0
.end method

.method private static getMMFileSaveDir(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "mmfile_push_statistic"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 5

    return-void

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "mmpush_sdk_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/cosmos/photon/push/log/LogUtil;->getProcessSuffix(Landroid/content/Context;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->getMMFileSaveDir(Landroid/content/Context;)Ljava/io/File;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->getMMFileCacheHome(Landroid/content/Context;)Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v2, Lcom/mm/mmfile/Strategy$Builder;

    .line 28
    .line 29
    invoke-direct {v2}, Lcom/mm/mmfile/Strategy$Builder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v3, "mmpush_sdk"

    .line 33
    .line 34
    filled-new-array {v3}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v3}, Lcom/mm/mmfile/Strategy$Builder;->businesses([Ljava/lang/String;)Lcom/mm/mmfile/Strategy$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 43
    .line 44
    invoke-direct {v3}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;-><init>()V

    .line 45
    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    invoke-virtual {v3, v4}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->isCrypt(Z)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/4 v4, 0x1

    .line 53
    invoke-virtual {v3, v4}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->isCompress(Z)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v3, p0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->cacheDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {p0, v1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0, v0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->filePrefix(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->getCommonInfo()Lcom/mm/mmfile/core/MMLogInfo;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p0, v0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->commonInfo(Lcom/mm/mmfile/core/MMLogInfo;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    new-instance v0, Lcom/cosmos/photon/push/statistic/PushEventStatistic$2;

    .line 86
    .line 87
    invoke-direct {v0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic$2;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->eventListener(Lcom/mm/mmfile/core/IMMFileEventListener;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->build()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v2, p0}, Lcom/mm/mmfile/Strategy$Builder;->fileWriteConfig(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/Strategy$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    new-instance v0, Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 103
    .line 104
    invoke-direct {v0}, Lcom/mm/mmfile/FileUploadConfig$Builder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-wide/16 v1, 0x384

    .line 108
    .line 109
    invoke-virtual {v0, v1, v2}, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploadClockTimeSeconds(J)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0, v4}, Lcom/mm/mmfile/FileUploadConfig$Builder;->deleteAfterUploaded(Z)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Lcom/cosmos/photon/push/EventUploaderImpl;

    .line 118
    .line 119
    invoke-direct {v1}, Lcom/cosmos/photon/push/EventUploaderImpl;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploader(Lcom/mm/mmfile/IMMFileUploader;)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/mm/mmfile/FileUploadConfig$Builder;->build()Lcom/mm/mmfile/FileUploadConfig;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {p0, v0}, Lcom/mm/mmfile/Strategy$Builder;->fileUploadConfig(Lcom/mm/mmfile/FileUploadConfig;)Lcom/mm/mmfile/Strategy$Builder;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy$Builder;->build()Lcom/mm/mmfile/Strategy;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    filled-new-array {p0}, [Lcom/mm/mmfile/Strategy;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {p0}, Lcom/mm/mmfile/MMFileHelper;->install([Lcom/mm/mmfile/Strategy;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public static logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V
    .locals 4

    return-void

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-virtual {p0}, Lcom/cosmos/photon/push/statistic/EventLogBody;->toString()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget v1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->uploadType:I

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "MoPush-API"

    .line 19
    .line 20
    const-string v3, "[%d]%s"

    .line 21
    .line 22
    invoke-static {v2, v3, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->uploadType:I

    .line 26
    .line 27
    const-string v1, "MoPush-STATISTIC"

    .line 28
    .line 29
    const-string v2, "mmpush_sdk"

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eq p0, v3, :cond_2

    .line 35
    .line 36
    const/4 v3, 0x2

    .line 37
    if-eq p0, v3, :cond_1

    .line 38
    .line 39
    :try_start_0
    invoke-static {v2, v0}, Lcom/mm/mmfile/MMFileHelper;->write(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-static {}, Lcom/cosmos/photon/push/PushPreferenceUtils;->getPToken()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object v1, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p0, v1, v0}, Lcom/cosmos/photon/push/PushApi;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    :try_start_1
    invoke-static {v2, v0}, Lcom/mm/mmfile/MMFileHelper;->write(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_1
    move-exception p0

    .line 63
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    invoke-static {}, Lcom/cosmos/photon/push/PushPreferenceUtils;->getPToken()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    sget-object v1, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p0, v1, v0}, Lcom/cosmos/photon/push/PushApi;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    :try_start_2
    invoke-static {v2, v0}, Lcom/mm/mmfile/MMFileHelper;->write(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :catchall_2
    move-exception p0

    .line 81
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    return-void
.end method

.method public static logPushEventInfo(Ljava/lang/String;)V
    .locals 2

    return-void

    .line 85
    const-string v0, "MoPush-STATISTIC"

    if-nez p0, :cond_0

    return-void

    .line 86
    :cond_0
    :try_start_0
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string v1, "mmpush_sdk"

    invoke-static {v1, p0}, Lcom/mm/mmfile/MMFileHelper;->write(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 88
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static logRegCallback(Ljava/lang/String;Ljava/lang/String;[Lorg/json/JSONObject;)V
    .locals 5

    return-void

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    array-length v0, p2

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    const-string v1, "appId"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    const-string p0, "action"

    .line 18
    .line 19
    const-string v1, "registFailedAndTryReferee"

    .line 20
    .line 21
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string p0, "type"

    .line 25
    .line 26
    const/16 v1, 0x2711

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string p0, "deviceId"

    .line 32
    .line 33
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    array-length p0, p2

    .line 37
    const/4 p1, 0x0

    .line 38
    move v1, p1

    .line 39
    :goto_0
    if-ge p1, p0, :cond_1

    .line 40
    .line 41
    aget-object v2, p2, p1

    .line 42
    .line 43
    const-string v3, "content %d"

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 58
    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    add-int/lit8 p1, p1, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    :try_start_1
    const-string p0, "mmpush_sdk"

    .line 66
    .line 67
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p0, p1}, Lcom/mm/mmfile/MMFileHelper;->write(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    :try_start_2
    const-string p1, "MoPush-STATISTIC"

    .line 77
    .line 78
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 79
    .line 80
    .line 81
    :catchall_1
    :cond_2
    :goto_1
    return-void
.end method
