.class public Ll/izs;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, p1, v0, v1}, Ll/izs;->B(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/imagepipeline/common/Priority;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static B(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/imagepipeline/common/Priority;Z)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/r230$e;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/r230$e;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/r230$e;->b(Ljava/lang/String;)Ll/r230$f;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ll/r230$e;->g(Lcom/facebook/imagepipeline/common/Priority;)Ll/r230$e;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ll/r230$e;->f()Ll/r230;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p3}, Ll/r230;->L(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;ILandroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-static {p2, p0, p1}, Ll/izs;->z(Landroid/graphics/Bitmap;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(ILandroid/content/Context;[Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .locals 13

    .line 1
    array-length v0, p2

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_2

    .line 5
    .line 6
    aget-object v3, p2, v2

    .line 7
    .line 8
    if-nez v3, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    check-cast v3, Landroid/graphics/Bitmap;

    .line 12
    .line 13
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_1

    .line 18
    .line 19
    :goto_1
    sget p0, Ll/mbc0;->T:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 30
    .line 31
    invoke-static {p0, p0, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    new-instance v3, Landroid/graphics/Canvas;

    .line 36
    .line 37
    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    sget v5, Ll/l9c0;->b:I

    .line 45
    .line 46
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 51
    .line 52
    .line 53
    const/4 v4, 0x1

    .line 54
    const/4 v5, 0x0

    .line 55
    const/4 v6, 0x0

    .line 56
    const/4 v7, 0x2

    .line 57
    if-eq v0, v4, :cond_6

    .line 58
    .line 59
    if-eq v0, v7, :cond_5

    .line 60
    .line 61
    const/4 v8, 0x3

    .line 62
    if-eq v0, v8, :cond_4

    .line 63
    .line 64
    const/4 v9, 0x4

    .line 65
    if-eq v0, v9, :cond_3

    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_3
    aget-object v0, p2, v1

    .line 70
    .line 71
    check-cast v0, Landroid/graphics/Bitmap;

    .line 72
    .line 73
    div-int/lit8 v9, p0, 0x2

    .line 74
    .line 75
    sget v10, Ll/qa00;->c:I

    .line 76
    .line 77
    div-int/2addr v10, v7

    .line 78
    sub-int v11, v9, v10

    .line 79
    .line 80
    invoke-static {v0, v11, v11, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    aget-object v4, p2, v4

    .line 85
    .line 86
    check-cast v4, Landroid/graphics/Bitmap;

    .line 87
    .line 88
    invoke-static {v4, v11, v11, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    aget-object v12, p2, v7

    .line 93
    .line 94
    check-cast v12, Landroid/graphics/Bitmap;

    .line 95
    .line 96
    invoke-static {v12, v11, v11, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 97
    .line 98
    .line 99
    move-result-object v12

    .line 100
    aget-object p2, p2, v8

    .line 101
    .line 102
    check-cast p2, Landroid/graphics/Bitmap;

    .line 103
    .line 104
    invoke-static {p2, v11, v11, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {v3, v0, v6, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 109
    .line 110
    .line 111
    add-int/2addr v9, v10

    .line 112
    int-to-float v0, v9

    .line 113
    invoke-virtual {v3, v4, v0, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3, v12, v6, v0, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3, p2, v0, v0, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    aget-object v0, p2, v1

    .line 124
    .line 125
    check-cast v0, Landroid/graphics/Bitmap;

    .line 126
    .line 127
    invoke-static {v0, p0, p0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    div-int/lit8 v8, p0, 0x4

    .line 132
    .line 133
    sget v9, Ll/qa00;->c:I

    .line 134
    .line 135
    div-int/2addr v9, v7

    .line 136
    add-int/2addr v8, v9

    .line 137
    div-int/lit8 v10, p0, 0x2

    .line 138
    .line 139
    sub-int v11, v10, v9

    .line 140
    .line 141
    invoke-static {v0, v8, v1, v11, p0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    aget-object v4, p2, v4

    .line 146
    .line 147
    check-cast v4, Landroid/graphics/Bitmap;

    .line 148
    .line 149
    invoke-static {v4, v11, v11, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    aget-object p2, p2, v7

    .line 154
    .line 155
    check-cast p2, Landroid/graphics/Bitmap;

    .line 156
    .line 157
    invoke-static {p2, v11, v11, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    invoke-virtual {v3, v0, v6, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 162
    .line 163
    .line 164
    add-int/2addr v10, v9

    .line 165
    int-to-float v0, v10

    .line 166
    invoke-virtual {v3, v4, v0, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3, p2, v0, v0, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_5
    aget-object v0, p2, v1

    .line 174
    .line 175
    check-cast v0, Landroid/graphics/Bitmap;

    .line 176
    .line 177
    invoke-static {v0, p0, p0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    aget-object p2, p2, v4

    .line 182
    .line 183
    check-cast p2, Landroid/graphics/Bitmap;

    .line 184
    .line 185
    invoke-static {p2, p0, p0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    div-int/lit8 v4, p0, 0x4

    .line 190
    .line 191
    sget v8, Ll/qa00;->c:I

    .line 192
    .line 193
    div-int/2addr v8, v7

    .line 194
    add-int/2addr v4, v8

    .line 195
    div-int/lit8 v9, p0, 0x2

    .line 196
    .line 197
    sub-int v10, v9, v8

    .line 198
    .line 199
    invoke-static {v0, v4, v1, v10, p0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-static {p2, v4, v1, v10, p0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    invoke-virtual {v3, v0, v6, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 208
    .line 209
    .line 210
    add-int/2addr v9, v8

    .line 211
    int-to-float v0, v9

    .line 212
    invoke-virtual {v3, p2, v0, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 213
    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_6
    aget-object p2, p2, v1

    .line 217
    .line 218
    check-cast p2, Landroid/graphics/Bitmap;

    .line 219
    .line 220
    invoke-static {p2, p0, p0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 221
    .line 222
    .line 223
    move-result-object p2

    .line 224
    invoke-virtual {v3, p2, v6, v6, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 225
    .line 226
    .line 227
    :goto_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-static {p1, v2}, Ll/end0;->a(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Ll/dnd0;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    div-int/2addr p0, v7

    .line 236
    int-to-float p0, p0

    .line 237
    invoke-virtual {p1, p0}, Ll/dnd0;->e(F)V

    .line 238
    .line 239
    .line 240
    return-object p1
.end method

.method public static synthetic c(Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public static d(Ll/ner;Ljava/lang/String;Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p3}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ll/fzs;

    .line 18
    .line 19
    invoke-direct {p1, p2}, Ll/fzs;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/r230$e;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/r230$e;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/r230$e;->b(Ljava/lang/String;)Ll/r230$f;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/r230$e;->f()Ll/r230;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/r230;->v()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/r230$e;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/r230$e;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/r230$e;->b(Ljava/lang/String;)Ll/r230$f;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p2, p2}, Ll/r230$e;->h(II)Ll/r230$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/r230$e;->f()Ll/r230;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/r230;->v()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/gzs;

    .line 25
    .line 26
    invoke-direct {v0, p1, p2}, Ll/gzs;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/r230$e;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/r230$e;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/r230$e;->b(Ljava/lang/String;)Ll/r230$f;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/r230$e;->f()Ll/r230;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p2}, Ll/r230;->u(Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static h(Landroid/content/Context;Ljava/util/List;I)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)",
            "Lrx/c<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, "context_single_room"

    .line 27
    .line 28
    invoke-static {v2, v1, p2}, Ll/izs;->f(Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    new-instance p1, Ll/hzs;

    .line 37
    .line 38
    invoke-direct {p1, p2, p0}, Ll/hzs;-><init>(ILandroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static i(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZLl/x20;Ll/x20;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    new-instance v0, Ll/r230$d;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/r230$d;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ll/r230$j;->b(Ljava/lang/String;)Ll/r230$f;

    .line 17
    .line 18
    .line 19
    if-eqz p6, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0, p6}, Ll/r230$d;->x(Ll/x20;)Ll/r230$d;

    .line 22
    .line 23
    .line 24
    :cond_2
    if-eqz p7, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0, p7}, Ll/r230$d;->w(Ll/x20;)Ll/r230$d;

    .line 27
    .line 28
    .line 29
    :cond_3
    if-nez p5, :cond_4

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-virtual {v0, p0}, Ll/r230$j;->l(Z)Ll/r230$j;

    .line 33
    .line 34
    .line 35
    :cond_4
    if-eqz p4, :cond_5

    .line 36
    .line 37
    invoke-virtual {v0, p4, p4}, Ll/r230$j;->o(II)Ll/r230$j;

    .line 38
    .line 39
    .line 40
    :cond_5
    invoke-virtual {v0, p3}, Ll/r230$d;->v(I)Ll/r230$d;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ll/r230$d;->k()Ll/r230;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, p1}, Ll/r230;->D(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static j(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IZLl/x20;Ll/x20;)V
    .locals 8

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v5, p4

    .line 7
    move-object v6, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-static/range {v0 .. v7}, Ll/izs;->i(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZLl/x20;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const v3, 0x7fffffff

    .line 4
    .line 5
    .line 6
    const/4 v4, 0x1

    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    invoke-static/range {v0 .. v6}, Ll/izs;->j(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IZLl/x20;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static l(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v4, 0x1

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v3, p3

    .line 8
    invoke-static/range {v0 .. v6}, Ll/izs;->j(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IZLl/x20;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static m(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    const/4 v5, 0x1

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v3, p3

    .line 8
    move v4, p4

    .line 9
    invoke-static/range {v0 .. v7}, Ll/izs;->i(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZLl/x20;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static n(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/r230$j;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/r230$j;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ll/r230$j;->a(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ll/r230$f;

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    invoke-virtual {v0, p0}, Ll/r230$j;->p(Z)Ll/r230$j;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ll/r230$j;->k()Ll/r230;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, p1}, Ll/r230;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public static o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 10

    .line 1
    const/high16 v0, 0x42200000    # 40.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v4

    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    invoke-static {}, Ll/irn;->a()Z

    .line 12
    .line 13
    .line 14
    move-result v8

    .line 15
    const/4 v9, 0x0

    .line 16
    const/4 v6, 0x1

    .line 17
    const/4 v7, 0x0

    .line 18
    move-object v1, p0

    .line 19
    move-object v2, p1

    .line 20
    move-object v3, p2

    .line 21
    invoke-static/range {v1 .. v9}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static p(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    new-instance v0, Ll/r230$j;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/r230$j;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ll/r230$j;->b(Ljava/lang/String;)Ll/r230$f;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3, p4}, Ll/r230$j;->m(II)Ll/r230$j;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/r230$j;->k()Ll/r230;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p1}, Ll/r230;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/fsb0;->M(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    if-nez p2, :cond_1

    .line 5
    .line 6
    return-void

    .line 7
    :cond_1
    new-instance v0, Ll/r230$j;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/r230$j;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p2}, Ll/r230$j;->a(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ll/r230$f;

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    invoke-virtual {v0, p0}, Ll/r230$j;->p(Z)Ll/r230$j;

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/irn;->a()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {v0, p0}, Ll/r230$j;->r(Z)Ll/r230$j;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/r230$j;->k()Ll/r230;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Ll/r230;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 9

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v8, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v4, 0x0

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v6, 0x0

    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V
    .locals 9

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v8, 0x0

    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, 0x0

    .line 5
    move v4, p3

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v3, p3

    .line 10
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V
    .locals 9

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v8, 0x0

    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move v3, p3

    .line 9
    move v4, p4

    .line 10
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    new-instance v0, Ll/r230$j;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/r230$j;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p6}, Ll/r230$j;->q(Z)Ll/r230$j;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ll/r230$j;->b(Ljava/lang/String;)Ll/r230$f;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p5}, Ll/r230$j;->p(Z)Ll/r230$j;

    .line 23
    .line 24
    .line 25
    if-eqz p3, :cond_2

    .line 26
    .line 27
    if-eqz p4, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0, p3, p4}, Ll/r230$j;->o(II)Ll/r230$j;

    .line 30
    .line 31
    .line 32
    :cond_2
    if-eqz p8, :cond_3

    .line 33
    .line 34
    invoke-virtual {v0, p8}, Ll/r230$j;->n(Ll/fn2;)Ll/r230$j;

    .line 35
    .line 36
    .line 37
    :cond_3
    invoke-virtual {v0, p7}, Ll/r230$j;->r(Z)Ll/r230$j;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/r230$j;->k()Ll/r230;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p1}, Ll/r230;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V
    .locals 9

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v4, 0x0

    .line 5
    const/4 v5, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move-object v8, p3

    .line 10
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static y(Lv/VDraweeView;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "context_single_room"

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static z(Landroid/graphics/Bitmap;Ljava/lang/String;I)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    :goto_0
    if-nez p0, :cond_1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    :goto_1
    return-void
.end method
