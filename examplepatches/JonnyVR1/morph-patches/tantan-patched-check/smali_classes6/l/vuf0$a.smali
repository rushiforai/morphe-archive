.class public Ll/vuf0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vuf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public A:Z

.field public B:Landroid/graphics/drawable/Drawable;

.field public C:Z

.field public D:Landroid/net/Uri;

.field public E:Z

.field public F:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public G:Landroid/text/style/ClickableSpan;

.field public H:Ljava/lang/String;

.field public final I:Landroid/text/SpannableStringBuilder;

.field public a:Landroid/content/Context;

.field public b:I

.field public c:Ljava/lang/CharSequence;

.field public d:I

.field public e:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public f:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public g:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public h:Z

.field public i:I

.field public j:I

.field public k:Z

.field public l:I

.field public m:I

.field public n:F

.field public o:F

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Ljava/lang/String;

.field public x:Landroid/text/Layout$Alignment;

.field public y:Z

.field public z:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/CharSequence;)V
    .locals 1
    .param p2    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x12000000

    .line 5
    .line 6
    iput v0, p0, Ll/vuf0$a;->b:I

    .line 7
    .line 8
    iput-object p1, p0, Ll/vuf0$a;->a:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p2, p0, Ll/vuf0$a;->c:Ljava/lang/CharSequence;

    .line 11
    .line 12
    const/16 p1, 0x21

    .line 13
    .line 14
    iput p1, p0, Ll/vuf0$a;->d:I

    .line 15
    .line 16
    iput v0, p0, Ll/vuf0$a;->e:I

    .line 17
    .line 18
    iput v0, p0, Ll/vuf0$a;->f:I

    .line 19
    .line 20
    iput v0, p0, Ll/vuf0$a;->g:I

    .line 21
    .line 22
    const/high16 p1, -0x40800000    # -1.0f

    .line 23
    .line 24
    iput p1, p0, Ll/vuf0$a;->n:F

    .line 25
    .line 26
    iput p1, p0, Ll/vuf0$a;->o:F

    .line 27
    .line 28
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/CharSequence;Ll/wuf0;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2}, Ll/vuf0$a;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;)Ll/vuf0$a;
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/vuf0$a;->e()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vuf0$a;->c:Ljava/lang/CharSequence;

    .line 5
    .line 6
    return-object p0
.end method

.method public b()Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vuf0$a;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 5
    .line 6
    return-object p0
.end method

