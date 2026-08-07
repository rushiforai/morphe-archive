.class public Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VMarqueeText;

.field public i:Lv/VFrame;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/o2m0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getToUserInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->d:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getAvatar()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "context_single_room"

    .line 12
    .line 13
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->f:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->h:Lv/VMarqueeText;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getSubTitle()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->k:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getButtonTitle()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->j:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getGiftIcon()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v3, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->j0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->e:Lv/VImage;

    .line 56
    .line 57
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->i:Lv/VFrame;

    .line 61
    .line 62
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final j0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getToUserInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getToUserInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getAge()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/high16 v2, 0x41600000    # 14.0f

    .line 19
    .line 20
    const/16 v3, 0x10

    .line 21
    .line 22
    const/4 v4, -0x1

    .line 23
    const/high16 v5, 0x41100000    # 9.0f

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    const/high16 v7, 0x40800000    # 4.0f

    .line 27
    .line 28
    if-lez v1, :cond_2

    .line 29
    .line 30
    new-instance v1, Landroid/widget/TextView;

    .line 31
    .line 32
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 33
    .line 34
    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v8

    .line 38
    invoke-direct {v1, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 48
    .line 49
    .line 50
    const/high16 v8, 0x40000000    # 2.0f

    .line 51
    .line 52
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v9

    .line 60
    invoke-virtual {v1, v8, v6, v9, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 61
    .line 62
    .line 63
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 64
    .line 65
    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v8

    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getGender()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    const-string v10, "male"

    .line 78
    .line 79
    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    if-eqz v9, :cond_0

    .line 84
    .line 85
    sget v9, Ll/n9c0;->c1:I

    .line 86
    .line 87
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 88
    .line 89
    .line 90
    move-result v9

    .line 91
    goto :goto_0

    .line 92
    :cond_0
    sget v9, Ll/n9c0;->b1:I

    .line 93
    .line 94
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 95
    .line 96
    .line 97
    move-result v9

    .line 98
    :goto_0
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v11

    .line 102
    int-to-float v11, v11

    .line 103
    invoke-static {v9, v11}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    invoke-virtual {v1, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getGender()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v9

    .line 118
    if-eqz v9, :cond_1

    .line 119
    .line 120
    sget v9, Ll/obc0;->ea:I

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_1
    sget v9, Ll/obc0;->da:I

    .line 124
    .line 125
    :goto_1
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    const/4 v9, 0x0

    .line 130
    invoke-virtual {v1, v8, v9, v9, v9}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getAge()I

    .line 134
    .line 135
    .line 136
    move-result v8

    .line 137
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v8

    .line 141
    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 145
    .line 146
    new-instance v9, Landroid/view/ViewGroup$LayoutParams;

    .line 147
    .line 148
    sget v10, Ll/bnl0;->f:I

    .line 149
    .line 150
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v11

    .line 154
    invoke-direct {v9, v10, v11}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v8, v1, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getZodiac()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-nez v1, :cond_3

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserInfo;->getZodiac()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v0}, Ll/q8g0;->l0(Lcom/p1/mobile/putong/data/ProfileZodiac;)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    int-to-float v8, v8

    .line 187
    invoke-static {v1, v8}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    new-instance v8, Landroid/widget/TextView;

    .line 192
    .line 193
    iget-object v9, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 194
    .line 195
    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 196
    .line 197
    .line 198
    move-result-object v9

    .line 199
    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v8, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 209
    .line 210
    .line 211
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 216
    .line 217
    .line 218
    move-result v9

    .line 219
    invoke-virtual {v8, v1, v6, v9, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 223
    .line 224
    .line 225
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 226
    .line 227
    sget v9, Ll/bnl0;->f:I

    .line 228
    .line 229
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 230
    .line 231
    .line 232
    move-result v10

    .line 233
    invoke-direct {v1, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 234
    .line 235
    .line 236
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 237
    .line 238
    .line 239
    move-result v9

    .line 240
    iput v9, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 241
    .line 242
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 250
    .line 251
    invoke-virtual {v0, v8, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 252
    .line 253
    .line 254
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->hasUserTag()Z

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    if-eqz v0, :cond_4

    .line 259
    .line 260
    new-instance v0, Landroid/widget/TextView;

    .line 261
    .line 262
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 263
    .line 264
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 278
    .line 279
    .line 280
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    invoke-virtual {v0, v1, v6, v3, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getUserTag()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserTag;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserTag;->getColor()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    int-to-float v3, v3

    .line 308
    invoke-static {v1, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getUserTag()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserTag;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideUserTag;->getText()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 324
    .line 325
    .line 326
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 327
    .line 328
    sget v1, Ll/bnl0;->f:I

    .line 329
    .line 330
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 335
    .line 336
    .line 337
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 342
    .line 343
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->g:Lv/VLinear;

    .line 344
    .line 345
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 346
    .line 347
    .line 348
    :cond_4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/VirtualPayGuideV2View;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
