.class public final Ll/g550;
.super Ll/w4;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\t\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\u0008J\u000f\u0010\n\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u0008J\u0011\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0014\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0012J\u0017\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0016\u001a\u00020\u0015H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u0019H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001f\u00a8\u0006 "
    }
    d2 = {
        "Ll/g550;",
        "Ll/w4;",
        "Ll/m8h0;",
        "viewModel",
        "<init>",
        "(Ll/m8h0;)V",
        "",
        "f",
        "()V",
        "h",
        "g",
        "Landroid/graphics/drawable/Drawable;",
        "b",
        "()Landroid/graphics/drawable/Drawable;",
        "",
        "selected",
        "",
        "c",
        "(Z)I",
        "clickable",
        "a",
        "Lv/VDraweeView;",
        "maskView",
        "j",
        "(Lv/VDraweeView;)V",
        "Lv/VImage;",
        "borderView",
        "k",
        "(Lv/VImage;)V",
        "",
        "d",
        "()Ljava/lang/String;",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/m8h0;)V
    .locals 0
    .param p1    # Ll/m8h0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/w4;-><init>(Ll/m8h0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "#000000"

    .line 4
    .line 5
    :goto_0
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const-string p0, "#33000000"

    .line 11
    .line 12
    goto :goto_0
.end method

.method public b()Landroid/graphics/drawable/Drawable;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    int-to-float v1, v1

    .line 17
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 26
    .line 27
    .line 28
    const-string v0, "#FFCF77"

    .line 29
    .line 30
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const-string v2, "#FFEED0"

    .line 35
    .line 36
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    filled-new-array {v1, v2, v0}, [I

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method public c(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "#000000"

    .line 4
    .line 5
    :goto_0
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const-string p0, "#80FFD78C"

    .line 11
    .line 12
    goto :goto_0
.end method

.method public d()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "\u5f00\u542f\u5168\u65b0\u4f53\u9a8c"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/m8h0;->x()Landroid/widget/RelativeLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/m8h0;->m()Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/gbc0;->z1:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/m8h0;->w()Lv/VImage;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Ll/gbc0;->B1:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/m8h0;->V()Lv/VImage;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Ll/gbc0;->F1:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/m8h0;->L()Lv/VImage;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget v1, Ll/gbc0;->F1:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/m8h0;->y()Lv/VLinear;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Ll/m8h0;->m()Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget v2, Ll/gbc0;->C1:I

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Ll/m8h0;->z()Lv/VLinear;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1}, Ll/m8h0;->m()Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    sget v2, Ll/gbc0;->C1:I

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Ll/m8h0;->u()Lv/VLinear;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1}, Ll/m8h0;->m()Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    sget v2, Ll/gbc0;->C1:I

    .line 132
    .line 133
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Ll/m8h0;->A()Lv/VLinear;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v1}, Ll/m8h0;->m()Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    sget v2, Ll/gbc0;->C1:I

    .line 157
    .line 158
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v0}, Ll/m8h0;->v()Lv/VText;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v1}, Ll/m8h0;->m()Lcom/p1/mobile/putong/core/newui/supreme/SupremeCustomAct;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    sget v2, Ll/gbc0;->A1:I

    .line 182
    .line 183
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Ll/m8h0;->U()Lv/VText;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    const/4 v1, 0x4

    .line 199
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0}, Ll/m8h0;->K()Lv/VText;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-virtual {v0}, Ll/m8h0;->Q()Lv/VText;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v0}, Ll/m8h0;->Z()Lv/VText;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    const-string v1, "\u6743\u76ca\u5347\u7ea7\u5305"

    .line 233
    .line 234
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-virtual {v0}, Ll/m8h0;->W()Lv/VText;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    const-string v2, "\u9009\u62e9\u4f60\u559c\u6b22\u7684\u7c7b\u578b"

    .line 246
    .line 247
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v0}, Ll/m8h0;->X()Lv/VText;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    const-string v3, "\u4eab\u53d7\u4e13\u5c5e\u4f60\u7684\u4ea4\u53cb\u4f53\u9a8c"

    .line 259
    .line 260
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v0}, Ll/m8h0;->d0()Lv/VText;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v0}, Ll/m8h0;->c0()Lv/VText;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    const-string v2, "\u8ba9\u6211\u4eec\u66f4\u4e86\u89e3\u4f60\u7684\u4ea4\u53cb\u504f\u597d"

    .line 283
    .line 284
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Ll/m8h0;->S()Lv/VText;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0}, Ll/m8h0;->P()Lv/VText;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    const-string v1, "\u5f00\u542f\u4f60\u7684\u60ca\u559c\u5b9a\u5236\u4e4b\u65c5"

    .line 307
    .line 308
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-virtual {v0}, Ll/m8h0;->R()Lv/VText;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 324
    .line 325
    .line 326
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 327
    .line 328
    const/16 v1, 0x63

    .line 329
    .line 330
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 335
    .line 336
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-virtual {v0}, Ll/m8h0;->M()Lv/VImage;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 349
    .line 350
    .line 351
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 352
    .line 353
    const/16 v1, 0x4e

    .line 354
    .line 355
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 360
    .line 361
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    invoke-virtual {v0}, Ll/m8h0;->N()Lv/VImage;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 374
    .line 375
    .line 376
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 377
    .line 378
    const/4 v1, -0x1

    .line 379
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 380
    .line 381
    sget v2, Ll/ddc0;->E:I

    .line 382
    .line 383
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->i:I

    .line 384
    .line 385
    const/16 v2, 0x5a

    .line 386
    .line 387
    invoke-static {v2}, Ll/txq;->c(I)I

    .line 388
    .line 389
    .line 390
    move-result v3

    .line 391
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 392
    .line 393
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    invoke-virtual {p0}, Ll/m8h0;->O()Lv/VImage;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 406
    .line 407
    .line 408
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 409
    .line 410
    iput v1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 411
    .line 412
    sget v0, Ll/ddc0;->E:I

    .line 413
    .line 414
    iput v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->i:I

    .line 415
    .line 416
    invoke-static {v2}, Ll/txq;->c(I)I

    .line 417
    .line 418
    .line 419
    move-result v0

    .line 420
    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 421
    .line 422
    return-void
