.class public Ll/f6p0;
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

.method public static a(Ll/e6p0;Landroid/view/View;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/e6p0;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    iput-object v1, p0, Ll/e6p0;->l:Landroid/view/View;

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
    iput-object v2, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

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
    iput-object v2, p0, Ll/e6p0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

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
    iput-object v2, p0, Ll/e6p0;->o:Lv/VImage;

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 59
    .line 60
    iput-object v4, p0, Ll/e6p0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 61
    .line 62
    const/4 v4, 0x5

    .line 63
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 68
    .line 69
    iput-object v4, p0, Ll/e6p0;->q:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 70
    .line 71
    const/4 v4, 0x6

    .line 72
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    check-cast v5, Lv/VFrame;

    .line 77
    .line 78
    iput-object v5, p0, Ll/e6p0;->r:Lv/VFrame;

    .line 79
    .line 80
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    check-cast v5, Landroid/view/ViewGroup;

    .line 85
    .line 86
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    check-cast v5, Lv/VLinear;

    .line 91
    .line 92
    iput-object v5, p0, Ll/e6p0;->s:Lv/VLinear;

    .line 93
    .line 94
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    check-cast v5, Landroid/view/ViewGroup;

    .line 99
    .line 100
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    check-cast v5, Landroid/view/ViewGroup;

    .line 105
    .line 106
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 111
    .line 112
    iput-object v5, p0, Ll/e6p0;->t:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 113
    .line 114
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Landroid/view/ViewGroup;

    .line 119
    .line 120
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    check-cast v5, Landroid/view/ViewGroup;

    .line 125
    .line 126
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;

    .line 131
    .line 132
    iput-object v5, p0, Ll/e6p0;->u:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;

    .line 133
    .line 134
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    check-cast v5, Landroid/view/ViewGroup;

    .line 139
    .line 140
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    check-cast v5, Landroid/view/ViewGroup;

    .line 145
    .line 146
    const/4 v6, 0x2

    .line 147
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

    .line 152
    .line 153
    iput-object v5, p0, Ll/e6p0;->v:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

    .line 154
    .line 155
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    check-cast v5, Landroid/view/ViewGroup;

    .line 160
    .line 161
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    check-cast v5, Landroid/view/ViewGroup;

    .line 166
    .line 167
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

    .line 172
    .line 173
    iput-object v5, p0, Ll/e6p0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

    .line 174
    .line 175
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    check-cast v4, Landroid/view/ViewGroup;

    .line 180
    .line 181
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    check-cast v4, Landroid/view/ViewGroup;

    .line 186
    .line 187
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 192
    .line 193
    iput-object v2, p0, Ll/e6p0;->x:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 194
    .line 195
    const/4 v2, 0x7

    .line 196
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 201
    .line 202
    iput-object v2, p0, Ll/e6p0;->y:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 203
    .line 204
    const/16 v2, 0x8

    .line 205
    .line 206
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    check-cast v4, Landroid/widget/LinearLayout;

    .line 211
    .line 212
    iput-object v4, p0, Ll/e6p0;->z:Landroid/widget/LinearLayout;

    .line 213
    .line 214
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    check-cast v2, Landroid/view/ViewGroup;

    .line 219
    .line 220
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 225
    .line 226
    iput-object v2, p0, Ll/e6p0;->A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 227
    .line 228
    const/16 v2, 0x9

    .line 229
    .line 230
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    check-cast v4, Landroid/widget/LinearLayout;

    .line 235
    .line 236
    iput-object v4, p0, Ll/e6p0;->B:Landroid/widget/LinearLayout;

    .line 237
    .line 238
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    check-cast v4, Landroid/view/ViewGroup;

    .line 243
    .line 244
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    check-cast v0, Lv/VText;

    .line 249
    .line 250
    iput-object v0, p0, Ll/e6p0;->C:Lv/VText;

    .line 251
    .line 252
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    check-cast v0, Landroid/view/ViewGroup;

    .line 257
    .line 258
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    check-cast v0, Lv/VText;

    .line 263
    .line 264
    iput-object v0, p0, Ll/e6p0;->D:Lv/VText;

    .line 265
    .line 266
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    check-cast v0, Landroid/view/ViewGroup;

    .line 271
    .line 272
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    check-cast v0, Lv/VText;

    .line 277
    .line 278
    iput-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 279
    .line 280
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    check-cast v0, Landroid/view/ViewGroup;

    .line 285
    .line 286
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    check-cast v0, Lv/VText;

    .line 291
    .line 292
    iput-object v0, p0, Ll/e6p0;->F:Lv/VText;

    .line 293
    .line 294
    const/16 v0, 0xa

    .line 295
    .line 296
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    check-cast v0, Lv/VImage;

    .line 301
    .line 302
    iput-object v0, p0, Ll/e6p0;->G:Lv/VImage;

    .line 303
    .line 304
    const/16 v0, 0xb

    .line 305
    .line 306
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    check-cast v0, Lv/VText;

    .line 311
    .line 312
    iput-object v0, p0, Ll/e6p0;->H:Lv/VText;

    .line 313
    .line 314
    const/16 v0, 0xc

    .line 315
    .line 316
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    iput-object v0, p0, Ll/e6p0;->I:Landroid/view/View;

    .line 321
    .line 322
    const/16 v0, 0xd

    .line 323
    .line 324
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 329
    .line 330
    iput-object v0, p0, Ll/e6p0;->J:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 331
    .line 332
    const/16 v0, 0xe

    .line 333
    .line 334
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    check-cast p1, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 339
    .line 340
    iput-object p1, p0, Ll/e6p0;->K:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 341
    .line 342
    return-void
.end method
