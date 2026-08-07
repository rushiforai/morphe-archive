.class public Lcom/effectsar/labcv/effectsdk/FaceFitting;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;,
        Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshConfig;,
        Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingMeshInfo;
    }
.end annotation


# static fields
.field static final FaceFittingMaxFaceCount:I = 0x6


# instance fields
.field faceFittingResult:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;

.field private volatile mInited:Z

.field private mNativeCResultPtr:J

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
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mNativeCResultPtr:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mInited:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->faceFittingResult:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;

    .line 13
    .line 14
    return-void
.end method

.method private native nativeAllocCResult()V
.end method

.method private native nativeDestroy()I
.end method

.method private native nativeDetect(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;II[FLcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;)I
.end method

.method private native nativeFreeCResult()V
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
.end method

.method private native nativeSetParam(II)I
.end method


# virtual methods
.method public destroy()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mInited:Z

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
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/FaceFitting;->nativeFreeCResult()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/FaceFitting;->nativeDestroy()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public detect(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;II[F)I
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mInited:Z

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
    iget-object v5, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->faceFittingResult:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v1, p1

    .line 11
    move v2, p2

    .line 12
    move v3, p3

    .line 13
    move-object v4, p4

    .line 14
    invoke-direct/range {v0 .. v5}, Lcom/effectsar/labcv/effectsdk/FaceFitting;->nativeDetect(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;II[FLcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public getFaceFittingResult()Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->faceFittingResult:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/FaceFitting;->nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p2, 0x0

    .line 10
    :goto_0
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mInited:Z

    .line 11
    .line 12
    iget-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mInited:Z

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/FaceFitting;->nativeAllocCResult()V

    .line 17
    .line 18
    .line 19
    new-instance p2, Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;

    .line 20
    .line 21
    invoke-direct {p2}, Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->faceFittingResult:Lcom/effectsar/labcv/effectsdk/FaceFitting$FaceFittingResult;

    .line 25
    .line 26
    :cond_1
    return p1
.end method

.method public setParam(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;I)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/FaceFitting;->mInited:Z

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
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceFittingParam;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/FaceFitting;->nativeSetParam(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
