.class public abstract Ll/vuy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/ruy;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/vuy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuy;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/vuy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuy;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/fwy;Ll/clz;Ll/ruy;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/d3z;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/d3z;->u0()Ll/azy;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/azy;->d0()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C5:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0}, Ll/r97;->i()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/clz;->i3()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/api/g;->Mf(Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Ll/r97;->v5()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_2

    .line 75
    .line 76
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/clz;->i3()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/api/g;->Cf(Ljava/lang/String;)Lrx/c;

    .line 85
    .line 86
    .line 87
    :cond_2
    const/4 p0, 0x0

    .line 88
    new-array p0, p0, [Ll/sfj0$a;

    .line 89
    .line 90
    const-string p3, "e_chat_more_voice_call"

    .line 91
    .line 92
    const-string v0, "p_chat_view"

    .line 93
    .line 94
    invoke-static {p3, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    const-string p3, "voice_entry_actionbar"

    .line 102
    .line 103
    invoke-virtual {p0, p3}, Ll/qzm0;->o(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p2}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const-string p3, ""

    .line 119
    .line 120
    invoke-virtual {p0, p2, p1, p3}, Ll/xzm0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method


# virtual methods
.method public d(Ll/ruy;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v3, v4}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v3}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 41
    .line 42
    const/high16 v4, 0x3f800000    # 1.0f

    .line 43
    .line 44
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    neg-int v4, v4

    .line 49
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    sget v3, Ll/edc0;->M1:I

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    const/high16 v5, 0x42700000    # 60.0f

    .line 73
    .line 74
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    const/4 v4, -0x1

    .line 96
    iput v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 97
    .line 98
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    new-instance v3, Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    sget v6, Ll/qec0;->S4:I

    .line 115
    .line 116
    const/4 v7, 0x0

    .line 117
    const/4 v8, 0x0

    .line 118
    invoke-virtual {v5, v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    check-cast v5, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 123
    .line 124
    iget-object v6, p0, Ll/vuy;->a:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 127
    .line 128
    .line 129
    iget-object v6, p0, Ll/vuy;->a:Ljava/util/List;

    .line 130
    .line 131
    invoke-interface {v6, v8, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    .line 135
    .line 136
    invoke-direct {v6, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    new-instance v1, Lv/VIcon;

    .line 146
    .line 147
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-direct {v1, v4}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 152
    .line 153
    .line 154
    const/4 v4, 0x4

    .line 155
    invoke-virtual {v1, v4}, Lv/VIcon;->setIconStyle(I)V

    .line 156
    .line 157
    .line 158
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    if-eqz v5, :cond_0

    .line 171
    .line 172
    sget v5, Ll/ibc0;->k4:I

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_0
    sget v5, Ll/ibc0;->j4:I

    .line 176
    .line 177
    :goto_0
    invoke-virtual {v1, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 178
    .line 179
    .line 180
    const-string v5, "settingMenuTag"

    .line 181
    .line 182
    invoke-virtual {v1, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    invoke-virtual {v5}, Ll/xzm0;->s()Z

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-eqz v5, :cond_2

    .line 197
    .line 198
    instance-of v5, p0, Ll/hwy;

    .line 199
    .line 200
    if-eqz v5, :cond_2

    .line 201
    .line 202
    const/4 v5, 0x1

    .line 203
    invoke-virtual {p0, v5}, Ll/vuy;->s(Z)Z

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    if-eqz v5, :cond_2

    .line 208
    .line 209
    instance-of v5, v0, Ll/jlz;

    .line 210
    .line 211
    if-nez v5, :cond_2

    .line 212
    .line 213
    iget-object v0, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 214
    .line 215
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 216
    .line 217
    const-string v5, "fake_one_side_no_match"

    .line 218
    .line 219
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-nez v0, :cond_2

    .line 224
    .line 225
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 230
    .line 231
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->D2()Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-nez v0, :cond_2

    .line 236
    .line 237
    move-object v0, p1

    .line 238
    check-cast v0, Ll/fwy;

    .line 239
    .line 240
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    invoke-interface {v5}, Ll/mzl;->l()Ll/clz;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    new-instance v6, Lv/VIcon;

    .line 249
    .line 250
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 251
    .line 252
    .line 253
    move-result-object v7

    .line 254
    invoke-direct {v6, v7}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v6, v4}, Lv/VIcon;->setIconStyle(I)V

    .line 258
    .line 259
    .line 260
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 261
    .line 262
    .line 263
    move-result-object v7

    .line 264
    invoke-virtual {v7}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 265
    .line 266
    .line 267
    move-result-object v7

    .line 268
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 269
    .line 270
    .line 271
    move-result v7

    .line 272
    if-eqz v7, :cond_1

    .line 273
    .line 274
    sget v7, Ll/ibc0;->W5:I

    .line 275
    .line 276
    goto :goto_1

    .line 277
    :cond_1
    sget v7, Ll/ibc0;->V5:I

    .line 278
    .line 279
    :goto_1
    invoke-virtual {v6, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 280
    .line 281
    .line 282
    const-string v7, "voiceCallView"

    .line 283
    .line 284
    invoke-virtual {v6, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v6, v4}, Landroid/view/View;->setVisibility(I)V

    .line 288
    .line 289
    .line 290
    new-instance v4, Ll/suy;

    .line 291
    .line 292
    invoke-direct {v4, v0, v5, p1}, Ll/suy;-><init>(Ll/fwy;Ll/clz;Ll/ruy;)V

    .line 293
    .line 294
    .line 295
    invoke-static {v6, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 296
    .line 297
    .line 298
    invoke-interface {v3, v8, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 299
    .line 300
    .line 301
    :cond_2
    invoke-virtual {v2}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p0, v3, p1}, Ll/vuy;->k(Ljava/util/List;Lv/VLinear;)V

    .line 306
    .line 307
    .line 308
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 309
    .line 310
    .line 311
    move-result p1

    .line 312
    if-nez p1, :cond_3

    .line 313
    .line 314
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    new-array p1, p1, [Landroid/view/View;

    .line 319
    .line 320
    invoke-interface {v3, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    check-cast p1, [Landroid/view/View;

    .line 325
    .line 326
    invoke-virtual {v2, p1}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 327
    .line 328
    .line 329
    :cond_3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 334
    .line 335
    if-eqz p1, :cond_4

    .line 336
    .line 337
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 342
    .line 343
    .line 344
    move-result-object p1

    .line 345
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    if-eqz p1, :cond_4

    .line 350
    .line 351
    sget p1, Ll/ibc0;->G1:I

    .line 352
    .line 353
    invoke-virtual {v2, p1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 354
    .line 355
    .line 356
    :cond_4
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 357
    .line 358
    .line 359
    move-result-object p1

    .line 360
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 361
    .line 362
    if-eqz p1, :cond_6

    .line 363
    .line 364
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 369
    .line 370
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 371
    .line 372
    .line 373
    move-result p1

    .line 374
    if-eqz p1, :cond_6

    .line 375
    .line 376
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    sget v0, Ll/qec0;->v1:I

    .line 385
    .line 386
    invoke-virtual {v2}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    invoke-virtual {p1, v0, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    invoke-virtual {v2}, Lv/navigationbar/VNavigationBar;->B()V

    .line 395
    .line 396
    .line 397
    filled-new-array {p1}, [Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    invoke-virtual {v2, v0}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 402
    .line 403
    .line 404
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    if-eqz v0, :cond_5

    .line 417
    .line 418
    sget v0, Ll/ibc0;->L3:I

    .line 419
    .line 420
    goto :goto_2

    .line 421
    :cond_5
    sget v0, Ll/ibc0;->F1:I

    .line 422
    .line 423
    :goto_2
    invoke-virtual {v2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 424
    .line 425
    .line 426
    new-instance v0, Ll/tuy;

    .line 427
    .line 428
    invoke-direct {v0, p0}, Ll/tuy;-><init>(Ll/vuy;)V

    .line 429
    .line 430
    .line 431
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 432
    .line 433
    .line 434
    :cond_6
    new-instance p1, Ll/uuy;

    .line 435
    .line 436
    invoke-direct {p1, p0}, Ll/uuy;-><init>(Ll/vuy;)V

    .line 437
    .line 438
    .line 439
    invoke-static {v1, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {p0}, Ll/vuy;->i()V

    .line 443
    .line 444
    .line 445
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance v0, Landroid/view/View;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public f()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/nrb0;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->o:Lv/VLinear;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->n:Lv/VImage;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    new-instance v0, Landroid/view/View;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->j(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;Lv/VImage;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .param p2    # Lv/VImage;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public k(Ljava/util/List;Lv/VLinear;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Lv/VLinear;",
            ")V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vuy;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vuy;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract q()V
.end method

.method public s(Z)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public u(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/vuy;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->x:Lv/VImage;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    sget v1, Ll/ibc0;->Z3:I

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    sget v1, Ll/ibc0;->b4:I

    .line 49
    .line 50
    :goto_1
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    if-eqz p1, :cond_3

    .line 55
    .line 56
    sget v1, Ll/ibc0;->Y3:I

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    sget v1, Ll/ibc0;->a4:I

    .line 60
    .line 61
    :goto_2
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_4
    return-void
.end method
