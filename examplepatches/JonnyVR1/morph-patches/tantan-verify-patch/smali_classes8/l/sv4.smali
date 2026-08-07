.class public Ll/sv4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Landroid/widget/ImageView$ScaleType;

.field public i:I

.field public j:J

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public l:Z

.field public m:F


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 5
    .line 6
    iput-object v0, p0, Ll/sv4;->h:Landroid/widget/ImageView$ScaleType;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/sv4;->i:I

    .line 10
    .line 11
    const-wide/16 v0, 0x3e8

    .line 12
    .line 13
    iput-wide v0, p0, Ll/sv4;->j:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/sv4;->l:Z

    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    iput v0, p0, Ll/sv4;->m:F

    .line 21
    .line 22
    iput p1, p0, Ll/sv4;->a:I

    .line 23
    .line 24
    iput p2, p0, Ll/sv4;->b:I

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/sv4;->k:Ljava/util/List;

    .line 32
    .line 33
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/data/Sticker;)Ll/sv4;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_6

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 5
    .line 6
    const-string v2, "poke"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "\u665a\u5b89"

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/16 v2, 0x11

    .line 25
    .line 26
    const/4 v3, -0x1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    new-instance p0, Ll/sv4;

    .line 30
    .line 31
    invoke-direct {p0, v3, v3}, Ll/sv4;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v2}, Ll/sv4;->b(I)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x1f

    .line 38
    .line 39
    iput v0, p0, Ll/sv4;->i:I

    .line 40
    .line 41
    const-wide/16 v0, 0x12c

    .line 42
    .line 43
    iput-wide v0, p0, Ll/sv4;->j:J

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 47
    .line 48
    const-string v4, "\u9707\u60ca"

    .line 49
    .line 50
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/16 v4, 0x51

    .line 55
    .line 56
    const/4 v5, 0x1

    .line 57
    const/4 v6, 0x0

    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    new-instance p0, Ll/sv4;

    .line 61
    .line 62
    const/high16 v0, 0x43c80000    # 400.0f

    .line 63
    .line 64
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-direct {p0, v3, v0}, Ll/sv4;-><init>(II)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v4}, Ll/sv4;->b(I)V

    .line 72
    .line 73
    .line 74
    const/high16 v0, 0x42180000    # 38.0f

    .line 75
    .line 76
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    const/high16 v2, 0x42d20000    # 105.0f

    .line 85
    .line 86
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-virtual {p0, v1, v6, v0, v2}, Ll/sv4;->c(IIII)V

    .line 91
    .line 92
    .line 93
    const/16 v0, 0x2f

    .line 94
    .line 95
    iput v0, p0, Ll/sv4;->i:I

    .line 96
    .line 97
    iput-boolean v5, p0, Ll/sv4;->l:Z

    .line 98
    .line 99
    return-object p0

    .line 100
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 101
    .line 102
    const-string v7, "\u5927\u7b11"

    .line 103
    .line 104
    invoke-static {v1, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_3

    .line 109
    .line 110
    new-instance p0, Ll/sv4;

    .line 111
    .line 112
    const/high16 v0, 0x43690000    # 233.0f

    .line 113
    .line 114
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-direct {p0, v3, v0}, Ll/sv4;-><init>(II)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v4}, Ll/sv4;->b(I)V

    .line 122
    .line 123
    .line 124
    const/high16 v0, 0x43340000    # 180.0f

    .line 125
    .line 126
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-virtual {p0, v6, v6, v6, v0}, Ll/sv4;->c(IIII)V

    .line 131
    .line 132
    .line 133
    const/4 v0, 0x3

    .line 134
    iput v0, p0, Ll/sv4;->i:I

    .line 135
    .line 136
    const v0, 0x3f4ccccd    # 0.8f

    .line 137
    .line 138
    .line 139
    iput v0, p0, Ll/sv4;->m:F

    .line 140
    .line 141
    iput-boolean v5, p0, Ll/sv4;->l:Z

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 145
    .line 146
    const-string v7, "\u5927\u54ed"

    .line 147
    .line 148
    invoke-static {v1, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_4

    .line 153
    .line 154
    new-instance p0, Ll/sv4;

    .line 155
    .line 156
    const v0, 0x43858000    # 267.0f

    .line 157
    .line 158
    .line 159
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    invoke-direct {p0, v3, v0}, Ll/sv4;-><init>(II)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, v4}, Ll/sv4;->b(I)V

    .line 167
    .line 168
    .line 169
    const/high16 v0, 0x42d60000    # 107.0f

    .line 170
    .line 171
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    invoke-virtual {p0, v6, v6, v6, v0}, Ll/sv4;->c(IIII)V

    .line 176
    .line 177
    .line 178
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_END:Landroid/widget/ImageView$ScaleType;

    .line 179
    .line 180
    invoke-virtual {p0, v0}, Ll/sv4;->d(Landroid/widget/ImageView$ScaleType;)V

    .line 181
    .line 182
    .line 183
    const/16 v0, 0x3c

    .line 184
    .line 185
    iput v0, p0, Ll/sv4;->i:I

    .line 186
    .line 187
    iput-boolean v5, p0, Ll/sv4;->l:Z

    .line 188
    .line 189
    return-object p0

    .line 190
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 191
    .line 192
    const-string v4, "\u6bd4\u5fc3"

    .line 193
    .line 194
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    const v4, 0x3ecccccd    # 0.4f

    .line 199
    .line 200
    .line 201
    if-eqz v1, :cond_5

    .line 202
    .line 203
    new-instance p0, Ll/sv4;

    .line 204
    .line 205
    const v0, 0x43f78000    # 495.0f

    .line 206
    .line 207
    .line 208
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    invoke-direct {p0, v3, v0}, Ll/sv4;-><init>(II)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v2}, Ll/sv4;->b(I)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0, v6, v6, v6, v6}, Ll/sv4;->c(IIII)V

    .line 219
    .line 220
    .line 221
    const/16 v0, 0x62

    .line 222
    .line 223
    iput v0, p0, Ll/sv4;->i:I

    .line 224
    .line 225
    iput-boolean v5, p0, Ll/sv4;->l:Z

    .line 226
    .line 227
    iput v4, p0, Ll/sv4;->m:F

    .line 228
    .line 229
    return-object p0

    .line 230
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 231
    .line 232
    const-string v1, "\u5728\u5417"

    .line 233
    .line 234
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    if-eqz p0, :cond_6

    .line 239
    .line 240
    new-instance p0, Ll/sv4;

    .line 241
    .line 242
    const/high16 v0, 0x43200000    # 160.0f

    .line 243
    .line 244
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    const/high16 v1, 0x43480000    # 200.0f

    .line 249
    .line 250
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    invoke-direct {p0, v0, v1}, Ll/sv4;-><init>(II)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0, v2}, Ll/sv4;->b(I)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {p0, v6, v6, v6, v6}, Ll/sv4;->c(IIII)V

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Ll/sv4;->k:Ljava/util/List;

    .line 264
    .line 265
    const/16 v1, 0x16

    .line 266
    .line 267
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 272
    .line 273
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    iget-object v0, p0, Ll/sv4;->k:Ljava/util/List;

    .line 281
    .line 282
    const/16 v1, 0x31

    .line 283
    .line 284
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    iput-boolean v5, p0, Ll/sv4;->l:Z

    .line 296
    .line 297
    iput v4, p0, Ll/sv4;->m:F

    .line 298
    .line 299
    return-object p0

    .line 300
    :cond_6
    :goto_0
    return-object v0
