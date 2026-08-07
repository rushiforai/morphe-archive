.class Ll/jqw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Lcom/mm/mmfile/Strategy;


# direct methods
.method public static synthetic a(Ljava/io/File;)Z
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Ll/gqw;->k()Ll/yxl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Ll/yxl;->b(Ljava/io/File;)Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-static {p0}, Ll/gqw;->u(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method private static b()Ljava/util/List;
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

.method private static c()Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/jv0;->a()Landroid/content/Context;

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
    const-string v2, "mmfilecache"

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

.method private static d()Lcom/mm/mmfile/core/MMLogInfo;
    .locals 3

    .line 1
    invoke-static {}, Ll/gqw;->d()Ll/tof0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gqw;->d()Ll/tof0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/tof0;->a()Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "{}"

    .line 21
    .line 22
    :goto_0
    new-instance v1, Lcom/mm/mmfile/core/MMLogInfo;

    .line 23
    .line 24
    invoke-static {}, Ll/jqw;->b()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {v1, v2, v0}, Lcom/mm/mmfile/core/MMLogInfo;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object v1
.end method

.method public static e(Landroid/content/Context;Ll/fqw;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/fqw;->f:Ll/fqw$d;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ll/fqw$c;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "mulog_"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Ll/pk90;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Lcom/mm/mmfile/Strategy$Builder;

    .line 32
    .line 33
    invoke-direct {v0}, Lcom/mm/mmfile/Strategy$Builder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/gqw;->i()[Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lcom/mm/mmfile/Strategy$Builder;->businesses([Ljava/lang/String;)Lcom/mm/mmfile/Strategy$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 45
    .line 46
    invoke-direct {v1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/jqw;->c()Ljava/io/File;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v1, v2}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->cacheDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object p1, p1, Ll/fqw;->f:Ll/fqw$d;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/fqw$d;->f()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {v1, p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1, p0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->filePrefix(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {}, Ll/jqw;->d()Lcom/mm/mmfile/core/MMLogInfo;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->commonInfo(Lcom/mm/mmfile/core/MMLogInfo;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->build()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Lcom/mm/mmfile/Strategy$Builder;->fileWriteConfig(Lcom/mm/mmfile/core/FileWriteConfig;)Lcom/mm/mmfile/Strategy$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance p1, Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 92
    .line 93
    invoke-direct {p1}, Lcom/mm/mmfile/FileUploadConfig$Builder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/gqw;->r()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p1, v0}, Lcom/mm/mmfile/FileUploadConfig$Builder;->deleteAfterUploaded(Z)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {}, Ll/gqw;->e()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    int-to-long v0, v0

    .line 109
    invoke-virtual {p1, v0, v1}, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploadClockTimeSeconds(J)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance v0, Ll/iqw;

    .line 114
    .line 115
    invoke-direct {v0}, Ll/iqw;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lcom/mm/mmfile/FileUploadConfig$Builder;->uploader(Lcom/mm/mmfile/IMMFileUploader;)Lcom/mm/mmfile/FileUploadConfig$Builder;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Lcom/mm/mmfile/FileUploadConfig$Builder;->build()Lcom/mm/mmfile/FileUploadConfig;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p0, p1}, Lcom/mm/mmfile/Strategy$Builder;->fileUploadConfig(Lcom/mm/mmfile/FileUploadConfig;)Lcom/mm/mmfile/Strategy$Builder;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Lcom/mm/mmfile/Strategy$Builder;->build()Lcom/mm/mmfile/Strategy;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    sput-object p0, Ll/jqw;->a:Lcom/mm/mmfile/Strategy;

    .line 135
    .line 136
    filled-new-array {p0}, [Lcom/mm/mmfile/Strategy;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {p0}, Lcom/mm/mmfile/MMFileHelper;->install([Lcom/mm/mmfile/Strategy;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_1
    :goto_0
    const-string p0, "realtime disabled, will not to init mmfile"

    .line 145
    .line 146
    invoke-static {p0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method
