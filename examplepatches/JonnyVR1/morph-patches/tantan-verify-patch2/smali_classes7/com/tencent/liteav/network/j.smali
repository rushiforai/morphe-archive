.class public Lcom/tencent/liteav/network/j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:J

.field private g:J

.field private h:Ljava/lang/String;

.field private i:J

.field private j:J

.field private k:J

.field private l:J

.field private m:J

.field private n:J

.field private o:J

.field private p:J

.field private q:J

.field private r:J

.field private s:J

.field private t:J

.field private u:J

.field private v:J

.field private w:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tencent/liteav/network/j;->w:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/tencent/liteav/network/j;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tencent/liteav/basic/util/f;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/tencent/liteav/network/j;->b:Ljava/lang/String;

    .line 18
    .line 19
    const-string p1, "Android"

    .line 20
    .line 21
    iput-object p1, p0, Lcom/tencent/liteav/network/j;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Lcom/tencent/liteav/network/i;->a()Lcom/tencent/liteav/network/i;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/tencent/liteav/network/j;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/network/i;->a(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/tencent/liteav/network/j;->a()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private b(Ljava/lang/String;)Z
    .locals 0

    if-eqz p1, :cond_1

    .line 37
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private c(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "[0-9]*"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private e()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/network/j;->p:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/tencent/liteav/network/j;->q:J

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/network/j;->a()V

    .line 6
    .line 7
    .line 8
    iput-wide v0, p0, Lcom/tencent/liteav/network/j;->n:J

    .line 9
    .line 10
    iput-wide v2, p0, Lcom/tencent/liteav/network/j;->o:J

    .line 11
    .line 12
    return-void
.end method

.method private f()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/tencent/liteav/network/j;->f:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-eqz v1, :cond_9

    .line 10
    .line 11
    iget-object v1, v0, Lcom/tencent/liteav/network/j;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lcom/tencent/liteav/network/j;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_9

    .line 18
    .line 19
    iget-object v1, v0, Lcom/tencent/liteav/network/j;->e:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lcom/tencent/liteav/network/j;->b(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    goto/16 :goto_7

    .line 28
    .line 29
    :cond_0
    iget-object v1, v0, Lcom/tencent/liteav/network/j;->e:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getStreamIDByStreamUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    iget-wide v7, v0, Lcom/tencent/liteav/network/j;->f:J

    .line 40
    .line 41
    sub-long v13, v5, v7

    .line 42
    .line 43
    iget-wide v5, v0, Lcom/tencent/liteav/network/j;->p:J

    .line 44
    .line 45
    iget-wide v7, v0, Lcom/tencent/liteav/network/j;->n:J

    .line 46
    .line 47
    cmp-long v2, v5, v7

    .line 48
    .line 49
    if-lez v2, :cond_1

    .line 50
    .line 51
    sub-long/2addr v5, v7

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    move-wide v5, v3

    .line 54
    :goto_0
    iget-wide v7, v0, Lcom/tencent/liteav/network/j;->q:J

    .line 55
    .line 56
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->o:J

    .line 57
    .line 58
    cmp-long v2, v7, v9

    .line 59
    .line 60
    if-lez v2, :cond_2

    .line 61
    .line 62
    sub-long/2addr v7, v9

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    move-wide v7, v3

    .line 65
    :goto_1
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->v:J

    .line 66
    .line 67
    cmp-long v2, v9, v3

    .line 68
    .line 69
    if-lez v2, :cond_3

    .line 70
    .line 71
    iget-wide v11, v0, Lcom/tencent/liteav/network/j;->r:J

    .line 72
    .line 73
    div-long/2addr v11, v9

    .line 74
    move-wide v15, v3

    .line 75
    iget-wide v3, v0, Lcom/tencent/liteav/network/j;->s:J

    .line 76
    .line 77
    div-long/2addr v3, v9

    .line 78
    goto :goto_2

    .line 79
    :cond_3
    move-wide v15, v3

    .line 80
    move-wide v11, v3

    .line 81
    :goto_2
    invoke-static {}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txCreateToken()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    new-instance v9, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;

    .line 86
    .line 87
    invoke-direct {v9}, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;-><init>()V

    .line 88
    .line 89
    .line 90
    const/4 v10, 0x0

    .line 91
    iput-boolean v10, v9, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_common:Z

    .line 92
    .line 93
    iput-boolean v10, v9, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_status:Z

    .line 94
    .line 95
    iget-object v10, v0, Lcom/tencent/liteav/network/j;->e:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v10, v9, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->url:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v10, v0, Lcom/tencent/liteav/network/j;->a:Landroid/content/Context;

    .line 100
    .line 101
    move-wide/from16 v17, v15

    .line 102
    .line 103
    sget v15, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 104
    .line 105
    move-wide/from16 v19, v3

    .line 106
    .line 107
    sget v3, Lcom/tencent/liteav/basic/datareport/a;->al:I

    .line 108
    .line 109
    invoke-static {v10, v2, v15, v3, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->InitEvent(Landroid/content/Context;Ljava/lang/String;IILcom/tencent/liteav/basic/datareport/TXCDRExtInfo;)V

    .line 110
    .line 111
    .line 112
    sget v3, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 113
    .line 114
    const-string v4, "str_user_id"

    .line 115
    .line 116
    iget-object v9, v0, Lcom/tencent/liteav/network/j;->b:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v2, v3, v4, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sget v3, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 122
    .line 123
    const-string v4, "str_stream_id"

    .line 124
    .line 125
    invoke-static {v2, v3, v4, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 129
    .line 130
    const-string v3, "str_access_id"

    .line 131
    .line 132
    iget-object v4, v0, Lcom/tencent/liteav/network/j;->c:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v2, v1, v3, v4}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 138
    .line 139
    const-string v3, "str_platform"

    .line 140
    .line 141
    iget-object v4, v0, Lcom/tencent/liteav/network/j;->d:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v2, v1, v3, v4}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 147
    .line 148
    const-string v3, "u32_server_type"

    .line 149
    .line 150
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->g:J

    .line 151
    .line 152
    invoke-static {v2, v1, v3, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 153
    .line 154
    .line 155
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 156
    .line 157
    const-string v3, "str_server_addr"

    .line 158
    .line 159
    iget-object v4, v0, Lcom/tencent/liteav/network/j;->h:Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {v2, v1, v3, v4}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 165
    .line 166
    const-string v3, "u32_dns_timecost"

    .line 167
    .line 168
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->i:J

    .line 169
    .line 170
    invoke-static {v2, v1, v3, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 171
    .line 172
    .line 173
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 174
    .line 175
    const-string v3, "u32_connect_timecost"

    .line 176
    .line 177
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->j:J

    .line 178
    .line 179
    invoke-static {v2, v1, v3, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 180
    .line 181
    .line 182
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 183
    .line 184
    const-string v3, "u32_handshake_timecost"

    .line 185
    .line 186
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->k:J

    .line 187
    .line 188
    invoke-static {v2, v1, v3, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 189
    .line 190
    .line 191
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 192
    .line 193
    const-string v3, "u32_push_type"

    .line 194
    .line 195
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->l:J

    .line 196
    .line 197
    invoke-static {v2, v1, v3, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 198
    .line 199
    .line 200
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 201
    .line 202
    const-string v3, "u32_totaltime"

    .line 203
    .line 204
    invoke-static {v2, v1, v3, v13, v14}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 205
    .line 206
    .line 207
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 208
    .line 209
    const-string v3, "u32_block_count"

    .line 210
    .line 211
    iget-wide v9, v0, Lcom/tencent/liteav/network/j;->m:J

    .line 212
    .line 213
    invoke-static {v2, v1, v3, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 214
    .line 215
    .line 216
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 217
    .line 218
    const-string v3, "u32_video_drop"

    .line 219
    .line 220
    invoke-static {v2, v1, v3, v5, v6}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 221
    .line 222
    .line 223
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 224
    .line 225
    const-string v3, "u32_audio_drop"

    .line 226
    .line 227
    invoke-static {v2, v1, v3, v7, v8}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 228
    .line 229
    .line 230
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 231
    .line 232
    const-string v3, "u32_video_que_avg"

    .line 233
    .line 234
    invoke-static {v2, v1, v3, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 235
    .line 236
    .line 237
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 238
    .line 239
    const-string v3, "u32_audio_que_avg"

    .line 240
    .line 241
    move-wide/from16 v4, v19

    .line 242
    .line 243
    invoke-static {v2, v1, v3, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 244
    .line 245
    .line 246
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 247
    .line 248
    const-string v3, "u32_video_que_max"

    .line 249
    .line 250
    iget-wide v4, v0, Lcom/tencent/liteav/network/j;->t:J

    .line 251
    .line 252
    invoke-static {v2, v1, v3, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 253
    .line 254
    .line 255
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 256
    .line 257
    const-string v3, "u32_audio_que_max"

    .line 258
    .line 259
    iget-wide v4, v0, Lcom/tencent/liteav/network/j;->u:J

    .line 260
    .line 261
    invoke-static {v2, v1, v3, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 262
    .line 263
    .line 264
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->T:I

    .line 265
    .line 266
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->nativeReportEvent(Ljava/lang/String;I)V

    .line 267
    .line 268
    .line 269
    cmp-long v1, v13, v17

    .line 270
    .line 271
    const/4 v2, 0x0

    .line 272
    if-lez v1, :cond_4

    .line 273
    .line 274
    iget-wide v3, v0, Lcom/tencent/liteav/network/j;->m:J

    .line 275
    .line 276
    cmp-long v1, v3, v17

    .line 277
    .line 278
    if-nez v1, :cond_5

    .line 279
    .line 280
    :cond_4
    move v1, v2

    .line 281
    goto :goto_3

    .line 282
    :cond_5
    long-to-float v1, v3

    .line 283
    const v3, 0x476a6000    # 60000.0f

    .line 284
    .line 285
    .line 286
    mul-float/2addr v1, v3

    .line 287
    long-to-float v3, v13

    .line 288
    div-float/2addr v1, v3

    .line 289
    :goto_3
    iget-wide v3, v0, Lcom/tencent/liteav/network/j;->v:J

    .line 290
    .line 291
    cmp-long v5, v3, v17

    .line 292
    .line 293
    if-lez v5, :cond_8

    .line 294
    .line 295
    iget-wide v5, v0, Lcom/tencent/liteav/network/j;->r:J

    .line 296
    .line 297
    cmp-long v7, v5, v17

    .line 298
    .line 299
    if-nez v7, :cond_6

    .line 300
    .line 301
    move v5, v2

    .line 302
    goto :goto_4

    .line 303
    :cond_6
    long-to-float v5, v5

    .line 304
    long-to-float v6, v3

    .line 305
    div-float/2addr v5, v6

    .line 306
    :goto_4
    iget-wide v6, v0, Lcom/tencent/liteav/network/j;->s:J

    .line 307
    .line 308
    cmp-long v8, v6, v17

    .line 309
    .line 310
    if-nez v8, :cond_7

    .line 311
    .line 312
    :goto_5
    move/from16 v19, v2

    .line 313
    .line 314
    move/from16 v18, v5

    .line 315
    .line 316
    goto :goto_6

    .line 317
    :cond_7
    long-to-float v2, v6

    .line 318
    long-to-float v3, v3

    .line 319
    div-float/2addr v2, v3

    .line 320
    goto :goto_5

    .line 321
    :cond_8
    move/from16 v18, v2

    .line 322
    .line 323
    move/from16 v19, v18

    .line 324
    .line 325
    :goto_6
    iget-boolean v2, v0, Lcom/tencent/liteav/network/j;->w:Z

    .line 326
    .line 327
    if-eqz v2, :cond_9

    .line 328
    .line 329
    iget-object v2, v0, Lcom/tencent/liteav/network/j;->c:Ljava/lang/String;

    .line 330
    .line 331
    invoke-direct {v0, v2}, Lcom/tencent/liteav/network/j;->b(Ljava/lang/String;)Z

    .line 332
    .line 333
    .line 334
    move-result v2

    .line 335
    if-nez v2, :cond_9

    .line 336
    .line 337
    iget-wide v2, v0, Lcom/tencent/liteav/network/j;->k:J

    .line 338
    .line 339
    const-wide/16 v4, -0x1

    .line 340
    .line 341
    cmp-long v2, v2, v4

    .line 342
    .line 343
    if-eqz v2, :cond_9

    .line 344
    .line 345
    invoke-static {}, Lcom/tencent/liteav/network/i;->a()Lcom/tencent/liteav/network/i;

    .line 346
    .line 347
    .line 348
    move-result-object v9

    .line 349
    iget-object v10, v0, Lcom/tencent/liteav/network/j;->c:Ljava/lang/String;

    .line 350
    .line 351
    iget-wide v11, v0, Lcom/tencent/liteav/network/j;->g:J

    .line 352
    .line 353
    iget-wide v2, v0, Lcom/tencent/liteav/network/j;->k:J

    .line 354
    .line 355
    move/from16 v17, v1

    .line 356
    .line 357
    move-wide v15, v2

    .line 358
    invoke-virtual/range {v9 .. v19}, Lcom/tencent/liteav/network/i;->a(Ljava/lang/String;JJJFFF)V

    .line 359
    .line 360
    .line 361
    :cond_9
    :goto_7
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/tencent/liteav/network/j;->c:Ljava/lang/String;

    const-wide/16 v1, 0x0

    .line 60
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->f:J

    const-wide/16 v3, -0x1

    .line 61
    iput-wide v3, p0, Lcom/tencent/liteav/network/j;->g:J

    .line 62
    iput-object v0, p0, Lcom/tencent/liteav/network/j;->h:Ljava/lang/String;

    .line 63
    iput-wide v3, p0, Lcom/tencent/liteav/network/j;->i:J

    .line 64
    iput-wide v3, p0, Lcom/tencent/liteav/network/j;->j:J

    .line 65
    iput-wide v3, p0, Lcom/tencent/liteav/network/j;->k:J

    .line 66
    iput-wide v3, p0, Lcom/tencent/liteav/network/j;->l:J

    .line 67
    iput-object v0, p0, Lcom/tencent/liteav/network/j;->e:Ljava/lang/String;

    .line 68
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->m:J

    .line 69
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->n:J

    .line 70
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->o:J

    .line 71
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->p:J

    .line 72
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->q:J

    .line 73
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->r:J

    .line 74
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->s:J

    .line 75
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->t:J

    .line 76
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->u:J

    .line 77
    iput-wide v1, p0, Lcom/tencent/liteav/network/j;->v:J

    const/4 v0, 0x1

    .line 78
    iput-boolean v0, p0, Lcom/tencent/liteav/network/j;->w:Z

    return-void
.end method

.method public a(JJ)V
    .locals 0

    .line 82
    iput-wide p1, p0, Lcom/tencent/liteav/network/j;->p:J

    .line 83
    iput-wide p3, p0, Lcom/tencent/liteav/network/j;->q:J

    return-void
.end method

.method public a(JJJ)V
    .locals 0

    .line 79
    iput-wide p1, p0, Lcom/tencent/liteav/network/j;->i:J

    .line 80
    iput-wide p3, p0, Lcom/tencent/liteav/network/j;->j:J

    .line 81
    iput-wide p5, p0, Lcom/tencent/liteav/network/j;->k:J

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/tencent/liteav/network/j;->e:Ljava/lang/String;

    return-void
.end method

.method public a(Z)V
    .locals 2

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x2

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x1

    .line 56
    :goto_0
    iput-wide v0, p0, Lcom/tencent/liteav/network/j;->l:J

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 57
    iput-boolean p1, p0, Lcom/tencent/liteav/network/j;->w:Z

    :cond_1
    return-void
.end method

.method public a(ZLjava/lang/String;)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/tencent/liteav/network/j;->h:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-wide/16 p1, 0x1

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/tencent/liteav/network/j;->g:J

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-eqz p2, :cond_4

    .line 11
    .line 12
    const-string p1, ":"

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, -0x1

    .line 19
    const/4 v1, 0x0

    .line 20
    if-eq p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p2, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    :cond_1
    const-string p1, "[.]"

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    array-length p2, p1

    .line 33
    :goto_0
    if-ge v1, p2, :cond_3

    .line 34
    .line 35
    aget-object v0, p1, v1

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/tencent/liteav/network/j;->c(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    const-wide/16 p1, 0x3

    .line 44
    .line 45
    iput-wide p1, p0, Lcom/tencent/liteav/network/j;->g:J

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const-wide/16 p1, 0x2

    .line 52
    .line 53
    iput-wide p1, p0, Lcom/tencent/liteav/network/j;->g:J

    .line 54
    .line 55
    :cond_4
    return-void
.end method

.method public b()V
    .locals 2

    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/liteav/network/j;->f:J

    .line 36
    invoke-static {}, Lcom/tencent/liteav/network/i;->a()Lcom/tencent/liteav/network/i;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/liteav/network/i;->b()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/liteav/network/j;->c:Ljava/lang/String;

    return-void
.end method

.method public b(JJ)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/network/j;->v:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/tencent/liteav/network/j;->v:J

    .line 7
    .line 8
    iget-wide v0, p0, Lcom/tencent/liteav/network/j;->r:J

    .line 9
    .line 10
    add-long/2addr v0, p1

    .line 11
    iput-wide v0, p0, Lcom/tencent/liteav/network/j;->r:J

    .line 12
    .line 13
    iget-wide v0, p0, Lcom/tencent/liteav/network/j;->s:J

    .line 14
    .line 15
    add-long/2addr v0, p3

    .line 16
    iput-wide v0, p0, Lcom/tencent/liteav/network/j;->s:J

    .line 17
    .line 18
    iget-wide v0, p0, Lcom/tencent/liteav/network/j;->t:J

    .line 19
    .line 20
    cmp-long v0, p1, v0

    .line 21
    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    iput-wide p1, p0, Lcom/tencent/liteav/network/j;->t:J

    .line 25
    .line 26
    :cond_0
    iget-wide p1, p0, Lcom/tencent/liteav/network/j;->u:J

    .line 27
    .line 28
    cmp-long p1, p3, p1

    .line 29
    .line 30
    if-lez p1, :cond_1

    .line 31
    .line 32
    iput-wide p3, p0, Lcom/tencent/liteav/network/j;->u:J

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public c()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/tencent/liteav/network/j;->f()V

    .line 17
    invoke-direct {p0}, Lcom/tencent/liteav/network/j;->e()V

    return-void
.end method

.method public d()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/network/j;->m:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/tencent/liteav/network/j;->m:J

    .line 7
    .line 8
    return-void
.end method
