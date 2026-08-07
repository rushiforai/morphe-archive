.class public Lcom/effectsar/labcv/effectsdk/HalEffect;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private volatile mInited:Z

.field private mNativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "effect"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
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

.method private native nativeAppendComposerNodes([Ljava/lang/String;)I
.end method

.method private native nativeCleanPipeline()I
.end method

.method private native nativeGetFaceDetectResult(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;)I
.end method

.method private native nativeInit(Ljava/lang/String;Ljava/lang/String;ZII)I
.end method

.method private native nativeProcessBuffer([B[BIIIII)I
.end method

.method private native nativeProcessBufferWithFaceInfo([B[BIIIIIILcom/effectsar/labcv/effectsdk/BefFaceInfo;)I
.end method

.method private native nativeProcessGesture(IFFFFF)I
.end method

.method private native nativeProcessTouch(IFFFFII)I
.end method

.method private native nativeRelease()V
.end method

.method private native nativeRemoveComposerNodes([Ljava/lang/String;)I
.end method

.method private native nativeSetCameraPosition(Z)I
.end method

.method private native nativeSetComposer(Ljava/lang/String;)I
.end method

.method private native nativeSetComposerNodes([Ljava/lang/String;[Ljava/lang/String;)I
.end method

.method private native nativeSetFilter(Ljava/lang/String;)I
.end method

.method private native nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/nio/ByteBuffer;IIIII)I
.end method

.method private native nativeSetSticker(Ljava/lang/String;)I
.end method

.method private native nativeUpdateComposer(Ljava/lang/String;Ljava/lang/String;FZ)I
.end method

.method private native nativeUpdateIntensity(IF)I
.end method


# virtual methods
.method public appendComposerNodes([Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeAppendComposerNodes([Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public cleanPipeline()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeCleanPipeline()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    return v1
.end method

.method public getFaceDetectResult()Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    new-instance v0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeGetFaceDetectResult(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "nativeGetFaceDetectResult return "

    .line 21
    .line 22
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "bef_effect_ai"

    .line 33
    .line 34
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-object v1

    .line 38
    :cond_1
    return-object v0
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;ZII)I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    move-object v2, p2

    .line 7
    move-object p2, p1

    .line 8
    move-object p1, v2

    .line 9
    invoke-direct/range {p0 .. p5}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeInit(Ljava/lang/String;Ljava/lang/String;ZII)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    :cond_0
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 17
    .line 18
    return p1

    .line 19
    :cond_1
    return v1
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    return p0
.end method

.method public processBuffer([B[BIIIII)Z
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    move v2, p6

    .line 8
    move p6, p3

    .line 9
    move p3, p5

    .line 10
    move p5, p7

    .line 11
    move p7, p4

    .line 12
    move p4, v2

    .line 13
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeProcessBuffer([B[BIIIII)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    return v1
.end method

.method public processBufferWithFaceInfo([B[BIIIIIILcom/effectsar/labcv/effectsdk/BefFaceInfo;)Z
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    move v2, p6

    .line 8
    move p6, p3

    .line 9
    move p3, p5

    .line 10
    move p5, p7

    .line 11
    move p7, p4

    .line 12
    move p4, v2

    .line 13
    invoke-direct/range {p0 .. p9}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeProcessBufferWithFaceInfo([B[BIIIIIILcom/effectsar/labcv/effectsdk/BefFaceInfo;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    return v1
.end method

.method public processGesture(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$GestureEventCode;FFFFF)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$GestureEventCode;->getCode()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct/range {p0 .. p6}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeProcessGesture(IFFFFF)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public processTouch(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TouchEventCode;FFFFII)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TouchEventCode;->getCode()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeProcessTouch(IFFFFII)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeRelease()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 10
    .line 11
    return-void
.end method

.method public removeComposerNodes([Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeRemoveComposerNodes([Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public setCameraPostion(Z)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeSetCameraPosition(Z)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    return v1
.end method

.method public setComposerNodes([Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

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
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, v0}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeSetComposerNodes([Ljava/lang/String;[Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public setComposerNodesWithTags([Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

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
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeSetComposerNodes([Ljava/lang/String;[Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public setFilter(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    :cond_1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeSetFilter(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_2
    return v1
.end method

.method public setRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setRenderCacheTextureWithBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;)I
    .locals 0

    .line 1
    invoke-virtual {p6}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    iget p7, p7, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 6
    .line 7
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/nio/ByteBuffer;IIIII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public setSticker(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    const-string p1, ""

    .line 10
    .line 11
    :cond_1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeSetSticker(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_2
    return v1
.end method

.method public updateComposerNodes(Ljava/lang/String;Ljava/lang/String;FZ)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

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
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeUpdateComposer(Ljava/lang/String;Ljava/lang/String;FZ)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public updateIntensity(IF)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HalEffect;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/HalEffect;->nativeUpdateIntensity(IF)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    return v1
.end method
