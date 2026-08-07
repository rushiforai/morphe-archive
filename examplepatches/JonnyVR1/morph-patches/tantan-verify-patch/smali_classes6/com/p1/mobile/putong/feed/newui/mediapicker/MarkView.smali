.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:Z

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41880000    # 17.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->a:I

    .line 11
    .line 12
    const/high16 p1, 0x41400000    # 12.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->b:I

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->d:Z

    .line 22
    .line 23
    const-string p1, "#f55a43"

    .line 24
    .line 25
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->f:I

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41880000    # 17.0f

    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->a:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->b:I

    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->d:Z

    .line 36
    const-string p1, "#f55a43"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->f:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41880000    # 17.0f

    .line 38
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->a:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 39
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->b:I

    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->d:Z

    .line 41
    const-string p1, "#f55a43"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->f:I

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->a:I

    .line 5
    .line 6
    int-to-float v0, v0

    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr v0, v1

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->c:F

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->d:Z

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    const/4 v3, 0x1

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 24
    .line 25
    .line 26
    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 27
    .line 28
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v3, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 32
    .line 33
    .line 34
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->f:I

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    .line 38
    .line 39
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->c:F

    .line 40
    .line 41
    invoke-virtual {p1, v3, v3, v3, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 45
    .line 46
    .line 47
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->e:I

    .line 48
    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    sget v3, Ll/lbc0;->g:I

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const/high16 v3, 0x41200000    # 10.0f

    .line 72
    .line 73
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    int-to-float v3, v3

    .line 78
    const/high16 v4, 0x41000000    # 8.0f

    .line 79
    .line 80
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    int-to-float v4, v4

    .line 85
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->c:F

    .line 86
    .line 87
    div-float v5, v3, v1

    .line 88
    .line 89
    sub-float v5, p0, v5

    .line 90
    .line 91
    div-float v1, v4, v1

    .line 92
    .line 93
    sub-float/2addr p0, v1

    .line 94
    const/4 v1, 0x0

    .line 95
    cmpl-float v6, v5, v1

    .line 96
    .line 97
    if-lez v6, :cond_0

    .line 98
    .line 99
    cmpl-float v1, p0, v1

    .line 100
    .line 101
    if-lez v1, :cond_0

    .line 102
    .line 103
    invoke-static {v2, v3, v4}, Ll/l9k;->a(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p1, v1, v5, p0, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 108
    .line 109
    .line 110
    :cond_0
    return-void

    .line 111
    :cond_1
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->b:I

    .line 112
    .line 113
    int-to-float v2, v2

    .line 114
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 115
    .line 116
    .line 117
    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 120
    .line 121
    .line 122
    const/4 v2, 0x3

    .line 123
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    div-int/lit8 v2, v2, 0x2

    .line 135
    .line 136
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    div-int/lit8 v3, v3, 0x2

    .line 141
    .line 142
    int-to-float v3, v3

    .line 143
    invoke-virtual {v0}, Landroid/graphics/Paint;->descent()F

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    invoke-virtual {v0}, Landroid/graphics/Paint;->ascent()F

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    add-float/2addr v4, v5

    .line 152
    div-float/2addr v4, v1

    .line 153
    sub-float/2addr v3, v4

    .line 154
    float-to-int v1, v3

    .line 155
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->e:I

    .line 156
    .line 157
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    int-to-float v2, v2

    .line 162
    int-to-float v1, v1

    .line 163
    invoke-virtual {p1, p0, v2, v1, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_2
    new-instance v0, Landroid/graphics/Paint;

    .line 168
    .line 169
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 170
    .line 171
    .line 172
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->c:F

    .line 173
    .line 174
    const/high16 v4, 0x40800000    # 4.0f

    .line 175
    .line 176
    sub-float/2addr v1, v4

    .line 177
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 178
    .line 179
    .line 180
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 181
    .line 182
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 189
    .line 190
    .line 191
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->c:F

    .line 192
    .line 193
    invoke-virtual {p1, v2, v2, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 194
    .line 195
    .line 196
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 197
    .line 198
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 199
    .line 200
    .line 201
    const-string v2, "#19000000"

    .line 202
    .line 203
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 208
    .line 209
    .line 210
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->c:F

    .line 211
    .line 212
    invoke-virtual {p1, p0, p0, v1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->a:I

    .line 5
    .line 6
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setChecked(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->d:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCheckedBgColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->f:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSelectPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;->e:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
