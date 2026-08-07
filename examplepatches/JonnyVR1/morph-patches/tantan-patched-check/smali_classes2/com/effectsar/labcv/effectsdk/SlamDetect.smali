.class public Lcom/effectsar/labcv/effectsdk/SlamDetect;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private volatile mCreateSuc:Z

.field private volatile mInited:Z

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
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mCreateSuc:Z

    .line 8
    .line 9
    return-void
.end method

.method private native nativeChecklicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeDestroy()V
.end method

.method private native nativeDetect(Ljava/nio/ByteBuffer;IIIIIDLcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;
.end method

.method private native nativeGetFeaturePoints()[Lcom/effectsar/labcv/effectsdk/BefSlamInfo$Points;
.end method

.method private native nativeGetIntrinsic(Ljava/lang/String;Ljava/lang/String;II)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;
.end method

.method private native nativeGetPlane(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;
.end method

.method private native nativeGetPlanePose(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;
.end method

.method private native nativeInit(Ljava/lang/String;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraInfo;Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;I)I
.end method

.method private native nativeInitCameraInfo(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraInfo;)V
.end method

.method private native nativeResetStatues()I
.end method

.method private native nativeSetImuData(ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuData;)I
.end method

.method private native nativeSetRotationVector([DD)I
.end method

.method private native nativeSetVersion(I)I
.end method


# virtual methods
.method public checklicense(Landroid/content/Context;Ljava/lang/String;Z)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mCreateSuc:Z

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
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeChecklicense(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 15
    .line 16
    return p1

    .line 17
    :cond_1
    const/4 p2, 0x1

    .line 18
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 19
    .line 20
    return p1
.end method

.method public destory()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeDestroy()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getCameraIntrinsic(Ljava/lang/String;Ljava/lang/String;II)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeGetIntrinsic(Ljava/lang/String;Ljava/lang/String;II)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraIntrinsic;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getFeaturePoints()[Lcom/effectsar/labcv/effectsdk/BefSlamInfo$Points;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeGetFeaturePoints()[Lcom/effectsar/labcv/effectsdk/BefSlamInfo$Points;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getPlane(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

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
    if-nez p1, :cond_1

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeGetPlane(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPlane;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getPlanePose(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

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
    if-nez p1, :cond_1

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeGetPlanePose(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraInfo;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamVersion;)I
    .locals 1

    .line 1
    invoke-virtual {p5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamVersion;->getValue()I

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    move-object v0, p4

    .line 6
    move-object p4, p3

    .line 7
    move-object p3, v0

    .line 8
    invoke-direct/range {p0 .. p5}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeInit(Ljava/lang/String;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraInfo;Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuInfo;I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mCreateSuc:Z

    .line 16
    .line 17
    return p1

    .line 18
    :cond_0
    const/4 p2, 0x1

    .line 19
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mCreateSuc:Z

    .line 20
    .line 21
    return p1
.end method

.method public initCameraInfo(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeInitCameraInfo(Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamCameraInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public resetStatues()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeResetStatues()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public setImuData(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamImuDataType;Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuData;)I
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamImuDataType;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeSetImuData(ILcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamImuData;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, -0x1

    .line 17
    return p0
.end method

.method public setRotationVector([DD)I
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeSetRotationVector([DD)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 14
    return p0
.end method

.method public setVersion(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamVersion;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamVersion;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeSetVersion(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public slamDetect(Ljava/nio/ByteBuffer;IIIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamDeviceOrientation;DLcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/SlamDetect;->mInited:Z

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
    if-nez p1, :cond_1

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_1
    invoke-virtual {p6}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$SlamDeviceOrientation;->getValue()I

    .line 11
    .line 12
    .line 13
    move-result p6

    .line 14
    invoke-direct/range {p0 .. p9}, Lcom/effectsar/labcv/effectsdk/SlamDetect;->nativeDetect(Ljava/nio/ByteBuffer;IIIIIDLcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamClickFlag;)Lcom/effectsar/labcv/effectsdk/BefSlamInfo$SlamPose;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
