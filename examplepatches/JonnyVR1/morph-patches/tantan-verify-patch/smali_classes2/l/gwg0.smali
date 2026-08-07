.class public abstract Ll/gwg0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic a(Ljava/io/File;Ljava/lang/String;Ll/wtg0;)V
    .locals 6

    .line 1
    invoke-static {p0}, Ll/gxg0;->a(Ljava/io/File;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    :goto_0
    move v4, v0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    goto :goto_0

    .line 19
    :goto_1
    new-instance v0, Ll/yvg0;

    .line 20
    .line 21
    move-object v2, p0

    .line 22
    move-object v3, p1

    .line 23
    move-object v1, p2

    .line 24
    invoke-direct/range {v0 .. v5}, Ll/yvg0;-><init>(Ll/wtg0;Ljava/io/File;Ljava/lang/String;ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static b(Ljava/io/File;Ljava/lang/String;Ll/pvg0;)V
    .locals 2

    .line 1
    sget-object v0, Ll/fkg0;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/wvg0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/wvg0;-><init>(Ljava/io/File;Ljava/lang/String;Ll/wtg0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static c(Ll/wtg0;Ljava/io/File;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 9

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    check-cast p0, Ll/pvg0;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    :goto_0
    move-object v2, v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "checkMd5 onCompleted mdId:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 24
    .line 25
    iget-wide v3, v1, Ll/sgg0;->b:J

    .line 26
    .line 27
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, "  path:"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, "  checkMd5:"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v3, "  fileMd5:"

    .line 47
    .line 48
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v4, "  isMatch:"

    .line 55
    .line 56
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v4, "SudDownloadTask"

    .line 67
    .line 68
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 72
    .line 73
    const-string v5, "  :mgId:"

    .line 74
    .line 75
    if-eqz p3, :cond_3

    .line 76
    .line 77
    new-instance p2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string p3, "checkMd5 match:"

    .line 80
    .line 81
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p4, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 85
    .line 86
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget-object p4, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 93
    .line 94
    iget-wide v0, p4, Ll/sgg0;->b:J

    .line 95
    .line 96
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-static {v4, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    sget-object p2, Ll/sgg0;->u:Ljava/lang/String;

    .line 107
    .line 108
    new-instance p4, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {p4, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object p3, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 114
    .line 115
    iget-object p3, p3, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 116
    .line 117
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-object p3, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 124
    .line 125
    iget-wide v0, p3, Ll/sgg0;->b:J

    .line 126
    .line 127
    invoke-virtual {p4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    invoke-static {p2, p3}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget-object p2, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 138
    .line 139
    iget-object v3, p2, Ll/sgg0;->i:Ll/prg0;

    .line 140
    .line 141
    if-nez v3, :cond_2

    .line 142
    .line 143
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 144
    .line 145
    iput-object p1, p2, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 146
    .line 147
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 148
    .line 149
    .line 150
    move-result-wide p3

    .line 151
    iput-wide p3, p2, Ll/sgg0;->r:J

    .line 152
    .line 153
    invoke-virtual {p2, p1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 157
    .line 158
    iget-object p1, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 159
    .line 160
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    const/4 p3, 0x0

    .line 165
    :goto_2
    if-ge p3, p2, :cond_1

    .line 166
    .line 167
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p4

    .line 171
    add-int/lit8 p3, p3, 0x1

    .line 172
    .line 173
    move-object v1, p4

    .line 174
    check-cast v1, Ll/wfg0;

    .line 175
    .line 176
    iget-wide v3, p0, Ll/sgg0;->p:J

    .line 177
    .line 178
    iget-object v6, p0, Ll/sgg0;->o:Ll/bxg0;

    .line 179
    .line 180
    const/4 v5, 0x0

    .line 181
    invoke-interface/range {v1 .. v6}, Ll/wfg0;->f(Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;)V

    .line 182
    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_1
    invoke-virtual {p0}, Ll/sgg0;->a()V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_2
    iget-wide v5, p2, Ll/sgg0;->p:J

    .line 190
    .line 191
    iget-object p2, p2, Ll/sgg0;->g:Ll/oqg0;

    .line 192
    .line 193
    iget-object v7, p2, Ll/oqg0;->g:Ljava/lang/Object;

    .line 194
    .line 195
    new-instance v8, Ll/tpg0;

    .line 196
    .line 197
    invoke-direct {v8, p0, v2}, Ll/tpg0;-><init>(Ll/pvg0;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    move-object v4, p1

    .line 201
    invoke-interface/range {v3 .. v8}, Ll/prg0;->a(Ljava/io/File;JLjava/lang/Object;Ll/tpg0;)V

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    const-string p3, "checkMd5 error:"

    .line 208
    .line 209
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iget-object v0, v0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 213
    .line 214
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 221
    .line 222
    iget-wide v6, v0, Ll/sgg0;->b:J

    .line 223
    .line 224
    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-static {v4, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    sget-object p1, Ll/sgg0;->u:Ljava/lang/String;

    .line 247
    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    .line 249
    .line 250
    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    iget-object p3, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 254
    .line 255
    iget-object p3, p3, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 256
    .line 257
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    iget-object p3, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 264
    .line 265
    iget-wide v4, p3, Ll/sgg0;->b:J

    .line 266
    .line 267
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p2

    .line 286
    invoke-static {p1, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    sget-object p1, Ll/ing0;->a:Ljava/lang/String;

    .line 290
    .line 291
    new-instance p1, Ljava/io/File;

    .line 292
    .line 293
    invoke-direct {p1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    new-instance p2, Ljava/lang/StringBuilder;

    .line 301
    .line 302
    const-string p3, "deleteFile result:"

    .line 303
    .line 304
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    const-string p2, "FileUtils"

    .line 315
    .line 316
    invoke-static {p2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 317
    .line 318
    .line 319
    iget-object p1, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 320
    .line 321
    sget-object p2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 322
    .line 323
    iput-object p2, p1, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 324
    .line 325
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 326
    .line 327
    .line 328
    move-result-wide p3

    .line 329
    iput-wide p3, p1, Ll/sgg0;->r:J

    .line 330
    .line 331
    invoke-virtual {p1, p2}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 332
    .line 333
    .line 334
    iget-object p0, p0, Ll/pvg0;->a:Ll/sgg0;

    .line 335
    .line 336
    const/16 p1, -0x27d8

    .line 337
    .line 338
    const-string p2, "package flaw"

    .line 339
    .line 340
    invoke-virtual {p0, p1, p2}, Ll/sgg0;->b(ILjava/lang/String;)V

    .line 341
    .line 342
    .line 343
    :cond_4
    return-void
.end method
