.class public Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static isValid:Z = false

.field private static licensePath:Ljava/lang/String; = ""

.field private static modelPath:Ljava/lang/String; = ""

.field private static volatile portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static checkLicense()Z
    .locals 6

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    sget-object v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->licensePath:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;-><init>()V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 29
    .line 30
    :cond_1
    sget-object v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 31
    .line 32
    invoke-static {}, Ll/jv0;->a()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget-object v3, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->modelPath:Ljava/lang/String;

    .line 37
    .line 38
    sget-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;->BEF_PORTAITMATTING_SMALL_MODEL:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;

    .line 39
    .line 40
    sget-object v5, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->licensePath:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->init(Landroid/content/Context;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    return v0

    .line 50
    :cond_2
    :goto_0
    return v1
.end method

.method private static getPreferSampleSize(II)F
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    const/16 v2, 0xe0

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    int-to-float v1, v1

    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    mul-float/2addr v1, v2

    .line 16
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    div-float/2addr v1, v3

    .line 22
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 23
    .line 24
    int-to-float v0, v0

    .line 25
    mul-float/2addr v0, v2

    .line 26
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    int-to-float p0, p0

    .line 31
    div-float/2addr v0, p0

    .line 32
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    cmpl-float p1, p0, v2

    .line 37
    .line 38
    if-lez p1, :cond_0

    .line 39
    .line 40
    return v2

    .line 41
    :cond_0
    return p0
.end method

.method public static process([BIIIZ)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;
    .locals 11

    .line 1
    sget-boolean v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->isValid:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->checkLicense()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sput-boolean v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->isValid:Z

    .line 10
    .line 11
    :cond_0
    sget-boolean v0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->isValid:Z

    .line 12
    .line 13
    if-eqz v0, :cond_7

    .line 14
    .line 15
    invoke-static {p1, p2}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->getPreferSampleSize(II)F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v1, p1

    .line 20
    mul-float/2addr v1, v0

    .line 21
    float-to-int v1, v1

    .line 22
    int-to-float v2, p2

    .line 23
    mul-float/2addr v2, v0

    .line 24
    float-to-int v0, v2

    .line 25
    rem-int/lit8 v2, v1, 0x2

    .line 26
    .line 27
    if-nez v2, :cond_2

    .line 28
    .line 29
    rem-int/lit8 v2, v0, 0x2

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    move v7, v0

    .line 35
    move v8, v1

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    :goto_1
    shr-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    shl-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    shr-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    shl-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_2
    mul-int v0, v8, v7

    .line 47
    .line 48
    mul-int/lit8 v0, v0, 0x4

    .line 49
    .line 50
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 56
    .line 57
    .line 58
    sget-object v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->BEF_AI_PIX_FMT_NV21:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz p4, :cond_3

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    sget-object p4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_270:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 71
    .line 72
    iget v9, p4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 73
    .line 74
    const/4 v10, 0x1

    .line 75
    move-object v2, p0

    .line 76
    move v6, p1

    .line 77
    move v5, p2

    .line 78
    invoke-static/range {v2 .. v10}, Lcom/effectsar/labcv/effectsdk/YUVUtils;->YUV2RGBA([B[BIIIIIIZ)V

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_3
    move-object v2, p0

    .line 83
    move v6, p1

    .line 84
    move v5, p2

    .line 85
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    sget-object p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_90:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 90
    .line 91
    iget v9, p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 92
    .line 93
    const/4 v10, 0x0

    .line 94
    invoke-static/range {v2 .. v10}, Lcom/effectsar/labcv/effectsdk/YUVUtils;->YUV2RGBA([B[BIIIIIIZ)V

    .line 95
    .line 96
    .line 97
    :goto_3
    const/16 p0, 0x5a

    .line 98
    .line 99
    if-eq p3, p0, :cond_6

    .line 100
    .line 101
    const/16 p0, 0xb4

    .line 102
    .line 103
    if-eq p3, p0, :cond_5

    .line 104
    .line 105
    const/16 p0, 0x10e

    .line 106
    .line 107
    if-eq p3, p0, :cond_4

    .line 108
    .line 109
    sget-object p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_0:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_4
    sget-object p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_270:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_5
    sget-object p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_180:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_6
    sget-object p0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->CLOCKWISE_ROTATE_90:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;

    .line 119
    .line 120
    :goto_4
    sget-object v2, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->portraitMatting:Lcom/effectsar/labcv/effectsdk/PortraitMatting;

    .line 121
    .line 122
    sget-object v4, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->RGBA8888:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;

    .line 123
    .line 124
    move v6, v7

    .line 125
    mul-int/lit8 v7, v8, 0x4

    .line 126
    .line 127
    const/4 v9, 0x0

    .line 128
    move-object v3, v0

    .line 129
    move v5, v8

    .line 130
    move-object v8, p0

    .line 131
    invoke-virtual/range {v2 .. v9}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->detectMatting(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;Z)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0

    .line 136
    :cond_7
    const/4 p0, 0x0

    .line 137
    return-object p0
.end method

.method public static setLicensePath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->licensePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
