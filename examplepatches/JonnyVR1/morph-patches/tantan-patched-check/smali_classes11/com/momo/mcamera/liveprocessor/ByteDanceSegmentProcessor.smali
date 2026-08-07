.class public Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/liveprocessor/IProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/momo/mcamera/liveprocessor/IProcessor<",
        "Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;",
        ">;"
    }
.end annotation


# instance fields
.field private volatile isLoadSuccess:Z

.field private volatile isLoading:Z

.field private licensePath:Ljava/lang/String;

.field private modelPath:Ljava/lang/String;

.field private portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoading:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoadSuccess:Z

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->licensePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)Lcom/effectsar/labcv/effectsdk/PortraitMatting;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoadSuccess:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$402(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoading:Z

    .line 2
    .line 3
    return p1
.end method

.method private getPreferSampleSize(II)F
    .locals 3

    .line 1
    new-instance p0, Landroid/graphics/Point;

    .line 2
    .line 3
    const/16 v0, 0x80

    .line 4
    .line 5
    const/16 v1, 0xe0

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    mul-float/2addr v0, v1

    .line 16
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-float v2, v2

    .line 21
    div-float/2addr v0, v2

    .line 22
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    mul-float/2addr p0, v1

    .line 26
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-float p1, p1

    .line 31
    div-float/2addr p0, p1

    .line 32
    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    cmpl-float p1, p0, v1

    .line 37
    .line 38
    if-lez p1, :cond_0

    .line 39
    .line 40
    return v1

    .line 41
    :cond_0
    return p0
.end method


# virtual methods
.method public process(Ll/omw;)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return-object v2

    .line 9
    :cond_0
    iget-object v3, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 10
    .line 11
    if-nez v3, :cond_1

    .line 12
    .line 13
    new-instance v3, Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 14
    .line 15
    invoke-direct {v3}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v3, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 19
    .line 20
    :cond_1
    iget-boolean v3, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoading:Z

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    if-nez v3, :cond_2

    .line 24
    .line 25
    iget-boolean v3, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoadSuccess:Z

    .line 26
    .line 27
    if-nez v3, :cond_2

    .line 28
    .line 29
    iget-object v3, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->licensePath:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_2

    .line 36
    .line 37
    iget-object v3, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->modelPath:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_2

    .line 44
    .line 45
    iput-boolean v4, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoading:Z

    .line 46
    .line 47
    new-instance v3, Ljava/lang/Thread;

    .line 48
    .line 49
    new-instance v5, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;

    .line 50
    .line 51
    invoke-direct {v5, v0}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor$1;-><init>(Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {v3, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 58
    .line 59
    .line 60
    :cond_2
    iget-boolean v3, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoadSuccess:Z

    .line 61
    .line 62
    if-nez v3, :cond_3

    .line 63
    .line 64
    return-object v2

    .line 65
    :cond_3
    iget-object v5, v1, Ll/omw;->g:[B

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/omw;->m()I

    .line 68
    .line 69
    .line 70
    move-result v9

    .line 71
    invoke-virtual {v1}, Ll/omw;->t()I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    iget v2, v1, Ll/omw;->d:I

    .line 76
    .line 77
    iget-boolean v1, v1, Ll/omw;->a:Z

    .line 78
    .line 79
    invoke-direct {v0, v9, v8}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->getPreferSampleSize(II)F

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    int-to-float v6, v9

    .line 84
    mul-float/2addr v6, v3

    .line 85
    float-to-int v6, v6

    .line 86
    int-to-float v7, v8

    .line 87
    mul-float/2addr v7, v3

    .line 88
    float-to-int v3, v7

    .line 89
    rem-int/lit8 v7, v6, 0x2

    .line 90
    .line 91
    if-nez v7, :cond_5

    .line 92
    .line 93
    rem-int/lit8 v7, v3, 0x2

    .line 94
    .line 95
    if-eqz v7, :cond_4

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_4
    :goto_0
    move v10, v3

    .line 99
    move v11, v6

    .line 100
    goto :goto_2

    .line 101
    :cond_5
    :goto_1
    shr-int/lit8 v6, v6, 0x1

    .line 102
    .line 103
    shl-int/2addr v6, v4

    .line 104
    shr-int/lit8 v3, v3, 0x1

    .line 105
    .line 106
    shl-int/2addr v3, v4

    .line 107
    goto :goto_0

    .line 108
    :goto_2
    mul-int v3, v11, v10

    .line 109
    .line 110
    mul-int/lit8 v3, v3, 0x4

    .line 111
    .line 112
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    const/4 v4, 0x0

    .line 117
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 118
    .line 119
    .line 120
    sget-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->BEF_AI_PIX_FMT_NV21:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;

    .line 121
    .line 122
    invoke-virtual {v4}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    if-eqz v1, :cond_6

    .line 127
    .line 128
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    sget-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_270:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 133
    .line 134
    iget v12, v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 135
    .line 136
    const/4 v13, 0x1

    .line 137
    invoke-static/range {v5 .. v13}, Lcom/effectsar/labcv/effectsdk/YUVUtils;->YUV2RGBA([B[BIIIIIIZ)V

    .line 138
    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_6
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    sget-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_90:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 146
    .line 147
    iget v12, v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 148
    .line 149
    const/4 v13, 0x0

    .line 150
    invoke-static/range {v5 .. v13}, Lcom/effectsar/labcv/effectsdk/YUVUtils;->YUV2RGBA([B[BIIIIIIZ)V

    .line 151
    .line 152
    .line 153
    :goto_3
    const/16 v1, 0x5a

    .line 154
    .line 155
    if-eq v2, v1, :cond_9

    .line 156
    .line 157
    const/16 v1, 0xb4

    .line 158
    .line 159
    if-eq v2, v1, :cond_8

    .line 160
    .line 161
    const/16 v1, 0x10e

    .line 162
    .line 163
    if-eq v2, v1, :cond_7

    .line 164
    .line 165
    sget-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_0:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 166
    .line 167
    :goto_4
    move-object/from16 v16, v1

    .line 168
    .line 169
    goto :goto_5

    .line 170
    :cond_7
    sget-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_270:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_8
    sget-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_180:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_9
    sget-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_90:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 177
    .line 178
    goto :goto_4

    .line 179
    :goto_5
    iget-object v0, v0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 180
    .line 181
    sget-object v12, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->RGBA8888:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;

    .line 182
    .line 183
    mul-int/lit8 v15, v11, 0x4

    .line 184
    .line 185
    const/16 v17, 0x0

    .line 186
    .line 187
    move v14, v10

    .line 188
    move v13, v11

    .line 189
    move-object v10, v0

    .line 190
    move-object v11, v3

    .line 191
    invoke-virtual/range {v10 .. v17}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->detectMatting(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;Z)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    return-object v0
.end method

.method public bridge synthetic process(Ll/omw;)Ljava/lang/Object;
    .locals 0

    .line 196
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->process(Ll/omw;)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;

    move-result-object p0

    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoading:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->isLoadSuccess:Z

    .line 15
    .line 16
    return-void
.end method

.method public setModelPath(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->licensePath:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/ByteDanceSegmentProcessor;->modelPath:Ljava/lang/String;

    .line 27
    .line 28
    :cond_0
    return-void
.end method