.method public c(I)Ll/vuf0$a;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/vuf0$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(F)Ll/vuf0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/vuf0$a;->n:F

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 8
    .line 9
    iget-object v2, p0, Ll/vuf0$a;->c:Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v2, p0, Ll/vuf0$a;->e:I

    .line 21
    .line 22
    iget v3, p0, Ll/vuf0$a;->b:I

    .line 23
    .line 24
    if-eq v2, v3, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 27
    .line 28
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 29
    .line 30
    iget v4, p0, Ll/vuf0$a;->e:I

    .line 31
    .line 32
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 33
    .line 34
    .line 35
    iget v4, p0, Ll/vuf0$a;->d:I

    .line 36
    .line 37
    invoke-virtual {v2, v3, v0, v1, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 38
    .line 39
    .line 40
    iget v2, p0, Ll/vuf0$a;->b:I

    .line 41
    .line 42
    iput v2, p0, Ll/vuf0$a;->e:I

    .line 43
    .line 44
    :cond_0
    iget v2, p0, Ll/vuf0$a;->f:I

    .line 45
    .line 46
    iget v3, p0, Ll/vuf0$a;->b:I

    .line 47
    .line 48
    if-eq v2, v3, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 51
    .line 52
    new-instance v3, Landroid/text/style/BackgroundColorSpan;

    .line 53
    .line 54
    iget v4, p0, Ll/vuf0$a;->f:I

    .line 55
    .line 56
    invoke-direct {v3, v4}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 57
    .line 58
    .line 59
    iget v4, p0, Ll/vuf0$a;->d:I

    .line 60
    .line 61
    invoke-virtual {v2, v3, v0, v1, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 62
    .line 63
    .line 64
    iget v2, p0, Ll/vuf0$a;->b:I

    .line 65
    .line 66
    iput v2, p0, Ll/vuf0$a;->f:I

    .line 67
    .line 68
    :cond_1
    iget-boolean v2, p0, Ll/vuf0$a;->h:Z

    .line 69
    .line 70
    const/4 v3, 0x0

    .line 71
    if-eqz v2, :cond_2

    .line 72
    .line 73
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 74
    .line 75
    new-instance v4, Landroid/text/style/LeadingMarginSpan$Standard;

    .line 76
    .line 77
    iget v5, p0, Ll/vuf0$a;->i:I

    .line 78
    .line 79
    iget v6, p0, Ll/vuf0$a;->j:I

    .line 80
    .line 81
    invoke-direct {v4, v5, v6}, Landroid/text/style/LeadingMarginSpan$Standard;-><init>(II)V

    .line 82
    .line 83
    .line 84
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 85
    .line 86
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 87
    .line 88
    .line 89
    iput-boolean v3, p0, Ll/vuf0$a;->h:Z

    .line 90
    .line 91
    :cond_2
    iget v2, p0, Ll/vuf0$a;->g:I

    .line 92
    .line 93
    iget v4, p0, Ll/vuf0$a;->b:I

    .line 94
    .line 95
    if-eq v2, v4, :cond_3

    .line 96
    .line 97
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 98
    .line 99
    new-instance v4, Landroid/text/style/QuoteSpan;

    .line 100
    .line 101
    iget v5, p0, Ll/vuf0$a;->g:I

    .line 102
    .line 103
    invoke-direct {v4, v5}, Landroid/text/style/QuoteSpan;-><init>(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, v4, v0, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 107
    .line 108
    .line 109
    iget v2, p0, Ll/vuf0$a;->b:I

    .line 110
    .line 111
    iput v2, p0, Ll/vuf0$a;->g:I

    .line 112
    .line 113
    :cond_3
    iget-boolean v2, p0, Ll/vuf0$a;->k:Z

    .line 114
    .line 115
    if-eqz v2, :cond_4

    .line 116
    .line 117
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 118
    .line 119
    new-instance v4, Landroid/text/style/BulletSpan;

    .line 120
    .line 121
    iget v5, p0, Ll/vuf0$a;->l:I

    .line 122
    .line 123
    iget v6, p0, Ll/vuf0$a;->m:I

    .line 124
    .line 125
    invoke-direct {v4, v5, v6}, Landroid/text/style/BulletSpan;-><init>(II)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2, v4, v0, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 129
    .line 130
    .line 131
    iput-boolean v3, p0, Ll/vuf0$a;->k:Z

    .line 132
    .line 133
    :cond_4
    iget v2, p0, Ll/vuf0$a;->n:F

    .line 134
    .line 135
    const/high16 v4, -0x40800000    # -1.0f

    .line 136
    .line 137
    cmpl-float v2, v2, v4

    .line 138
    .line 139
    if-eqz v2, :cond_5

    .line 140
    .line 141
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 142
    .line 143
    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    .line 144
    .line 145
    iget v6, p0, Ll/vuf0$a;->n:F

    .line 146
    .line 147
    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 148
    .line 149
    .line 150
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 151
    .line 152
    invoke-virtual {v2, v5, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 153
    .line 154
    .line 155
    iput v4, p0, Ll/vuf0$a;->n:F

    .line 156
    .line 157
    :cond_5
    iget v2, p0, Ll/vuf0$a;->o:F

    .line 158
    .line 159
    cmpl-float v2, v2, v4

    .line 160
    .line 161
    if-eqz v2, :cond_6

    .line 162
    .line 163
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 164
    .line 165
    new-instance v5, Landroid/text/style/ScaleXSpan;

    .line 166
    .line 167
    iget v6, p0, Ll/vuf0$a;->o:F

    .line 168
    .line 169
    invoke-direct {v5, v6}, Landroid/text/style/ScaleXSpan;-><init>(F)V

    .line 170
    .line 171
    .line 172
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 173
    .line 174
    invoke-virtual {v2, v5, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 175
    .line 176
    .line 177
    iput v4, p0, Ll/vuf0$a;->o:F

    .line 178
    .line 179
    :cond_6
    iget-boolean v2, p0, Ll/vuf0$a;->p:Z

    .line 180
    .line 181
    if-eqz v2, :cond_7

    .line 182
    .line 183
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 184
    .line 185
    new-instance v4, Landroid/text/style/StrikethroughSpan;

    .line 186
    .line 187
    invoke-direct {v4}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 188
    .line 189
    .line 190
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 191
    .line 192
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 193
    .line 194
    .line 195
    iput-boolean v3, p0, Ll/vuf0$a;->p:Z

    .line 196
    .line 197
    :cond_7
    iget-boolean v2, p0, Ll/vuf0$a;->q:Z

    .line 198
    .line 199
    if-eqz v2, :cond_8

    .line 200
    .line 201
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 202
    .line 203
    new-instance v4, Landroid/text/style/UnderlineSpan;

    .line 204
    .line 205
    invoke-direct {v4}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 206
    .line 207
    .line 208
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 209
    .line 210
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 211
    .line 212
    .line 213
    iput-boolean v3, p0, Ll/vuf0$a;->q:Z

    .line 214
    .line 215
    :cond_8
    iget-boolean v2, p0, Ll/vuf0$a;->r:Z

    .line 216
    .line 217
    if-eqz v2, :cond_9

    .line 218
    .line 219
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 220
    .line 221
    new-instance v4, Landroid/text/style/SuperscriptSpan;

    .line 222
    .line 223
    invoke-direct {v4}, Landroid/text/style/SuperscriptSpan;-><init>()V

    .line 224
    .line 225
    .line 226
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 227
    .line 228
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 229
    .line 230
    .line 231
    iput-boolean v3, p0, Ll/vuf0$a;->r:Z

    .line 232
    .line 233
    :cond_9
    iget-boolean v2, p0, Ll/vuf0$a;->s:Z

    .line 234
    .line 235
    if-eqz v2, :cond_a

    .line 236
    .line 237
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 238
    .line 239
    new-instance v4, Landroid/text/style/SubscriptSpan;

    .line 240
    .line 241
    invoke-direct {v4}, Landroid/text/style/SubscriptSpan;-><init>()V

    .line 242
    .line 243
    .line 244
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 245
    .line 246
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 247
    .line 248
    .line 249
    iput-boolean v3, p0, Ll/vuf0$a;->s:Z

    .line 250
    .line 251
    :cond_a
    iget-boolean v2, p0, Ll/vuf0$a;->t:Z

    .line 252
    .line 253
    if-eqz v2, :cond_b

    .line 254
    .line 255
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 256
    .line 257
    new-instance v4, Landroid/text/style/StyleSpan;

    .line 258
    .line 259
    const/4 v5, 0x1

    .line 260
    invoke-direct {v4, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 261
    .line 262
    .line 263
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 264
    .line 265
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 266
    .line 267
    .line 268
    iput-boolean v3, p0, Ll/vuf0$a;->t:Z

    .line 269
    .line 270
    :cond_b
    iget-boolean v2, p0, Ll/vuf0$a;->u:Z

    .line 271
    .line 272
    if-eqz v2, :cond_c

    .line 273
    .line 274
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 275
    .line 276
    new-instance v4, Landroid/text/style/StyleSpan;

    .line 277
    .line 278
    const/4 v5, 0x2

    .line 279
    invoke-direct {v4, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 280
    .line 281
    .line 282
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 283
    .line 284
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 285
    .line 286
    .line 287
    iput-boolean v3, p0, Ll/vuf0$a;->u:Z

    .line 288
    .line 289
    :cond_c
    iget-boolean v2, p0, Ll/vuf0$a;->v:Z

    .line 290
    .line 291
    if-eqz v2, :cond_d

    .line 292
    .line 293
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 294
    .line 295
    new-instance v4, Landroid/text/style/StyleSpan;

    .line 296
    .line 297
    const/4 v5, 0x3

    .line 298
    invoke-direct {v4, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 299
    .line 300
    .line 301
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 302
    .line 303
    invoke-virtual {v2, v4, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 304
    .line 305
    .line 306
    iput-boolean v3, p0, Ll/vuf0$a;->v:Z

    .line 307
    .line 308
    :cond_d
    iget-object v2, p0, Ll/vuf0$a;->w:Ljava/lang/String;

    .line 309
    .line 310
    const/4 v4, 0x0

    .line 311
    if-eqz v2, :cond_e

    .line 312
    .line 313
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 314
    .line 315
    new-instance v5, Landroid/text/style/TypefaceSpan;

    .line 316
    .line 317
    iget-object v6, p0, Ll/vuf0$a;->w:Ljava/lang/String;

    .line 318
    .line 319
    invoke-direct {v5, v6}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 323
    .line 324
    invoke-virtual {v2, v5, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 325
    .line 326
    .line 327
    iput-object v4, p0, Ll/vuf0$a;->w:Ljava/lang/String;

    .line 328
    .line 329
    :cond_e
    iget-object v2, p0, Ll/vuf0$a;->x:Landroid/text/Layout$Alignment;

    .line 330
    .line 331
    if-eqz v2, :cond_f

    .line 332
    .line 333
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 334
    .line 335
    new-instance v5, Landroid/text/style/AlignmentSpan$Standard;

    .line 336
    .line 337
    iget-object v6, p0, Ll/vuf0$a;->x:Landroid/text/Layout$Alignment;

    .line 338
    .line 339
    invoke-direct {v5, v6}, Landroid/text/style/AlignmentSpan$Standard;-><init>(Landroid/text/Layout$Alignment;)V

    .line 340
    .line 341
    .line 342
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 343
    .line 344
    invoke-virtual {v2, v5, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 345
    .line 346
    .line 347
    iput-object v4, p0, Ll/vuf0$a;->x:Landroid/text/Layout$Alignment;

    .line 348
    .line 349
    :cond_f
    iget-boolean v2, p0, Ll/vuf0$a;->y:Z

    .line 350
    .line 351
    if-nez v2, :cond_10

    .line 352
    .line 353
    iget-boolean v5, p0, Ll/vuf0$a;->A:Z

    .line 354
    .line 355
    if-nez v5, :cond_10

    .line 356
    .line 357
    iget-boolean v5, p0, Ll/vuf0$a;->C:Z

    .line 358
    .line 359
    if-nez v5, :cond_10

    .line 360
    .line 361
    iget-boolean v5, p0, Ll/vuf0$a;->E:Z

    .line 362
    .line 363
    if-eqz v5, :cond_14

    .line 364
    .line 365
    :cond_10
    if-eqz v2, :cond_11

    .line 366
    .line 367
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 368
    .line 369
    new-instance v5, Landroid/text/style/ImageSpan;

    .line 370
    .line 371
    iget-object v6, p0, Ll/vuf0$a;->a:Landroid/content/Context;

    .line 372
    .line 373
    iget-object v7, p0, Ll/vuf0$a;->z:Landroid/graphics/Bitmap;

    .line 374
    .line 375
    invoke-direct {v5, v6, v7}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 376
    .line 377
    .line 378
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 379
    .line 380
    invoke-virtual {v2, v5, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 381
    .line 382
    .line 383
    iput-object v4, p0, Ll/vuf0$a;->z:Landroid/graphics/Bitmap;

    .line 384
    .line 385
    iput-boolean v3, p0, Ll/vuf0$a;->y:Z

    .line 386
    .line 387
    goto :goto_0

    .line 388
    :cond_11
    iget-boolean v2, p0, Ll/vuf0$a;->A:Z

    .line 389
    .line 390
    if-eqz v2, :cond_12

    .line 391
    .line 392
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 393
    .line 394
    new-instance v5, Landroid/text/style/ImageSpan;

    .line 395
    .line 396
    iget-object v6, p0, Ll/vuf0$a;->B:Landroid/graphics/drawable/Drawable;

    .line 397
    .line 398
    invoke-direct {v5, v6}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 399
    .line 400
    .line 401
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 402
    .line 403
    invoke-virtual {v2, v5, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 404
    .line 405
    .line 406
    iput-object v4, p0, Ll/vuf0$a;->B:Landroid/graphics/drawable/Drawable;

    .line 407
    .line 408
    iput-boolean v3, p0, Ll/vuf0$a;->A:Z

    .line 409
    .line 410
    goto :goto_0

    .line 411
    :cond_12
    iget-boolean v2, p0, Ll/vuf0$a;->C:Z

    .line 412
    .line 413
    iget-object v5, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 414
    .line 415
    if-eqz v2, :cond_13

    .line 416
    .line 417
    new-instance v2, Landroid/text/style/ImageSpan;

    .line 418
    .line 419
    iget-object v6, p0, Ll/vuf0$a;->a:Landroid/content/Context;

    .line 420
    .line 421
    iget-object v7, p0, Ll/vuf0$a;->D:Landroid/net/Uri;

    .line 422
    .line 423
    invoke-direct {v2, v6, v7}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 424
    .line 425
    .line 426
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 427
    .line 428
    invoke-virtual {v5, v2, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 429
    .line 430
    .line 431
    iput-object v4, p0, Ll/vuf0$a;->D:Landroid/net/Uri;

    .line 432
    .line 433
    iput-boolean v3, p0, Ll/vuf0$a;->C:Z

    .line 434
    .line 435
    goto :goto_0

    .line 436
    :cond_13
    new-instance v2, Landroid/text/style/ImageSpan;

    .line 437
    .line 438
    iget-object v6, p0, Ll/vuf0$a;->a:Landroid/content/Context;

    .line 439
    .line 440
    iget v7, p0, Ll/vuf0$a;->F:I

    .line 441
    .line 442
    invoke-direct {v2, v6, v7}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;I)V

    .line 443
    .line 444
    .line 445
    iget v6, p0, Ll/vuf0$a;->d:I

    .line 446
    .line 447
    invoke-virtual {v5, v2, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 448
    .line 449
    .line 450
    iput v3, p0, Ll/vuf0$a;->F:I

    .line 451
    .line 452
    iput-boolean v3, p0, Ll/vuf0$a;->E:Z

    .line 453
    .line 454
    :cond_14
    :goto_0
    iget-object v2, p0, Ll/vuf0$a;->G:Landroid/text/style/ClickableSpan;

    .line 455
    .line 456
    if-eqz v2, :cond_15

    .line 457
    .line 458
    iget-object v3, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 459
    .line 460
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 461
    .line 462
    invoke-virtual {v3, v2, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 463
    .line 464
    .line 465
    iput-object v4, p0, Ll/vuf0$a;->G:Landroid/text/style/ClickableSpan;

    .line 466
    .line 467
    :cond_15
    iget-object v2, p0, Ll/vuf0$a;->H:Ljava/lang/String;

    .line 468
    .line 469
    if-eqz v2, :cond_16

    .line 470
    .line 471
    iget-object v2, p0, Ll/vuf0$a;->I:Landroid/text/SpannableStringBuilder;

    .line 472
    .line 473
    new-instance v3, Landroid/text/style/URLSpan;

    .line 474
    .line 475
    iget-object v5, p0, Ll/vuf0$a;->H:Ljava/lang/String;

    .line 476
    .line 477
    invoke-direct {v3, v5}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    iget v5, p0, Ll/vuf0$a;->d:I

    .line 481
    .line 482
    invoke-virtual {v2, v3, v0, v1, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 483
    .line 484
    .line 485
    iput-object v4, p0, Ll/vuf0$a;->H:Ljava/lang/String;

    .line 486
    .line 487
    :cond_16
    const/16 v0, 0x21

    .line 488
    .line 489
    iput v0, p0, Ll/vuf0$a;->d:I

    .line 490
    .line 491
    return-void
.end method
