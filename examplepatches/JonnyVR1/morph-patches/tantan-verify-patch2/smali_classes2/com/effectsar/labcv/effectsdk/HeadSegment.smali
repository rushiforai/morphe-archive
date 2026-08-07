.class public Lcom/effectsar/labcv/effectsdk/HeadSegment;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
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
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HeadSegment;->inited:Z

    .line 6
    .line 7
    return-void
.end method

.method private native nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeCreateHandle()I
.end method

.method private native nativeInitModel(Ljava/lang/String;)I
.end method

.method private native nativeProcess(Ljava/nio/ByteBuffer;IIIII[[FLcom/effectsar/labcv/effectsdk/BefHeadSegInfo;)I
.end method

.method private native nativeRelease()I
.end method

.method private native nativeSetParam(IF)I
.end method

.method private serializeFace106([Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;)[[F
    .locals 8

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    array-length p0, p1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    goto :goto_2

    .line 7
    :cond_0
    array-length p0, p1

    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/16 v2, 0xd4

    .line 13
    .line 14
    aput v2, v0, v1

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    aput p0, v0, v2

    .line 18
    .line 19
    sget-object p0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 20
    .line 21
    invoke-static {p0, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, [[F

    .line 26
    .line 27
    move v0, v2

    .line 28
    :goto_0
    array-length v3, p1

    .line 29
    if-ge v0, v3, :cond_2

    .line 30
    .line 31
    move v3, v2

    .line 32
    :goto_1
    const/16 v4, 0x6a

    .line 33
    .line 34
    if-ge v3, v4, :cond_1

    .line 35
    .line 36
    aget-object v4, p0, v0

    .line 37
    .line 38
    mul-int/lit8 v5, v3, 0x2

    .line 39
    .line 40
    aget-object v6, p1, v0

    .line 41
    .line 42
    iget-object v6, v6, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->points_array:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 43
    .line 44
    aget-object v6, v6, v3

    .line 45
    .line 46
    iget v7, v6, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->x:F

    .line 47
    .line 48
    aput v7, v4, v5

    .line 49
    .line 50
    add-int/2addr v5, v1

    .line 51
    iget v6, v6, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->y:F

    .line 52
    .line 53
    aput v6, v4, v5

    .line 54
    .line 55
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    return-object p0

    .line 62
    :cond_3
    :goto_2
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method


# virtual methods
.method public declared-synchronized init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 49
    :try_start_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HeadSegment;->inited:Z

    .line 3
    .line 4
    if-nez v0, :cond_3

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->nativeCreateHandle()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, p1, p3, p4}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_3

    .line 19
    :cond_0
    :goto_0
    const/4 p1, 0x1

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-direct {p0, p2}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->nativeInitModel(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    sget-object p2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;->BEF_AI_HS_ENABLE_TRACKING:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;

    .line 27
    .line 28
    invoke-virtual {p0, p2, p1}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->setParam(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;I)I

    .line 29
    .line 30
    .line 31
    sget-object p2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;->BEF_AI_HS_MAX_FACE:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;

    .line 32
    .line 33
    const/4 p3, 0x2

    .line 34
    invoke-virtual {p0, p2, p3}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->setParam(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;I)I

    .line 35
    .line 36
    .line 37
    :cond_1
    if-nez v0, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    const/4 p1, 0x0

    .line 41
    :goto_1
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/HeadSegment;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_3
    const/4 v0, -0x1

    .line 45
    :goto_2
    monitor-exit p0

    .line 46
    return v0

    .line 47
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    throw p1
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/HeadSegment;->inited:Z

    .line 2
    .line 3
    return p0
.end method

.method public process(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;)Lcom/effectsar/labcv/effectsdk/BefHeadSegInfo;
    .locals 10

    .line 1
    new-instance v8, Lcom/effectsar/labcv/effectsdk/BefHeadSegInfo;

    .line 2
    .line 3
    invoke-direct {v8}, Lcom/effectsar/labcv/effectsdk/BefHeadSegInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    move-object/from16 v0, p7

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->serializeFace106([Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;)[[F

    .line 9
    .line 10
    .line 11
    move-result-object v7

    .line 12
    const/4 v9, 0x0

    .line 13
    if-nez v7, :cond_0

    .line 14
    .line 15
    return-object v9

    .line 16
    :cond_0
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    move-object/from16 p2, p6

    .line 21
    .line 22
    iget v6, p2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 23
    .line 24
    move-object v0, p0

    .line 25
    move-object v1, p1

    .line 26
    move v3, p3

    .line 27
    move v4, p4

    .line 28
    move v5, p5

    .line 29
    invoke-direct/range {v0 .. v8}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->nativeProcess(Ljava/nio/ByteBuffer;IIIII[[FLcom/effectsar/labcv/effectsdk/BefHeadSegInfo;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string p2, "headseg failed with "

    .line 38
    .line 39
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "bef_effect_ai"

    .line 50
    .line 51
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    return-object v9

    .line 55
    :cond_1
    return-object v8
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HeadSegment;->inited:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->nativeRelease()I

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HeadSegment;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public declared-synchronized setParam(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;I)I
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$HeadSegmentParamType;->getValue()I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    int-to-float p2, p2

    .line 7
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/HeadSegment;->nativeSetParam(IF)I

    .line 8
    .line 9
    .line 10
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    monitor-exit p0

    .line 12
    return p1

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method
