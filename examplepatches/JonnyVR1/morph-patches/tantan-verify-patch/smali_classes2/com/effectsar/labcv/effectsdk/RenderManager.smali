.class public Lcom/effectsar/labcv/effectsdk/RenderManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static mLoadLib:Z

.field private static mLogCallBack:Lcom/effectsar/labcv/effectsdk/LogCallBack;


# instance fields
.field private volatile mInited:Z

.field private mNativePtr:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-boolean p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mLoadLib:Z

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/effectsar/labcv/effectsdk/RenderManager;->loadLib()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    sput-boolean p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mLoadLib:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static formatErrorCode(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeFormatErrorCode(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mLoadLib:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/effectsar/labcv/effectsdk/RenderManager;->loadLib()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    sput-boolean v0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mLoadLib:Z

    .line 10
    .line 11
    :cond_0
    invoke-static {}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeGetSDKVersion()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static loadLib()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsatisfiedLinkError;
        }
    .end annotation

    .line 1
    :try_start_0
    const-string v0, "effect"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 7
    .line 8
    const-string v1, "RenderManager_jni: library load!"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception v0

    .line 15
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 16
    .line 17
    const-string v2, "WARNING: RenderManager_jni Could not load library in default path!"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private native nativeARCoreUpdateFrame(Ljava/lang/Object;)I
.end method

.method private native nativeAlgorithmBuffer(Ljava/nio/ByteBuffer;IIIIID)I
.end method

.method private native nativeAlgorithmTextureWithBuffer(ILjava/nio/ByteBuffer;IIIIID)I
.end method

.method private native nativeAppendComposerNodes([Ljava/lang/String;)I
.end method

.method private native nativeCheckLicenseBase(Ljava/lang/String;Z)I
.end method

.method private native nativeCleanPipeline()I
.end method

.method public static native nativeClearRuntimeFeatureCache()I
.end method

.method public static native nativeDestoryFeatureExtract()I
.end method

.method private native nativeDeviceConfig(ZZZZ)I
.end method

.method private native nativeEnableAlgorithmPictureMode(Z)I
.end method

.method public static native nativeEnableFeatureExtract(Z)I
.end method

.method private static native nativeFormatErrorCode(I)Ljava/lang/String;
.end method

.method private native nativeGetAvailableFeatures([Ljava/lang/String;)I
.end method

.method private native nativeGetCapturedImageWithKey(Ljava/lang/String;Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefCapturedImageInfo;)I
.end method

.method private native nativeGetFaceDetectResult(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;)I
.end method

.method private native nativeGetFaceMaskResult(ILcom/effectsar/labcv/effectsdk/BefFaceInfo;)I
.end method

.method private native nativeGetHandDetectResult(Lcom/effectsar/labcv/effectsdk/BefHandInfo;)I
.end method

.method public static native nativeGetRuntimeFeatureKeyMap()Ljava/lang/String;
.end method

.method public static native nativeGetSDKVersion()Ljava/lang/String;
.end method

.method private native nativeGetSkeletonDetectResult(Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;)I
.end method

.method public static native nativeGetSupportFeatureKeyMap()Ljava/lang/String;
.end method

.method private native nativeInit(Landroid/content/Context;Lcom/bef/effectsdk/ResourceFinder;Ljava/lang/String;ZZI)I
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZI)I
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZI)I
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)I
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)I
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZI)I
.end method

.method private native nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/nio/ByteBuffer;ILjava/lang/String;ZZZI)I
.end method

.method public static native nativeInitFeatureExtract()I
.end method

.method private native nativeInitWithPipelineAssetFile_CheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeInitWithPipelineAssetFile_PostCheckLicense(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)I
.end method

.method private native nativeInitWithPipelineAssetFile_PreCheckLicense(Landroid/content/Context;)I
.end method

.method private native nativeLoadWithTimeout(I)I
.end method

.method private native nativeOnAcceleratorChanged(DDDD)I
.end method

.method private native nativeOnGravityChanged(DDDD)I
.end method

.method private native nativeOnGyroscopeChanged(DDDD)I
.end method

