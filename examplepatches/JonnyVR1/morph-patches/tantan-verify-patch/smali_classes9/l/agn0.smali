.class public Ll/agn0;
.super Landroid/text/style/ReplacementSpan;
.source "SourceFile"


# static fields
.field public static p:I = 0xe


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Z

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ljava/lang/String;

.field public k:I

.field public l:Landroid/graphics/Rect;

.field public m:Landroid/graphics/RectF;

.field public n:I

.field public o:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41880000    # 17.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/agn0;->d:I

    .line 11
    .line 12
    const/high16 v0, 0x40a00000    # 5.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/agn0;->e:I

    .line 19
    .line 20
    const/high16 v0, 0x40c00000    # 6.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Ll/agn0;->n:I

    .line 27
    .line 28
    const/high16 v0, 0x41a80000    # 21.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Ll/agn0;->o:I

    .line 35
    .line 36
    iput-object p1, p0, Ll/agn0;->a:Ljava/lang/String;

    .line 37
    .line 38
    new-instance p1, Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/agn0;->l:Landroid/graphics/Rect;

    .line 44
    .line 45
    new-instance p1, Landroid/graphics/RectF;

    .line 46
    .line 47
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/agn0;->m:Landroid/graphics/RectF;

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final a(I)I
    .locals 0

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agn0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()I
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/agn0;->p:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/agn0;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    float-to-int p0, p0

    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/high16 v1, 0x43330000    # 179.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-int/2addr v0, v1

    .line 35
    sub-int/2addr v0, p0

    .line 36
    div-int/lit8 v0, v0, 0x2

    .line 37
    .line 38
    return v0
.end method

