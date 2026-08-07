.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;
.source "SourceFile"


# instance fields
.field localBitmapPath:Ljava/lang/String;

.field private useLocationPath:Ljava/lang/String;

.field private userLocationBmp:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "/template"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->localBitmapPath:Ljava/lang/String;

    .line 8
    .line 9
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
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->userLocationBmp:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->useLocationPath:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->localBitmapPath:Ljava/lang/String;

    .line 10
    .line 11
    return-void
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
    const-string v0, "diming"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->userLocationBmp:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-direct {p1, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->userLocationBmp:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->userLocationBmp:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p1, v0, v1, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;->setBitmapWithTarget(Landroid/graphics/Bitmap;II)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->useLocationPath:Ljava/lang/String;

    .line 42
    .line 43
    invoke-direct {p1, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const-string v0, "userimage"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    new-instance p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->localBitmapPath:Ljava/lang/String;

    .line 58
    .line 59
    invoke-direct {p1, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieBitmapGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->baseFolder:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v0, "/"

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 100
    .line 101
    invoke-direct {v0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    move-object p1, v0

    .line 105
    :goto_0
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getWidth()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    invoke-virtual {p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    invoke-virtual {p1, v0, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->setTargetWidthAndHeight(II)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 120
    .line 121
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->addRunerTask(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 122
    .line 123
    .line 124
    const/4 p0, 0x1

    .line 125
    return p0
.end method

.method public setLocalBitmapPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->localBitmapPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUseLocationPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->useLocationPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserLocationBmp(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->userLocationBmp:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method
