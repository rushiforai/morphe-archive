.class public Ll/dzq0;
.super Ll/tsq0$c;
.source "SourceFile"


# instance fields
.field private c:Landroid/content/Context;

.field private d:Landroid/content/SharedPreferences;

.field private e:Lcom/xiaomi/push/service/ah;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 5
    .line 6
    const-string v0, "mipush_extra"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/dzq0;->d:Landroid/content/SharedPreferences;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/dzq0;->e:Lcom/xiaomi/push/service/ah;

    .line 20
    .line 21
    return-void
.end method

.method private b(Ljava/io/File;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Lcom/xiaomi/push/gn;",
            ">;"
        }
    .end annotation

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
    const/4 v2, 0x0

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    return-object v2

    .line 26
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x4

    .line 32
    new-array v4, v3, [B

    .line 33
    .line 34
    sget-object v5, Ll/myq0;->a:Ljava/lang/Object;

    .line 35
    .line 36
    monitor-enter v5

    .line 37
    :try_start_0
    new-instance v6, Ljava/io/File;

    .line 38
    .line 39
    iget-object v7, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 40
    .line 41
    invoke-virtual {v7}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    const-string v8, "push_cdata.lock"

    .line 46
    .line 47
    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v6}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 51
    .line 52
    .line 53
    new-instance v7, Ljava/io/RandomAccessFile;

    .line 54
    .line 55
    const-string v8, "rw"

    .line 56
    .line 57
    invoke-direct {v7, v6, v8}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 58
    .line 59
    .line 60
    :try_start_1
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-virtual {v6}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 65
    .line 66
    .line 67
    move-result-object v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 68
    :try_start_2
    new-instance v8, Ljava/io/FileInputStream;

    .line 69
    .line 70
    invoke-direct {v8, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_1
    :try_start_3
    invoke-virtual {v8, v4}, Ljava/io/FileInputStream;->read([B)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eq p1, v3, :cond_3

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_3
    invoke-static {v4}, Ll/p6r0;->a([B)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    new-array v2, p1, [B

    .line 85
    .line 86
    invoke-virtual {v8, v2}, Ljava/io/FileInputStream;->read([B)I

    .line 87
    .line 88
    .line 89
    move-result v9
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 90
    if-eq v9, p1, :cond_5

    .line 91
    .line 92
    :goto_2
    if-eqz v6, :cond_4

    .line 93
    .line 94
    :try_start_4
    invoke-virtual {v6}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 95
    .line 96
    .line 97
    move-result p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 98
    if-eqz p0, :cond_4

    .line 99
    .line 100
    :try_start_5
    invoke-virtual {v6}, Ljava/nio/channels/FileLock;->release()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 101
    .line 102
    .line 103
    goto :goto_3

    .line 104
    :catchall_0
    move-exception p0

    .line 105
    goto/16 :goto_9

    .line 106
    .line 107
    :catch_0
    :cond_4
    :goto_3
    :try_start_6
    invoke-static {v8}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v7}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 111
    .line 112
    .line 113
    goto/16 :goto_8

    .line 114
    .line 115
    :cond_5
    :try_start_7
    invoke-static {v0, v2}, Ll/lyq0;->c(Ljava/lang/String;[B)[B

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    if-eqz p1, :cond_2

    .line 120
    .line 121
    array-length v2, p1

    .line 122
    if-nez v2, :cond_6

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_6
    new-instance v2, Lcom/xiaomi/push/gn;

    .line 126
    .line 127
    invoke-direct {v2}, Lcom/xiaomi/push/gn;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-static {v2, p1}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 131
    .line 132
    .line 133
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    invoke-direct {p0, v2}, Ll/dzq0;->d(Lcom/xiaomi/push/gn;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :catchall_1
    move-exception p0

    .line 141
    :goto_4
    move-object v2, v6

    .line 142
    goto :goto_6

    .line 143
    :catch_1
    :goto_5
    move-object v2, v6

    .line 144
    goto :goto_7

    .line 145
    :catchall_2
    move-exception p0

    .line 146
    move-object v8, v2

    .line 147
    goto :goto_4

    .line 148
    :catch_2
    move-object v8, v2

    .line 149
    goto :goto_5

    .line 150
    :catchall_3
    move-exception p0

    .line 151
    move-object v8, v2

    .line 152
    goto :goto_6

    .line 153
    :catch_3
    move-object v8, v2

    .line 154
    goto :goto_7

    .line 155
    :catchall_4
    move-exception p0

    .line 156
    move-object v7, v2

    .line 157
    move-object v8, v7

    .line 158
    goto :goto_6

    .line 159
    :catch_4
    move-object v7, v2

    .line 160
    move-object v8, v7

    .line 161
    goto :goto_7

    .line 162
    :goto_6
    if-eqz v2, :cond_7

    .line 163
    .line 164
    :try_start_8
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 165
    .line 166
    .line 167
    move-result p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 168
    if-eqz p1, :cond_7

    .line 169
    .line 170
    :try_start_9
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 171
    .line 172
    .line 173
    :catch_5
    :cond_7
    :try_start_a
    invoke-static {v8}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 174
    .line 175
    .line 176
    invoke-static {v7}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 177
    .line 178
    .line 179
    throw p0

    .line 180
    :goto_7
    if-eqz v2, :cond_4

    .line 181
    .line 182
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 183
    .line 184
    .line 185
    move-result p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 186
    if-eqz p0, :cond_4

    .line 187
    .line 188
    :try_start_b
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 189
    .line 190
    .line 191
    goto :goto_3

    .line 192
    :goto_8
    :try_start_c
    monitor-exit v5

    .line 193
    return-object v1

    .line 194
    :goto_9
    monitor-exit v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 195
    throw p0
.end method

.method private c()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/dzq0;->d:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/16 v2, 0x3e8

    .line 12
    .line 13
    div-long/2addr v0, v2

    .line 14
    const-string v2, "last_upload_data_timestamp"

    .line 15
    .line 16
    invoke-interface {p0, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 17
    .line 18
    .line 19
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private d(Lcom/xiaomi/push/gn;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/xiaomi/push/gn;->a:Lcom/xiaomi/push/gh;

    .line 2
    .line 3
    sget-object v1, Lcom/xiaomi/push/gh;->b:Lcom/xiaomi/push/gh;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/xiaomi/push/gn;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "same_"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/dzq0;->d:Landroid/content/SharedPreferences;

    .line 18
    .line 19
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "dc_job_result_time_4"

    .line 24
    .line 25
    iget-wide v1, p1, Lcom/xiaomi/push/gn;->a:J

    .line 26
    .line 27
    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 28
    .line 29
    .line 30
    iget-object p1, p1, Lcom/xiaomi/push/gn;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p1}, Ll/bvq0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "dc_job_result_4"

    .line 37
    .line 38
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 39
    .line 40
    .line 41
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private e()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mtq0;->x(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v0}, Ll/mtq0;->z(Landroid/content/Context;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x1

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {v0}, Ll/mtq0;->y(Landroid/content/Context;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    :cond_1
    invoke-direct {p0}, Ll/dzq0;->g()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    return v2

    .line 35
    :cond_2
    iget-object v0, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {v0}, Ll/mtq0;->A(Landroid/content/Context;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-direct {p0}, Ll/dzq0;->f()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    return v2

    .line 50
    :cond_3
    iget-object p0, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 51
    .line 52
    invoke-static {p0}, Ll/mtq0;->B(Landroid/content/Context;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_4

    .line 57
    .line 58
    return v2

    .line 59
    :cond_4
    return v1
.end method

.method private f()Z
    .locals 9

    .line 1
    iget-object v0, p0, Ll/dzq0;->e:Lcom/xiaomi/push/service/ah;

    .line 2
    .line 3
    sget-object v1, Lcom/xiaomi/push/gk;->L:Lcom/xiaomi/push/gk;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/xiaomi/push/gk;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    iget-object v0, p0, Ll/dzq0;->e:Lcom/xiaomi/push/service/ah;

    .line 19
    .line 20
    sget-object v3, Lcom/xiaomi/push/gk;->M:Lcom/xiaomi/push/gk;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/xiaomi/push/gk;->a()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const v4, 0x69780

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v3, v4}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const v3, 0x15180

    .line 34
    .line 35
    .line 36
    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object p0, p0, Ll/dzq0;->d:Landroid/content/SharedPreferences;

    .line 41
    .line 42
    const-string v3, "last_upload_data_timestamp"

    .line 43
    .line 44
    const-wide/16 v4, -0x1

    .line 45
    .line 46
    invoke-interface {p0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 51
    .line 52
    .line 53
    move-result-wide v5

    .line 54
    const-wide/16 v7, 0x3e8

    .line 55
    .line 56
    div-long/2addr v5, v7

    .line 57
    sub-long/2addr v5, v3

    .line 58
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v3

    .line 62
    int-to-long v5, v0

    .line 63
    cmp-long p0, v3, v5

    .line 64
    .line 65
    if-lez p0, :cond_1

    .line 66
    .line 67
    return v2

    .line 68
    :cond_1
    return v1
.end method

.method private g()Z
    .locals 9

    .line 1
    iget-object v0, p0, Ll/dzq0;->e:Lcom/xiaomi/push/service/ah;

    .line 2
    .line 3
    sget-object v1, Lcom/xiaomi/push/gk;->J:Lcom/xiaomi/push/gk;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/xiaomi/push/gk;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    iget-object v0, p0, Ll/dzq0;->e:Lcom/xiaomi/push/service/ah;

    .line 19
    .line 20
    sget-object v3, Lcom/xiaomi/push/gk;->K:Lcom/xiaomi/push/gk;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/xiaomi/push/gk;->a()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const v4, 0x3f480

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v3, v4}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const v3, 0x15180

    .line 34
    .line 35
    .line 36
    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object p0, p0, Ll/dzq0;->d:Landroid/content/SharedPreferences;

    .line 41
    .line 42
    const-string v3, "last_upload_data_timestamp"

    .line 43
    .line 44
    const-wide/16 v4, -0x1

    .line 45
    .line 46
    invoke-interface {p0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 51
    .line 52
    .line 53
    move-result-wide v5

    .line 54
    const-wide/16 v7, 0x3e8

    .line 55
    .line 56
    div-long/2addr v5, v7

    .line 57
    sub-long/2addr v5, v3

    .line 58
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v3

    .line 62
    int-to-long v5, v0

    .line 63
    cmp-long p0, v3, v5

    .line 64
    .line 65
    if-lez p0, :cond_1

    .line 66
    .line 67
    return v2

    .line 68
    :cond_1
    return v1
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "1"

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 5

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "push_cdata.data"

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/dzq0;->c:Landroid/content/Context;

    .line 15
    .line 16
    invoke-static {v1}, Ll/mtq0;->w(Landroid/content/Context;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    const-wide/32 v3, 0x1c7000

    .line 27
    .line 28
    .line 29
    cmp-long p0, v1, v3

    .line 30
    .line 31
    if-lez p0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-direct {p0}, Ll/dzq0;->e()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_3

    .line 49
    .line 50
    :cond_2
    :goto_0
    return-void

    .line 51
    :cond_3
    invoke-direct {p0, v0}, Ll/dzq0;->b(Ljava/io/File;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Ll/q6r0;->a(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_6

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const/16 v3, 0xfa0

    .line 66
    .line 67
    if-le v2, v3, :cond_4

    .line 68
    .line 69
    add-int/lit16 v3, v2, -0xfa0

    .line 70
    .line 71
    invoke-interface {v1, v3, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    :cond_4
    new-instance v2, Lcom/xiaomi/push/gy;

    .line 76
    .line 77
    invoke-direct {v2}, Lcom/xiaomi/push/gy;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, v1}, Lcom/xiaomi/push/gy;->a(Ljava/util/List;)Lcom/xiaomi/push/gy;

    .line 81
    .line 82
    .line 83
    invoke-static {v2}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v1}, Ll/j6r0;->h([B)[B

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    new-instance v2, Lcom/xiaomi/push/he;

    .line 92
    .line 93
    const-string v3, "-1"

    .line 94
    .line 95
    const/4 v4, 0x0

    .line 96
    invoke-direct {v2, v3, v4}, Lcom/xiaomi/push/he;-><init>(Ljava/lang/String;Z)V

    .line 97
    .line 98
    .line 99
    sget-object v3, Lcom/xiaomi/push/gp;->q:Lcom/xiaomi/push/gp;

    .line 100
    .line 101
    iget-object v3, v3, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, v1}, Lcom/xiaomi/push/he;->a([B)Lcom/xiaomi/push/he;

    .line 107
    .line 108
    .line 109
    invoke-static {}, Ll/jyq0;->b()Ll/jyq0;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Ll/jyq0;->a()Ll/iyq0;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    if-eqz v1, :cond_5

    .line 118
    .line 119
    sget-object v3, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 120
    .line 121
    const/4 v4, 0x0

    .line 122
    invoke-interface {v1, v2, v3, v4}, Ll/iyq0;->a(Lcom/xiaomi/push/he;Lcom/xiaomi/push/gf;Lcom/xiaomi/push/gs;)V

    .line 123
    .line 124
    .line 125
    :cond_5
    invoke-direct {p0}, Ll/dzq0;->c()V

    .line 126
    .line 127
    .line 128
    :cond_6
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 129
    .line 130
    .line 131
    return-void
.end method
