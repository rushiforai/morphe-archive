.class Lcom/immomo/moment/mediautils/i$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/i;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 2
    .line 3
    iget v1, v0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 4
    .line 5
    if-gtz v1, :cond_0

    .line 6
    .line 7
    iget v1, v0, Lcom/immomo/moment/mediautils/m;->c:I

    .line 8
    .line 9
    iput v1, v0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 10
    .line 11
    :cond_0
    iget v1, v0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 12
    .line 13
    if-gtz v1, :cond_1

    .line 14
    .line 15
    iget v1, v0, Lcom/immomo/moment/mediautils/m;->e:I

    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 18
    .line 19
    :cond_1
    iget v1, v0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 20
    .line 21
    if-gtz v1, :cond_2

    .line 22
    .line 23
    iget v1, v0, Lcom/immomo/moment/mediautils/m;->d:I

    .line 24
    .line 25
    iput v1, v0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 26
    .line 27
    :cond_2
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 28
    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    new-instance v1, Landroid/media/MediaFormat;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/media/MediaFormat;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 37
    .line 38
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 39
    .line 40
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 41
    .line 42
    const-string v2, "channel-count"

    .line 43
    .line 44
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->e:I

    .line 45
    .line 46
    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 50
    .line 51
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 52
    .line 53
    const-string v2, "sample-rate"

    .line 54
    .line 55
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->c:I

    .line 56
    .line 57
    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 61
    .line 62
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 63
    .line 64
    const-string v2, "bit-width"

    .line 65
    .line 66
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->d:I

    .line 67
    .line 68
    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 72
    .line 73
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 74
    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 78
    .line 79
    invoke-interface {v1, v0}, Lcom/immomo/moment/mediautils/m$c;->d(Landroid/media/MediaFormat;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 83
    .line 84
    iget v1, v0, Lcom/immomo/moment/mediautils/m;->d:I

    .line 85
    .line 86
    mul-int/lit16 v1, v1, 0x400

    .line 87
    .line 88
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 89
    .line 90
    mul-int/2addr v1, v0

    .line 91
    div-int/lit8 v1, v1, 0x8

    .line 92
    .line 93
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 98
    .line 99
    iget-wide v2, v1, Lcom/immomo/moment/mediautils/m;->o:J

    .line 100
    .line 101
    const-wide/16 v4, 0x0

    .line 102
    .line 103
    cmp-long v6, v2, v4

    .line 104
    .line 105
    if-ltz v6, :cond_6

    .line 106
    .line 107
    iget-wide v6, v1, Lcom/immomo/moment/mediautils/m;->q:J

    .line 108
    .line 109
    cmp-long v8, v6, v4

    .line 110
    .line 111
    if-lez v8, :cond_6

    .line 112
    .line 113
    cmp-long v8, v6, v2

    .line 114
    .line 115
    if-lez v8, :cond_6

    .line 116
    .line 117
    sub-long/2addr v6, v2

    .line 118
    iget-wide v4, v1, Lcom/immomo/moment/mediautils/m;->m:J

    .line 119
    .line 120
    cmp-long v1, v6, v4

    .line 121
    .line 122
    if-lez v1, :cond_5

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_5
    add-long v4, v6, v2

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_6
    iget-wide v1, v1, Lcom/immomo/moment/mediautils/m;->m:J

    .line 129
    .line 130
    move-wide v13, v4

    .line 131
    move-wide v4, v1

    .line 132
    move-wide v2, v13

    .line 133
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 134
    .line 135
    invoke-static {v1}, Lcom/immomo/moment/mediautils/i;->H(Lcom/immomo/moment/mediautils/i;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    const/4 v6, 0x1

    .line 140
    if-nez v1, :cond_c

    .line 141
    .line 142
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 143
    .line 144
    invoke-static {v1}, Lcom/immomo/moment/mediautils/i;->I(Lcom/immomo/moment/mediautils/i;)Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    const-wide/16 v7, 0x5

    .line 149
    .line 150
    if-nez v1, :cond_b

    .line 151
    .line 152
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 153
    .line 154
    invoke-static {v1}, Lcom/immomo/moment/mediautils/i;->U(Lcom/immomo/moment/mediautils/i;)J

    .line 155
    .line 156
    .line 157
    move-result-wide v9

    .line 158
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 159
    .line 160
    invoke-static {v1}, Lcom/immomo/moment/mediautils/i;->W(Lcom/immomo/moment/mediautils/i;)J

    .line 161
    .line 162
    .line 163
    move-result-wide v11

    .line 164
    sub-long/2addr v9, v11

    .line 165
    const-wide/16 v11, 0x7530

    .line 166
    .line 167
    cmp-long v1, v9, v11

    .line 168
    .line 169
    if-lez v1, :cond_7

    .line 170
    .line 171
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 172
    .line 173
    iget-boolean v1, v1, Lcom/immomo/moment/mediautils/i;->k0:Z

    .line 174
    .line 175
    if-eqz v1, :cond_7

    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_7
    cmp-long v1, v2, v4

    .line 179
    .line 180
    iget-object v9, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 181
    .line 182
    if-lez v1, :cond_9

    .line 183
    .line 184
    iget-boolean v1, v9, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 185
    .line 186
    if-eqz v1, :cond_8

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_8
    invoke-static {v9, v6}, Lcom/immomo/moment/mediautils/i;->E(Lcom/immomo/moment/mediautils/i;I)V

    .line 190
    .line 191
    .line 192
    :try_start_0
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    .line 194
    .line 195
    goto :goto_0

    .line 196
    :catch_0
    move-exception v1

    .line 197
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 198
    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_9
    iget-object v1, v9, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 202
    .line 203
    if-eqz v1, :cond_a

    .line 204
    .line 205
    const/4 v1, 0x0

    .line 206
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 207
    .line 208
    .line 209
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 210
    .line 211
    iget-object v1, v1, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 212
    .line 213
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    invoke-interface {v1, v0, v6, v2, v3}, Lcom/immomo/moment/mediautils/m$c;->e(Ljava/nio/ByteBuffer;IJ)V

    .line 218
    .line 219
    .line 220
    :cond_a
    long-to-double v1, v2

    .line 221
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 222
    .line 223
    iget v6, v3, Lcom/immomo/moment/mediautils/m;->f:I

    .line 224
    .line 225
    int-to-double v6, v6

    .line 226
    const-wide/high16 v8, 0x4090000000000000L    # 1024.0

    .line 227
    .line 228
    div-double/2addr v8, v6

    .line 229
    const-wide v6, 0x412e848000000000L    # 1000000.0

    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    mul-double/2addr v8, v6

    .line 235
    add-double/2addr v1, v8

    .line 236
    double-to-long v1, v1

    .line 237
    invoke-static {v3, v1, v2}, Lcom/immomo/moment/mediautils/i;->V(Lcom/immomo/moment/mediautils/i;J)J

    .line 238
    .line 239
    .line 240
    move-wide v2, v1

    .line 241
    goto :goto_0

    .line 242
    :cond_b
    :goto_1
    :try_start_1
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 243
    .line 244
    .line 245
    goto :goto_0

    .line 246
    :catch_1
    move-exception v1

    .line 247
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 248
    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_c
    :goto_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 252
    .line 253
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 254
    .line 255
    if-eqz v1, :cond_d

    .line 256
    .line 257
    invoke-static {v0}, Lcom/immomo/moment/mediautils/i;->J(Lcom/immomo/moment/mediautils/i;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_d

    .line 262
    .line 263
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 264
    .line 265
    invoke-static {v0, v6}, Lcom/immomo/moment/mediautils/i;->E(Lcom/immomo/moment/mediautils/i;I)V

    .line 266
    .line 267
    .line 268
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i$h;->a:Lcom/immomo/moment/mediautils/i;

    .line 269
    .line 270
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 271
    .line 272
    invoke-interface {p0}, Lcom/immomo/moment/mediautils/m$c;->a()V

    .line 273
    .line 274
    .line 275
    :cond_d
    return-void
.end method
