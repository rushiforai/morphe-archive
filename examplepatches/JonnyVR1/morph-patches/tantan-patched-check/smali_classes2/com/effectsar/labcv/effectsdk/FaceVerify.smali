.class public Lcom/effectsar/labcv/effectsdk/FaceVerify;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final SAME_FACE_SCORE:Ljava/lang/Double;


# instance fields
.field private volatile mInited:Z

.field private mNativeFacePtr:J

.field private mNativeVerifyPtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide v0, 0x4050e66666666666L    # 67.6

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->SAME_FACE_SCORE:Ljava/lang/Double;

    .line 11
    .line 12
    :try_start_0
    const-string v0, "effect"

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
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
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 6
    .line 7
    return-void
.end method

.method private native nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeCreateHandle(Ljava/lang/String;Ljava/lang/String;I)I
.end method

.method private native nativeDistanceToScore(D)D
.end method

.method private native nativeExtractFeature(Ljava/nio/ByteBuffer;IIIIILcom/effectsar/labcv/effectsdk/BefFaceFeature;)I
.end method

.method private native nativeExtractFeatureSingle(Ljava/nio/ByteBuffer;IIIIILcom/effectsar/labcv/effectsdk/BefFaceFeature;)I
.end method

.method private native nativeRelease()V
.end method

.method private native nativeVerify([F[F)D
.end method


# virtual methods
.method public distToScore(D)D
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->nativeDistanceToScore(D)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public extractFeature(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;)Lcom/effectsar/labcv/effectsdk/BefFaceFeature;
    .locals 9

    .line 1
    iget-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 2
    .line 3
    const/4 v8, 0x0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return-object v8

    .line 7
    :cond_0
    new-instance v7, Lcom/effectsar/labcv/effectsdk/BefFaceFeature;

    .line 8
    .line 9
    invoke-direct {v7}, Lcom/effectsar/labcv/effectsdk/BefFaceFeature;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget v6, p6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 17
    .line 18
    move-object v0, p0

    .line 19
    move-object v1, p1

    .line 20
    move v3, p3

    .line 21
    move v4, p4

    .line 22
    move v5, p5

    .line 23
    invoke-direct/range {v0 .. v7}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->nativeExtractFeature(Ljava/nio/ByteBuffer;IIIIILcom/effectsar/labcv/effectsdk/BefFaceFeature;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "nativeVerifyFace return "

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "bef_effect_ai"

    .line 44
    .line 45
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    return-object v8

    .line 49
    :cond_1
    return-object v7
.end method

.method public extractFeatureSingle(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;)Lcom/effectsar/labcv/effectsdk/BefFaceFeature;
    .locals 9

    .line 1
    iget-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 2
    .line 3
    const/4 v8, 0x0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return-object v8

    .line 7
    :cond_0
    new-instance v7, Lcom/effectsar/labcv/effectsdk/BefFaceFeature;

    .line 8
    .line 9
    invoke-direct {v7}, Lcom/effectsar/labcv/effectsdk/BefFaceFeature;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget v6, p6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 17
    .line 18
    move-object v0, p0

    .line 19
    move-object v1, p1

    .line 20
    move v3, p3

    .line 21
    move v4, p4

    .line 22
    move v5, p5

    .line 23
    invoke-direct/range {v0 .. v7}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->nativeExtractFeatureSingle(Ljava/nio/ByteBuffer;IIIIILcom/effectsar/labcv/effectsdk/BefFaceFeature;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "nativeVerifyFace return "

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "bef_effect_ai"

    .line 44
    .line 45
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    return-object v8

    .line 49
    :cond_1
    return-object v7
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)I
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    .line 29
    invoke-virtual/range {v0 .. v6}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Z)I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-direct {p0, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->nativeCreateHandle(Ljava/lang/String;Ljava/lang/String;I)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 14
    .line 15
    return p2

    .line 16
    :cond_1
    invoke-direct {p0, p1, p5, p6}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 23
    .line 24
    return p1

    .line 25
    :cond_2
    const/4 p2, 0x1

    .line 26
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 27
    .line 28
    return p1
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->nativeRelease()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceVerify;->mInited:Z

    .line 10
    .line 11
    return-void
.end method

.method public verify([F[F)D
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/FaceVerify;->nativeVerify([F[F)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method
