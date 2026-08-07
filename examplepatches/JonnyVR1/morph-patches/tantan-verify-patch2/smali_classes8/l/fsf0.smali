.class public Ll/fsf0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/text/TextPaint;

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public final i:Landroid/graphics/Path;

.field public final j:Landroid/graphics/Paint$FontMetrics;

.field public k:F

.field public l:Z

.field public m:F

.field public n:F

.field public o:Landroid/util/DisplayMetrics;

.field public p:Ljava/lang/CharSequence;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fsf0;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    new-instance v0, Landroid/text/TextPaint;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/Paint$FontMetrics;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/fsf0;->j:Landroid/graphics/Paint$FontMetrics;

    .line 32
    .line 33
    const/high16 v0, 0x3f800000    # 1.0f

    .line 34
    .line 35
    iput v0, p0, Ll/fsf0;->m:F

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/fsf0;->f(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/fsf0;->g()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/fsf0;->e()V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fsf0;->j:Landroid/graphics/Paint$FontMetrics;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/fsf0;->j:Landroid/graphics/Paint$FontMetrics;

    .line 9
    .line 10
    iget v0, p0, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 11
    .line 12
    iget p0, p0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 13
    .line 14
    add-float/2addr v0, p0

    .line 15
    const/high16 p0, 0x40000000    # 2.0f

    .line 16
    .line 17
    div-float/2addr v0, p0

    .line 18
    return v0
.end method

.method public final b(Ljava/lang/CharSequence;)F
    .locals 2
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0, p1, v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/fsf0;->p:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Ll/fsf0;->f:F

    .line 7
    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, v1

    .line 11
    invoke-virtual {p0}, Ll/fsf0;->a()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-float/2addr v0, v1

    .line 16
    float-to-int v0, v0

    .line 17
    iget-object v2, p0, Ll/fsf0;->p:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {p0}, Ll/fsf0;->getIntrinsicWidth()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    shr-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    int-to-float v5, v1

    .line 30
    int-to-float v6, v0

    .line 31
    iget-object v7, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    move-object v1, p1

    .line 35
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d()F
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fsf0;->p:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean v1, p0, Ll/fsf0;->l:Z

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget p0, p0, Ll/fsf0;->n:F

    .line 12
    .line 13
    return p0

    .line 14
    :cond_1
    invoke-virtual {p0, v0}, Ll/fsf0;->b(Ljava/lang/CharSequence;)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/fsf0;->n:F

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-boolean v1, p0, Ll/fsf0;->l:Z

    .line 22
    .line 23
    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0}, Ll/fsf0;->getIntrinsicWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    shr-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    sub-int/2addr v1, v2

    .line 19
    int-to-float v1, v1

    .line 20
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    int-to-float v2, v2

    .line 25
    invoke-virtual {p0}, Ll/fsf0;->getIntrinsicHeight()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    int-to-float v3, v3

    .line 30
    const v4, 0x3f4ccccd    # 0.8f

    .line 31
    .line 32
    .line 33
    mul-float/2addr v3, v4

    .line 34
    sub-float/2addr v2, v3

    .line 35
    iget v3, p0, Ll/fsf0;->m:F

    .line 36
    .line 37
    iget v4, v0, Landroid/graphics/Rect;->left:I

    .line 38
    .line 39
    int-to-float v4, v4

    .line 40
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    int-to-float v5, v5

    .line 45
    const/high16 v6, 0x3f000000    # 0.5f

    .line 46
    .line 47
    mul-float/2addr v5, v6

    .line 48
    add-float/2addr v4, v5

    .line 49
    iget v5, v0, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    int-to-float v5, v5

    .line 52
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    int-to-float v0, v0

    .line 57
    const/high16 v6, 0x3f800000    # 1.0f

    .line 58
    .line 59
    mul-float/2addr v0, v6

    .line 60
    add-float/2addr v5, v0

    .line 61
    invoke-virtual {p1, v3, v3, v4, v5}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 68
    .line 69
    iget-object v1, p0, Ll/fsf0;->a:Landroid/graphics/Paint;

    .line 70
    .line 71
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/fsf0;->c(Landroid/graphics/Canvas;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final e()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fsf0;->getIntrinsicWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v5, v1

    .line 8
    invoke-virtual {v0}, Ll/fsf0;->getIntrinsicHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    iget-object v2, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 16
    .line 17
    .line 18
    iget-object v2, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 19
    .line 20
    iget v3, v0, Ll/fsf0;->g:F

    .line 21
    .line 22
    const/4 v10, 0x0

    .line 23
    invoke-virtual {v2, v3, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 24
    .line 25
    .line 26
    iget-object v2, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 27
    .line 28
    iget v3, v0, Ll/fsf0;->g:F

    .line 29
    .line 30
    const/high16 v11, 0x40000000    # 2.0f

    .line 31
    .line 32
    mul-float/2addr v3, v11

    .line 33
    sub-float v3, v5, v3

    .line 34
    .line 35
    invoke-virtual {v2, v3, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 36
    .line 37
    .line 38
    iget-object v2, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 39
    .line 40
    iget v3, v0, Ll/fsf0;->g:F

    .line 41
    .line 42
    mul-float v4, v3, v11

    .line 43
    .line 44
    sub-float v4, v5, v4

    .line 45
    .line 46
    mul-float v6, v3, v11

    .line 47
    .line 48
    const/high16 v8, 0x42b40000    # 90.0f

    .line 49
    .line 50
    const/4 v9, 0x0

    .line 51
    move v3, v4

    .line 52
    const/4 v4, 0x0

    .line 53
    const/high16 v7, -0x3d4c0000    # -90.0f

    .line 54
    .line 55
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 56
    .line 57
    .line 58
    iget-object v2, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 59
    .line 60
    iget v3, v0, Ll/fsf0;->f:F

    .line 61
    .line 62
    iget v4, v0, Ll/fsf0;->g:F

    .line 63
    .line 64
    mul-float/2addr v4, v11

    .line 65
    sub-float/2addr v3, v4

    .line 66
    invoke-virtual {v2, v5, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 67
    .line 68
    .line 69
    iget-object v2, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 70
    .line 71
    iget v3, v0, Ll/fsf0;->g:F

    .line 72
    .line 73
    mul-float v4, v3, v11

    .line 74
    .line 75
    sub-float v4, v5, v4

    .line 76
    .line 77
    iget v6, v0, Ll/fsf0;->f:F

    .line 78
    .line 79
    mul-float/2addr v3, v11

    .line 80
    sub-float v3, v6, v3

    .line 81
    .line 82
    const/4 v7, 0x0

    .line 83
    move/from16 v20, v4

    .line 84
    .line 85
    move v4, v3

    .line 86
    move/from16 v3, v20

    .line 87
    .line 88
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 89
    .line 90
    .line 91
    iget-object v2, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 92
    .line 93
    div-float/2addr v5, v11

    .line 94
    iget v3, v0, Ll/fsf0;->e:F

    .line 95
    .line 96
    add-float/2addr v3, v5

    .line 97
    iget v4, v0, Ll/fsf0;->f:F

    .line 98
    .line 99
    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 100
    .line 101
    .line 102
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    .line 103
    .line 104
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 105
    .line 106
    .line 107
    move-result-wide v2

    .line 108
    iget v4, v0, Ll/fsf0;->h:F

    .line 109
    .line 110
    float-to-double v6, v4

    .line 111
    mul-double/2addr v2, v6

    .line 112
    double-to-float v2, v2

    .line 113
    sub-float v13, v5, v4

    .line 114
    .line 115
    float-to-double v3, v1

    .line 116
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 117
    .line 118
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    .line 119
    .line 120
    .line 121
    move-result-wide v8

    .line 122
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    .line 123
    .line 124
    sub-double/2addr v8, v14

    .line 125
    iget v12, v0, Ll/fsf0;->h:F

    .line 126
    .line 127
    move-wide/from16 v16, v6

    .line 128
    .line 129
    float-to-double v6, v12

    .line 130
    mul-double/2addr v8, v6

    .line 131
    sub-double v6, v3, v8

    .line 132
    .line 133
    mul-float v8, v12, v11

    .line 134
    .line 135
    float-to-double v8, v8

    .line 136
    sub-double/2addr v6, v8

    .line 137
    double-to-float v6, v6

    .line 138
    add-float/2addr v12, v5

    .line 139
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->sqrt(D)D

    .line 140
    .line 141
    .line 142
    move-result-wide v7

    .line 143
    sub-double/2addr v7, v14

    .line 144
    iget v9, v0, Ll/fsf0;->h:F

    .line 145
    .line 146
    float-to-double v14, v9

    .line 147
    mul-double/2addr v7, v14

    .line 148
    sub-double/2addr v3, v7

    .line 149
    double-to-float v3, v3

    .line 150
    iget-object v4, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 151
    .line 152
    add-float v7, v5, v2

    .line 153
    .line 154
    sub-float/2addr v1, v2

    .line 155
    invoke-virtual {v4, v7, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 156
    .line 157
    .line 158
    move v15, v12

    .line 159
    iget-object v12, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 160
    .line 161
    const/high16 v18, 0x42b40000    # 90.0f

    .line 162
    .line 163
    const/16 v19, 0x0

    .line 164
    .line 165
    const/high16 v17, 0x42340000    # 45.0f

    .line 166
    .line 167
    move/from16 v16, v3

    .line 168
    .line 169
    move v14, v6

    .line 170
    invoke-virtual/range {v12 .. v19}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 171
    .line 172
    .line 173
    iget-object v1, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 174
    .line 175
    iget v2, v0, Ll/fsf0;->e:F

    .line 176
    .line 177
    sub-float/2addr v5, v2

    .line 178
    iget v2, v0, Ll/fsf0;->f:F

    .line 179
    .line 180
    invoke-virtual {v1, v5, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 181
    .line 182
    .line 183
    iget-object v1, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 184
    .line 185
    iget v2, v0, Ll/fsf0;->g:F

    .line 186
    .line 187
    iget v3, v0, Ll/fsf0;->f:F

    .line 188
    .line 189
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 190
    .line 191
    .line 192
    iget-object v12, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 193
    .line 194
    iget v1, v0, Ll/fsf0;->f:F

    .line 195
    .line 196
    iget v2, v0, Ll/fsf0;->g:F

    .line 197
    .line 198
    mul-float v3, v2, v11

    .line 199
    .line 200
    sub-float v14, v1, v3

    .line 201
    .line 202
    mul-float v15, v2, v11

    .line 203
    .line 204
    const/4 v13, 0x0

    .line 205
    const/high16 v17, 0x42b40000    # 90.0f

    .line 206
    .line 207
    move/from16 v16, v1

    .line 208
    .line 209
    invoke-virtual/range {v12 .. v19}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 210
    .line 211
    .line 212
    iget-object v1, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 213
    .line 214
    iget v2, v0, Ll/fsf0;->g:F

    .line 215
    .line 216
    invoke-virtual {v1, v10, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 217
    .line 218
    .line 219
    iget-object v12, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 220
    .line 221
    iget v1, v0, Ll/fsf0;->g:F

    .line 222
    .line 223
    mul-float v15, v1, v11

    .line 224
    .line 225
    mul-float v16, v1, v11

    .line 226
    .line 227
    const/4 v14, 0x0

    .line 228
    const/high16 v17, 0x43340000    # 180.0f

    .line 229
    .line 230
    invoke-virtual/range {v12 .. v19}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 231
    .line 232
    .line 233
    iget-object v0, v0, Ll/fsf0;->i:Landroid/graphics/Path;

    .line 234
    .line 235
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public f(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/fsf0;->o:Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    const/high16 v0, 0x42000000    # 32.0f

    .line 14
    .line 15
    mul-float/2addr v0, p1

    .line 16
    iput v0, p0, Ll/fsf0;->c:F

    .line 17
    .line 18
    iput v0, p0, Ll/fsf0;->d:F

    .line 19
    .line 20
    const/high16 v1, 0x41000000    # 8.0f

    .line 21
    .line 22
    mul-float/2addr v1, p1

    .line 23
    iput v1, p0, Ll/fsf0;->g:F

    .line 24
    .line 25
    const/high16 v1, 0x40000000    # 2.0f

    .line 26
    .line 27
    mul-float/2addr v1, p1

    .line 28
    iput v1, p0, Ll/fsf0;->h:F

    .line 29
    .line 30
    const/high16 v1, 0x40a00000    # 5.0f

    .line 31
    .line 32
    mul-float/2addr v1, p1

    .line 33
    iput v1, p0, Ll/fsf0;->e:F

    .line 34
    .line 35
    const/high16 v2, 0x41200000    # 10.0f

    .line 36
    .line 37
    mul-float/2addr p1, v2

    .line 38
    iput p1, p0, Ll/fsf0;->k:F

    .line 39
    .line 40
    sub-float/2addr v0, v1

    .line 41
    iput v0, p0, Ll/fsf0;->f:F

    .line 42
    .line 43
    iget-object p0, p0, Ll/fsf0;->a:Landroid/graphics/Paint;

    .line 44
    .line 45
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fsf0;->o:Landroid/util/DisplayMetrics;

    .line 4
    .line 5
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 6
    .line 7
    iput v1, v0, Landroid/text/TextPaint;->density:F

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 21
    .line 22
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 28
    .line 29
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 32
    .line 33
    .line 34
    const/high16 v0, 0x41800000    # 16.0f

    .line 35
    .line 36
    iget-object v1, p0, Ll/fsf0;->o:Landroid/util/DisplayMetrics;

    .line 37
    .line 38
    const/4 v2, 0x2

    .line 39
    invoke-static {v2, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object p0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fsf0;->b:Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Ll/fsf0;->d:F

    .line 8
    .line 9
    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    float-to-int p0, p0

    .line 14
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 2

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    iget v1, p0, Ll/fsf0;->k:F

    .line 4
    .line 5
    mul-float/2addr v1, v0

    .line 6
    invoke-virtual {p0}, Ll/fsf0;->d()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    add-float/2addr v1, v0

    .line 11
    iget p0, p0, Ll/fsf0;->c:F

    .line 12
    .line 13
    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    float-to-int p0, p0

    .line 18
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public h(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/fsf0;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fsf0;->m:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/fsf0;->p:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Ll/fsf0;->p:Ljava/lang/CharSequence;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/fsf0;->l:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/fsf0;->e()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
            to = 0xffL
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method
