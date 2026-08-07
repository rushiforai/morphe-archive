.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;
.source "SourceFile"


# instance fields
.field countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

.field flagsInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;",
            ">;"
        }
    .end annotation
.end field

.field mapBuffer:Ll/lej;

.field mapHeight:I

.field mapType:Ljava/lang/String;

.field mapWidth:I

.field nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

.field travelList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "tailer/map/"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->flagsInfo:Ljava/util/List;

    .line 12
    .line 13
    const/16 v0, 0x464

    .line 14
    .line 15
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 16
    .line 17
    const/16 v0, 0x2e7

    .line 18
    .line 19
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 20
    .line 21
    const-string v0, "world"

    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapType:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;-><init>(Ljava/lang/String;)V

    .line 27
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->flagsInfo:Ljava/util/List;

    const/16 p1, 0x464

    .line 28
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    const/16 p1, 0x2e7

    .line 29
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 30
    const-string p1, "world"

    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->travelList:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->travelList:Ljava/util/List;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public declared-synchronized drawGroup()V
    .locals 11

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 3
    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapBuffer:Ll/lej;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ll/lej;

    .line 18
    .line 19
    iget v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 20
    .line 21
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 22
    .line 23
    invoke-direct {v0, v2, v3}, Ll/lej;-><init>(II)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapBuffer:Ll/lej;

    .line 27
    .line 28
    iget v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 29
    .line 30
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 31
    .line 32
    invoke-virtual {v0, v2, v3}, Ll/lej;->b(II)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapBuffer:Ll/lej;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/lej;->i()[I

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    aget v2, v2, v1

    .line 44
    .line 45
    filled-new-array {v2}, [I

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->updateInputeTexture([I)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception v0

    .line 54
    goto/16 :goto_3

    .line 55
    .line 56
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 57
    .line 58
    iget-wide v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 59
    .line 60
    invoke-virtual {v0, v2, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 64
    .line 65
    iget v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 66
    .line 67
    iget v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 68
    .line 69
    invoke-virtual {v0, v2, v3}, Ll/lim;->updateBitmapInfo(II)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->getFrameTexture()[I

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/lim;->getAlphaValue()F

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v2, 0x0

    .line 87
    cmpl-float v0, v0, v2

    .line 88
    .line 89
    if-lez v0, :cond_3

    .line 90
    .line 91
    const/4 v0, 0x1

    .line 92
    new-array v3, v0, [I

    .line 93
    .line 94
    const/4 v4, 0x4

    .line 95
    new-array v4, v4, [I

    .line 96
    .line 97
    const v5, 0x8ca6

    .line 98
    .line 99
    .line 100
    invoke-static {v5, v3, v1}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 101
    .line 102
    .line 103
    const/16 v5, 0xba2

    .line 104
    .line 105
    invoke-static {v5, v4, v1}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 106
    .line 107
    .line 108
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapBuffer:Ll/lej;

    .line 109
    .line 110
    invoke-virtual {v5}, Ll/lej;->h()[I

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    aget v5, v5, v1

    .line 115
    .line 116
    const v6, 0x8d40

    .line 117
    .line 118
    .line 119
    invoke-static {v6, v5}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 120
    .line 121
    .line 122
    iget v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 123
    .line 124
    iget v7, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 125
    .line 126
    invoke-static {v1, v1, v5, v7}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 127
    .line 128
    .line 129
    invoke-static {v2, v2, v2, v2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 130
    .line 131
    .line 132
    const/16 v5, 0x4100

    .line 133
    .line 134
    invoke-static {v5}, Landroid/opengl/GLES20;->glClear(I)V

    .line 135
    .line 136
    .line 137
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 138
    .line 139
    iget v7, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 140
    .line 141
    iget v8, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 142
    .line 143
    invoke-virtual {v5, v7, v8}, Ll/lim;->setBaseRenderSize(II)V

    .line 144
    .line 145
    .line 146
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 147
    .line 148
    const/high16 v7, 0x43340000    # 180.0f

    .line 149
    .line 150
    invoke-virtual {v5, v7, v2, v2}, Ll/lim;->setRotate(FFF)V

    .line 151
    .line 152
    .line 153
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 154
    .line 155
    iget-object v8, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 156
    .line 157
    invoke-static {v5, v8}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 158
    .line 159
    .line 160
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->flagsInfo:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 167
    .line 168
    .line 169
    move-result v8

    .line 170
    if-eqz v8, :cond_2

    .line 171
    .line 172
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v8

    .line 176
    check-cast v8, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 177
    .line 178
    iget-wide v9, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->curTimeStamp:J

    .line 179
    .line 180
    invoke-virtual {v8, v9, v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 181
    .line 182
    .line 183
    iget v9, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 184
    .line 185
    iget v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 186
    .line 187
    invoke-virtual {v8, v9, v10}, Ll/lim;->setBaseRenderSize(II)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v8, v7, v2, v2}, Ll/lim;->setRotate(FFF)V

    .line 191
    .line 192
    .line 193
    iget-object v9, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 194
    .line 195
    invoke-static {v9, v8}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/RenderRunner;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 196
    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_2
    aget v2, v3, v1

    .line 200
    .line 201
    invoke-static {v6, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 202
    .line 203
    .line 204
    aget v1, v4, v1

    .line 205
    .line 206
    aget v0, v4, v0

    .line 207
    .line 208
    const/4 v2, 0x2

    .line 209
    aget v2, v4, v2

    .line 210
    .line 211
    const/4 v3, 0x3

    .line 212
    aget v3, v4, v3

    .line 213
    .line 214
    invoke-static {v1, v0, v2, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 215
    .line 216
    .line 217
    :cond_3
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->drawGroup()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    .line 219
    .line 220
    monitor-exit p0

    .line 221
    return-void

    .line 222
    :cond_4
    :goto_2
    :try_start_1
    const-string v0, "FilterProcess"

    .line 223
    .line 224
    const-string v1, "Parse Config error !! do not render "

    .line 225
    .line 226
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 227
    .line 228
    .line 229
    monitor-exit p0

    .line 230
    return-void

    .line 231
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 232
    throw v0
.end method

.method public onParseLayers(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;)Z
    .locals 7

    .line 1
    invoke-virtual {p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getLayerName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "flags"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "FilterProcess"

    .line 12
    .line 13
    const-string v2, "/"

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    new-instance p1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Ljava/util/Random;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->travelList:Ljava/util/List;

    .line 69
    .line 70
    if-eqz v2, :cond_1

    .line 71
    .line 72
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_7

    .line 81
    .line 82
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Landroid/graphics/PointF;

    .line 87
    .line 88
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFrameCount()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-lez v3, :cond_0

    .line 93
    .line 94
    new-instance v4, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v3}, Ljava/util/Random;->nextInt(I)I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    const-string v5, "_%03d"

    .line 115
    .line 116
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v3, ".png"

    .line 124
    .line 125
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    goto :goto_1

    .line 133
    :cond_0
    move-object v3, p1

    .line 134
    :goto_1
    new-instance v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 135
    .line 136
    invoke-direct {v4, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const/4 v3, 0x0

    .line 140
    invoke-virtual {v4, v3}, Ll/lim;->setAlphaValue(F)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 144
    .line 145
    .line 146
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 147
    .line 148
    const/high16 v5, 0x40000000    # 2.0f

    .line 149
    .line 150
    mul-float/2addr v3, v5

    .line 151
    const/high16 v6, 0x3f800000    # 1.0f

    .line 152
    .line 153
    sub-float/2addr v3, v6

    .line 154
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 155
    .line 156
    mul-float/2addr v2, v5

    .line 157
    sub-float/2addr v2, v6

    .line 158
    invoke-virtual {v4, v3, v2}, Ll/lim;->setTraslate(FF)V

    .line 159
    .line 160
    .line 161
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->flagsInfo:Ljava/util/List;

    .line 162
    .line 163
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_1
    const-string p0, "Do not set Location list !"

    .line 168
    .line 169
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    goto/16 :goto_3

    .line 173
    .line 174
    :cond_2
    const-string v0, "map"

    .line 175
    .line 176
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-eqz v0, :cond_4

    .line 181
    .line 182
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapType:Ljava/lang/String;

    .line 183
    .line 184
    const-string v0, "world"

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 191
    .line 192
    if-eqz p1, :cond_3

    .line 193
    .line 194
    new-instance p1, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    const-string v0, "_world.png"

    .line 223
    .line 224
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    goto :goto_2

    .line 232
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v0, "_china.png"

    .line 261
    .line 262
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    :goto_2
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 270
    .line 271
    invoke-direct {v0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 275
    .line 276
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 277
    .line 278
    invoke-direct {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;-><init>()V

    .line 279
    .line 280
    .line 281
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 282
    .line 283
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getWidth()I

    .line 287
    .line 288
    .line 289
    move-result p1

    .line 290
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapWidth:I

    .line 291
    .line 292
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getHeight()I

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapHeight:I

    .line 297
    .line 298
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 299
    .line 300
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 301
    .line 302
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_3

    .line 306
    .line 307
    :cond_4
    const-string v0, "maptextsticker"

    .line 308
    .line 309
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 314
    .line 315
    if-eqz p1, :cond_6

    .line 316
    .line 317
    new-instance p1, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object p2

    .line 332
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-static {}, Lcom/momo/mcamera/mask/MaskStore;->getInstance()Lcom/momo/mcamera/mask/MaskStore;

    .line 340
    .line 341
    .line 342
    move-result-object p2

    .line 343
    invoke-static {}, Ll/jv0;->a()Landroid/content/Context;

    .line 344
    .line 345
    .line 346
    move-result-object p3

    .line 347
    invoke-virtual {p2, p3, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/mask/MaskModel;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    const/4 p2, 0x0

    .line 352
    if-eqz p1, :cond_5

    .line 353
    .line 354
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 355
    .line 356
    .line 357
    move-result-object p3

    .line 358
    if-eqz p3, :cond_5

    .line 359
    .line 360
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 361
    .line 362
    .line 363
    move-result-object p3

    .line 364
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 365
    .line 366
    .line 367
    move-result p3

    .line 368
    if-lez p3, :cond_5

    .line 369
    .line 370
    new-instance p3, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 371
    .line 372
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 373
    .line 374
    .line 375
    move-result-object p1

    .line 376
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    check-cast p1, Lcom/momo/mcamera/mask/Sticker;

    .line 381
    .line 382
    sget-object p2, Ll/l26;->a:Landroid/content/Context;

    .line 383
    .line 384
    invoke-direct {p3, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 385
    .line 386
    .line 387
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 388
    .line 389
    invoke-virtual {p0, p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 390
    .line 391
    .line 392
    goto :goto_3

    .line 393
    :cond_5
    const-string p1, "Parse config error !! the param.txt of cover sticker is wrong !!"

    .line 394
    .line 395
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->recycleAllData()V

    .line 399
    .line 400
    .line 401
    return p2

    .line 402
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 403
    .line 404
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 405
    .line 406
    .line 407
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p3

    .line 427
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object p1

    .line 434
    new-instance p3, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 435
    .line 436
    invoke-direct {p3, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {p3, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 440
    .line 441
    .line 442
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 443
    .line 444
    invoke-virtual {p0, p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 445
    .line 446
    .line 447
    :cond_7
    :goto_3
    const/4 p0, 0x1

    .line 448
    return p0
.end method

.method public recycleAllData()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleAllData()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->flagsInfo:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->flagsInfo:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public declared-synchronized resetStatus()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->resetStatus()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->resetStatus()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_2

    .line 15
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->resetStatus()V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->flagsInfo:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->resetStatus()V

    .line 41
    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {v1, v2}, Ll/lim;->setAlphaValue(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    throw v0
.end method

.method public setMapType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->mapType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTravelList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->travelList:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
