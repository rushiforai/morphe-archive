.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;
.source "SourceFile"


# instance fields
.field geomeAttrInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;",
            ">;"
        }
    .end annotation
.end field

.field lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

.field private lottieJsonPath2:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "/sdcard/maskdir/fourth/"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieJsonPath2:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->initAllInfo()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private initAllInfo()V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieJsonPath2:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "config.json"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p0, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->loadLottieFile(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getLayers()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getAssetValues()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getAssetValues()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getImageId()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;->getLayers()Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_1

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;->getRefImageId()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;

    .line 110
    .line 111
    new-instance v4, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieJsonPath2:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v5, "/"

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getFolderPath()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/AssetValue;->getSourceName()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    new-instance v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 148
    .line 149
    invoke-direct {v4, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v4, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setLottieConfig(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/Layers;)V

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 156
    .line 157
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_1
    return-void
.end method

.method private loadLottieFile(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1, p1}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-class v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 21
    .line 22
    invoke-virtual {v0, p1, v1}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 33
    .line 34
    .line 35
    const-string p0, "zhangzhe"

    .line 36
    .line 37
    const-string p1, "get Json Cofnig is wrong !!"

    .line 38
    .line 39
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->lottieConfig:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/lottecfg/LottieConfig;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 32
    .line 33
    .line 34
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
    .locals 4

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {v1, v2, v3}, Ll/lim;->setBaseRenderSize(II)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
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
    invoke-virtual {p0, v0}, Ll/wej;->setBackgroundAlpha(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onDrawPrograms()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->initAllInfo()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    :goto_0
    if-ltz v0, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottLottieProgramFilter;->geomeAttrInfos:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;

    .line 29
    .line 30
    iget-wide v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/LottieMMFrameGeomeAttrInfo;->setTimeStamp(J)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 36
    .line 37
    invoke-virtual {p0, v2, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V

    .line 38
    .line 39
    .line 40
    add-int/lit8 v0, v0, -0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->onDrawPrograms()V

    .line 44
    .line 45
    .line 46
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
