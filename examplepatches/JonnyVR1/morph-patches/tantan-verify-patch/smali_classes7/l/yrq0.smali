.class public Ll/yrq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ysl;


# instance fields
.field protected a:Landroid/content/Context;

.field private b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ll/xrq0;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/yrq0;->f(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static d(Ll/xrq0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Ll/xrq0;->a:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private e(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    new-array v2, v1, [B

    .line 8
    .line 9
    new-array v3, v1, [B

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    .line 13
    .line 14
    new-instance v6, Ljava/io/File;

    .line 15
    .line 16
    invoke-direct {v6, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {v5, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 20
    .line 21
    .line 22
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v5, v2}, Ljava/io/FileInputStream;->read([B)I

    .line 23
    .line 24
    .line 25
    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    const/4 v4, -0x1

    .line 27
    if-ne p1, v4, :cond_1

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_1
    const-string v6, "eventData read from cache file failed because magicNumber error"

    .line 31
    .line 32
    if-eq p1, v1, :cond_2

    .line 33
    .line 34
    :try_start_2
    invoke-static {v6}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto :goto_2

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    move-object v4, v5

    .line 40
    goto :goto_4

    .line 41
    :catch_0
    move-exception p0

    .line 42
    move-object v4, v5

    .line 43
    goto :goto_3

    .line 44
    :cond_2
    invoke-static {v2}, Ll/p6r0;->a([B)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const v7, -0x22334456

    .line 49
    .line 50
    .line 51
    if-eq p1, v7, :cond_3

    .line 52
    .line 53
    invoke-static {v6}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    invoke-virtual {v5, v3}, Ljava/io/FileInputStream;->read([B)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-ne p1, v4, :cond_4

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_4
    if-eq p1, v1, :cond_5

    .line 65
    .line 66
    const-string p0, "eventData read from cache file failed cause lengthBuffer error"

    .line 67
    .line 68
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_5
    invoke-static {v3}, Ll/p6r0;->a([B)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    const/4 v4, 0x1

    .line 77
    if-lt p1, v4, :cond_8

    .line 78
    .line 79
    const/16 v4, 0x1000

    .line 80
    .line 81
    if-le p1, v4, :cond_6

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_6
    new-array v4, p1, [B

    .line 85
    .line 86
    invoke-virtual {v5, v4}, Ljava/io/FileInputStream;->read([B)I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    if-eq v6, p1, :cond_7

    .line 91
    .line 92
    const-string p0, "eventData read from cache file failed cause buffer size not equal length"

    .line 93
    .line 94
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_7
    invoke-virtual {p0, v4}, Ll/yrq0;->m([B)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-nez v4, :cond_0

    .line 107
    .line 108
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_8
    :goto_1
    const-string p0, "eventData read from cache file failed cause lengthBuffer < 1 || lengthBuffer > 4K"

    .line 113
    .line 114
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    .line 116
    .line 117
    :goto_2
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 118
    .line 119
    .line 120
    return-object v0

    .line 121
    :catchall_1
    move-exception p0

    .line 122
    goto :goto_4

    .line 123
    :catch_1
    move-exception p0

    .line 124
    :goto_3
    :try_start_3
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 125
    .line 126
    .line 127
    invoke-static {v4}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 128
    .line 129
    .line 130
    return-object v0

    .line 131
    :goto_4
    invoke-static {v4}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 132
    .line 133
    .line 134
    throw p0
.end method

.method private g(Ljava/io/RandomAccessFile;Ljava/nio/channels/FileLock;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    invoke-static {p1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private h(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/erq0;->f(Landroid/content/Context;)Ll/erq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "24:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, ","

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/16 p2, 0x1389

    .line 30
    .line 31
    invoke-virtual {v0, p2, p1}, Ll/erq0;->e(ILjava/lang/String;)Ll/y3f;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/y3f;->d()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p2}, Ll/yrq0;->i(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private k([Ll/xrq0;)[Ll/xrq0;
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    invoke-direct {p0, v1}, Ll/yrq0;->l(Ll/xrq0;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 17
    .line 18
    new-instance v4, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v5, ".lock"

    .line 27
    .line 28
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v2}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 39
    .line 40
    .line 41
    new-instance v4, Ljava/io/RandomAccessFile;

    .line 42
    .line 43
    const-string v5, "rw"

    .line 44
    .line 45
    invoke-direct {v4, v2, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 46
    .line 47
    .line 48
    :try_start_1
    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 53
    .line 54
    .line 55
    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 56
    :try_start_2
    new-instance v5, Ljava/io/File;

    .line 57
    .line 58
    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    new-instance v6, Ljava/io/BufferedOutputStream;

    .line 62
    .line 63
    new-instance v7, Ljava/io/FileOutputStream;

    .line 64
    .line 65
    const/4 v8, 0x1

    .line 66
    invoke-direct {v7, v5, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 67
    .line 68
    .line 69
    invoke-direct {v6, v7}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 70
    .line 71
    .line 72
    :try_start_3
    array-length v5, p1

    .line 73
    move v7, v0

    .line 74
    move v9, v7

    .line 75
    :goto_0
    if-ge v7, v5, :cond_5

    .line 76
    .line 77
    aget-object v10, p1, v7

    .line 78
    .line 79
    if-nez v10, :cond_1

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_1
    invoke-virtual {v10}, Ll/xrq0;->d()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v10

    .line 86
    invoke-virtual {p0, v10}, Ll/yrq0;->n(Ljava/lang/String;)[B

    .line 87
    .line 88
    .line 89
    move-result-object v10

    .line 90
    if-eqz v10, :cond_4

    .line 91
    .line 92
    array-length v11, v10

    .line 93
    if-lt v11, v8, :cond_4

    .line 94
    .line 95
    array-length v11, v10

    .line 96
    const/16 v12, 0x1000

    .line 97
    .line 98
    if-le v11, v12, :cond_2

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    iget-object v11, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 102
    .line 103
    invoke-static {v11, v1}, Ll/lvq0;->d(Landroid/content/Context;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v11

    .line 107
    if-nez v11, :cond_3

    .line 108
    .line 109
    array-length v1, p1

    .line 110
    sub-int/2addr v1, v9

    .line 111
    new-array v5, v1, [Ll/xrq0;

    .line 112
    .line 113
    invoke-static {p1, v9, v5, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 114
    .line 115
    .line 116
    invoke-static {v6}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 117
    .line 118
    .line 119
    invoke-direct {p0, v4, v2}, Ll/yrq0;->g(Ljava/io/RandomAccessFile;Ljava/nio/channels/FileLock;)V

    .line 120
    .line 121
    .line 122
    return-object v5

    .line 123
    :catchall_0
    move-exception p1

    .line 124
    move-object v3, v6

    .line 125
    goto :goto_6

    .line 126
    :catch_0
    move-exception p1

    .line 127
    goto :goto_4

    .line 128
    :cond_3
    const v11, -0x22334456

    .line 129
    .line 130
    .line 131
    :try_start_4
    invoke-static {v11}, Ll/p6r0;->b(I)[B

    .line 132
    .line 133
    .line 134
    move-result-object v11

    .line 135
    invoke-virtual {v6, v11}, Ljava/io/OutputStream;->write([B)V

    .line 136
    .line 137
    .line 138
    array-length v11, v10

    .line 139
    invoke-static {v11}, Ll/p6r0;->b(I)[B

    .line 140
    .line 141
    .line 142
    move-result-object v11

    .line 143
    invoke-virtual {v6, v11}, Ljava/io/OutputStream;->write([B)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v6, v10}, Ljava/io/OutputStream;->write([B)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v6}, Ljava/io/BufferedOutputStream;->flush()V

    .line 150
    .line 151
    .line 152
    add-int/lit8 v9, v9, 0x1

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_4
    :goto_1
    const-string v10, "event data throw a invalid item "

    .line 156
    .line 157
    invoke-static {v10}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 158
    .line 159
    .line 160
    :goto_2
    add-int/lit8 v7, v7, 0x1

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_5
    :goto_3
    invoke-static {v6}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 164
    .line 165
    .line 166
    invoke-direct {p0, v4, v2}, Ll/yrq0;->g(Ljava/io/RandomAccessFile;Ljava/nio/channels/FileLock;)V

    .line 167
    .line 168
    .line 169
    goto :goto_5

    .line 170
    :catchall_1
    move-exception p1

    .line 171
    goto :goto_6

    .line 172
    :catch_1
    move-exception p1

    .line 173
    move-object v6, v3

    .line 174
    goto :goto_4

    .line 175
    :catchall_2
    move-exception p1

    .line 176
    move-object v2, v3

    .line 177
    goto :goto_6

    .line 178
    :catch_2
    move-exception p1

    .line 179
    move-object v2, v3

    .line 180
    move-object v6, v2

    .line 181
    goto :goto_4

    .line 182
    :catchall_3
    move-exception p1

    .line 183
    move-object v2, v3

    .line 184
    move-object v4, v2

    .line 185
    goto :goto_6

    .line 186
    :catch_3
    move-exception p1

    .line 187
    move-object v2, v3

    .line 188
    move-object v4, v2

    .line 189
    move-object v6, v4

    .line 190
    :goto_4
    :try_start_5
    const-string v0, "event data write to cache file failed cause exception"

    .line 191
    .line 192
    invoke-static {v0, p1}, Ll/ouq0;->o(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 193
    .line 194
    .line 195
    goto :goto_3

    .line 196
    :goto_5
    return-object v3

    .line 197
    :goto_6
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 198
    .line 199
    .line 200
    invoke-direct {p0, v4, v2}, Ll/yrq0;->g(Ljava/io/RandomAccessFile;Ljava/nio/channels/FileLock;)V

    .line 201
    .line 202
    .line 203
    throw p1
.end method

.method private l(Ll/xrq0;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "event"

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ll/yrq0;->d(Ll/xrq0;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/4 v0, 0x0

    .line 43
    :goto_0
    const/16 v1, 0x64

    .line 44
    .line 45
    if-ge v0, v1, :cond_1

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v2, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 63
    .line 64
    invoke-static {v2, v1}, Ll/lvq0;->d(Landroid/content/Context;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_0

    .line 69
    .line 70
    return-object v1

    .line 71
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    const/4 p0, 0x0

    .line 75
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "event"

    .line 4
    .line 5
    const-string v2, "eventUploading"

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/lvq0;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v0, v2}, Ll/lvq0;->f(Landroid/content/Context;Ljava/lang/String;)[Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_a

    .line 17
    .line 18
    array-length v1, v0

    .line 19
    if-gtz v1, :cond_0

    .line 20
    .line 21
    goto/16 :goto_c

    .line 22
    .line 23
    :cond_0
    array-length v1, v0

    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x0

    .line 26
    move-object v4, v2

    .line 27
    move v5, v3

    .line 28
    move-object v3, v4

    .line 29
    :goto_0
    if-ge v5, v1, :cond_a

    .line 30
    .line 31
    aget-object v6, v0, v5

    .line 32
    .line 33
    if-nez v6, :cond_2

    .line 34
    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-eqz v6, :cond_1

    .line 42
    .line 43
    :try_start_0
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catch_0
    move-exception v6

    .line 48
    invoke-static {v6}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_1
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 52
    .line 53
    .line 54
    if-eqz v4, :cond_7

    .line 55
    .line 56
    :goto_2
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 57
    .line 58
    .line 59
    goto/16 :goto_9

    .line 60
    .line 61
    :cond_2
    :try_start_1
    invoke-virtual {v6}, Ljava/io/File;->length()J

    .line 62
    .line 63
    .line 64
    move-result-wide v7

    .line 65
    const-wide/32 v9, 0x500000

    .line 66
    .line 67
    .line 68
    cmp-long v7, v7, v9

    .line 69
    .line 70
    if-lez v7, :cond_4

    .line 71
    .line 72
    new-instance v7, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v8, "eventData read from cache file failed because "

    .line 78
    .line 79
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v8, " is too big, length "

    .line 90
    .line 91
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6}, Ljava/io/File;->length()J

    .line 95
    .line 96
    .line 97
    move-result-wide v8

    .line 98
    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    invoke-static {v7}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    iget-object v8, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 113
    .line 114
    invoke-virtual {v6}, Ljava/io/File;->length()J

    .line 115
    .line 116
    .line 117
    move-result-wide v9

    .line 118
    invoke-static {v8, v9, v10}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    invoke-direct {p0, v7, v8}, Ll/yrq0;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v6}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    .line 127
    .line 128
    if-eqz v2, :cond_3

    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    if-eqz v6, :cond_3

    .line 135
    .line 136
    :try_start_2
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :catch_1
    move-exception v6

    .line 141
    invoke-static {v6}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 142
    .line 143
    .line 144
    :cond_3
    :goto_3
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 145
    .line 146
    .line 147
    if-eqz v4, :cond_7

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :catchall_0
    move-exception p0

    .line 151
    goto/16 :goto_a

    .line 152
    .line 153
    :catch_2
    move-exception v6

    .line 154
    goto :goto_7

    .line 155
    :cond_4
    :try_start_3
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    new-instance v8, Ljava/io/File;

    .line 160
    .line 161
    new-instance v9, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string v10, ".lock"

    .line 170
    .line 171
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v9

    .line 178
    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 179
    .line 180
    .line 181
    :try_start_4
    invoke-static {v8}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 182
    .line 183
    .line 184
    new-instance v4, Ljava/io/RandomAccessFile;

    .line 185
    .line 186
    const-string v9, "rw"

    .line 187
    .line 188
    invoke-direct {v4, v8, v9}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 189
    .line 190
    .line 191
    :try_start_5
    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-direct {p0, v7}, Ll/yrq0;->e(Ljava/lang/String;)Ljava/util/List;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-virtual {p0, v3}, Ll/yrq0;->i(Ljava/util/List;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v6}, Ljava/io/File;->delete()Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 207
    .line 208
    .line 209
    if-eqz v2, :cond_5

    .line 210
    .line 211
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-eqz v3, :cond_5

    .line 216
    .line 217
    :try_start_6
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 218
    .line 219
    .line 220
    goto :goto_4

    .line 221
    :catch_3
    move-exception v3

    .line 222
    invoke-static {v3}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 223
    .line 224
    .line 225
    :cond_5
    :goto_4
    invoke-static {v4}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 229
    .line 230
    .line 231
    move-object v3, v4

    .line 232
    move-object v4, v8

    .line 233
    goto :goto_9

    .line 234
    :catchall_1
    move-exception p0

    .line 235
    move-object v3, v4

    .line 236
    :goto_5
    move-object v4, v8

    .line 237
    goto :goto_a

    .line 238
    :catch_4
    move-exception v6

    .line 239
    move-object v3, v4

    .line 240
    :goto_6
    move-object v4, v8

    .line 241
    goto :goto_7

    .line 242
    :catchall_2
    move-exception p0

    .line 243
    goto :goto_5

    .line 244
    :catch_5
    move-exception v6

    .line 245
    goto :goto_6

    .line 246
    :goto_7
    :try_start_7
    invoke-static {v6}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 247
    .line 248
    .line 249
    if-eqz v2, :cond_6

    .line 250
    .line 251
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    if-eqz v6, :cond_6

    .line 256
    .line 257
    :try_start_8
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 258
    .line 259
    .line 260
    goto :goto_8

    .line 261
    :catch_6
    move-exception v6

    .line 262
    invoke-static {v6}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 263
    .line 264
    .line 265
    :cond_6
    :goto_8
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 266
    .line 267
    .line 268
    if-eqz v4, :cond_7

    .line 269
    .line 270
    goto/16 :goto_2

    .line 271
    .line 272
    :cond_7
    :goto_9
    add-int/lit8 v5, v5, 0x1

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :goto_a
    if-eqz v2, :cond_8

    .line 277
    .line 278
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    if-eqz v0, :cond_8

    .line 283
    .line 284
    :try_start_9
    invoke-virtual {v2}, Ljava/nio/channels/FileLock;->release()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    .line 285
    .line 286
    .line 287
    goto :goto_b

    .line 288
    :catch_7
    move-exception v0

    .line 289
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 290
    .line 291
    .line 292
    :cond_8
    :goto_b
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 293
    .line 294
    .line 295
    if-eqz v4, :cond_9

    .line 296
    .line 297
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 298
    .line 299
    .line 300
    :cond_9
    throw p0

    .line 301
    :cond_a
    :goto_c
    return-void
.end method

.method public a(Ll/xrq0;)V
    .locals 2

    .line 302
    instance-of v0, p1, Ll/y3f;

    if-nez v0, :cond_0

    goto :goto_0

    .line 303
    :cond_0
    iget-object v0, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 304
    :cond_1
    check-cast p1, Ll/y3f;

    .line 305
    invoke-static {p1}, Ll/yrq0;->d(Ll/xrq0;)Ljava/lang/String;

    move-result-object v0

    .line 306
    iget-object v1, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    if-nez v1, :cond_2

    .line 307
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 308
    :cond_2
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 309
    iget-object p0, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/lang/String;

    .line 33
    .line 34
    iget-object v2, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/util/ArrayList;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-lez v2, :cond_1

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    new-array v2, v2, [Ll/xrq0;

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v2}, Ll/yrq0;->j([Ll/xrq0;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    iget-object p0, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public b(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ll/xrq0;",
            ">;>;)V"
        }
    .end annotation

    .line 69
    iput-object p1, p0, Ll/yrq0;->b:Ljava/util/HashMap;

    return-void
.end method

.method public f(Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 p0, 0x0

    throw p0
.end method

.method public j([Ll/xrq0;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    aget-object v1, p1, v0

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-direct {p0, p1}, Ll/yrq0;->k([Ll/xrq0;)[Ll/xrq0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    array-length v1, p1

    .line 19
    if-lez v1, :cond_1

    .line 20
    .line 21
    aget-object v1, p1, v0

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    :cond_1
    return-void

    .line 26
    :cond_2
    :goto_0
    const-string p0, "event data write to cache file failed because data null"

    .line 27
    .line 28
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public m([B)Ljava/lang/String;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    const/4 v2, 0x1

    .line 6
    if-ge v1, v2, :cond_0

    .line 7
    .line 8
    goto :goto_6

    .line 9
    :cond_0
    iget-object v1, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {v1}, Ll/erq0;->f(Landroid/content/Context;)Ll/erq0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/erq0;->d()Ll/uv5;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/uv5;->f()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-static {p1}, Ll/bvq0;->l([B)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    iget-object p0, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {p0}, Ll/lvq0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_2
    invoke-static {p0}, Ll/lvq0;->e(Ljava/lang/String;)[B

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    array-length v1, p0

    .line 50
    if-lez v1, :cond_3

    .line 51
    .line 52
    :try_start_0
    invoke-static {p0, p1}, Ll/g3r0;->b([B[B)[B

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 p1, 0x2

    .line 57
    invoke-static {p0, p1}, Landroid/util/Base64;->decode([BI)[B

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/bvq0;->l([B)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0
    :try_end_0
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    return-object p0

    .line 66
    :catch_0
    move-exception p0

    .line 67
    goto :goto_0

    .line 68
    :catch_1
    move-exception p0

    .line 69
    goto :goto_1

    .line 70
    :catch_2
    move-exception p0

    .line 71
    goto :goto_2

    .line 72
    :catch_3
    move-exception p0

    .line 73
    goto :goto_3

    .line 74
    :catch_4
    move-exception p0

    .line 75
    goto :goto_4

    .line 76
    :catch_5
    move-exception p0

    .line 77
    goto :goto_5

    .line 78
    :goto_0
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    goto :goto_6

    .line 82
    :goto_1
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    goto :goto_6

    .line 86
    :goto_2
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    goto :goto_6

    .line 90
    :goto_3
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    goto :goto_6

    .line 94
    :goto_4
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    goto :goto_6

    .line 98
    :goto_5
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_6
    return-object v0
.end method

.method public n(Ljava/lang/String;)[B
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {v0}, Ll/erq0;->f(Landroid/content/Context;)Ll/erq0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/erq0;->d()Ll/uv5;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/uv5;->f()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-static {p1}, Ll/bvq0;->j(Ljava/lang/String;)[B

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    iget-object p0, p0, Ll/yrq0;->a:Landroid/content/Context;

    .line 31
    .line 32
    invoke-static {p0}, Ll/lvq0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p1}, Ll/bvq0;->j(Ljava/lang/String;)[B

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_3

    .line 45
    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    array-length v0, p1

    .line 49
    const/4 v2, 0x1

    .line 50
    if-gt v0, v2, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-static {p0}, Ll/lvq0;->e(Ljava/lang/String;)[B

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    :try_start_0
    array-length v0, p0

    .line 60
    if-le v0, v2, :cond_3

    .line 61
    .line 62
    const/4 v0, 0x2

    .line 63
    invoke-static {p1, v0}, Landroid/util/Base64;->encode([BI)[B

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p0, p1}, Ll/g3r0;->c([B[B)[B

    .line 68
    .line 69
    .line 70
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    return-object p0

    .line 72
    :catch_0
    move-exception p0

    .line 73
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    :goto_0
    return-object v1
.end method
