.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;
.source "SourceFile"


# instance fields
.field countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

.field private countryPngPath:Ljava/lang/String;

.field headIconGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

.field private headPngPath:Ljava/lang/String;

.field headTextGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

.field private headTextPngPath:Ljava/lang/String;

.field lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

.field private lottieJsonPath:Ljava/lang/String;

.field model:Lcom/momo/mcamera/mask/MaskModel;

.field nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

.field normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

.field numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

.field scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

.field stickerItemGeomeAttrInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "/sdcard/maskdir/touxiang.png"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headPngPath:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "/sdcard/maskdir/touxiangwenzi.png"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextPngPath:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "/sdcard/maskdir/guojiachengshi.png"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryPngPath:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "/sdcard/maskdir/config.json"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->lottieJsonPath:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 22
    .line 23
    return-void
.end method

.method private initAllProgram()V
    .locals 7

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    new-array v2, v0, [F

    .line 8
    .line 9
    fill-array-data v2, :array_1

    .line 10
    .line 11
    .line 12
    new-array v3, v0, [F

    .line 13
    .line 14
    fill-array-data v3, :array_2

    .line 15
    .line 16
    .line 17
    new-array v0, v0, [F

    .line 18
    .line 19
    fill-array-data v0, :array_3

    .line 20
    .line 21
    .line 22
    filled-new-array {v1, v2, v3, v0}, [[F

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->loadLottieFile()V

    .line 27
    .line 28
    .line 29
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 30
    .line 31
    invoke-direct {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 35
    .line 36
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 37
    .line 38
    invoke-direct {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 42
    .line 43
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headPngPath:Ljava/lang/String;

    .line 46
    .line 47
    invoke-direct {v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headIconGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 51
    .line 52
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 53
    .line 54
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextPngPath:Ljava/lang/String;

    .line 55
    .line 56
    invoke-direct {v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 60
    .line 61
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryPngPath:Ljava/lang/String;

    .line 64
    .line 65
    invoke-direct {v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 69
    .line 70
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->model:Lcom/momo/mcamera/mask/MaskModel;

    .line 73
    .line 74
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    const/4 v3, 0x0

    .line 79
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Lcom/momo/mcamera/mask/Sticker;

    .line 84
    .line 85
    sget-object v4, Ll/l26;->a:Landroid/content/Context;

    .line 86
    .line 87
    invoke-direct {v1, v2, v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 88
    .line 89
    .line 90
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->stickerItemGeomeAttrInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 91
    .line 92
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 93
    .line 94
    invoke-direct {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 98
    .line 99
    const/4 v1, 0x4

    .line 100
    new-array v2, v1, [Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 101
    .line 102
    iput-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 103
    .line 104
    :goto_0
    if-ge v3, v1, :cond_0

    .line 105
    .line 106
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 107
    .line 108
    new-instance v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 109
    .line 110
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->model:Lcom/momo/mcamera/mask/MaskModel;

    .line 111
    .line 112
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    const/4 v6, 0x1

    .line 117
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    check-cast v5, Lcom/momo/mcamera/mask/Sticker;

    .line 122
    .line 123
    add-int/lit8 v6, v3, 0x1

    .line 124
    .line 125
    invoke-direct {v4, v5, v6}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;-><init>(Lcom/momo/mcamera/mask/Sticker;I)V

    .line 126
    .line 127
    .line 128
    aput-object v4, v2, v3

    .line 129
    .line 130
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 131
    .line 132
    aget-object v2, v2, v3

    .line 133
    .line 134
    aget-object v3, v0, v3

    .line 135
    .line 136
    invoke-virtual {v2, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->updateAnimationRange([F)V

    .line 137
    .line 138
    .line 139
    move v3, v6

    .line 140
    goto :goto_0

    .line 141
    :cond_0
    return-void

    .line 142
    nop

    .line 143
    :array_0
    .array-data 4
        0x41400000    # 12.0f
        0x41a00000    # 20.0f
        0x41f00000    # 30.0f
    .end array-data

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_1
    .array-data 4
        0x41600000    # 14.0f
        0x41c80000    # 25.0f
        0x420c0000    # 35.0f
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    :array_2
    .array-data 4
        0x41a00000    # 20.0f
        0x41f80000    # 31.0f
        0x422c0000    # 43.0f
    .end array-data

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_3
    .array-data 4
        0x41b80000    # 23.0f
        0x420c0000    # 35.0f
        0x42340000    # 45.0f
    .end array-data
.end method

.method private loadLottieFile()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->lottieJsonPath:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-class v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 23
    .line 24
    invoke-virtual {v1, v0, v2}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    const-string p0, "zhangzhe"

    .line 38
    .line 39
    const-string v0, "get Json Cofnig is wrong !!"

    .line 40
    .line 41
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method


# virtual methods
.method public addMaskModel(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->model:Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->model:Lcom/momo/mcamera/mask/MaskModel;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/d33;->destroy()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/d33;->destroy()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 24
    .line 25
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headIconGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headIconGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 33
    .line 34
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 35
    .line 36
    if-eqz v1, :cond_3

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 42
    .line 43
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 44
    .line 45
    if-eqz v1, :cond_4

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 51
    .line 52
    :cond_4
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 53
    .line 54
    if-eqz v1, :cond_6

    .line 55
    .line 56
    array-length v2, v1

    .line 57
    const/4 v3, 0x0

    .line 58
    :goto_0
    if-ge v3, v2, :cond_5

    .line 59
    .line 60
    aget-object v4, v1, v3

    .line 61
    .line 62
    invoke-virtual {v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->recycleResourceInGlThread()V

    .line 63
    .line 64
    .line 65
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 69
    .line 70
    :cond_6
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 71
    .line 72
    if-eqz v1, :cond_7

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 78
    .line 79
    :cond_7
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->stickerItemGeomeAttrInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 80
    .line 81
    if-eqz v1, :cond_8

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->stickerItemGeomeAttrInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 87
    .line 88
    :cond_8
    return-void
.end method

.method public bridge synthetic drawSub()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawSub()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public handleSizeChange()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0, v1, v2}, Ll/lim;->setBaseRenderSize(II)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headIconGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {v0, v1, v2}, Ll/lim;->setBaseRenderSize(II)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->stickerItemGeomeAttrInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v0, v1, v2}, Ll/lim;->setBaseRenderSize(II)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v0, v1, v2}, Ll/lim;->setBaseRenderSize(II)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {v0, v1, p0}, Ll/lim;->setBaseRenderSize(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public initWithGLContext()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundRed(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundGreen(F)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundBlue(F)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->initAllProgram()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onDrawPrograms()V
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->stickerItemGeomeAttrInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headIconGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 16
    .line 17
    iget-wide v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headIconGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->headTextGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->getFrameTexture()[I

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/lim;->getAlphaValue()F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x0

    .line 58
    cmpl-float v0, v0, v1

    .line 59
    .line 60
    if-lez v0, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    aget-object v0, v0, v2

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameWidth()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 72
    .line 73
    aget-object v3, v3, v2

    .line 74
    .line 75
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameHeight()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 80
    .line 81
    invoke-virtual {v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameWidth()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    mul-int/lit8 v5, v0, 0x2

    .line 86
    .line 87
    add-int/2addr v4, v5

    .line 88
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 89
    .line 90
    invoke-virtual {v5}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameHeight()I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    int-to-float v5, v5

    .line 95
    int-to-float v3, v3

    .line 96
    const/high16 v6, 0x3e000000    # 0.125f

    .line 97
    .line 98
    mul-float/2addr v6, v3

    .line 99
    add-float/2addr v5, v6

    .line 100
    float-to-int v5, v5

    .line 101
    new-instance v6, Ll/lej;

    .line 102
    .line 103
    invoke-direct {v6, v4, v5}, Ll/lej;-><init>(II)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v6, v4, v5}, Ll/lej;->b(II)V

    .line 107
    .line 108
    .line 109
    iget-object v7, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 110
    .line 111
    invoke-virtual {v7, v4, v5}, Ll/lim;->setBaseRenderSize(II)V

    .line 112
    .line 113
    .line 114
    iget-object v7, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 115
    .line 116
    array-length v8, v7

    .line 117
    move v9, v2

    .line 118
    :goto_0
    const/high16 v10, 0x43340000    # 180.0f

    .line 119
    .line 120
    if-ge v9, v8, :cond_0

    .line 121
    .line 122
    aget-object v11, v7, v9

    .line 123
    .line 124
    invoke-virtual {v11, v4, v5}, Ll/lim;->setBaseRenderSize(II)V

    .line 125
    .line 126
    .line 127
    iget-wide v12, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 128
    .line 129
    invoke-virtual {v11, v12, v13}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->setTimeStamp(J)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v11, v10, v1, v1}, Ll/lim;->setRotate(FFF)V

    .line 133
    .line 134
    .line 135
    add-int/lit8 v9, v9, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_0
    invoke-virtual {v6}, Ll/lej;->h()[I

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    aget v7, v7, v2

    .line 143
    .line 144
    const v8, 0x8d40

    .line 145
    .line 146
    .line 147
    invoke-static {v8, v7}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 148
    .line 149
    .line 150
    invoke-static {v2, v2, v4, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 151
    .line 152
    .line 153
    invoke-static {v1, v1, v1, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 154
    .line 155
    .line 156
    const/16 v7, 0x4100

    .line 157
    .line 158
    invoke-static {v7}, Landroid/opengl/GLES20;->glClear(I)V

    .line 159
    .line 160
    .line 161
    iget-object v7, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 162
    .line 163
    invoke-virtual {v7, v10, v1, v1}, Ll/lim;->setRotate(FFF)V

    .line 164
    .line 165
    .line 166
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameWidth()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    sub-int v1, v4, v1

    .line 173
    .line 174
    int-to-float v1, v1

    .line 175
    const/high16 v7, 0x3f800000    # 1.0f

    .line 176
    .line 177
    mul-float/2addr v1, v7

    .line 178
    int-to-float v9, v4

    .line 179
    div-float/2addr v1, v9

    .line 180
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 181
    .line 182
    invoke-virtual {v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameHeight()I

    .line 183
    .line 184
    .line 185
    move-result v10

    .line 186
    sub-int v10, v5, v10

    .line 187
    .line 188
    int-to-float v10, v10

    .line 189
    mul-float/2addr v10, v7

    .line 190
    int-to-float v11, v5

    .line 191
    div-float/2addr v10, v11

    .line 192
    iget-object v12, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 193
    .line 194
    neg-float v10, v10

    .line 195
    invoke-virtual {v12, v1, v10}, Ll/lim;->setTraslate(FF)V

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 199
    .line 200
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->countryGInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;

    .line 201
    .line 202
    invoke-virtual {p0, v1, v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 203
    .line 204
    .line 205
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 206
    .line 207
    aget-object v1, v1, v2

    .line 208
    .line 209
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameWidth()I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    sub-int v1, v4, v1

    .line 214
    .line 215
    int-to-float v1, v1

    .line 216
    mul-float/2addr v1, v7

    .line 217
    div-float/2addr v1, v9

    .line 218
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 219
    .line 220
    aget-object v10, v10, v2

    .line 221
    .line 222
    invoke-virtual {v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameHeight()I

    .line 223
    .line 224
    .line 225
    move-result v10

    .line 226
    int-to-float v10, v10

    .line 227
    mul-float/2addr v10, v7

    .line 228
    sub-float v10, v11, v10

    .line 229
    .line 230
    div-float/2addr v10, v11

    .line 231
    iget-object v12, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 232
    .line 233
    aget-object v12, v12, v2

    .line 234
    .line 235
    neg-float v1, v1

    .line 236
    neg-float v10, v10

    .line 237
    invoke-virtual {v12, v1, v10}, Ll/lim;->setTraslate(FF)V

    .line 238
    .line 239
    .line 240
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 241
    .line 242
    iget-object v12, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 243
    .line 244
    aget-object v12, v12, v2

    .line 245
    .line 246
    invoke-virtual {v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 247
    .line 248
    .line 249
    move-result v12

    .line 250
    invoke-virtual {v1, v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 251
    .line 252
    .line 253
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 254
    .line 255
    iget-object v12, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 256
    .line 257
    aget-object v12, v12, v2

    .line 258
    .line 259
    invoke-virtual {p0, v1, v12}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 260
    .line 261
    .line 262
    int-to-float v1, v0

    .line 263
    const/high16 v12, 0x40400000    # 3.0f

    .line 264
    .line 265
    mul-float/2addr v1, v12

    .line 266
    sub-float v1, v9, v1

    .line 267
    .line 268
    div-float/2addr v1, v9

    .line 269
    iget-object v13, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 270
    .line 271
    const/4 v14, 0x1

    .line 272
    aget-object v13, v13, v14

    .line 273
    .line 274
    neg-float v1, v1

    .line 275
    invoke-virtual {v13, v1, v10}, Ll/lim;->setTraslate(FF)V

    .line 276
    .line 277
    .line 278
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 279
    .line 280
    iget-object v13, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 281
    .line 282
    aget-object v13, v13, v14

    .line 283
    .line 284
    invoke-virtual {v13}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 285
    .line 286
    .line 287
    move-result v13

    .line 288
    invoke-virtual {v10, v13}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 289
    .line 290
    .line 291
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 292
    .line 293
    iget-object v13, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 294
    .line 295
    aget-object v13, v13, v14

    .line 296
    .line 297
    invoke-virtual {p0, v10, v13}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 298
    .line 299
    .line 300
    mul-float v10, v3, v12

    .line 301
    .line 302
    sub-float v10, v11, v10

    .line 303
    .line 304
    div-float v12, v3, v12

    .line 305
    .line 306
    sub-float/2addr v10, v12

    .line 307
    div-float/2addr v10, v11

    .line 308
    iget-object v12, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 309
    .line 310
    const/4 v13, 0x2

    .line 311
    aget-object v12, v12, v13

    .line 312
    .line 313
    neg-float v10, v10

    .line 314
    invoke-virtual {v12, v1, v10}, Ll/lim;->setTraslate(FF)V

    .line 315
    .line 316
    .line 317
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 318
    .line 319
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 320
    .line 321
    aget-object v10, v10, v13

    .line 322
    .line 323
    invoke-virtual {v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 324
    .line 325
    .line 326
    move-result v10

    .line 327
    invoke-virtual {v1, v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 328
    .line 329
    .line 330
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 331
    .line 332
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 333
    .line 334
    aget-object v10, v10, v13

    .line 335
    .line 336
    invoke-virtual {p0, v1, v10}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 337
    .line 338
    .line 339
    sub-int v0, v4, v0

    .line 340
    .line 341
    int-to-float v0, v0

    .line 342
    mul-float/2addr v0, v7

    .line 343
    div-float/2addr v0, v9

    .line 344
    mul-float/2addr v3, v7

    .line 345
    sub-float v1, v11, v3

    .line 346
    .line 347
    div-float/2addr v1, v11

    .line 348
    const/high16 v3, -0x40800000    # -1.0f

    .line 349
    .line 350
    mul-float/2addr v1, v3

    .line 351
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 352
    .line 353
    const/4 v7, 0x3

    .line 354
    aget-object v3, v3, v7

    .line 355
    .line 356
    neg-float v0, v0

    .line 357
    neg-float v1, v1

    .line 358
    invoke-virtual {v3, v0, v1}, Ll/lim;->setTraslate(FF)V

    .line 359
    .line 360
    .line 361
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 362
    .line 363
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 364
    .line 365
    aget-object v1, v1, v7

    .line 366
    .line 367
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;->getVerticalRatio()F

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->setTexturedVerticalOffset(F)V

    .line 372
    .line 373
    .line 374
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->scrollEffectProgram:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;

    .line 375
    .line 376
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->numbersInfo:[Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerSlidingGeomAttrInfo;

    .line 377
    .line 378
    aget-object v1, v1, v7

    .line 379
    .line 380
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 381
    .line 382
    .line 383
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 384
    .line 385
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    aget v0, v0, v2

    .line 390
    .line 391
    invoke-static {v8, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 399
    .line 400
    .line 401
    move-result v1

    .line 402
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 403
    .line 404
    .line 405
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 406
    .line 407
    invoke-virtual {v0, v4, v5}, Ll/lim;->updateBitmapInfo(II)V

    .line 408
    .line 409
    .line 410
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 411
    .line 412
    invoke-virtual {v6}, Ll/lej;->i()[I

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    aget v1, v1, v2

    .line 417
    .line 418
    filled-new-array {v1}, [I

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;->updateInputeTexture([I)V

    .line 423
    .line 424
    .line 425
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 426
    .line 427
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVTitleProgramFilter;->nomralForCountry:Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/TextureLottieGeomeAttrInfo;

    .line 428
    .line 429
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 430
    .line 431
    .line 432
    :cond_1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->onDrawPrograms()V

    .line 433
    .line 434
    .line 435
    return-void
.end method

.method public bridge synthetic setTimeStamp(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setTotalFrameCount(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->setTotalFrameCount(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic snapPicture(II)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->snapPicture(II)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
