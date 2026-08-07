.class Lcom/immomo/moment/mediautils/p$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private final a:I

.field final synthetic b:Lcom/immomo/moment/mediautils/p;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/p;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0xa

    .line 7
    .line 8
    iput p1, p0, Lcom/immomo/moment/mediautils/p$c;->a:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->b(Lcom/immomo/moment/mediautils/p;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-nez v1, :cond_5

    .line 11
    .line 12
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/immomo/moment/mediautils/p;->i:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v1

    .line 17
    :try_start_0
    iget-object v3, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 18
    .line 19
    invoke-static {v3}, Lcom/immomo/moment/mediautils/p;->f(Lcom/immomo/moment/mediautils/p;)Ljava/util/LinkedList;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ll/ad60;

    .line 28
    .line 29
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    if-eqz v3, :cond_3

    .line 31
    .line 32
    invoke-virtual {v3}, Ll/ad60;->c()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 41
    .line 42
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 47
    .line 48
    add-int/2addr v0, v4

    .line 49
    const/4 v4, 0x1

    .line 50
    if-ne v1, v4, :cond_1

    .line 51
    .line 52
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->l(Lcom/immomo/moment/mediautils/p;)Ll/d710;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 59
    .line 60
    invoke-static {v4}, Lcom/immomo/moment/mediautils/p;->k(Lcom/immomo/moment/mediautils/p;)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {v3}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-virtual {v1, v4, v5, v6}, Ll/d710;->f(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    if-nez v1, :cond_2

    .line 77
    .line 78
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 79
    .line 80
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->l(Lcom/immomo/moment/mediautils/p;)Ll/d710;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 85
    .line 86
    invoke-static {v4}, Lcom/immomo/moment/mediautils/p;->m(Lcom/immomo/moment/mediautils/p;)I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    invoke-virtual {v3}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-virtual {v1, v4, v5, v6}, Ll/d710;->f(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 99
    .line 100
    .line 101
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/immomo/moment/mediautils/p;->h:Ljava/lang/Object;

    .line 104
    .line 105
    monitor-enter v1

    .line 106
    :try_start_1
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 107
    .line 108
    invoke-static {v4}, Lcom/immomo/moment/mediautils/p;->e(Lcom/immomo/moment/mediautils/p;)Ljava/util/LinkedList;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-virtual {v4, v3}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 117
    .line 118
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->c(Lcom/immomo/moment/mediautils/p;)Ll/kpw;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    if-eqz v1, :cond_0

    .line 123
    .line 124
    const-string v1, "Media_Splicing"

    .line 125
    .line 126
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v4, "ProcessedSize="

    .line 129
    .line 130
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v4, " totalSize="

    .line 137
    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-object v4, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 142
    .line 143
    invoke-static {v4}, Lcom/immomo/moment/mediautils/p;->d(Lcom/immomo/moment/mediautils/p;)I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-static {v1, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 158
    .line 159
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->c(Lcom/immomo/moment/mediautils/p;)Ll/kpw;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    int-to-float v3, v0

    .line 164
    mul-float/2addr v3, v2

    .line 165
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 166
    .line 167
    invoke-static {v2}, Lcom/immomo/moment/mediautils/p;->d(Lcom/immomo/moment/mediautils/p;)I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    int-to-float v2, v2

    .line 172
    div-float/2addr v3, v2

    .line 173
    invoke-interface {v1, v3}, Ll/kpw;->onProcessProgress(F)V

    .line 174
    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :catchall_0
    move-exception p0

    .line 179
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 180
    throw p0

    .line 181
    :cond_3
    const-wide/16 v3, 0xa

    .line 182
    .line 183
    :try_start_3
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :catch_0
    move-exception v1

    .line 188
    const-string v3, "Media_Splicing"

    .line 189
    .line 190
    new-instance v4, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v5, "Running muxer failed when splice video !!! "

    .line 193
    .line 194
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    invoke-static {v3, v4}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v3, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 212
    .line 213
    invoke-static {v3}, Lcom/immomo/moment/mediautils/p;->a(Lcom/immomo/moment/mediautils/p;)Ll/spw;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    if-eqz v3, :cond_4

    .line 218
    .line 219
    iget-object v3, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 220
    .line 221
    invoke-static {v3}, Lcom/immomo/moment/mediautils/p;->a(Lcom/immomo/moment/mediautils/p;)Ll/spw;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    new-instance v4, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    const-string v5, "Running muxer failed when splice video !!! "

    .line 228
    .line 229
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    const/16 v4, 0x3ed

    .line 244
    .line 245
    invoke-interface {v3, v4, v1}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 246
    .line 247
    .line 248
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 249
    .line 250
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->i(Lcom/immomo/moment/mediautils/p;)Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    if-eqz v1, :cond_0

    .line 255
    .line 256
    goto :goto_3

    .line 257
    :catchall_1
    move-exception p0

    .line 258
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 259
    throw p0

    .line 260
    :cond_5
    :goto_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 261
    .line 262
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->b(Lcom/immomo/moment/mediautils/p;)Z

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    if-nez v0, :cond_6

    .line 267
    .line 268
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 269
    .line 270
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->l(Lcom/immomo/moment/mediautils/p;)Ll/d710;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    invoke-virtual {v0}, Ll/d710;->e()V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 278
    .line 279
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->g(Lcom/immomo/moment/mediautils/p;)Lcom/immomo/moment/mediautils/j;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/j;->e()V

    .line 284
    .line 285
    .line 286
    :cond_6
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 287
    .line 288
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->c(Lcom/immomo/moment/mediautils/p;)Ll/kpw;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    if-eqz v0, :cond_7

    .line 293
    .line 294
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 295
    .line 296
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->c(Lcom/immomo/moment/mediautils/p;)Ll/kpw;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-interface {v0, v2}, Ll/kpw;->onProcessProgress(F)V

    .line 301
    .line 302
    .line 303
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 304
    .line 305
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->c(Lcom/immomo/moment/mediautils/p;)Ll/kpw;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-interface {v0}, Ll/kpw;->a()V

    .line 310
    .line 311
    .line 312
    :cond_7
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p$c;->b:Lcom/immomo/moment/mediautils/p;

    .line 313
    .line 314
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/p;->o()V

    .line 315
    .line 316
    .line 317
    return-void
.end method