.method private native nativeOnOrientationChanged([DID)I
.end method

.method private native nativeProcess(IIIIID)I
.end method

.method private native nativeProcessBuffer(Ljava/nio/ByteBuffer;IIIII[BID)I
.end method

.method private native nativeProcessGesture(IFFFFF)I
.end method

.method private native nativeProcessTexture(IIIIID)I
.end method

.method private native nativeProcessTouch(IFFFFII)I
.end method

.method private native nativeRelease()V
.end method

.method private native nativeRemoveComposerNodes([Ljava/lang/String;)I
.end method

.method private native nativeRemoveLogCallback()I
.end method

.method private native nativeRemoveRenderCacheExternalTexture(Ljava/lang/String;)I
.end method

.method private native nativeResetSticker()I
.end method

.method private native nativeScaleSlam(F)I
.end method

.method private native nativeSendMessage(IJJLjava/lang/String;)I
.end method

.method private native nativeSet3buffer(Z)I
.end method

.method private native nativeSetAlgorithmForceDetect(Z)I
.end method

.method private static native nativeSetAssetManager(Landroid/content/Context;)V
.end method

.method private native nativeSetBeauty(Ljava/lang/String;)I
.end method

.method private native nativeSetBgmMute(Z)I
.end method

.method private native nativeSetCameraPosition(Z)I
.end method

.method private native nativeSetComposer(Ljava/lang/String;)I
.end method

.method private native nativeSetComposerMode(II)I
.end method

.method private native nativeSetComposerNodes([Ljava/lang/String;[Ljava/lang/String;)I
.end method

.method private native nativeSetDeviceRotation([F)I
.end method

.method private native nativeSetEnableARCore(Z)V
.end method

.method private native nativeSetFaceDetectInterval(I)I
.end method

.method private native nativeSetFilter(Ljava/lang/String;)I
.end method

.method private native nativeSetImageMode(Z)I
.end method

.method private native nativeSetLogCallback()I
.end method

.method private native nativeSetLogLevel(I)V
.end method

.method private native nativeSetMakeUp(Ljava/lang/String;)I
.end method

.method private native nativeSetPipeline(Z)I
.end method

.method private native nativeSetRenderAPI(I)I
.end method

.method private native nativeSetRenderCacheExternalTexture(Ljava/lang/String;III)I
.end method

.method private native nativeSetRenderCacheExternalTextureWithRotation(Ljava/lang/String;IIII)I
.end method

.method private native nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/nio/ByteBuffer;IIIII)I
.end method

.method private native nativeSetReshape(Ljava/lang/String;)I
.end method

.method private native nativeSetSticker(Ljava/lang/String;)I
.end method

.method private native nativeUpdateComposer(Ljava/lang/String;Ljava/lang/String;F)I
.end method

.method private native nativeUpdateIntensity(IF)I
.end method

.method private native nativeUpdateReshape(FF)I
.end method

.method private native nativeUseBuiltinSensor(Z)I
.end method

.method public static setAssetManager(Landroid/content/Context;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mLoadLib:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/effectsar/labcv/effectsdk/RenderManager;->loadLib()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    sput-boolean v0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mLoadLib:Z

    .line 10
    .line 11
    :cond_0
    invoke-static {p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetAssetManager(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public ARCoreUpdateFrame(Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeARCoreUpdateFrame(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public SetBgmMute(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetBgmMute(Z)I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public SetEnableARCore(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetEnableARCore(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public SetFaceDetectInterval(I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetFaceDetectInterval(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public SetFaceForceDetect(Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetAlgorithmForceDetect(Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public algorithmBuffer(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;IIIIJ)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    iget p2, p2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 8
    .line 9
    invoke-virtual {p0, p7, p8}, Lcom/effectsar/labcv/effectsdk/RenderManager;->getSurfaceTimeStamp(J)D

    .line 10
    .line 11
    .line 12
    move-result-wide p7

    .line 13
    invoke-direct/range {p0 .. p8}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeAlgorithmBuffer(Ljava/nio/ByteBuffer;IIIIID)I

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

.method public algorithmTextureWithBuffer(ILjava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;IIIIJ)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    iget p3, p3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 8
    .line 9
    invoke-virtual {p0, p8, p9}, Lcom/effectsar/labcv/effectsdk/RenderManager;->getSurfaceTimeStamp(J)D

    .line 10
    .line 11
    .line 12
    move-result-wide p8

    .line 13
    invoke-direct/range {p0 .. p9}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeAlgorithmTextureWithBuffer(ILjava/nio/ByteBuffer;IIIIID)I

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

.method public appendComposerNodes([Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeAppendComposerNodes([Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public checkLicenseBase(Ljava/lang/String;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeCheckLicenseBase(Ljava/lang/String;Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public cleanPipeline()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeCleanPipeline()I

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

.method public deviceConfig(ZZZZ)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeDeviceConfig(ZZZZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public enableAlgorithmPictureMode(Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeEnableAlgorithmPictureMode(Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getAvailableFeatures([Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeGetAvailableFeatures([Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public getCapturedImageWithKey(Ljava/lang/String;Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefCapturedImageInfo;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeGetCapturedImageWithKey(Ljava/lang/String;Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefCapturedImageInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getFaceDetectResult()Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, v0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeGetFaceDetectResult(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    return-object v0
.end method

.method public getFaceMaskResult(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceMaskType;Lcom/effectsar/labcv/effectsdk/BefFaceInfo;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-nez p2, :cond_1

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_1
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$FaceMaskType;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-direct {p0, v0, p2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeGetFaceMaskResult(ILcom/effectsar/labcv/effectsdk/BefFaceInfo;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void
.end method

.method public getHandDetectResult()Lcom/effectsar/labcv/effectsdk/BefHandInfo;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    new-instance v0, Lcom/effectsar/labcv/effectsdk/BefHandInfo;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/BefHandInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeGetHandDetectResult(Lcom/effectsar/labcv/effectsdk/BefHandInfo;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    return-object v0
.end method

.method public getSkeletonDetectResult()Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    new-instance v0, Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeGetSkeletonDetectResult(Lcom/effectsar/labcv/effectsdk/BefSkeletonInfo;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    return-object v0
.end method

.method public getSurfaceTimeStamp(J)D
    .locals 10

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long v2, v0, p1

    .line 6
    .line 7
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    sub-long/2addr v4, p1

    .line 16
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v6

    .line 24
    const-wide/32 v8, 0xf4240

    .line 25
    .line 26
    .line 27
    mul-long/2addr v6, v8

    .line 28
    sub-long/2addr v6, p1

    .line 29
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    invoke-static {v2, v3, p0, p1}, Ljava/lang/Math;->min(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide p0

    .line 41
    sub-long/2addr v0, p0

    .line 42
    long-to-double p0, v0

    .line 43
    const-wide v0, 0x41cdcd6500000000L    # 1.0E9

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    div-double/2addr p0, v0

    .line 49
    return-wide p0
.end method

.method public init(Landroid/content/Context;Lcom/bef/effectsdk/ResourceFinder;Ljava/lang/String;ZZI)I
    .locals 2

    .line 41
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 42
    invoke-direct/range {p0 .. p6}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInit(Landroid/content/Context;Lcom/bef/effectsdk/ResourceFinder;Ljava/lang/String;ZZI)I

    move-result p1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    .line 43
    :cond_0
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    return p1

    :cond_1
    return v1
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 37
    invoke-virtual/range {v0 .. v5}, Lcom/effectsar/labcv/effectsdk/RenderManager;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZI)I

    move-result p0

    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZI)I
    .locals 2

    .line 44
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 45
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZI)I

    move-result p1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    .line 46
    :cond_0
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    return p1

    :cond_1
    return v1
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZI)I
    .locals 2

    .line 34
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 35
    invoke-direct/range {p0 .. p8}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZI)I

    move-result p1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    .line 36
    :cond_0
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    return p1

    :cond_1
    return v1
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZI)I
    .locals 7

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v6, p5

    .line 47
    invoke-virtual/range {v0 .. v6}, Lcom/effectsar/labcv/effectsdk/RenderManager;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)I

    move-result p0

    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)I
    .locals 2

    .line 38
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 39
    invoke-direct/range {p0 .. p6}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)I

    move-result p1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    .line 40
    :cond_0
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    return p1

    :cond_1
    return v1
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZI)I
    .locals 2

    .line 48
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 49
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZI)I

    move-result p1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    .line 50
    :cond_0
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    return p1

    :cond_1
    return v1
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/nio/ByteBuffer;Ljava/lang/String;ZZZI)I
    .locals 11

    .line 1
    iget-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 2
    .line 3
    const/4 v10, 0x0

    .line 4
    if-nez v1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move-object v2, p2

    .line 13
    move-object v3, p3

    .line 14
    move-object v5, p4

    .line 15
    move/from16 v6, p5

    .line 16
    .line 17
    move/from16 v7, p6

    .line 18
    .line 19
    move/from16 v8, p7

    .line 20
    .line 21
    move/from16 v9, p8

    .line 22
    .line 23
    invoke-direct/range {v0 .. v9}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInit(Landroid/content/Context;Ljava/lang/String;Ljava/nio/ByteBuffer;ILjava/lang/String;ZZZI)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    const/4 v10, 0x1

    .line 30
    :cond_0
    iput-boolean v10, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    return v10
.end method

.method public initCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInitWithPipelineAssetFile_CheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public initPostCheckLicense(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInitWithPipelineAssetFile_PostCheckLicense(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZI)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public initPreCheckLicense(Landroid/content/Context;)I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeInitWithPipelineAssetFile_PreCheckLicense(Landroid/content/Context;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    :cond_0
    iput-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 14
    .line 15
    return p1

    .line 16
    :cond_1
    return v1
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 2
    .line 3
    return p0
.end method

.method public loadResourceWithTimeout(I)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeLoadWithTimeout(I)I

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

.method public onAcceleratorChanged(DDDD)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeOnAcceleratorChanged(DDDD)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onGravityChanged(DDDD)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeOnGravityChanged(DDDD)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onGyroscopeChanged(DDDD)I
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeOnGyroscopeChanged(DDDD)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onOrientationChanged([DID)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeOnOrientationChanged([DID)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public processBuffer(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;IIII[BI)Z
    .locals 12
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v1, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 2
    .line 3
    const/4 v11, 0x0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    return v11

    .line 7
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    long-to-double v9, v1

    .line 12
    iget v2, p2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 13
    .line 14
    move-object v0, p0

    .line 15
    move-object v1, p1

    .line 16
    move v3, p3

    .line 17
    move/from16 v4, p4

    .line 18
    .line 19
    move/from16 v5, p5

    .line 20
    .line 21
    move/from16 v6, p6

    .line 22
    .line 23
    move-object/from16 v7, p7

    .line 24
    .line 25
    move/from16 v8, p8

    .line 26
    .line 27
    invoke-direct/range {v0 .. v10}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeProcessBuffer(Ljava/nio/ByteBuffer;IIIII[BID)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    return v0

    .line 35
    :cond_1
    return v11
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
    invoke-direct/range {p0 .. p6}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeProcessGesture(IFFFFF)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public processTexture(IIIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;J)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    iget p5, p5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 8
    .line 9
    invoke-virtual {p0, p6, p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->getSurfaceTimeStamp(J)D

    .line 10
    .line 11
    .line 12
    move-result-wide p6

    .line 13
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeProcess(IIIIID)I

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

.method public processTextureOnly(IIIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;J)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    iget p5, p5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 8
    .line 9
    invoke-virtual {p0, p6, p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->getSurfaceTimeStamp(J)D

    .line 10
    .line 11
    .line 12
    move-result-wide p6

    .line 13
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeProcessTexture(IIIIID)I

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

.method public processTouch(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TouchEventCode;FFFFII)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$TouchEventCode;->getCode()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeProcessTouch(IFFFFII)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public registerLogCallback(Lcom/effectsar/labcv/effectsdk/LogCallBack;)I
    .locals 0

    .line 1
    sput-object p1, Lcom/effectsar/labcv/effectsdk/RenderManager;->mLogCallBack:Lcom/effectsar/labcv/effectsdk/LogCallBack;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetLogCallback()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeRelease()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

    .line 10
    .line 11
    return-void
.end method

.method public removeComposerNodes([Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeRemoveComposerNodes([Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public removeLogCallback()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeRemoveLogCallback()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public removeRenderCacheExternalTexture(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeRemoveRenderCacheExternalTexture(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public resetSticker()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeResetSticker()I

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

.method public scaleSlam(F)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeScaleSlam(F)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public sendMessage(IJJLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSendMessage(IJJLjava/lang/String;)I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public set3Buffer(Z)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSet3buffer(Z)I

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

.method public setBeauty(Ljava/lang/String;)Z
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetBeauty(Ljava/lang/String;)I

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

.method public setCameraPostion(Z)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetCameraPosition(Z)I

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

.method public setComposer(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetComposer(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setComposerMode(II)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetComposerMode(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setComposerNodes([Ljava/lang/String;)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetComposerNodes([Ljava/lang/String;[Ljava/lang/String;)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public setComposerNodesWithTags([Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetComposerNodes([Ljava/lang/String;[Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setDeviceRotation([F)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetDeviceRotation([F)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setFilter(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetFilter(Ljava/lang/String;)I

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

.method public setImageMode(Z)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetImageMode(Z)I

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

.method public setLogLevel(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$LogLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$LogLevel;->getValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetLogLevel(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setMakeUp(Ljava/lang/String;)Z
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetMakeUp(Ljava/lang/String;)I

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

.method public setPipeline(Z)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetPipeline(Z)I

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

.method public setRenderAPI(I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetRenderAPI(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setRenderCacheExternalTexture(Ljava/lang/String;III)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetRenderCacheExternalTexture(Ljava/lang/String;III)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setRenderCacheExternalTextureWithRotation(Ljava/lang/String;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;)I
    .locals 0

    .line 1
    iget p5, p5, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 2
    .line 3
    invoke-direct/range {p0 .. p5}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetRenderCacheExternalTextureWithRotation(Ljava/lang/String;IIII)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetRenderCacheTexture(Ljava/lang/String;Ljava/nio/ByteBuffer;IIIII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public setReshape(Ljava/lang/String;)Z
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetReshape(Ljava/lang/String;)I

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

.method public setSticker(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/RenderManager;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeSetSticker(Ljava/lang/String;)I

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

.method public updateComposerNodes(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeUpdateComposer(Ljava/lang/String;Ljava/lang/String;F)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public updateIntensity(IF)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeUpdateIntensity(IF)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public updateReshape(FF)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeUpdateReshape(FF)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public useBuiltinSensor(Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/RenderManager;->nativeUseBuiltinSensor(Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
