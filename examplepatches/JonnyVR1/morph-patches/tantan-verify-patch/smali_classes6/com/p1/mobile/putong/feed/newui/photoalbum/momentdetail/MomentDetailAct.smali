.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;
    }
.end annotation


# static fields
.field public static h:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public c:Ll/in00;

.field public d:Z

.field public e:Ll/ym00;

.field public f:Landroid/os/Bundle;

.field public g:Landroid/widget/PopupWindow;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->h:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->h:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v1, Ll/pf60;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private Z1()V
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/widget/PopupWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/tec0;->r2:I

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 39
    .line 40
    invoke-virtual {p0, v4}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static d2(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "album"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v2, "topic_latest"

    .line 18
    .line 19
    const-string v3, "qa_latest"

    .line 20
    .line 21
    const-string v4, "push"

    .line 22
    .line 23
    const-string v5, "chat"

    .line 24
    .line 25
    const-string v6, "qa_recommend"

    .line 26
    .line 27
    const-string v7, "topic_recommend"

    .line 28
    .line 29
    const/4 v8, -0x1

    .line 30
    sparse-switch v0, :sswitch_data_0

    .line 31
    .line 32
    .line 33
    goto/16 :goto_0

    .line 34
    .line 35
    :sswitch_0
    const-string v0, "from_topic_official"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :cond_1
    const/16 v8, 0x12

    .line 46
    .line 47
    goto/16 :goto_0

    .line 48
    .line 49
    :sswitch_1
    const-string v0, "from_nearby_focus"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_2

    .line 56
    .line 57
    goto/16 :goto_0

    .line 58
    .line 59
    :cond_2
    const/16 v8, 0x11

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :sswitch_2
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_3

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :cond_3
    const/16 v8, 0x10

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :sswitch_3
    const-string v0, "from_h5_topic_aggregation"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-nez p0, :cond_4

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :cond_4
    const/16 v8, 0xf

    .line 86
    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :sswitch_4
    const-string v0, "push_new_moment"

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_5

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :cond_5
    const/16 v8, 0xe

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :sswitch_5
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_6

    .line 108
    .line 109
    goto/16 :goto_0

    .line 110
    .line 111
    :cond_6
    const/16 v8, 0xd

    .line 112
    .line 113
    goto/16 :goto_0

    .line 114
    .line 115
    :sswitch_6
    const-string v0, "from_nearby_falls_feed"

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-nez p0, :cond_7

    .line 122
    .line 123
    goto/16 :goto_0

    .line 124
    .line 125
    :cond_7
    const/16 v8, 0xc

    .line 126
    .line 127
    goto/16 :goto_0

    .line 128
    .line 129
    :sswitch_7
    const-string v0, "aggregate_page"

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_8

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_8
    const/16 v8, 0xb

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :sswitch_8
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-nez p0, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v8, 0xa

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_9
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-nez p0, :cond_a

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_a
    const/16 v8, 0x9

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :sswitch_a
    const-string v0, "from_video_flow"

    .line 168
    .line 169
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-nez p0, :cond_b

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_b
    const/16 v8, 0x8

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :sswitch_b
    const-string v0, "from_topic_nearby_header"

    .line 181
    .line 182
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-nez p0, :cond_c

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_c
    const/4 v8, 0x7

    .line 190
    goto :goto_0

    .line 191
    :sswitch_c
    const-string v0, "p_live_moment_article_detail"

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    if-nez p0, :cond_d

    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_d
    const/4 v8, 0x6

    .line 201
    goto :goto_0

    .line 202
    :sswitch_d
    const-string v0, "from_topic_aggregation"

    .line 203
    .line 204
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    if-nez p0, :cond_e

    .line 209
    .line 210
    goto :goto_0

    .line 211
    :cond_e
    const/4 v8, 0x5

    .line 212
    goto :goto_0

    .line 213
    :sswitch_e
    const-string v0, "from_qa_topic_aggregation"

    .line 214
    .line 215
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-nez p0, :cond_f

    .line 220
    .line 221
    goto :goto_0

    .line 222
    :cond_f
    const/4 v8, 0x4

    .line 223
    goto :goto_0

    .line 224
    :sswitch_f
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    if-nez p0, :cond_10

    .line 229
    .line 230
    goto :goto_0

    .line 231
    :cond_10
    const/4 v8, 0x3

    .line 232
    goto :goto_0

    .line 233
    :sswitch_10
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-nez p0, :cond_11

    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_11
    const/4 v8, 0x2

    .line 241
    goto :goto_0

    .line 242
    :sswitch_11
    const-string v0, "from_activities_moment"

    .line 243
    .line 244
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    if-nez p0, :cond_12

    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_12
    const/4 v8, 0x1

    .line 252
    goto :goto_0

    .line 253
    :sswitch_12
    const-string v0, "from_no_topic_aggregation_list"

    .line 254
    .line 255
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    if-nez p0, :cond_13

    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_13
    const/4 v8, 0x0

    .line 263
    :goto_0
    packed-switch v8, :pswitch_data_0

    .line 264
    .line 265
    .line 266
    return-object v1

    .line 267
    :pswitch_0
    const-string p0, "follow"

    .line 268
    .line 269
    return-object p0

    .line 270
    :pswitch_1
    return-object v2

    .line 271
    :pswitch_2
    return-object v3

    .line 272
    :pswitch_3
    const-string p0, "nearby"

    .line 273
    .line 274
    return-object p0

    .line 275
    :pswitch_4
    const-string p0, "music"

    .line 276
    .line 277
    return-object p0

    .line 278
    :pswitch_5
    return-object v4

    .line 279
    :pswitch_6
    return-object v5

    .line 280
    :pswitch_7
    const-string p0, "live_moment_video"

    .line 281
    .line 282
    return-object p0

    .line 283
    :pswitch_8
    const-string p0, "live_moment_article"

    .line 284
    .line 285
    return-object p0

    .line 286
    :pswitch_9
    return-object v6

    .line 287
    :pswitch_a
    return-object v7

    .line 288
    :pswitch_b
    const-string p0, "activity"

    .line 289
    .line 290
    return-object p0

    .line 291
    :pswitch_c
    const-string p0, "topic_detail"

    .line 292
    .line 293
    return-object p0

    .line 294
    nop

    .line 295
    :sswitch_data_0
    .sparse-switch
        -0x778b4f2c -> :sswitch_12
        -0x63ad66c3 -> :sswitch_11
        -0x61919654 -> :sswitch_10
        -0x4db73ab3 -> :sswitch_f
        -0x45ca9728 -> :sswitch_e
        -0x3ed15183 -> :sswitch_d
        -0x3681c20b -> :sswitch_c
        -0x2d58bad8 -> :sswitch_b
        -0xbf315d9 -> :sswitch_a
        0x2e9358 -> :sswitch_9
        0x34af1a -> :sswitch_8
        0x101dd0f -> :sswitch_7
        0x13a81d90 -> :sswitch_6
        0x2dcf8c96 -> :sswitch_5
        0x323ad3c4 -> :sswitch_4
        0x3c3c1255 -> :sswitch_3
        0x47385c97 -> :sswitch_2
        0x4aa45d8d -> :sswitch_1
        0x5b0c3130 -> :sswitch_0
    .end sparse-switch

    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_c
        :pswitch_c
        :pswitch_8
        :pswitch_c
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_c
        :pswitch_1
        :pswitch_0
        :pswitch_c
    .end packed-switch
.end method

.method private synthetic e2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/cmg;->z()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g2()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->a2()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    if-ne p1, v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/cmg;->z()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g2()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ym00;->o:Ljava/lang/Runnable;

    .line 48
    .line 49
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    sget-object p0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 54
    .line 55
    if-ne p1, p0, :cond_2

    .line 56
    .line 57
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 58
    .line 59
    iget-object p0, p0, Ll/jka;->f0:Ljava/util/Map;

    .line 60
    .line 61
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public static g2()Z
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    const/16 v1, 0x1c

    .line 8
    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    :cond_0
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "HONOR"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    const-string v1, "HUAWEI"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    return v0

    .line 32
    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 33
    return v0
.end method


# virtual methods
.method public a2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public b2()Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 2
    .line 3
    iget-object p0, p0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 4
    .line 5
    return-object p0
.end method

.method public c2(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :cond_1
    return-object p0
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cmg;->H()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 19
    .line 20
    iget-object v0, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 29
    .line 30
    iget-object v0, v0, Ll/ym00;->d:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 33
    .line 34
    iget-object p0, p0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->Q4()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->l5(Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public h2(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 7
    .line 8
    const-string v2, "moment_id"

    .line 9
    .line 10
    iget-object v0, v0, Ll/ym00;->c:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v2, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 17
    .line 18
    iget-object v2, v2, Ll/ym00;->d:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "owner_id"

    .line 21
    .line 22
    invoke-static {v3, v2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    const-string p1, ""

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    const-string v3, "moment_type"

    .line 40
    .line 41
    invoke-static {v3, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ym00;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->d2(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string v3, "moment_detail_showfrom"

    .line 54
    .line 55
    invoke-static {v3, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    filled-new-array {v0, v2, p1, p0}, [Ll/tfj0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v1, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/in00;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Ll/cmg;->z()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    new-instance v0, Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/uh00;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/uh00;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g2()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->Z1()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 3

    .line 1
    new-instance v0, Ll/in00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/in00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 7
    .line 8
    new-instance v0, Ll/ym00;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/ym00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "isFromFeed"

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->d:Z

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->f:Landroid/os/Bundle;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ll/ym00;->l0(Landroid/os/Bundle;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 42
    .line 43
    .line 44
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ym00;->a0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/th00;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/th00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public isAnonymousMode()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 10
    .line 11
    iget-object v0, v0, Ll/ym00;->b:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "push_new_moment"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->isAnonymousMode()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e9

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->finish()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 10
    .line 11
    iget-object v0, v0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c:Ll/in00;

    .line 20
    .line 21
    iget-object p0, p0, Ll/in00;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->o()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onRestoreGlobalState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onRestoreGlobalState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->f:Landroid/os/Bundle;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ym00;->l0(Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onSaveGlobalState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveGlobalState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ym00;->m0(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cmg;->z()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g2()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 35
    .line 36
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->g:Landroid/widget/PopupWindow;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_user_moment_interactions_details_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 5
    .line 6
    iget-object p1, p1, Ll/ym00;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->c2(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->e:Ll/ym00;

    .line 15
    .line 16
    iget-object v0, v0, Ll/ym00;->g:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    if-nez p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "lastPageAvailableMoment"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->h2(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
