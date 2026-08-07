.class public Lcom/effectsar/labcv/effectsdk/SkySegment;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;
    }
.end annotation


# instance fields
.field private hasSky:Z

.field private inited:Z

.field private mNativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "effect"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->inited:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->hasSky:Z

    .line 8
    .line 9
    return-void
.end method

.method private native nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeCreateHandle()I
.end method

.method private native nativeDetect(Ljava/nio/ByteBuffer;IIIIIZZ[B)I
.end method

.method private native nativeGetShape([I)I
.end method

.method private native nativeInit(Ljava/lang/String;)I
.end method

.method private native nativeRelease()V
.end method

.method private native nativeSetParam(II)I
.end method


# virtual methods
.method public detectSky(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;ZZ)Lcom/effectsar/labcv/effectsdk/BefSkyInfo;
    .locals 15

    .line 1
    iget-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->inited:Z

    .line 2
    .line 3
    const/4 v10, 0x0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return-object v10

    .line 7
    :cond_0
    new-instance v11, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;

    .line 8
    .line 9
    invoke-direct {v11}, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v12, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;

    .line 13
    .line 14
    invoke-direct {v12, p0}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;-><init>(Lcom/effectsar/labcv/effectsdk/SkySegment;)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    new-array v1, v1, [I

    .line 19
    .line 20
    invoke-direct {p0, v1}, Lcom/effectsar/labcv/effectsdk/SkySegment;->nativeGetShape([I)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const-string v13, "nativeDetect return "

    .line 25
    .line 26
    const-string v14, "bef_effect_ai"

    .line 27
    .line 28
    if-nez v2, :cond_2

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    aget v3, v1, v2

    .line 32
    .line 33
    invoke-static {v12, v3}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$002(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;I)I

    .line 34
    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    aget v3, v1, v3

    .line 38
    .line 39
    invoke-static {v12, v3}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$102(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;I)I

    .line 40
    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    aget v1, v1, v3

    .line 44
    .line 45
    invoke-static {v12, v1}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$202(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;I)I

    .line 46
    .line 47
    .line 48
    invoke-static {v12}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$000(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v12}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$100(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    mul-int/2addr v1, v3

    .line 57
    invoke-static {v12}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$200(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    mul-int/2addr v1, v3

    .line 62
    new-array v1, v1, [B

    .line 63
    .line 64
    invoke-static {v12, v1}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$302(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;[B)[B

    .line 65
    .line 66
    .line 67
    invoke-static {v12}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$300(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)[B

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 72
    .line 73
    .line 74
    invoke-virtual/range {p2 .. p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    move-object/from16 v1, p6

    .line 79
    .line 80
    iget v6, v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 81
    .line 82
    invoke-static {v12}, Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;->access$300(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)[B

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    move-object v0, p0

    .line 87
    move-object/from16 v1, p1

    .line 88
    .line 89
    move/from16 v3, p3

    .line 90
    .line 91
    move/from16 v4, p4

    .line 92
    .line 93
    move/from16 v5, p5

    .line 94
    .line 95
    move/from16 v7, p7

    .line 96
    .line 97
    move/from16 v8, p8

    .line 98
    .line 99
    invoke-direct/range {v0 .. v9}, Lcom/effectsar/labcv/effectsdk/SkySegment;->nativeDetect(Ljava/nio/ByteBuffer;IIIIIZZ[B)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v0, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    return-object v10

    .line 121
    :cond_1
    invoke-virtual {v11, v12}, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;->setSkyMask(Lcom/effectsar/labcv/effectsdk/SkySegment$SkyMask;)V

    .line 122
    .line 123
    .line 124
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->hasSky:Z

    .line 125
    .line 126
    invoke-virtual {v11, v0}, Lcom/effectsar/labcv/effectsdk/BefSkyInfo;->setHasSky(Z)V

    .line 127
    .line 128
    .line 129
    return-object v11

    .line 130
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v0, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    return-object v10
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/effectsar/labcv/effectsdk/SkySegment;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->inited:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/SkySegment;->nativeCreateHandle()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1, p3, p4}, Lcom/effectsar/labcv/effectsdk/SkySegment;->nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :cond_0
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-direct {p0, p2}, Lcom/effectsar/labcv/effectsdk/SkySegment;->nativeInit(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    :cond_1
    if-nez v0, :cond_2

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_2
    const/4 p1, 0x0

    .line 26
    :goto_0
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->inited:Z

    .line 27
    .line 28
    return v0

    .line 29
    :cond_3
    const/4 p0, -0x1

    .line 30
    return p0
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->inited:Z

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->inited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/SkySegment;->nativeRelease()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SkySegment;->inited:Z

    .line 10
    .line 11
    return-void
.end method

.method public setParam(II)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/SkySegment;->nativeSetParam(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
