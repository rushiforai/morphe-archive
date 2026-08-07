.class public final Ll/nng0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/mvg0;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ll/tng0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/mvg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/nng0;->a:Ll/mvg0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

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
    const-string v2, "sud/mgp/ai/modelcache"

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-static {v1}, Ll/ofg0;->a(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/nng0;->b:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v2, Ljava/io/File;

    .line 36
    .line 37
    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :try_start_0
    new-instance v0, Ll/tng0;

    .line 41
    .line 42
    iget-object v3, p0, Ll/nng0;->b:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-direct {v0, v3, v1, v2}, Ll/tng0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/nng0;->e:Ll/tng0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    new-instance v1, Ll/vqg0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/vqg0;-><init>(Ll/nng0;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, v0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_1

    .line 65
    .line 66
    iget-object v0, v0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 72
    .line 73
    :cond_1
    iget-object p0, p0, Ll/nng0;->e:Ll/tng0;

    .line 74
    .line 75
    iget-object v0, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 76
    .line 77
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_STARTED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 78
    .line 79
    if-eq v0, v1, :cond_5

    .line 80
    .line 81
    sget-object v2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 82
    .line 83
    if-eq v0, v2, :cond_5

    .line 84
    .line 85
    sget-object v2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 86
    .line 87
    if-ne v0, v2, :cond_2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v2, "download:"

    .line 93
    .line 94
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v2, "  url:"

    .line 103
    .line 104
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Ll/tng0;->l:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v2, "  parentPath:"

    .line 113
    .line 114
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget-object v2, p0, Ll/tng0;->b:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v2, "  fileName:"

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Ll/tng0;->c:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    const-string v2, "DownloadFileTask"

    .line 137
    .line 138
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, v1}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/tng0;->f:Ll/rjg0;

    .line 145
    .line 146
    if-eqz v0, :cond_3

    .line 147
    .line 148
    iget-object v0, v0, Ll/rjg0;->b:Ljava/lang/ref/WeakReference;

    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 151
    .line 152
    .line 153
    :cond_3
    new-instance v0, Ll/rjg0;

    .line 154
    .line 155
    invoke-direct {v0, p0}, Ll/rjg0;-><init>(Ll/tng0;)V

    .line 156
    .line 157
    .line 158
    iput-object v0, p0, Ll/tng0;->f:Ll/rjg0;

    .line 159
    .line 160
    iget-object v1, p0, Ll/tng0;->a:Ll/aug0;

    .line 161
    .line 162
    invoke-virtual {v1, v0}, Ll/aug0;->m(Ll/eog0;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 166
    .line 167
    if-eqz v0, :cond_4

    .line 168
    .line 169
    iget-object v0, v0, Ll/crg0;->a:Ljava/lang/ref/WeakReference;

    .line 170
    .line 171
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 175
    .line 176
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->cancel()V

    .line 177
    .line 178
    .line 179
    const/4 v0, 0x0

    .line 180
    iput-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 181
    .line 182
    :cond_4
    new-instance v0, Ll/crg0;

    .line 183
    .line 184
    invoke-direct {v0, p0}, Ll/crg0;-><init>(Ll/tng0;)V

    .line 185
    .line 186
    .line 187
    iput-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 188
    .line 189
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->start()Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 190
    .line 191
    .line 192
    :cond_5
    :goto_0
    return-void

    .line 193
    :catch_0
    move-exception v0

    .line 194
    new-instance v1, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    const-string v2, "create download task error:"

    .line 197
    .line 198
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    const-string v3, "AiLoadModelTask"

    .line 213
    .line 214
    invoke-static {v3, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p0, Ll/nng0;->a:Ll/mvg0;

    .line 218
    .line 219
    new-instance v1, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    const/4 v1, -0x1

    .line 232
    invoke-virtual {p0, v1, v0}, Ll/mvg0;->onFailure(ILjava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/nng0;->c:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "XOR"

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-eqz v0, :cond_5

    .line 11
    .line 12
    new-instance v0, Ljava/io/File;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Ll/ing0;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    goto :goto_3

    .line 28
    :cond_0
    :try_start_0
    new-instance p1, Ljava/io/BufferedInputStream;

    .line 29
    .line 30
    new-instance v4, Ljava/io/FileInputStream;

    .line 31
    .line 32
    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 33
    .line 34
    .line 35
    const/high16 v0, 0x80000

    .line 36
    .line 37
    invoke-direct {p1, v4, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 38
    .line 39
    .line 40
    :try_start_1
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    .line 41
    .line 42
    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    .line 44
    .line 45
    :try_start_2
    new-array v5, v0, [B

    .line 46
    .line 47
    :goto_0
    invoke-virtual {p1, v5, v2, v0}, Ljava/io/InputStream;->read([BII)I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    if-eq v6, v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {v4, v5, v2, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catch_0
    move-exception v0

    .line 58
    goto :goto_2

    .line 59
    :cond_1
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 60
    .line 61
    .line 62
    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 63
    invoke-static {p1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v4}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 67
    .line 68
    .line 69
    goto :goto_3

    .line 70
    :goto_1
    move-object v3, v4

    .line 71
    goto :goto_7

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    goto :goto_7

    .line 74
    :catch_1
    move-exception v0

    .line 75
    move-object v4, v3

    .line 76
    goto :goto_2

    .line 77
    :catchall_1
    move-exception p0

    .line 78
    move-object p1, v3

    .line 79
    goto :goto_7

    .line 80
    :catch_2
    move-exception p1

    .line 81
    move-object v0, p1

    .line 82
    move-object p1, v3

    .line 83
    move-object v4, p1

    .line 84
    :goto_2
    :try_start_3
    const-string v5, "FileUtils"

    .line 85
    .line 86
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v5, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 91
    .line 92
    .line 93
    invoke-static {p1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v4}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 97
    .line 98
    .line 99
    :goto_3
    if-eqz v3, :cond_4

    .line 100
    .line 101
    array-length p1, v3

    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    goto :goto_5

    .line 105
    :cond_2
    array-length p1, v3

    .line 106
    new-array p1, p1, [B

    .line 107
    .line 108
    iget-object v0, p0, Ll/nng0;->d:Ljava/lang/String;

    .line 109
    .line 110
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    move v1, v2

    .line 117
    :goto_4
    array-length v4, v3

    .line 118
    if-ge v2, v4, :cond_3

    .line 119
    .line 120
    aget-byte v4, v3, v2

    .line 121
    .line 122
    aget-byte v5, v0, v1

    .line 123
    .line 124
    xor-int/2addr v4, v5

    .line 125
    int-to-byte v4, v4

    .line 126
    aput-byte v4, p1, v2

    .line 127
    .line 128
    add-int/lit8 v1, v1, 0x1

    .line 129
    .line 130
    array-length v4, v0

    .line 131
    rem-int/2addr v1, v4

    .line 132
    add-int/lit8 v2, v2, 0x1

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_3
    iget-object p0, p0, Ll/nng0;->a:Ll/mvg0;

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Ll/mvg0;->onCompleted([B)V

    .line 138
    .line 139
    .line 140
    goto :goto_6

    .line 141
    :cond_4
    :goto_5
    iget-object p0, p0, Ll/nng0;->a:Ll/mvg0;

    .line 142
    .line 143
    const-string p1, "the file is empty"

    .line 144
    .line 145
    invoke-virtual {p0, v1, p1}, Ll/mvg0;->onFailure(ILjava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :goto_6
    return-void

    .line 149
    :catchall_2
    move-exception p0

    .line 150
    goto :goto_1

    .line 151
    :goto_7
    invoke-static {p1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v3}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 155
    .line 156
    .line 157
    throw p0

    .line 158
    :cond_5
    iget-object p1, p0, Ll/nng0;->a:Ll/mvg0;

    .line 159
    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    const-string v2, "Unsupported algorithm:"

    .line 163
    .line 164
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Ll/nng0;->c:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p1, v1, p0}, Ll/mvg0;->onFailure(ILjava/lang/String;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method
