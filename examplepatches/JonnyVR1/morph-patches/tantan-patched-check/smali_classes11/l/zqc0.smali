.class public Ll/zqc0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x2

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
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/lrw;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Lcom/mm/mmfile/Strategy$Builder;

    .line 21
    .line 22
    invoke-direct {v2}, Lcom/mm/mmfile/Strategy$Builder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v3, "mmrecorder-sdk"

    .line 26
    .line 27
    filled-new-array {v3}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Lcom/mm/mmfile/Strategy$Builder;->businesses([Ljava/lang/String;)Lcom/mm/mmfile/Strategy$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    new-instance v3, Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 36
    .line 37
    invoke-direct {v3}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/zqc0;->b()Ljava/io/File;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v3, v4}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->cacheDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {}, Ll/zqc0;->c()Ljava/io/File;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v3, v4}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    new-instance v4, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v5, "recordermmlog_"

    .line 67
    .line 68
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/kv0;->a()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-static {v5}, Ll/zsd0;->d(Landroid/content/Context;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v3, v4}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->filePrefix(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    new-instance v4, Lcom/mm/mmfile/core/MMLogInfo;

    .line 91
    .line 92
    invoke-static {}, Ll/zqc0;->a()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-direct {v4, v0, v5}, Lcom/mm/mmfile/core/MMLogInfo;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3, v4}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->commonInfo(Lcom/mm/mmfile/core/MMLogInfo;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->build()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v2, v0}, Lcom/mm/mmfile/Strategy$Builder;->fileWriteConfig(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/Strategy$Builder;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v2, Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 112
    .line 113
    invoke-direct {v2}, Lcom/mm/mmfile/FileUploadConfig$Builder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-wide/16 v3, 0xe10

    .line 117
    .line 118
    invoke-virtual {v2, v3, v4}, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploadClockTimeSeconds(J)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    new-instance v3, Ll/cqd;

    .line 123
    .line 124
    sget-object v4, Ll/xsd0;->a:Ljava/lang/String;

    .line 125
    .line 126
    invoke-direct {v3, v1, v4}, Ll/cqd;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v3}, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploader(Lcom/mm/mmfile/IMMFileUploader;)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Lcom/mm/mmfile/FileUploadConfig$Builder;->build()Lcom/mm/mmfile/FileUploadConfig;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Lcom/mm/mmfile/Strategy$Builder;->fileUploadConfig(Lcom/mm/mmfile/FileUploadConfig;)Lcom/mm/mmfile/Strategy$Builder;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lcom/mm/mmfile/Strategy$Builder;->build()Lcom/mm/mmfile/Strategy;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    filled-new-array {v0}, [Lcom/mm/mmfile/Strategy;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-static {v0}, Lcom/mm/mmfile/MMFileHelper;->install([Lcom/mm/mmfile/Strategy;)V

    .line 150
    .line 151
    .line 152
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

.method private static a()Ljava/lang/String;
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
    invoke-static {}, Ll/wqc0;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "appId"

    .line 16
    .line 17
    sget-object v2, Ll/xsd0;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    sget-object v1, Ll/be00;->a:Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/mm/mediasdk/bean/RecorderInitConfig;->b()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    const-string v1, "uid"

    .line 31
    .line 32
    sget-object v2, Ll/be00;->a:Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/mm/mediasdk/bean/RecorderInitConfig;->b()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v1

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    const-string v1, "deviceId"

    .line 45
    .line 46
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Ll/lrw;->k()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :goto_1
    const-string v2, "Cosmos-Base"

    .line 59
    .line 60
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    return-object v0
.end method

.method private static b()Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/kv0;->a()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "mmfile_recordersdk_cache"

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object v0
.end method

.method private static c()Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/kv0;->a()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "mmfile_recordersdk_statistic"

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object v0
.end method

.method public static d(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "mmrecorder-sdk"

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/mm/mmfile/MMFileHelper;->write(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
