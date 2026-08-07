.class public Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mAmount:F

.field private mDiffImgSmoothEnable:I

.field private mEdgeWeightGamma:F

.field private mFrameHeight:I

.field private mFrameWidth:I

.field private mInited:Z

.field private mMaxHeight:I

.field private mMaxWidth:I

.field private mNativePtr:J

.field private mOverRatio:F

.field private mPowerLevel:I

.field private mSceneMode:I


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
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mFrameWidth:I

    .line 6
    .line 7
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mFrameHeight:I

    .line 8
    .line 9
    return-void
.end method

.method private native nativeCreate(Ljava/lang/String;IIIIFFFIZ)I
.end method

.method private native nativeProcess(ILcom/effectsar/labcv/effectsdk/BefTextureResultInfo;)I
.end method

.method private native nativeRelease()I
.end method

.method private native nativeSetProperty(IIIIFFFI)I
.end method


# virtual methods
.method public getmAmount()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mAmount:F

    .line 2
    .line 3
    return p0
.end method

.method public getmDiffImgSmoothEnable()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mDiffImgSmoothEnable:I

    .line 2
    .line 3
    return p0
.end method

.method public getmEdgeWeightGamma()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mEdgeWeightGamma:F

    .line 2
    .line 3
    return p0
.end method

.method public getmMaxHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mMaxHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getmMaxWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mMaxWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getmOverRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mOverRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getmPowerLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mPowerLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public getmSceneMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mSceneMode:I

    .line 2
    .line 3
    return p0
.end method

.method public init(Ljava/lang/String;IIIIFFFI)I
    .locals 11

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    .line 36
    invoke-virtual/range {v0 .. v10}, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->init(Ljava/lang/String;IIIIFFFIZ)I

    move-result p0

    return p0
.end method

.method public init(Ljava/lang/String;IIIIFFFIZ)I
    .locals 1

    .line 1
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mMaxHeight:I

    .line 2
    .line 3
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mMaxWidth:I

    .line 4
    .line 5
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mSceneMode:I

    .line 6
    .line 7
    iput p5, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mPowerLevel:I

    .line 8
    .line 9
    iput p6, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mAmount:F

    .line 10
    .line 11
    iput p7, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mOverRatio:F

    .line 12
    .line 13
    iput p8, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mEdgeWeightGamma:F

    .line 14
    .line 15
    iput p9, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mDiffImgSmoothEnable:I

    .line 16
    .line 17
    move v0, p5

    .line 18
    move p5, p2

    .line 19
    move p2, p4

    .line 20
    move p4, p3

    .line 21
    move p3, v0

    .line 22
    invoke-direct/range {p0 .. p10}, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->nativeCreate(Ljava/lang/String;IIIIFFFIZ)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mInited:Z

    .line 30
    .line 31
    return p1

    .line 32
    :cond_0
    const/4 p2, 0x1

    .line 33
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mInited:Z

    .line 34
    .line 35
    return p1
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mInited:Z

    .line 2
    .line 3
    return p0
.end method

.method public process(ILcom/effectsar/labcv/effectsdk/BefTextureResultInfo;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mInited:Z

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
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->nativeProcess(ILcom/effectsar/labcv/effectsdk/BefTextureResultInfo;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string p2, "nativeNightSceneProcess "

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "bef_effect_ai"

    .line 28
    .line 29
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_1
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->nativeRelease()I

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mInited:Z

    .line 10
    .line 11
    return-void
.end method

.method public setProperty(IIIIFFFI)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mInited:Z

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
    invoke-direct/range {p0 .. p8}, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->nativeSetProperty(IIIIFFFI)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string p1, "nativeSetProperty "

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "bef_effect_ai"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mFrameHeight:I

    .line 34
    .line 35
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mFrameWidth:I

    .line 36
    .line 37
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mSceneMode:I

    .line 38
    .line 39
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mPowerLevel:I

    .line 40
    .line 41
    iput p5, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mAmount:F

    .line 42
    .line 43
    iput p6, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mOverRatio:F

    .line 44
    .line 45
    iput p7, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mEdgeWeightGamma:F

    .line 46
    .line 47
    iput p8, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mDiffImgSmoothEnable:I

    .line 48
    .line 49
    return v0
.end method

.method public setmAmount(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mAmount:F

    .line 2
    .line 3
    return-void
.end method

.method public setmDiffImgSmoothEnable(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mDiffImgSmoothEnable:I

    .line 2
    .line 3
    return-void
.end method

.method public setmEdgeWeightGamma(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mEdgeWeightGamma:F

    .line 2
    .line 3
    return-void
.end method

.method public setmMaxHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mMaxHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setmMaxWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mMaxWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setmOverRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mOverRatio:F

    .line 2
    .line 3
    return-void
.end method

.method public setmPowerLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mPowerLevel:I

    .line 2
    .line 3
    return-void
.end method

.method public setmSceneMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/AdaptiveSharpen;->mSceneMode:I

    .line 2
    .line 3
    return-void
.end method
