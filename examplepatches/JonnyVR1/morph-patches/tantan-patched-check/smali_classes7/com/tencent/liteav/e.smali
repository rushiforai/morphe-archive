.class public Lcom/tencent/liteav/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/e$a;
    }
.end annotation


# static fields
.field private static a:Ljava/lang/String; = "TXCDataReport"

.field private static u:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tencent/liteav/e$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private b:Ljava/util/HashMap;

.field private c:Ljava/lang/String;

.field private d:Landroid/content/Context;

.field private e:Ljava/lang/String;

.field private f:J

.field private g:J

.field private h:J

.field private i:J

.field private j:Z

.field private k:J

.field private l:I

.field private m:Z

.field private n:J

.field private o:J

.field private p:J

.field private q:J

.field private r:J

.field private s:I

.field private t:Ljava/lang/String;

.field private v:Ljava/lang/String;

.field private w:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/liteav/e;->u:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/liteav/e;->h:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/tencent/liteav/e;->m:Z

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    iput-wide v1, p0, Lcom/tencent/liteav/e;->n:J

    .line 14
    .line 15
    iput-wide v1, p0, Lcom/tencent/liteav/e;->o:J

    .line 16
    .line 17
    iput-wide v1, p0, Lcom/tencent/liteav/e;->p:J

    .line 18
    .line 19
    iput-wide v1, p0, Lcom/tencent/liteav/e;->q:J

    .line 20
    .line 21
    iput-wide v1, p0, Lcom/tencent/liteav/e;->r:J

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/liteav/e;->s:I

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    iput-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/liteav/e;->w:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v0, Ljava/util/HashMap;

    .line 32
    .line 33
    const/16 v3, 0x64

    .line 34
    .line 35
    invoke-direct {v0, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getAppVersion()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/tencent/liteav/e;->e:Ljava/lang/String;

    .line 51
    .line 52
    const/16 p1, 0x1388

    .line 53
    .line 54
    iput p1, p0, Lcom/tencent/liteav/e;->l:I

    .line 55
    .line 56
    iput-wide v1, p0, Lcom/tencent/liteav/e;->r:J

    .line 57
    .line 58
    return-void
.end method

.method private a(I)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;

    .line 6
    .line 7
    invoke-direct {v2}, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, v0, Lcom/tencent/liteav/e;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v3, v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->url:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    iput-boolean v3, v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_common:Z

    .line 16
    .line 17
    iput-boolean v3, v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_status:Z

    .line 18
    .line 19
    iget-object v3, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 20
    .line 21
    const-string v4, "token"

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ljava/lang/String;

    .line 28
    .line 29
    iget-object v4, v0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 30
    .line 31
    sget v5, Lcom/tencent/liteav/basic/datareport/a;->am:I

    .line 32
    .line 33
    invoke-static {v4, v3, v1, v5, v2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->InitEvent(Landroid/content/Context;Ljava/lang/String;IILcom/tencent/liteav/basic/datareport/TXCDRExtInfo;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1, v3}, Lcom/tencent/liteav/e;->a(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 40
    .line 41
    const-string v4, "u64_timestamp"

    .line 42
    .line 43
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Ljava/lang/Long;

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 50
    .line 51
    .line 52
    move-result-wide v5

    .line 53
    invoke-static {v3, v1, v4, v5, v6}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 54
    .line 55
    .line 56
    iget-object v2, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 57
    .line 58
    const/16 v5, 0x1bc3

    .line 59
    .line 60
    invoke-static {v2, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 61
    .line 62
    .line 63
    move-result-wide v5

    .line 64
    iget-object v2, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 65
    .line 66
    const/16 v7, 0x1bc4

    .line 67
    .line 68
    invoke-static {v2, v7}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 69
    .line 70
    .line 71
    move-result-wide v7

    .line 72
    const-wide/16 v9, -0x1

    .line 73
    .line 74
    cmp-long v2, v7, v9

    .line 75
    .line 76
    if-eqz v2, :cond_0

    .line 77
    .line 78
    sub-long/2addr v7, v5

    .line 79
    :cond_0
    const-wide/16 v11, 0x0

    .line 80
    .line 81
    cmp-long v2, v7, v11

    .line 82
    .line 83
    if-gez v2, :cond_1

    .line 84
    .line 85
    move-wide v13, v9

    .line 86
    goto :goto_0

    .line 87
    :cond_1
    move-wide v13, v7

    .line 88
    :goto_0
    const-string v2, "u32_dns_time"

    .line 89
    .line 90
    invoke-static {v3, v1, v2, v13, v14}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 91
    .line 92
    .line 93
    iget-object v2, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 94
    .line 95
    const/16 v13, 0x1bc5

    .line 96
    .line 97
    invoke-static {v2, v13}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 98
    .line 99
    .line 100
    move-result-wide v13

    .line 101
    cmp-long v2, v13, v9

    .line 102
    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    sub-long/2addr v13, v5

    .line 106
    :cond_2
    cmp-long v2, v13, v11

    .line 107
    .line 108
    if-gez v2, :cond_3

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    move-wide v9, v13

    .line 112
    :goto_1
    const-string v2, "u32_connect_server_time"

    .line 113
    .line 114
    invoke-static {v3, v1, v2, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 115
    .line 116
    .line 117
    iget-object v2, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 118
    .line 119
    const/16 v9, 0x138c

    .line 120
    .line 121
    invoke-static {v2, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    const-string v9, "u32_video_decode_type"

    .line 126
    .line 127
    move-wide/from16 v17, v11

    .line 128
    .line 129
    int-to-long v11, v2

    .line 130
    invoke-static {v3, v1, v9, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 131
    .line 132
    .line 133
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 134
    .line 135
    const/16 v10, 0x1771

    .line 136
    .line 137
    invoke-static {v9, v10}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 138
    .line 139
    .line 140
    move-result-wide v9

    .line 141
    sub-long/2addr v9, v5

    .line 142
    iput-wide v9, v0, Lcom/tencent/liteav/e;->f:J

    .line 143
    .line 144
    cmp-long v11, v9, v17

    .line 145
    .line 146
    if-gez v11, :cond_4

    .line 147
    .line 148
    const-wide/16 v9, -0x1

    .line 149
    .line 150
    :cond_4
    const-string v11, "u32_first_i_frame"

    .line 151
    .line 152
    invoke-static {v3, v1, v11, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 153
    .line 154
    .line 155
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 156
    .line 157
    const/16 v10, 0x1bbf

    .line 158
    .line 159
    invoke-static {v9, v10}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 160
    .line 161
    .line 162
    move-result-wide v9

    .line 163
    sub-long/2addr v9, v5

    .line 164
    cmp-long v11, v9, v17

    .line 165
    .line 166
    if-gez v11, :cond_5

    .line 167
    .line 168
    const-wide/16 v11, -0x1

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_5
    move-wide v11, v9

    .line 172
    :goto_2
    const-string v15, "u32_first_frame_down"

    .line 173
    .line 174
    invoke-static {v3, v1, v15, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 175
    .line 176
    .line 177
    iget-object v11, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 178
    .line 179
    const/16 v12, 0x138d

    .line 180
    .line 181
    invoke-static {v11, v12}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 182
    .line 183
    .line 184
    move-result-wide v11

    .line 185
    sub-long/2addr v11, v5

    .line 186
    cmp-long v15, v11, v17

    .line 187
    .line 188
    move-wide/from16 v21, v5

    .line 189
    .line 190
    if-gez v15, :cond_6

    .line 191
    .line 192
    const-wide/16 v5, -0x1

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_6
    move-wide v5, v11

    .line 196
    :goto_3
    const-string v15, "u32_first_video_decode_time"

    .line 197
    .line 198
    invoke-static {v3, v1, v15, v5, v6}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 199
    .line 200
    .line 201
    iget-object v5, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 202
    .line 203
    const/16 v6, 0x1bc0

    .line 204
    .line 205
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 206
    .line 207
    .line 208
    move-result-wide v5

    .line 209
    sub-long v5, v5, v21

    .line 210
    .line 211
    cmp-long v15, v5, v17

    .line 212
    .line 213
    move-wide/from16 v23, v5

    .line 214
    .line 215
    if-gez v15, :cond_7

    .line 216
    .line 217
    const-wide/16 v5, -0x1

    .line 218
    .line 219
    :cond_7
    const-string v15, "u32_first_audio_frame_down"

    .line 220
    .line 221
    invoke-static {v3, v1, v15, v5, v6}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 222
    .line 223
    .line 224
    iget-object v5, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 225
    .line 226
    const/16 v6, 0x7f1

    .line 227
    .line 228
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 229
    .line 230
    .line 231
    move-result-wide v5

    .line 232
    sub-long v5, v5, v21

    .line 233
    .line 234
    cmp-long v15, v5, v17

    .line 235
    .line 236
    move-wide/from16 v17, v5

    .line 237
    .line 238
    if-gez v15, :cond_8

    .line 239
    .line 240
    const-wide/16 v5, -0x1

    .line 241
    .line 242
    :cond_8
    const-string v15, "u32_first_audio_render_time"

    .line 243
    .line 244
    invoke-static {v3, v1, v15, v5, v6}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 245
    .line 246
    .line 247
    iget-object v5, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 248
    .line 249
    const/16 v6, 0x1bc1

    .line 250
    .line 251
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 252
    .line 253
    .line 254
    move-result v5

    .line 255
    const-string v6, "u64_err_code"

    .line 256
    .line 257
    move-wide v15, v11

    .line 258
    int-to-long v11, v5

    .line 259
    invoke-static {v3, v1, v6, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 260
    .line 261
    .line 262
    iget-object v6, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 263
    .line 264
    const/16 v11, 0x1bc2

    .line 265
    .line 266
    invoke-static {v6, v11}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 267
    .line 268
    .line 269
    move-result v6

    .line 270
    const-string v11, "str_err_info"

    .line 271
    .line 272
    move-wide/from16 v19, v9

    .line 273
    .line 274
    int-to-long v9, v6

    .line 275
    invoke-static {v3, v1, v11, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 276
    .line 277
    .line 278
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 279
    .line 280
    const/16 v10, 0x1bc8

    .line 281
    .line 282
    invoke-static {v9, v10}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 283
    .line 284
    .line 285
    move-result v9

    .line 286
    const-string v10, "u32_link_type"

    .line 287
    .line 288
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v11

    .line 292
    invoke-static {v3, v1, v10, v11}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    iget-object v10, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 296
    .line 297
    const/16 v11, 0x1bc7

    .line 298
    .line 299
    invoke-static {v10, v11}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 300
    .line 301
    .line 302
    move-result v10

    .line 303
    const-string v11, "u32_channel_type"

    .line 304
    .line 305
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v12

    .line 309
    invoke-static {v3, v1, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    const-string v11, "str_app_version"

    .line 313
    .line 314
    iget-object v12, v0, Lcom/tencent/liteav/e;->e:Ljava/lang/String;

    .line 315
    .line 316
    invoke-static {v3, v1, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    invoke-static {v3, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->nativeReportEvent(Ljava/lang/String;I)V

    .line 320
    .line 321
    .line 322
    sget-object v11, Lcom/tencent/liteav/e;->a:Ljava/lang/String;

    .line 323
    .line 324
    new-instance v12, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    move-wide/from16 v21, v15

    .line 327
    .line 328
    const-string v15, "report evt "

    .line 329
    .line 330
    invoke-direct {v12, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    const-string v1, ": token="

    .line 337
    .line 338
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    const-string v1, "\nstr_user_id="

    .line 345
    .line 346
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 350
    .line 351
    const-string v3, "str_user_id"

    .line 352
    .line 353
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v1, "\ndev_uuid="

    .line 361
    .line 362
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 366
    .line 367
    const-string v3, "dev_uuid"

    .line 368
    .line 369
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v1

    .line 373
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    const-string v1, "\nstr_session_id="

    .line 377
    .line 378
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 382
    .line 383
    const-string v3, "str_session_id"

    .line 384
    .line 385
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    const-string v1, "\nstr_device_type="

    .line 393
    .line 394
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 398
    .line 399
    const-string v3, "str_device_type"

    .line 400
    .line 401
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    const-string v1, "\nstr_os_info="

    .line 409
    .line 410
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 414
    .line 415
    const-string v3, "str_os_info"

    .line 416
    .line 417
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    const-string v1, "\nstr_package_name="

    .line 425
    .line 426
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 430
    .line 431
    const-string v3, "str_package_name"

    .line 432
    .line 433
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    const-string v1, "\nu32_network_type="

    .line 441
    .line 442
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 446
    .line 447
    const-string v3, "u32_network_type"

    .line 448
    .line 449
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    const-string v1, "\nu32_server_ip="

    .line 457
    .line 458
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 462
    .line 463
    const-string v3, "u32_server_ip"

    .line 464
    .line 465
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    .line 467
    .line 468
    move-result-object v1

    .line 469
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 470
    .line 471
    .line 472
    const-string v1, "\nstr_stream_url="

    .line 473
    .line 474
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 478
    .line 479
    const-string v3, "str_stream_url"

    .line 480
    .line 481
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    move-result-object v1

    .line 485
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    const-string v1, "\nu64_timestamp="

    .line 489
    .line 490
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    .line 492
    .line 493
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 494
    .line 495
    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 500
    .line 501
    .line 502
    const-string v1, "\nu32_dns_time="

    .line 503
    .line 504
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v12, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    const-string v1, "\nu32_connect_server_time="

    .line 511
    .line 512
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    const-string v1, "\nu32_video_decode_type="

    .line 519
    .line 520
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 521
    .line 522
    .line 523
    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 524
    .line 525
    .line 526
    const-string v1, "\nu32_first_frame_down="

    .line 527
    .line 528
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 529
    .line 530
    .line 531
    move-wide/from16 v1, v19

    .line 532
    .line 533
    invoke-virtual {v12, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    const-string v1, "\nu32_first_video_decode_time="

    .line 537
    .line 538
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    .line 540
    .line 541
    move-wide/from16 v1, v21

    .line 542
    .line 543
    invoke-virtual {v12, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 544
    .line 545
    .line 546
    const-string v1, "\nu32_first_i_frame="

    .line 547
    .line 548
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    iget-wide v1, v0, Lcom/tencent/liteav/e;->f:J

    .line 552
    .line 553
    invoke-virtual {v12, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 554
    .line 555
    .line 556
    const-string v1, "\nu32_first_audio_frame_down="

    .line 557
    .line 558
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    .line 560
    .line 561
    move-wide/from16 v1, v23

    .line 562
    .line 563
    invoke-virtual {v12, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    const-string v1, "\nu32_first_audio_render_time="

    .line 567
    .line 568
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    move-wide/from16 v1, v17

    .line 572
    .line 573
    invoke-virtual {v12, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    const-string v1, "\nu64_err_code="

    .line 577
    .line 578
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    .line 580
    .line 581
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 582
    .line 583
    .line 584
    const-string v1, "\nstr_err_info="

    .line 585
    .line 586
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    .line 588
    .line 589
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    const-string v1, "\nu32_link_type="

    .line 593
    .line 594
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 598
    .line 599
    .line 600
    const-string v1, "\nu32_channel_type="

    .line 601
    .line 602
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 603
    .line 604
    .line 605
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    const-string v1, "\nstr_app_version="

    .line 609
    .line 610
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    .line 612
    .line 613
    iget-object v0, v0, Lcom/tencent/liteav/e;->e:Ljava/lang/String;

    .line 614
    .line 615
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v0

    .line 622
    invoke-static {v11, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    .line 624
    .line 625
    return-void
.end method

.method private a(ILjava/lang/String;)V
    .locals 6

    .line 644
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v1, 0x1bd1

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 645
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v0, p2

    .line 646
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    const-string v2, "str_session_id"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 647
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v3, 0x1bc6

    invoke-static {v1, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "u32_server_ip"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    iget-boolean v0, p0, Lcom/tencent/liteav/e;->m:Z

    .line 649
    iget-object v1, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 650
    const-string v4, "str_stream_url"

    if-eqz v0, :cond_1

    .line 651
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v5, 0x1bcc

    invoke-static {v0, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 652
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/tencent/liteav/e;->f(Ljava/lang/String;)V

    goto :goto_0

    .line 653
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/e;->c:Ljava/lang/String;

    invoke-virtual {v1, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    const-string v1, "str_user_id"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, p1, v1, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 655
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    const-string v1, "dev_uuid"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, p1, v1, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 656
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, p1, v2, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 657
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    const-string v1, "str_device_type"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, p1, v1, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 658
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    const-string v1, "str_os_info"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, p1, v1, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 659
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    const-string v1, "str_package_name"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, p1, v1, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 660
    const-string v0, "u32_network_type"

    invoke-direct {p0, v0}, Lcom/tencent/liteav/e;->g(Ljava/lang/String;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p2, p1, v0, v1, v2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 661
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, p1, v3, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 662
    iget-object p0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p2, p1, v4, p0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private b(I)V
    .locals 44

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;

    .line 6
    .line 7
    invoke-direct {v2}, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, v0, Lcom/tencent/liteav/e;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v3, v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->url:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    iput-boolean v3, v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_common:Z

    .line 16
    .line 17
    iput-boolean v3, v2, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_status:Z

    .line 18
    .line 19
    iget-object v3, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 20
    .line 21
    const-string v4, "token"

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ljava/lang/String;

    .line 28
    .line 29
    iget-object v4, v0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 30
    .line 31
    sget v5, Lcom/tencent/liteav/basic/datareport/a;->am:I

    .line 32
    .line 33
    invoke-static {v4, v3, v1, v5, v2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->InitEvent(Landroid/content/Context;Ljava/lang/String;IILcom/tencent/liteav/basic/datareport/TXCDRExtInfo;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v0, v1, v3}, Lcom/tencent/liteav/e;->a(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getUtcTimeTick()J

    .line 40
    .line 41
    .line 42
    move-result-wide v4

    .line 43
    const-string v2, "u64_end_timestamp"

    .line 44
    .line 45
    invoke-static {v3, v1, v2, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 46
    .line 47
    .line 48
    const-string v2, "u64_timestamp"

    .line 49
    .line 50
    invoke-static {v3, v1, v2, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 51
    .line 52
    .line 53
    iget-object v4, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 54
    .line 55
    const/16 v5, 0x232a

    .line 56
    .line 57
    invoke-static {v4, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    .line 58
    .line 59
    .line 60
    move-result-wide v4

    .line 61
    const-string v6, "u32_avg_cpu_usage"

    .line 62
    .line 63
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-static {v3, v1, v6, v7}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v6, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 71
    .line 72
    const/16 v7, 0x232d

    .line 73
    .line 74
    invoke-static {v6, v7}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    .line 75
    .line 76
    .line 77
    move-result-wide v6

    .line 78
    const-string v8, "u32_avg_memory"

    .line 79
    .line 80
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    invoke-static {v3, v1, v8, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-wide v8, v0, Lcom/tencent/liteav/e;->r:J

    .line 88
    .line 89
    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    const-string v9, "u64_begin_timestamp"

    .line 94
    .line 95
    invoke-static {v3, v1, v9, v8}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 99
    .line 100
    const/16 v10, 0x1bc3

    .line 101
    .line 102
    invoke-static {v9, v10}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 103
    .line 104
    .line 105
    move-result-wide v9

    .line 106
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 107
    .line 108
    .line 109
    move-result-wide v11

    .line 110
    sub-long/2addr v11, v9

    .line 111
    const-wide/16 v9, 0x3e8

    .line 112
    .line 113
    div-long/2addr v11, v9

    .line 114
    const-wide/16 v9, 0x0

    .line 115
    .line 116
    cmp-long v13, v11, v9

    .line 117
    .line 118
    move-wide/from16 v16, v9

    .line 119
    .line 120
    if-gez v13, :cond_0

    .line 121
    .line 122
    const-wide/16 v9, -0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_0
    move-wide v9, v11

    .line 126
    :goto_0
    const-string v14, "u64_playtime"

    .line 127
    .line 128
    invoke-static {v3, v1, v14, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 129
    .line 130
    .line 131
    if-gez v13, :cond_1

    .line 132
    .line 133
    const-wide/16 v14, -0x1

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_1
    move-wide v14, v11

    .line 137
    :goto_1
    const-string v9, "u32_result"

    .line 138
    .line 139
    invoke-static {v3, v1, v9, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 140
    .line 141
    .line 142
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 143
    .line 144
    const/16 v10, 0x1bc1

    .line 145
    .line 146
    invoke-static {v9, v10}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 147
    .line 148
    .line 149
    move-result v9

    .line 150
    const-string v10, "u64_err_code"

    .line 151
    .line 152
    int-to-long v13, v9

    .line 153
    invoke-static {v3, v1, v10, v13, v14}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 154
    .line 155
    .line 156
    iget-object v10, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 157
    .line 158
    const/16 v13, 0x7d4

    .line 159
    .line 160
    invoke-static {v10, v13}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    const-string v13, "u32_speed_cnt"

    .line 165
    .line 166
    int-to-long v14, v10

    .line 167
    invoke-static {v3, v1, v13, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 168
    .line 169
    .line 170
    iget-object v13, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 171
    .line 172
    const/16 v14, 0x7d8

    .line 173
    .line 174
    invoke-static {v13, v14}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 175
    .line 176
    .line 177
    move-result v13

    .line 178
    int-to-long v14, v13

    .line 179
    move-object/from16 v18, v8

    .line 180
    .line 181
    const-string v8, "u64_audio_cache_avg"

    .line 182
    .line 183
    invoke-static {v3, v1, v8, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 184
    .line 185
    .line 186
    const-string v8, "u32_avg_cache_time"

    .line 187
    .line 188
    invoke-static {v3, v1, v8, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 189
    .line 190
    .line 191
    iget-object v8, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 192
    .line 193
    const/16 v14, 0x7d3

    .line 194
    .line 195
    invoke-static {v8, v14}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 196
    .line 197
    .line 198
    move-result v8

    .line 199
    int-to-long v14, v8

    .line 200
    const-string v8, "u32_max_load"

    .line 201
    .line 202
    move/from16 v19, v9

    .line 203
    .line 204
    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    invoke-static {v3, v1, v8, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v8, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 212
    .line 213
    const/16 v9, 0x7d1

    .line 214
    .line 215
    invoke-static {v8, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 216
    .line 217
    .line 218
    move-result v8

    .line 219
    int-to-long v8, v8

    .line 220
    move-wide/from16 v20, v11

    .line 221
    .line 222
    const-string v11, "u32_avg_load"

    .line 223
    .line 224
    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v12

    .line 228
    invoke-static {v3, v1, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object v11, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 232
    .line 233
    const/16 v12, 0x7d2

    .line 234
    .line 235
    invoke-static {v11, v12}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 236
    .line 237
    .line 238
    move-result v11

    .line 239
    int-to-long v11, v11

    .line 240
    move-wide/from16 v22, v11

    .line 241
    .line 242
    const-string v11, "u32_load_cnt"

    .line 243
    .line 244
    invoke-static/range {v22 .. v23}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v12

    .line 248
    invoke-static {v3, v1, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    iget-object v11, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 252
    .line 253
    const/16 v12, 0x7d5

    .line 254
    .line 255
    invoke-static {v11, v12}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 256
    .line 257
    .line 258
    move-result v11

    .line 259
    const-string v12, "u32_nodata_cnt"

    .line 260
    .line 261
    move-wide/from16 v24, v14

    .line 262
    .line 263
    int-to-long v14, v11

    .line 264
    invoke-static {v3, v1, v12, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 265
    .line 266
    .line 267
    mul-long v14, v8, v22

    .line 268
    .line 269
    const-string v12, "u32_audio_block_time"

    .line 270
    .line 271
    invoke-static {v3, v1, v12, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 272
    .line 273
    .line 274
    const-string v12, "u32_first_i_frame"

    .line 275
    .line 276
    move-wide/from16 v26, v14

    .line 277
    .line 278
    iget-wide v14, v0, Lcom/tencent/liteav/e;->f:J

    .line 279
    .line 280
    invoke-static {v3, v1, v12, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 281
    .line 282
    .line 283
    iget-object v12, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 284
    .line 285
    const/16 v14, 0x427d

    .line 286
    .line 287
    invoke-static {v12, v14}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 288
    .line 289
    .line 290
    move-result v12

    .line 291
    const-string v14, "u32_video_width"

    .line 292
    .line 293
    move-wide/from16 v28, v8

    .line 294
    .line 295
    int-to-long v8, v12

    .line 296
    invoke-static {v3, v1, v14, v8, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 297
    .line 298
    .line 299
    iget-object v8, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 300
    .line 301
    const/16 v9, 0x427e

    .line 302
    .line 303
    invoke-static {v8, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 304
    .line 305
    .line 306
    move-result v8

    .line 307
    const-string v9, "u32_video_height"

    .line 308
    .line 309
    int-to-long v14, v8

    .line 310
    invoke-static {v3, v1, v9, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 311
    .line 312
    .line 313
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 314
    .line 315
    const/16 v14, 0x1781

    .line 316
    .line 317
    invoke-static {v9, v14}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    .line 318
    .line 319
    .line 320
    move-result-wide v14

    .line 321
    const-string v9, "u32_video_avg_fps"

    .line 322
    .line 323
    move/from16 v30, v13

    .line 324
    .line 325
    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v13

    .line 329
    invoke-static {v3, v1, v9, v13}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 333
    .line 334
    const/16 v13, 0x1773

    .line 335
    .line 336
    move/from16 v31, v10

    .line 337
    .line 338
    invoke-static {v9, v13}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 339
    .line 340
    .line 341
    move-result-wide v9

    .line 342
    iget-object v13, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 343
    .line 344
    move/from16 v32, v11

    .line 345
    .line 346
    const/16 v11, 0x1775

    .line 347
    .line 348
    move-wide/from16 v33, v14

    .line 349
    .line 350
    invoke-static {v13, v11}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 351
    .line 352
    .line 353
    move-result-wide v13

    .line 354
    iget-object v11, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 355
    .line 356
    const/16 v15, 0x1776

    .line 357
    .line 358
    move/from16 v35, v12

    .line 359
    .line 360
    invoke-static {v11, v15}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 361
    .line 362
    .line 363
    move-result-wide v11

    .line 364
    cmp-long v15, v9, v16

    .line 365
    .line 366
    if-lez v15, :cond_2

    .line 367
    .line 368
    div-long v15, v11, v9

    .line 369
    .line 370
    move-wide/from16 v36, v6

    .line 371
    .line 372
    move-wide v6, v15

    .line 373
    goto :goto_2

    .line 374
    :cond_2
    move-wide/from16 v36, v6

    .line 375
    .line 376
    move-wide/from16 v6, v16

    .line 377
    .line 378
    :goto_2
    const-string v15, "u64_block_duration_avg"

    .line 379
    .line 380
    invoke-static {v3, v1, v15, v6, v7}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 381
    .line 382
    .line 383
    const-string v15, "u32_avg_block_time"

    .line 384
    .line 385
    invoke-static {v3, v1, v15, v6, v7}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 386
    .line 387
    .line 388
    const-string v15, "u64_block_count"

    .line 389
    .line 390
    invoke-static {v3, v1, v15, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 391
    .line 392
    .line 393
    const-string v15, "u32_video_block_time"

    .line 394
    .line 395
    invoke-static {v3, v1, v15, v11, v12}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 396
    .line 397
    .line 398
    const-string v15, "u64_block_duration_max"

    .line 399
    .line 400
    invoke-static {v3, v1, v15, v13, v14}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 401
    .line 402
    .line 403
    iget-object v13, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 404
    .line 405
    const/16 v14, 0x1779

    .line 406
    .line 407
    invoke-static {v13, v14}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 408
    .line 409
    .line 410
    move-result-wide v13

    .line 411
    const-string v15, "u64_jitter_cache_max"

    .line 412
    .line 413
    invoke-static {v3, v1, v15, v13, v14}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 414
    .line 415
    .line 416
    iget-object v15, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 417
    .line 418
    move-wide/from16 v16, v13

    .line 419
    .line 420
    const/16 v13, 0x1778

    .line 421
    .line 422
    invoke-static {v15, v13}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 423
    .line 424
    .line 425
    move-result-wide v13

    .line 426
    const-string v15, "u64_jitter_cache_avg"

    .line 427
    .line 428
    invoke-static {v3, v1, v15, v13, v14}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 429
    .line 430
    .line 431
    iget-object v15, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 432
    .line 433
    move-wide/from16 v38, v13

    .line 434
    .line 435
    const/16 v13, 0x1bc8

    .line 436
    .line 437
    invoke-static {v15, v13}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 438
    .line 439
    .line 440
    move-result v13

    .line 441
    const-string v14, "u32_link_type"

    .line 442
    .line 443
    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v13

    .line 447
    invoke-static {v3, v1, v14, v13}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    iget-object v13, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 451
    .line 452
    const/16 v14, 0x1bc7

    .line 453
    .line 454
    invoke-static {v13, v14}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 455
    .line 456
    .line 457
    move-result v13

    .line 458
    const-string v14, "u32_channel_type"

    .line 459
    .line 460
    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v15

    .line 464
    invoke-static {v3, v1, v14, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 465
    .line 466
    .line 467
    iget-object v14, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 468
    .line 469
    const/16 v15, 0x1bc9

    .line 470
    .line 471
    invoke-static {v14, v15}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 472
    .line 473
    .line 474
    move-result v14

    .line 475
    const-string v15, "u32_ip_count_quic"

    .line 476
    .line 477
    move-wide/from16 v40, v9

    .line 478
    .line 479
    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v9

    .line 483
    invoke-static {v3, v1, v15, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 484
    .line 485
    .line 486
    iget-object v9, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 487
    .line 488
    const/16 v10, 0x1bca

    .line 489
    .line 490
    invoke-static {v9, v10}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 491
    .line 492
    .line 493
    move-result v9

    .line 494
    const-string v10, "u32_connect_count_quic"

    .line 495
    .line 496
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v15

    .line 500
    invoke-static {v3, v1, v10, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 501
    .line 502
    .line 503
    iget-object v10, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 504
    .line 505
    const/16 v15, 0x1bcb

    .line 506
    .line 507
    invoke-static {v10, v15}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 508
    .line 509
    .line 510
    move-result v10

    .line 511
    const-string v15, "u32_connect_count_tcp"

    .line 512
    .line 513
    move/from16 v42, v10

    .line 514
    .line 515
    invoke-static/range {v42 .. v42}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v10

    .line 519
    invoke-static {v3, v1, v15, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    const-string v10, "str_app_version"

    .line 523
    .line 524
    iget-object v15, v0, Lcom/tencent/liteav/e;->e:Ljava/lang/String;

    .line 525
    .line 526
    invoke-static {v3, v1, v10, v15}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 527
    .line 528
    .line 529
    iget-object v10, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 530
    .line 531
    const/16 v15, 0x7d9

    .line 532
    .line 533
    move/from16 v43, v9

    .line 534
    .line 535
    invoke-static {v10, v15}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 536
    .line 537
    .line 538
    move-result-wide v9

    .line 539
    const-string v15, "u32_is_real_time"

    .line 540
    .line 541
    invoke-static {v3, v1, v15, v9, v10}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 542
    .line 543
    .line 544
    invoke-static {v3, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->nativeReportEvent(Ljava/lang/String;I)V

    .line 545
    .line 546
    .line 547
    sget-object v9, Lcom/tencent/liteav/e;->a:Ljava/lang/String;

    .line 548
    .line 549
    new-instance v10, Ljava/lang/StringBuilder;

    .line 550
    .line 551
    const-string v15, "report evt "

    .line 552
    .line 553
    invoke-direct {v10, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 557
    .line 558
    .line 559
    const-string v1, ": token="

    .line 560
    .line 561
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 562
    .line 563
    .line 564
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    .line 566
    .line 567
    const-string v1, "\nstr_user_id="

    .line 568
    .line 569
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    .line 571
    .line 572
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 573
    .line 574
    const-string v3, "str_user_id"

    .line 575
    .line 576
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 577
    .line 578
    .line 579
    move-result-object v1

    .line 580
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 581
    .line 582
    .line 583
    const-string v1, "\ndev_uuid="

    .line 584
    .line 585
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 586
    .line 587
    .line 588
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 589
    .line 590
    const-string v3, "dev_uuid"

    .line 591
    .line 592
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    .line 594
    .line 595
    move-result-object v1

    .line 596
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    const-string v1, "\nstr_session_id="

    .line 600
    .line 601
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 605
    .line 606
    const-string v3, "str_session_id"

    .line 607
    .line 608
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 609
    .line 610
    .line 611
    move-result-object v1

    .line 612
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 613
    .line 614
    .line 615
    const-string v1, "\nstr_device_type="

    .line 616
    .line 617
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 618
    .line 619
    .line 620
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 621
    .line 622
    const-string v3, "str_device_type"

    .line 623
    .line 624
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    .line 626
    .line 627
    move-result-object v1

    .line 628
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 629
    .line 630
    .line 631
    const-string v1, "\nstr_os_info="

    .line 632
    .line 633
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 634
    .line 635
    .line 636
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 637
    .line 638
    const-string v3, "str_os_info"

    .line 639
    .line 640
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 641
    .line 642
    .line 643
    move-result-object v1

    .line 644
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 645
    .line 646
    .line 647
    const-string v1, "\nstr_package_name="

    .line 648
    .line 649
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    .line 651
    .line 652
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 653
    .line 654
    const-string v3, "str_package_name"

    .line 655
    .line 656
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    .line 658
    .line 659
    move-result-object v1

    .line 660
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 661
    .line 662
    .line 663
    const-string v1, "\nu32_network_type="

    .line 664
    .line 665
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 666
    .line 667
    .line 668
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 669
    .line 670
    const-string v3, "u32_network_type"

    .line 671
    .line 672
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    .line 674
    .line 675
    move-result-object v1

    .line 676
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 677
    .line 678
    .line 679
    const-string v1, "\nu32_server_ip="

    .line 680
    .line 681
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 682
    .line 683
    .line 684
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 685
    .line 686
    const-string v3, "u32_server_ip"

    .line 687
    .line 688
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    .line 690
    .line 691
    move-result-object v1

    .line 692
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 693
    .line 694
    .line 695
    const-string v1, "\nstr_stream_url="

    .line 696
    .line 697
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 698
    .line 699
    .line 700
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 701
    .line 702
    const-string v3, "str_stream_url"

    .line 703
    .line 704
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    .line 706
    .line 707
    move-result-object v1

    .line 708
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 709
    .line 710
    .line 711
    const-string v1, "\nu64_timestamp="

    .line 712
    .line 713
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 714
    .line 715
    .line 716
    iget-object v1, v0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 717
    .line 718
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 719
    .line 720
    .line 721
    move-result-object v1

    .line 722
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 723
    .line 724
    .line 725
    const-string v1, "\nu32_avg_cpu_usage="

    .line 726
    .line 727
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 728
    .line 729
    .line 730
    invoke-virtual {v10, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 731
    .line 732
    .line 733
    const-string v1, "\nu32_avg_memory="

    .line 734
    .line 735
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 736
    .line 737
    .line 738
    move-wide/from16 v1, v36

    .line 739
    .line 740
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 741
    .line 742
    .line 743
    const-string v1, "\nu32_first_i_frame="

    .line 744
    .line 745
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 746
    .line 747
    .line 748
    iget-wide v1, v0, Lcom/tencent/liteav/e;->f:J

    .line 749
    .line 750
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 751
    .line 752
    .line 753
    const-string v1, "\nu32_video_width="

    .line 754
    .line 755
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 756
    .line 757
    .line 758
    move/from16 v1, v35

    .line 759
    .line 760
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 761
    .line 762
    .line 763
    const-string v1, "\nu32_video_height="

    .line 764
    .line 765
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 766
    .line 767
    .line 768
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 769
    .line 770
    .line 771
    const-string v1, "\nu32_video_avg_fps="

    .line 772
    .line 773
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 774
    .line 775
    .line 776
    move-wide/from16 v1, v33

    .line 777
    .line 778
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 779
    .line 780
    .line 781
    const-string v1, "\nu32_speed_cnt="

    .line 782
    .line 783
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 784
    .line 785
    .line 786
    move/from16 v1, v31

    .line 787
    .line 788
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 789
    .line 790
    .line 791
    const-string v1, "\nu32_nodata_cnt="

    .line 792
    .line 793
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 794
    .line 795
    .line 796
    move/from16 v1, v32

    .line 797
    .line 798
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 799
    .line 800
    .line 801
    const-string v1, "\nu32_avg_cache_time="

    .line 802
    .line 803
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 804
    .line 805
    .line 806
    move/from16 v1, v30

    .line 807
    .line 808
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 809
    .line 810
    .line 811
    const-string v1, "\nu32_avg_block_time="

    .line 812
    .line 813
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 814
    .line 815
    .line 816
    invoke-virtual {v10, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 817
    .line 818
    .line 819
    const-string v1, "\nu32_avg_load="

    .line 820
    .line 821
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 822
    .line 823
    .line 824
    move-wide/from16 v1, v28

    .line 825
    .line 826
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 827
    .line 828
    .line 829
    const-string v1, "\nu32_max_load="

    .line 830
    .line 831
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 832
    .line 833
    .line 834
    move-wide/from16 v1, v24

    .line 835
    .line 836
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 837
    .line 838
    .line 839
    const-string v1, "\nu32_video_block_time="

    .line 840
    .line 841
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 842
    .line 843
    .line 844
    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 845
    .line 846
    .line 847
    const-string v1, "\nu32_audio_block_time="

    .line 848
    .line 849
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 850
    .line 851
    .line 852
    move-wide/from16 v1, v26

    .line 853
    .line 854
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 855
    .line 856
    .line 857
    const-string v1, "\nu32_load_cnt="

    .line 858
    .line 859
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 860
    .line 861
    .line 862
    move-wide/from16 v1, v22

    .line 863
    .line 864
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 865
    .line 866
    .line 867
    const-string v1, "\nu32_result="

    .line 868
    .line 869
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 870
    .line 871
    .line 872
    move-wide/from16 v11, v20

    .line 873
    .line 874
    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 875
    .line 876
    .line 877
    const-string v1, "\nu64_err_code="

    .line 878
    .line 879
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 880
    .line 881
    .line 882
    move/from16 v1, v19

    .line 883
    .line 884
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 885
    .line 886
    .line 887
    const-string v1, "\nu32_channel_type="

    .line 888
    .line 889
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 890
    .line 891
    .line 892
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 893
    .line 894
    .line 895
    const-string v1, "\nu32_ip_count_quic="

    .line 896
    .line 897
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 898
    .line 899
    .line 900
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 901
    .line 902
    .line 903
    const-string v1, "\nu32_connect_count_quic="

    .line 904
    .line 905
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 906
    .line 907
    .line 908
    move/from16 v1, v43

    .line 909
    .line 910
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 911
    .line 912
    .line 913
    const-string v1, "\nu32_connect_count_tcp="

    .line 914
    .line 915
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 916
    .line 917
    .line 918
    move/from16 v1, v42

    .line 919
    .line 920
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 921
    .line 922
    .line 923
    const-string v1, "\nu64_block_count="

    .line 924
    .line 925
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 926
    .line 927
    .line 928
    move-wide/from16 v1, v40

    .line 929
    .line 930
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 931
    .line 932
    .line 933
    const-string v1, "\nu64_jitter_cache_max="

    .line 934
    .line 935
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 936
    .line 937
    .line 938
    move-wide/from16 v1, v16

    .line 939
    .line 940
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 941
    .line 942
    .line 943
    const-string v1, "\nu64_jitter_cache_avg="

    .line 944
    .line 945
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 946
    .line 947
    .line 948
    move-wide/from16 v1, v38

    .line 949
    .line 950
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 951
    .line 952
    .line 953
    const-string v1, "\nu64_begin_timestamp="

    .line 954
    .line 955
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 956
    .line 957
    .line 958
    move-object/from16 v1, v18

    .line 959
    .line 960
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 961
    .line 962
    .line 963
    const-string v1, "\nu32_is_real_time="

    .line 964
    .line 965
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 966
    .line 967
    .line 968
    iget-object v1, v0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 969
    .line 970
    const/16 v2, 0x7d9

    .line 971
    .line 972
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 973
    .line 974
    .line 975
    move-result-wide v1

    .line 976
    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 977
    .line 978
    .line 979
    const-string v1, "\nstr_app_version="

    .line 980
    .line 981
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 982
    .line 983
    .line 984
    iget-object v0, v0, Lcom/tencent/liteav/e;->e:Ljava/lang/String;

    .line 985
    .line 986
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 987
    .line 988
    .line 989
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 990
    .line 991
    .line 992
    move-result-object v0

    .line 993
    invoke-static {v9, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 994
    .line 995
    .line 996
    return-void
.end method

.method private c(I)V
    .locals 12

    .line 1
    new-instance v0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/liteav/e;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->url:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, v0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_common:Z

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    iput-boolean v2, v0, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->report_status:Z

    .line 15
    .line 16
    iget-object v3, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    const-string v4, "token"

    .line 19
    .line 20
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ljava/lang/String;

    .line 25
    .line 26
    iget-object v4, p0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 27
    .line 28
    sget v5, Lcom/tencent/liteav/basic/datareport/a;->am:I

    .line 29
    .line 30
    invoke-static {v4, v3, p1, v5, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->InitEvent(Landroid/content/Context;Ljava/lang/String;IILcom/tencent/liteav/basic/datareport/TXCDRExtInfo;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, p1, v3}, Lcom/tencent/liteav/e;->a(ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getUtcTimeTick()J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    const-string v0, "u64_timestamp"

    .line 41
    .line 42
    invoke-static {v3, p1, v0, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->a()[I

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    aget v4, v0, v2

    .line 50
    .line 51
    int-to-long v4, v4

    .line 52
    const-string v6, "u32_cpu_usage"

    .line 53
    .line 54
    invoke-static {v3, p1, v6, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    aget v0, v0, v1

    .line 58
    .line 59
    int-to-long v0, v0

    .line 60
    const-string v4, "u32_app_cpu_usage"

    .line 61
    .line 62
    invoke-static {v3, p1, v4, v0, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 66
    .line 67
    const/16 v1, 0x232a

    .line 68
    .line 69
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    const-string v4, "u32_avg_cpu_usage"

    .line 74
    .line 75
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v3, p1, v4, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 83
    .line 84
    const/16 v1, 0x232d

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    const-string v4, "u32_avg_memory"

    .line 91
    .line 92
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v3, p1, v4, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 100
    .line 101
    const/16 v1, 0x177e

    .line 102
    .line 103
    const/4 v4, 0x2

    .line 104
    invoke-static {v0, v1, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;II)J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    const-string v5, "u32_recv_av_diff_time"

    .line 109
    .line 110
    invoke-static {v3, p1, v5, v0, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 114
    .line 115
    const/16 v1, 0x177d

    .line 116
    .line 117
    invoke-static {v0, v1, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;II)J

    .line 118
    .line 119
    .line 120
    move-result-wide v0

    .line 121
    const-string v5, "u32_play_av_diff_time"

    .line 122
    .line 123
    invoke-static {v3, p1, v5, v0, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getUtcTimeTick()J

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    iget-wide v5, p0, Lcom/tencent/liteav/e;->r:J

    .line 131
    .line 132
    sub-long/2addr v0, v5

    .line 133
    const-wide/16 v5, 0x3e8

    .line 134
    .line 135
    div-long/2addr v0, v5

    .line 136
    const-string v5, "u64_playtime"

    .line 137
    .line 138
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v3, p1, v5, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 146
    .line 147
    const/16 v1, 0x7df

    .line 148
    .line 149
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_0

    .line 154
    .line 155
    move v2, v4

    .line 156
    :cond_0
    const-string v0, "u32_audio_decode_type"

    .line 157
    .line 158
    int-to-long v1, v2

    .line 159
    invoke-static {v3, p1, v0, v1, v2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 163
    .line 164
    const/16 v1, 0x7d2

    .line 165
    .line 166
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 167
    .line 168
    .line 169
    move-result-wide v0

    .line 170
    iget-wide v4, p0, Lcom/tencent/liteav/e;->i:J

    .line 171
    .line 172
    const-wide/16 v6, -0x1

    .line 173
    .line 174
    cmp-long v2, v4, v6

    .line 175
    .line 176
    const-wide/16 v8, 0x0

    .line 177
    .line 178
    const-string v10, "u32_audio_block_count"

    .line 179
    .line 180
    if-nez v2, :cond_1

    .line 181
    .line 182
    invoke-static {v3, p1, v10, v8, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_1
    cmp-long v2, v0, v4

    .line 187
    .line 188
    if-ltz v2, :cond_2

    .line 189
    .line 190
    sub-long v4, v0, v4

    .line 191
    .line 192
    invoke-static {v3, p1, v10, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 193
    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_2
    invoke-static {v3, p1, v10, v6, v7}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 197
    .line 198
    .line 199
    :goto_0
    iput-wide v0, p0, Lcom/tencent/liteav/e;->i:J

    .line 200
    .line 201
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 202
    .line 203
    const/16 v1, 0x7da

    .line 204
    .line 205
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    const-string v1, "u32_audio_cache_time"

    .line 210
    .line 211
    int-to-long v4, v0

    .line 212
    invoke-static {v3, p1, v1, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 216
    .line 217
    const/16 v1, 0x7de

    .line 218
    .line 219
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    const-string v1, "u32_audio_drop"

    .line 224
    .line 225
    int-to-long v4, v0

    .line 226
    invoke-static {v3, p1, v1, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 230
    .line 231
    const/16 v1, 0x138c

    .line 232
    .line 233
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    const-string v1, "u32_video_decode_type"

    .line 238
    .line 239
    int-to-long v4, v0

    .line 240
    invoke-static {v3, p1, v1, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 244
    .line 245
    const/16 v1, 0x1783

    .line 246
    .line 247
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    int-to-long v0, v0

    .line 252
    iget-wide v4, p0, Lcom/tencent/liteav/e;->h:J

    .line 253
    .line 254
    cmp-long v2, v0, v4

    .line 255
    .line 256
    if-ltz v2, :cond_3

    .line 257
    .line 258
    sub-long v4, v0, v4

    .line 259
    .line 260
    const-wide/16 v10, 0x2

    .line 261
    .line 262
    div-long/2addr v4, v10

    .line 263
    const-string v2, "u32_video_recv_fps"

    .line 264
    .line 265
    invoke-static {v3, p1, v2, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 266
    .line 267
    .line 268
    :cond_3
    iput-wide v0, p0, Lcom/tencent/liteav/e;->h:J

    .line 269
    .line 270
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 271
    .line 272
    const/16 v1, 0x1772

    .line 273
    .line 274
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    .line 275
    .line 276
    .line 277
    move-result-wide v0

    .line 278
    double-to-int v0, v0

    .line 279
    int-to-long v0, v0

    .line 280
    const-string v2, "u32_fps"

    .line 281
    .line 282
    invoke-static {v3, p1, v2, v0, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 283
    .line 284
    .line 285
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 286
    .line 287
    const/16 v1, 0x1777

    .line 288
    .line 289
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    const-string v1, "u32_video_cache_time"

    .line 294
    .line 295
    int-to-long v4, v0

    .line 296
    invoke-static {v3, p1, v1, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 297
    .line 298
    .line 299
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 300
    .line 301
    const/16 v1, 0x1778

    .line 302
    .line 303
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 304
    .line 305
    .line 306
    move-result-wide v0

    .line 307
    const-string v2, "u32_video_cache_count"

    .line 308
    .line 309
    invoke-static {v3, p1, v2, v0, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 310
    .line 311
    .line 312
    const-string v2, "u32_avg_cache_count"

    .line 313
    .line 314
    invoke-static {v3, p1, v2, v0, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 315
    .line 316
    .line 317
    iget-object v2, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 318
    .line 319
    const/16 v4, 0x1774

    .line 320
    .line 321
    invoke-static {v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 322
    .line 323
    .line 324
    move-result-wide v4

    .line 325
    iget-wide v10, p0, Lcom/tencent/liteav/e;->g:J

    .line 326
    .line 327
    cmp-long v2, v10, v6

    .line 328
    .line 329
    const-string v6, "u32_video_block_count"

    .line 330
    .line 331
    if-nez v2, :cond_4

    .line 332
    .line 333
    invoke-static {v3, p1, v6, v8, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 334
    .line 335
    .line 336
    goto :goto_1

    .line 337
    :cond_4
    cmp-long v2, v4, v10

    .line 338
    .line 339
    if-ltz v2, :cond_5

    .line 340
    .line 341
    sub-long v7, v4, v10

    .line 342
    .line 343
    invoke-static {v3, p1, v6, v7, v8}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 344
    .line 345
    .line 346
    goto :goto_1

    .line 347
    :cond_5
    invoke-static {v3, p1, v6, v8, v9}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 348
    .line 349
    .line 350
    :goto_1
    iput-wide v4, p0, Lcom/tencent/liteav/e;->g:J

    .line 351
    .line 352
    iget-object v2, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 353
    .line 354
    const/16 v4, 0x1bbe

    .line 355
    .line 356
    invoke-static {v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 357
    .line 358
    .line 359
    move-result v2

    .line 360
    iget-object v4, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 361
    .line 362
    const/16 v5, 0x1bbd

    .line 363
    .line 364
    invoke-static {v4, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 365
    .line 366
    .line 367
    move-result v4

    .line 368
    add-int/2addr v2, v4

    .line 369
    int-to-long v4, v2

    .line 370
    const-string v2, "u32_net_speed"

    .line 371
    .line 372
    invoke-static {v3, p1, v2, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 373
    .line 374
    .line 375
    const-string v2, "u32_avg_net_speed"

    .line 376
    .line 377
    invoke-static {v3, p1, v2, v4, v5}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventIntValue(Ljava/lang/String;ILjava/lang/String;J)V

    .line 378
    .line 379
    .line 380
    iget-object v2, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 381
    .line 382
    const/16 v4, 0x1bc8

    .line 383
    .line 384
    invoke-static {v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 385
    .line 386
    .line 387
    move-result v2

    .line 388
    const-string v4, "u32_link_type"

    .line 389
    .line 390
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v2

    .line 394
    invoke-static {v3, p1, v4, v2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    iget-object v2, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 398
    .line 399
    const/16 v4, 0x1bc7

    .line 400
    .line 401
    invoke-static {v2, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 402
    .line 403
    .line 404
    move-result v2

    .line 405
    const-string v4, "u32_channel_type"

    .line 406
    .line 407
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v2

    .line 411
    invoke-static {v3, p1, v4, v2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    const-string v2, "str_app_version"

    .line 415
    .line 416
    iget-object v4, p0, Lcom/tencent/liteav/e;->e:Ljava/lang/String;

    .line 417
    .line 418
    invoke-static {v3, p1, v2, v4}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    invoke-static {v3, p1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->nativeReportEvent(Ljava/lang/String;I)V

    .line 422
    .line 423
    .line 424
    iget-boolean p1, p0, Lcom/tencent/liteav/e;->m:Z

    .line 425
    .line 426
    if-eqz p1, :cond_6

    .line 427
    .line 428
    iget-wide v2, p0, Lcom/tencent/liteav/e;->q:J

    .line 429
    .line 430
    const-wide/16 v4, 0x1

    .line 431
    .line 432
    add-long/2addr v2, v4

    .line 433
    iput-wide v2, p0, Lcom/tencent/liteav/e;->q:J

    .line 434
    .line 435
    iget-wide v2, p0, Lcom/tencent/liteav/e;->p:J

    .line 436
    .line 437
    add-long/2addr v2, v0

    .line 438
    iput-wide v2, p0, Lcom/tencent/liteav/e;->p:J

    .line 439
    .line 440
    iget-wide v2, p0, Lcom/tencent/liteav/e;->o:J

    .line 441
    .line 442
    cmp-long p1, v0, v2

    .line 443
    .line 444
    if-lez p1, :cond_6

    .line 445
    .line 446
    iput-wide v0, p0, Lcom/tencent/liteav/e;->o:J

    .line 447
    .line 448
    :cond_6
    return-void
.end method

.method public static c(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    .line 449
    const-string v0, "myqcloud"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 450
    :cond_0
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic e()Ljava/util/HashMap;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/liteav/e;->u:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic f()Ljava/lang/String;
    .locals 1

    .line 45
    sget-object v0, Lcom/tencent/liteav/e;->a:Ljava/lang/String;

    return-object v0
.end method

.method private f(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "room://"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "/"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    array-length v0, p1

    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    aget-object p1, p1, v0

    .line 25
    .line 26
    const-string v0, "_"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 32
    .line 33
    const-wide/16 v0, 0x3

    .line 34
    .line 35
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/16 v0, 0x1bc8

    .line 40
    .line 41
    invoke-static {p0, v0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private g(Ljava/lang/String;)I
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    if-eqz p0, :cond_0

    .line 59
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private g()V
    .locals 3

    .line 1
    const/16 v0, 0x1781

    .line 2
    .line 3
    const/16 v1, 0x1782

    .line 4
    .line 5
    const/16 v2, 0x1772

    .line 6
    .line 7
    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/liteav/e;->a(III)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->a()[I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    aget v0, v0, v2

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/16 v2, 0x2329

    .line 24
    .line 25
    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x232a

    .line 29
    .line 30
    const/16 v1, 0x232b

    .line 31
    .line 32
    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/liteav/e;->a(III)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->b()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const/16 v2, 0x232c

    .line 46
    .line 47
    invoke-static {v0, v2, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    const/16 v0, 0x232d

    .line 51
    .line 52
    const/16 v1, 0x232e

    .line 53
    .line 54
    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/liteav/e;->a(III)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private h()V
    .locals 10

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 7
    .line 8
    const/16 v2, 0x1bcc

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 15
    .line 16
    const/16 v3, 0x1bcd

    .line 17
    .line 18
    invoke-static {v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 23
    .line 24
    const/16 v4, 0x1bce

    .line 25
    .line 26
    invoke-static {v3, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-object v4, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 31
    .line 32
    const/16 v5, 0x1bc1

    .line 33
    .line 34
    invoke-static {v4, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    iget-object v5, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 39
    .line 40
    const/16 v6, 0x1bc2

    .line 41
    .line 42
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    iget-object v6, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 47
    .line 48
    const/16 v7, 0x1bc7

    .line 49
    .line 50
    invoke-static {v6, v7}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    const-string v7, "stream_url"

    .line 55
    .line 56
    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    const-string v1, "stream_id"

    .line 60
    .line 61
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    const-string v1, "bizid"

    .line 65
    .line 66
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    const-string v1, "err_code"

    .line 70
    .line 71
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    const-string v1, "err_info"

    .line 79
    .line 80
    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    const-string v1, "channel_type"

    .line 84
    .line 85
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 93
    .line 94
    .line 95
    move-result-wide v1

    .line 96
    iget-wide v3, p0, Lcom/tencent/liteav/e;->n:J

    .line 97
    .line 98
    sub-long v3, v1, v3

    .line 99
    .line 100
    new-instance v5, Ljava/text/SimpleDateFormat;

    .line 101
    .line 102
    const-string v6, "yyyy-MM-dd HH:mm:ss:SSS"

    .line 103
    .line 104
    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    new-instance v7, Ljava/util/Date;

    .line 108
    .line 109
    iget-wide v8, p0, Lcom/tencent/liteav/e;->n:J

    .line 110
    .line 111
    invoke-direct {v7, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v5, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    const-string v7, "start_time"

    .line 119
    .line 120
    invoke-interface {v0, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    new-instance v5, Ljava/text/SimpleDateFormat;

    .line 124
    .line 125
    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    new-instance v6, Ljava/util/Date;

    .line 129
    .line 130
    invoke-direct {v6, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const-string v2, "end_time"

    .line 138
    .line 139
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    const-string v1, "total_time"

    .line 143
    .line 144
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 152
    .line 153
    const/16 v2, 0x1773

    .line 154
    .line 155
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 156
    .line 157
    .line 158
    move-result-wide v1

    .line 159
    iget-object v3, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 160
    .line 161
    const/16 v4, 0x1776

    .line 162
    .line 163
    invoke-static {v3, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 164
    .line 165
    .line 166
    move-result-wide v3

    .line 167
    iget-object v5, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 168
    .line 169
    const/16 v6, 0x1775

    .line 170
    .line 171
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 172
    .line 173
    .line 174
    move-result-wide v5

    .line 175
    const-wide/16 v7, 0x0

    .line 176
    .line 177
    cmp-long v9, v1, v7

    .line 178
    .line 179
    if-eqz v9, :cond_0

    .line 180
    .line 181
    div-long/2addr v3, v1

    .line 182
    goto :goto_0

    .line 183
    :cond_0
    move-wide v3, v7

    .line 184
    :goto_0
    const-string v9, "block_count"

    .line 185
    .line 186
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    const-string v1, "block_duration_max"

    .line 194
    .line 195
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    const-string v1, "block_duration_avg"

    .line 203
    .line 204
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    iget-wide v1, p0, Lcom/tencent/liteav/e;->q:J

    .line 212
    .line 213
    cmp-long v3, v1, v7

    .line 214
    .line 215
    if-eqz v3, :cond_1

    .line 216
    .line 217
    iget-wide v3, p0, Lcom/tencent/liteav/e;->p:J

    .line 218
    .line 219
    div-long/2addr v3, v1

    .line 220
    goto :goto_1

    .line 221
    :cond_1
    move-wide v3, v7

    .line 222
    :goto_1
    iget-wide v1, p0, Lcom/tencent/liteav/e;->o:J

    .line 223
    .line 224
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    const-string v2, "jitter_cache_max"

    .line 229
    .line 230
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    const-string v1, "jitter_cache_avg"

    .line 234
    .line 235
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    invoke-static {}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txCreateToken()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    sget v2, Lcom/tencent/liteav/basic/datareport/a;->af:I

    .line 247
    .line 248
    sget v3, Lcom/tencent/liteav/basic/datareport/a;->al:I

    .line 249
    .line 250
    new-instance v4, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;

    .line 251
    .line 252
    invoke-direct {v4}, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;-><init>()V

    .line 253
    .line 254
    .line 255
    const-string v5, "LINKMIC"

    .line 256
    .line 257
    iput-object v5, v4, Lcom/tencent/liteav/basic/datareport/TXCDRExtInfo;->command_id_comment:Ljava/lang/String;

    .line 258
    .line 259
    iget-object v5, p0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 260
    .line 261
    invoke-static {v5, v1, v2, v3, v4}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->InitEvent(Landroid/content/Context;Ljava/lang/String;IILcom/tencent/liteav/basic/datareport/TXCDRExtInfo;)V

    .line 262
    .line 263
    .line 264
    sget-object v3, Lcom/tencent/liteav/e;->a:Ljava/lang/String;

    .line 265
    .line 266
    new-instance v4, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    const-string v5, "report evt 40402: token="

    .line 269
    .line 270
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    invoke-static {v3, v4}, Lcom/tencent/liteav/basic/log/TXCLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    :cond_2
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    if-eqz v3, :cond_3

    .line 296
    .line 297
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    check-cast v3, Ljava/util/Map$Entry;

    .line 302
    .line 303
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v4

    .line 307
    check-cast v4, Ljava/lang/String;

    .line 308
    .line 309
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    check-cast v3, Ljava/lang/String;

    .line 314
    .line 315
    sget-object v5, Lcom/tencent/liteav/e;->a:Ljava/lang/String;

    .line 316
    .line 317
    new-instance v6, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    const-string v9, "RealTimePlayStatisticInfo: "

    .line 320
    .line 321
    invoke-direct {v6, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    const-string v9, " = "

    .line 328
    .line 329
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v6

    .line 339
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    if-eqz v4, :cond_2

    .line 343
    .line 344
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 345
    .line 346
    .line 347
    move-result v5

    .line 348
    if-lez v5, :cond_2

    .line 349
    .line 350
    if-eqz v3, :cond_2

    .line 351
    .line 352
    invoke-static {v1, v2, v4, v3}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txSetEventValue(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    goto :goto_2

    .line 356
    :cond_3
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->nativeReportEvent(Ljava/lang/String;I)V

    .line 357
    .line 358
    .line 359
    const/4 v0, 0x0

    .line 360
    iput-boolean v0, p0, Lcom/tencent/liteav/e;->m:Z

    .line 361
    .line 362
    iput-wide v7, p0, Lcom/tencent/liteav/e;->n:J

    .line 363
    .line 364
    iput-wide v7, p0, Lcom/tencent/liteav/e;->q:J

    .line 365
    .line 366
    iput-wide v7, p0, Lcom/tencent/liteav/e;->p:J

    .line 367
    .line 368
    iput-wide v7, p0, Lcom/tencent/liteav/e;->o:J

    .line 369
    .line 370
    return-void
.end method

.method private i()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tencent/liteav/e;->j:Z

    .line 3
    .line 4
    const-wide/16 v1, 0x0

    .line 5
    .line 6
    iput-wide v1, p0, Lcom/tencent/liteav/e;->k:J

    .line 7
    .line 8
    iput v0, p0, Lcom/tencent/liteav/e;->s:I

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/liteav/e;->w:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getUserId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/f;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :cond_1
    iget-object v1, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 35
    .line 36
    const-string v2, "str_user_id"

    .line 37
    .line 38
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "str_device_type"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 64
    .line 65
    invoke-static {v1}, Lcom/tencent/liteav/basic/util/f;->e(Landroid/content/Context;)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const-string v2, "u32_network_type"

    .line 74
    .line 75
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 79
    .line 80
    const-string v1, "token"

    .line 81
    .line 82
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->e()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 92
    .line 93
    invoke-static {v1}, Lcom/tencent/liteav/basic/util/f;->c(Landroid/content/Context;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const-string v2, "str_package_name"

    .line 98
    .line 99
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/tencent/liteav/e;->d:Landroid/content/Context;

    .line 105
    .line 106
    invoke-static {v1}, Lcom/tencent/liteav/basic/util/f;->f(Landroid/content/Context;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const-string v2, "dev_uuid"

    .line 111
    .line 112
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 116
    .line 117
    const-string v1, "str_os_info"

    .line 118
    .line 119
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->d()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getUtcTimeTick()J

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    iput-wide v0, p0, Lcom/tencent/liteav/e;->r:J

    .line 131
    .line 132
    iget-object p0, p0, Lcom/tencent/liteav/e;->b:Ljava/util/HashMap;

    .line 133
    .line 134
    const-string v2, "u64_timestamp"

    .line 135
    .line 136
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 640
    invoke-direct {p0}, Lcom/tencent/liteav/e;->i()V

    const-wide/16 v0, -0x1

    .line 641
    iput-wide v0, p0, Lcom/tencent/liteav/e;->g:J

    .line 642
    iput-wide v0, p0, Lcom/tencent/liteav/e;->i:J

    .line 643
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/liteav/e;->n:J

    return-void
.end method

.method public a(III)V
    .locals 7

    .line 629
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const-wide v1, 0x3f50624dd2f1a9fcL    # 0.001

    const/16 v3, 0x1772

    if-ne p1, v3, :cond_1

    .line 630
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    move-result-wide v3

    cmpg-double p1, v3, v1

    if-gez p1, :cond_0

    goto :goto_0

    .line 631
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    move-result-wide v0

    .line 632
    iget-object p1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {p1, p3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    sub-double/2addr v3, v0

    int-to-double v5, p1

    div-double/2addr v3, v5

    add-double/2addr v0, v3

    .line 633
    iget-object v2, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {v2, p2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 634
    iget-object p0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, p3, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    return-void

    .line 635
    :cond_1
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p1

    int-to-double v3, p1

    cmpg-double p1, v3, v1

    if-gez p1, :cond_2

    :goto_0
    return-void

    .line 636
    :cond_2
    iget-object p1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;I)D

    move-result-wide v0

    .line 637
    iget-object p1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {p1, p3}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    sub-double/2addr v3, v0

    int-to-double v5, p1

    div-double/2addr v3, v5

    add-double/2addr v0, v3

    .line 638
    iget-object v2, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {v2, p2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 639
    iget-object p0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, p3, p1}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 627
    iput-object p1, p0, Lcom/tencent/liteav/e;->c:Ljava/lang/String;

    .line 628
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/e;->b(Ljava/lang/String;)V

    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 626
    iput-boolean p1, p0, Lcom/tencent/liteav/e;->m:Z

    return-void
.end method

.method public b()V
    .locals 4

    const-wide/16 v0, 0x0

    .line 998
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 999
    iget-boolean v1, p0, Lcom/tencent/liteav/e;->j:Z

    if-eqz v1, :cond_1

    .line 1000
    iget-boolean v1, p0, Lcom/tencent/liteav/e;->m:Z

    if-eqz v1, :cond_0

    .line 1001
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->Z:I

    invoke-direct {p0, v1}, Lcom/tencent/liteav/e;->b(I)V

    goto :goto_0

    .line 1002
    :cond_0
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->W:I

    invoke-direct {p0, v1}, Lcom/tencent/liteav/e;->b(I)V

    goto :goto_0

    .line 1003
    :cond_1
    sget-object v1, Lcom/tencent/liteav/e;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "play "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/tencent/liteav/e;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " failed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1004
    iget-boolean v1, p0, Lcom/tencent/liteav/e;->m:Z

    if-eqz v1, :cond_2

    .line 1005
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->X:I

    invoke-direct {p0, v1}, Lcom/tencent/liteav/e;->a(I)V

    goto :goto_0

    .line 1006
    :cond_2
    sget v1, Lcom/tencent/liteav/basic/datareport/a;->U:I

    invoke-direct {p0, v1}, Lcom/tencent/liteav/e;->a(I)V

    .line 1007
    :goto_0
    iget-boolean v1, p0, Lcom/tencent/liteav/e;->m:Z

    if-eqz v1, :cond_3

    .line 1008
    invoke-direct {p0}, Lcom/tencent/liteav/e;->h()V

    .line 1009
    :cond_3
    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v2, 0x1bc3

    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 1010
    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v2, 0x7f1

    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 1011
    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v2, 0x1771

    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 1012
    iget-object v1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v2, 0x1bc0

    invoke-static {v1, v2, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 1013
    iget-object p0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    const/16 v1, 0x1bc4

    invoke-static {p0, v1, v0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    .line 997
    :cond_0
    iput-object p1, p0, Lcom/tencent/liteav/e;->t:Ljava/lang/String;

    return-void
.end method

.method public c()Lcom/tencent/liteav/e$a;
    .locals 4

    .line 451
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/e;->t:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    .line 452
    sget-object p0, Lcom/tencent/liteav/e$a;->a:Lcom/tencent/liteav/e$a;

    return-object p0

    .line 453
    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 454
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 455
    sget-object p0, Lcom/tencent/liteav/e$a;->a:Lcom/tencent/liteav/e$a;

    return-object p0

    .line 456
    :cond_1
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    .line 457
    sget-object p0, Lcom/tencent/liteav/e$a;->a:Lcom/tencent/liteav/e$a;

    return-object p0

    .line 458
    :cond_2
    const-string v3, "rtmp"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "https"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 459
    sget-object p0, Lcom/tencent/liteav/e$a;->a:Lcom/tencent/liteav/e$a;

    return-object p0

    .line 460
    :cond_3
    invoke-static {v1}, Lcom/tencent/liteav/e;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 461
    sget-object p0, Lcom/tencent/liteav/e$a;->b:Lcom/tencent/liteav/e$a;

    return-object p0

    .line 462
    :cond_4
    invoke-virtual {v0}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 463
    const-string v2, "bizid"

    .line 464
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "txTime"

    .line 465
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "txSecret"

    .line 466
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 467
    :cond_5
    sget-object p0, Lcom/tencent/liteav/e$a;->b:Lcom/tencent/liteav/e$a;

    return-object p0

    .line 468
    :cond_6
    sget-object v0, Lcom/tencent/liteav/e;->u:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 469
    sget-object p0, Lcom/tencent/liteav/e;->u:Ljava/util/HashMap;

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/liteav/e$a;

    return-object p0

    .line 470
    :cond_7
    sget-object v0, Lcom/tencent/liteav/e;->u:Ljava/util/HashMap;

    sget-object v2, Lcom/tencent/liteav/e$a;->a:Lcom/tencent/liteav/e$a;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lcom/tencent/liteav/e$1;

    invoke-direct {v2, p0, v1}, Lcom/tencent/liteav/e$1;-><init>(Lcom/tencent/liteav/e;Ljava/lang/String;)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 472
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 473
    sget-object v0, Lcom/tencent/liteav/e;->a:Ljava/lang/String;

    const-string v1, "check stream failed."

    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 474
    :goto_0
    sget-object p0, Lcom/tencent/liteav/e$a;->a:Lcom/tencent/liteav/e$a;

    return-object p0
.end method

.method public d()V
    .locals 13

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/e;->g()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/tencent/liteav/e;->j:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/16 v2, 0x1388

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 14
    .line 15
    const/16 v5, 0x1771

    .line 16
    .line 17
    invoke-static {v0, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 18
    .line 19
    .line 20
    move-result-wide v5

    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 22
    .line 23
    const/16 v7, 0x1bc0

    .line 24
    .line 25
    invoke-static {v0, v7}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 26
    .line 27
    .line 28
    move-result-wide v7

    .line 29
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 30
    .line 31
    const/16 v9, 0x7f1

    .line 32
    .line 33
    invoke-static {v0, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 34
    .line 35
    .line 36
    move-result-wide v9

    .line 37
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 38
    .line 39
    const/16 v11, 0x1bc4

    .line 40
    .line 41
    invoke-static {v0, v11}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 42
    .line 43
    .line 44
    move-result-wide v11

    .line 45
    cmp-long v0, v5, v3

    .line 46
    .line 47
    if-lez v0, :cond_1

    .line 48
    .line 49
    cmp-long v0, v7, v3

    .line 50
    .line 51
    if-lez v0, :cond_1

    .line 52
    .line 53
    cmp-long v0, v11, v3

    .line 54
    .line 55
    if-lez v0, :cond_1

    .line 56
    .line 57
    cmp-long v0, v9, v3

    .line 58
    .line 59
    if-lez v0, :cond_1

    .line 60
    .line 61
    iget-boolean v0, p0, Lcom/tencent/liteav/e;->m:Z

    .line 62
    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    sget v0, Lcom/tencent/liteav/basic/datareport/a;->X:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    sget v0, Lcom/tencent/liteav/basic/datareport/a;->U:I

    .line 69
    .line 70
    :goto_0
    invoke-direct {p0, v0}, Lcom/tencent/liteav/e;->a(I)V

    .line 71
    .line 72
    .line 73
    iput v2, p0, Lcom/tencent/liteav/e;->l:I

    .line 74
    .line 75
    iput-boolean v1, p0, Lcom/tencent/liteav/e;->j:Z

    .line 76
    .line 77
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 78
    .line 79
    const/16 v5, 0x1bcf

    .line 80
    .line 81
    invoke-static {v0, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/e;->b(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget v0, p0, Lcom/tencent/liteav/e;->s:I

    .line 91
    .line 92
    const/4 v5, 0x3

    .line 93
    if-lt v0, v5, :cond_4

    .line 94
    .line 95
    iget-boolean v0, p0, Lcom/tencent/liteav/e;->j:Z

    .line 96
    .line 97
    if-nez v0, :cond_4

    .line 98
    .line 99
    iget-boolean v0, p0, Lcom/tencent/liteav/e;->m:Z

    .line 100
    .line 101
    if-eqz v0, :cond_3

    .line 102
    .line 103
    sget v0, Lcom/tencent/liteav/basic/datareport/a;->X:I

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    sget v0, Lcom/tencent/liteav/basic/datareport/a;->U:I

    .line 107
    .line 108
    :goto_1
    invoke-direct {p0, v0}, Lcom/tencent/liteav/e;->a(I)V

    .line 109
    .line 110
    .line 111
    iput v2, p0, Lcom/tencent/liteav/e;->l:I

    .line 112
    .line 113
    iput-boolean v1, p0, Lcom/tencent/liteav/e;->j:Z

    .line 114
    .line 115
    :cond_4
    iget v0, p0, Lcom/tencent/liteav/e;->s:I

    .line 116
    .line 117
    add-int/2addr v0, v1

    .line 118
    iput v0, p0, Lcom/tencent/liteav/e;->s:I

    .line 119
    .line 120
    iget-wide v0, p0, Lcom/tencent/liteav/e;->k:J

    .line 121
    .line 122
    cmp-long v0, v0, v3

    .line 123
    .line 124
    if-gtz v0, :cond_5

    .line 125
    .line 126
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    iput-wide v0, p0, Lcom/tencent/liteav/e;->k:J

    .line 131
    .line 132
    :cond_5
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 133
    .line 134
    .line 135
    move-result-wide v0

    .line 136
    iget-wide v3, p0, Lcom/tencent/liteav/e;->k:J

    .line 137
    .line 138
    iget v5, p0, Lcom/tencent/liteav/e;->l:I

    .line 139
    .line 140
    int-to-long v5, v5

    .line 141
    add-long/2addr v3, v5

    .line 142
    cmp-long v0, v0, v3

    .line 143
    .line 144
    if-lez v0, :cond_a

    .line 145
    .line 146
    iget-boolean v0, p0, Lcom/tencent/liteav/e;->m:Z

    .line 147
    .line 148
    if-eqz v0, :cond_6

    .line 149
    .line 150
    sget v0, Lcom/tencent/liteav/basic/datareport/a;->Y:I

    .line 151
    .line 152
    invoke-direct {p0, v0}, Lcom/tencent/liteav/e;->c(I)V

    .line 153
    .line 154
    .line 155
    iput v2, p0, Lcom/tencent/liteav/e;->l:I

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_6
    invoke-virtual {p0}, Lcom/tencent/liteav/e;->c()Lcom/tencent/liteav/e$a;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    sget-object v1, Lcom/tencent/liteav/e$a;->c:Lcom/tencent/liteav/e$a;

    .line 163
    .line 164
    if-ne v0, v1, :cond_7

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_7
    sget v0, Lcom/tencent/liteav/basic/datareport/a;->V:I

    .line 168
    .line 169
    invoke-direct {p0, v0}, Lcom/tencent/liteav/e;->c(I)V

    .line 170
    .line 171
    .line 172
    invoke-static {}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->getStatusReportInterval()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    iput v0, p0, Lcom/tencent/liteav/e;->l:I

    .line 177
    .line 178
    if-ge v0, v2, :cond_8

    .line 179
    .line 180
    iput v2, p0, Lcom/tencent/liteav/e;->l:I

    .line 181
    .line 182
    :cond_8
    iget v0, p0, Lcom/tencent/liteav/e;->l:I

    .line 183
    .line 184
    const v1, 0x493e0

    .line 185
    .line 186
    .line 187
    if-le v0, v1, :cond_9

    .line 188
    .line 189
    iput v1, p0, Lcom/tencent/liteav/e;->l:I

    .line 190
    .line 191
    :cond_9
    :goto_2
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 192
    .line 193
    const/16 v1, 0x1774

    .line 194
    .line 195
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 196
    .line 197
    .line 198
    move-result-wide v0

    .line 199
    iput-wide v0, p0, Lcom/tencent/liteav/e;->g:J

    .line 200
    .line 201
    iget-object v0, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    .line 202
    .line 203
    const/16 v1, 0x7d2

    .line 204
    .line 205
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    int-to-long v0, v0

    .line 210
    iput-wide v0, p0, Lcom/tencent/liteav/e;->i:J

    .line 211
    .line 212
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 213
    .line 214
    .line 215
    move-result-wide v0

    .line 216
    iput-wide v0, p0, Lcom/tencent/liteav/e;->k:J

    .line 217
    .line 218
    :cond_a
    :goto_3
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 219
    iput-object p1, p0, Lcom/tencent/liteav/e;->v:Ljava/lang/String;

    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/e;->w:Ljava/lang/String;

    return-void
.end method
