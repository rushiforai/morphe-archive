.class public Ll/e8k0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/d8k0;Landroid/view/View;)V
    .locals 9

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/d8k0;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Ll/d8k0;->l:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroid/widget/FrameLayout;

    .line 21
    .line 22
    iput-object v2, p0, Ll/d8k0;->m:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 35
    .line 36
    iput-object v2, p0, Ll/d8k0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Landroid/view/ViewGroup;

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lv/VImage;

    .line 50
    .line 51
    iput-object v2, p0, Ll/d8k0;->o:Lv/VImage;

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Landroid/view/ViewGroup;

    .line 58
    .line 59
    const/4 v4, 0x2

    .line 60
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 65
    .line 66
    iput-object v2, p0, Ll/d8k0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 67
    .line 68
    const/4 v2, 0x4

    .line 69
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 74
    .line 75
    iput-object v5, p0, Ll/d8k0;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 76
    .line 77
    const/4 v5, 0x5

    .line 78
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 83
    .line 84
    iput-object v6, p0, Ll/d8k0;->r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 85
    .line 86
    const/4 v6, 0x6

    .line 87
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    check-cast v7, Lv/VLinear;

    .line 92
    .line 93
    iput-object v7, p0, Ll/d8k0;->s:Lv/VLinear;

    .line 94
    .line 95
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    check-cast v7, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 106
    .line 107
    iput-object v7, p0, Ll/d8k0;->t:Lcom/p1/mobile/putong/live/livingroom/view/CardUserLevelView;

    .line 108
    .line 109
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    check-cast v7, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

    .line 120
    .line 121
    iput-object v7, p0, Ll/d8k0;->u:Lcom/p1/mobile/putong/live/livingroom/view/CardAnchorLevelView;

    .line 122
    .line 123
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    check-cast v7, Landroid/view/ViewGroup;

    .line 128
    .line 129
    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 134
    .line 135
    iput-object v7, p0, Ll/d8k0;->v:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 136
    .line 137
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v7

    .line 141
    check-cast v7, Landroid/view/ViewGroup;

    .line 142
    .line 143
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 148
    .line 149
    iput-object v7, p0, Ll/d8k0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 150
    .line 151
    const/4 v7, 0x7

    .line 152
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    check-cast v8, Landroid/widget/LinearLayout;

    .line 157
    .line 158
    iput-object v8, p0, Ll/d8k0;->x:Landroid/widget/LinearLayout;

    .line 159
    .line 160
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    check-cast v7, Landroid/view/ViewGroup;

    .line 165
    .line 166
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v7

    .line 170
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 171
    .line 172
    iput-object v7, p0, Ll/d8k0;->y:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 173
    .line 174
    const/16 v7, 0x8

    .line 175
    .line 176
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;

    .line 181
    .line 182
    iput-object v7, p0, Ll/d8k0;->z:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;

    .line 183
    .line 184
    const/16 v7, 0x9

    .line 185
    .line 186
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 191
    .line 192
    iput-object v7, p0, Ll/d8k0;->A:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardContributionView;

    .line 193
    .line 194
    const/16 v7, 0xa

    .line 195
    .line 196
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    check-cast v7, Lv/VText;

    .line 201
    .line 202
    iput-object v7, p0, Ll/d8k0;->B:Lv/VText;

    .line 203
    .line 204
    const/16 v7, 0xb

    .line 205
    .line 206
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v8

    .line 210
    check-cast v8, Landroid/widget/LinearLayout;

    .line 211
    .line 212
    iput-object v8, p0, Ll/d8k0;->C:Landroid/widget/LinearLayout;

    .line 213
    .line 214
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    check-cast v8, Landroid/view/ViewGroup;

    .line 219
    .line 220
    invoke-virtual {v8, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v8

    .line 224
    check-cast v8, Lv/VText;

    .line 225
    .line 226
    iput-object v8, p0, Ll/d8k0;->D:Lv/VText;

    .line 227
    .line 228
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v8

    .line 232
    check-cast v8, Landroid/view/ViewGroup;

    .line 233
    .line 234
    invoke-virtual {v8, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v8

    .line 238
    check-cast v8, Lv/VText;

    .line 239
    .line 240
    iput-object v8, p0, Ll/d8k0;->E:Lv/VText;

    .line 241
    .line 242
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 243
    .line 244
    .line 245
    move-result-object v8

    .line 246
    check-cast v8, Landroid/view/ViewGroup;

    .line 247
    .line 248
    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    check-cast v4, Lv/VText;

    .line 253
    .line 254
    iput-object v4, p0, Ll/d8k0;->F:Lv/VText;

    .line 255
    .line 256
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    check-cast v4, Landroid/view/ViewGroup;

    .line 261
    .line 262
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    check-cast v1, Lv/VText;

    .line 267
    .line 268
    iput-object v1, p0, Ll/d8k0;->G:Lv/VText;

    .line 269
    .line 270
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    check-cast v1, Landroid/view/ViewGroup;

    .line 275
    .line 276
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    check-cast v1, Lv/VText;

    .line 281
    .line 282
    iput-object v1, p0, Ll/d8k0;->H:Lv/VText;

    .line 283
    .line 284
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    check-cast v1, Landroid/view/ViewGroup;

    .line 289
    .line 290
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    check-cast v1, Lv/VText;

    .line 295
    .line 296
    iput-object v1, p0, Ll/d8k0;->I:Lv/VText;

    .line 297
    .line 298
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    check-cast v1, Landroid/view/ViewGroup;

    .line 303
    .line 304
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    check-cast v1, Lv/VText;

    .line 309
    .line 310
    iput-object v1, p0, Ll/d8k0;->J:Lv/VText;

    .line 311
    .line 312
    const/16 v1, 0xc

    .line 313
    .line 314
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    iput-object v1, p0, Ll/d8k0;->K:Landroid/view/View;

    .line 319
    .line 320
    const/16 v1, 0xd

    .line 321
    .line 322
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    check-cast v1, Lv/VImage;

    .line 327
    .line 328
    iput-object v1, p0, Ll/d8k0;->L:Lv/VImage;

    .line 329
    .line 330
    const/16 v1, 0xe

    .line 331
    .line 332
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v2

    .line 336
    check-cast v2, Landroid/view/ViewGroup;

    .line 337
    .line 338
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    check-cast v0, Lv/VText;

    .line 343
    .line 344
    iput-object v0, p0, Ll/d8k0;->M:Lv/VText;

    .line 345
    .line 346
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    check-cast v0, Landroid/view/ViewGroup;

    .line 351
    .line 352
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    check-cast v0, Lv/VText;

    .line 357
    .line 358
    iput-object v0, p0, Ll/d8k0;->N:Lv/VText;

    .line 359
    .line 360
    const/16 v0, 0xf

    .line 361
    .line 362
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    check-cast p1, Lv/VText;

    .line 367
    .line 368
    iput-object p1, p0, Ll/d8k0;->O:Lv/VText;

    .line 369
    .line 370
    return-void
.end method
