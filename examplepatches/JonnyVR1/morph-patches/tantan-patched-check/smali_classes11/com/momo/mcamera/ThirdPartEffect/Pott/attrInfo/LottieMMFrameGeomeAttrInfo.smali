.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;
.source "SourceFile"


# instance fields
.field additionalOffset:I

.field alpha:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
            ">;"
        }
    .end annotation
.end field

.field private alphaIndex:I

.field alphaStep:F

.field curLayer:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;

.field curTime:J

.field firstTime:J

.field indexArray:[I

.field loopLastFrame:Z

.field lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

.field private posIndex:I

.field position:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
            ">;"
        }
    .end annotation
.end field

.field private rotateIndex:I

.field rotation:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
            ">;"
        }
    .end annotation
.end field

.field scale:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->curTime:J

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->firstTime:J

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alphaStep:F

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->additionalOffset:I

    .line 17
    .line 18
    iput-boolean p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->loopLastFrame:Z

    .line 19
    .line 20
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->posIndex:I

    .line 21
    .line 22
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->rotateIndex:I

    .line 23
    .line 24
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alphaIndex:I

    .line 25
    .line 26
    const/4 p1, 0x4

    .line 27
    new-array p1, p1, [I

    .line 28
    .line 29
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 30
    .line 31
    return-void
.end method

.method private getValue(Ljava/util/List;JI)Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;",
            ">;JI)",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_2

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 11
    .line 12
    aget v1, v1, p4

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 21
    .line 22
    aget p4, v1, p4

    .line 23
    .line 24
    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 29
    .line 30
    iget v1, v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->frameNo:I

    .line 31
    .line 32
    mul-int/lit8 v1, v1, 0x28

    .line 33
    .line 34
    int-to-long v1, v1

    .line 35
    cmp-long p2, p2, v1

    .line 36
    .line 37
    if-gez p2, :cond_1

    .line 38
    .line 39
    if-nez p4, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->position:Ljava/util/List;

    .line 42
    .line 43
    if-ne p1, p0, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-object v0

    .line 47
    :cond_1
    :goto_0
    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    return-object v0
.end method


# virtual methods
.method public getFrameTexture()[I
    .locals 10

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->curTime:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->firstTime:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->position:Ljava/util/List;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct {p0, v2, v0, v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->getValue(Ljava/util/List;JI)Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/high16 v4, 0x3f800000    # 1.0f

    .line 14
    .line 15
    const/4 v5, 0x1

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object v6, v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    check-cast v6, Ljava/lang/Float;

    .line 25
    .line 26
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    iget v7, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->additionalOffset:I

    .line 31
    .line 32
    int-to-float v7, v7

    .line 33
    add-float/2addr v6, v7

    .line 34
    iget v7, p0, Ll/lim;->baseRenderWidth:I

    .line 35
    .line 36
    int-to-float v7, v7

    .line 37
    div-float/2addr v6, v7

    .line 38
    const/high16 v7, 0x40000000    # 2.0f

    .line 39
    .line 40
    mul-float/2addr v6, v7

    .line 41
    sub-float/2addr v6, v4

    .line 42
    iget-object v2, v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/lang/Float;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    mul-float/2addr v2, v7

    .line 55
    iget v7, p0, Ll/lim;->baseRenderHeight:I

    .line 56
    .line 57
    int-to-float v7, v7

    .line 58
    div-float/2addr v2, v7

    .line 59
    sub-float/2addr v2, v4

    .line 60
    neg-float v2, v2

    .line 61
    invoke-virtual {p0, v6, v2}, Ll/lim;->setTraslate(FF)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 65
    .line 66
    aget v6, v2, v3

    .line 67
    .line 68
    add-int/2addr v6, v5

    .line 69
    aput v6, v2, v3

    .line 70
    .line 71
    :cond_0
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->rotation:Ljava/util/List;

    .line 72
    .line 73
    invoke-direct {p0, v2, v0, v1, v5}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->getValue(Ljava/util/List;JI)Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const/4 v6, 0x0

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    iget-object v2, v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Ljava/lang/Float;

    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    cmpg-float v7, v2, v6

    .line 93
    .line 94
    if-gez v7, :cond_1

    .line 95
    .line 96
    const/high16 v7, 0x43b40000    # 360.0f

    .line 97
    .line 98
    add-float/2addr v2, v7

    .line 99
    :cond_1
    invoke-virtual {p0, v6, v6, v2}, Ll/lim;->setRotate(FFF)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 103
    .line 104
    aget v7, v2, v5

    .line 105
    .line 106
    add-int/2addr v7, v5

    .line 107
    aput v7, v2, v5

    .line 108
    .line 109
    :cond_2
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->scale:Ljava/util/List;

    .line 110
    .line 111
    const/4 v7, 0x2

    .line 112
    invoke-direct {p0, v2, v0, v1, v7}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->getValue(Ljava/util/List;JI)Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    const/high16 v8, 0x42c80000    # 100.0f

    .line 117
    .line 118
    if-eqz v2, :cond_3

    .line 119
    .line 120
    iget-object v9, v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v9, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v9

    .line 126
    check-cast v9, Ljava/lang/Float;

    .line 127
    .line 128
    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    .line 129
    .line 130
    .line 131
    move-result v9

    .line 132
    div-float/2addr v9, v8

    .line 133
    iget-object v2, v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 134
    .line 135
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Ljava/lang/Float;

    .line 140
    .line 141
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    div-float/2addr v2, v8

    .line 146
    invoke-virtual {p0, v9, v2}, Ll/lim;->setScale(FF)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 150
    .line 151
    aget v9, v2, v7

    .line 152
    .line 153
    add-int/2addr v9, v5

    .line 154
    aput v9, v2, v7

    .line 155
    .line 156
    :cond_3
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alpha:Ljava/util/List;

    .line 157
    .line 158
    const/4 v7, 0x3

    .line 159
    invoke-direct {p0, v2, v0, v1, v7}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->getValue(Ljava/util/List;JI)Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    if-eqz v0, :cond_5

    .line 164
    .line 165
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 166
    .line 167
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Ljava/lang/Float;

    .line 172
    .line 173
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    div-float/2addr v0, v8

    .line 178
    iput v0, p0, Ll/lim;->alphaValue:F

    .line 179
    .line 180
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 181
    .line 182
    aget v0, v0, v7

    .line 183
    .line 184
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alpha:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    sub-int/2addr v1, v5

    .line 191
    if-ge v0, v1, :cond_4

    .line 192
    .line 193
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alpha:Ljava/util/List;

    .line 194
    .line 195
    add-int/lit8 v2, v0, 0x1

    .line 196
    .line 197
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 202
    .line 203
    iget-object v1, v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->valueArray:Ljava/util/List;

    .line 204
    .line 205
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    check-cast v1, Ljava/lang/Float;

    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    iget v3, p0, Ll/lim;->alphaValue:F

    .line 216
    .line 217
    sub-float/2addr v1, v3

    .line 218
    div-float/2addr v1, v8

    .line 219
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alpha:Ljava/util/List;

    .line 220
    .line 221
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 226
    .line 227
    iget v2, v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->frameNo:I

    .line 228
    .line 229
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alpha:Ljava/util/List;

    .line 230
    .line 231
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;

    .line 236
    .line 237
    iget v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyValue;->frameNo:I

    .line 238
    .line 239
    sub-int/2addr v2, v0

    .line 240
    int-to-float v0, v2

    .line 241
    div-float/2addr v1, v0

    .line 242
    iput v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alphaStep:F

    .line 243
    .line 244
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 245
    .line 246
    aget v1, v0, v7

    .line 247
    .line 248
    add-int/2addr v1, v5

    .line 249
    aput v1, v0, v7

    .line 250
    .line 251
    goto :goto_0

    .line 252
    :cond_5
    iget v0, p0, Ll/lim;->alphaValue:F

    .line 253
    .line 254
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alphaStep:F

    .line 255
    .line 256
    add-float/2addr v0, v1

    .line 257
    iput v0, p0, Ll/lim;->alphaValue:F

    .line 258
    .line 259
    cmpl-float v0, v0, v4

    .line 260
    .line 261
    if-lez v0, :cond_6

    .line 262
    .line 263
    iput v4, p0, Ll/lim;->alphaValue:F

    .line 264
    .line 265
    :cond_6
    :goto_0
    invoke-virtual {p0}, Ll/lim;->getAlphaValue()F

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    cmpg-float v0, v0, v6

    .line 270
    .line 271
    if-gtz v0, :cond_7

    .line 272
    .line 273
    iget-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->loopLastFrame:Z

    .line 274
    .line 275
    if-nez v0, :cond_7

    .line 276
    .line 277
    const/4 p0, 0x0

    .line 278
    return-object p0

    .line 279
    :cond_7
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameTexture()[I

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    return-object p0
.end method

.method public recycleResourceInGlThread()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->position:Ljava/util/List;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->rotation:Ljava/util/List;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->scale:Ljava/util/List;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alpha:Ljava/util/List;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->curLayer:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;

    .line 16
    .line 17
    return-void
.end method

.method public resetStatus()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->resetStatus()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->curTime:J

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->firstTime:J

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alphaStep:F

    .line 14
    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    iput v0, p0, Ll/lim;->alphaValue:F

    .line 18
    .line 19
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->indexArray:[I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    aput v0, p0, v0

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    aput v0, p0, v1

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    aput v0, p0, v1

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    aput v0, p0, v1

    .line 32
    .line 33
    return-void
.end method

.method public setAdditionalOffset(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->additionalOffset:I

    .line 2
    .line 3
    return-void
.end method

.method public setLoopLastFrame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->loopLastFrame:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->curLayer:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getKeyStatus()Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyStatus;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->curLayer:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getKeyStatus()Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyStatus;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyStatus;->getPosition()Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;->getKeyValues()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->position:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyStatus;->getRotation()Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;->getKeyValues()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->rotation:Ljava/util/List;

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyStatus;->getAlpha()Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;->getKeyValues()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->alpha:Ljava/util/List;

    .line 52
    .line 53
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyStatus;->getScale()Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/KeyFrameInfo;->getKeyValues()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->scale:Ljava/util/List;

    .line 64
    .line 65
    :cond_3
    return-void
.end method

.method public setLottieParse(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setTimeStamp(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->firstTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->firstTime:J

    .line 10
    .line 11
    :cond_0
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->curTime:J

    .line 12
    .line 13
    return-void
.end method
