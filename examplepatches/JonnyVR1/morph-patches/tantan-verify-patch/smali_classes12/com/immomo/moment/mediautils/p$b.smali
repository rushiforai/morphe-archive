.class Lcom/immomo/moment/mediautils/p$b;
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
.field private a:I

.field b:I

.field c:J

.field d:J

.field final e:I

.field final f:I

.field private g:Ll/ad60;

.field final synthetic h:Lcom/immomo/moment/mediautils/p;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/p;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/immomo/moment/mediautils/p$b;->a:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Lcom/immomo/moment/mediautils/p$b;->b:I

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/p$b;->c:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/p$b;->d:J

    .line 17
    .line 18
    const/16 p1, 0xa

    .line 19
    .line 20
    iput p1, p0, Lcom/immomo/moment/mediautils/p$b;->e:I

    .line 21
    .line 22
    const/4 p1, 0x5

    .line 23
    iput p1, p0, Lcom/immomo/moment/mediautils/p$b;->f:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->b(Lcom/immomo/moment/mediautils/p;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/immomo/moment/mediautils/p;->h:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/immomo/moment/mediautils/p;->e(Lcom/immomo/moment/mediautils/p;)Ljava/util/LinkedList;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/ad60;

    .line 26
    .line 27
    iput-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 28
    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->f(Lcom/immomo/moment/mediautils/p;)Ljava/util/LinkedList;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/16 v2, 0xa

    .line 41
    .line 42
    if-lt v0, v2, :cond_1

    .line 43
    .line 44
    const-wide/16 v0, 0x5

    .line 45
    .line 46
    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    const-string v1, "Media_Splicing"

    .line 52
    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "Running demuxer failed when splice video !!! "

    .line 56
    .line 57
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 75
    .line 76
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->a(Lcom/immomo/moment/mediautils/p;)Ll/spw;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    if-eqz v1, :cond_0

    .line 81
    .line 82
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 83
    .line 84
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->a(Lcom/immomo/moment/mediautils/p;)Ll/spw;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    new-instance v2, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    const-string v3, "Running demuxer failed when splice video !!! "

    .line 91
    .line 92
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const/16 v2, 0x3ed

    .line 107
    .line 108
    invoke-interface {v1, v2, v0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 113
    .line 114
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->g(Lcom/immomo/moment/mediautils/p;)Lcom/immomo/moment/mediautils/j;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/j;->i(Ll/ad60;)Ll/ad60;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 125
    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/immomo/moment/mediautils/p;->i:Ljava/lang/Object;

    .line 131
    .line 132
    monitor-enter v0

    .line 133
    :try_start_2
    iget v1, p0, Lcom/immomo/moment/mediautils/p$b;->a:I

    .line 134
    .line 135
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 136
    .line 137
    invoke-virtual {v2}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 142
    .line 143
    add-int/2addr v1, v2

    .line 144
    iput v1, p0, Lcom/immomo/moment/mediautils/p$b;->a:I

    .line 145
    .line 146
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 147
    .line 148
    invoke-virtual {v1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 153
    .line 154
    invoke-virtual {v2}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    iget-wide v2, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 159
    .line 160
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/p$b;->c:J

    .line 161
    .line 162
    add-long/2addr v2, v4

    .line 163
    iput-wide v2, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 164
    .line 165
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 166
    .line 167
    invoke-virtual {v1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    iget-wide v1, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 172
    .line 173
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/p$b;->d:J

    .line 174
    .line 175
    iget-object v1, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 176
    .line 177
    invoke-static {v1}, Lcom/immomo/moment/mediautils/p;->f(Lcom/immomo/moment/mediautils/p;)Ljava/util/LinkedList;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 182
    .line 183
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    const-string v1, "Media_Splicing"

    .line 187
    .line 188
    new-instance v2, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    const-string v3, "total size is "

    .line 194
    .line 195
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget v3, p0, Lcom/immomo/moment/mediautils/p$b;->a:I

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v3, " cur size="

    .line 204
    .line 205
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-object v3, p0, Lcom/immomo/moment/mediautils/p$b;->g:Ll/ad60;

    .line 209
    .line 210
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 215
    .line 216
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v3, " cur pts="

    .line 220
    .line 221
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/p$b;->d:J

    .line 225
    .line 226
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string v3, " correct="

    .line 230
    .line 231
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/p$b;->c:J

    .line 235
    .line 236
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    monitor-exit v0

    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :catchall_0
    move-exception p0

    .line 250
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 251
    throw p0

    .line 252
    :cond_2
    iget v0, p0, Lcom/immomo/moment/mediautils/p$b;->b:I

    .line 253
    .line 254
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 255
    .line 256
    invoke-static {v2}, Lcom/immomo/moment/mediautils/p;->h(Lcom/immomo/moment/mediautils/p;)Ljava/util/List;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    if-lt v0, v2, :cond_3

    .line 265
    .line 266
    goto :goto_1

    .line 267
    :cond_3
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/p$b;->d:J

    .line 268
    .line 269
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/p$b;->c:J

    .line 270
    .line 271
    iget-object v0, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 272
    .line 273
    invoke-static {v0}, Lcom/immomo/moment/mediautils/p;->g(Lcom/immomo/moment/mediautils/p;)Lcom/immomo/moment/mediautils/j;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    iget-object v2, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 278
    .line 279
    invoke-static {v2}, Lcom/immomo/moment/mediautils/p;->h(Lcom/immomo/moment/mediautils/p;)Ljava/util/List;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    iget v3, p0, Lcom/immomo/moment/mediautils/p$b;->b:I

    .line 284
    .line 285
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    check-cast v2, Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/j;->j(Ljava/lang/String;)Z

    .line 292
    .line 293
    .line 294
    iget v0, p0, Lcom/immomo/moment/mediautils/p$b;->b:I

    .line 295
    .line 296
    add-int/2addr v0, v1

    .line 297
    iput v0, p0, Lcom/immomo/moment/mediautils/p$b;->b:I

    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :catchall_1
    move-exception p0

    .line 302
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 303
    throw p0

    .line 304
    :cond_4
    :goto_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/p$b;->h:Lcom/immomo/moment/mediautils/p;

    .line 305
    .line 306
    invoke-static {p0, v1}, Lcom/immomo/moment/mediautils/p;->j(Lcom/immomo/moment/mediautils/p;Z)Z

    .line 307
    .line 308
    .line 309
    return-void
.end method
