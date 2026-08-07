.class public Ll/oqc0;
.super Ll/lam;
.source "SourceFile"


# instance fields
.field public i:Landroid/graphics/Bitmap;

.field public j:Landroid/graphics/Rect;

.field public k:Landroid/graphics/RectF;

.field public l:Landroid/graphics/Paint;

.field public m:Landroid/graphics/Paint;

.field public n:Landroid/graphics/RectF;

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:F

.field public t:I

.field public u:I

.field public v:F

.field public w:F

.field public x:[I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/lam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput p1, p0, Ll/oqc0;->v:F

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/oqc0;->w:F

    .line 10
    .line 11
    const p1, -0x181e3

    .line 12
    .line 13
    .line 14
    const v0, -0x9b9c

    .line 15
    .line 16
    .line 17
    filled-new-array {p1, v0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/oqc0;->x:[I

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    aget p1, p1, v0

    .line 25
    .line 26
    iput p1, p0, Ll/oqc0;->y:I

    .line 27
    .line 28
    iput v0, p0, Ll/oqc0;->z:I

    .line 29
    .line 30
    invoke-direct {p0}, Ll/oqc0;->l()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private l()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/lam;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/ibc0;->d4:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/oqc0;->i:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    new-instance v0, Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/oqc0;->l:Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/oqc0;->m:Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/oqc0;->n:Landroid/graphics/RectF;

    .line 44
    .line 45
    new-instance v0, Landroid/graphics/Rect;

    .line 46
    .line 47
    iget-object v1, p0, Ll/oqc0;->i:Landroid/graphics/Bitmap;

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-object v2, p0, Ll/oqc0;->i:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    const/4 v3, 0x0

    .line 60
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ll/oqc0;->j:Landroid/graphics/Rect;

    .line 64
    .line 65
    new-instance v0, Landroid/graphics/RectF;

    .line 66
    .line 67
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Ll/oqc0;->k:Landroid/graphics/RectF;

    .line 71
    .line 72
    const/16 v0, 0x2a

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iput v1, p0, Ll/oqc0;->q:I

    .line 79
    .line 80
    const/16 v1, 0x38

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Ll/lam;->a(I)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    iput v1, p0, Ll/oqc0;->r:I

    .line 87
    .line 88
    const/16 v1, 0x10

    .line 89
    .line 90
    invoke-virtual {p0, v1}, Ll/lam;->a(I)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iput v1, p0, Ll/oqc0;->o:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iput v0, p0, Ll/oqc0;->p:I

    .line 101
    .line 102
    const/16 v0, 0x18

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iput v1, p0, Ll/oqc0;->t:I

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput v0, p0, Ll/oqc0;->u:I

    .line 115
    .line 116
    const/16 v0, 0xc

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Ll/lam;->a(I)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    int-to-float v0, v0

    .line 123
    iput v0, p0, Ll/oqc0;->s:F

    .line 124
    .line 125
    iget-object v0, p0, Ll/oqc0;->n:Landroid/graphics/RectF;

    .line 126
    .line 127
    iget v1, p0, Ll/oqc0;->o:I

    .line 128
    .line 129
    int-to-float v2, v1

    .line 130
    iget v3, p0, Ll/oqc0;->p:I

    .line 131
    .line 132
    int-to-float v4, v3

    .line 133
    iget v5, p0, Ll/oqc0;->q:I

    .line 134
    .line 135
    add-int/2addr v1, v5

    .line 136
    int-to-float v1, v1

    .line 137
    iget p0, p0, Ll/oqc0;->r:I

    .line 138
    .line 139
    add-int/2addr v3, p0

    .line 140
    int-to-float p0, v3

    .line 141
    invoke-virtual {v0, v2, v4, v1, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 142
    .line 143
    .line 144
    return-void
.end method


# virtual methods
.method public f(II)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->f(II)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oqc0;->m()V

    .line 8
    .line 9
    .line 10
    mul-int/lit16 p1, p2, 0xff

    .line 11
    .line 12
    div-int/lit8 p1, p1, 0x64

    .line 13
    .line 14
    iput p1, p0, Ll/oqc0;->z:I

    .line 15
    .line 16
    iget-object p1, p0, Ll/oqc0;->x:[I

    .line 17
    .line 18
    aget p1, p1, v0

    .line 19
    .line 20
    iput p1, p0, Ll/oqc0;->y:I

    .line 21
    .line 22
    iget p1, p0, Ll/oqc0;->q:I

    .line 23
    .line 24
    neg-int v0, p1

    .line 25
    iget v1, p0, Ll/oqc0;->o:I

    .line 26
    .line 27
    add-int/2addr v1, p1

    .line 28
    mul-int/2addr p2, v1

    .line 29
    div-int/lit8 p2, p2, 0x64

    .line 30
    .line 31
    add-int/2addr v0, p2

    .line 32
    iget-object p2, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 33
    .line 34
    int-to-float v1, v0

    .line 35
    iget v2, p0, Ll/oqc0;->p:I

    .line 36
    .line 37
    int-to-float v3, v2

    .line 38
    add-int/2addr v0, p1

    .line 39
    int-to-float p1, v0

    .line 40
    iget v0, p0, Ll/oqc0;->r:I

    .line 41
    .line 42
    add-int/2addr v2, v0

    .line 43
    int-to-float v0, v2

    .line 44
    invoke-virtual {p2, v1, v3, p1, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/oqc0;->n:Landroid/graphics/RectF;

    .line 48
    .line 49
    iget-object p2, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 50
    .line 51
    iget v0, p2, Landroid/graphics/RectF;->left:F

    .line 52
    .line 53
    iget v1, p2, Landroid/graphics/RectF;->top:F

    .line 54
    .line 55
    iget v2, p2, Landroid/graphics/RectF;->right:F

    .line 56
    .line 57
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    .line 58
    .line 59
    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/oqc0;->n()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const/4 v1, 0x1

    .line 67
    const/16 v2, 0xff

    .line 68
    .line 69
    const/high16 v3, 0x42c80000    # 100.0f

    .line 70
    .line 71
    if-ne p1, v1, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/oqc0;->m()V

    .line 74
    .line 75
    .line 76
    iput v2, p0, Ll/oqc0;->z:I

    .line 77
    .line 78
    iget-object p1, p0, Ll/oqc0;->x:[I

    .line 79
    .line 80
    aget v0, p1, v0

    .line 81
    .line 82
    aget p1, p1, v1

    .line 83
    .line 84
    invoke-virtual {p0, v0, p1, p2}, Ll/lam;->e(III)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iput p1, p0, Ll/oqc0;->y:I

    .line 89
    .line 90
    int-to-float p1, p2

    .line 91
    const p2, 0x3e99999a    # 0.3f

    .line 92
    .line 93
    .line 94
    mul-float/2addr p2, p1

    .line 95
    div-float/2addr p2, v3

    .line 96
    const/high16 v0, 0x3f800000    # 1.0f

    .line 97
    .line 98
    add-float/2addr p2, v0

    .line 99
    iput p2, p0, Ll/oqc0;->v:F

    .line 100
    .line 101
    iget p2, p0, Ll/oqc0;->q:I

    .line 102
    .line 103
    int-to-float v0, p2

    .line 104
    int-to-float p2, p2

    .line 105
    const v1, 0x3ecccccd    # 0.4f

    .line 106
    .line 107
    .line 108
    mul-float/2addr p2, v1

    .line 109
    mul-float/2addr p2, p1

    .line 110
    div-float/2addr p2, v3

    .line 111
    add-float/2addr v0, p2

    .line 112
    const/high16 p2, 0x3e800000    # 0.25f

    .line 113
    .line 114
    mul-float/2addr p1, p2

    .line 115
    div-float/2addr p1, v3

    .line 116
    const/high16 p2, -0x3d4c0000    # -90.0f

    .line 117
    .line 118
    mul-float/2addr p1, p2

    .line 119
    iput p1, p0, Ll/oqc0;->w:F

    .line 120
    .line 121
    iget-object p1, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 122
    .line 123
    iget p2, p0, Ll/oqc0;->o:I

    .line 124
    .line 125
    int-to-float v1, p2

    .line 126
    iget v2, p0, Ll/oqc0;->p:I

    .line 127
    .line 128
    int-to-float v3, v2

    .line 129
    int-to-float p2, p2

    .line 130
    add-float/2addr p2, v0

    .line 131
    iget v0, p0, Ll/oqc0;->r:I

    .line 132
    .line 133
    add-int/2addr v2, v0

    .line 134
    int-to-float v0, v2

    .line 135
    invoke-virtual {p1, v1, v3, p2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/oqc0;->n:Landroid/graphics/RectF;

    .line 139
    .line 140
    iget-object p2, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 141
    .line 142
    iget v0, p2, Landroid/graphics/RectF;->left:F

    .line 143
    .line 144
    iget v1, p2, Landroid/graphics/RectF;->top:F

    .line 145
    .line 146
    iget v2, p2, Landroid/graphics/RectF;->right:F

    .line 147
    .line 148
    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    .line 149
    .line 150
    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ll/oqc0;->n()V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_1
    const/4 v0, 0x2

    .line 158
    if-ne p1, v0, :cond_3

    .line 159
    .line 160
    iget-object p1, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 161
    .line 162
    iget p1, p1, Landroid/graphics/RectF;->right:F

    .line 163
    .line 164
    sget v0, Ll/kqc0;->b:F

    .line 165
    .line 166
    add-float/2addr p1, v0

    .line 167
    sget v0, Ll/kqc0;->a:F

    .line 168
    .line 169
    iget v1, p0, Ll/oqc0;->p:I

    .line 170
    .line 171
    int-to-float v4, v1

    .line 172
    iget v5, p0, Ll/oqc0;->r:I

    .line 173
    .line 174
    add-int/2addr v5, v1

    .line 175
    int-to-float v5, v5

    .line 176
    iget-object v6, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 177
    .line 178
    if-eqz v6, :cond_2

    .line 179
    .line 180
    iget v0, v6, Landroid/graphics/RectF;->left:F

    .line 181
    .line 182
    int-to-float v1, v1

    .line 183
    iget v4, p0, Ll/lam;->c:I

    .line 184
    .line 185
    int-to-float v4, v4

    .line 186
    iget v6, v6, Landroid/graphics/RectF;->top:F

    .line 187
    .line 188
    sub-float/2addr v4, v6

    .line 189
    invoke-virtual {p0, v1, v4, p2}, Ll/lam;->d(FFI)F

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    iget v1, p0, Ll/lam;->c:I

    .line 194
    .line 195
    int-to-float v1, v1

    .line 196
    iget-object v6, p0, Ll/lam;->h:Landroid/graphics/RectF;

    .line 197
    .line 198
    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    .line 199
    .line 200
    sub-float/2addr v1, v6

    .line 201
    invoke-virtual {p0, v5, v1, p2}, Ll/lam;->d(FFI)F

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    :cond_2
    sub-float/2addr p1, v0

    .line 206
    iget-object v1, p0, Ll/lam;->g:Landroid/graphics/RectF;

    .line 207
    .line 208
    iget v6, v1, Landroid/graphics/RectF;->left:F

    .line 209
    .line 210
    int-to-float v7, p2

    .line 211
    mul-float/2addr p1, v7

    .line 212
    div-float/2addr p1, v3

    .line 213
    sub-float p1, v6, p1

    .line 214
    .line 215
    sub-float/2addr v0, v6

    .line 216
    mul-float/2addr v0, v7

    .line 217
    div-float/2addr v0, v3

    .line 218
    sub-float/2addr p1, v0

    .line 219
    mul-int/2addr p2, v2

    .line 220
    div-int/lit8 p2, p2, 0x64

    .line 221
    .line 222
    sub-int/2addr v2, p2

    .line 223
    iput v2, p0, Ll/oqc0;->z:I

    .line 224
    .line 225
    iget-object p2, p0, Ll/oqc0;->n:Landroid/graphics/RectF;

    .line 226
    .line 227
    iget v0, v1, Landroid/graphics/RectF;->right:F

    .line 228
    .line 229
    sub-float/2addr v0, v6

    .line 230
    add-float/2addr v0, p1

    .line 231
    invoke-virtual {p2, p1, v4, v0, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0}, Ll/oqc0;->n()V

    .line 235
    .line 236
    .line 237
    :cond_3
    return-void
.end method

.method public g(Landroid/graphics/Canvas;II)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/oqc0;->l:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget p3, p0, Ll/oqc0;->y:I

    .line 4
    .line 5
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/oqc0;->l:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget p3, p0, Ll/oqc0;->z:I

    .line 11
    .line 12
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/oqc0;->n:Landroid/graphics/RectF;

    .line 16
    .line 17
    iget p3, p0, Ll/oqc0;->s:F

    .line 18
    .line 19
    iget-object v0, p0, Ll/oqc0;->l:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p3, p3, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iget p3, p0, Ll/oqc0;->w:F

    .line 29
    .line 30
    iget-object v0, p0, Ll/oqc0;->k:Landroid/graphics/RectF;

    .line 31
    .line 32
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 33
    .line 34
    iget v2, v0, Landroid/graphics/RectF;->right:F

    .line 35
    .line 36
    add-float/2addr v1, v2

    .line 37
    const/high16 v2, 0x40000000    # 2.0f

    .line 38
    .line 39
    div-float/2addr v1, v2

    .line 40
    iget v3, v0, Landroid/graphics/RectF;->top:F

    .line 41
    .line 42
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 43
    .line 44
    add-float/2addr v3, v0

    .line 45
    div-float/2addr v3, v2

    .line 46
    invoke-virtual {p1, p3, v1, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 47
    .line 48
    .line 49
    iget-object p3, p0, Ll/oqc0;->i:Landroid/graphics/Bitmap;

    .line 50
    .line 51
    iget-object v0, p0, Ll/oqc0;->j:Landroid/graphics/Rect;

    .line 52
    .line 53
    iget-object v1, p0, Ll/oqc0;->k:Landroid/graphics/RectF;

    .line 54
    .line 55
    iget-object p0, p0, Ll/oqc0;->m:Landroid/graphics/Paint;

    .line 56
    .line 57
    invoke-virtual {p1, p3, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public h(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/lam;->h(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Ll/lam;->d:I

    .line 5
    .line 6
    iget p2, p0, Ll/lam;->e:I

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/oqc0;->f(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Ll/oqc0;->v:F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/oqc0;->w:F

    .line 7
    .line 8
    return-void
.end method

.method public final n()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/oqc0;->n:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 4
    .line 5
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    add-float/2addr v1, v2

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    iget v3, v0, Landroid/graphics/RectF;->top:F

    .line 12
    .line 13
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 14
    .line 15
    add-float/2addr v3, v0

    .line 16
    div-float/2addr v3, v2

    .line 17
    iget-object v0, p0, Ll/oqc0;->k:Landroid/graphics/RectF;

    .line 18
    .line 19
    iget v4, p0, Ll/oqc0;->t:I

    .line 20
    .line 21
    int-to-float v5, v4

    .line 22
    iget v6, p0, Ll/oqc0;->v:F

    .line 23
    .line 24
    mul-float/2addr v5, v6

    .line 25
    div-float/2addr v5, v2

    .line 26
    sub-float v5, v1, v5

    .line 27
    .line 28
    int-to-float v7, v4

    .line 29
    mul-float/2addr v7, v6

    .line 30
    div-float/2addr v7, v2

    .line 31
    sub-float v7, v3, v7

    .line 32
    .line 33
    int-to-float v4, v4

    .line 34
    mul-float/2addr v4, v6

    .line 35
    div-float/2addr v4, v2

    .line 36
    add-float/2addr v1, v4

    .line 37
    iget p0, p0, Ll/oqc0;->u:I

    .line 38
    .line 39
    int-to-float p0, p0

    .line 40
    mul-float/2addr p0, v6

    .line 41
    div-float/2addr p0, v2

    .line 42
    add-float/2addr v3, p0

    .line 43
    invoke-virtual {v0, v5, v7, v1, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
