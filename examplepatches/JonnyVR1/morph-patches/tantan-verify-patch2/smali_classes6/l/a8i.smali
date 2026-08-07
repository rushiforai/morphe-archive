.class public Ll/a8i;
.super Ll/f7;
.source "SourceFile"

# interfaces
.implements Ll/t6i;


# instance fields
.field public a:Ll/dj70;

.field public b:Ll/lnh;


# direct methods
.method public constructor <init>(Ll/lol;Ll/dj70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f7;-><init>()V

    .line 2
    .line 3
    .line 4
    check-cast p1, Ll/lnh;

    .line 5
    .line 6
    iput-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 7
    .line 8
    iput-object p2, p0, Ll/a8i;->a:Ll/dj70;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Ll/a8i;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a8i;->u(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/a8i;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a8i;->v(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private t()Ll/lnh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a8i;->b:Ll/lnh;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b(Ll/dj70;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public c(Ll/dj70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a8i;->a:Ll/dj70;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/dj70;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a8i;->t()Ll/lnh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/lnh;->j:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    new-instance v0, Ll/w7i;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/w7i;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l(Ll/dj70;)V
    .locals 7

    .line 1
    iput-object p1, p0, Ll/a8i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    if-eqz v1, :cond_6

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 10
    .line 11
    if-eqz v0, :cond_6

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 14
    .line 15
    if-eqz v0, :cond_6

    .line 16
    .line 17
    const-string v0, "from_live_square_tab"

    .line 18
    .line 19
    iget-object v1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_6

    .line 26
    .line 27
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 28
    .line 29
    iget-object v0, v0, Ll/lnh;->o:Lv/VDraweeView;

    .line 30
    .line 31
    const/16 v1, 0x8

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 37
    .line 38
    iget-object v0, v0, Ll/lnh;->v:Lv/VImage;

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Ll/a8i;->t()Ll/lnh;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 49
    .line 50
    const-string v3, "#35d3ff"

    .line 51
    .line 52
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {v0, v4, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->c(II)V

    .line 61
    .line 62
    .line 63
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 64
    .line 65
    iget-object v3, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 66
    .line 67
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 68
    .line 69
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentAvatar:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v3}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v3, Ll/q3d0;

    .line 78
    .line 79
    invoke-direct {p0}, Ll/a8i;->t()Ll/lnh;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    iget-object v4, v4, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 84
    .line 85
    invoke-virtual {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->getAvatarSize()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    invoke-direct {p0}, Ll/a8i;->t()Ll/lnh;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    iget-object v5, v5, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 94
    .line 95
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->getAvatarSize()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    invoke-direct {v3, v4, v5}, Ll/q3d0;-><init>(II)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 111
    .line 112
    new-instance v4, Ll/x7i;

    .line 113
    .line 114
    invoke-direct {v4, p0}, Ll/x7i;-><init>(Ll/a8i;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3, v0, v4}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 121
    .line 122
    iget-object v0, v0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 128
    .line 129
    iget-object v0, v0, Ll/lnh;->j:Landroid/widget/LinearLayout;

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 135
    .line 136
    iget-object v0, v0, Ll/lnh;->k:Landroid/widget/TextView;

    .line 137
    .line 138
    const-string v3, "\u52a0\u5165"

    .line 139
    .line 140
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 144
    .line 145
    iget-object v0, v0, Ll/lnh;->k:Landroid/widget/TextView;

    .line 146
    .line 147
    const/4 v3, -0x1

    .line 148
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 152
    .line 153
    iget-object v0, v0, Ll/lnh;->k:Landroid/widget/TextView;

    .line 154
    .line 155
    const/high16 v4, 0x41400000    # 12.0f

    .line 156
    .line 157
    const/4 v5, 0x2

    .line 158
    invoke-virtual {v0, v5, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 162
    .line 163
    iget-object v0, v0, Ll/lnh;->j:Landroid/widget/LinearLayout;

    .line 164
    .line 165
    sget v4, Ll/lbc0;->y1:I

    .line 166
    .line 167
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 171
    .line 172
    iget-object v0, v0, Ll/lnh;->k:Landroid/widget/TextView;

    .line 173
    .line 174
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 179
    .line 180
    const/high16 v4, 0x42300000    # 44.0f

    .line 181
    .line 182
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 187
    .line 188
    const/high16 v4, 0x41e00000    # 28.0f

    .line 189
    .line 190
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 195
    .line 196
    iget-object v4, p0, Ll/a8i;->b:Ll/lnh;

    .line 197
    .line 198
    iget-object v4, v4, Ll/lnh;->k:Landroid/widget/TextView;

    .line 199
    .line 200
    invoke-virtual {v4, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 201
    .line 202
    .line 203
    iget-object v4, p0, Ll/a8i;->b:Ll/lnh;

    .line 204
    .line 205
    iget-object v4, v4, Ll/lnh;->k:Landroid/widget/TextView;

    .line 206
    .line 207
    const/16 v6, 0x11

    .line 208
    .line 209
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 210
    .line 211
    .line 212
    iget-object v4, p0, Ll/a8i;->b:Ll/lnh;

    .line 213
    .line 214
    iget-object v4, v4, Ll/lnh;->k:Landroid/widget/TextView;

    .line 215
    .line 216
    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 220
    .line 221
    iget-object v0, v0, Ll/lnh;->u:Landroid/widget/TextView;

    .line 222
    .line 223
    iget-object v4, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 224
    .line 225
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 226
    .line 227
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 228
    .line 229
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentName:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0}, Ll/a8i;->w()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 239
    .line 240
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 241
    .line 242
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentIsAnchor:Z

    .line 243
    .line 244
    if-nez v0, :cond_0

    .line 245
    .line 246
    move v0, v2

    .line 247
    :goto_0
    iget-object v4, p0, Ll/a8i;->b:Ll/lnh;

    .line 248
    .line 249
    iget-object v4, v4, Ll/lnh;->t:Lv/VLinear_FillerMeasure;

    .line 250
    .line 251
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 252
    .line 253
    .line 254
    move-result v4

    .line 255
    if-ge v0, v4, :cond_0

    .line 256
    .line 257
    iget-object v4, p0, Ll/a8i;->b:Ll/lnh;

    .line 258
    .line 259
    iget-object v4, v4, Ll/lnh;->t:Lv/VLinear_FillerMeasure;

    .line 260
    .line 261
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 266
    .line 267
    .line 268
    add-int/lit8 v0, v0, 0x1

    .line 269
    .line 270
    goto :goto_0

    .line 271
    :cond_0
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 272
    .line 273
    iget-object v0, v0, Ll/lnh;->u:Landroid/widget/TextView;

    .line 274
    .line 275
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 279
    .line 280
    iget-object v0, v0, Ll/lnh;->K:Lv/VLinear;

    .line 281
    .line 282
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 283
    .line 284
    .line 285
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 286
    .line 287
    iget-object v0, v0, Ll/lnh;->M:Lv/VText;

    .line 288
    .line 289
    iget-object v4, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 290
    .line 291
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 292
    .line 293
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 294
    .line 295
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentDesc:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 301
    .line 302
    iget-object v0, v0, Ll/lnh;->N:Lv/VText;

    .line 303
    .line 304
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 305
    .line 306
    .line 307
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 308
    .line 309
    iget-object v0, v0, Ll/lnh;->O:Lv/VText;

    .line 310
    .line 311
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 312
    .line 313
    .line 314
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 315
    .line 316
    iget-object v0, v0, Ll/lnh;->P:Lv/VText;

    .line 317
    .line 318
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 319
    .line 320
    .line 321
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 322
    .line 323
    iget-object v0, v0, Ll/lnh;->Q:Lv/VText;

    .line 324
    .line 325
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 326
    .line 327
    .line 328
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 329
    .line 330
    iget-object v0, v0, Ll/lnh;->G:Lv/VLinear;

    .line 331
    .line 332
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 336
    .line 337
    iget-object v0, v0, Ll/lnh;->J:Lv/VText;

    .line 338
    .line 339
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 340
    .line 341
    .line 342
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 343
    .line 344
    iget-object v0, v0, Ll/lnh;->L:Lv/VDraweeView;

    .line 345
    .line 346
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 347
    .line 348
    .line 349
    iget-object v0, p0, Ll/a8i;->b:Ll/lnh;

    .line 350
    .line 351
    iget-object v0, v0, Ll/lnh;->M:Lv/VText;

    .line 352
    .line 353
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 358
    .line 359
    const/high16 v4, 0x40800000    # 4.0f

    .line 360
    .line 361
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 366
    .line 367
    iget-object v4, p0, Ll/a8i;->b:Ll/lnh;

    .line 368
    .line 369
    iget-object v4, v4, Ll/lnh;->M:Lv/VText;

    .line 370
    .line 371
    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    .line 373
    .line 374
    iget-object p1, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 375
    .line 376
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 377
    .line 378
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 379
    .line 380
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentDescStatus:Ljava/lang/String;

    .line 381
    .line 382
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 383
    .line 384
    .line 385
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 386
    .line 387
    .line 388
    move-result v4

    .line 389
    const/4 v6, 0x1

    .line 390
    sparse-switch v4, :sswitch_data_0

    .line 391
    .line 392
    .line 393
    goto :goto_1

    .line 394
    :sswitch_0
    const-string v4, "match"

    .line 395
    .line 396
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result p1

    .line 400
    if-nez p1, :cond_1

    .line 401
    .line 402
    goto :goto_1

    .line 403
    :cond_1
    const/4 v3, 0x3

    .line 404
    goto :goto_1

    .line 405
    :sswitch_1
    const-string v4, "like"

    .line 406
    .line 407
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result p1

    .line 411
    if-nez p1, :cond_2

    .line 412
    .line 413
    goto :goto_1

    .line 414
    :cond_2
    move v3, v5

    .line 415
    goto :goto_1

    .line 416
    :sswitch_2
    const-string v4, "superLike"

    .line 417
    .line 418
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 419
    .line 420
    .line 421
    move-result p1

    .line 422
    if-nez p1, :cond_3

    .line 423
    .line 424
    goto :goto_1

    .line 425
    :cond_3
    move v3, v6

    .line 426
    goto :goto_1

    .line 427
    :sswitch_3
    const-string v4, "follow"

    .line 428
    .line 429
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    move-result p1

    .line 433
    if-nez p1, :cond_4

    .line 434
    .line 435
    goto :goto_1

    .line 436
    :cond_4
    move v3, v2

    .line 437
    :goto_1
    packed-switch v3, :pswitch_data_0

    .line 438
    .line 439
    .line 440
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 441
    .line 442
    iget-object p1, p1, Ll/lnh;->L:Lv/VDraweeView;

    .line 443
    .line 444
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 445
    .line 446
    .line 447
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 448
    .line 449
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 450
    .line 451
    iget-object p1, p1, Ll/lnh;->M:Lv/VText;

    .line 452
    .line 453
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 454
    .line 455
    .line 456
    goto :goto_2

    .line 457
    :pswitch_0
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 458
    .line 459
    iget-object p1, p1, Ll/lnh;->L:Lv/VDraweeView;

    .line 460
    .line 461
    sget v0, Ll/lbc0;->B1:I

    .line 462
    .line 463
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 464
    .line 465
    .line 466
    goto :goto_2

    .line 467
    :pswitch_1
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 468
    .line 469
    iget-object p1, p1, Ll/lnh;->L:Lv/VDraweeView;

    .line 470
    .line 471
    sget v0, Ll/lbc0;->C1:I

    .line 472
    .line 473
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 474
    .line 475
    .line 476
    goto :goto_2

    .line 477
    :pswitch_2
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 478
    .line 479
    iget-object p1, p1, Ll/lnh;->L:Lv/VDraweeView;

    .line 480
    .line 481
    sget v0, Ll/lbc0;->D1:I

    .line 482
    .line 483
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 484
    .line 485
    .line 486
    goto :goto_2

    .line 487
    :pswitch_3
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 488
    .line 489
    iget-object p1, p1, Ll/lnh;->L:Lv/VDraweeView;

    .line 490
    .line 491
    sget v0, Ll/lbc0;->A1:I

    .line 492
    .line 493
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 494
    .line 495
    .line 496
    :goto_2
    invoke-virtual {p0}, Ll/a8i;->s()Z

    .line 497
    .line 498
    .line 499
    move-result p1

    .line 500
    if-eqz p1, :cond_5

    .line 501
    .line 502
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 503
    .line 504
    iget-object p1, p1, Ll/lnh;->u:Landroid/widget/TextView;

    .line 505
    .line 506
    invoke-virtual {p0, p1}, Ll/a8i;->r(Landroid/view/View;)V

    .line 507
    .line 508
    .line 509
    :cond_5
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 510
    .line 511
    iget-object v0, p1, Ll/lnh;->m:Landroid/widget/RelativeLayout;

    .line 512
    .line 513
    iget-object p1, p1, Ll/lnh;->o:Lv/VDraweeView;

    .line 514
    .line 515
    new-array v1, v5, [Landroid/view/View;

    .line 516
    .line 517
    aput-object v0, v1, v2

    .line 518
    .line 519
    aput-object p1, v1, v6

    .line 520
    .line 521
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 522
    .line 523
    .line 524
    move-result-object p1

    .line 525
    new-instance v0, Ll/y7i;

    .line 526
    .line 527
    invoke-direct {v0, p0}, Ll/y7i;-><init>(Ll/a8i;)V

    .line 528
    .line 529
    .line 530
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 531
    .line 532
    .line 533
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 534
    .line 535
    iget-object p1, p1, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 536
    .line 537
    invoke-virtual {p0, p1}, Ll/a8i;->r(Landroid/view/View;)V

    .line 538
    .line 539
    .line 540
    iget-object p1, p0, Ll/a8i;->b:Ll/lnh;

    .line 541
    .line 542
    iget-object p1, p1, Ll/lnh;->k:Landroid/widget/TextView;

    .line 543
    .line 544
    invoke-virtual {p0, p1}, Ll/a8i;->r(Landroid/view/View;)V

    .line 545
    .line 546
    .line 547
    :cond_6
    return-void

    .line 548
    nop

    .line 549
    :sswitch_data_0
    .sparse-switch
        -0x4ba2c44f -> :sswitch_3
        -0x13daa24e -> :sswitch_2
        0x32af97 -> :sswitch_1
        0x62dd9c5 -> :sswitch_0
    .end sparse-switch

    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public m(Ll/dj70;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a8i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public r(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/z7i;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/z7i;-><init>(Ll/a8i;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final s()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/a8i;->w()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/a8i;->w()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/a8i;->w()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 24
    .line 25
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentIsAnchor:Z

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final synthetic u(Landroid/view/View;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/a8i;->b:Ll/lnh;

    .line 2
    .line 3
    iget-object v0, p2, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const-string p1, "photo"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p2, p2, Ll/lnh;->k:Landroid/widget/TextView;

    .line 11
    .line 12
    if-ne p1, p2, :cond_1

    .line 13
    .line 14
    const-string p1, "enter_room"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const-string p1, "content"

    .line 18
    .line 19
    :goto_0
    iget-object p2, p0, Ll/a8i;->a:Ll/dj70;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/a8i;->q()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Ll/a8i;->w()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {p2, v0, v1}, Ll/u6i;->d(Ll/dj70;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/a8i;->w()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object v0, p0, Ll/a8i;->a:Ll/dj70;

    .line 37
    .line 38
    iget v1, v0, Ll/dj70;->h:I

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v2, p0, Ll/a8i;->a:Ll/dj70;

    .line 49
    .line 50
    iget-object v2, v2, Ll/dj70;->b:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v2}, Ll/o7i;->t(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {p2, v1, v0, v2, p1}, Ll/dug;->k(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/a8i;->w()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p0, p0, Ll/a8i;->a:Ll/dj70;

    .line 64
    .line 65
    iget-object p2, p0, Ll/dj70;->b:Ljava/lang/String;

    .line 66
    .line 67
    iget-boolean p0, p0, Ll/dj70;->c:Z

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    invoke-static {p1, p2, p0, v0}, Ll/dug;->g(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic v(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a8i;->t()Ll/lnh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->setAvatar(Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a8i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    return-object p0
.end method
