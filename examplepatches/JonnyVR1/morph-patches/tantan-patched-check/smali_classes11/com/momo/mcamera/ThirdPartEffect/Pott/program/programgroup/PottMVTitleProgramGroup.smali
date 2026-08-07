.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;
.source "SourceFile"


# instance fields
.field private ChinaCityCnt:I

.field private ChinaProvinceCnt:I

.field animation:[[F

.field private countryBuffer:Ll/lej;

.field private countryCnt:I

.field countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

.field private mapType:Ljava/lang/String;

.field nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

.field numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

.field scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

.field stickerMaskmodel:Lcom/momo/mcamera/mask/MaskModel;

.field tmpTextureHeight:I

.field tmpTextureWidth:I

.field private userHeadIconBitmap:Landroid/graphics/Bitmap;

.field private userHeadIcondPath:Ljava/lang/String;

.field private userIdBitmap:Landroid/graphics/Bitmap;

.field private userIdPath:Ljava/lang/String;

.field private userNickNameBitmap:Landroid/graphics/Bitmap;

.field private userNickNamePath:Ljava/lang/String;

.field private worldCityCnt:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    const-string v0, "/title"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    new-array v1, v0, [F

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    new-array v2, v0, [F

    .line 13
    .line 14
    fill-array-data v2, :array_1

    .line 15
    .line 16
    .line 17
    new-array v3, v0, [F

    .line 18
    .line 19
    fill-array-data v3, :array_2

    .line 20
    .line 21
    .line 22
    new-array v4, v0, [F

    .line 23
    .line 24
    fill-array-data v4, :array_3

    .line 25
    .line 26
    .line 27
    new-array v0, v0, [F

    .line 28
    .line 29
    fill-array-data v0, :array_4

    .line 30
    .line 31
    .line 32
    filled-new-array {v1, v2, v3, v4, v0}, [[F

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->animation:[[F

    .line 37
    .line 38
    const-string v0, "world"

    .line 39
    .line 40
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->mapType:Ljava/lang/String;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureWidth:I

    .line 44
    .line 45
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureHeight:I

    .line 46
    .line 47
    return-void

    .line 48
    nop

    .line 49
    :array_0
    .array-data 4
        0x41400000    # 12.0f
        0x41a00000    # 20.0f
        0x41f00000    # 30.0f
    .end array-data

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_1
    .array-data 4
        0x41600000    # 14.0f
        0x41c80000    # 25.0f
        0x420c0000    # 35.0f
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    :array_2
    .array-data 4
        0x41a00000    # 20.0f
        0x41f80000    # 31.0f
        0x422c0000    # 43.0f
    .end array-data

    :array_3
    .array-data 4
        0x41b80000    # 23.0f
        0x420c0000    # 35.0f
        0x42340000    # 45.0f
    .end array-data

    :array_4
    .array-data 4
        0x41b80000    # 23.0f
        0x420c0000    # 35.0f
        0x42340000    # 45.0f
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 49
    invoke-direct {p0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x3

    .line 50
    new-array v0, p1, [F

    fill-array-data v0, :array_0

    new-array v1, p1, [F

    fill-array-data v1, :array_1

    new-array v2, p1, [F

    fill-array-data v2, :array_2

    new-array v3, p1, [F

    fill-array-data v3, :array_3

    new-array p1, p1, [F

    fill-array-data p1, :array_4

    filled-new-array {v0, v1, v2, v3, p1}, [[F

    move-result-object p1

    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->animation:[[F

    .line 51
    const-string p1, "world"

    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->mapType:Ljava/lang/String;

    const/4 p1, 0x0

    .line 52
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureWidth:I

    .line 53
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureHeight:I

    return-void

    nop

    :array_0
    .array-data 4
        0x41400000    # 12.0f
        0x41a00000    # 20.0f
        0x41f00000    # 30.0f
    .end array-data

    :array_1
    .array-data 4
        0x41600000    # 14.0f
        0x41c80000    # 25.0f
        0x420c0000    # 35.0f
    .end array-data

    :array_2
    .array-data 4
        0x41a00000    # 20.0f
        0x41f80000    # 31.0f
        0x422c0000    # 43.0f
    .end array-data

    :array_3
    .array-data 4
        0x41b80000    # 23.0f
        0x420c0000    # 35.0f
        0x42340000    # 45.0f
    .end array-data

    :array_4
    .array-data 4
        0x41b80000    # 23.0f
        0x420c0000    # 35.0f
        0x42340000    # 45.0f
    .end array-data
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/d33;->destroy()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 13
    .line 14
    :cond_0
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userNickNamePath:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIcondPath:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdPath:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public drawGroup()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 4
    .line 5
    if-eqz v1, :cond_6

    .line 6
    .line 7
    iget-object v2, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    const/4 v2, 0x0

    .line 14
    aget-object v1, v1, v2

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 21
    .line 22
    aget-object v3, v3, v2

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameHeight()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    iget v4, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureWidth:I

    .line 29
    .line 30
    iget v5, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureHeight:I

    .line 31
    .line 32
    iget-object v6, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryBuffer:Ll/lej;

    .line 33
    .line 34
    const v7, 0x8ca6

    .line 35
    .line 36
    .line 37
    const v8, 0x8d40

    .line 38
    .line 39
    .line 40
    const/4 v9, 0x1

    .line 41
    if-nez v6, :cond_1

    .line 42
    .line 43
    new-instance v6, Ll/lej;

    .line 44
    .line 45
    invoke-direct {v6, v4, v5}, Ll/lej;-><init>(II)V

    .line 46
    .line 47
    .line 48
    iput-object v6, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryBuffer:Ll/lej;

    .line 49
    .line 50
    new-array v6, v9, [I

    .line 51
    .line 52
    invoke-static {v7, v6, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 53
    .line 54
    .line 55
    iget-object v10, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryBuffer:Ll/lej;

    .line 56
    .line 57
    invoke-virtual {v10, v4, v5}, Ll/lej;->b(II)V

    .line 58
    .line 59
    .line 60
    iget-object v10, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 61
    .line 62
    iget-object v11, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryBuffer:Ll/lej;

    .line 63
    .line 64
    invoke-virtual {v11}, Ll/lej;->i()[I

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    aget v11, v11, v2

    .line 69
    .line 70
    filled-new-array {v11}, [I

    .line 71
    .line 72
    .line 73
    move-result-object v11

    .line 74
    invoke-virtual {v10, v11}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->updateInputeTexture([I)V

    .line 75
    .line 76
    .line 77
    aget v6, v6, v2

    .line 78
    .line 79
    invoke-static {v8, v6}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object v6, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 83
    .line 84
    iget-wide v10, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 85
    .line 86
    invoke-virtual {v6, v10, v11}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 87
    .line 88
    .line 89
    iget-object v6, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 90
    .line 91
    invoke-virtual {v6, v4, v5}, Ll/lim;->updateBitmapInfo(II)V

    .line 92
    .line 93
    .line 94
    iget-object v6, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 95
    .line 96
    invoke-virtual {v6}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->getFrameTexture()[I

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    if-eqz v6, :cond_5

    .line 101
    .line 102
    iget-object v6, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 103
    .line 104
    invoke-virtual {v6}, Ll/lim;->getAlphaValue()F

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    const/4 v10, 0x0

    .line 109
    cmpl-float v6, v6, v10

    .line 110
    .line 111
    if-lez v6, :cond_5

    .line 112
    .line 113
    new-array v6, v9, [I

    .line 114
    .line 115
    const/4 v11, 0x4

    .line 116
    new-array v12, v11, [I

    .line 117
    .line 118
    invoke-static {v7, v6, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 119
    .line 120
    .line 121
    const/16 v7, 0xba2

    .line 122
    .line 123
    invoke-static {v7, v12, v2}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 124
    .line 125
    .line 126
    iget-object v7, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 127
    .line 128
    invoke-virtual {v7, v4, v5}, Ll/lim;->setBaseRenderSize(II)V

    .line 129
    .line 130
    .line 131
    iget-object v7, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 132
    .line 133
    array-length v13, v7

    .line 134
    move v14, v2

    .line 135
    :goto_0
    const/high16 v15, 0x43340000    # 180.0f

    .line 136
    .line 137
    if-ge v14, v13, :cond_3

    .line 138
    .line 139
    move/from16 v16, v9

    .line 140
    .line 141
    aget-object v9, v7, v14

    .line 142
    .line 143
    if-eqz v9, :cond_2

    .line 144
    .line 145
    invoke-virtual {v9, v4, v5}, Ll/lim;->setBaseRenderSize(II)V

    .line 146
    .line 147
    .line 148
    move/from16 v17, v11

    .line 149
    .line 150
    move-object/from16 v18, v12

    .line 151
    .line 152
    iget-wide v11, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 153
    .line 154
    invoke-virtual {v9, v11, v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->setTimeStamp(J)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v9, v15, v10, v10}, Ll/lim;->setRotate(FFF)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    move/from16 v17, v11

    .line 162
    .line 163
    move-object/from16 v18, v12

    .line 164
    .line 165
    :goto_1
    add-int/lit8 v14, v14, 0x1

    .line 166
    .line 167
    move/from16 v9, v16

    .line 168
    .line 169
    move/from16 v11, v17

    .line 170
    .line 171
    move-object/from16 v12, v18

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_3
    move/from16 v16, v9

    .line 175
    .line 176
    move/from16 v17, v11

    .line 177
    .line 178
    move-object/from16 v18, v12

    .line 179
    .line 180
    iget-object v7, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryBuffer:Ll/lej;

    .line 181
    .line 182
    invoke-virtual {v7}, Ll/lej;->h()[I

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    aget v7, v7, v2

    .line 187
    .line 188
    invoke-static {v8, v7}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 189
    .line 190
    .line 191
    invoke-static {v2, v2, v4, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 192
    .line 193
    .line 194
    invoke-static {v10, v10, v10, v10}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 195
    .line 196
    .line 197
    const/16 v7, 0x4100

    .line 198
    .line 199
    invoke-static {v7}, Landroid/opengl/GLES20;->glClear(I)V

    .line 200
    .line 201
    .line 202
    iget-object v7, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 203
    .line 204
    invoke-virtual {v7, v15, v10, v10}, Ll/lim;->setRotate(FFF)V

    .line 205
    .line 206
    .line 207
    iget-object v7, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 208
    .line 209
    invoke-virtual {v7}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameWidth()I

    .line 210
    .line 211
    .line 212
    move-result v7

    .line 213
    sub-int v7, v4, v7

    .line 214
    .line 215
    int-to-float v7, v7

    .line 216
    const/high16 v9, 0x3f800000    # 1.0f

    .line 217
    .line 218
    mul-float/2addr v7, v9

    .line 219
    int-to-float v4, v4

    .line 220
    div-float/2addr v7, v4

    .line 221
    iget-object v10, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 222
    .line 223
    invoke-virtual {v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameHeight()I

    .line 224
    .line 225
    .line 226
    move-result v10

    .line 227
    sub-int v10, v5, v10

    .line 228
    .line 229
    int-to-float v10, v10

    .line 230
    mul-float/2addr v10, v9

    .line 231
    int-to-float v5, v5

    .line 232
    div-float/2addr v10, v5

    .line 233
    iget-object v11, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 234
    .line 235
    neg-float v10, v10

    .line 236
    invoke-virtual {v11, v7, v10}, Ll/lim;->setTraslate(FF)V

    .line 237
    .line 238
    .line 239
    iget-object v7, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 240
    .line 241
    iget-object v10, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 242
    .line 243
    invoke-static {v7, v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 244
    .line 245
    .line 246
    int-to-float v1, v1

    .line 247
    const/high16 v7, 0x40400000    # 3.0f

    .line 248
    .line 249
    mul-float v10, v1, v7

    .line 250
    .line 251
    sub-float v10, v4, v10

    .line 252
    .line 253
    const/high16 v11, -0x3e900000    # -15.0f

    .line 254
    .line 255
    sub-float/2addr v10, v11

    .line 256
    mul-float/2addr v10, v9

    .line 257
    div-float/2addr v10, v4

    .line 258
    iget-object v12, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 259
    .line 260
    aget-object v12, v12, v2

    .line 261
    .line 262
    invoke-virtual {v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameHeight()I

    .line 263
    .line 264
    .line 265
    move-result v12

    .line 266
    int-to-float v12, v12

    .line 267
    mul-float/2addr v12, v9

    .line 268
    sub-float v12, v5, v12

    .line 269
    .line 270
    div-float/2addr v12, v5

    .line 271
    iget-object v13, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 272
    .line 273
    aget-object v13, v13, v2

    .line 274
    .line 275
    neg-float v10, v10

    .line 276
    neg-float v12, v12

    .line 277
    invoke-virtual {v13, v10, v12}, Ll/lim;->setTraslate(FF)V

    .line 278
    .line 279
    .line 280
    iget-object v13, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 281
    .line 282
    iget-object v14, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 283
    .line 284
    aget-object v14, v14, v2

    .line 285
    .line 286
    invoke-virtual {v14}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 287
    .line 288
    .line 289
    move-result v14

    .line 290
    invoke-virtual {v13, v14}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 291
    .line 292
    .line 293
    iget-object v13, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 294
    .line 295
    iget-object v14, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 296
    .line 297
    aget-object v14, v14, v2

    .line 298
    .line 299
    invoke-static {v13, v14}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 300
    .line 301
    .line 302
    const/high16 v13, 0x40a00000    # 5.0f

    .line 303
    .line 304
    mul-float/2addr v13, v1

    .line 305
    sub-float v13, v4, v13

    .line 306
    .line 307
    sub-float/2addr v13, v11

    .line 308
    div-float/2addr v13, v4

    .line 309
    iget-object v14, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 310
    .line 311
    aget-object v14, v14, v16

    .line 312
    .line 313
    neg-float v13, v13

    .line 314
    invoke-virtual {v14, v13, v12}, Ll/lim;->setTraslate(FF)V

    .line 315
    .line 316
    .line 317
    iget-object v12, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 318
    .line 319
    iget-object v14, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 320
    .line 321
    aget-object v14, v14, v16

    .line 322
    .line 323
    invoke-virtual {v14}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 324
    .line 325
    .line 326
    move-result v14

    .line 327
    invoke-virtual {v12, v14}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 328
    .line 329
    .line 330
    iget-object v12, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 331
    .line 332
    iget-object v14, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 333
    .line 334
    aget-object v14, v14, v16

    .line 335
    .line 336
    invoke-static {v12, v14}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 337
    .line 338
    .line 339
    int-to-float v3, v3

    .line 340
    mul-float v12, v3, v7

    .line 341
    .line 342
    sub-float v12, v5, v12

    .line 343
    .line 344
    div-float/2addr v3, v7

    .line 345
    sub-float/2addr v12, v3

    .line 346
    div-float/2addr v12, v5

    .line 347
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 348
    .line 349
    const/4 v5, 0x2

    .line 350
    aget-object v3, v3, v5

    .line 351
    .line 352
    neg-float v7, v12

    .line 353
    invoke-virtual {v3, v13, v7}, Ll/lim;->setTraslate(FF)V

    .line 354
    .line 355
    .line 356
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 357
    .line 358
    iget-object v12, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 359
    .line 360
    aget-object v12, v12, v5

    .line 361
    .line 362
    invoke-virtual {v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 363
    .line 364
    .line 365
    move-result v12

    .line 366
    invoke-virtual {v3, v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 367
    .line 368
    .line 369
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 370
    .line 371
    iget-object v12, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 372
    .line 373
    aget-object v12, v12, v5

    .line 374
    .line 375
    invoke-static {v3, v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 376
    .line 377
    .line 378
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 379
    .line 380
    const/4 v12, 0x3

    .line 381
    aget-object v3, v3, v12

    .line 382
    .line 383
    invoke-virtual {v3, v10, v7}, Ll/lim;->setTraslate(FF)V

    .line 384
    .line 385
    .line 386
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 387
    .line 388
    iget-object v10, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 389
    .line 390
    aget-object v10, v10, v12

    .line 391
    .line 392
    invoke-virtual {v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 393
    .line 394
    .line 395
    move-result v10

    .line 396
    invoke-virtual {v3, v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 397
    .line 398
    .line 399
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 400
    .line 401
    iget-object v10, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 402
    .line 403
    aget-object v10, v10, v12

    .line 404
    .line 405
    invoke-static {v3, v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 406
    .line 407
    .line 408
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 409
    .line 410
    aget-object v3, v3, v17

    .line 411
    .line 412
    if-eqz v3, :cond_4

    .line 413
    .line 414
    mul-float/2addr v1, v9

    .line 415
    sub-float v1, v4, v1

    .line 416
    .line 417
    sub-float/2addr v1, v11

    .line 418
    mul-float/2addr v1, v9

    .line 419
    div-float/2addr v1, v4

    .line 420
    neg-float v1, v1

    .line 421
    invoke-virtual {v3, v1, v7}, Ll/lim;->setTraslate(FF)V

    .line 422
    .line 423
    .line 424
    iget-object v1, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 425
    .line 426
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 427
    .line 428
    aget-object v3, v3, v17

    .line 429
    .line 430
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 431
    .line 432
    .line 433
    move-result v3

    .line 434
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 435
    .line 436
    .line 437
    iget-object v1, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 438
    .line 439
    iget-object v3, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 440
    .line 441
    aget-object v3, v3, v17

    .line 442
    .line 443
    invoke-static {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 444
    .line 445
    .line 446
    :cond_4
    aget v1, v6, v2

    .line 447
    .line 448
    invoke-static {v8, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 449
    .line 450
    .line 451
    aget v1, v18, v2

    .line 452
    .line 453
    aget v2, v18, v16

    .line 454
    .line 455
    aget v3, v18, v5

    .line 456
    .line 457
    aget v4, v18, v12

    .line 458
    .line 459
    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 460
    .line 461
    .line 462
    :cond_5
    invoke-super {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->drawGroup()V

    .line 463
    .line 464
    .line 465
    return-void

    .line 466
    :cond_6
    :goto_2
    const-string v1, "FilterProcess"

    .line 467
    .line 468
    const-string v2, "Parse Config failed !!!"

    .line 469
    .line 470
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    .line 472
    .line 473
    invoke-super {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->drawGroup()V

    .line 474
    .line 475
    .line 476
    return-void
.end method

.method public initProgram()Z
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->initProgram()Z

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public onParseLayers(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;)Z
    .locals 8

    .line 1
    invoke-virtual {p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getLayerName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "head"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 20
    .line 21
    invoke-direct {p1, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {p1, p3, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->setBitmapWithTarget(Landroid/graphics/Bitmap;II)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 41
    .line 42
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIcondPath:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 51
    .line 52
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 53
    .line 54
    .line 55
    goto/16 :goto_6

    .line 56
    .line 57
    :cond_1
    const-string v0, "kv"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const-string v3, "/"

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->mapType:Ljava/lang/String;

    .line 68
    .line 69
    const-string v0, "world"

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p1, :cond_2

    .line 78
    .line 79
    new-instance p1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v0, "_world.png"

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    goto :goto_1

    .line 117
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v0, "_china.png"

    .line 146
    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    :goto_1
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 155
    .line 156
    invoke-direct {v0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 160
    .line 161
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 162
    .line 163
    invoke-direct {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;-><init>()V

    .line 164
    .line 165
    .line 166
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 167
    .line 168
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getWidth()I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureWidth:I

    .line 176
    .line 177
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getHeight()I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->tmpTextureHeight:I

    .line 182
    .line 183
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 184
    .line 185
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 186
    .line 187
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 188
    .line 189
    .line 190
    goto/16 :goto_6

    .line 191
    .line 192
    :cond_3
    const-string v0, "name"

    .line 193
    .line 194
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_5

    .line 199
    .line 200
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 201
    .line 202
    if-eqz p1, :cond_4

    .line 203
    .line 204
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 205
    .line 206
    invoke-direct {p1, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 210
    .line 211
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 216
    .line 217
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    invoke-virtual {p1, p3, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->setBitmapWithTarget(Landroid/graphics/Bitmap;II)V

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_4
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 226
    .line 227
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userNickNamePath:Ljava/lang/String;

    .line 228
    .line 229
    invoke-direct {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    :goto_2
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 233
    .line 234
    .line 235
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 236
    .line 237
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 238
    .line 239
    .line 240
    goto/16 :goto_6

    .line 241
    .line 242
    :cond_5
    const-string v0, "id"

    .line 243
    .line 244
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_7

    .line 249
    .line 250
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 251
    .line 252
    if-eqz p1, :cond_6

    .line 253
    .line 254
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 255
    .line 256
    invoke-direct {p1, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 260
    .line 261
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 266
    .line 267
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    invoke-virtual {p1, p3, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->setBitmapWithTarget(Landroid/graphics/Bitmap;II)V

    .line 272
    .line 273
    .line 274
    goto :goto_3

    .line 275
    :cond_6
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 276
    .line 277
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdPath:Ljava/lang/String;

    .line 278
    .line 279
    invoke-direct {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :goto_3
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 283
    .line 284
    .line 285
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 286
    .line 287
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 288
    .line 289
    .line 290
    goto/16 :goto_6

    .line 291
    .line 292
    :cond_7
    const-string p2, "numbers"

    .line 293
    .line 294
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result p2

    .line 298
    const/4 v0, 0x0

    .line 299
    if-eqz p2, :cond_b

    .line 300
    .line 301
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryCnt:I

    .line 302
    .line 303
    iget p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->worldCityCnt:I

    .line 304
    .line 305
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->mapType:Ljava/lang/String;

    .line 306
    .line 307
    const-string v5, "china"

    .line 308
    .line 309
    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    if-eqz v4, :cond_8

    .line 314
    .line 315
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->ChinaProvinceCnt:I

    .line 316
    .line 317
    iget p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->ChinaCityCnt:I

    .line 318
    .line 319
    :cond_8
    div-int/lit8 v4, p1, 0xa

    .line 320
    .line 321
    rem-int/lit8 p1, p1, 0xa

    .line 322
    .line 323
    rem-int/lit8 v5, p2, 0xa

    .line 324
    .line 325
    div-int/lit8 v6, p2, 0xa

    .line 326
    .line 327
    div-int/lit8 p2, p2, 0x64

    .line 328
    .line 329
    filled-new-array {v4, p1, v5, v6, p2}, [I

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    const/4 p2, 0x5

    .line 334
    new-array v4, p2, [Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 335
    .line 336
    iput-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 337
    .line 338
    new-instance v4, Lcom/momo/mcamera/mask/Sticker;

    .line 339
    .line 340
    invoke-direct {v4}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v5

    .line 347
    invoke-virtual {v5, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v5

    .line 351
    iget-object v6, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 352
    .line 353
    if-eqz v5, :cond_9

    .line 354
    .line 355
    new-instance v7, Ljava/lang/StringBuilder;

    .line 356
    .line 357
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    aget-object v3, v5, v0

    .line 367
    .line 368
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v3

    .line 375
    goto :goto_4

    .line 376
    :cond_9
    new-instance v5, Ljava/lang/StringBuilder;

    .line 377
    .line 378
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    :goto_4
    invoke-virtual {v4, v3}, Lcom/momo/mcamera/mask/Sticker;->setImageFolderPath(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v3

    .line 405
    invoke-virtual {v4, v3}, Lcom/momo/mcamera/mask/Sticker;->setImagePreName(Ljava/lang/String;)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFrameCount()I

    .line 409
    .line 410
    .line 411
    move-result v3

    .line 412
    invoke-virtual {v4, v3}, Lcom/momo/mcamera/mask/Sticker;->setFrameNumber(I)V

    .line 413
    .line 414
    .line 415
    const/16 v3, 0x19

    .line 416
    .line 417
    invoke-virtual {v4, v3}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 418
    .line 419
    .line 420
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getWidth()I

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    invoke-virtual {v4, v3}, Lcom/momo/mcamera/mask/Sticker;->setImageWidth(I)V

    .line 425
    .line 426
    .line 427
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getHeight()I

    .line 428
    .line 429
    .line 430
    move-result v3

    .line 431
    invoke-virtual {v4, v3}, Lcom/momo/mcamera/mask/Sticker;->setImageHeight(I)V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v4, v2}, Lcom/momo/mcamera/mask/Sticker;->setAlwaysShow(Z)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {v4, v2}, Lcom/momo/mcamera/mask/Sticker;->setUseImageCache(Z)V

    .line 438
    .line 439
    .line 440
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFrameCount()I

    .line 441
    .line 442
    .line 443
    move-result p3

    .line 444
    sub-int/2addr p3, v2

    .line 445
    invoke-virtual {v4, p3}, Lcom/momo/mcamera/mask/Sticker;->setLoopStart(I)V

    .line 446
    .line 447
    .line 448
    :goto_5
    if-ge v0, p2, :cond_a

    .line 449
    .line 450
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 451
    .line 452
    new-instance v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 453
    .line 454
    aget v5, p1, v0

    .line 455
    .line 456
    invoke-direct {v3, v4, v5}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;-><init>(Lcom/momo/mcamera/mask/Sticker;I)V

    .line 457
    .line 458
    .line 459
    aput-object v3, p3, v0

    .line 460
    .line 461
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 462
    .line 463
    aget-object p3, p3, v0

    .line 464
    .line 465
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->animation:[[F

    .line 466
    .line 467
    aget-object v3, v3, v0

    .line 468
    .line 469
    invoke-virtual {p3, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->updateAnimationRange([F)V

    .line 470
    .line 471
    .line 472
    add-int/lit8 v0, v0, 0x1

    .line 473
    .line 474
    goto :goto_5

    .line 475
    :cond_a
    const/4 p2, 0x4

    .line 476
    aget p1, p1, p2

    .line 477
    .line 478
    if-nez p1, :cond_d

    .line 479
    .line 480
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 481
    .line 482
    aput-object v1, p0, p2

    .line 483
    .line 484
    goto :goto_6

    .line 485
    :cond_b
    const-string p2, "titlecover"

    .line 486
    .line 487
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 488
    .line 489
    .line 490
    move-result p1

    .line 491
    if-eqz p1, :cond_d

    .line 492
    .line 493
    new-instance p1, Ljava/lang/StringBuilder;

    .line 494
    .line 495
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 496
    .line 497
    .line 498
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 499
    .line 500
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    .line 502
    .line 503
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object p2

    .line 510
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 511
    .line 512
    .line 513
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object p1

    .line 517
    invoke-static {}, Lcom/momo/mcamera/mask/MaskStore;->getInstance()Lcom/momo/mcamera/mask/MaskStore;

    .line 518
    .line 519
    .line 520
    move-result-object p2

    .line 521
    invoke-static {}, Ll/jv0;->a()Landroid/content/Context;

    .line 522
    .line 523
    .line 524
    move-result-object p3

    .line 525
    invoke-virtual {p2, p3, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/mask/MaskModel;

    .line 526
    .line 527
    .line 528
    move-result-object p1

    .line 529
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->stickerMaskmodel:Lcom/momo/mcamera/mask/MaskModel;

    .line 530
    .line 531
    if-eqz p1, :cond_c

    .line 532
    .line 533
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 534
    .line 535
    .line 536
    move-result-object p1

    .line 537
    if-eqz p1, :cond_c

    .line 538
    .line 539
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->stickerMaskmodel:Lcom/momo/mcamera/mask/MaskModel;

    .line 540
    .line 541
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 542
    .line 543
    .line 544
    move-result-object p1

    .line 545
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 546
    .line 547
    .line 548
    move-result p1

    .line 549
    if-lt p1, v2, :cond_c

    .line 550
    .line 551
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 552
    .line 553
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->stickerMaskmodel:Lcom/momo/mcamera/mask/MaskModel;

    .line 554
    .line 555
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 556
    .line 557
    .line 558
    move-result-object p2

    .line 559
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    move-result-object p2

    .line 563
    check-cast p2, Lcom/momo/mcamera/mask/Sticker;

    .line 564
    .line 565
    sget-object p3, Ll/l26;->a:Landroid/content/Context;

    .line 566
    .line 567
    invoke-direct {p1, p2, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 568
    .line 569
    .line 570
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 571
    .line 572
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 573
    .line 574
    .line 575
    goto :goto_6

    .line 576
    :cond_c
    const-string p1, "FilterProcess"

    .line 577
    .line 578
    const-string p2, "Parse config error !! the param.txt of cover sticker is wrong !!"

    .line 579
    .line 580
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->recycleAllData()V

    .line 584
    .line 585
    .line 586
    return v0

    .line 587
    :cond_d
    :goto_6
    return v2
.end method

.method public recycleAllData()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleAllData()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    array-length v2, v0

    .line 10
    const/4 v3, 0x0

    .line 11
    :goto_0
    if-ge v3, v2, :cond_1

    .line 12
    .line 13
    aget-object v4, v0, v3

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->recycleResourceInGlThread()V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 33
    .line 34
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 35
    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 42
    .line 43
    :cond_4
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->stickerMaskmodel:Lcom/momo/mcamera/mask/MaskModel;

    .line 44
    .line 45
    return-void
.end method

.method public declared-synchronized resetStatus()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->resetStatus()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_1

    .line 12
    .line 13
    aget-object v3, v0, v2

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->resetStatus()V

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_2

    .line 23
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->resetStatus()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->resetStatus()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    :cond_3
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw v0
.end method

.method public setChinaCityCnt(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->ChinaCityCnt:I

    .line 2
    .line 3
    return-void
.end method

.method public setChinaProvinceCnt(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->ChinaProvinceCnt:I

    .line 2
    .line 3
    return-void
.end method

.method public setCountryCnt(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->countryCnt:I

    .line 2
    .line 3
    return-void
.end method

.method public setMapType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->mapType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserHeadIconBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public setUserHeadIcondPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userHeadIcondPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserIdBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public setUserIdPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userIdPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserNickNameBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public setUserNickNamePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->userNickNamePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setWorldCityCnt(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->worldCityCnt:I

    .line 2
    .line 3
    return-void
.end method
