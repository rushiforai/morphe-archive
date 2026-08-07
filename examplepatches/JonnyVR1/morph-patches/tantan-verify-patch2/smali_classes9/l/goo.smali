.class public Ll/goo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grl;


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Lv/VImage;

.field public c:Lv/VRelative;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/android/app/Act;

.field public final l:I

.field public m:Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput p2, p0, Ll/goo;->l:I

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/rec0;->J:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/goo;->f(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/goo;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/goo;->e:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hoo;->a(Ll/goo;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Ljava/lang/String;)I
    .locals 2

    .line 1
    const/16 p0, 0xe

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/vnb;->o1(ILjava/lang/String;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/high16 v0, 0x42200000    # 40.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-int/2addr p1, v1

    .line 18
    int-to-float p1, p1

    .line 19
    rem-float p1, p0, p1

    .line 20
    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr v1, v0

    .line 30
    int-to-float v0, v1

    .line 31
    div-float/2addr p0, v0

    .line 32
    float-to-int p0, p0

    .line 33
    const/4 v0, 0x0

    .line 34
    cmpl-float p1, p1, v0

    .line 35
    .line 36
    const/high16 v0, 0x41880000    # 17.0f

    .line 37
    .line 38
    const v1, 0x43958000    # 299.0f

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int/lit8 p0, p0, 0x1

    .line 48
    .line 49
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :goto_0
    mul-int/2addr p0, v0

    .line 54
    add-int/2addr p1, p0

    .line 55
    return p1

    .line 56
    :cond_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    goto :goto_0
.end method

.method public final h()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/goo;->l:I

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eq v0, v3, :cond_3

    .line 8
    .line 9
    const/4 v4, 0x2

    .line 10
    if-eq v0, v4, :cond_2

    .line 11
    .line 12
    const/16 v4, 0xc

    .line 13
    .line 14
    if-eq v0, v4, :cond_1

    .line 15
    .line 16
    if-eq v0, v1, :cond_3

    .line 17
    .line 18
    const/16 v1, 0x16

    .line 19
    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    packed-switch v0, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :pswitch_0
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 30
    .line 31
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->n2:I

    .line 34
    .line 35
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0, v1}, Ll/goo;->g(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 47
    .line 48
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/goo;->b:Lv/VImage;

    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 57
    .line 58
    const-string v1, "https://auto.tancdn.com/v1/raw/65191013-c7e8-4c5e-9133-5d875afef43912.webp"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/goo;->g:Lv/VImage;

    .line 64
    .line 65
    sget v1, Ll/jbc0;->H0:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 71
    .line 72
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    sget v3, Ll/h9c0;->w:I

    .line 79
    .line 80
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 88
    .line 89
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->p2:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 95
    .line 96
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->n2:I

    .line 99
    .line 100
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 108
    .line 109
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sget v3, Ll/h9c0;->q:I

    .line 116
    .line 117
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/goo;->e:Lv/VText;

    .line 125
    .line 126
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    sget v3, Ll/h9c0;->q:I

    .line 133
    .line 134
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/goo;->j:Lv/VText;

    .line 142
    .line 143
    sget v1, Ll/jbc0;->t:I

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 146
    .line 147
    .line 148
    iget v0, p0, Ll/goo;->l:I

    .line 149
    .line 150
    packed-switch v0, :pswitch_data_1

    .line 151
    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/putong/core/api/r;->X4()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    goto :goto_0

    .line 158
    :pswitch_1
    invoke-static {}, Lcom/p1/mobile/putong/core/api/r;->Y4()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    goto :goto_0

    .line 163
    :pswitch_2
    invoke-static {}, Lcom/p1/mobile/putong/core/api/r;->Z4()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    goto :goto_0

    .line 168
    :pswitch_3
    invoke-static {}, Lcom/p1/mobile/putong/core/api/r;->a5()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    :goto_0
    invoke-static {}, Ll/l9n;->a()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-static {v1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    goto/16 :goto_2

    .line 193
    .line 194
    :cond_0
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 195
    .line 196
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 197
    .line 198
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->L3:I

    .line 199
    .line 200
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {p0, v1}, Ll/goo;->g(Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 212
    .line 213
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ll/goo;->b:Lv/VImage;

    .line 217
    .line 218
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 222
    .line 223
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVYWk81RFdJNVdVWllRWklIRTROTFZDU0NFVEE3WTEzIiwidyI6NzUwLCJoIjo2MzYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1Nzc1ODc3NTYwMTY4NjEyMTZ9.png"

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/goo;->g:Lv/VImage;

    .line 229
    .line 230
    sget v1, Ll/jbc0;->i1:I

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 236
    .line 237
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 238
    .line 239
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    sget v3, Ll/h9c0;->w:I

    .line 244
    .line 245
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 250
    .line 251
    .line 252
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 253
    .line 254
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->M3:I

    .line 255
    .line 256
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 257
    .line 258
    .line 259
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 260
    .line 261
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 262
    .line 263
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->L3:I

    .line 264
    .line 265
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    .line 271
    .line 272
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 273
    .line 274
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 275
    .line 276
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    sget v3, Ll/h9c0;->q:I

    .line 281
    .line 282
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Ll/goo;->e:Lv/VText;

    .line 290
    .line 291
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 292
    .line 293
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    sget v3, Ll/h9c0;->q:I

    .line 298
    .line 299
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 304
    .line 305
    .line 306
    iget-object v0, p0, Ll/goo;->j:Lv/VText;

    .line 307
    .line 308
    sget v1, Ll/jbc0;->t:I

    .line 309
    .line 310
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 311
    .line 312
    .line 313
    iget-object v0, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 314
    .line 315
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->B8:I

    .line 316
    .line 317
    invoke-static {}, Ll/m27;->E3()I

    .line 318
    .line 319
    .line 320
    move-result v3

    .line 321
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 322
    .line 323
    .line 324
    move-result-object v3

    .line 325
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    goto/16 :goto_2

    .line 334
    .line 335
    :cond_1
    iget-object v0, p0, Ll/goo;->b:Lv/VImage;

    .line 336
    .line 337
    sget v1, Ll/jbc0;->B1:I

    .line 338
    .line 339
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 340
    .line 341
    .line 342
    iget-object v0, p0, Ll/goo;->g:Lv/VImage;

    .line 343
    .line 344
    sget v1, Ll/jbc0;->R0:I

    .line 345
    .line 346
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 347
    .line 348
    .line 349
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 350
    .line 351
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->E8:I

    .line 352
    .line 353
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 354
    .line 355
    .line 356
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 357
    .line 358
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 359
    .line 360
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->w1:I

    .line 361
    .line 362
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v1

    .line 366
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    .line 368
    .line 369
    iget-object v0, p0, Ll/goo;->j:Lv/VText;

    .line 370
    .line 371
    sget v1, Ll/jbc0;->s:I

    .line 372
    .line 373
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 374
    .line 375
    .line 376
    iget-object v0, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 377
    .line 378
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->B8:I

    .line 379
    .line 380
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 381
    .line 382
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 383
    .line 384
    invoke-virtual {v3}, Ll/lqb;->B4()I

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object v3

    .line 396
    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    goto/16 :goto_2

    .line 401
    .line 402
    :cond_2
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 403
    .line 404
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 405
    .line 406
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->I7:I

    .line 407
    .line 408
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    invoke-virtual {p0, v1}, Ll/goo;->g(Ljava/lang/String;)I

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 417
    .line 418
    .line 419
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 420
    .line 421
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 422
    .line 423
    .line 424
    iget-object v0, p0, Ll/goo;->b:Lv/VImage;

    .line 425
    .line 426
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 427
    .line 428
    .line 429
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 430
    .line 431
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJQVTJTVkk1Q1VXTjJDTE5RM1VOM1FDNVRUWE1HUzEyIiwidyI6NzUwLCJoIjo2MzYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTY2NDUyMDk5MDE4MzkxNjQ4fQ.png"

    .line 432
    .line 433
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 437
    .line 438
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 439
    .line 440
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 441
    .line 442
    .line 443
    move-result-object v1

    .line 444
    sget v3, Ll/h9c0;->q:I

    .line 445
    .line 446
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 447
    .line 448
    .line 449
    move-result v1

    .line 450
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 451
    .line 452
    .line 453
    iget-object v0, p0, Ll/goo;->e:Lv/VText;

    .line 454
    .line 455
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 456
    .line 457
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 458
    .line 459
    .line 460
    move-result-object v1

    .line 461
    sget v3, Ll/h9c0;->q:I

    .line 462
    .line 463
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 468
    .line 469
    .line 470
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 471
    .line 472
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 473
    .line 474
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    sget v3, Ll/h9c0;->w:I

    .line 479
    .line 480
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 481
    .line 482
    .line 483
    move-result v1

    .line 484
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 485
    .line 486
    .line 487
    iget-object v0, p0, Ll/goo;->g:Lv/VImage;

    .line 488
    .line 489
    sget v1, Ll/jbc0;->S0:I

    .line 490
    .line 491
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 492
    .line 493
    .line 494
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 495
    .line 496
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->d:I

    .line 497
    .line 498
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 499
    .line 500
    .line 501
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 502
    .line 503
    iget-object v1, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 504
    .line 505
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->I7:I

    .line 506
    .line 507
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 512
    .line 513
    .line 514
    iget-object v0, p0, Ll/goo;->j:Lv/VText;

    .line 515
    .line 516
    sget v1, Ll/jbc0;->u:I

    .line 517
    .line 518
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 519
    .line 520
    .line 521
    iget-object v0, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 522
    .line 523
    invoke-static {}, Ll/l9n;->g()I

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    invoke-static {}, Ll/a5i0;->u0()I

    .line 528
    .line 529
    .line 530
    move-result v3

    .line 531
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 532
    .line 533
    .line 534
    move-result-object v3

    .line 535
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object v3

    .line 539
    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    goto/16 :goto_2

    .line 544
    .line 545
    :cond_3
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 546
    .line 547
    iget-object v4, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 548
    .line 549
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->U1:I

    .line 550
    .line 551
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object v4

    .line 555
    invoke-virtual {p0, v4}, Ll/goo;->g(Ljava/lang/String;)I

    .line 556
    .line 557
    .line 558
    move-result v4

    .line 559
    invoke-static {v0, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 560
    .line 561
    .line 562
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 563
    .line 564
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 565
    .line 566
    .line 567
    iget-object v0, p0, Ll/goo;->b:Lv/VImage;

    .line 568
    .line 569
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 570
    .line 571
    .line 572
    iget-object v0, p0, Ll/goo;->a:Lv/AutoVDraweeView;

    .line 573
    .line 574
    const-string v3, "https://auto.tancdn.com/v1/raw/342232da-1c91-4f79-8f28-026d961d46b113.webp"

    .line 575
    .line 576
    invoke-virtual {v0, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 577
    .line 578
    .line 579
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 580
    .line 581
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 582
    .line 583
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 584
    .line 585
    .line 586
    move-result-object v3

    .line 587
    sget v4, Ll/h9c0;->q:I

    .line 588
    .line 589
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 590
    .line 591
    .line 592
    move-result v3

    .line 593
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 594
    .line 595
    .line 596
    iget-object v0, p0, Ll/goo;->e:Lv/VText;

    .line 597
    .line 598
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 599
    .line 600
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 601
    .line 602
    .line 603
    move-result-object v3

    .line 604
    sget v4, Ll/h9c0;->q:I

    .line 605
    .line 606
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 607
    .line 608
    .line 609
    move-result v3

    .line 610
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 611
    .line 612
    .line 613
    iget-object v0, p0, Ll/goo;->h:Lv/VText;

    .line 614
    .line 615
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 616
    .line 617
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 618
    .line 619
    .line 620
    move-result-object v3

    .line 621
    sget v4, Ll/h9c0;->w:I

    .line 622
    .line 623
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 624
    .line 625
    .line 626
    move-result v3

    .line 627
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 628
    .line 629
    .line 630
    iget-object v0, p0, Ll/goo;->g:Lv/VImage;

    .line 631
    .line 632
    sget v3, Ll/jbc0;->h1:I

    .line 633
    .line 634
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 635
    .line 636
    .line 637
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 638
    .line 639
    .line 640
    move-result-object v0

    .line 641
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 642
    .line 643
    .line 644
    move-result-object v0

    .line 645
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 646
    .line 647
    .line 648
    move-result v0

    .line 649
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 650
    .line 651
    if-eqz v0, :cond_4

    .line 652
    .line 653
    new-instance v0, Ljava/lang/StringBuilder;

    .line 654
    .line 655
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 656
    .line 657
    .line 658
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->da:I

    .line 659
    .line 660
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 661
    .line 662
    .line 663
    move-result-object v3

    .line 664
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 665
    .line 666
    .line 667
    const-string v3, "..."

    .line 668
    .line 669
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 670
    .line 671
    .line 672
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v0

    .line 676
    goto :goto_1

    .line 677
    :cond_4
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o:I

    .line 678
    .line 679
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 680
    .line 681
    .line 682
    move-result-object v0

    .line 683
    :goto_1
    iget-object v3, p0, Ll/goo;->h:Lv/VText;

    .line 684
    .line 685
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 686
    .line 687
    .line 688
    iget-object v0, p0, Ll/goo;->i:Lv/VText;

    .line 689
    .line 690
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 691
    .line 692
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->U1:I

    .line 693
    .line 694
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 695
    .line 696
    .line 697
    move-result-object v3

    .line 698
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 699
    .line 700
    .line 701
    iget-object v0, p0, Ll/goo;->j:Lv/VText;

    .line 702
    .line 703
    sget v3, Ll/jbc0;->r:I

    .line 704
    .line 705
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 706
    .line 707
    .line 708
    iget v0, p0, Ll/goo;->l:I

    .line 709
    .line 710
    if-ne v0, v1, :cond_5

    .line 711
    .line 712
    iget-object v0, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 713
    .line 714
    invoke-static {}, Ll/l9n;->g()I

    .line 715
    .line 716
    .line 717
    move-result v1

    .line 718
    invoke-static {}, Ll/m27;->B3()I

    .line 719
    .line 720
    .line 721
    move-result v3

    .line 722
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 723
    .line 724
    .line 725
    move-result-object v3

    .line 726
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 727
    .line 728
    .line 729
    move-result-object v3

    .line 730
    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 731
    .line 732
    .line 733
    move-result-object v0

    .line 734
    goto :goto_2

    .line 735
    :cond_5
    iget-object v0, p0, Ll/goo;->m:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 736
    .line 737
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 738
    .line 739
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 740
    .line 741
    if-ne v0, v1, :cond_6

    .line 742
    .line 743
    invoke-static {}, Ll/l9n;->g()I

    .line 744
    .line 745
    .line 746
    move-result v0

    .line 747
    invoke-static {}, Ll/m27;->D3()I

    .line 748
    .line 749
    .line 750
    move-result v1

    .line 751
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 752
    .line 753
    .line 754
    move-result-object v1

    .line 755
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 756
    .line 757
    .line 758
    move-result-object v1

    .line 759
    invoke-virtual {v3, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    iget-object v1, p0, Ll/goo;->h:Lv/VText;

    .line 764
    .line 765
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 766
    .line 767
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->m2:I

    .line 768
    .line 769
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 770
    .line 771
    .line 772
    move-result-object v3

    .line 773
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 774
    .line 775
    .line 776
    iget-object v1, p0, Ll/goo;->i:Lv/VText;

    .line 777
    .line 778
    iget-object v3, p0, Ll/goo;->k:Lcom/p1/mobile/android/app/Act;

    .line 779
    .line 780
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->l2:I

    .line 781
    .line 782
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 783
    .line 784
    .line 785
    move-result-object v3

    .line 786
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 787
    .line 788
    .line 789
    goto :goto_2

    .line 790
    :cond_6
    invoke-static {}, Ll/l9n;->g()I

    .line 791
    .line 792
    .line 793
    move-result v0

    .line 794
    invoke-static {}, Ll/m27;->z3()I

    .line 795
    .line 796
    .line 797
    move-result v1

    .line 798
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 799
    .line 800
    .line 801
    move-result-object v1

    .line 802
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 803
    .line 804
    .line 805
    move-result-object v1

    .line 806
    invoke-virtual {v3, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 807
    .line 808
    .line 809
    move-result-object v0

    .line 810
    :goto_2
    const-string v1, "#FE7E1D"

    .line 811
    .line 812
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 813
    .line 814
    .line 815
    move-result v1

    .line 816
    const-string v3, "sans-serif"

    .line 817
    .line 818
    invoke-static {v3, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 819
    .line 820
    .line 821
    move-result-object v3

    .line 822
    sget v4, Ll/qa00;->k:I

    .line 823
    .line 824
    invoke-static {v0, v2, v1, v3, v4}, Ll/q8g0;->M(Ljava/lang/String;IILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;

    .line 825
    .line 826
    .line 827
    move-result-object v0

    .line 828
    iget-object p0, p0, Ll/goo;->j:Lv/VText;

    .line 829
    .line 830
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 831
    .line 832
    .line 833
    return-void

    .line 834
    nop

    .line 835
    :pswitch_data_0
    .packed-switch 0x1b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 836
    .line 837
    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    .line 846
    .line 847
    :pswitch_data_1
    .packed-switch 0x1c
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public i(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/goo;->f:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/foo;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/foo;-><init>(Ll/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