.end method


# virtual methods
.method public b(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/sv4;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public c(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Ll/sv4;->c:I

    .line 2
    .line 3
    iput p2, p0, Ll/sv4;->e:I

    .line 4
    .line 5
    iput p3, p0, Ll/sv4;->d:I

    .line 6
    .line 7
    iput p4, p0, Ll/sv4;->f:I

    .line 8
    .line 9
    return-void
.end method

.method public d(Landroid/widget/ImageView$ScaleType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sv4;->h:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-void
.end method

.method public e(Lcom/tantan/library/svga/SVGAnimationView;ILandroid/view/View;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    invoke-virtual {p4}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    sub-int/2addr p3, p4

    .line 16
    if-lez p3, :cond_0

    .line 17
    .line 18
    iget p4, p0, Ll/sv4;->f:I

    .line 19
    .line 20
    if-lez p4, :cond_0

    .line 21
    .line 22
    add-int/2addr p4, p3

    .line 23
    iput p4, p0, Ll/sv4;->f:I

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    check-cast p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    iget p4, p0, Ll/sv4;->c:I

    .line 32
    .line 33
    iget v0, p0, Ll/sv4;->e:I

    .line 34
    .line 35
    iget v1, p0, Ll/sv4;->d:I

    .line 36
    .line 37
    iget v2, p0, Ll/sv4;->f:I

    .line 38
    .line 39
    invoke-virtual {p3, p4, v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 40
    .line 41
    .line 42
    iget-boolean p4, p0, Ll/sv4;->l:Z

    .line 43
    .line 44
    if-eqz p4, :cond_1

    .line 45
    .line 46
    int-to-float p2, p2

    .line 47
    iget p4, p0, Ll/sv4;->m:F

    .line 48
    .line 49
    mul-float/2addr p2, p4

    .line 50
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget p2, p0, Ll/sv4;->g:I

    .line 54
    .line 55
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 56
    .line 57
    iget p2, p0, Ll/sv4;->a:I

    .line 58
    .line 59
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 60
    .line 61
    iget p2, p0, Ll/sv4;->b:I

    .line 62
    .line 63
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 64
    .line 65
    invoke-virtual {p1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/sv4;->h:Landroid/widget/ImageView$ScaleType;

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void
.end method
