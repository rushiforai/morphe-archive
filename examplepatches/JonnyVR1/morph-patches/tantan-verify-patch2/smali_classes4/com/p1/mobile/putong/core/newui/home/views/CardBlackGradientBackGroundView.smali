.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/LinearGradient;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public final h:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->b:Landroid/graphics/Paint;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->c:I

    .line 20
    .line 21
    const/high16 v0, -0x1000000

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->d:I

    .line 24
    .line 25
    const/high16 v0, 0x43480000    # 200.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->e:I

    .line 32
    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->f:I

    .line 34
    .line 35
    const/high16 p1, 0x41a00000    # 20.0f

    .line 36
    .line 37
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->g:I

    .line 42
    .line 43
    new-instance p1, Landroid/graphics/Paint;

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->h:Landroid/graphics/Paint;

    .line 50
    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 52
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 53
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->a:Ljava/util/HashMap;

    .line 54
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->b:Landroid/graphics/Paint;

    const/4 p1, 0x0

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->c:I

    const/high16 p2, -0x1000000

    .line 56
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->d:I

    const/high16 p2, 0x43480000    # 200.0f

    .line 57
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->e:I

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->f:I

    const/high16 p1, 0x41a00000    # 20.0f

    .line 59
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->g:I

    .line 60
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->h:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 61
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 62
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->a:Ljava/util/HashMap;

    .line 63
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->b:Landroid/graphics/Paint;

    const/4 p1, 0x0

    .line 64
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->c:I

    const/high16 p2, -0x1000000

    .line 65
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->d:I

    const/high16 p2, 0x43480000    # 200.0f

    .line 66
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->e:I

    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->f:I

    const/high16 p1, 0x41a00000    # 20.0f

    .line 68
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->g:I

    .line 69
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->h:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->a:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v5, v1

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v6, v1

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->c:I

    .line 22
    .line 23
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->d:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->a:Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Landroid/graphics/LinearGradient;

    .line 46
    .line 47
    const/high16 v10, 0x41a00000    # 20.0f

    .line 48
    .line 49
    if-nez v2, :cond_0

    .line 50
    .line 51
    new-instance v11, Landroid/graphics/LinearGradient;

    .line 52
    .line 53
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->e:I

    .line 54
    .line 55
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    sub-int/2addr v2, v3

    .line 60
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    int-to-float v15, v2

    .line 69
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->c:I

    .line 70
    .line 71
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->d:I

    .line 72
    .line 73
    sget-object v18, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 74
    .line 75
    const/4 v12, 0x0

    .line 76
    const/4 v13, 0x0

    .line 77
    const/4 v14, 0x0

    .line 78
    move/from16 v16, v2

    .line 79
    .line 80
    move/from16 v17, v3

    .line 81
    .line 82
    invoke-direct/range {v11 .. v18}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 83
    .line 84
    .line 85
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->a:Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-virtual {v2, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-object v2, v11

    .line 91
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->b:Landroid/graphics/Paint;

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 94
    .line 95
    .line 96
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->b:Landroid/graphics/Paint;

    .line 97
    .line 98
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 101
    .line 102
    .line 103
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->f:I

    .line 104
    .line 105
    if-nez v1, :cond_1

    .line 106
    .line 107
    iget v1, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->g:I

    .line 108
    .line 109
    int-to-float v7, v1

    .line 110
    int-to-float v8, v1

    .line 111
    iget-object v9, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->b:Landroid/graphics/Paint;

    .line 112
    .line 113
    const/4 v3, 0x0

    .line 114
    const/4 v4, 0x0

    .line 115
    move-object/from16 v2, p1

    .line 116
    .line 117
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 118
    .line 119
    .line 120
    move v1, v6

    .line 121
    goto :goto_0

    .line 122
    :cond_1
    move v1, v6

    .line 123
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->e:I

    .line 124
    .line 125
    int-to-float v6, v2

    .line 126
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->b:Landroid/graphics/Paint;

    .line 127
    .line 128
    const/4 v3, 0x0

    .line 129
    const/4 v4, 0x0

    .line 130
    move-object/from16 v2, p1

    .line 131
    .line 132
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 133
    .line 134
    .line 135
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->h:Landroid/graphics/Paint;

    .line 136
    .line 137
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->d:I

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 140
    .line 141
    .line 142
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->e:I

    .line 143
    .line 144
    const/high16 v3, 0x41b00000    # 22.0f

    .line 145
    .line 146
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    sub-int/2addr v2, v4

    .line 151
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    float-to-int v3, v5

    .line 160
    float-to-int v1, v1

    .line 161
    new-instance v4, Landroid/graphics/Path;

    .line 162
    .line 163
    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    int-to-float v5, v5

    .line 171
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 172
    .line 173
    .line 174
    int-to-float v2, v2

    .line 175
    const/4 v6, 0x0

    .line 176
    invoke-virtual {v4, v6, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 177
    .line 178
    .line 179
    int-to-float v3, v3

    .line 180
    invoke-virtual {v4, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 181
    .line 182
    .line 183
    int-to-float v1, v1

    .line 184
    sub-float v7, v1, v5

    .line 185
    .line 186
    invoke-virtual {v4, v3, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 187
    .line 188
    .line 189
    new-instance v7, Landroid/graphics/RectF;

    .line 190
    .line 191
    const/high16 v8, 0x40000000    # 2.0f

    .line 192
    .line 193
    mul-float/2addr v8, v5

    .line 194
    sub-float v9, v3, v8

    .line 195
    .line 196
    sub-float v10, v1, v8

    .line 197
    .line 198
    invoke-direct {v7, v9, v10, v3, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 199
    .line 200
    .line 201
    const/high16 v3, 0x42b40000    # 90.0f

    .line 202
    .line 203
    invoke-virtual {v4, v7, v6, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 204
    .line 205
    .line 206
    add-float/2addr v5, v6

    .line 207
    invoke-virtual {v4, v5, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 208
    .line 209
    .line 210
    new-instance v5, Landroid/graphics/RectF;

    .line 211
    .line 212
    add-float/2addr v8, v6

    .line 213
    invoke-direct {v5, v6, v10, v8, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v4, v5, v3, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v4, v6, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    .line 223
    .line 224
    .line 225
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardBlackGradientBackGroundView;->h:Landroid/graphics/Paint;

    .line 226
    .line 227
    move-object/from16 v2, p1

    .line 228
    .line 229
    invoke-virtual {v2, v4, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method