.method public d()V
    .locals 2

    .line 1
    sget v0, Ll/n9c0;->s0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Ll/agn0;->f:I

    .line 8
    .line 9
    sget v0, Ll/n9c0;->D0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/agn0;->g:I

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Ll/agn0;->b:I

    .line 19
    .line 20
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/agn0;->h:Ljava/lang/String;

    .line 29
    .line 30
    const/high16 v0, 0x41200000    # 10.0f

    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Ll/agn0;->e:I

    .line 37
    .line 38
    const/high16 v0, 0x41c00000    # 24.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Ll/agn0;->d:I

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput v0, p0, Ll/agn0;->i:I

    .line 48
    .line 49
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p9

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    sget v4, Ll/agn0;->p:I

    .line 12
    .line 13
    int-to-float v4, v4

    .line 14
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    int-to-float v4, v4

    .line 19
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 20
    .line 21
    .line 22
    iget-object v4, v0, Ll/agn0;->h:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    add-int/lit8 v5, v5, -0x1

    .line 29
    .line 30
    iget-object v6, v0, Ll/agn0;->l:Landroid/graphics/Rect;

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    invoke-virtual {v2, v4, v7, v5, v6}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    const-string v4, "5"

    .line 37
    .line 38
    iget-object v5, v0, Ll/agn0;->j:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-nez v4, :cond_2

    .line 45
    .line 46
    const-string v4, "6"

    .line 47
    .line 48
    iget-object v5, v0, Ll/agn0;->j:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_0

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    const-string v4, "3"

    .line 58
    .line 59
    iget-object v5, v0, Ll/agn0;->j:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-nez v4, :cond_1

    .line 66
    .line 67
    const/high16 v4, 0x41400000    # 12.0f

    .line 68
    .line 69
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    :goto_0
    add-int v4, p6, v4

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    move/from16 v4, p6

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_2
    :goto_1
    const/high16 v4, 0x3f800000    # 1.0f

    .line 80
    .line 81
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    goto :goto_0

    .line 86
    :goto_2
    iget-object v5, v0, Ll/agn0;->l:Landroid/graphics/Rect;

    .line 87
    .line 88
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    iget v6, v0, Ll/agn0;->e:I

    .line 93
    .line 94
    mul-int/lit8 v6, v6, 0x2

    .line 95
    .line 96
    add-int/2addr v5, v6

    .line 97
    sub-int v4, p8, v4

    .line 98
    .line 99
    div-int/lit8 v6, v4, 0x2

    .line 100
    .line 101
    sub-int v6, p8, v6

    .line 102
    .line 103
    iget v7, v0, Ll/agn0;->o:I

    .line 104
    .line 105
    div-int/lit8 v8, v7, 0x2

    .line 106
    .line 107
    sub-int v8, v6, v8

    .line 108
    .line 109
    div-int/lit8 v7, v7, 0x2

    .line 110
    .line 111
    add-int/2addr v6, v7

    .line 112
    sub-int/2addr v4, v5

    .line 113
    div-int/lit8 v4, v4, 0x2

    .line 114
    .line 115
    iget v5, v0, Ll/agn0;->f:I

    .line 116
    .line 117
    if-eqz v5, :cond_3

    .line 118
    .line 119
    iget v5, v0, Ll/agn0;->g:I

    .line 120
    .line 121
    if-eqz v5, :cond_3

    .line 122
    .line 123
    new-instance v9, Landroid/graphics/LinearGradient;

    .line 124
    .line 125
    iget v5, v0, Ll/agn0;->i:I

    .line 126
    .line 127
    int-to-float v7, v5

    .line 128
    add-float v10, p5, v7

    .line 129
    .line 130
    int-to-float v11, v8

    .line 131
    int-to-float v5, v5

    .line 132
    add-float v5, p5, v5

    .line 133
    .line 134
    iget-object v7, v0, Ll/agn0;->h:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    float-to-int v7, v7

    .line 141
    iget v12, v0, Ll/agn0;->d:I

    .line 142
    .line 143
    mul-int/lit8 v12, v12, 0x2

    .line 144
    .line 145
    add-int/2addr v7, v12

    .line 146
    int-to-float v7, v7

    .line 147
    add-float v12, v5, v7

    .line 148
    .line 149
    int-to-float v13, v6

    .line 150
    iget v14, v0, Ll/agn0;->f:I

    .line 151
    .line 152
    iget v15, v0, Ll/agn0;->g:I

    .line 153
    .line 154
    sget-object v16, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 155
    .line 156
    invoke-direct/range {v9 .. v16}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 160
    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_3
    iget v5, v0, Ll/agn0;->k:I

    .line 164
    .line 165
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 166
    .line 167
    .line 168
    :goto_3
    iget-object v5, v0, Ll/agn0;->m:Landroid/graphics/RectF;

    .line 169
    .line 170
    iget v7, v0, Ll/agn0;->i:I

    .line 171
    .line 172
    int-to-float v9, v7

    .line 173
    add-float v9, p5, v9

    .line 174
    .line 175
    iput v9, v5, Landroid/graphics/RectF;->left:F

    .line 176
    .line 177
    int-to-float v8, v8

    .line 178
    iput v8, v5, Landroid/graphics/RectF;->top:F

    .line 179
    .line 180
    int-to-float v7, v7

    .line 181
    add-float v7, p5, v7

    .line 182
    .line 183
    iget-object v8, v0, Ll/agn0;->h:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v2, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 186
    .line 187
    .line 188
    move-result v8

    .line 189
    float-to-int v8, v8

    .line 190
    iget v9, v0, Ll/agn0;->d:I

    .line 191
    .line 192
    mul-int/lit8 v9, v9, 0x2

    .line 193
    .line 194
    add-int/2addr v8, v9

    .line 195
    int-to-float v8, v8

    .line 196
    add-float/2addr v7, v8

    .line 197
    iput v7, v5, Landroid/graphics/RectF;->right:F

    .line 198
    .line 199
    iget-object v5, v0, Ll/agn0;->m:Landroid/graphics/RectF;

    .line 200
    .line 201
    int-to-float v6, v6

    .line 202
    iput v6, v5, Landroid/graphics/RectF;->bottom:F

    .line 203
    .line 204
    iget v6, v0, Ll/agn0;->n:I

    .line 205
    .line 206
    int-to-float v7, v6

    .line 207
    int-to-float v6, v6

    .line 208
    invoke-virtual {v1, v5, v7, v6, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 209
    .line 210
    .line 211
    const/4 v5, 0x0

    .line 212
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 213
    .line 214
    .line 215
    iget v5, v0, Ll/agn0;->b:I

    .line 216
    .line 217
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 218
    .line 219
    .line 220
    iget-object v5, v0, Ll/agn0;->h:Ljava/lang/String;

    .line 221
    .line 222
    iget v6, v0, Ll/agn0;->i:I

    .line 223
    .line 224
    int-to-float v6, v6

    .line 225
    add-float v6, p5, v6

    .line 226
    .line 227
    iget v7, v0, Ll/agn0;->d:I

    .line 228
    .line 229
    int-to-float v7, v7

    .line 230
    add-float/2addr v6, v7

    .line 231
    iget v7, v0, Ll/agn0;->e:I

    .line 232
    .line 233
    sub-int v7, p8, v7

    .line 234
    .line 235
    sub-int/2addr v7, v4

    .line 236
    iget-object v0, v0, Ll/agn0;->l:Landroid/graphics/Rect;

    .line 237
    .line 238
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 239
    .line 240
    sub-int/2addr v7, v0

    .line 241
    int-to-float v0, v7

    .line 242
    invoke-virtual {v1, v5, v6, v0, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public final e()Z
    .locals 2

    .line 1
    const-string v0, "5"

    .line 2
    .line 3
    iget-object v1, p0, Ll/agn0;->j:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "6"

    .line 12
    .line 13
    iget-object p0, p0, Ll/agn0;->j:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    sget v0, Ll/n9c0;->j1:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Ll/agn0;->f:I

    .line 8
    .line 9
    sget v0, Ll/n9c0;->j1:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/agn0;->g:I

    .line 16
    .line 17
    sget v0, Ll/n9c0;->j1:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/agn0;->b:I

    .line 24
    .line 25
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pe:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/agn0;->h:Ljava/lang/String;

    .line 34
    .line 35
    const/high16 v0, 0x41200000    # 10.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Ll/agn0;->e:I

    .line 42
    .line 43
    const/high16 v0, 0x41880000    # 17.0f

    .line 44
    .line 45
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ll/agn0;->d:I

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    iput v0, p0, Ll/agn0;->i:I

    .line 53
    .line 54
    return-void
.end method

.method public g(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/agn0;->j:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ll/agn0;->c:Z

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, -0x1

    .line 15
    packed-switch v1, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    :goto_0
    :pswitch_0
    move v0, v3

    .line 19
    goto :goto_1

    .line 20
    :pswitch_1
    const-string v0, "6"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x4

    .line 30
    goto :goto_1

    .line 31
    :pswitch_2
    const-string v0, "5"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 v0, 0x3

    .line 41
    goto :goto_1

    .line 42
    :pswitch_3
    const-string v0, "4"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const/4 v0, 0x2

    .line 52
    goto :goto_1

    .line 53
    :pswitch_4
    const-string v0, "2"

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    move v0, v2

    .line 63
    goto :goto_1

    .line 64
    :pswitch_5
    const-string v1, "1"

    .line 65
    .line 66
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_4

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    :goto_1
    packed-switch v0, :pswitch_data_1

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p2}, Ll/agn0;->i(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :pswitch_6
    invoke-virtual {p0}, Ll/agn0;->k()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :pswitch_7
    invoke-virtual {p0}, Ll/agn0;->j()V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :pswitch_8
    iput-boolean v2, p0, Ll/agn0;->c:Z

    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_9
    invoke-virtual {p0}, Ll/agn0;->f()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :pswitch_a
    invoke-virtual {p0}, Ll/agn0;->d()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 0

    .line 1
    iget-boolean p2, p0, Ll/agn0;->c:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    sget p2, Ll/agn0;->p:I

    .line 8
    .line 9
    int-to-float p2, p2

    .line 10
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    int-to-float p2, p2

    .line 15
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    if-eqz p5, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/agn0;->e()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    iget p2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 27
    .line 28
    const/high16 p3, 0x41d80000    # 27.0f

    .line 29
    .line 30
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    add-int/2addr p2, p3

    .line 35
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 36
    .line 37
    :cond_1
    iget-object p2, p0, Ll/agn0;->h:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    float-to-int p1, p1

    .line 44
    iget p2, p0, Ll/agn0;->i:I

    .line 45
    .line 46
    add-int/2addr p1, p2

    .line 47
    iget p0, p0, Ll/agn0;->d:I

    .line 48
    .line 49
    mul-int/lit8 p0, p0, 0x2

    .line 50
    .line 51
    add-int/2addr p1, p0

    .line 52
    return p1
.end method

.method public h(Z)V
    .locals 0

    .line 1
    xor-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iput-boolean p1, p0, Ll/agn0;->c:Z

    .line 4
    .line 5
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/agn0;->f:I

    .line 3
    .line 4
    iput v0, p0, Ll/agn0;->g:I

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Ll/agn0;->k:I

    .line 8
    .line 9
    sget v0, Ll/n9c0;->s0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/agn0;->b:I

    .line 16
    .line 17
    const/16 v0, 0xc

    .line 18
    .line 19
    sput v0, Ll/agn0;->p:I

    .line 20
    .line 21
    const/high16 v0, 0x41200000    # 10.0f

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Ll/agn0;->d:I

    .line 28
    .line 29
    const/high16 v0, 0x40000000    # 2.0f

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/agn0;->e:I

    .line 36
    .line 37
    const/16 v0, 0x14

    .line 38
    .line 39
    iput v0, p0, Ll/agn0;->i:I

    .line 40
    .line 41
    iput-object p1, p0, Ll/agn0;->h:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    sget v0, Ll/n9c0;->p0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Ll/agn0;->f:I

    .line 8
    .line 9
    sget v0, Ll/n9c0;->p0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/agn0;->g:I

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Ll/agn0;->b:I

    .line 19
    .line 20
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/agn0;->h:Ljava/lang/String;

    .line 29
    .line 30
    const/16 v0, 0xd

    .line 31
    .line 32
    sput v0, Ll/agn0;->p:I

    .line 33
    .line 34
    const/high16 v0, 0x41000000    # 8.0f

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Ll/agn0;->e:I

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/agn0;->c()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Ll/agn0;->d:I

    .line 47
    .line 48
    const/high16 v0, 0x41200000    # 10.0f

    .line 49
    .line 50
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput v0, p0, Ll/agn0;->n:I

    .line 55
    .line 56
    const/high16 v0, 0x42080000    # 34.0f

    .line 57
    .line 58
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/agn0;->o:I

    .line 63
    .line 64
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    sget v0, Ll/n9c0;->p0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Ll/agn0;->f:I

    .line 8
    .line 9
    sget v0, Ll/n9c0;->p0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/agn0;->g:I

    .line 16
    .line 17
    sget v0, Ll/n9c0;->m1:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/agn0;->a(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/agn0;->b:I

    .line 24
    .line 25
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pe:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/agn0;->h:Ljava/lang/String;

    .line 34
    .line 35
    const/16 v0, 0xd

    .line 36
    .line 37
    sput v0, Ll/agn0;->p:I

    .line 38
    .line 39
    const/high16 v0, 0x41000000    # 8.0f

    .line 40
    .line 41
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Ll/agn0;->e:I

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/agn0;->c()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Ll/agn0;->d:I

    .line 52
    .line 53
    const/high16 v0, 0x41200000    # 10.0f

    .line 54
    .line 55
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Ll/agn0;->n:I

    .line 60
    .line 61
    const/high16 v0, 0x42080000    # 34.0f

    .line 62
    .line 63
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, Ll/agn0;->o:I

    .line 68
    .line 69
    return-void
.end method
