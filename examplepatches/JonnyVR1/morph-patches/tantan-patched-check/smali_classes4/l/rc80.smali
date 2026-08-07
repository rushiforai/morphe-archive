.class public Ll/rc80;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/RectF;

.field public final c:F

.field public final d:Landroid/graphics/Paint;

.field public e:I

.field public f:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 68
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Ll/cac0;->a:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-direct {p0, v0}, Ll/rc80;-><init>(F)V

    return-void
.end method

.method public constructor <init>(F)V
    .locals 1

    const/16 v0, 0xf

    .line 67
    invoke-direct {p0, p1, v0}, Ll/rc80;-><init>(FI)V

    return-void
.end method

.method public constructor <init>(FI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    iput v0, p0, Ll/rc80;->e:I

    .line 7
    .line 8
    const/high16 v0, 0x41200000    # 10.0f

    .line 9
    .line 10
    iput v0, p0, Ll/rc80;->f:F

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/rc80;->a:Landroid/graphics/Paint;

    .line 18
    .line 19
    const/4 v1, -0x1

    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    sget v1, Ll/qa00;->e:I

    .line 24
    .line 25
    int-to-float v1, v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 27
    .line 28
    .line 29
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 36
    .line 37
    .line 38
    iput p1, p0, Ll/rc80;->c:F

    .line 39
    .line 40
    new-instance p1, Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/rc80;->d:Landroid/graphics/Paint;

    .line 46
    .line 47
    const-string v0, "#dcdcdc"

    .line 48
    .line 49
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    .line 55
    .line 56
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 62
    .line 63
    .line 64
    iput p2, p0, Ll/rc80;->e:I

    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v1, p0, Ll/rc80;->b:Landroid/graphics/RectF;

    .line 2
    .line 3
    if-nez v1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object v8

    .line 13
    invoke-virtual {p1, v8}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 14
    .line 15
    .line 16
    iget v1, v8, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    iget v2, v8, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    int-to-float v2, v2

    .line 22
    iget v3, v8, Landroid/graphics/Rect;->right:I

    .line 23
    .line 24
    int-to-float v3, v3

    .line 25
    iget v4, v8, Landroid/graphics/Rect;->bottom:I

    .line 26
    .line 27
    int-to-float v4, v4

    .line 28
    iget v5, p0, Ll/rc80;->c:F

    .line 29
    .line 30
    iget-object v7, p0, Ll/rc80;->d:Landroid/graphics/Paint;

    .line 31
    .line 32
    move v6, v5

    .line 33
    move-object v0, p1

    .line 34
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ll/rc80;->e:I

    .line 38
    .line 39
    and-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget v0, v8, Landroid/graphics/Rect;->left:I

    .line 44
    .line 45
    int-to-float v1, v0

    .line 46
    iget v2, v8, Landroid/graphics/Rect;->top:I

    .line 47
    .line 48
    int-to-float v3, v2

    .line 49
    int-to-float v0, v0

    .line 50
    iget v4, p0, Ll/rc80;->c:F

    .line 51
    .line 52
    add-float/2addr v0, v4

    .line 53
    int-to-float v2, v2

    .line 54
    add-float/2addr v4, v2

    .line 55
    iget-object v5, p0, Ll/rc80;->d:Landroid/graphics/Paint;

    .line 56
    .line 57
    move v2, v3

    .line 58
    move v3, v0

    .line 59
    move-object v0, p1

    .line 60
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    iget v0, p0, Ll/rc80;->e:I

    .line 64
    .line 65
    and-int/lit8 v0, v0, 0x2

    .line 66
    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    iget v0, v8, Landroid/graphics/Rect;->right:I

    .line 70
    .line 71
    int-to-float v1, v0

    .line 72
    iget v2, p0, Ll/rc80;->c:F

    .line 73
    .line 74
    sub-float/2addr v1, v2

    .line 75
    iget v3, v8, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    move v4, v2

    .line 78
    int-to-float v2, v3

    .line 79
    int-to-float v0, v0

    .line 80
    int-to-float v3, v3

    .line 81
    add-float/2addr v4, v3

    .line 82
    iget-object v5, p0, Ll/rc80;->d:Landroid/graphics/Paint;

    .line 83
    .line 84
    move v3, v0

    .line 85
    move-object v0, p1

    .line 86
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget v0, p0, Ll/rc80;->e:I

    .line 90
    .line 91
    and-int/lit8 v0, v0, 0x4

    .line 92
    .line 93
    if-nez v0, :cond_3

    .line 94
    .line 95
    iget v0, v8, Landroid/graphics/Rect;->left:I

    .line 96
    .line 97
    int-to-float v1, v0

    .line 98
    iget v2, v8, Landroid/graphics/Rect;->bottom:I

    .line 99
    .line 100
    int-to-float v3, v2

    .line 101
    iget v4, p0, Ll/rc80;->c:F

    .line 102
    .line 103
    sub-float/2addr v3, v4

    .line 104
    int-to-float v0, v0

    .line 105
    add-float/2addr v0, v4

    .line 106
    int-to-float v4, v2

    .line 107
    iget-object v5, p0, Ll/rc80;->d:Landroid/graphics/Paint;

    .line 108
    .line 109
    move v2, v3

    .line 110
    move v3, v0

    .line 111
    move-object v0, p1

    .line 112
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 113
    .line 114
    .line 115
    :cond_3
    iget v0, p0, Ll/rc80;->e:I

    .line 116
    .line 117
    and-int/lit8 v0, v0, 0x8

    .line 118
    .line 119
    if-nez v0, :cond_4

    .line 120
    .line 121
    iget v0, v8, Landroid/graphics/Rect;->right:I

    .line 122
    .line 123
    int-to-float v1, v0

    .line 124
    iget v2, p0, Ll/rc80;->c:F

    .line 125
    .line 126
    sub-float/2addr v1, v2

    .line 127
    iget v3, v8, Landroid/graphics/Rect;->bottom:I

    .line 128
    .line 129
    int-to-float v4, v3

    .line 130
    sub-float v2, v4, v2

    .line 131
    .line 132
    int-to-float v0, v0

    .line 133
    int-to-float v4, v3

    .line 134
    iget-object v5, p0, Ll/rc80;->d:Landroid/graphics/Paint;

    .line 135
    .line 136
    move v3, v0

    .line 137
    move-object v0, p1

    .line 138
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 139
    .line 140
    .line 141
    :cond_4
    iget v1, p0, Ll/rc80;->f:F

    .line 142
    .line 143
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    int-to-float v2, v2

    .line 148
    const/high16 v3, 0x40000000    # 2.0f

    .line 149
    .line 150
    div-float/2addr v2, v3

    .line 151
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    int-to-float v4, v4

    .line 156
    div-float/2addr v4, v3

    .line 157
    invoke-virtual {p1, v1, v2, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 158
    .line 159
    .line 160
    iget v1, p0, Ll/rc80;->f:F

    .line 161
    .line 162
    const/high16 v2, 0x40400000    # 3.0f

    .line 163
    .line 164
    add-float/2addr v1, v2

    .line 165
    const/high16 v2, 0x43b40000    # 360.0f

    .line 166
    .line 167
    rem-float/2addr v1, v2

    .line 168
    iput v1, p0, Ll/rc80;->f:F

    .line 169
    .line 170
    iget-object v1, p0, Ll/rc80;->b:Landroid/graphics/RectF;

    .line 171
    .line 172
    const/4 v4, 0x0

    .line 173
    iget-object v5, p0, Ll/rc80;->a:Landroid/graphics/Paint;

    .line 174
    .line 175
    const/4 v2, 0x0

    .line 176
    const/high16 v3, 0x43870000    # 270.0f

    .line 177
    .line 178
    move-object v0, p1

    .line 179
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x42000000    # 32.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    const/high16 v1, 0x40000000    # 2.0f

    .line 12
    .line 13
    div-float/2addr v0, v1

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    div-int/lit8 v1, v1, 0x2

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    div-int/lit8 p1, p1, 0x2

    .line 25
    .line 26
    new-instance v2, Landroid/graphics/RectF;

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    sub-float v3, v1, v0

    .line 30
    .line 31
    int-to-float p1, p1

    .line 32
    sub-float v4, p1, v0

    .line 33
    .line 34
    add-float/2addr v1, v0

    .line 35
    add-float/2addr p1, v0

    .line 36
    invoke-direct {v2, v3, v4, v1, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Ll/rc80;->b:Landroid/graphics/RectF;

    .line 40
    .line 41
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

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
