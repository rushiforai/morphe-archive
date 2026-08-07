.class public Ll/gre;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/graphics/Canvas;

.field private b:Landroid/graphics/Paint;

.field private c:Ljava/lang/String;

.field private d:Lcom/immomo/velib/anim/model/Element;


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


# virtual methods
.method public a(Lcom/immomo/velib/anim/model/Element;)Landroid/graphics/Bitmap;
    .locals 10

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/gre;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/gre;->d:Lcom/immomo/velib/anim/model/Element;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getText()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getBackgroundPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getFontSize()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getMaxLen()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getHeight()F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/high16 v4, 0x44a00000    # 1280.0f

    .line 27
    .line 28
    mul-float/2addr v3, v4

    .line 29
    float-to-int v3, v3

    .line 30
    add-int/lit8 v3, v3, 0xc

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getWidth()F

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    const/high16 v5, 0x44340000    # 720.0f

    .line 37
    .line 38
    mul-float/2addr v4, v5

    .line 39
    float-to-int v4, v4

    .line 40
    add-int/lit8 v4, v4, 0x10

    .line 41
    .line 42
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 43
    .line 44
    invoke-static {v4, v3, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    const/16 v1, 0xe

    .line 51
    .line 52
    :cond_0
    if-nez v2, :cond_1

    .line 53
    .line 54
    const/4 v2, 0x5

    .line 55
    :cond_1
    iget-object v6, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 56
    .line 57
    const/4 v7, 0x1

    .line 58
    const/high16 v8, 0x40000000    # 2.0f

    .line 59
    .line 60
    if-nez v6, :cond_2

    .line 61
    .line 62
    new-instance v6, Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v6, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 68
    .line 69
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v6, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 75
    .line 76
    .line 77
    iget-object v6, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 78
    .line 79
    sget-object v9, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 80
    .line 81
    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    int-to-float v1, v1

    .line 85
    mul-float/2addr v1, v8

    .line 86
    float-to-int v1, v1

    .line 87
    iget-object v6, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 88
    .line 89
    int-to-float v1, v1

    .line 90
    invoke-virtual {v6, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getTextColor()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    const/4 v6, -0x1

    .line 102
    if-nez v1, :cond_3

    .line 103
    .line 104
    :try_start_0
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getTextColor()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    goto :goto_0

    .line 113
    :catch_0
    move-exception p1

    .line 114
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 115
    .line 116
    .line 117
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 118
    .line 119
    invoke-virtual {p1, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    .line 121
    .line 122
    new-instance p1, Landroid/graphics/Rect;

    .line 123
    .line 124
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-static {v0}, Ll/wnk0;->d(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    mul-int/lit8 v2, v2, 0x2

    .line 132
    .line 133
    if-le v1, v2, :cond_4

    .line 134
    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {v0, v2}, Ll/wnk0;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v0, "\u2026"

    .line 148
    .line 149
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    :cond_4
    iget-object v1, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    const/4 v6, 0x0

    .line 163
    invoke-virtual {v1, v0, v6, v2, p1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    add-int/lit8 v1, v1, 0x28

    .line 175
    .line 176
    if-ge v4, v1, :cond_5

    .line 177
    .line 178
    move v4, v1

    .line 179
    :cond_5
    add-int/lit8 p1, p1, 0x18

    .line 180
    .line 181
    if-ge v3, p1, :cond_6

    .line 182
    .line 183
    move v3, p1

    .line 184
    :cond_6
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 185
    .line 186
    invoke-static {v4, v3, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iget-object v1, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 191
    .line 192
    if-nez v1, :cond_7

    .line 193
    .line 194
    new-instance v1, Landroid/graphics/Canvas;

    .line 195
    .line 196
    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 197
    .line 198
    .line 199
    iput-object v1, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_7
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 203
    .line 204
    .line 205
    iget-object v1, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 206
    .line 207
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 208
    .line 209
    invoke-virtual {v1, v6, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 210
    .line 211
    .line 212
    :goto_1
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-ne v1, v4, :cond_8

    .line 217
    .line 218
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-eq v1, v3, :cond_9

    .line 223
    .line 224
    :cond_8
    invoke-static {v5, v4, v3, v7}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 225
    .line 226
    .line 227
    move-result-object v5

    .line 228
    :cond_9
    iget-object v1, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 229
    .line 230
    iget-object v2, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 231
    .line 232
    const/4 v6, 0x0

    .line 233
    invoke-virtual {v1, v5, v6, v6, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 234
    .line 235
    .line 236
    iget-object v1, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 237
    .line 238
    invoke-virtual {v1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    int-to-float v2, v3

    .line 243
    const/high16 v3, 0x3f000000    # 0.5f

    .line 244
    .line 245
    mul-float/2addr v2, v3

    .line 246
    iget v5, v1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 247
    .line 248
    div-float/2addr v5, v8

    .line 249
    sub-float/2addr v2, v5

    .line 250
    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 251
    .line 252
    div-float/2addr v1, v8

    .line 253
    sub-float/2addr v2, v1

    .line 254
    float-to-int v1, v2

    .line 255
    iget-object v2, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 256
    .line 257
    int-to-float v4, v4

    .line 258
    mul-float/2addr v4, v3

    .line 259
    int-to-float v1, v1

    .line 260
    iget-object p0, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 261
    .line 262
    invoke-virtual {v2, v0, v4, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 263
    .line 264
    .line 265
    return-object p1
.end method

.method public b(Lcom/immomo/velib/anim/model/Element;III)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/gre;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/gre;->d:Lcom/immomo/velib/anim/model/Element;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getText()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getBackgroundPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getFontSize()I

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getMaxLen()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getHeight()F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    int-to-float p3, p3

    .line 27
    mul-float/2addr v3, p3

    .line 28
    float-to-int p3, v3

    .line 29
    add-int/lit8 p3, p3, 0xc

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getWidth()F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    int-to-float p2, p2

    .line 36
    mul-float/2addr v3, p2

    .line 37
    float-to-int v3, v3

    .line 38
    add-int/lit8 v3, v3, 0x10

    .line 39
    .line 40
    invoke-static {v1}, Ll/l33;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 47
    .line 48
    invoke-static {v3, p3, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    :cond_0
    if-nez v2, :cond_1

    .line 53
    .line 54
    const/4 v2, 0x5

    .line 55
    :cond_1
    iget-object v4, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 56
    .line 57
    const/4 v5, 0x1

    .line 58
    if-nez v4, :cond_2

    .line 59
    .line 60
    new-instance v4, Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v4, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v4, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 71
    .line 72
    sget-object v6, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 73
    .line 74
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    const/high16 v4, 0x3f800000    # 1.0f

    .line 78
    .line 79
    mul-float/2addr p2, v4

    .line 80
    int-to-float p4, p4

    .line 81
    div-float/2addr p2, p4

    .line 82
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getFontPixel()I

    .line 83
    .line 84
    .line 85
    move-result p4

    .line 86
    int-to-float p4, p4

    .line 87
    mul-float/2addr p4, p2

    .line 88
    float-to-int p2, p4

    .line 89
    iget-object p4, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 90
    .line 91
    int-to-float p2, p2

    .line 92
    invoke-virtual {p4, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getTextColor()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    const/4 p4, -0x1

    .line 104
    if-nez p2, :cond_3

    .line 105
    .line 106
    :try_start_0
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getTextColor()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result p4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    goto :goto_0

    .line 115
    :catch_0
    move-exception p1

    .line 116
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 117
    .line 118
    .line 119
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 120
    .line 121
    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    .line 123
    .line 124
    new-instance p1, Landroid/graphics/Rect;

    .line 125
    .line 126
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-static {v0}, Ll/wnk0;->d(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    int-to-float p4, v3

    .line 134
    iget-object v4, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 135
    .line 136
    invoke-virtual {v4}, Landroid/graphics/Paint;->getTextSize()F

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    div-float/2addr p4, v4

    .line 141
    float-to-int p4, p4

    .line 142
    const-string v4, "\u2026"

    .line 143
    .line 144
    if-gt v2, p4, :cond_4

    .line 145
    .line 146
    mul-int/lit8 v2, v2, 0x2

    .line 147
    .line 148
    if-le p2, v2, :cond_5

    .line 149
    .line 150
    new-instance p2, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-static {v0, v2}, Ll/wnk0;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p4

    .line 159
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    goto :goto_1

    .line 170
    :cond_4
    mul-int/lit8 v2, p4, 0x2

    .line 171
    .line 172
    if-le p2, v2, :cond_5

    .line 173
    .line 174
    new-instance p2, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .line 178
    .line 179
    sub-int/2addr p4, v5

    .line 180
    mul-int/lit8 p4, p4, 0x2

    .line 181
    .line 182
    invoke-static {v0, p4}, Ll/wnk0;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p4

    .line 186
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    :cond_5
    :goto_1
    iget-object p2, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 199
    .line 200
    .line 201
    move-result p4

    .line 202
    const/4 v2, 0x0

    .line 203
    invoke-virtual {p2, v0, v2, p4, p1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 207
    .line 208
    .line 209
    move-result p2

    .line 210
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-ge v3, p2, :cond_6

    .line 215
    .line 216
    move v3, p2

    .line 217
    :cond_6
    if-ge p3, p1, :cond_7

    .line 218
    .line 219
    move p3, p1

    .line 220
    :cond_7
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 221
    .line 222
    invoke-static {v3, p3, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    iget-object p2, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 227
    .line 228
    if-nez p2, :cond_8

    .line 229
    .line 230
    new-instance p2, Landroid/graphics/Canvas;

    .line 231
    .line 232
    invoke-direct {p2, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 233
    .line 234
    .line 235
    iput-object p2, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 236
    .line 237
    goto :goto_2

    .line 238
    :cond_8
    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 239
    .line 240
    .line 241
    iget-object p2, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 242
    .line 243
    sget-object p4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 244
    .line 245
    invoke-virtual {p2, v2, p4}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 246
    .line 247
    .line 248
    :goto_2
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 249
    .line 250
    .line 251
    move-result p2

    .line 252
    if-ne p2, v3, :cond_9

    .line 253
    .line 254
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 255
    .line 256
    .line 257
    move-result p2

    .line 258
    if-eq p2, p3, :cond_a

    .line 259
    .line 260
    :cond_9
    invoke-static {v1, v3, p3, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    :cond_a
    iget-object p2, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 265
    .line 266
    iget-object p4, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 267
    .line 268
    const/4 v2, 0x0

    .line 269
    invoke-virtual {p2, v1, v2, v2, p4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 270
    .line 271
    .line 272
    iget-object p2, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 273
    .line 274
    invoke-virtual {p2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 275
    .line 276
    .line 277
    move-result-object p2

    .line 278
    int-to-float p3, p3

    .line 279
    const/high16 p4, 0x3f000000    # 0.5f

    .line 280
    .line 281
    mul-float/2addr p3, p4

    .line 282
    iget v1, p2, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 283
    .line 284
    const/high16 v2, 0x40000000    # 2.0f

    .line 285
    .line 286
    div-float/2addr v1, v2

    .line 287
    sub-float/2addr p3, v1

    .line 288
    iget p2, p2, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 289
    .line 290
    div-float/2addr p2, v2

    .line 291
    sub-float/2addr p3, p2

    .line 292
    float-to-int p2, p3

    .line 293
    iget-object p3, p0, Ll/gre;->a:Landroid/graphics/Canvas;

    .line 294
    .line 295
    int-to-float v1, v3

    .line 296
    mul-float/2addr v1, p4

    .line 297
    int-to-float p2, p2

    .line 298
    iget-object p0, p0, Ll/gre;->b:Landroid/graphics/Paint;

    .line 299
    .line 300
    invoke-virtual {p3, v0, v1, p2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 301
    .line 302
    .line 303
    return-object p1
.end method
