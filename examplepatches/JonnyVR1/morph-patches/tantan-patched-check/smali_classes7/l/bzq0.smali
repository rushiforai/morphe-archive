.class public abstract Ll/bzq0;
.super Ll/tsq0$c;
.source "SourceFile"


# instance fields
.field protected c:I

.field protected d:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/bzq0;->c:I

    .line 5
    .line 6
    iput-object p1, p0, Ll/bzq0;->d:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method

.method public static c(Landroid/content/Context;Lcom/xiaomi/push/gn;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/jyq0;->b()Ll/jyq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/jyq0;->a()Ll/iyq0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {v0}, Ll/iyq0;->a()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/push/gn;->a()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    :goto_1
    return-void

    .line 36
    :cond_2
    invoke-static {p0, p1, v0}, Ll/bzq0;->d(Landroid/content/Context;Lcom/xiaomi/push/gn;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private static d(Landroid/content/Context;Lcom/xiaomi/push/gn;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p2, p1}, Ll/lyq0;->d(Ljava/lang/String;[B)[B

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_5

    .line 10
    .line 11
    array-length p2, p1

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_8

    .line 15
    .line 16
    :cond_0
    sget-object p2, Ll/myq0;->a:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter p2

    .line 19
    const/4 v0, 0x0

    .line 20
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const-string v3, "push_cdata.lock"

    .line 27
    .line 28
    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 32
    .line 33
    .line 34
    new-instance v2, Ljava/io/RandomAccessFile;

    .line 35
    .line 36
    const-string v3, "rw"

    .line 37
    .line 38
    invoke-direct {v2, v1, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 39
    .line 40
    .line 41
    :try_start_1
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 46
    .line 47
    .line 48
    move-result-object v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 49
    :try_start_2
    new-instance v3, Ljava/io/File;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string v4, "push_cdata.data"

    .line 56
    .line 57
    invoke-direct {v3, p0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v3}, Ll/e6r0;->b(Ljava/io/File;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    new-instance p0, Ljava/io/BufferedOutputStream;

    .line 67
    .line 68
    new-instance v4, Ljava/io/FileOutputStream;

    .line 69
    .line 70
    const/4 v5, 0x1

    .line 71
    invoke-direct {v4, v3, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 75
    .line 76
    .line 77
    :try_start_3
    array-length v0, p1

    .line 78
    invoke-static {v0}, Ll/p6r0;->b(I)[B

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/io/BufferedOutputStream;->flush()V

    .line 89
    .line 90
    .line 91
    const-wide/16 v4, 0x0

    .line 92
    .line 93
    invoke-virtual {v3, v4, v5}, Ljava/io/File;->setLastModified(J)Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 94
    .line 95
    .line 96
    move-object v0, p0

    .line 97
    goto :goto_2

    .line 98
    :catchall_0
    move-exception p1

    .line 99
    :goto_0
    move-object v0, v1

    .line 100
    goto :goto_6

    .line 101
    :catch_0
    move-exception p1

    .line 102
    :goto_1
    move-object v0, v1

    .line 103
    goto :goto_4

    .line 104
    :catchall_1
    move-exception p1

    .line 105
    move-object p0, v0

    .line 106
    goto :goto_0

    .line 107
    :catch_1
    move-exception p1

    .line 108
    move-object p0, v0

    .line 109
    goto :goto_1

    .line 110
    :cond_1
    :goto_2
    if-eqz v1, :cond_2

    .line 111
    .line 112
    :try_start_4
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 113
    .line 114
    .line 115
    move-result p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 116
    if-eqz p0, :cond_2

    .line 117
    .line 118
    :try_start_5
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :catchall_2
    move-exception p0

    .line 123
    goto :goto_7

    .line 124
    :catch_2
    :cond_2
    :goto_3
    :try_start_6
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 125
    .line 126
    .line 127
    goto :goto_5

    .line 128
    :catchall_3
    move-exception p1

    .line 129
    move-object p0, v0

    .line 130
    goto :goto_6

    .line 131
    :catch_3
    move-exception p1

    .line 132
    move-object p0, v0

    .line 133
    goto :goto_4

    .line 134
    :catchall_4
    move-exception p1

    .line 135
    move-object p0, v0

    .line 136
    move-object v2, p0

    .line 137
    goto :goto_6

    .line 138
    :catch_4
    move-exception p1

    .line 139
    move-object p0, v0

    .line 140
    move-object v2, p0

    .line 141
    :goto_4
    :try_start_7
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 142
    .line 143
    .line 144
    if-eqz v0, :cond_3

    .line 145
    .line 146
    :try_start_8
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 147
    .line 148
    .line 149
    move-result p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 150
    if-eqz p1, :cond_3

    .line 151
    .line 152
    :try_start_9
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 153
    .line 154
    .line 155
    :catch_5
    :cond_3
    :try_start_a
    invoke-static {p0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 156
    .line 157
    .line 158
    :goto_5
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 159
    .line 160
    .line 161
    monitor-exit p2

    .line 162
    goto :goto_8

    .line 163
    :catchall_5
    move-exception p1

    .line 164
    :goto_6
    if-eqz v0, :cond_4

    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 167
    .line 168
    .line 169
    move-result v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 170
    if-eqz v1, :cond_4

    .line 171
    .line 172
    :try_start_b
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 173
    .line 174
    .line 175
    :catch_6
    :cond_4
    :try_start_c
    invoke-static {p0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 179
    .line 180
    .line 181
    throw p1

    .line 182
    :goto_7
    monitor-exit p2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 183
    throw p0

    .line 184
    :cond_5
    :goto_8
    return-void
.end method

.method private h()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "dc_job_result_time_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/tsq0$c;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method private j()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "dc_job_result_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/tsq0$c;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public abstract b()Lcom/xiaomi/push/gh;
.end method

.method public e()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bzq0;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tsq0$c;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget p0, p0, Ll/bzq0;->c:I

    .line 12
    .line 13
    int-to-long v2, p0

    .line 14
    invoke-static {v0, v1, v2, v3}, Ll/lyq0;->b(Landroid/content/Context;Ljava/lang/String;J)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public abstract f()Ljava/lang/String;
.end method

.method public g()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public run()V
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/bzq0;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/bzq0;->e()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "DC run job mutual: "

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/tsq0$c;->a()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-static {}, Ll/jyq0;->b()Ll/jyq0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ll/jyq0;->a()Ll/iyq0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    const-string v1, ""

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-interface {v1}, Ll/iyq0;->a()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_3

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {p0}, Ll/bzq0;->g()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_4

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    invoke-virtual {p0}, Ll/bzq0;->i()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_6

    .line 77
    .line 78
    iget-object v2, p0, Ll/bzq0;->d:Landroid/content/Context;

    .line 79
    .line 80
    const-string v3, "mipush_extra"

    .line 81
    .line 82
    const/4 v4, 0x0

    .line 83
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-direct {p0}, Ll/bzq0;->j()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    const/4 v4, 0x0

    .line 92
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v0}, Ll/bvq0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_6

    .line 105
    .line 106
    invoke-direct {p0}, Ll/bzq0;->h()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    const-wide/16 v4, 0x0

    .line 111
    .line 112
    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 113
    .line 114
    .line 115
    move-result-wide v2

    .line 116
    iget-object v4, p0, Ll/bzq0;->d:Landroid/content/Context;

    .line 117
    .line 118
    invoke-static {v4}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    sget-object v5, Lcom/xiaomi/push/gk;->ba:Lcom/xiaomi/push/gk;

    .line 123
    .line 124
    invoke-virtual {v5}, Lcom/xiaomi/push/gk;->a()I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    const v6, 0x93a80

    .line 129
    .line 130
    .line 131
    invoke-virtual {v4, v5, v6}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 136
    .line 137
    .line 138
    move-result-wide v5

    .line 139
    sub-long/2addr v5, v2

    .line 140
    const-wide/16 v7, 0x3e8

    .line 141
    .line 142
    div-long/2addr v5, v7

    .line 143
    iget v9, p0, Ll/bzq0;->c:I

    .line 144
    .line 145
    int-to-long v9, v9

    .line 146
    cmp-long v5, v5, v9

    .line 147
    .line 148
    if-gez v5, :cond_5

    .line 149
    .line 150
    :goto_1
    return-void

    .line 151
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 152
    .line 153
    .line 154
    move-result-wide v5

    .line 155
    sub-long/2addr v5, v2

    .line 156
    div-long/2addr v5, v7

    .line 157
    int-to-long v7, v4

    .line 158
    cmp-long v4, v5, v7

    .line 159
    .line 160
    if-gez v4, :cond_6

    .line 161
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string v4, "same_"

    .line 165
    .line 166
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    :cond_6
    new-instance v2, Lcom/xiaomi/push/gn;

    .line 177
    .line 178
    invoke-direct {v2}, Lcom/xiaomi/push/gn;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2, v0}, Lcom/xiaomi/push/gn;->a(Ljava/lang/String;)Lcom/xiaomi/push/gn;

    .line 182
    .line 183
    .line 184
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 185
    .line 186
    .line 187
    move-result-wide v3

    .line 188
    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/push/gn;->a(J)Lcom/xiaomi/push/gn;

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0}, Ll/bzq0;->b()Lcom/xiaomi/push/gh;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v2, v0}, Lcom/xiaomi/push/gn;->a(Lcom/xiaomi/push/gh;)Lcom/xiaomi/push/gn;

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Ll/bzq0;->d:Landroid/content/Context;

    .line 199
    .line 200
    invoke-static {p0, v2, v1}, Ll/bzq0;->d(Landroid/content/Context;Lcom/xiaomi/push/gn;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return-void
.end method
