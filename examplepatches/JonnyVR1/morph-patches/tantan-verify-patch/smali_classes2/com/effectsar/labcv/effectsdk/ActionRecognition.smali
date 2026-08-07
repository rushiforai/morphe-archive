.class public Lcom/effectsar/labcv/effectsdk/ActionRecognition;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mInited:Z

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
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private native nDestroy()I
.end method

.method private native nDetect(Ljava/nio/ByteBuffer;IIIIIILcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo;)I
.end method

.method private native nDetectPose(Ljava/nio/ByteBuffer;IIIIIILcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$PoseDetectResult;)I
.end method

.method private native nInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
.end method

.method private native nSetTemplate(Ljava/lang/String;)I
.end method

.method private native nSetTemplateThreshold(F)I
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->nDestroy()I

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 10
    .line 11
    return-void
.end method

.method public detect(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;I)Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo;
    .locals 10

    .line 1
    iget-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 2
    .line 3
    const/4 v9, 0x0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return-object v9

    .line 7
    :cond_0
    new-instance v8, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo;

    .line 8
    .line 9
    invoke-direct {v8}, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    move-object/from16 v1, p6

    .line 17
    .line 18
    iget v6, v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 19
    .line 20
    move-object v0, p0

    .line 21
    move-object v1, p1

    .line 22
    move v3, p3

    .line 23
    move v4, p4

    .line 24
    move v5, p5

    .line 25
    move/from16 v7, p7

    .line 26
    .line 27
    invoke-direct/range {v0 .. v8}, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->nDetect(Ljava/nio/ByteBuffer;IIIIIILcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    return-object v9

    .line 34
    :cond_1
    return-object v8
.end method

.method public detectPose(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;)Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$PoseDetectResult;
    .locals 10

    .line 1
    iget-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 2
    .line 3
    const/4 v9, 0x0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return-object v9

    .line 7
    :cond_0
    new-instance v8, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$PoseDetectResult;

    .line 8
    .line 9
    invoke-direct {v8}, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$PoseDetectResult;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    move-object/from16 v1, p7

    .line 17
    .line 18
    iget v6, v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 19
    .line 20
    move-object/from16 v1, p6

    .line 21
    .line 22
    iget v7, v1, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->id:I

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
    invoke-direct/range {v0 .. v8}, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->nDetectPose(Ljava/nio/ByteBuffer;IIIIIILcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$PoseDetectResult;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    return-object v9

    .line 36
    :cond_1
    return-object v8
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->nInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    const/4 p2, 0x1

    .line 12
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 13
    .line 14
    return p1
.end method

.method public setTemplate(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->nSetTemplate(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public setThreshold(F)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/ActionRecognition;->nSetTemplateThreshold(F)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
