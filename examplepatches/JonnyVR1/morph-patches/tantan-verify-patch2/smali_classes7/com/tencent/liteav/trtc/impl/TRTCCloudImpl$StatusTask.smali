.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StatusTask"
.end annotation


# instance fields
.field private mTRTCEngine:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;->mTRTCEngine:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$StatusTask;->mTRTCEngine:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_4

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/f;->e(Landroid/content/Context;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->a()[I

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->b()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    mul-int/lit16 v2, v2, 0x400

    .line 28
    .line 29
    const/16 v3, 0x2afe

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    const-string v5, "18446744073709551615"

    .line 36
    .line 37
    invoke-static {v5, v3, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    aget v4, v1, v3

    .line 42
    .line 43
    div-int/lit8 v4, v4, 0xa

    .line 44
    .line 45
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    const/16 v6, 0x2af9

    .line 50
    .line 51
    invoke-static {v5, v6, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    const/4 v4, 0x1

    .line 55
    aget v6, v1, v4

    .line 56
    .line 57
    div-int/lit8 v6, v6, 0xa

    .line 58
    .line 59
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    const/16 v7, 0x2afa

    .line 64
    .line 65
    invoke-static {v5, v7, v6}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    const/16 v6, 0x2afb

    .line 69
    .line 70
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {v5, v6, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 78
    .line 79
    invoke-static {v2}, Lcom/tencent/liteav/basic/util/f;->a(Landroid/content/Context;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    const/16 v6, 0x2afc

    .line 84
    .line 85
    if-eqz v2, :cond_1

    .line 86
    .line 87
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-static {v5, v6, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move v2, v4

    .line 95
    goto :goto_0

    .line 96
    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-static {v5, v6, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move v2, v3

    .line 104
    :goto_0
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eq v5, v0, :cond_4

    .line 109
    .line 110
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-ltz v5, :cond_2

    .line 115
    .line 116
    if-lez v0, :cond_2

    .line 117
    .line 118
    iget-wide v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 119
    .line 120
    const/16 v7, 0x64

    .line 121
    .line 122
    invoke-static {p0, v5, v6, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JI)V

    .line 123
    .line 124
    .line 125
    :cond_2
    if-nez v0, :cond_3

    .line 126
    .line 127
    const-wide/16 v5, 0x0

    .line 128
    .line 129
    :goto_1
    move-wide v9, v5

    .line 130
    goto :goto_2

    .line 131
    :cond_3
    int-to-long v5, v0

    .line 132
    goto :goto_1

    .line 133
    :goto_2
    const-string v13, ""

    .line 134
    .line 135
    const/4 v14, 0x0

    .line 136
    const-string v7, "18446744073709551615"

    .line 137
    .line 138
    const/16 v8, 0x3eb

    .line 139
    .line 140
    const-wide/16 v11, -0x1

    .line 141
    .line 142
    invoke-static/range {v7 .. v14}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    new-instance v5, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    filled-new-array {v6, v7}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    const-string v7, "network switch from:%d to %d"

    .line 167
    .line 168
    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v6, " self:"

    .line 176
    .line 177
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    const-string v6, "1:wifi/2:4G/3:3G/4:2G/5:Cable"

    .line 192
    .line 193
    const/4 v7, 0x2

    .line 194
    invoke-static {v7, v5, v6, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 195
    .line 196
    .line 197
    invoke-static {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8702(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I

    .line 198
    .line 199
    .line 200
    const v5, 0x9c67

    .line 201
    .line 202
    .line 203
    invoke-static {v5, v0, v3}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 204
    .line 205
    .line 206
    :cond_4
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-eq v0, v2, :cond_6

    .line 211
    .line 212
    int-to-long v7, v2

    .line 213
    const-string v11, ""

    .line 214
    .line 215
    const/4 v12, 0x0

    .line 216
    const-string v5, "18446744073709551615"

    .line 217
    .line 218
    const/16 v6, 0x7d1

    .line 219
    .line 220
    const-wide/16 v9, -0x1

    .line 221
    .line 222
    invoke-static/range {v5 .. v12}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 223
    .line 224
    .line 225
    invoke-static {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8902(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I

    .line 226
    .line 227
    .line 228
    const-string v0, ""

    .line 229
    .line 230
    if-nez v2, :cond_5

    .line 231
    .line 232
    new-instance v5, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    const-string v6, "onAppDidBecomeActive self:"

    .line 235
    .line 236
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 240
    .line 241
    .line 242
    move-result v6

    .line 243
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    invoke-static {v4, v5, v0, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    const-string v6, "onAppEnterBackground self:"

    .line 257
    .line 258
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 262
    .line 263
    .line 264
    move-result v6

    .line 265
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-static {v4, v5, v0, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 273
    .line 274
    .line 275
    :goto_3
    const v0, 0xc351

    .line 276
    .line 277
    .line 278
    invoke-static {v0, v2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->c(II)V

    .line 279
    .line 280
    .line 281
    :cond_6
    aget v0, v1, v3

    .line 282
    .line 283
    div-int/lit8 v0, v0, 0xa

    .line 284
    .line 285
    aget v1, v1, v4

    .line 286
    .line 287
    div-int/lit8 v1, v1, 0xa

    .line 288
    .line 289
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(II)V

    .line 290
    .line 291
    .line 292
    invoke-static {}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a()V

    .line 293
    .line 294
    .line 295
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$9000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkDashBoard()V

    .line 299
    .line 300
    .line 301
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$9100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startCollectStatus()V

    .line 305
    .line 306
    .line 307
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_7

    .line 312
    .line 313
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;->checkOrientation()V

    .line 318
    .line 319
    .line 320
    :cond_7
    :goto_4
    return-void
.end method
