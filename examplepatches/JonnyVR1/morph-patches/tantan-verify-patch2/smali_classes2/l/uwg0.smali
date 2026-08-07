.class public final Ll/uwg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Z

.field public c:Ll/hsp0;

.field public d:Ll/oug0;

.field public e:Ljava/lang/String;

.field public f:Ll/pkg0;

.field public final g:Ltech/sud/gip/asr/base/Sudnew;

.field public h:Ltech/sud/gip/asr/base/Sudint;

.field public i:J

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:J

.field public final m:Ljava/util/concurrent/LinkedBlockingQueue;


# direct methods
.method public constructor <init>(Ltech/sud/gip/asr/base/Sudif;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-class v0, Ll/uwg0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "SudGIP "

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/uwg0;->a:Ljava/lang/String;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/uwg0;->m:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 24
    .line 25
    iput-object p1, p0, Ll/uwg0;->g:Ltech/sud/gip/asr/base/Sudnew;

    .line 26
    .line 27
    return-void
.end method

.method public static a([B)Ll/skg0;
    .locals 11

    .line 1
    array-length v0, p0

    .line 2
    if-nez v0, :cond_0

    .line 3
    .line 4
    new-instance p0, Ll/skg0;

    .line 5
    .line 6
    invoke-direct {p0}, Ll/skg0;-><init>()V

    .line 7
    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ll/skg0;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/skg0;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    aget-byte v2, p0, v1

    .line 17
    .line 18
    const/16 v3, 0xf

    .line 19
    .line 20
    and-int/2addr v2, v3

    .line 21
    const/4 v4, 0x1

    .line 22
    aget-byte v5, p0, v4

    .line 23
    .line 24
    shr-int/lit8 v6, v5, 0x4

    .line 25
    .line 26
    and-int/2addr v6, v3

    .line 27
    const/4 v7, 0x2

    .line 28
    aget-byte v7, p0, v7

    .line 29
    .line 30
    shr-int/lit8 v8, v7, 0x4

    .line 31
    .line 32
    and-int/2addr v8, v3

    .line 33
    and-int/2addr v7, v3

    .line 34
    const/4 v9, 0x3

    .line 35
    aget-byte v9, p0, v9

    .line 36
    .line 37
    const/4 v9, 0x4

    .line 38
    mul-int/2addr v2, v9

    .line 39
    array-length v10, p0

    .line 40
    invoke-static {p0, v2, v10}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    and-int/lit8 v2, v5, 0x1

    .line 45
    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    invoke-static {p0, v1, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v2}, Ltech/sud/base/utils/BytesUtils;->bytesToInt([B)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iput v2, v0, Ll/skg0;->d:I

    .line 57
    .line 58
    array-length v2, p0

    .line 59
    invoke-static {p0, v9, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    :cond_1
    and-int/lit8 v2, v5, 0x2

    .line 64
    .line 65
    if-eqz v2, :cond_2

    .line 66
    .line 67
    iput-boolean v4, v0, Ll/skg0;->c:Z

    .line 68
    .line 69
    :cond_2
    and-int/lit8 v2, v5, 0x4

    .line 70
    .line 71
    if-eqz v2, :cond_3

    .line 72
    .line 73
    invoke-static {p0, v1, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v2}, Ltech/sud/base/utils/BytesUtils;->bytesToInt([B)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    iput v2, v0, Ll/skg0;->b:I

    .line 82
    .line 83
    array-length v2, p0

    .line 84
    invoke-static {p0, v9, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    :cond_3
    const/16 v2, 0x9

    .line 89
    .line 90
    if-eq v6, v2, :cond_5

    .line 91
    .line 92
    if-eq v6, v3, :cond_4

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    invoke-static {p0, v1, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v2}, Ltech/sud/base/utils/BytesUtils;->bytesToInt([B)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    iput v2, v0, Ll/skg0;->a:I

    .line 104
    .line 105
    const/16 v2, 0x8

    .line 106
    .line 107
    invoke-static {p0, v9, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-static {v3}, Ltech/sud/base/utils/BytesUtils;->bytesToInt([B)I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    iput v3, v0, Ll/skg0;->e:I

    .line 116
    .line 117
    array-length v3, p0

    .line 118
    invoke-static {p0, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    goto :goto_0

    .line 123
    :cond_5
    invoke-static {p0, v1, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-static {v2}, Ltech/sud/base/utils/BytesUtils;->bytesToInt([B)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iput v2, v0, Ll/skg0;->e:I

    .line 132
    .line 133
    array-length v2, p0

    .line 134
    invoke-static {p0, v9, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    :goto_0
    array-length v2, p0

    .line 139
    if-nez v2, :cond_6

    .line 140
    .line 141
    goto :goto_7

    .line 142
    :cond_6
    if-ne v7, v4, :cond_9

    .line 143
    .line 144
    array-length v2, p0

    .line 145
    const/4 v3, 0x0

    .line 146
    if-nez v2, :cond_7

    .line 147
    .line 148
    :goto_1
    move-object p0, v3

    .line 149
    goto :goto_6

    .line 150
    :cond_7
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    .line 151
    .line 152
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 153
    .line 154
    .line 155
    new-instance v5, Ljava/io/ByteArrayInputStream;

    .line 156
    .line 157
    invoke-direct {v5, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 158
    .line 159
    .line 160
    :try_start_0
    new-instance p0, Ljava/util/zip/GZIPInputStream;

    .line 161
    .line 162
    invoke-direct {p0, v5}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .line 164
    .line 165
    const/16 v5, 0x100

    .line 166
    .line 167
    :try_start_1
    new-array v5, v5, [B

    .line 168
    .line 169
    :goto_2
    invoke-virtual {p0, v5}, Ljava/io/InputStream;->read([B)I

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    if-lez v6, :cond_8

    .line 174
    .line 175
    invoke-virtual {v2, v5, v1, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 176
    .line 177
    .line 178
    goto :goto_2

    .line 179
    :catchall_0
    move-exception v1

    .line 180
    goto :goto_3

    .line 181
    :cond_8
    :try_start_2
    invoke-virtual {p0}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    goto :goto_6

    .line 189
    :catch_0
    move-exception p0

    .line 190
    goto :goto_5

    .line 191
    :goto_3
    :try_start_3
    invoke-virtual {p0}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 192
    .line 193
    .line 194
    goto :goto_4

    .line 195
    :catchall_1
    move-exception p0

    .line 196
    :try_start_4
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 197
    .line 198
    .line 199
    :goto_4
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 200
    :goto_5
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 201
    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_9
    :goto_6
    if-ne v8, v4, :cond_a

    .line 205
    .line 206
    if-eqz p0, :cond_a

    .line 207
    .line 208
    new-instance v1, Ljava/lang/String;

    .line 209
    .line 210
    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V

    .line 211
    .line 212
    .line 213
    iput-object v1, v0, Ll/skg0;->f:Ljava/lang/String;

    .line 214
    .line 215
    :cond_a
    :goto_7
    return-object v0
.end method

.method public static h(I)[B
    .locals 5

    .line 1
    shr-int/lit8 v0, p0, 0x18

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    int-to-byte v0, v0

    .line 6
    shr-int/lit8 v1, p0, 0x10

    .line 7
    .line 8
    and-int/lit16 v1, v1, 0xff

    .line 9
    .line 10
    int-to-byte v1, v1

    .line 11
    shr-int/lit8 v2, p0, 0x8

    .line 12
    .line 13
    and-int/lit16 v2, v2, 0xff

    .line 14
    .line 15
    int-to-byte v2, v2

    .line 16
    and-int/lit16 p0, p0, 0xff

    .line 17
    .line 18
    int-to-byte p0, p0

    .line 19
    const/4 v3, 0x4

    .line 20
    new-array v3, v3, [B

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    aput-byte v0, v3, v4

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    aput-byte v1, v3, v0

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    aput-byte v2, v3, v0

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    aput-byte p0, v3, v0

    .line 33
    .line 34
    return-object v3
.end method

.method public static i([BI)[B
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    new-array p0, v0, [B

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    new-instance v2, Ljava/util/zip/GZIPOutputStream;

    .line 13
    .line 14
    invoke-direct {v2, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    :try_start_1
    invoke-virtual {v2, p0, v0, p1}, Ljava/util/zip/GZIPOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :catch_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_1
    move-exception p1

    .line 36
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 40
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    new-array p0, v0, [B

    .line 44
    .line 45
    return-object p0
.end method


# virtual methods
.method public final synthetic b()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uwg0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Ll/cgg0;Ll/nzg0;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/uwg0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/uwg0;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "startRecognize"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "DoubaoAsrAsyncClient"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput-boolean v1, p0, Ll/uwg0;->b:Z

    .line 20
    .line 21
    iget-wide v1, p0, Ll/uwg0;->l:J

    .line 22
    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    cmp-long v1, v1, v3

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    iput-wide v1, p0, Ll/uwg0;->l:J

    .line 34
    .line 35
    :cond_1
    iget-wide v1, p1, Ll/cgg0;->i:J

    .line 36
    .line 37
    iput-wide v1, p0, Ll/uwg0;->i:J

    .line 38
    .line 39
    iget-object v1, p1, Ll/cgg0;->j:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v1, p0, Ll/uwg0;->j:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, p1, Ll/cgg0;->e:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v1, p0, Ll/uwg0;->k:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p1, Ll/cgg0;->f:Ll/pkg0;

    .line 48
    .line 49
    iput-object v1, p0, Ll/uwg0;->f:Ll/pkg0;

    .line 50
    .line 51
    iget-object v1, p1, Ll/cgg0;->a:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v2, p1, Ll/cgg0;->b:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Ll/cgg0;->c:Ljava/lang/String;

    .line 56
    .line 57
    :try_start_0
    new-instance v4, Ll/x1d0$a;

    .line 58
    .line 59
    invoke-direct {v4}, Ll/x1d0$a;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v4, "X-Api-App-Key"

    .line 67
    .line 68
    invoke-virtual {v1, v4, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v2, "X-Api-Access-Key"

    .line 73
    .line 74
    invoke-virtual {v1, v2, v3}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v2, "X-Api-Resource-Id"

    .line 79
    .line 80
    iget-object v3, p1, Ll/cgg0;->d:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v1, v2, v3}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const-string v2, "X-Api-Connect-Id"

    .line 87
    .line 88
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v1, v2, v3}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 101
    .line 102
    .line 103
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    new-instance v1, Ll/zug0;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/zug0;-><init>()V

    .line 107
    .line 108
    .line 109
    const/4 v2, 0x3

    .line 110
    iput v2, v1, Ll/zug0;->c:I

    .line 111
    .line 112
    iget-object v2, v1, Ll/zug0;->b:Ll/cpg0;

    .line 113
    .line 114
    const-string v3, "DoubaoHttpLoggingInterceptor"

    .line 115
    .line 116
    iput-object v3, v2, Ll/cpg0;->a:Ljava/lang/String;

    .line 117
    .line 118
    new-instance v2, Ll/rg50$b;

    .line 119
    .line 120
    invoke-direct {v2}, Ll/rg50$b;-><init>()V

    .line 121
    .line 122
    .line 123
    const-wide/16 v3, 0x32

    .line 124
    .line 125
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 126
    .line 127
    invoke-virtual {v2, v3, v4, v5}, Ll/rg50$b;->q(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2, v1}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const-wide/16 v2, 0x64

    .line 136
    .line 137
    invoke-virtual {v1, v2, v3, v5}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v1, v2, v3, v5}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v1}, Ll/rg50$b;->c()Ll/rg50;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    new-instance v2, Ll/oug0;

    .line 150
    .line 151
    invoke-direct {v2, p0, p1, p2}, Ll/oug0;-><init>(Ll/uwg0;Ll/cgg0;Ll/nzg0;)V

    .line 152
    .line 153
    .line 154
    iput-object v2, p0, Ll/uwg0;->d:Ll/oug0;

    .line 155
    .line 156
    invoke-virtual {v1, v0, v2}, Ll/rg50;->x(Ll/x1d0;Ll/ksp0;)Ll/hsp0;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iput-object p1, p0, Ll/uwg0;->c:Ll/hsp0;

    .line 161
    .line 162
    return-void

    .line 163
    :catch_0
    move-exception p0

    .line 164
    new-instance p1, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string p2, "\u53d1\u751f\u4e86\u5f02\u5e38\uff1a"

    .line 167
    .line 168
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public final synthetic d(Ll/skg0;Ll/nzg0;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u540e\u7aef\u8fd4\u56de\u6570\u636efail code:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p1, Ll/skg0;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " msg:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p1, Ll/skg0;->f:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "DoubaoAsrAsyncClient"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/lang/RuntimeException;

    .line 33
    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "doubao error code:"

    .line 37
    .line 38
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v2, p1, Ll/skg0;->a:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, "  msg:"

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object p1, p1, Ll/skg0;->f:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p2, v0}, Ll/nzg0;->c(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/uwg0;->l()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final e(Ll/nzg0;)V
    .locals 7

    .line 1
    const-string v0, "\u670d\u52a1\u5668\u8fd4\u56de\u4e86\u6700\u540e\u4e00\u4e2a\u5305\uff0c\u5173\u95edasr\u8bc6\u522b"

    .line 2
    .line 3
    const-string v1, "payloadMsg:"

    .line 4
    .line 5
    const-string v2, "DoubaoAsrAsyncClient"

    .line 6
    .line 7
    :cond_0
    :goto_0
    iget-boolean v3, p0, Ll/uwg0;->b:Z

    .line 8
    .line 9
    if-nez v3, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Ll/uwg0;->m:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 12
    .line 13
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_4

    .line 18
    .line 19
    :cond_1
    :try_start_0
    iget-object v3, p0, Ll/uwg0;->m:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 20
    .line 21
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    const-wide/16 v5, 0x64

    .line 24
    .line 25
    invoke-virtual {v3, v5, v6, v4}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, [B

    .line 30
    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    invoke-static {v3}, Ll/uwg0;->a([B)Ll/skg0;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget v4, v3, Ll/skg0;->a:I

    .line 38
    .line 39
    if-eqz v4, :cond_2

    .line 40
    .line 41
    new-instance v4, Ll/xvg0;

    .line 42
    .line 43
    invoke-direct {v4, p0, v3, p1}, Ll/xvg0;-><init>(Ll/uwg0;Ll/skg0;Ll/nzg0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v4}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :catch_0
    move-exception v3

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    iget-object v4, v3, Ll/skg0;->f:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v4, :cond_3

    .line 55
    .line 56
    iget-object v4, p0, Ll/uwg0;->a:Ljava/lang/String;

    .line 57
    .line 58
    new-instance v5, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v6, v3, Ll/skg0;->f:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-static {v4, v5}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v4, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object v5, v3, Ll/skg0;->f:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-static {v2, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    iget-object v4, v3, Ll/skg0;->f:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p0, p1, v4}, Ll/uwg0;->f(Ll/nzg0;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_3
    iget-boolean v3, v3, Ll/skg0;->c:Z

    .line 104
    .line 105
    if-eqz v3, :cond_0

    .line 106
    .line 107
    iget-object v3, p0, Ll/uwg0;->a:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v3, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    new-instance v3, Ll/zvg0;

    .line 116
    .line 117
    invoke-direct {v3, p0}, Ll/zvg0;-><init>(Ll/uwg0;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v3}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    const-string v5, "\u5904\u7406\u54cd\u5e94\u65f6\u53d1\u751f\u4e86\u5f02\u5e38\uff1a"

    .line 127
    .line 128
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v3}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-static {v2, v3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :catch_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 152
    .line 153
    .line 154
    :cond_4
    :goto_2
    return-void
.end method

.method public final f(Ll/nzg0;Ljava/lang/String;)V
    .locals 8

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "result"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    const-string v1, "text"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    const-string v1, "utterances"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 24
    .line 25
    .line 26
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 27
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    :try_start_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-lez v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "definite"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 46
    :cond_1
    move v4, v1

    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    move-object p0, v0

    .line 50
    move-object v6, p2

    .line 51
    goto :goto_3

    .line 52
    :goto_0
    :try_start_2
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    :try_start_3
    iget-object v0, p0, Ll/uwg0;->e:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    :cond_2
    if-eqz v4, :cond_4

    .line 67
    .line 68
    :cond_3
    :try_start_4
    iput-object v5, p0, Ll/uwg0;->e:Ljava/lang/String;

    .line 69
    .line 70
    new-instance v2, Ll/awg0;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 71
    .line 72
    move-object v3, p0

    .line 73
    move-object v7, p1

    .line 74
    move-object v6, p2

    .line 75
    :try_start_5
    invoke-direct/range {v2 .. v7}, Ll/awg0;-><init>(Ll/uwg0;ZLjava/lang/String;Ljava/lang/String;Ll/nzg0;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catch_1
    move-exception v0

    .line 83
    :goto_1
    move-object p0, v0

    .line 84
    goto :goto_3

    .line 85
    :catch_2
    move-exception v0

    .line 86
    move-object v6, p2

    .line 87
    goto :goto_1

    .line 88
    :cond_4
    :goto_2
    return-void

    .line 89
    :goto_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string p2, "parserResponse json:"

    .line 92
    .line 93
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p2, " error:"

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    const-string p1, "DoubaoAsrAsyncClient"

    .line 116
    .line 117
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final synthetic g(ZLjava/lang/String;Ljava/lang/String;Ll/nzg0;)V
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "===>onText definite:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " text:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " payloadStr:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "DoubaoAsrAsyncClient"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v8

    .line 40
    iget-wide v6, p0, Ll/uwg0;->l:J

    .line 41
    .line 42
    move v3, p1

    .line 43
    move-object v4, p2

    .line 44
    move-object v5, p3

    .line 45
    move-object v2, p4

    .line 46
    invoke-interface/range {v2 .. v9}, Ll/nzg0;->d(ZLjava/lang/String;Ljava/lang/String;JJ)V

    .line 47
    .line 48
    .line 49
    iput-wide v8, p0, Ll/uwg0;->l:J

    .line 50
    .line 51
    return-void
.end method

.method public final j()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uwg0;->h:Ltech/sud/gip/asr/base/Sudint;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    monitor-enter v0

    .line 7
    :try_start_0
    iget-boolean v1, v0, Ltech/sud/gip/asr/base/Sudint;->Sudcase:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 v1, 0x0

    .line 14
    :try_start_1
    iput-boolean v1, v0, Ltech/sud/gip/asr/base/Sudint;->Sudcase:Z

    .line 15
    .line 16
    iget-object v1, v0, Ltech/sud/gip/asr/base/Sudint;->Sudgoto:Landroid/os/Handler;

    .line 17
    .line 18
    iget-object v2, v0, Ltech/sud/gip/asr/base/Sudint;->Sudelse:Ltech/sud/gip/asr/base/Sudfor;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ltech/sud/gip/asr/base/Sudint;->Suddo()V

    .line 24
    .line 25
    .line 26
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    :goto_0
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ll/uwg0;->h:Ltech/sud/gip/asr/base/Sudint;

    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    monitor-exit v0

    .line 33
    throw p0
.end method

.method public final synthetic k()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uwg0;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/uwg0;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/uwg0;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "stopRecognize"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "DoubaoAsrAsyncClient"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/vvg0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/vvg0;-><init>(Ll/uwg0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ll/uwg0;->b:Z

    .line 28
    .line 29
    iget-object v2, p0, Ll/uwg0;->c:Ll/hsp0;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    const/16 v4, 0x3e8

    .line 35
    .line 36
    invoke-interface {v2, v4, v1}, Ll/hsp0;->close(ILjava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    iput-object v3, p0, Ll/uwg0;->c:Ll/hsp0;

    .line 40
    .line 41
    :cond_1
    iget-object v1, p0, Ll/uwg0;->f:Ll/pkg0;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    iget-object v2, v1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offer(B)Z

    .line 50
    .line 51
    .line 52
    iput-object v3, v1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 53
    .line 54
    :cond_2
    iput-object v3, p0, Ll/uwg0;->f:Ll/pkg0;

    .line 55
    .line 56
    :cond_3
    iput-object v3, p0, Ll/uwg0;->e:Ljava/lang/String;

    .line 57
    .line 58
    const-wide/16 v0, 0x0

    .line 59
    .line 60
    iput-wide v0, p0, Ll/uwg0;->l:J

    .line 61
    .line 62
    return-void
.end method
