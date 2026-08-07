.class public final Ll/rjg0;
.super Ll/eog0;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Ll/tng0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eog0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/rjg0;->b:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ll/aug0;ILjava/lang/Exception;)V
    .locals 7

    .line 1
    iget-object p0, p0, Ll/rjg0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/tng0;

    .line 8
    .line 9
    const-string v0, "DownloadFileTask"

    .line 10
    .line 11
    if-eqz p0, :cond_b

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "taskEnd:"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v3, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, "  cause:"

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Ll/ekg0;->a(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v4, "  cancelCause:"

    .line 38
    .line 39
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const/4 v5, 0x1

    .line 43
    invoke-static {v5}, Ll/bjg0;->a(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v6, "  realCause:"

    .line 51
    .line 52
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {p3}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    sget-object v1, Ll/tng0;->m:Ljava/lang/String;

    .line 70
    .line 71
    new-instance v6, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 77
    .line 78
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-static {p2}, Ll/ekg0;->a(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-static {v5}, Ll/bjg0;->a(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-static {v1, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    if-eqz p3, :cond_0

    .line 109
    .line 110
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 111
    .line 112
    .line 113
    :cond_0
    if-eqz p3, :cond_1

    .line 114
    .line 115
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    goto :goto_0

    .line 120
    :cond_1
    const/4 v2, 0x0

    .line 121
    :goto_0
    const/4 v3, 0x3

    .line 122
    if-nez v2, :cond_3

    .line 123
    .line 124
    if-ne p2, v3, :cond_2

    .line 125
    .line 126
    const-string v2, "user cancel"

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_2
    invoke-static {p2}, Ll/ekg0;->a(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    const-string v4, "EndCause:"

    .line 134
    .line 135
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    :cond_3
    :goto_1
    if-ne p2, v5, :cond_6

    .line 140
    .line 141
    sget-object p2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 142
    .line 143
    invoke-virtual {p0, p2}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 144
    .line 145
    .line 146
    new-instance p2, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string p3, "checkMd5:"

    .line 149
    .line 150
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 154
    .line 155
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-static {v0, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    new-instance p2, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object p3, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 171
    .line 172
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    invoke-static {v1, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1}, Ll/aug0;->j()Ljava/io/File;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    sget-object p2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 187
    .line 188
    invoke-virtual {p0, p2}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 189
    .line 190
    .line 191
    if-nez p1, :cond_4

    .line 192
    .line 193
    const-string p1, ""

    .line 194
    .line 195
    :goto_2
    move-object v1, p1

    .line 196
    goto :goto_3

    .line 197
    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    goto :goto_2

    .line 202
    :goto_3
    iget-object p1, p0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 203
    .line 204
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    const/4 p3, 0x0

    .line 209
    :goto_4
    if-ge p3, p2, :cond_5

    .line 210
    .line 211
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    add-int/lit8 p3, p3, 0x1

    .line 216
    .line 217
    check-cast v0, Ll/wfg0;

    .line 218
    .line 219
    iget-wide v2, p0, Ll/tng0;->i:J

    .line 220
    .line 221
    iget-object v5, p0, Ll/tng0;->h:Ll/bxg0;

    .line 222
    .line 223
    const/4 v4, 0x0

    .line 224
    invoke-interface/range {v0 .. v5}, Ll/wfg0;->f(Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;)V

    .line 225
    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_5
    return-void

    .line 229
    :cond_6
    if-ne p2, v3, :cond_a

    .line 230
    .line 231
    invoke-static {v5}, Ll/pxg0;->a(I)I

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-eqz p1, :cond_9

    .line 236
    .line 237
    const/4 p2, 0x2

    .line 238
    const/4 p3, -0x1

    .line 239
    if-eq p1, p2, :cond_8

    .line 240
    .line 241
    if-eq p1, v3, :cond_7

    .line 242
    .line 243
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 244
    .line 245
    invoke-virtual {p0, p1}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 246
    .line 247
    .line 248
    const-string p1, "unknown cancel"

    .line 249
    .line 250
    invoke-virtual {p0, p3, p1}, Ll/tng0;->a(ILjava/lang/String;)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_7
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 255
    .line 256
    invoke-virtual {p0, p1}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 257
    .line 258
    .line 259
    const-string p1, "hang up cancel"

    .line 260
    .line 261
    invoke-virtual {p0, p3, p1}, Ll/tng0;->a(ILjava/lang/String;)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_8
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 266
    .line 267
    invoke-virtual {p0, p1}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 268
    .line 269
    .line 270
    const-string p1, "pause cancel"

    .line 271
    .line 272
    invoke-virtual {p0, p3, p1}, Ll/tng0;->a(ILjava/lang/String;)V

    .line 273
    .line 274
    .line 275
    return-void

    .line 276
    :cond_9
    const/16 p1, -0x2775

    .line 277
    .line 278
    const-string p2, "retry download fail. unknown cancel"

    .line 279
    .line 280
    invoke-virtual {p0, p1, p2}, Ll/tng0;->a(ILjava/lang/String;)V

    .line 281
    .line 282
    .line 283
    return-void

    .line 284
    :cond_a
    invoke-static {p3}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    invoke-virtual {p0, p1, v2}, Ll/tng0;->a(ILjava/lang/String;)V

    .line 289
    .line 290
    .line 291
    return-void

    .line 292
    :cond_b
    sget-object p0, Ll/tng0;->m:Ljava/lang/String;

    .line 293
    .line 294
    const-string p1, "taskEnd error task is null"

    .line 295
    .line 296
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-static {v0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 300
    .line 301
    .line 302
    return-void
.end method

.method public final b(Ll/bog0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/bog0;->c()J

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/rjg0;->b:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/tng0;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/bog0;->c()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/tng0;->i:J

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bog0;->e()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Ll/tng0;->j:J

    .line 25
    .line 26
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "infoReady mgId:"

    .line 34
    .line 35
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/tng0;->l:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "DownloadFileTask"

    .line 48
    .line 49
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final c(Ll/aug0;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/rjg0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/tng0;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    if-ge v1, v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    check-cast v2, Ll/wfg0;

    .line 27
    .line 28
    invoke-interface {v2}, Ll/wfg0;->a()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v0, "taskStart mgId:"

    .line 35
    .line 36
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/tng0;->l:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "DownloadFileTask"

    .line 49
    .line 50
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final d(J)V
    .locals 6

    .line 1
    iget-object p0, p0, Ll/rjg0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/tng0;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iput-wide p1, p0, Ll/tng0;->j:J

    .line 12
    .line 13
    iget-wide v0, p0, Ll/tng0;->i:J

    .line 14
    .line 15
    iget-object v2, p0, Ll/tng0;->e:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/4 v4, 0x0

    .line 22
    :goto_0
    if-ge v4, v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    add-int/lit8 v4, v4, 0x1

    .line 29
    .line 30
    check-cast v5, Ll/wfg0;

    .line 31
    .line 32
    invoke-interface {v5, p1, p2, v0, v1}, Ll/wfg0;->d(JJ)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/tng0;->b(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 39
    .line 40
    .line 41
    sget-object v0, Ll/tng0;->m:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v2, " \u8fdb\u5ea6\uff1a"

    .line 46
    .line 47
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, "/"

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-wide v4, p0, Ll/tng0;->i:J

    .line 59
    .line 60
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-wide p0, p0, Ll/tng0;->i:J

    .line 82
    .line 83
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "DownloadFileTask"

    .line 91
    .line 92
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    return-void
.end method
