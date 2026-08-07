.class final Lcom/momo/xeengine/gift/GiftPlayData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final giftEntity:Lcom/momo/xeengine/gift/GiftEntity;

.field private svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

.field private type:Lcom/momo/xeengine/gift/GiftType;

.field private videoGiftDescriptor:Lcom/momo/xeengine/gift/VideoGiftDescriptor;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/gift/GiftEntity;)V
    .locals 4
    .param p1    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "scaleType"

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/momo/xeengine/gift/GiftType;->UNKNOWN:Lcom/momo/xeengine/gift/GiftType;

    .line 7
    .line 8
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->giftEntity:Lcom/momo/xeengine/gift/GiftEntity;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getPath()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {p0, v1}, Lcom/momo/xeengine/gift/GiftPlayData;->isEngineGift(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/momo/xeengine/gift/GiftType;->ENGINE:Lcom/momo/xeengine/gift/GiftType;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v2, Ljava/io/File;

    .line 28
    .line 29
    const-string v3, "config.json"

    .line 30
    .line 31
    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v2}, Lcom/momo/xeengine/gift/GiftPlayData;->loadJsonFile(Ljava/io/File;)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    invoke-direct {p0, v1, v2}, Lcom/momo/xeengine/gift/GiftPlayData;->loadVideoIfAvailable(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    sget-object p1, Lcom/momo/xeengine/gift/GiftType;->VIDEO:Lcom/momo/xeengine/gift/GiftType;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-direct {p0, v1, v2}, Lcom/momo/xeengine/gift/GiftPlayData;->loadSvgaIfAvailable(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getLoops()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->setLoops(I)V

    .line 64
    .line 65
    .line 66
    sget-object p1, Lcom/momo/xeengine/gift/GiftType;->SVGA:Lcom/momo/xeengine/gift/GiftType;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-direct {p0, v1}, Lcom/momo/xeengine/gift/GiftPlayData;->isVideoFileAtPath(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    sget-object p1, Lcom/momo/xeengine/gift/GiftType;->VIDEO:Lcom/momo/xeengine/gift/GiftType;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 80
    .line 81
    invoke-static {v1}, Lcom/momo/xeengine/gift/VideoGiftDescriptor;->create(Ljava/lang/String;)Lcom/momo/xeengine/gift/VideoGiftDescriptor;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->videoGiftDescriptor:Lcom/momo/xeengine/gift/VideoGiftDescriptor;

    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getSpecJson()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_4

    .line 97
    .line 98
    new-instance v0, Ljava/io/File;

    .line 99
    .line 100
    const-string v2, "spec.json"

    .line 101
    .line 102
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/gift/GiftPlayData;->loadJsonFile(Ljava/io/File;)Lorg/json/JSONObject;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    goto :goto_0

    .line 110
    :cond_4
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getSpecJson()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    if-nez v3, :cond_5

    .line 124
    .line 125
    sget-object v3, Lcom/momo/xeengine/gift/SVGAScaleType;->WIDTH:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 126
    .line 127
    invoke-virtual {v3}, Lcom/momo/xeengine/gift/SVGAScaleType;->getValue()I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .line 133
    .line 134
    :cond_5
    move-object v0, v2

    .line 135
    :goto_0
    if-eqz v0, :cond_7

    .line 136
    .line 137
    invoke-direct {p0, v1, v0}, Lcom/momo/xeengine/gift/GiftPlayData;->loadSvgaIfAvailableFromSpec(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_7

    .line 142
    .line 143
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getLoops()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->setLoops(I)V

    .line 150
    .line 151
    .line 152
    sget-object v0, Lcom/momo/xeengine/gift/GiftType;->SVGA:Lcom/momo/xeengine/gift/GiftType;

    .line 153
    .line 154
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getScaleType()Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    sget-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->AUTO:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 161
    .line 162
    if-eq v0, v1, :cond_6

    .line 163
    .line 164
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getSvgaInfo()Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getScaleType()Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->setScaleType(Lcom/momo/xeengine/gift/SVGAScaleType;)V

    .line 175
    .line 176
    .line 177
    :cond_6
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getPositionType()Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    sget-object v1, Lcom/momo/xeengine/gift/SVGAPositionType;->AUTO:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 182
    .line 183
    if-eq v0, v1, :cond_7

    .line 184
    .line 185
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getSvgaInfo()Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getPositionType()Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->setPositionType(Lcom/momo/xeengine/gift/SVGAPositionType;)V

    .line 196
    .line 197
    .line 198
    :catch_0
    :cond_7
    return-void
.end method

.method private isEngineGift(Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    const-string v0, "app.lua"

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private isVideoFileAtPath(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    return p0

    .line 24
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/16 v0, 0x2e

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, -0x1

    .line 35
    if-ne v0, v1, :cond_3

    .line 36
    .line 37
    return p0

    .line 38
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v0, "mp4"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :catch_0
    return p0
.end method

.method private loadSvgaIfAvailable(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->createWithConfig(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private loadSvgaIfAvailableFromSpec(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->createWithSpec(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private loadVideoIfAvailable(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/momo/xeengine/gift/VideoGiftDescriptor;->create(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/momo/xeengine/gift/VideoGiftDescriptor;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->videoGiftDescriptor:Lcom/momo/xeengine/gift/VideoGiftDescriptor;

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->giftEntity:Lcom/momo/xeengine/gift/GiftEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSvgaGiftData()Lcom/momo/xeengine/gift/SVGAGiftDescriptor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->svgaGiftDescriptor:Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/momo/xeengine/gift/GiftType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoGiftData()Lcom/momo/xeengine/gift/VideoGiftDescriptor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->videoGiftDescriptor:Lcom/momo/xeengine/gift/VideoGiftDescriptor;

    .line 2
    .line 3
    return-object p0
.end method

.method public loadJsonFile(Ljava/io/File;)Lorg/json/JSONObject;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    :try_start_0
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftUtils;->readFileToString(Ljava/io/File;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance p1, Lorg/json/JSONObject;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-object p1

    .line 26
    :catch_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayData;->type:Lcom/momo/xeengine/gift/GiftType;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "]:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayData;->giftEntity:Lcom/momo/xeengine/gift/GiftEntity;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftEntity;->getId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
