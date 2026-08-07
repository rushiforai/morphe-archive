.class public Ll/ewb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cwb0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Ll/cwb0;

.field public g:Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ewb0;->g:Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ewb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ewb0;->e(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ewb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ewb0;->g:Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ewb0;->g:Lcom/p1/mobile/putong/core/ui/helpcenter/QuestionAndAnswerAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fwb0;->b(Ll/ewb0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/cwb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ewb0;->f:Ll/cwb0;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/String;I)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    iget-object v5, v0, Ll/ewb0;->b:Lv/navigationbar/VNavigationBar;

    .line 14
    .line 15
    sget v6, Lcom/p1/mobile/putong/core/R$string;->K6:I

    .line 16
    .line 17
    invoke-virtual {v5, v6}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 18
    .line 19
    .line 20
    iget-object v5, v0, Ll/ewb0;->b:Lv/navigationbar/VNavigationBar;

    .line 21
    .line 22
    new-instance v6, Ll/dwb0;

    .line 23
    .line 24
    invoke-direct {v6, v0}, Ll/dwb0;-><init>(Ll/ewb0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v5, v6}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v5, v0, Ll/ewb0;->d:Lv/VText;

    .line 31
    .line 32
    move-object/from16 v6, p1

    .line 33
    .line 34
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v5, v0, Ll/ewb0;->e:Landroid/view/View;

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    invoke-virtual {v5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    if-eqz v5, :cond_1

    .line 56
    .line 57
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {v5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 66
    .line 67
    const-string v8, "male"

    .line 68
    .line 69
    invoke-static {v5, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-eqz v5, :cond_0

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    move v5, v6

    .line 77
    goto :goto_1

    .line 78
    :cond_1
    :goto_0
    move v5, v3

    .line 79
    :goto_1
    new-instance v8, Landroid/util/Pair;

    .line 80
    .line 81
    sget v9, Lcom/p1/mobile/putong/core/R$string;->L6:I

    .line 82
    .line 83
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v9

    .line 87
    invoke-direct {v8, v7, v9}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    new-instance v9, Landroid/util/Pair;

    .line 91
    .line 92
    if-eqz v5, :cond_2

    .line 93
    .line 94
    const-string v10, "http://auto.tancdn.com/v1/images/eyJpZCI6IlVTTE5XUFdLN0VSVE9HSlJUSlFPNTREVTZTNVc0MiIsInciOjY3MCwiaCI6NTE4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTUyNDczODIwMjM4NDExMjI1Nzh9.jpg?format=max_720xX"

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    const-string v10, "http://auto.tancdn.com/v1/images/eyJpZCI6IlBYNTJVVzY3RFFKQ0RIMktKV1pSQlVYRkhUNFlPQyIsInciOjY3MCwiaCI6NTE4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTUyNDczODc1MDg4NDc1MjAwNjB9.jpg?format=max_720xX"

    .line 98
    .line 99
    :goto_2
    invoke-static {v10}, Ll/cwb0;->h0(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    invoke-direct {v9, v4, v10}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    new-instance v10, Landroid/util/Pair;

    .line 107
    .line 108
    sget v11, Lcom/p1/mobile/putong/core/R$string;->P6:I

    .line 109
    .line 110
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v11

    .line 114
    invoke-direct {v10, v2, v11}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    new-instance v11, Landroid/util/Pair;

    .line 118
    .line 119
    sget v12, Lcom/p1/mobile/putong/core/R$string;->M6:I

    .line 120
    .line 121
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v12

    .line 125
    invoke-direct {v11, v7, v12}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    new-instance v12, Landroid/util/Pair;

    .line 129
    .line 130
    if-eqz v5, :cond_3

    .line 131
    .line 132
    const-string v13, "http://u.tancdn.com/v1/images/eyJpZCI6IlE2UEUyQTZRT0xNNk1SM000RTVMRlRMTlhENFROQSIsInciOjY3MCwiaCI6NTE4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzU1ODc4MTc1OTUzNjczNTEzMX0.jpg?format=max_720xX"

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_3
    const-string v13, "http://auto.tancdn.com/v1/images/eyJpZCI6IjZCUFZVQUVTVllQUDM2RTRFQ0xGSkhUSEdTRTdaQyIsInciOjY3MCwiaCI6NTE4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6ODE3MDQ4OTk4MzM0OTI3MTUyN30.jpg?format=max_720xX"

    .line 136
    .line 137
    :goto_3
    invoke-static {v13}, Ll/cwb0;->h0(Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v13

    .line 141
    invoke-direct {v12, v4, v13}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    new-instance v13, Landroid/util/Pair;

    .line 145
    .line 146
    sget v14, Lcom/p1/mobile/putong/core/R$string;->Q6:I

    .line 147
    .line 148
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v14

    .line 152
    invoke-direct {v13, v2, v14}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    new-instance v14, Landroid/util/Pair;

    .line 156
    .line 157
    sget v15, Lcom/p1/mobile/putong/core/R$string;->N6:I

    .line 158
    .line 159
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v15

    .line 163
    invoke-direct {v14, v7, v15}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    new-instance v15, Landroid/util/Pair;

    .line 167
    .line 168
    const-string v16, "http://auto.tancdn.com/v1/images/eyJpZCI6IlVSV0lBVzJHNEJHVFRYV0VEVUpCM1pFTFo0TTY2QiIsInciOjY3MCwiaCI6MzAwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTA0OTMzMTM4NTQ3MTM5NDg0MDh9.jpg?format=max_720xX"

    .line 169
    .line 170
    invoke-static/range {v16 .. v16}, Ll/cwb0;->h0(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-direct {v15, v4, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    new-instance v6, Landroid/util/Pair;

    .line 178
    .line 179
    sget v16, Lcom/p1/mobile/putong/core/R$string;->R6:I

    .line 180
    .line 181
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-direct {v6, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    new-instance v1, Landroid/util/Pair;

    .line 189
    .line 190
    sget v2, Lcom/p1/mobile/putong/core/R$string;->O6:I

    .line 191
    .line 192
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-direct {v1, v7, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    move-object/from16 v17, v1

    .line 200
    .line 201
    move-object/from16 v16, v6

    .line 202
    .line 203
    filled-new-array/range {v8 .. v17}, [Landroid/util/Pair;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 208
    .line 209
    .line 210
    move-result-object v8

    .line 211
    new-instance v1, Landroid/util/Pair;

    .line 212
    .line 213
    if-eqz v5, :cond_4

    .line 214
    .line 215
    const-string v2, "http://auto.tancdn.com/v1/images/eyJpZCI6IjI1T01NSUs2Wks0QVRXRk5HUk81SFRGM1JJSzRXSCIsInciOjY3MCwiaCI6MzEwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NzMyNjA0MzU5MzYyOTg0ODkxN30.jpg?format=max_720xX"

    .line 216
    .line 217
    goto :goto_4

    .line 218
    :cond_4
    const-string v2, "http://auto.tancdn.com/v1/images/eyJpZCI6IlRNUFBTNlZTNEZPVEIzQUlES1RGNTI2S0dJS05GRSIsInciOjY3MCwiaCI6MzEwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NjE4MjE1NDA0NDQzNzU2NjI5N30.jpg?format=max_720xX"

    .line 219
    .line 220
    :goto_4
    invoke-direct {v1, v4, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    new-instance v2, Landroid/util/Pair;

    .line 224
    .line 225
    sget v4, Lcom/p1/mobile/putong/core/R$string;->D7:I

    .line 226
    .line 227
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    invoke-direct {v2, v7, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    filled-new-array {v1, v2}, [Landroid/util/Pair;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    new-instance v1, Landroid/util/Pair;

    .line 243
    .line 244
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Z6:I

    .line 245
    .line 246
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-direct {v1, v7, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    filled-new-array {v1}, [Landroid/util/Pair;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 258
    .line 259
    .line 260
    move-result-object v10

    .line 261
    new-instance v1, Landroid/util/Pair;

    .line 262
    .line 263
    sget v2, Lcom/p1/mobile/putong/core/R$string;->T6:I

    .line 264
    .line 265
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-direct {v1, v7, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    filled-new-array {v1}, [Landroid/util/Pair;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 277
    .line 278
    .line 279
    move-result-object v11

    .line 280
    new-instance v1, Landroid/util/Pair;

    .line 281
    .line 282
    sget v2, Lcom/p1/mobile/putong/core/R$string;->X6:I

    .line 283
    .line 284
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    invoke-direct {v1, v7, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 289
    .line 290
    .line 291
    filled-new-array {v1}, [Landroid/util/Pair;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 296
    .line 297
    .line 298
    move-result-object v12

    .line 299
    new-instance v1, Landroid/util/Pair;

    .line 300
    .line 301
    sget v2, Lcom/p1/mobile/putong/core/R$string;->F7:I

    .line 302
    .line 303
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    invoke-direct {v1, v7, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    filled-new-array {v1}, [Landroid/util/Pair;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 315
    .line 316
    .line 317
    move-result-object v13

    .line 318
    new-instance v1, Landroid/util/Pair;

    .line 319
    .line 320
    sget v2, Lcom/p1/mobile/putong/core/R$string;->V6:I

    .line 321
    .line 322
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    invoke-direct {v1, v7, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 327
    .line 328
    .line 329
    filled-new-array {v1}, [Landroid/util/Pair;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 334
    .line 335
    .line 336
    move-result-object v14

    .line 337
    new-instance v1, Landroid/util/Pair;

    .line 338
    .line 339
    sget v2, Lcom/p1/mobile/putong/core/R$string;->I6:I

    .line 340
    .line 341
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 342
    .line 343
    .line 344
    move-result-object v2

    .line 345
    invoke-direct {v1, v7, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 346
    .line 347
    .line 348
    filled-new-array {v1}, [Landroid/util/Pair;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 353
    .line 354
    .line 355
    move-result-object v15

    .line 356
    filled-new-array/range {v8 .. v15}, [Ljava/util/ArrayList;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    add-int/lit8 v2, p2, -0x1

    .line 365
    .line 366
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    check-cast v1, Ljava/util/ArrayList;

    .line 371
    .line 372
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    :cond_5
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    if-eqz v2, :cond_a

    .line 381
    .line 382
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object v2

    .line 386
    check-cast v2, Landroid/util/Pair;

    .line 387
    .line 388
    iget-object v4, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 389
    .line 390
    check-cast v4, Ljava/lang/Integer;

    .line 391
    .line 392
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 393
    .line 394
    .line 395
    move-result v4

    .line 396
    if-eqz v4, :cond_9

    .line 397
    .line 398
    if-eq v4, v3, :cond_8

    .line 399
    .line 400
    const/4 v5, 0x2

    .line 401
    if-eq v4, v5, :cond_7

    .line 402
    .line 403
    :cond_6
    :goto_6
    const/4 v8, 0x0

    .line 404
    goto :goto_5

    .line 405
    :cond_7
    invoke-virtual {v0}, Ll/ewb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 410
    .line 411
    .line 412
    move-result-object v4

    .line 413
    sget v6, Ll/kec0;->Cd:I

    .line 414
    .line 415
    iget-object v7, v0, Ll/ewb0;->c:Landroid/widget/LinearLayout;

    .line 416
    .line 417
    const/4 v8, 0x0

    .line 418
    invoke-virtual {v4, v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 419
    .line 420
    .line 421
    move-result-object v4

    .line 422
    check-cast v4, Landroid/widget/TextView;

    .line 423
    .line 424
    invoke-virtual {v0}, Ll/ewb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 425
    .line 426
    .line 427
    move-result-object v6

    .line 428
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 429
    .line 430
    check-cast v2, Ljava/lang/Integer;

    .line 431
    .line 432
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 433
    .line 434
    .line 435
    move-result v2

    .line 436
    invoke-virtual {v6, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 448
    .line 449
    .line 450
    move-result v2

    .line 451
    if-nez v2, :cond_6

    .line 452
    .line 453
    iget-object v2, v0, Ll/ewb0;->c:Landroid/widget/LinearLayout;

    .line 454
    .line 455
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 456
    .line 457
    .line 458
    goto :goto_6

    .line 459
    :cond_8
    const/4 v5, 0x2

    .line 460
    invoke-virtual {v0}, Ll/ewb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 461
    .line 462
    .line 463
    move-result-object v4

    .line 464
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 465
    .line 466
    .line 467
    move-result-object v4

    .line 468
    sget v6, Ll/kec0;->Ad:I

    .line 469
    .line 470
    iget-object v7, v0, Ll/ewb0;->c:Landroid/widget/LinearLayout;

    .line 471
    .line 472
    const/4 v8, 0x0

    .line 473
    invoke-virtual {v4, v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 474
    .line 475
    .line 476
    move-result-object v4

    .line 477
    check-cast v4, Lv/VDraweeView;

    .line 478
    .line 479
    iget-object v6, v0, Ll/ewb0;->c:Landroid/widget/LinearLayout;

    .line 480
    .line 481
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 482
    .line 483
    .line 484
    const/high16 v6, 0x40c00000    # 6.0f

    .line 485
    .line 486
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 487
    .line 488
    .line 489
    move-result v6

    .line 490
    int-to-float v6, v6

    .line 491
    invoke-static {v6}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 492
    .line 493
    .line 494
    move-result-object v6

    .line 495
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 496
    .line 497
    invoke-virtual {v7}, Ll/am2;->l()Ll/xlj;

    .line 498
    .line 499
    .line 500
    move-result-object v7

    .line 501
    invoke-virtual {v7, v6}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 502
    .line 503
    .line 504
    move-result-object v6

    .line 505
    invoke-virtual {v6}, Ll/xlj;->a()Ll/wlj;

    .line 506
    .line 507
    .line 508
    move-result-object v6

    .line 509
    invoke-virtual {v4, v6}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 510
    .line 511
    .line 512
    new-instance v6, Ll/ewb0$a;

    .line 513
    .line 514
    invoke-direct {v6, v0, v4}, Ll/ewb0$a;-><init>(Ll/ewb0;Lv/VDraweeView;)V

    .line 515
    .line 516
    .line 517
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 518
    .line 519
    invoke-virtual {v7, v4}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 520
    .line 521
    .line 522
    move-result-object v7

    .line 523
    invoke-virtual {v7, v6}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 524
    .line 525
    .line 526
    move-result-object v6

    .line 527
    check-cast v6, Ll/lq70;

    .line 528
    .line 529
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 530
    .line 531
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 532
    .line 533
    .line 534
    move-result-object v2

    .line 535
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 536
    .line 537
    .line 538
    move-result-object v2

    .line 539
    invoke-virtual {v6, v2}, Ll/lq70;->N(Landroid/net/Uri;)Ll/lq70;

    .line 540
    .line 541
    .line 542
    move-result-object v2

    .line 543
    invoke-virtual {v2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 544
    .line 545
    .line 546
    move-result-object v2

    .line 547
    invoke-virtual {v4, v2}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 548
    .line 549
    .line 550
    goto/16 :goto_6

    .line 551
    .line 552
    :cond_9
    const/4 v5, 0x2

    .line 553
    invoke-virtual {v0}, Ll/ewb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 554
    .line 555
    .line 556
    move-result-object v4

    .line 557
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 558
    .line 559
    .line 560
    move-result-object v4

    .line 561
    sget v6, Ll/kec0;->Bd:I

    .line 562
    .line 563
    iget-object v7, v0, Ll/ewb0;->c:Landroid/widget/LinearLayout;

    .line 564
    .line 565
    const/4 v8, 0x0

    .line 566
    invoke-virtual {v4, v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 567
    .line 568
    .line 569
    move-result-object v4

    .line 570
    check-cast v4, Landroid/widget/TextView;

    .line 571
    .line 572
    invoke-virtual {v0}, Ll/ewb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 573
    .line 574
    .line 575
    move-result-object v6

    .line 576
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 577
    .line 578
    check-cast v2, Ljava/lang/Integer;

    .line 579
    .line 580
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 581
    .line 582
    .line 583
    move-result v2

    .line 584
    invoke-virtual {v6, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 585
    .line 586
    .line 587
    move-result-object v2

    .line 588
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 589
    .line 590
    .line 591
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 592
    .line 593
    .line 594
    move-result-object v2

    .line 595
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 596
    .line 597
    .line 598
    move-result v2

    .line 599
    if-nez v2, :cond_5

    .line 600
    .line 601
    iget-object v2, v0, Ll/ewb0;->c:Landroid/widget/LinearLayout;

    .line 602
    .line 603
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 604
    .line 605
    .line 606
    goto/16 :goto_5

    .line 607
    .line 608
    :cond_a
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cwb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ewb0;->c(Ll/cwb0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ewb0;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
