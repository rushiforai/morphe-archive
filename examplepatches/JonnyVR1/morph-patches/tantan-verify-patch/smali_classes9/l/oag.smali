.class public Ll/oag;
.super Ll/ruf0;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/oag$a;
    }
.end annotation


# instance fields
.field public a:Ll/oag$a;

.field public b:Ljava/lang/String;

.field public c:F

.field public d:F

.field public e:Z

.field public f:Landroid/graphics/Rect;

.field public g:Landroid/graphics/Rect;

.field public h:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oag$a;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Ll/oag$a;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 10
    .line 11
    iput-object p1, p0, Ll/oag;->h:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ll/oag$a;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 16
    iput-object p1, p0, Ll/oag;->a:Ll/oag$a;

    .line 17
    iget-object p1, p1, Ll/oag$a;->c:Landroid/graphics/Bitmap;

    iput-object p1, p0, Ll/oag;->h:Landroid/graphics/Bitmap;

    return-void
.end method

.method public synthetic constructor <init>(Ll/oag$a;Ll/pag;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/oag;-><init>(Ll/oag$a;)V

    return-void
.end method


# virtual methods
.method public b()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oag;->h:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oag$a;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    iget-object v1, p0, Ll/oag;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ll/oag;->d:F

    .line 12
    .line 13
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oag;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oag;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 2
    .line 3
    iget-object v1, v0, Ll/oag$a;->c:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iget-object v0, v0, Ll/oag$a;->d:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    iget-object v3, p0, Ll/oag;->g:Landroid/graphics/Rect;

    .line 18
    .line 19
    if-nez v3, :cond_1

    .line 20
    .line 21
    new-instance v3, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v3, p0, Ll/oag;->g:Landroid/graphics/Rect;

    .line 27
    .line 28
    :cond_1
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    int-to-float v3, v3

    .line 33
    const/high16 v4, 0x3f800000    # 1.0f

    .line 34
    .line 35
    mul-float/2addr v3, v4

    .line 36
    float-to-int v3, v3

    .line 37
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    int-to-float v5, v5

    .line 42
    mul-float/2addr v5, v4

    .line 43
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    int-to-float v6, v6

    .line 48
    div-float/2addr v5, v6

    .line 49
    int-to-float v6, v3

    .line 50
    mul-float/2addr v5, v6

    .line 51
    float-to-int v5, v5

    .line 52
    iget-object v6, p0, Ll/oag;->g:Landroid/graphics/Rect;

    .line 53
    .line 54
    const/4 v7, 0x0

    .line 55
    invoke-virtual {v6, v7, v7, v5, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Ll/oag;->g:Landroid/graphics/Rect;

    .line 62
    .line 63
    iget-object v5, p0, Ll/oag;->a:Ll/oag$a;

    .line 64
    .line 65
    iget-object v5, v5, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 66
    .line 67
    const/4 v6, 0x0

    .line 68
    invoke-virtual {p1, v1, v6, v3, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/oag;->g:Landroid/graphics/Rect;

    .line 75
    .line 76
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/oag;->f:Landroid/graphics/Rect;

    .line 80
    .line 81
    if-nez v1, :cond_2

    .line 82
    .line 83
    new-instance v1, Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v1, p0, Ll/oag;->f:Landroid/graphics/Rect;

    .line 89
    .line 90
    :cond_2
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    int-to-float v1, v1

    .line 95
    mul-float/2addr v1, v4

    .line 96
    float-to-int v1, v1

    .line 97
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    int-to-float v3, v3

    .line 102
    mul-float/2addr v3, v4

    .line 103
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    int-to-float v4, v4

    .line 108
    div-float/2addr v3, v4

    .line 109
    int-to-float v4, v1

    .line 110
    mul-float/2addr v3, v4

    .line 111
    float-to-int v3, v3

    .line 112
    iget-object v4, p0, Ll/oag;->f:Landroid/graphics/Rect;

    .line 113
    .line 114
    invoke-virtual {v4, v7, v7, v3, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    int-to-float v1, v1

    .line 125
    const v4, 0x3d75c28f    # 0.06f

    .line 126
    .line 127
    .line 128
    mul-float/2addr v1, v4

    .line 129
    const/4 v5, 0x0

    .line 130
    invoke-virtual {p1, v1, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/oag;->f:Landroid/graphics/Rect;

    .line 134
    .line 135
    iget-object v5, p0, Ll/oag;->a:Ll/oag$a;

    .line 136
    .line 137
    iget-object v5, v5, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 138
    .line 139
    invoke-virtual {p1, v0, v6, v1, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    int-to-float v0, v0

    .line 150
    mul-float/2addr v0, v4

    .line 151
    int-to-float v1, v3

    .line 152
    add-float/2addr v0, v1

    .line 153
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    int-to-float v1, v1

    .line 158
    const v3, 0x3cf5c28f    # 0.03f

    .line 159
    .line 160
    .line 161
    mul-float/2addr v1, v3

    .line 162
    iget-object v3, p0, Ll/oag;->b:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    int-to-float v2, v2

    .line 169
    sub-float/2addr v2, v0

    .line 170
    iget v4, p0, Ll/oag;->d:F

    .line 171
    .line 172
    sub-float/2addr v2, v4

    .line 173
    const/high16 v4, 0x40000000    # 2.0f

    .line 174
    .line 175
    div-float/2addr v2, v4

    .line 176
    add-float/2addr v0, v2

    .line 177
    sub-float/2addr v0, v1

    .line 178
    iget v1, p0, Ll/oag;->c:F

    .line 179
    .line 180
    iget-object p0, p0, Ll/oag;->a:Ll/oag$a;

    .line 181
    .line 182
    iget-object p0, p0, Ll/oag$a;->b:Landroid/graphics/Paint;

    .line 183
    .line 184
    invoke-virtual {p1, v3, v0, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 185
    .line 186
    .line 187
    :cond_3
    :goto_0
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/oag;->a:Ll/oag$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oag$a;->c:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->hasAlpha()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/oag;->a:Ll/oag$a;

    .line 20
    .line 21
    iget-object p0, p0, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/16 v0, 0xff

    .line 28
    .line 29
    if-ge p0, v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, -0x1

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, -0x3

    .line 35
    return p0
.end method

.method public getRatio()F
    .locals 0

    .line 1
    const p0, 0x40649249

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/oag;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/oag$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/oag;->a:Ll/oag$a;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/oag$a;-><init>(Ll/oag$a;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/oag;->e:Z

    .line 22
    .line 23
    :cond_0
    return-object p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oag$a;->b:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const v2, 0x3f11eb85    # 0.57f

    .line 11
    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 18
    .line 19
    iget-object v0, v0, Ll/oag$a;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 26
    .line 27
    neg-float v1, v1

    .line 28
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 29
    .line 30
    add-float/2addr v1, v2

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    int-to-float p1, p1

    .line 36
    sub-float/2addr p1, v1

    .line 37
    const/high16 v1, 0x40000000    # 2.0f

    .line 38
    .line 39
    div-float/2addr p1, v1

    .line 40
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 41
    .line 42
    sub-float/2addr p1, v0

    .line 43
    iput p1, p0, Ll/oag;->c:F

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/oag;->c()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 12
    .line 13
    iget-object v0, v0, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/oag;->a:Ll/oag$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    return-void
.end method
