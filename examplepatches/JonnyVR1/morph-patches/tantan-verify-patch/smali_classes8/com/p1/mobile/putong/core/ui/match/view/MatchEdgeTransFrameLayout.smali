.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:I

.field public c:F

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:[I

.field public k:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->d:I

    .line 6
    .line 7
    shl-int p2, p1, p1

    .line 8
    .line 9
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->e:I

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    const/4 p3, 0x2

    .line 13
    shl-int/2addr p2, p3

    .line 14
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->f:I

    .line 15
    .line 16
    shl-int/lit8 p1, p1, 0x3

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->g:I

    .line 19
    .line 20
    const/4 p1, -0x1

    .line 21
    const/4 p2, 0x0

    .line 22
    filled-new-array {p1, p2}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->j:[I

    .line 27
    .line 28
    new-array p1, p3, [F

    .line 29
    .line 30
    fill-array-data p1, :array_0

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->k:[F

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a:Landroid/graphics/Paint;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 17
    .line 18
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    .line 19
    .line 20
    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 24
    .line 25
    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->d:I

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->e:I

    .line 29
    .line 30
    or-int/2addr v0, v1

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->b:I

    .line 32
    .line 33
    const/high16 v0, 0x41200000    # 10.0f

    .line 34
    .line 35
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    int-to-float v0, v0

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->c:F

    .line 41
    .line 42
    return-void
.end method

.method public final b()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 4
    .line 5
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->c:F

    .line 6
    .line 7
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->j:[I

    .line 8
    .line 9
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->k:[F

    .line 10
    .line 11
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v4, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v5, v0

    .line 11
    const/4 v6, 0x0

    .line 12
    const/16 v7, 0x1f

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v1, p1

    .line 17
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    move-object v0, v1

    .line 22
    invoke-super {p0, v0, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->b:I

    .line 27
    .line 28
    if-eqz p3, :cond_0

    .line 29
    .line 30
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->d:I

    .line 31
    .line 32
    and-int/2addr p3, p4

    .line 33
    if-eqz p3, :cond_1

    .line 34
    .line 35
    :cond_0
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 36
    .line 37
    int-to-float v3, p3

    .line 38
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->c:F

    .line 39
    .line 40
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a:Landroid/graphics/Paint;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->b:I

    .line 48
    .line 49
    const/high16 p4, 0x40000000    # 2.0f

    .line 50
    .line 51
    if-eqz p3, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->e:I

    .line 54
    .line 55
    and-int/2addr p3, v1

    .line 56
    if-eqz p3, :cond_3

    .line 57
    .line 58
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 63
    .line 64
    int-to-float v1, v1

    .line 65
    div-float/2addr v1, p4

    .line 66
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->i:I

    .line 67
    .line 68
    int-to-float v2, v2

    .line 69
    div-float/2addr v2, p4

    .line 70
    const/high16 v3, 0x43340000    # 180.0f

    .line 71
    .line 72
    invoke-virtual {v0, v3, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 73
    .line 74
    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 76
    .line 77
    int-to-float v3, v1

    .line 78
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->c:F

    .line 79
    .line 80
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a:Landroid/graphics/Paint;

    .line 81
    .line 82
    const/4 v1, 0x0

    .line 83
    const/4 v2, 0x0

    .line 84
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 88
    .line 89
    .line 90
    :cond_3
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->i:I

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 93
    .line 94
    sub-int/2addr p3, v1

    .line 95
    int-to-float p3, p3

    .line 96
    div-float/2addr p3, p4

    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->b:I

    .line 98
    .line 99
    const/4 v6, 0x0

    .line 100
    if-eqz v1, :cond_4

    .line 101
    .line 102
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->f:I

    .line 103
    .line 104
    and-int/2addr v1, v2

    .line 105
    if-eqz v1, :cond_5

    .line 106
    .line 107
    :cond_4
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 112
    .line 113
    int-to-float v1, v1

    .line 114
    div-float/2addr v1, p4

    .line 115
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->i:I

    .line 116
    .line 117
    int-to-float v2, v2

    .line 118
    div-float/2addr v2, p4

    .line 119
    const/high16 v3, 0x43870000    # 270.0f

    .line 120
    .line 121
    invoke-virtual {v0, v3, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v6, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 125
    .line 126
    .line 127
    sub-float v1, v6, p3

    .line 128
    .line 129
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 130
    .line 131
    int-to-float v2, v2

    .line 132
    add-float v3, v2, p3

    .line 133
    .line 134
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->c:F

    .line 135
    .line 136
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a:Landroid/graphics/Paint;

    .line 137
    .line 138
    const/4 v2, 0x0

    .line 139
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 143
    .line 144
    .line 145
    :cond_5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->b:I

    .line 146
    .line 147
    if-eqz v1, :cond_6

    .line 148
    .line 149
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->g:I

    .line 150
    .line 151
    and-int/2addr v1, v2

    .line 152
    if-eqz v1, :cond_7

    .line 153
    .line 154
    :cond_6
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 155
    .line 156
    .line 157
    move-result v7

    .line 158
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 159
    .line 160
    int-to-float v1, v1

    .line 161
    div-float/2addr v1, p4

    .line 162
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->i:I

    .line 163
    .line 164
    int-to-float v2, v2

    .line 165
    div-float/2addr v2, p4

    .line 166
    const/high16 p4, 0x42b40000    # 90.0f

    .line 167
    .line 168
    invoke-virtual {v0, p4, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v6, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 172
    .line 173
    .line 174
    sub-float v1, v6, p3

    .line 175
    .line 176
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 177
    .line 178
    int-to-float p4, p4

    .line 179
    add-float v3, p4, p3

    .line 180
    .line 181
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->c:F

    .line 182
    .line 183
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->a:Landroid/graphics/Paint;

    .line 184
    .line 185
    const/4 v2, 0x0

    .line 186
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 190
    .line 191
    .line 192
    :cond_7
    invoke-virtual {v0, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 193
    .line 194
    .line 195
    return p2
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->b()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->h:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchEdgeTransFrameLayout;->i:I

    .line 18
    .line 19
    return-void
.end method
