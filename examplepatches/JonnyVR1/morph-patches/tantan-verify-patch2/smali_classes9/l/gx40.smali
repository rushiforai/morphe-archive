.class public Ll/gx40;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;Landroid/view/View;)V
    .locals 6

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lv/VDraweeView;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->a:Lv/VDraweeView;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Landroid/widget/FrameLayout;

    .line 24
    .line 25
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->b:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/view/ViewGroup;

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lv/VDraweeView;

    .line 38
    .line 39
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->c:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Lv/VDraweeView;

    .line 52
    .line 53
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->d:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Landroid/view/ViewGroup;

    .line 60
    .line 61
    const/4 v3, 0x2

    .line 62
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Lv/VDraweeView;

    .line 67
    .line 68
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->e:Lv/VDraweeView;

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Landroid/view/ViewGroup;

    .line 75
    .line 76
    const/4 v4, 0x3

    .line 77
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 82
    .line 83
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 84
    .line 85
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Landroid/view/ViewGroup;

    .line 90
    .line 91
    const/4 v5, 0x4

    .line 92
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 97
    .line 98
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 99
    .line 100
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Landroid/view/ViewGroup;

    .line 105
    .line 106
    const/4 v5, 0x5

    .line 107
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Lv/VDraweeView;

    .line 112
    .line 113
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->h:Lv/VDraweeView;

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Landroid/view/ViewGroup;

    .line 120
    .line 121
    const/4 v5, 0x6

    .line 122
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Landroid/widget/ImageView;

    .line 127
    .line 128
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->i:Landroid/widget/ImageView;

    .line 129
    .line 130
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Landroid/view/ViewGroup;

    .line 135
    .line 136
    const/4 v5, 0x7

    .line 137
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    check-cast v2, Landroid/widget/ImageView;

    .line 142
    .line 143
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->j:Landroid/widget/ImageView;

    .line 144
    .line 145
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Landroid/view/ViewGroup;

    .line 150
    .line 151
    const/16 v5, 0x8

    .line 152
    .line 153
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Landroid/widget/ImageView;

    .line 158
    .line 159
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->k:Landroid/widget/ImageView;

    .line 160
    .line 161
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    check-cast v2, Landroid/view/ViewGroup;

    .line 166
    .line 167
    const/16 v5, 0x9

    .line 168
    .line 169
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Lv/VText;

    .line 174
    .line 175
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->l:Lv/VText;

    .line 176
    .line 177
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Landroid/view/ViewGroup;

    .line 182
    .line 183
    const/16 v5, 0xa

    .line 184
    .line 185
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    check-cast v2, Lv/VText;

    .line 190
    .line 191
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->m:Lv/VText;

    .line 192
    .line 193
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    check-cast v2, Landroid/view/ViewGroup;

    .line 198
    .line 199
    const/16 v5, 0xb

    .line 200
    .line 201
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    check-cast v2, Landroid/widget/FrameLayout;

    .line 206
    .line 207
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->n:Landroid/widget/FrameLayout;

    .line 208
    .line 209
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    check-cast v2, Landroid/view/ViewGroup;

    .line 214
    .line 215
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    check-cast v2, Landroid/view/ViewGroup;

    .line 220
    .line 221
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 226
    .line 227
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 228
    .line 229
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    check-cast v2, Landroid/view/ViewGroup;

    .line 234
    .line 235
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    check-cast v2, Landroid/view/ViewGroup;

    .line 240
    .line 241
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 246
    .line 247
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 248
    .line 249
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    check-cast v2, Landroid/view/ViewGroup;

    .line 254
    .line 255
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    check-cast v2, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    check-cast v2, Lv/VDraweeView;

    .line 266
    .line 267
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->q:Lv/VDraweeView;

    .line 268
    .line 269
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    check-cast v2, Lv/VLinear;

    .line 274
    .line 275
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->r:Lv/VLinear;

    .line 276
    .line 277
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    check-cast v2, Landroid/view/ViewGroup;

    .line 282
    .line 283
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    check-cast v2, Lv/VText;

    .line 288
    .line 289
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->s:Lv/VText;

    .line 290
    .line 291
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    check-cast v2, Landroid/view/ViewGroup;

    .line 296
    .line 297
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 302
    .line 303
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->t:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 304
    .line 305
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    check-cast v2, Lv/VLinear;

    .line 310
    .line 311
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->u:Lv/VLinear;

    .line 312
    .line 313
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    check-cast v2, Landroid/view/ViewGroup;

    .line 318
    .line 319
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    check-cast v2, Landroid/view/ViewGroup;

    .line 324
    .line 325
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    check-cast v2, Landroid/widget/ImageView;

    .line 330
    .line 331
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->v:Landroid/widget/ImageView;

    .line 332
    .line 333
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v2

    .line 337
    check-cast v2, Landroid/view/ViewGroup;

    .line 338
    .line 339
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    check-cast v0, Landroid/view/ViewGroup;

    .line 344
    .line 345
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 350
    .line 351
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->w:Lcom/tantan/library/svga/SVGAnimationView;

    .line 352
    .line 353
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    check-cast p1, Landroid/view/ViewGroup;

    .line 358
    .line 359
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    check-cast p1, Landroid/widget/TextView;

    .line 364
    .line 365
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->x:Landroid/widget/TextView;

    .line 366
    .line 367
    return-void
.end method
