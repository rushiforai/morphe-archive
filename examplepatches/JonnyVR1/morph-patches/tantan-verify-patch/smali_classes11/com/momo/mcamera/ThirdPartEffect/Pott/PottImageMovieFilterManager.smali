.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;
.super Ll/jgj0;
.source "SourceFile"


# static fields
.field private static final TOTAL_CNT:I = 0x177


# instance fields
.field allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

.field groupList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;",
            ">;"
        }
    .end annotation
.end field

.field mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

.field parameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field pottAssetCfg:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;

.field pottMVMapProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

.field pottMVTemplateList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;",
            ">;"
        }
    .end annotation
.end field

.field tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

.field templateIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field templateMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;",
            ">;>;"
        }
    .end annotation
.end field

.field templateRatioArray:[F

.field templateTypeArray:[Ljava/lang/String;

.field titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

.field private totalFrameCount:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/jgj0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVTemplateList:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateIndex:Ljava/util/Map;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->groupList:Ljava/util/List;

    .line 31
    .line 32
    const-string v0, "4:3"

    .line 33
    .line 34
    const-string v1, "16:9"

    .line 35
    .line 36
    const-string v2, "9:16"

    .line 37
    .line 38
    const-string v3, "3:4"

    .line 39
    .line 40
    const-string v4, "1:1"

    .line 41
    .line 42
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateTypeArray:[Ljava/lang/String;

    .line 47
    .line 48
    const/4 v0, 0x5

    .line 49
    new-array v0, v0, [F

    .line 50
    .line 51
    fill-array-data v0, :array_0

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateRatioArray:[F

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->totalFrameCount:I

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 61
    .line 62
    return-void

    .line 63
    :array_0
    .array-data 4
        0x3f100000    # 0.5625f
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
        0x3faaaaab
        0x3fe38e39
    .end array-data
.end method

.method private initAllEffectGroup()Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "FilterProcess"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p0, "Initall Effect Error , Parameter is null"

    .line 9
    .line 10
    invoke-static {v2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->configResourcePath:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, "/config.json"

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/momo/mcamera/util/JsonConfigParseHelpler;->loadPottAssetFile(Ljava/lang/String;)Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottAssetCfg:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;

    .line 40
    .line 41
    if-eqz v0, :cond_6

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;->getAssets()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_4

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;

    .line 62
    .line 63
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 64
    .line 65
    iget-object v4, v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->configResourcePath:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v5, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v4, "/"

    .line 76
    .line 77
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->getFolder()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->getTemplateList()Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->getType()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    const-string v7, "template"

    .line 100
    .line 101
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    if-eqz v6, :cond_2

    .line 106
    .line 107
    invoke-direct {p0, v5, v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initTemplateCfg(Ljava/util/List;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->getType()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    const-string v7, "tailer"

    .line 116
    .line 117
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    if-eqz v6, :cond_3

    .line 122
    .line 123
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 124
    .line 125
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->mapType:Ljava/lang/String;

    .line 126
    .line 127
    invoke-direct {p0, v5, v4, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initTailerCfg(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_3
    invoke-virtual {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/MVSegmentCfg;->getType()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    const-string v6, "title"

    .line 136
    .line 137
    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-eqz v3, :cond_1

    .line 142
    .line 143
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 144
    .line 145
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->mapType:Ljava/lang/String;

    .line 146
    .line 147
    invoke-direct {p0, v5, v4, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initTitleCfg(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->imageList:Ljava/util/List;

    .line 154
    .line 155
    if-eqz v0, :cond_5

    .line 156
    .line 157
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 158
    .line 159
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-lez v0, :cond_5

    .line 164
    .line 165
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initNormalTemplate()Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    return p0

    .line 170
    :cond_5
    const-string p0, " \u4f20\u5165\u53c2\u6570\u9519\u8bef\uff0c\u672a\u4f20\u5165\u7528\u6237\u56fe\u7247\u5217\u8868\uff0c\u6216\u914d\u7f6e\u6587\u4ef6\u6709\u95ee\u4e0b\u5468"

    .line 171
    .line 172
    invoke-static {v2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    return v1

    .line 176
    :cond_6
    const/4 p0, 0x1

    .line 177
    return p0
.end method

.method private initNormalTemplate()Z
    .locals 13

    .line 1
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return v7

    .line 7
    :cond_0
    move v8, v7

    .line 8
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->imageList:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    if-ge v8, v1, :cond_9

    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->imageList:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    .line 30
    .line 31
    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-boolean v2, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 35
    .line 36
    invoke-static {v1, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 37
    .line 38
    .line 39
    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 40
    .line 41
    iget v3, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 42
    .line 43
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateTypeArray:[Ljava/lang/String;

    .line 44
    .line 45
    array-length v6, v5

    .line 46
    sub-int/2addr v6, v2

    .line 47
    aget-object v5, v5, v6

    .line 48
    .line 49
    move v6, v7

    .line 50
    :goto_1
    iget-object v9, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateRatioArray:[F

    .line 51
    .line 52
    array-length v10, v9

    .line 53
    if-ge v6, v10, :cond_2

    .line 54
    .line 55
    aget v9, v9, v6

    .line 56
    .line 57
    int-to-float v10, v4

    .line 58
    const/high16 v11, 0x3f800000    # 1.0f

    .line 59
    .line 60
    mul-float/2addr v10, v11

    .line 61
    int-to-float v11, v3

    .line 62
    div-float/2addr v10, v11

    .line 63
    iget-object v11, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 64
    .line 65
    iget-object v12, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateTypeArray:[Ljava/lang/String;

    .line 66
    .line 67
    aget-object v12, v12, v6

    .line 68
    .line 69
    invoke-interface {v11, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v11

    .line 73
    if-eqz v11, :cond_1

    .line 74
    .line 75
    cmpl-float v9, v9, v10

    .line 76
    .line 77
    if-ltz v9, :cond_1

    .line 78
    .line 79
    iget-object v5, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateTypeArray:[Ljava/lang/String;

    .line 80
    .line 81
    aget-object v5, v5, v6

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    :goto_2
    new-instance v6, Ljava/util/Random;

    .line 88
    .line 89
    invoke-direct {v6}, Ljava/util/Random;-><init>()V

    .line 90
    .line 91
    .line 92
    iget-object v6, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 93
    .line 94
    invoke-interface {v6}, Ljava/util/Map;->size()I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-lez v6, :cond_8

    .line 99
    .line 100
    iget-object v6, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 101
    .line 102
    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    check-cast v6, Ljava/util/List;

    .line 107
    .line 108
    if-nez v6, :cond_3

    .line 109
    .line 110
    iget-object v9, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 111
    .line 112
    invoke-interface {v9}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 113
    .line 114
    .line 115
    move-result-object v9

    .line 116
    invoke-interface {v9}, Ljava/util/Set;->size()I

    .line 117
    .line 118
    .line 119
    move-result v10

    .line 120
    if-lez v10, :cond_3

    .line 121
    .line 122
    invoke-interface {v9}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    aget-object v5, v5, v7

    .line 127
    .line 128
    check-cast v5, Ljava/lang/String;

    .line 129
    .line 130
    iget-object v6, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 131
    .line 132
    invoke-interface {v9}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v9

    .line 136
    aget-object v9, v9, v7

    .line 137
    .line 138
    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    check-cast v6, Ljava/util/List;

    .line 143
    .line 144
    :cond_3
    const-string v9, "FilterProcess"

    .line 145
    .line 146
    if-eqz v6, :cond_7

    .line 147
    .line 148
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 149
    .line 150
    .line 151
    move-result v10

    .line 152
    if-lez v10, :cond_7

    .line 153
    .line 154
    iget-object v10, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateIndex:Ljava/util/Map;

    .line 155
    .line 156
    invoke-interface {v10, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v10

    .line 160
    check-cast v10, Ljava/lang/Integer;

    .line 161
    .line 162
    if-nez v10, :cond_4

    .line 163
    .line 164
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v10

    .line 168
    :cond_4
    iget-object v11, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateIndex:Ljava/util/Map;

    .line 169
    .line 170
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 171
    .line 172
    .line 173
    move-result v12

    .line 174
    add-int/2addr v12, v2

    .line 175
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    rem-int/2addr v12, v2

    .line 180
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-interface {v11, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    check-cast v2, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;

    .line 196
    .line 197
    new-instance v5, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const-string v6, "image width = "

    .line 200
    .line 201
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v4, " height="

    .line 208
    .line 209
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    const-string v3, " Index="

    .line 216
    .line 217
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    invoke-static {v9, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    new-instance v3, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    const-string v4, "choos template type="

    .line 233
    .line 234
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getType()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v4

    .line 241
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string v4, " name="

    .line 245
    .line 246
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getSubFolder()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-static {v9, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    new-instance v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;

    .line 264
    .line 265
    invoke-direct {v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;-><init>()V

    .line 266
    .line 267
    .line 268
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 269
    .line 270
    iget-object v4, v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationList:Ljava/util/List;

    .line 271
    .line 272
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    if-lez v4, :cond_5

    .line 277
    .line 278
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 279
    .line 280
    iget-object v4, v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationList:Ljava/util/List;

    .line 281
    .line 282
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 283
    .line 284
    .line 285
    move-result v4

    .line 286
    if-ge v8, v4, :cond_5

    .line 287
    .line 288
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 289
    .line 290
    iget-object v4, v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationList:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    check-cast v4, Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v3, v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->setUseLocationPath(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    goto :goto_3

    .line 302
    :cond_5
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 303
    .line 304
    iget-object v4, v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationBmpList:Ljava/util/List;

    .line 305
    .line 306
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 307
    .line 308
    .line 309
    move-result v4

    .line 310
    if-lez v4, :cond_6

    .line 311
    .line 312
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 313
    .line 314
    iget-object v4, v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationBmpList:Ljava/util/List;

    .line 315
    .line 316
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    if-le v4, v8, :cond_6

    .line 321
    .line 322
    iget-object v4, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 323
    .line 324
    iget-object v4, v4, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userLocationBmpList:Ljava/util/List;

    .line 325
    .line 326
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v4

    .line 330
    check-cast v4, Landroid/graphics/Bitmap;

    .line 331
    .line 332
    invoke-virtual {v3, v4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->setUserLocationBmp(Landroid/graphics/Bitmap;)V

    .line 333
    .line 334
    .line 335
    :cond_6
    :goto_3
    invoke-virtual {v3, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;->setLocalBitmapPath(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    move-object v1, v2

    .line 339
    iget-object v2, v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->baseFolder:Ljava/lang/String;

    .line 340
    .line 341
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getFadeoutStartFrmNo()I

    .line 342
    .line 343
    .line 344
    move-result v4

    .line 345
    mul-int/lit8 v4, v4, 0x28

    .line 346
    .line 347
    int-to-long v4, v4

    .line 348
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getTotalNum()I

    .line 349
    .line 350
    .line 351
    move-result v1

    .line 352
    mul-int/lit8 v1, v1, 0x28

    .line 353
    .line 354
    int-to-long v9, v1

    .line 355
    move-object v0, p0

    .line 356
    move-object v1, v3

    .line 357
    move-wide v3, v4

    .line 358
    move-wide v5, v9

    .line 359
    invoke-direct/range {v0 .. v6}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initSingleGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;Ljava/lang/String;JJ)V

    .line 360
    .line 361
    .line 362
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVTemplateList:Ljava/util/List;

    .line 363
    .line 364
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    goto :goto_4

    .line 368
    :cond_7
    const-string v0, "Get template failed , no template is perfect !!"

    .line 369
    .line 370
    invoke-static {v9, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    return v7

    .line 374
    :cond_8
    :goto_4
    add-int/lit8 v8, v8, 0x1

    .line 375
    .line 376
    goto/16 :goto_0

    .line 377
    .line 378
    :cond_9
    return v2
.end method

.method private initSingleGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;Ljava/lang/String;JJ)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setBaseFolder(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p3, p4}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setTemplateTailerTimeInMs(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p5, p6}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setTemplateTotalTimeInMs(J)V

    .line 11
    .line 12
    .line 13
    iget p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->totalFrameCount:I

    .line 14
    .line 15
    const-wide/16 p3, 0x28

    .line 16
    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    int-to-long v0, p2

    .line 20
    div-long/2addr p5, p3

    .line 21
    add-long/2addr v0, p5

    .line 22
    long-to-int p2, v0

    .line 23
    iput p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->totalFrameCount:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    int-to-long v0, p2

    .line 27
    div-long/2addr p5, p3

    .line 28
    const-wide/16 p2, 0x5

    .line 29
    .line 30
    sub-long/2addr p5, p2

    .line 31
    add-long/2addr v0, p5

    .line 32
    long-to-int p2, v0

    .line 33
    iput p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->totalFrameCount:I

    .line 34
    .line 35
    :goto_0
    const/4 p2, 0x0

    .line 36
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setErrorListener(Ll/jk90;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->groupList:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private initTailerCfg(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "/"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getSubFolder()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getType()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "map"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const-string v2, "FilterProcess"

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

    .line 56
    .line 57
    invoke-direct {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVMapProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->traveledLocations:Ljava/util/List;

    .line 65
    .line 66
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->setTravelList(Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVMapProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

    .line 70
    .line 71
    invoke-virtual {v1, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->setMapType(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVMapProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

    .line 75
    .line 76
    const-string v3, "Init map of tailer Template"

    .line 77
    .line 78
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_0
    :goto_1
    move-object v4, v1

    .line 82
    goto :goto_2

    .line 83
    :cond_1
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getType()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v3, "end"

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    new-instance v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 96
    .line 97
    invoke-direct {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 101
    .line 102
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 103
    .line 104
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userHeadIcondPath:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->setUserHeadIcondPath(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 110
    .line 111
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 112
    .line 113
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userNickNamePath:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->setUserNickNamePath(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 119
    .line 120
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 121
    .line 122
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userIdPath:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->setUserIdPath(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 128
    .line 129
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 130
    .line 131
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 132
    .line 133
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->setUserHeadIconBitmap(Landroid/graphics/Bitmap;)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 137
    .line 138
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 139
    .line 140
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 141
    .line 142
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->setUserNickNameBitmap(Landroid/graphics/Bitmap;)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 146
    .line 147
    iget-object v3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 148
    .line 149
    iget-object v3, v3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 150
    .line 151
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->setUserIdBitmap(Landroid/graphics/Bitmap;)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 155
    .line 156
    const-string v3, "Init end  of tailer Template"

    .line 157
    .line 158
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->totalFrameCount:I

    .line 162
    .line 163
    rsub-int v2, v2, 0x17c

    .line 164
    .line 165
    if-lez v2, :cond_0

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getTotalNum()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getFadeoutStartFrmNo()I

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    sub-int/2addr v3, v4

    .line 176
    sub-int v3, v2, v3

    .line 177
    .line 178
    invoke-virtual {v0, v3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->setFadeoutStartFrmNo(I)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->setTotalNum(I)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_2
    const/4 v1, 0x0

    .line 186
    goto :goto_1

    .line 187
    :goto_2
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getFadeoutStartFrmNo()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    mul-int/lit8 v1, v1, 0x28

    .line 192
    .line 193
    int-to-long v6, v1

    .line 194
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getTotalNum()I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    mul-int/lit8 v0, v0, 0x28

    .line 199
    .line 200
    int-to-long v8, v0

    .line 201
    move-object v3, p0

    .line 202
    invoke-direct/range {v3 .. v9}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initSingleGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;Ljava/lang/String;JJ)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_3
    return-void
.end method

.method private initTemplateCfg(Ljava/util/List;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "/"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getSubFolder()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->baseFolder:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getType()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getType()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getType()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string p2, "Init normale Template + "

    .line 92
    .line 93
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string p1, "FilterProcess"

    .line 110
    .line 111
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method private initTitleCfg(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p2, "/"

    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getSubFolder()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    new-instance p2, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 39
    .line 40
    invoke-direct {p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userHeadIcondPath:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setUserHeadIcondPath(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userNickNamePath:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setUserNickNamePath(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 62
    .line 63
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userIdPath:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setUserIdPath(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userHeadIconBitmap:Landroid/graphics/Bitmap;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setUserHeadIconBitmap(Landroid/graphics/Bitmap;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userNickNameBitmap:Landroid/graphics/Bitmap;

    .line 84
    .line 85
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setUserNickNameBitmap(Landroid/graphics/Bitmap;)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 89
    .line 90
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->userIdBitmap:Landroid/graphics/Bitmap;

    .line 93
    .line 94
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setUserIdBitmap(Landroid/graphics/Bitmap;)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 98
    .line 99
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 100
    .line 101
    iget v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->worldCityCnt:I

    .line 102
    .line 103
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setWorldCityCnt(I)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 107
    .line 108
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 109
    .line 110
    iget v0, v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->countryCnt:I

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setCountryCnt(I)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 116
    .line 117
    invoke-virtual {p2, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setMapType(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 121
    .line 122
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 123
    .line 124
    iget p3, p3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->chinaCityCnt:I

    .line 125
    .line 126
    invoke-virtual {p2, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setChinaCityCnt(I)V

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 130
    .line 131
    iget-object p3, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 132
    .line 133
    iget p3, p3, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;->chinaProvinceCnt:I

    .line 134
    .line 135
    invoke-virtual {p2, p3}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->setChinaProvinceCnt(I)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getFadeoutStartFrmNo()I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    mul-int/lit8 p2, p2, 0x28

    .line 145
    .line 146
    int-to-long v4, p2

    .line 147
    invoke-virtual {p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/config/Template;->getTotalNum()I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    mul-int/lit8 p1, p1, 0x28

    .line 152
    .line 153
    int-to-long v6, p1

    .line 154
    move-object v1, p0

    .line 155
    invoke-direct/range {v1 .. v7}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initSingleGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;Ljava/lang/String;JJ)V

    .line 156
    .line 157
    .line 158
    const-string p0, "FilterProcess"

    .line 159
    .line 160
    const-string p1, "Init Title Template"

    .line 161
    .line 162
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_0
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/jgj0;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottAssetCfg:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottAssetCfg;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;->destroy()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVTemplateList:Ljava/util/List;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVMapProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;->destroy()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVMapProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;->destroy()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 44
    .line 45
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->parameters:Ljava/util/Map;

    .line 46
    .line 47
    if-eqz v1, :cond_4

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->parameters:Ljava/util/Map;

    .line 53
    .line 54
    :cond_4
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->templateMap:Ljava/util/Map;

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->groupList:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 65
    .line 66
    return-void
.end method

.method public getTotalFrameCount()I
    .locals 0

    const/16 p0, 0x177

    return p0
.end method

.method public getVideoProcessFilter()Ll/jt2;
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->titleProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTitleProgramGroup;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->addRenderGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVTemplateList:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTemplateProgramGroup;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->addRenderGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->pottMVMapProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVMapProgramGroup;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->addRenderGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->tailerProgramGroup:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/PottMVTailerProgramGroup;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->addRenderGroup(Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 58
    .line 59
    return-object p0
.end method

.method public lockCoverFrame(Landroid/graphics/Bitmap;Ll/k6j$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public resetInternalStatusInEglThread()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/jgj0;->resetInternalStatusInEglThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->groupList:Ljava/util/List;

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
    check-cast v1, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->resetStatus()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->mixFilter:Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/MixProgramGroupRenderFilter;->resetGroupStatus()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public setAllParameterInfo(Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->allParameterInfo:Lcom/momo/mcamera/ThirdPartEffect/Pott/config/PottParameter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->initAllEffectGroup()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setFrameRate(I)V
    .locals 0

    return-void
.end method

.method public setProcessErrorListener(Ll/jk90;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/jgj0;->setProcessErrorListener(Ll/jk90;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/PottImageMovieFilterManager;->groupList:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/programgroup/EsTemplateProgramGroup;->setErrorListener(Ll/jk90;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public setTransferFieldImage(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0

    return-void
.end method