.end method

.method public g()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/m8h0;->d0()Lv/VText;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "#C5AD7D"

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const-string v3, "#F9ECCA"

    .line 16
    .line 17
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    filled-new-array {v2, v4, v5}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/m8h0;->c0()Lv/VText;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    filled-new-array {v2, v4, v5}, [I

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/m8h0;->H()Lv/VText;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    filled-new-array {v2, v4, v5}, [I

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/m8h0;->G()Lv/VText;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    filled-new-array {v2, v4, v5}, [I

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Ll/m8h0;->S()Lv/VText;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v2, "#D1AE68"

    .line 122
    .line 123
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    const-string v5, "#FFF7E2"

    .line 128
    .line 129
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    const-string v7, "#E2B761"

    .line 134
    .line 135
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    filled-new-array {v4, v6, v8}, [I

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {p0, v0, v4}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0}, Ll/m8h0;->K()Lv/VText;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v4, "#D6AF74"

    .line 155
    .line 156
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    const-string v8, "#FFE7C3"

    .line 161
    .line 162
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v8

    .line 166
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    filled-new-array {v6, v8, v4}, [I

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {p0, v0, v4}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0}, Ll/m8h0;->R()Lv/VText;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    filled-new-array {v2, v4, v5}, [I

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v0}, Ll/m8h0;->P()Lv/VText;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    filled-new-array {v2, v4, v5}, [I

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0}, Ll/m8h0;->Q()Lv/VText;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 244
    .line 245
    .line 246
    move-result v3

    .line 247
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    filled-new-array {v2, v3, v1}, [I

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-virtual {p0, v0, v1}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method public h()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/m8h0;->Z()Lv/VText;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "#D1AE68"

    .line 10
    .line 11
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const-string v3, "#FFF7E2"

    .line 16
    .line 17
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const-string v5, "#E2B761"

    .line 22
    .line 23
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    filled-new-array {v2, v4, v6}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/m8h0;->U()Lv/VText;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v2, "#D6AF74"

    .line 43
    .line 44
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    const-string v6, "#FFE7C3"

    .line 49
    .line 50
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    filled-new-array {v4, v6, v2}, [I

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/m8h0;->Y()Lv/VText;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    filled-new-array {v1, v2, v3}, [I

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {p0, v0, v1}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/m8h0;->W()Lv/VText;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v1, "#C5AD7D"

    .line 101
    .line 102
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    const-string v3, "#F9ECCA"

    .line 107
    .line 108
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    filled-new-array {v2, v4, v5}, [I

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {p0, v0, v2}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Ll/w4;->e()Ll/m8h0;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Ll/m8h0;->X()Lv/VText;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    filled-new-array {v2, v3, v1}, [I

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {p0, v0, v1}, Ll/w4;->i(Landroid/widget/TextView;[I)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public j(Lv/VDraweeView;)V
    .locals 0
    .param p1    # Lv/VDraweeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/wlj;

    .line 9
    .line 10
    sget p1, Ll/gbc0;->D1:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/wlj;->D(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k(Lv/VImage;)V
    .locals 0
    .param p1    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget p0, Ll/gbc0;->E1:I

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
