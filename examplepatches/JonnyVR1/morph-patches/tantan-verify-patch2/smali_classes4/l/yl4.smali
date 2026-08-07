.class public Ll/yl4;
.super Ll/h4;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h4;-><init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/yl4;Lcom/p1/mobile/putong/data/UserLiveState;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yl4;->o(Lcom/p1/mobile/putong/data/UserLiveState;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/yl4;Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yl4;->n(Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o2:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o2:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    move v0, v2

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v0, v1

    .line 34
    :goto_0
    invoke-static {}, Ll/vq8;->b()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_3

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-interface {v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v3}, Ll/hbs;->f()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    invoke-static {}, Ll/gra;->L3()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 65
    .line 66
    sget-object v3, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE_PREVIEW:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 67
    .line 68
    if-eq v0, v3, :cond_3

    .line 69
    .line 70
    :cond_1
    iget-object p0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 75
    .line 76
    if-ne p0, v0, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    return v2

    .line 80
    :cond_3
    :goto_1
    return v1
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live"

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 6

    .line 1
    invoke-static {}, Ll/d79;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/rql;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/rql;->b0()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/rql;->E()Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/rql;->E()Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/h4;->c:Ll/rql;

    .line 46
    .line 47
    invoke-interface {v2}, Ll/rql;->getCardView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    iget-object v3, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object v4, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 60
    .line 61
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 62
    .line 63
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->getCurrentLive()Lcom/p1/mobile/putong/data/Live;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    new-instance v5, Ll/wl4;

    .line 68
    .line 69
    invoke-direct {v5, p0, v0}, Ll/wl4;-><init>(Ll/yl4;Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Live;Ll/x20;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    return v1

    .line 76
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v3, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {v0, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->lt(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveState;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v4, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 93
    .line 94
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-interface {v3, v4}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zl(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 97
    .line 98
    .line 99
    iget-object v3, p0, Ll/h4;->c:Ll/rql;

    .line 100
    .line 101
    invoke-interface {v3}, Ll/rql;->u0()Lv/VText;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 106
    .line 107
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 108
    .line 109
    .line 110
    iget-object v3, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    if-eqz v3, :cond_7

    .line 113
    .line 114
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-nez v3, :cond_7

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    iget-object v4, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 127
    .line 128
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 129
    .line 130
    invoke-interface {v3, v4}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-nez v3, :cond_3

    .line 139
    .line 140
    goto/16 :goto_2

    .line 141
    .line 142
    :cond_3
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 143
    .line 144
    invoke-interface {v1}, Ll/rql;->u0()Lv/VText;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    instance-of v1, v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 153
    .line 154
    if-eqz v1, :cond_4

    .line 155
    .line 156
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 157
    .line 158
    invoke-interface {v1}, Ll/rql;->u0()Lv/VText;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 167
    .line 168
    const/high16 v3, 0x41900000    # 18.0f

    .line 169
    .line 170
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 175
    .line 176
    iget-object v3, p0, Ll/h4;->c:Ll/rql;

    .line 177
    .line 178
    invoke-interface {v3}, Ll/rql;->u0()Lv/VText;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 186
    .line 187
    invoke-interface {v1}, Ll/rql;->m0()Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 192
    .line 193
    .line 194
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 195
    .line 196
    invoke-interface {v1}, Ll/rql;->r0()Lcom/tantan/library/svga/SVGAnimationView;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v1}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-nez v1, :cond_5

    .line 205
    .line 206
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 207
    .line 208
    invoke-interface {v1}, Ll/rql;->getCardView()Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    const-string v3, "https://auto.tancdn.com/v1/raw/b83d11f9-6b88-41a2-a0dd-c3617bde118510.so"

    .line 221
    .line 222
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    iget-object v3, p0, Ll/h4;->c:Ll/rql;

    .line 227
    .line 228
    invoke-interface {v3}, Ll/rql;->r0()Lcom/tantan/library/svga/SVGAnimationView;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 233
    .line 234
    .line 235
    :cond_5
    iget-object v1, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 236
    .line 237
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 238
    .line 239
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 240
    .line 241
    iget-object v1, v1, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->onGoingMultiCallId:Ljava/lang/String;

    .line 242
    .line 243
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    iget-object v3, p0, Ll/h4;->c:Ll/rql;

    .line 248
    .line 249
    if-nez v1, :cond_6

    .line 250
    .line 251
    invoke-interface {v3}, Ll/rql;->u0()Lv/VText;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    sget v3, Lcom/p1/mobile/putong/core/R$string;->yh:I

    .line 256
    .line 257
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 258
    .line 259
    .line 260
    goto :goto_1

    .line 261
    :cond_6
    invoke-interface {v3}, Ll/rql;->u0()Lv/VText;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    sget v3, Lcom/p1/mobile/putong/core/R$string;->xh:I

    .line 266
    .line 267
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 268
    .line 269
    .line 270
    :goto_1
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 271
    .line 272
    invoke-interface {v1}, Ll/rql;->m0()Landroid/view/View;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    sget v3, Ll/dbc0;->y2:I

    .line 277
    .line 278
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 279
    .line 280
    .line 281
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 282
    .line 283
    invoke-interface {v1}, Ll/rql;->m0()Landroid/view/View;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    new-instance v3, Ll/xl4;

    .line 288
    .line 289
    invoke-direct {v3, p0, v0}, Ll/xl4;-><init>(Ll/yl4;Lcom/p1/mobile/putong/data/UserLiveState;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    .line 294
    .line 295
    return v2

    .line 296
    :cond_7
    :goto_2
    return v1
.end method

.method public final m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;)Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserLiveState;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->onGoingMultiCallId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "liveId"

    .line 32
    .line 33
    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    const-string v1, "anchorId"

    .line 37
    .line 38
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    const-string p1, "index"

    .line 44
    .line 45
    const-string v1, "NA"

    .line 46
    .line 47
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    const-string p1, "module"

    .line 51
    .line 52
    const-string v1, "page"

    .line 53
    .line 54
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string p1, "trace_id"

    .line 58
    .line 59
    const-string v1, ""

    .line 60
    .line 61
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    if-eqz p2, :cond_1

    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/UserLiveState;->isLiveOpened()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    const-string p1, "on"

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    const-string p1, "off"

    .line 76
    .line 77
    :goto_1
    const-string p2, "live_status"

    .line 78
    .line 79
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    const-string p1, "right_recommend_type"

    .line 83
    .line 84
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    const-string v1, "\u8fde\u7ebf"

    .line 90
    .line 91
    :cond_2
    const-string p1, "show_label"

    .line 92
    .line 93
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    const-string p1, "liveRecommendCategory"

    .line 97
    .line 98
    const-string p2, "basic"

    .line 99
    .line 100
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    return-object p0
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/newui/home/livewindow/IntlLiveSmallWindow;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0}, Ll/rql;->setCloseSmallWindow(Z)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/data/UserLiveState;Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L6(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/rql;->getCardView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "suggest-card"

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-interface {p2, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    invoke-virtual {p0, p2, p1}, Ll/yl4;->m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;)Ljava/util/HashMap;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "e_live_room_enter"

    .line 55
    .line 56
    const-string p2, "p_suggest_users_home_view"

    .line 57
    .line 58
    invoke-static {p1, p2, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
