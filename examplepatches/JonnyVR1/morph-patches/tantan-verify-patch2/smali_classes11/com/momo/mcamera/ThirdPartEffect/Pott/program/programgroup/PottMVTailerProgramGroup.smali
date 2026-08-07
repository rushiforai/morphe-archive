.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;
.source "SourceFile"


# instance fields
.field private userHeadIconBitmap:Landroid/graphics/Bitmap;

.field private userHeadIcondPath:Ljava/lang/String;

.field private userIdBitmap:Landroid/graphics/Bitmap;

.field private userIdPath:Ljava/lang/String;

.field private userNickNameBitmap:Landroid/graphics/Bitmap;

.field private userNickNamePath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "/tailer/end"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;-><init>(Ljava/lang/String;)V

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
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIcondPath:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNamePath:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdPath:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    return-void
.end method

.method public declared-synchronized drawGroup()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->drawGroup()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public onParseLayers(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getLayerName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "userhead"

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
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 19
    .line 20
    invoke-direct {p1, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {p1, p3, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->setBitmapWithTarget(Landroid/graphics/Bitmap;II)V

    .line 36
    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_0
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 41
    .line 42
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIcondPath:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto/16 :goto_0

    .line 48
    .line 49
    :cond_1
    const-string v0, "name"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 58
    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 62
    .line 63
    invoke-direct {p1, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-virtual {p1, v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->setBitmapWithTarget(Landroid/graphics/Bitmap;II)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    sub-int/2addr p3, v0

    .line 92
    neg-int p3, p3

    .line 93
    div-int/lit8 p3, p3, 0x2

    .line 94
    .line 95
    invoke-virtual {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setAdditionalOffset(I)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :cond_2
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 101
    .line 102
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNamePath:Ljava/lang/String;

    .line 103
    .line 104
    invoke-direct {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_3
    const-string v0, "id"

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_5

    .line 116
    .line 117
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 118
    .line 119
    if-eqz p1, :cond_4

    .line 120
    .line 121
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 122
    .line 123
    invoke-direct {p1, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 127
    .line 128
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 133
    .line 134
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    invoke-virtual {p1, v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->setBitmapWithTarget(Landroid/graphics/Bitmap;II)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getWidth()I

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 146
    .line 147
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    sub-int/2addr p3, v0

    .line 152
    neg-int p3, p3

    .line 153
    div-int/lit8 p3, p3, 0x2

    .line 154
    .line 155
    invoke-virtual {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setAdditionalOffset(I)V

    .line 156
    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_4
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 161
    .line 162
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdPath:Ljava/lang/String;

    .line 163
    .line 164
    invoke-direct {p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_5
    const-string v0, "tailer_sticker"

    .line 170
    .line 171
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 176
    .line 177
    const-string v1, "/"

    .line 178
    .line 179
    if-eqz p1, :cond_7

    .line 180
    .line 181
    new-instance p1, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p3

    .line 196
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-static {}, Lcom/momo/mcamera/mask/MaskStore;->getInstance()Lcom/momo/mcamera/mask/MaskStore;

    .line 204
    .line 205
    .line 206
    move-result-object p3

    .line 207
    invoke-static {}, Ll/jv0;->a()Landroid/content/Context;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {p3, v0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/mask/MaskModel;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    const/4 p3, 0x0

    .line 216
    if-eqz p1, :cond_6

    .line 217
    .line 218
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    if-eqz v0, :cond_6

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-lez v0, :cond_6

    .line 233
    .line 234
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 235
    .line 236
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    check-cast p1, Lcom/momo/mcamera/mask/Sticker;

    .line 245
    .line 246
    sget-object p3, Ll/l26;->a:Landroid/content/Context;

    .line 247
    .line 248
    invoke-direct {v0, p1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 249
    .line 250
    .line 251
    move-object p1, v0

    .line 252
    goto :goto_0

    .line 253
    :cond_6
    const-string p1, "FilterProcess"

    .line 254
    .line 255
    const-string p2, "Parse config error !! the param.txt of cover sticker is wrong !!"

    .line 256
    .line 257
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->recycleAllData()V

    .line 261
    .line 262
    .line 263
    return p3

    .line 264
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p3

    .line 289
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    new-instance p3, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 297
    .line 298
    invoke-direct {p3, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    move-object p1, p3

    .line 302
    :goto_0
    nop

    .line 303
    instance-of p3, p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 304
    .line 305
    const/4 v0, 0x1

    .line 306
    if-eqz p3, :cond_8

    .line 307
    .line 308
    move-object p3, p1

    .line 309
    check-cast p3, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 310
    .line 311
    invoke-virtual {p3, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {p3, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLoopLastFrame(Z)V

    .line 315
    .line 316
    .line 317
    :cond_8
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 318
    .line 319
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 320
    .line 321
    .line 322
    return v0
.end method

.method public declared-synchronized resetStatus()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->resetStatus()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public setUserHeadIconBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public setUserHeadIcondPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userHeadIcondPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserIdBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public setUserIdPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userIdPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserNickNameBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public setUserNickNamePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->userNickNamePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
