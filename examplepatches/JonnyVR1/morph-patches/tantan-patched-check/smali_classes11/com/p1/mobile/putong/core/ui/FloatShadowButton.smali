.class public Lcom/p1/mobile/putong/core/ui/FloatShadowButton;
.super Lcom/p1/mobile/putong/core/ui/ShadowButton;
.source "SourceFile"


# instance fields
.field public final x:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/ShadowButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/FloatShadowButton;->x:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/ShadowButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/FloatShadowButton;->x:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public d(Landroid/graphics/Canvas;F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/a;->c:F

    .line 4
    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    div-float/2addr v0, v1

    .line 8
    div-float v0, p2, v0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 11
    .line 12
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->c:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 15
    .line 16
    .line 17
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->o:Z

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 23
    .line 24
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 25
    .line 26
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->d:I

    .line 27
    .line 28
    invoke-virtual {p0, v5, v0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-virtual {v2, v4, v3, v4, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 33
    .line 34
    .line 35
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 36
    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {p1, v2, v2, p2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 43
    .line 44
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 45
    .line 46
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e:I

    .line 47
    .line 48
    invoke-virtual {p0, v5, v0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-virtual {v2, v4, v3, v3, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-virtual {p1, v2, v2, p2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_3

    .line 74
    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 78
    .line 79
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 84
    .line 85
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 86
    .line 87
    div-float v5, v4, v1

    .line 88
    .line 89
    mul-float/2addr v5, v0

    .line 90
    sub-float v5, v2, v5

    .line 91
    .line 92
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 93
    .line 94
    div-float v1, v6, v1

    .line 95
    .line 96
    mul-float/2addr v1, v0

    .line 97
    sub-float/2addr v2, v1

    .line 98
    cmpl-float v1, v5, v3

    .line 99
    .line 100
    if-lez v1, :cond_3

    .line 101
    .line 102
    cmpl-float v1, v2, v3

    .line 103
    .line 104
    if-lez v1, :cond_3

    .line 105
    .line 106
    float-to-int v1, v5

    .line 107
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->r:Z

    .line 108
    .line 109
    if-nez v3, :cond_1

    .line 110
    .line 111
    mul-float/2addr v4, v0

    .line 112
    mul-float/2addr v6, v0

    .line 113
    invoke-static {p2, v4, v6}, Ll/l9k;->a(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 118
    .line 119
    invoke-virtual {p1, p2, v5, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 124
    .line 125
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v3, v4}, Ll/oof0;->containsKey(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-nez v3, :cond_2

    .line 134
    .line 135
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 136
    .line 137
    mul-float/2addr v3, v0

    .line 138
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 139
    .line 140
    mul-float/2addr v4, v0

    .line 141
    invoke-static {p2, v3, v4}, Ll/l9k;->a(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 146
    .line 147
    invoke-virtual {p1, p2, v5, v2, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 148
    .line 149
    .line 150
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->r:Z

    .line 151
    .line 152
    if-eqz p1, :cond_3

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 155
    .line 156
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    invoke-virtual {p0, p1, p2}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 173
    .line 174
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p2, v0}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    check-cast p2, Ll/pf60;

    .line 183
    .line 184
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast p2, Landroid/graphics/Bitmap;

    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 189
    .line 190
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {v0, v2}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Ll/pf60;

    .line 199
    .line 200
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 201
    .line 202
    check-cast v0, Ljava/lang/Float;

    .line 203
    .line 204
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->w:Ll/l01;

    .line 209
    .line 210
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v2, v1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    check-cast v1, Ll/pf60;

    .line 219
    .line 220
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v1, Ljava/lang/Float;

    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 229
    .line 230
    invoke-virtual {p1, p2, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 231
    .line 232
    .line 233
    :cond_3
    return-void
.end method
