.class public Ll/mvp;
.super Ll/c0s;
.source "SourceFile"


# instance fields
.field public final A:Landroid/widget/TextView;

.field public final B:Landroid/view/View;

.field public final C:Landroid/widget/TextView;

.field public final D:Landroid/widget/TextView;

.field public final E:Landroid/widget/TextView;

.field public final F:Lv/VDraweeView;

.field public final G:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public final H:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatchallenge/HeatChallengeProgressView;

.field public final I:Landroid/widget/TextView;

.field public final J:Lv/VDraweeView;

.field public final K:Lv/VLinear;

.field public L:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;",
            ">;"
        }
    .end annotation
.end field

.field public M:Ll/xvp;

.field public N:Ll/utp;

.field public final x:Lv/VDraweeView;

.field public final y:Lv/VDraweeView;

.field public final z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ll/xup;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->M2:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, p1, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/mvp;->L:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget v0, Ll/mdc0;->n1:I

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/gvp;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/gvp;-><init>(Ll/mvp;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sget v0, Ll/mdc0;->E:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    move-object v0, p1

    .line 55
    check-cast v0, Lv/VDraweeView;

    .line 56
    .line 57
    iput-object v0, p0, Ll/mvp;->x:Lv/VDraweeView;

    .line 58
    .line 59
    const/high16 p1, 0x41c00000    # 24.0f

    .line 60
    .line 61
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    neg-int v4, v1

    .line 66
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    const/4 v1, 0x0

    .line 71
    const/4 v2, 0x0

    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget v0, Ll/mdc0;->F1:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Ll/mvp;->B:Landroid/view/View;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    sget v0, Ll/mdc0;->t:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lv/VDraweeView;

    .line 99
    .line 100
    iput-object p1, p0, Ll/mvp;->y:Lv/VDraweeView;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget v0, Ll/mdc0;->e4:I

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Landroid/widget/TextView;

    .line 113
    .line 114
    iput-object p1, p0, Ll/mvp;->C:Landroid/widget/TextView;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    sget v0, Ll/mdc0;->a4:I

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lv/VDraweeView;

    .line 127
    .line 128
    iput-object p1, p0, Ll/mvp;->J:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    sget v0, Ll/mdc0;->W3:I

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Landroid/widget/TextView;

    .line 141
    .line 142
    iput-object p1, p0, Ll/mvp;->A:Landroid/widget/TextView;

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    sget v0, Ll/mdc0;->R4:I

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Landroid/widget/TextView;

    .line 155
    .line 156
    iput-object p1, p0, Ll/mvp;->D:Landroid/widget/TextView;

    .line 157
    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    sget v0, Ll/mdc0;->b:I

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Landroid/widget/TextView;

    .line 169
    .line 170
    iput-object p1, p0, Ll/mvp;->E:Landroid/widget/TextView;

    .line 171
    .line 172
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    sget v0, Ll/mdc0;->G5:I

    .line 177
    .line 178
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    check-cast p1, Lv/VDraweeView;

    .line 183
    .line 184
    iput-object p1, p0, Ll/mvp;->F:Lv/VDraweeView;

    .line 185
    .line 186
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    sget v0, Ll/mdc0;->S7:I

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    check-cast p1, Landroid/widget/TextView;

    .line 197
    .line 198
    iput-object p1, p0, Ll/mvp;->z:Landroid/widget/TextView;

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    sget v0, Ll/mdc0;->U3:I

    .line 205
    .line 206
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 211
    .line 212
    iput-object p1, p0, Ll/mvp;->G:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 213
    .line 214
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    sget v0, Ll/mdc0;->f4:I

    .line 219
    .line 220
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    check-cast p1, Lv/VLinear;

    .line 225
    .line 226
    iput-object p1, p0, Ll/mvp;->K:Lv/VLinear;

    .line 227
    .line 228
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    sget v0, Ll/mdc0;->M4:I

    .line 233
    .line 234
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatchallenge/HeatChallengeProgressView;

    .line 239
    .line 240
    iput-object p1, p0, Ll/mvp;->H:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatchallenge/HeatChallengeProgressView;

    .line 241
    .line 242
    const/4 v0, -0x1

    .line 243
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatchallenge/HeatChallengeProgressView;->setStartColor(I)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatchallenge/HeatChallengeProgressView;->setEndColor(I)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    sget v0, Ll/mdc0;->x1:I

    .line 254
    .line 255
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    check-cast p1, Landroid/widget/TextView;

    .line 260
    .line 261
    iput-object p1, p0, Ll/mvp;->I:Landroid/widget/TextView;

    .line 262
    .line 263
    iget-object p1, p0, Ll/mvp;->L:Ljava/util/ArrayList;

    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    sget v1, Ll/mdc0;->C6:I

    .line 270
    .line 271
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 276
    .line 277
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Ll/mvp;->L:Ljava/util/ArrayList;

    .line 281
    .line 282
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    sget v1, Ll/mdc0;->D6:I

    .line 287
    .line 288
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 293
    .line 294
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Ll/mvp;->L:Ljava/util/ArrayList;

    .line 298
    .line 299
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    sget v0, Ll/mdc0;->E6:I

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 310
    .line 311
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    return-void
.end method

.method public static synthetic m0(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/mvp;->t0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/xup;)V
    .locals 1

    .line 1
    new-instance v0, Ll/iup;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/iup;-><init>(Ll/xup;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic o0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 3

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rulePageUrl:Ljava/lang/String;

    .line 2
    .line 3
    const/high16 v0, 0x44160000    # 600.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x1b59

    .line 10
    .line 11
    const/16 v2, 0x18

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic p0(Ll/mvp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mvp;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q0(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/mvp;->u0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r0(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/mvp;->v0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V

    return-void
.end method

.method private synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mvp;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic t0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p3, Ll/utp;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rulePageUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p3, p1, p2}, Ll/utp;-><init>(Ll/xup;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p3, p0, Ll/mvp;->N:Ll/utp;

    .line 9
    .line 10
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mvp;->N:Ll/utp;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/mvp;->M:Ll/xvp;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public final synthetic u0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p3, Ll/xvp;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rankRulePageUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p3, p1, p2}, Ll/xvp;-><init>(Ll/xup;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p3, p0, Ll/mvp;->M:Ll/xvp;

    .line 9
    .line 10
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance v0, Ll/lup;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pg:I

    .line 8
    .line 9
    invoke-static {p3}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/kvp;

    .line 14
    .line 15
    invoke-direct {v3, p1}, Ll/kvp;-><init>(Ll/xup;)V

    .line 16
    .line 17
    .line 18
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Og:I

    .line 19
    .line 20
    invoke-static {p3}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    new-instance v5, Ll/lvp;

    .line 25
    .line 26
    invoke-direct {v5, p1, p2}, Ll/lvp;-><init>(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 27
    .line 28
    .line 29
    invoke-direct/range {v0 .. v5}, Ll/lup;-><init>(Landroid/content/Context;Ljava/lang/String;Ll/x20;Ljava/lang/String;Ll/x20;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/mvp;->B:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v0, p0, p1}, Ll/lup;->e(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public w0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/mvp;->x:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/high16 v2, 0x44110000    # 580.0f

    .line 8
    .line 9
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const-string v3, "context_livingAct"

    .line 14
    .line 15
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVER08yWTcyVkZFMkhLVkxFVDVLWU5FVlZWSEREVzE0IiwidyI6MTEyNSwiaCI6MTc0MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjgwODYyMTMxMzc0MDM1MzU0ODd9.png"

    .line 16
    .line 17
    invoke-static {v3, v0, v4, v1, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/mvp;->y:Lv/VDraweeView;

    .line 21
    .line 22
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->avatar:Ljava/lang/String;

    .line 23
    .line 24
    sget v2, Ll/qa00;->K:I

    .line 25
    .line 26
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/mvp;->J:Lv/VDraweeView;

    .line 30
    .line 31
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->bgPic:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {}, Ll/bnl0;->y0()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/mvp;->C:Landroid/widget/TextView;

    .line 41
    .line 42
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->name:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/mvp;->A:Landroid/widget/TextView;

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tg:I

    .line 50
    .line 51
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->memberNum:I

    .line 52
    .line 53
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/mvp;->A:Landroid/widget/TextView;

    .line 65
    .line 66
    new-instance v1, Ll/hvp;

    .line 67
    .line 68
    invoke-direct {v1, p0, p1, p2}, Ll/hvp;-><init>(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->weekRank:I

    .line 75
    .line 76
    if-ltz v0, :cond_0

    .line 77
    .line 78
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const-string v0, "100+"

    .line 84
    .line 85
    :goto_0
    iget-object v1, p0, Ll/mvp;->D:Landroid/widget/TextView;

    .line 86
    .line 87
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->ah:I

    .line 88
    .line 89
    invoke-static {v2, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/mvp;->D:Landroid/widget/TextView;

    .line 97
    .line 98
    new-instance v1, Ll/ivp;

    .line 99
    .line 100
    invoke-direct {v1, p0, p1, p2}, Ll/ivp;-><init>(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/mvp;->E:Landroid/widget/TextView;

    .line 107
    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ig:I

    .line 114
    .line 115
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v2, " "

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->accompanyNum:I

    .line 128
    .line 129
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/mvp;->F:Lv/VDraweeView;

    .line 140
    .line 141
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->userAvatar:Ljava/lang/String;

    .line 142
    .line 143
    sget v4, Ll/qa00;->x:I

    .line 144
    .line 145
    invoke-static {v3, v0, v1, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/mvp;->K:Lv/VLinear;

    .line 149
    .line 150
    const/4 v1, 0x1

    .line 151
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/mvp;->z:Landroid/widget/TextView;

    .line 155
    .line 156
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->userName:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    new-instance v0, Ll/a3o0;

    .line 162
    .line 163
    const/4 v3, 0x0

    .line 164
    invoke-direct {v0, v3}, Ll/a3o0;-><init>(Z)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, p1}, Ll/a3o0;->t(Ll/ner;)V

    .line 168
    .line 169
    .line 170
    new-instance v4, Lcom/p1/mobile/putong/data/UserMedal;

    .line 171
    .line 172
    invoke-direct {v4}, Lcom/p1/mobile/putong/data/UserMedal;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalColor:Ljava/lang/String;

    .line 176
    .line 177
    iput-object v5, v4, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 178
    .line 179
    iget v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalGrade:I

    .line 180
    .line 181
    iput v5, v4, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 182
    .line 183
    iget-object v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalName:Ljava/lang/String;

    .line 184
    .line 185
    iput-object v5, v4, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v5, p0, Ll/mvp;->G:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 188
    .line 189
    invoke-virtual {v0, v5, v4}, Ll/a3o0;->r(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 190
    .line 191
    .line 192
    iget-wide v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->fullExp:J

    .line 193
    .line 194
    const-wide/16 v6, 0x0

    .line 195
    .line 196
    cmp-long v0, v4, v6

    .line 197
    .line 198
    if-eqz v0, :cond_1

    .line 199
    .line 200
    iget-object v0, p0, Ll/mvp;->H:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatchallenge/HeatChallengeProgressView;

    .line 201
    .line 202
    iget-wide v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->curExp:J

    .line 203
    .line 204
    long-to-float v6, v6

    .line 205
    long-to-float v4, v4

    .line 206
    div-float/2addr v6, v4

    .line 207
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatchallenge/HeatChallengeProgressView;->setContentRatio(F)V

    .line 208
    .line 209
    .line 210
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->fontColor:Ljava/lang/String;

    .line 211
    .line 212
    invoke-static {v0}, Ll/n3d0;->f(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    if-eqz v4, :cond_2

    .line 217
    .line 218
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    const-string v5, "#80"

    .line 223
    .line 224
    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    iget-object v5, p0, Ll/mvp;->I:Landroid/widget/TextView;

    .line 229
    .line 230
    invoke-static {v4}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    move-result v6

    .line 234
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 235
    .line 236
    .line 237
    iget-object v5, p0, Ll/mvp;->z:Landroid/widget/TextView;

    .line 238
    .line 239
    invoke-static {v4}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 244
    .line 245
    .line 246
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    const-string v5, "Lv."

    .line 249
    .line 250
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    iget v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalGrade:I

    .line 254
    .line 255
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    new-instance v5, Landroid/text/SpannableStringBuilder;

    .line 263
    .line 264
    invoke-direct {v5}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 265
    .line 266
    .line 267
    iget v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalGrade:I

    .line 268
    .line 269
    const/16 v7, 0xf

    .line 270
    .line 271
    const-string v8, "sans-serif"

    .line 272
    .line 273
    const/16 v9, 0x22

    .line 274
    .line 275
    if-ge v6, v7, :cond_3

    .line 276
    .line 277
    iget-wide v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->fullExp:J

    .line 278
    .line 279
    iget-wide v10, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->curExp:J

    .line 280
    .line 281
    sub-long/2addr v6, v10

    .line 282
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    new-instance v7, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yg:I

    .line 298
    .line 299
    invoke-static {v2, v6}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    invoke-virtual {v5, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 311
    .line 312
    .line 313
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    .line 314
    .line 315
    invoke-static {v0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    move-result v10

    .line 319
    invoke-direct {v7, v10}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v2, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 323
    .line 324
    .line 325
    move-result v10

    .line 326
    invoke-virtual {v2, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 327
    .line 328
    .line 329
    move-result v11

    .line 330
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 331
    .line 332
    .line 333
    move-result v12

    .line 334
    add-int/2addr v11, v12

    .line 335
    invoke-virtual {v5, v7, v10, v11, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 336
    .line 337
    .line 338
    new-instance v7, Lv/text/CustomTypefaceSpan;

    .line 339
    .line 340
    sget-object v10, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 341
    .line 342
    invoke-direct {v7, v8, v10}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v2, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    move-result v10

    .line 349
    invoke-virtual {v2, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 354
    .line 355
    .line 356
    move-result v6

    .line 357
    add-int/2addr v2, v6

    .line 358
    invoke-virtual {v5, v7, v10, v2, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 359
    .line 360
    .line 361
    goto :goto_1

    .line 362
    :cond_3
    invoke-virtual {v5, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 363
    .line 364
    .line 365
    :goto_1
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 366
    .line 367
    invoke-static {v0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    invoke-direct {v2, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    invoke-virtual {v5, v2, v3, v0, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 379
    .line 380
    .line 381
    new-instance v0, Lv/text/CustomTypefaceSpan;

    .line 382
    .line 383
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 384
    .line 385
    invoke-direct {v0, v8, v2}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 389
    .line 390
    .line 391
    move-result v2

    .line 392
    invoke-virtual {v5, v0, v3, v2, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 393
    .line 394
    .line 395
    iget-object v0, p0, Ll/mvp;->I:Landroid/widget/TextView;

    .line 396
    .line 397
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 398
    .line 399
    .line 400
    move v0, v3

    .line 401
    :goto_2
    const/4 v2, 0x3

    .line 402
    if-ge v0, v2, :cond_6

    .line 403
    .line 404
    iget-object v2, p0, Ll/mvp;->L:Ljava/util/ArrayList;

    .line 405
    .line 406
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object v2

    .line 410
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 411
    .line 412
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->tasks:Ljava/util/List;

    .line 413
    .line 414
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 415
    .line 416
    .line 417
    move-result v4

    .line 418
    if-le v4, v0, :cond_4

    .line 419
    .line 420
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->tasks:Ljava/util/List;

    .line 421
    .line 422
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object v4

    .line 426
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;

    .line 427
    .line 428
    goto :goto_3

    .line 429
    :cond_4
    const/4 v4, 0x0

    .line 430
    :goto_3
    if-nez v4, :cond_5

    .line 431
    .line 432
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 433
    .line 434
    .line 435
    goto :goto_4

    .line 436
    :cond_5
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {v2, p1, p0, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->f(Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;)V

    .line 440
    .line 441
    .line 442
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 443
    .line 444
    goto :goto_2

    .line 445
    :cond_6
    iget-object v0, p0, Ll/mvp;->B:Landroid/view/View;

    .line 446
    .line 447
    new-instance v1, Ll/jvp;

    .line 448
    .line 449
    invoke-direct {v1, p0, p1, p2}, Ll/jvp;-><init>(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 450
    .line 451
    .line 452
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 453
    .line 454
    .line 455
    return-void
.end method
