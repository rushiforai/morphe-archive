.class public Ll/m9e;
.super Ll/wr4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    const-string v0, "DownloadFullHandler"

    invoke-direct {p0, v0}, Ll/m9e;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wr4;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x5

    .line 5
    invoke-virtual {p0, p1}, Ll/wr4;->j(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private k(Ll/aje;Ljava/io/File;)Z
    .locals 2

    .line 1
    invoke-static {p2}, Ll/zie;->a(Ljava/io/File;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    :try_start_0
    invoke-static {p1}, Ll/zie;->e(Ll/aje;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/ire0;->d()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0}, Ll/miw;->e(Ljava/io/File;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 38
    .line 39
    .line 40
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return v0

    .line 48
    :goto_0
    const-string p1, "SDKResource"

    .line 49
    .line 50
    invoke-static {p1, p0}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    return v0
.end method

.method private l(Ll/aje;Ljava/io/File;)Z
    .locals 6

    .line 1
    const-string v0, "localMd5: "

    .line 2
    .line 3
    const-string v1, "serverMd5: "

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {p1}, Ll/zie;->i(Ll/aje;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const-string v4, "SDKResource"

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    if-eqz v3, :cond_2

    .line 21
    .line 22
    :try_start_0
    invoke-virtual {v2}, Ll/ire0;->d()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-array v3, v5, [Ljava/lang/Object;

    .line 39
    .line 40
    invoke-static {v4, v1, v3}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Ll/miw;->e(Ljava/io/File;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-array v3, v5, [Ljava/lang/Object;

    .line 60
    .line 61
    invoke-static {v4, v0, v3}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-static {p2}, Ll/zie;->a(Ljava/io/File;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    const/4 v1, 0x3

    .line 75
    if-nez v0, :cond_0

    .line 76
    .line 77
    const-string p1, "\u5220\u9664downloadFile\u5931\u8d25"

    .line 78
    .line 79
    invoke-virtual {p0, v1, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return v5

    .line 83
    :catch_0
    move-exception p0

    .line 84
    goto :goto_0

    .line 85
    :cond_0
    invoke-static {p1, p2}, Ll/mki;->a(Ljava/io/File;Ljava/io/File;)V

    .line 86
    .line 87
    .line 88
    const-string p1, "download from sd card success"

    .line 89
    .line 90
    new-array p2, v5, [Ljava/lang/Object;

    .line 91
    .line 92
    invoke-static {v4, p1, p2}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/wr4;->b()Ll/xr4;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0, v1}, Ll/xr4;->g(I)V

    .line 100
    .line 101
    .line 102
    const/4 p0, 0x1

    .line 103
    return p0

    .line 104
    :cond_1
    const-string p0, "md5 is not match"

    .line 105
    .line 106
    new-array p1, v5, [Ljava/lang/Object;

    .line 107
    .line 108
    invoke-static {v4, p0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :goto_0
    invoke-static {v4, p0}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_2
    const-string p0, "sd card backup file not exit"

    .line 117
    .line 118
    new-array p1, v5, [Ljava/lang/Object;

    .line 119
    .line 120
    invoke-static {v4, p0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    :goto_1
    return v5
.end method

.method private m(Ll/aje;Ljava/io/File;Ll/ire0;)Z
    .locals 9

    .line 1
    const-string v0, "SDKResource"

    .line 2
    .line 3
    const-string v1, "\u4e0b\u8f7d\u8fc7\u7a0b\u51fa\u73b0\u5f02\u5e38, reason: "

    .line 4
    .line 5
    invoke-static {p3}, Ll/jo5;->a(Ll/ire0;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x3

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    const-string p1, "down url is empty"

    .line 18
    .line 19
    invoke-virtual {p0, v4, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return v3

    .line 23
    :cond_0
    invoke-static {p2}, Ll/zie;->a(Ljava/io/File;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    const-string p1, "\u5220\u9664downloadFile\u5931\u8d25"

    .line 30
    .line 31
    invoke-virtual {p0, v4, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return v3

    .line 35
    :cond_1
    :try_start_0
    new-instance v2, Ll/z9e;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/z9e;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v5, Ll/m9e$a;

    .line 41
    .line 42
    invoke-direct {v5, p0}, Ll/m9e$a;-><init>(Ll/m9e;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v5}, Ll/z9e;->b(Ll/ioh0$c;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-virtual {v2, p3, v5, v6}, Ll/z9e;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/ioh0$b;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    iget-boolean v2, p3, Ll/ioh0$b;->a:Z

    .line 61
    .line 62
    if-nez v2, :cond_2

    .line 63
    .line 64
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p2, p3, Ll/ioh0$b;->b:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, v4, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return v2

    .line 82
    :catch_0
    move-exception p1

    .line 83
    goto :goto_0

    .line 84
    :cond_2
    const-string p3, "%s \u4e0b\u8f7d\u5168\u91cf\u6587\u4ef6\u5b8c\u6210\uff0c\u5927\u5c0f\uff1a%d kb"

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p2}, Ljava/io/File;->length()J

    .line 91
    .line 92
    .line 93
    move-result-wide v5

    .line 94
    const-wide/16 v7, 0x400

    .line 95
    .line 96
    div-long/2addr v5, v7

    .line 97
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {v0, p3, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/wr4;->b()Ll/xr4;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const/4 p2, 0x1

    .line 113
    invoke-virtual {p1, p2}, Ll/xr4;->g(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    return v2

    .line 117
    :goto_0
    invoke-static {v0, p1}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v4, p1}, Ll/wr4;->i(ILjava/lang/Exception;)V

    .line 121
    .line 122
    .line 123
    return v3
.end method


# virtual methods
.method public e(Ll/aje;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/zie;->d(Ll/aje;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, p1, v1}, Ll/m9e;->k(Ll/aje;Ljava/io/File;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x1

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    const-string p0, "Event_Resource_Local_Access"

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, v3, p1}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return v3

    .line 23
    :cond_0
    invoke-direct {p0, p1, v1}, Ll/m9e;->l(Ll/aje;Ljava/io/File;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    return v3

    .line 30
    :cond_1
    invoke-direct {p0, p1, v1, v0}, Ll/m9e;->m(Ll/aje;Ljava/io/File;Ll/ire0;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method
