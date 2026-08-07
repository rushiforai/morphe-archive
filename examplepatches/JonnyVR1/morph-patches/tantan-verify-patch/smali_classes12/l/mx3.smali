.class public Ll/mx3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static f:Ll/mx3;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Landroid/content/Context;

.field private c:Ljava/lang/String;

.field private d:Ll/ysd0;

.field private e:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "CVSDK_TAG  "

    .line 5
    .line 6
    iput-object v0, p0, Ll/mx3;->c:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/mx3;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mx3;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic b(Ll/mx3;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mx3;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/mx3;Ljava/util/List;Ll/qe00;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/mx3;->d(Ljava/util/List;Ll/qe00;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d(Ljava/util/List;Ll/qe00;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Ll/qe00;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "lclclc_"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p0, "        \u6700\u7ec8\u56de\u8c03 "

    .line 11
    .line 12
    new-array p1, v2, [Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {v1, p0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p2}, Ll/qe00;->onSuccess()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v0, " download "

    .line 22
    .line 23
    new-array v3, v2, [Ljava/lang/Object;

    .line 24
    .line 25
    invoke-static {v1, v0, v3}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/af00;->b()Ll/af00;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/mx3$d;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2}, Ll/mx3$d;-><init>(Ll/mx3;Ljava/util/List;Ll/qe00;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, [Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1, p0}, Ll/af00;->e(Ll/qe00;[Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static declared-synchronized e()Ll/mx3;
    .locals 2

    .line 1
    const-class v0, Ll/mx3;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/mx3;->f:Ll/mx3;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/mx3;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/mx3;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Ll/mx3;->f:Ll/mx3;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Ll/mx3;->f:Ll/mx3;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method private f(I)[Ljava/lang/String;
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    const-string v0, "mmcv_android_fa_model"

    .line 3
    .line 4
    if-ne p1, p0, :cond_0

    .line 5
    .line 6
    const-string p0, "mmcv_android_facedetect_model"

    .line 7
    .line 8
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x2

    .line 14
    if-ne p1, p0, :cond_1

    .line 15
    .line 16
    const-string p0, "mmcv_android_od_model"

    .line 17
    .line 18
    filled-new-array {p0}, [Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    const/16 p0, 0xc

    .line 24
    .line 25
    if-ne p1, p0, :cond_2

    .line 26
    .line 27
    const-string p0, "mmcv_android_mace_fd_model"

    .line 28
    .line 29
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_2
    const/16 p0, 0xf

    .line 35
    .line 36
    if-ne p1, p0, :cond_3

    .line 37
    .line 38
    const-string p0, "mmcv_android_fd_240_model"

    .line 39
    .line 40
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_3
    const/4 p0, 0x3

    .line 46
    if-ne p1, p0, :cond_4

    .line 47
    .line 48
    const-string p0, "mmcv_android_mace_moment_sg_model"

    .line 49
    .line 50
    filled-new-array {p0}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_4
    const/4 p0, 0x4

    .line 56
    if-ne p1, p0, :cond_5

    .line 57
    .line 58
    const-string p0, "mmcv_android_barenessdetect_model"

    .line 59
    .line 60
    filled-new-array {p0}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_5
    const/16 p0, 0x9

    .line 66
    .line 67
    if-ne p1, p0, :cond_6

    .line 68
    .line 69
    const-string p0, "mmcv_android_facerigv3_model"

    .line 70
    .line 71
    filled-new-array {p0}, [Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_6
    const/16 p0, 0xa

    .line 77
    .line 78
    if-ne p1, p0, :cond_7

    .line 79
    .line 80
    const-string p0, "mmcv_android_handgesture_model"

    .line 81
    .line 82
    filled-new-array {p0}, [Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_7
    const/4 p0, 0x5

    .line 88
    if-ne p1, p0, :cond_8

    .line 89
    .line 90
    const-string p0, "mmcv_android_bodylandmark_model"

    .line 91
    .line 92
    filled-new-array {p0}, [Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_8
    const/16 p0, 0xb

    .line 98
    .line 99
    if-ne p1, p0, :cond_9

    .line 100
    .line 101
    const-string p0, "mmcv_android_facequality_model"

    .line 102
    .line 103
    filled-new-array {p0}, [Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0

    .line 108
    :cond_9
    const/16 p0, 0xd

    .line 109
    .line 110
    if-ne p1, p0, :cond_a

    .line 111
    .line 112
    const-string p0, "mmcv_android_live_fd_model"

    .line 113
    .line 114
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_a
    const/16 p0, 0xe

    .line 120
    .line 121
    if-ne p1, p0, :cond_b

    .line 122
    .line 123
    const-string p0, "mmcv_android_face_sg_model"

    .line 124
    .line 125
    filled-new-array {p0}, [Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_b
    const/16 p0, 0x73

    .line 131
    .line 132
    if-ne p1, p0, :cond_c

    .line 133
    .line 134
    const-string p0, "mmcv_android_byte_model"

    .line 135
    .line 136
    filled-new-array {p0}, [Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_c
    const/16 p0, 0x10

    .line 142
    .line 143
    if-ne p1, p0, :cond_d

    .line 144
    .line 145
    const-string p0, "mmcv_android_222_big_fd_model"

    .line 146
    .line 147
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0

    .line 152
    :cond_d
    const/16 p0, 0x11

    .line 153
    .line 154
    if-ne p1, p0, :cond_e

    .line 155
    .line 156
    const-string p0, "mmcv_android_222_small_fd_model"

    .line 157
    .line 158
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0

    .line 163
    :cond_e
    const/16 p0, 0x12

    .line 164
    .line 165
    if-ne p1, p0, :cond_f

    .line 166
    .line 167
    const-string p0, "mmcv_android_live_bodylandmark_model"

    .line 168
    .line 169
    filled-new-array {p0}, [Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0

    .line 174
    :cond_f
    const/16 p0, 0x13

    .line 175
    .line 176
    if-ne p1, p0, :cond_10

    .line 177
    .line 178
    const-string p0, "mmcv_android_live_engine_beauty_resource_model"

    .line 179
    .line 180
    filled-new-array {p0}, [Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    return-object p0

    .line 185
    :cond_10
    const/16 p0, 0x14

    .line 186
    .line 187
    if-ne p1, p0, :cond_11

    .line 188
    .line 189
    const-string p0, "mmcv_android_cartoon_boy_model"

    .line 190
    .line 191
    filled-new-array {p0}, [Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    return-object p0

    .line 196
    :cond_11
    const/16 p0, 0x15

    .line 197
    .line 198
    if-ne p1, p0, :cond_12

    .line 199
    .line 200
    const-string p0, "mmcv_android_cartoon_girl_model"

    .line 201
    .line 202
    filled-new-array {p0}, [Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    return-object p0

    .line 207
    :cond_12
    const/16 p0, 0x16

    .line 208
    .line 209
    if-ne p1, p0, :cond_13

    .line 210
    .line 211
    const-string p0, "mmcv_android_cartoon_meiman_model"

    .line 212
    .line 213
    filled-new-array {p0}, [Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    return-object p0

    .line 218
    :cond_13
    const/16 p0, 0x17

    .line 219
    .line 220
    if-ne p1, p0, :cond_14

    .line 221
    .line 222
    const-string p0, "mmcv_android_cartoon_watercolor_model"

    .line 223
    .line 224
    filled-new-array {p0}, [Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    return-object p0

    .line 229
    :cond_14
    const/16 p0, 0x18

    .line 230
    .line 231
    if-ne p1, p0, :cond_15

    .line 232
    .line 233
    const-string p0, "mmcv_android_pick_nose_model"

    .line 234
    .line 235
    filled-new-array {p0}, [Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    return-object p0

    .line 240
    :cond_15
    const/16 p0, 0x19

    .line 241
    .line 242
    if-ne p1, p0, :cond_16

    .line 243
    .line 244
    const-string p0, "mmcv_android_cartoon_pout_model"

    .line 245
    .line 246
    filled-new-array {p0}, [Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    return-object p0

    .line 251
    :cond_16
    const/16 p0, 0x1a

    .line 252
    .line 253
    if-ne p1, p0, :cond_17

    .line 254
    .line 255
    const-string p0, "mmcv_android_cartoon_fake_laugh_model"

    .line 256
    .line 257
    filled-new-array {p0}, [Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    return-object p0

    .line 262
    :cond_17
    const/16 p0, 0x1b

    .line 263
    .line 264
    if-ne p1, p0, :cond_18

    .line 265
    .line 266
    const-string p0, "mmcv_android_hand_segment_model"

    .line 267
    .line 268
    filled-new-array {p0}, [Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    return-object p0

    .line 273
    :cond_18
    const/16 p0, 0x1c

    .line 274
    .line 275
    if-ne p1, p0, :cond_19

    .line 276
    .line 277
    const-string p0, "mmcv_android_cartoon_cry_face_model"

    .line 278
    .line 279
    filled-new-array {p0}, [Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    return-object p0

    .line 284
    :cond_19
    const/16 p0, 0x1d

    .line 285
    .line 286
    if-ne p1, p0, :cond_1a

    .line 287
    .line 288
    const-string p0, "mmcv_android_ar_gift_model"

    .line 289
    .line 290
    filled-new-array {p0}, [Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    return-object p0

    .line 295
    :cond_1a
    const/16 p0, 0x1e

    .line 296
    .line 297
    if-ne p1, p0, :cond_1b

    .line 298
    .line 299
    const-string p0, "mmcv_android_cartoon_a_project_model"

    .line 300
    .line 301
    filled-new-array {p0}, [Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    return-object p0

    .line 306
    :cond_1b
    const/16 p0, 0x1f

    .line 307
    .line 308
    if-ne p1, p0, :cond_1c

    .line 309
    .line 310
    const-string p0, "mmcv_android_stylize_face_model"

    .line 311
    .line 312
    filled-new-array {p0}, [Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p0

    .line 316
    return-object p0

    .line 317
    :cond_1c
    const/16 p0, 0x20

    .line 318
    .line 319
    if-ne p1, p0, :cond_1d

    .line 320
    .line 321
    const-string p0, "mmcv_android_small_stylize_face_model"

    .line 322
    .line 323
    filled-new-array {p0}, [Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    return-object p0

    .line 328
    :cond_1d
    const/4 p0, 0x0

    .line 329
    return-object p0
.end method

.method private j()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v1, "MMfileLog---"

    .line 5
    .line 6
    const-string v2, "registerErrorLogProxy"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/mx3$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/mx3$a;-><init>(Ll/mx3;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/mx3;->k(Ll/oe00;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public g(Landroid/content/Context;Ll/ysd0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mx3;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "CVCenter---------"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/mx3;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/ysd0;->b()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string p2, "CVCenter is init for this appid: "

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/mx3;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 p1, 0x0

    .line 40
    new-array p1, p1, [Ljava/lang/Object;

    .line 41
    .line 42
    invoke-static {v1, p0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Ll/mx3;->b:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {p2}, Ll/ysd0;->b()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/mx3;->a:Ljava/lang/String;

    .line 57
    .line 58
    new-instance p1, Ll/mx3$b;

    .line 59
    .line 60
    invoke-direct {p1, p0, p2}, Ll/mx3$b;-><init>(Ll/mx3;Ll/ysd0;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Ll/mx3;->d:Ll/ysd0;

    .line 64
    .line 65
    iget-wide v2, p2, Ll/ysd0;->a:J

    .line 66
    .line 67
    iput-wide v2, p1, Ll/ysd0;->a:J

    .line 68
    .line 69
    invoke-virtual {p2}, Ll/ysd0;->a()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    const-string p1, "the autoDownloadConfig was deprecated!It does\'t work no longer"

    .line 76
    .line 77
    invoke-static {v1, p1}, Lcom/immomo/resdownloader/log/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object p1, p0, Ll/mx3;->b:Landroid/content/Context;

    .line 81
    .line 82
    iget-object p2, p0, Ll/mx3;->d:Ll/ysd0;

    .line 83
    .line 84
    invoke-static {p1, p2}, Ll/l3d0;->d(Landroid/content/Context;Ll/ysd0;)V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0}, Ll/mx3;->j()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public h(I)Z
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/mx3;->f(I)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_3

    .line 7
    .line 8
    array-length p1, p0

    .line 9
    move v1, v0

    .line 10
    :goto_0
    if-ge v1, p1, :cond_2

    .line 11
    .line 12
    aget-object v2, p0, v1

    .line 13
    .line 14
    invoke-static {}, Ll/af00;->b()Ll/af00;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3, v2}, Ll/af00;->c(Ljava/lang/String;)Ljava/io/File;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    :goto_1
    return v0

    .line 35
    :cond_2
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_3
    const-string p0, "\u6682\u4e0d\u652f\u6301\u8be5\u7c7b\u578b:"

    .line 38
    .line 39
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    return v0
.end method

.method public varargs i(Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;[I)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    new-instance v2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_2

    .line 7
    .line 8
    array-length v0, p2

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    array-length v0, p2

    .line 12
    const/4 v1, 0x0

    .line 13
    move v3, v1

    .line 14
    :goto_0
    if-ge v3, v0, :cond_1

    .line 15
    .line 16
    aget v4, p2, v3

    .line 17
    .line 18
    invoke-direct {p0, v4}, Ll/mx3;->f(I)[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    if-eqz v5, :cond_0

    .line 23
    .line 24
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    add-int/lit8 v3, v3, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p0, "\u6682\u4e0d\u652f\u6301\u8be5\u7c7b\u578b:"

    .line 31
    .line 32
    invoke-static {p0, v4}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 39
    .line 40
    .line 41
    new-instance v3, Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/mx3;->c:Ljava/lang/String;

    .line 47
    .line 48
    const-string v4, " prepareDetector "

    .line 49
    .line 50
    new-array v1, v1, [Ljava/lang/Object;

    .line 51
    .line 52
    invoke-static {v0, v4, v1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Ll/mx3$c;

    .line 56
    .line 57
    move-object v1, p0

    .line 58
    move-object v5, p1

    .line 59
    move-object v4, p2

    .line 60
    invoke-direct/range {v0 .. v5}, Ll/mx3$c;-><init>(Ll/mx3;Ljava/util/List;Ljava/util/Map;[ILcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;)V

    .line 61
    .line 62
    .line 63
    invoke-direct {v1, v6, v0}, Ll/mx3;->d(Ljava/util/List;Ll/qe00;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    const-string p0, "\u8f93\u5165\u68c0\u6d4b\u5668\u53ef\u53d8\u53c2\u6570\u4e0d\u80fd\u4e3a\u7a7a"

    .line 68
    .line 69
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public k(Ll/oe00;)V
    .locals 0

    .line 1
    sget-object p0, Ll/ne00;->a:Ll/oe00;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sput-object p1, Ll/ne00;->a:Ll/oe00;

    .line 6
    .line 7
    :cond_0
    return-void
.end method
