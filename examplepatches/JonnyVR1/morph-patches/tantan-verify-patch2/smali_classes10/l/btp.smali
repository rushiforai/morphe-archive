.class public Ll/btp;
.super Ll/c0s;
.source "SourceFile"


# instance fields
.field public final A:Landroid/view/View;

.field public final B:Landroid/view/View;

.field public final C:Lv/VDraweeView;

.field public final D:Lv/VDraweeView;

.field public final E:Landroid/widget/TextView;

.field public final F:Landroid/widget/TextView;

.field public final G:Landroid/view/View;

.field public final H:Ll/yup;

.field public final I:Landroid/view/View;

.field public final J:Landroid/view/View;

.field public final K:Landroid/view/View;

.field public final L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public final M:Landroid/view/View;

.field public N:Ljava/lang/String;

.field public final x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

.field public final y:Lv/VRecyclerView;

.field public final z:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/xup;)V
    .locals 11

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
    sget v1, Ll/yec0;->E2:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/mdc0;->n1:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/jsp;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/jsp;-><init>(Ll/btp;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Ll/mdc0;->E:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    move-object v1, v0

    .line 48
    check-cast v1, Lv/VDraweeView;

    .line 49
    .line 50
    iput-object v1, p0, Ll/btp;->C:Lv/VDraweeView;

    .line 51
    .line 52
    const/high16 v0, 0x41c00000    # 24.0f

    .line 53
    .line 54
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    neg-int v5, v2

    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    const/4 v2, 0x0

    .line 64
    const/4 v3, 0x0

    .line 65
    const/4 v4, 0x0

    .line 66
    invoke-static/range {v1 .. v6}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget v1, Ll/mdc0;->F1:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/btp;->G:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sget v1, Ll/mdc0;->t:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lv/VDraweeView;

    .line 92
    .line 93
    iput-object v0, p0, Ll/btp;->D:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget v1, Ll/mdc0;->e4:I

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Landroid/widget/TextView;

    .line 106
    .line 107
    iput-object v0, p0, Ll/btp;->E:Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    sget v1, Ll/mdc0;->U3:I

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 120
    .line 121
    iput-object v0, p0, Ll/btp;->L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sget v1, Ll/mdc0;->W3:I

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Landroid/widget/TextView;

    .line 134
    .line 135
    iput-object v0, p0, Ll/btp;->F:Landroid/widget/TextView;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    sget v1, Ll/mdc0;->Z0:I

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Ll/btp;->B:Landroid/view/View;

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    sget v2, Ll/mdc0;->g8:I

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, p0, Ll/btp;->A:Landroid/view/View;

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    sget v3, Ll/mdc0;->h:I

    .line 166
    .line 167
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    iput-object v2, p0, Ll/btp;->z:Landroid/view/View;

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    sget v4, Ll/mdc0;->t3:I

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    check-cast v3, Lv/VRecyclerView;

    .line 184
    .line 185
    iput-object v3, p0, Ll/btp;->y:Lv/VRecyclerView;

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    sget v5, Ll/mdc0;->p1:I

    .line 192
    .line 193
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    check-cast v4, Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 198
    .line 199
    iput-object v4, p0, Ll/btp;->x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    sget v6, Ll/mdc0;->N3:I

    .line 206
    .line 207
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    iput-object v5, p0, Ll/btp;->M:Landroid/view/View;

    .line 212
    .line 213
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    sget v7, Ll/mdc0;->O3:I

    .line 218
    .line 219
    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    iput-object v6, p0, Ll/btp;->I:Landroid/view/View;

    .line 224
    .line 225
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v6

    .line 229
    sget v7, Ll/mdc0;->P3:I

    .line 230
    .line 231
    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 232
    .line 233
    .line 234
    move-result-object v6

    .line 235
    iput-object v6, p0, Ll/btp;->J:Landroid/view/View;

    .line 236
    .line 237
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    sget v8, Ll/mdc0;->Q3:I

    .line 242
    .line 243
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 244
    .line 245
    .line 246
    move-result-object v7

    .line 247
    iput-object v7, p0, Ll/btp;->K:Landroid/view/View;

    .line 248
    .line 249
    const/4 v8, 0x0

    .line 250
    invoke-virtual {v7, v8}, Landroid/view/View;->setEnabled(Z)V

    .line 251
    .line 252
    .line 253
    const/16 v8, 0x11

    .line 254
    .line 255
    invoke-virtual {v4, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 256
    .line 257
    .line 258
    sget v8, Ll/obc0;->h3:I

    .line 259
    .line 260
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 261
    .line 262
    .line 263
    const/high16 v8, 0x42dc0000    # 110.0f

    .line 264
    .line 265
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 266
    .line 267
    .line 268
    move-result v9

    .line 269
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 270
    .line 271
    .line 272
    move-result v8

    .line 273
    invoke-virtual {v4, v9, v8}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->c(II)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 274
    .line 275
    .line 276
    sget v8, Lcom/p1/mobile/putong/live/livingroom/R$string;->vh:I

    .line 277
    .line 278
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->e(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 279
    .line 280
    .line 281
    const-string v8, "#4dffabf7"

    .line 282
    .line 283
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    move-result v8

    .line 287
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->d(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 288
    .line 289
    .line 290
    sget v8, Ll/qa00;->e:I

    .line 291
    .line 292
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->setTextMargin(I)V

    .line 293
    .line 294
    .line 295
    new-instance v8, Ll/yup;

    .line 296
    .line 297
    invoke-direct {v8}, Ll/yup;-><init>()V

    .line 298
    .line 299
    .line 300
    iput-object v8, p0, Ll/btp;->H:Ll/yup;

    .line 301
    .line 302
    invoke-virtual {v3, v8}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 303
    .line 304
    .line 305
    new-instance v9, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 306
    .line 307
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 308
    .line 309
    .line 310
    move-result-object v10

    .line 311
    invoke-direct {v9, v10}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v3, v9}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v8, v3, v4}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Y(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    .line 318
    .line 319
    .line 320
    new-instance v3, Ll/ssp;

    .line 321
    .line 322
    invoke-direct {v3, p0, p1}, Ll/ssp;-><init>(Ll/btp;Ll/xup;)V

    .line 323
    .line 324
    .line 325
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 326
    .line 327
    .line 328
    new-instance v0, Ll/tsp;

    .line 329
    .line 330
    invoke-direct {v0, p0, p1}, Ll/tsp;-><init>(Ll/btp;Ll/xup;)V

    .line 331
    .line 332
    .line 333
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 334
    .line 335
    .line 336
    new-instance v0, Ll/usp;

    .line 337
    .line 338
    invoke-direct {v0, p0, p1}, Ll/usp;-><init>(Ll/btp;Ll/xup;)V

    .line 339
    .line 340
    .line 341
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 342
    .line 343
    .line 344
    new-instance v0, Ll/vsp;

    .line 345
    .line 346
    invoke-direct {v0, p0}, Ll/vsp;-><init>(Ll/btp;)V

    .line 347
    .line 348
    .line 349
    invoke-static {v6, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 350
    .line 351
    .line 352
    new-instance v0, Ll/wsp;

    .line 353
    .line 354
    invoke-direct {v0, p0, p1}, Ll/wsp;-><init>(Ll/btp;Ll/xup;)V

    .line 355
    .line 356
    .line 357
    invoke-static {v7, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 358
    .line 359
    .line 360
    new-instance p1, Ll/xsp;

    .line 361
    .line 362
    invoke-direct {p1, p0}, Ll/xsp;-><init>(Ll/btp;)V

    .line 363
    .line 364
    .line 365
    invoke-static {v5, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 366
    .line 367
    .line 368
    return-void
.end method

.method public static synthetic A0(Ll/d3q;)Ljava/lang/String;
    .locals 0

    .line 1
    check-cast p0, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pam;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic B0(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p0, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pam;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic C0(Ll/btp;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->J0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rulePageUrl:Ljava/lang/String;

    .line 2
    .line 3
    const/high16 p2, 0x44160000    # 600.0f

    .line 4
    .line 5
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/16 v0, 0x1b59

    .line 10
    .line 11
    const/16 v1, 0x18

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic H0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic O0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/btp;->I:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-direct {p0, p1}, Ll/btp;->U0(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p1, 0x1

    .line 15
    invoke-direct {p0, p1}, Ll/btp;->U0(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private U0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/atp;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/atp;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/btp;->V0()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    instance-of v0, v0, Ll/ctp;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/btp;->I:Landroid/view/View;

    .line 61
    .line 62
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic m0(Ll/btp;Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->F0(Ll/xup;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic n0(Ll/btp;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->N0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o0(Ll/btp;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->I0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Ll/btp;Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/btp;->P0(Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V

    return-void
.end method

.method public static synthetic q0(Ll/btp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/btp;->L0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r0(ZLl/d3q;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/pam;->i(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s0(Ll/btp;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->K0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Ll/btp;Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->Q0(Ll/xup;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic u0(Ll/btp;Ll/xup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/btp;->G0(Ll/xup;)V

    return-void
.end method

.method public static synthetic v0(Ll/btp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/btp;->H0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w0(Ll/btp;Ll/xup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/btp;->M0(Ll/xup;)V

    return-void
.end method

.method public static synthetic x0(Ll/btp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/btp;->O0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y0(Ll/btp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/btp;->V0()V

    return-void
.end method

.method public static synthetic z0(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p0, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pam;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final E0(Ll/xup;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/lsp;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/lsp;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/msp;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/msp;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v1, Ll/nsp;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/nsp;-><init>(Ll/btp;Ll/xup;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Ll/xup;->h4(Ljava/util/ArrayList;Ll/x20;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic F0(Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->S0(Ll/xup;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G0(Ll/xup;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/btp;->N:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ll/rsp;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/rsp;-><init>(Ll/btp;Ll/xup;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Ll/xup;->k4(Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-direct {p0, p1}, Ll/btp;->U0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic I0(Ll/xup;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "daily"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/btp;->T0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic J0(Ll/xup;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "week"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/btp;->T0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K0(Ll/xup;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "total"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/btp;->T0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic L0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Ll/btp;->U0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic M0(Ll/xup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/btp;->E0(Ll/xup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N0(Ll/xup;Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance v0, Ll/ftp;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ftp;-><init>(Ll/xup;)V

    .line 4
    .line 5
    .line 6
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hg:I

    .line 7
    .line 8
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vg:I

    .line 13
    .line 14
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gg:I

    .line 19
    .line 20
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Dg:I

    .line 25
    .line 26
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    new-instance v5, Ll/zsp;

    .line 31
    .line 32
    invoke-direct {v5, p0, p1}, Ll/zsp;-><init>(Ll/btp;Ll/xup;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual/range {v0 .. v5}, Ll/ftp;->q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic P0(Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V
    .locals 2

    .line 1
    new-instance v0, Ll/fvp;

    .line 2
    .line 3
    new-instance v1, Ll/qsp;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/qsp;-><init>(Ll/btp;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p1, v1, p3}, Ll/fvp;-><init>(Ll/xup;Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic Q0(Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/btp;->S0(Ll/xup;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/btp;->C:Lv/VDraweeView;

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
    iget-object v0, p0, Ll/btp;->D:Lv/VDraweeView;

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
    iget-object v0, p0, Ll/btp;->E:Landroid/widget/TextView;

    .line 30
    .line 31
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/a3o0;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-direct {v0, v1}, Ll/a3o0;-><init>(Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ll/a3o0;->t(Ll/ner;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Lcom/p1/mobile/putong/data/UserMedal;

    .line 46
    .line 47
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserMedal;-><init>()V

    .line 48
    .line 49
    .line 50
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalColor:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 53
    .line 54
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalGrade:I

    .line 55
    .line 56
    iput v2, v1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 57
    .line 58
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalName:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v2, p0, Ll/btp;->L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 63
    .line 64
    invoke-virtual {v0, v2, v1}, Ll/a3o0;->r(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/btp;->F:Landroid/widget/TextView;

    .line 68
    .line 69
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tg:I

    .line 70
    .line 71
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->memberNum:I

    .line 72
    .line 73
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/btp;->G:Landroid/view/View;

    .line 85
    .line 86
    new-instance v1, Ll/ysp;

    .line 87
    .line 88
    invoke-direct {v1, p1, p2}, Ll/ysp;-><init>(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/btp;->B:Landroid/view/View;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public S0(Ll/xup;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/psp;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, v0}, Ll/psp;-><init>(Ll/btp;Ll/xup;Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    new-instance p1, Ll/ctp;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/ctp;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Ll/btp;->H:Ll/yup;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final T0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/btp;->B:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/btp;->A:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/btp;->z:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 18
    .line 19
    new-array v2, v1, [Ll/d3q;

    .line 20
    .line 21
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, v1}, Ll/btp;->U0(Z)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 33
    .line 34
    .line 35
    iput-object p3, p0, Ll/btp;->N:Ljava/lang/String;

    .line 36
    .line 37
    new-instance p2, Ll/ksp;

    .line 38
    .line 39
    invoke-direct {p2, p0, p1}, Ll/ksp;-><init>(Ll/btp;Ll/xup;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p3, p2}, Ll/xup;->k4(Ljava/lang/String;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final V0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/btp;->H:Ll/yup;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/osp;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/osp;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/btp;->K:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    xor-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
