.class public Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;,
        Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$YTSAFETYLEVEL;,
        Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveProcessState;,
        Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;
    }
.end annotation


# static fields
.field public static ERRCODE_GET_ACTREFLECTDATA_FAILED:I = 0x4

.field public static ERRCODE_JNI_DETECT_FAILED:I = 0x3

.field public static ERRCODE_JSON_DECODE_FAILED:I = 0x2

.field public static ERRCODE_NET_RETURN_PARSE_NULL:I = 0x0

.field public static ERRCODE_UPLOAD_VIDEO_FAILED:I = 0x1

.field public static final TAG:Ljava/lang/String; = "YoutuLightLiveCheck"

.field public static final VERSION:Ljava/lang/String; = "3.6.9.2"

.field public static initLock:Ljava/util/concurrent/locks/Lock; = null

.field public static mAGSettings:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings; = null

.field public static mAppId:Ljava/lang/String; = ""

.field public static mCamera:Landroid/hardware/Camera;

.field public static mCameraRotatedTag:I

.field public static mCheckResult:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;

.field public static mColorSeq:Ljava/lang/String;

.field public static mInitModel:I

.field public static mOnGetValueCount:I

.field public static mOverlayAlpha:I

.field public static mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

.field public static mReflectNotice:Lcom/tencent/youtu/ytagreflectlivecheck/notice/a;

.field public static mState:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAGSettings:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I

    .line 10
    .line 11
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 17
    .line 18
    sput v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mOverlayAlpha:I

    .line 19
    .line 20
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

.method public static cancel()V
    .locals 2

    .line 1
    const-string v0, "YoutuLightLiveCheck"

    .line 2
    .line 3
    const-string v1, "[YTAGReflectLiveCheckInterface.cancel] --- "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRRelease()I

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static getAGSettings()Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAGSettings:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getReflectListener()Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

    .line 2
    .line 3
    return-object v0
.end method

.method public static declared-synchronized initModel(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 1
    const-string v0, "initModel failed. message: "

    .line 2
    .line 3
    const-class v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget-object v2, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 7
    .line 8
    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 9
    .line 10
    .line 11
    sget v2, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I

    .line 12
    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    const-string p0, "YoutuLightLiveCheck"

    .line 16
    .line 17
    const-string v2, "initModel repeated calls."

    .line 18
    .line 19
    invoke-static {p0, v2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_3

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    sput-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAppId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    const-string p0, ""

    .line 32
    .line 33
    sput-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAppId:Ljava/lang/String;

    .line 34
    .line 35
    :cond_1
    :goto_0
    sget p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I

    .line 36
    .line 37
    add-int/lit8 p0, p0, 0x1

    .line 38
    .line 39
    sput p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    :try_start_1
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    goto :goto_2

    .line 48
    :catchall_1
    move-exception p0

    .line 49
    goto :goto_4

    .line 50
    :goto_1
    const-string v2, "YoutuLightLiveCheck"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 51
    .line 52
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v2, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    .line 70
    .line 71
    :try_start_3
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 72
    .line 73
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 74
    .line 75
    .line 76
    const/4 p0, -0x1

    .line 77
    :goto_2
    invoke-static {p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->SetPipelineVersion(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 78
    .line 79
    .line 80
    monitor-exit v1

    .line 81
    return p0

    .line 82
    :goto_3
    :try_start_4
    sget-object p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 83
    .line 84
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 85
    .line 86
    .line 87
    throw p0

    .line 88
    :goto_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 89
    throw p0
.end method

.method public static onCameraChanged(I)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception p0

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "on camera changed failed:"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "YoutuLightLiveCheck"

    .line 36
    .line 37
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static onFetchCameraInfo()[I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getExposureCompensation()I

    .line 9
    .line 10
    .line 11
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 12
    :try_start_1
    const-string v3, "iso"

    .line 13
    .line 14
    invoke-virtual {v1, v3}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception v3

    .line 30
    :try_start_2
    invoke-static {v3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    :cond_0
    :goto_0
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    .line 34
    .line 35
    .line 36
    move-result v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 37
    :try_start_3
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    .line 38
    .line 39
    .line 40
    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 41
    goto :goto_2

    .line 42
    :catch_1
    move-exception v1

    .line 43
    goto :goto_1

    .line 44
    :catch_2
    move-exception v1

    .line 45
    move v3, v0

    .line 46
    goto :goto_1

    .line 47
    :catch_3
    move-exception v1

    .line 48
    move v2, v0

    .line 49
    move v3, v2

    .line 50
    :goto_1
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    :goto_2
    filled-new-array {v2, v3, v0}, [I

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    return-object v0
.end method

.method public static onFinish()V
    .locals 14

    .line 1
    const-string v0, "on finished"

    .line 2
    .line 3
    const-string v1, "YoutuLightLiveCheck"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCameraRotatedTag:I

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v2, v3, v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRDoDetectionYuvs(ZI)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "on finished "

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v1, v2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRGetAGin()Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/FullPack;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;

    .line 47
    .line 48
    invoke-direct {v1}, Lcom/tencent/youtu/ytagreflectlivecheck/a;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/FullPack;->AGin:Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    iget-object v2, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->videoData:[Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;

    .line 56
    .line 57
    iget-wide v3, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->beginTime:J

    .line 58
    .line 59
    iget-wide v5, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->changePointTime:J

    .line 60
    .line 61
    iget-object v7, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->changePointTimeList:[J

    .line 62
    .line 63
    iget v8, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->offsetSys:F

    .line 64
    .line 65
    iget v9, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->frameNum:I

    .line 66
    .line 67
    iget v10, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->landMarkNum:I

    .line 68
    .line 69
    iget v11, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->width:I

    .line 70
    .line 71
    iget v12, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->height:I

    .line 72
    .line 73
    iget v13, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->config_begin:I

    .line 74
    .line 75
    iget-object v0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/DataPack;->log:[B

    .line 76
    .line 77
    iput-object v2, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->a:[Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;

    .line 78
    .line 79
    iput-wide v3, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->b:J

    .line 80
    .line 81
    iput-wide v5, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->c:J

    .line 82
    .line 83
    iput-object v7, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->d:[J

    .line 84
    .line 85
    iput v8, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->e:F

    .line 86
    .line 87
    iput v9, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->f:I

    .line 88
    .line 89
    iput v10, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->g:I

    .line 90
    .line 91
    iput v11, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->h:I

    .line 92
    .line 93
    iput v12, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->i:I

    .line 94
    .line 95
    iput v13, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->j:I

    .line 96
    .line 97
    iput-object v0, v1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->k:[B

    .line 98
    .line 99
    :cond_0
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCheckResult:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;

    .line 100
    .line 101
    invoke-interface {v0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;->onSuccess(Lcom/tencent/youtu/ytagreflectlivecheck/a;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_1
    sget-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCheckResult:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;

    .line 106
    .line 107
    new-instance v2, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v3, "JNI return failed.["

    .line 110
    .line 111
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v3, "]"

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v4, "Please make sure you have called the YTAGReflectLiveCheckInterface.onPreviewFrame during the hole reflecting process. Check log for more information. code: "

    .line 129
    .line 130
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const/4 v3, -0x1

    .line 141
    invoke-interface {v1, v3, v2, v0}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;->onFailed(ILjava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public static onReflectLiveImgData(Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCheckResult:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;->onReflectLiveImgData(Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static onScreenChanged(IIIIF)V
    .locals 27

    .line 1
    move/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    sget v4, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mOverlayAlpha:I

    .line 10
    .line 11
    const/16 v6, 0x12

    .line 12
    .line 13
    const/16 v7, 0x11

    .line 14
    .line 15
    const/16 v8, 0x10

    .line 16
    .line 17
    const/16 v9, 0xf

    .line 18
    .line 19
    const/16 v10, 0xe

    .line 20
    .line 21
    const/16 v11, 0xd

    .line 22
    .line 23
    const/16 v12, 0xc

    .line 24
    .line 25
    const/16 v13, 0xb

    .line 26
    .line 27
    const/16 v14, 0xa

    .line 28
    .line 29
    const/16 v15, 0x9

    .line 30
    .line 31
    const/16 v16, 0x8

    .line 32
    .line 33
    const/16 v17, 0x7

    .line 34
    .line 35
    const/16 v18, 0x6

    .line 36
    .line 37
    const/16 v19, 0x5

    .line 38
    .line 39
    const/16 v20, 0x4

    .line 40
    .line 41
    const/16 v21, 0x3

    .line 42
    .line 43
    const/16 v22, 0x2

    .line 44
    .line 45
    const/16 v23, 0x1

    .line 46
    .line 47
    const/16 v24, 0x0

    .line 48
    .line 49
    const/16 v25, 0x13

    .line 50
    .line 51
    const/16 v5, 0x14

    .line 52
    .line 53
    const/16 v26, 0x0

    .line 54
    .line 55
    if-eqz v4, :cond_0

    .line 56
    .line 57
    new-array v4, v5, [F

    .line 58
    .line 59
    aput v26, v4, v24

    .line 60
    .line 61
    aput v26, v4, v23

    .line 62
    .line 63
    aput v26, v4, v22

    .line 64
    .line 65
    aput v26, v4, v21

    .line 66
    .line 67
    int-to-float v1, v1

    .line 68
    aput v1, v4, v20

    .line 69
    .line 70
    aput v26, v4, v19

    .line 71
    .line 72
    aput v26, v4, v18

    .line 73
    .line 74
    aput v26, v4, v17

    .line 75
    .line 76
    aput v26, v4, v16

    .line 77
    .line 78
    int-to-float v1, v2

    .line 79
    aput v1, v4, v15

    .line 80
    .line 81
    aput v26, v4, v14

    .line 82
    .line 83
    aput v26, v4, v13

    .line 84
    .line 85
    aput v26, v4, v12

    .line 86
    .line 87
    aput v26, v4, v11

    .line 88
    .line 89
    int-to-float v1, v3

    .line 90
    aput v1, v4, v10

    .line 91
    .line 92
    aput v26, v4, v9

    .line 93
    .line 94
    aput v26, v4, v8

    .line 95
    .line 96
    aput v26, v4, v7

    .line 97
    .line 98
    int-to-float v0, v0

    .line 99
    aput v0, v4, v6

    .line 100
    .line 101
    aput v26, v4, v25

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    new-array v4, v5, [F

    .line 105
    .line 106
    aput v26, v4, v24

    .line 107
    .line 108
    aput v26, v4, v23

    .line 109
    .line 110
    aput v26, v4, v22

    .line 111
    .line 112
    aput v26, v4, v21

    .line 113
    .line 114
    int-to-float v1, v1

    .line 115
    aput v1, v4, v20

    .line 116
    .line 117
    aput v26, v4, v19

    .line 118
    .line 119
    aput v26, v4, v18

    .line 120
    .line 121
    aput v26, v4, v17

    .line 122
    .line 123
    aput v26, v4, v16

    .line 124
    .line 125
    int-to-float v1, v2

    .line 126
    aput v1, v4, v15

    .line 127
    .line 128
    aput v26, v4, v14

    .line 129
    .line 130
    aput v26, v4, v13

    .line 131
    .line 132
    aput v26, v4, v12

    .line 133
    .line 134
    aput v26, v4, v11

    .line 135
    .line 136
    int-to-float v1, v3

    .line 137
    aput v1, v4, v10

    .line 138
    .line 139
    aput v26, v4, v9

    .line 140
    .line 141
    aput v26, v4, v8

    .line 142
    .line 143
    aput v26, v4, v7

    .line 144
    .line 145
    aput v26, v4, v6

    .line 146
    .line 147
    int-to-float v0, v0

    .line 148
    aput v0, v4, v25

    .line 149
    .line 150
    :goto_0
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    .line 151
    .line 152
    invoke-direct {v0, v4}, Landroid/graphics/ColorMatrixColorFilter;-><init>([F)V

    .line 153
    .line 154
    .line 155
    sget-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

    .line 156
    .line 157
    if-nez v1, :cond_1

    .line 158
    .line 159
    const-string v0, "YoutuLightLiveCheck"

    .line 160
    .line 161
    const-string v1, "On reflection screen change failed:mReflectListener is null"

    .line 162
    .line 163
    invoke-static {v0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_1
    move/from16 v2, p4

    .line 168
    .line 169
    invoke-interface {v1, v0, v2}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;->onReflectEvent(Landroid/graphics/ColorMatrixColorFilter;F)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public static onStateChanged(I)V
    .locals 4

    .line 1
    const-string v0, "on finish get param failed:"

    .line 2
    .line 3
    sput p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mState:I

    .line 4
    .line 5
    const-string v1, "YoutuLightLiveCheck"

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    :try_start_0
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, v2}, Landroid/hardware/Camera$Parameters;->setAutoWhiteBalanceLock(Z)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_2

    .line 27
    :cond_0
    const/4 v3, 0x0

    .line 28
    if-ne p0, v2, :cond_1

    .line 29
    .line 30
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectNotice:Lcom/tencent/youtu/ytagreflectlivecheck/notice/a;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    check-cast p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$g;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$g;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;

    .line 37
    .line 38
    invoke-static {p0, v3}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 v2, 0x2

    .line 43
    if-ne p0, v2, :cond_2

    .line 44
    .line 45
    :try_start_1
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v3}, Landroid/hardware/Camera$Parameters;->setAutoWhiteBalanceLock(Z)V

    .line 52
    .line 53
    .line 54
    sget-object v2, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 55
    .line 56
    invoke-virtual {v2, p0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :catch_1
    move-exception p0

    .line 63
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v1, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    .line 81
    .line 82
    :goto_0
    :try_start_3
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->onFinish()V

    .line 83
    .line 84
    .line 85
    goto :goto_3

    .line 86
    :goto_1
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->onFinish()V

    .line 87
    .line 88
    .line 89
    throw p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 90
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v2, "on state changed failed:"

    .line 93
    .line 94
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v1, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    :goto_3
    return-void
.end method

.method public static pushImageData([BIIJI[FFFF)V
    .locals 9

    .line 1
    sget v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mState:I

    .line 2
    .line 3
    const-string v1, "YoutuLightLiveCheck"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRGetConfigBegin()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x2

    .line 16
    .line 17
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRGetConfigEnd()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/lit8 v2, v2, 0x4

    .line 26
    .line 27
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRGetTriggerTime()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    new-instance v4, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v5, "onPreviewFrameReceived. beginFrame: "

    .line 38
    .line 39
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v5, " endFrame: "

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v5, " currentFrame: "

    .line 54
    .line 55
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-static {v1, v4}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    if-le v3, v0, :cond_1

    .line 69
    .line 70
    if-ge v3, v2, :cond_1

    .line 71
    .line 72
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 73
    .line 74
    .line 75
    const-string v0, "onPreviewFrameReceived. insertYuv and time"

    .line 76
    .line 77
    invoke-static {v1, v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {p3, p4}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/JNIUtils;->getTimeval(J)Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    move-object v3, p0

    .line 89
    move v4, p1

    .line 90
    move v5, p2

    .line 91
    move v7, p5

    .line 92
    move-object v8, p6

    .line 93
    invoke-virtual/range {v2 .. v8}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRPushYuv([BIILcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;I[F)V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p3, p4}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/JNIUtils;->getTimeval(J)Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRPushCaptureTime(Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_0
    const/4 p5, 0x1

    .line 109
    if-ne v0, p5, :cond_1

    .line 110
    .line 111
    const-string p5, "[ReflectController.onPreviewFrameReceived] record ios"

    .line 112
    .line 113
    invoke-static {v1, p5}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 117
    .line 118
    .line 119
    move-result-object p5

    .line 120
    invoke-virtual {p5, p0, p1, p2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRPushISOImgYuv([BII)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {p3, p4}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/JNIUtils;->getTimeval(J)Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRPushISOCaptureTime(Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/Timeval;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    return-void
.end method

.method public static declared-synchronized releaseModel()V
    .locals 3

    .line 1
    const-class v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 7
    .line 8
    .line 9
    sget v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I

    .line 10
    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    sput v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I

    .line 14
    .line 15
    if-gtz v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    sput v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    sput-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectNotice:Lcom/tencent/youtu/ytagreflectlivecheck/notice/a;

    .line 22
    .line 23
    sput-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

    .line 24
    .line 25
    sput-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v1

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    :try_start_1
    sget-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->clearInstance()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 36
    .line 37
    .line 38
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :catchall_1
    move-exception v1

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    :try_start_2
    sget-object v2, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initLock:Ljava/util/concurrent/locks/Lock;

    .line 43
    .line 44
    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 45
    .line 46
    .line 47
    throw v1

    .line 48
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 49
    throw v1
.end method

.method public static setAGSettings(Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAGSettings:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;

    .line 2
    .line 3
    return-void
.end method

.method public static setReflectListener(Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

    .line 2
    .line 3
    return-void
.end method

.method public static setReflectNotice(Lcom/tencent/youtu/ytagreflectlivecheck/notice/a;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectNotice:Lcom/tencent/youtu/ytagreflectlivecheck/notice/a;

    .line 2
    .line 3
    return-void
.end method

.method public static setSafetyLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "[YTAGReflectLiveCheckInterface.setSafetyLevel] --- level: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "YoutuLightLiveCheck"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAGSettings:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;

    .line 21
    .line 22
    iput p0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->safetylevel:I

    .line 23
    .line 24
    return-void
.end method

.method public static setupConfig(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "overlay_alpha"

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sput p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mOverlayAlpha:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const/4 p0, 0x0

    .line 13
    sput p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mOverlayAlpha:I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static start(Landroid/content/Context;Landroid/hardware/Camera;ILjava/lang/String;Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;)V
    .locals 8

    .line 1
    const-string p0, "[YTAGReflectLiveCheckInterface.start] ---"

    .line 2
    .line 3
    const-string v0, "YoutuLightLiveCheck"

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p4, :cond_0

    .line 9
    .line 10
    const-string p0, "On reflection start failed:checkResult is null"

    .line 11
    .line 12
    invoke-static {v0, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sput-object p4, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCheckResult:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;

    .line 17
    .line 18
    sget p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mInitModel:I

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    if-gtz p0, :cond_1

    .line 22
    .line 23
    const-string p0, "Not init model."

    .line 24
    .line 25
    const-string p1, "Call YTAGReflectLiveCheckInterface.initModel() before."

    .line 26
    .line 27
    invoke-interface {p4, v1, p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;->onFailed(ILjava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sput p2, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCameraRotatedTag:I

    .line 32
    .line 33
    sput-object p3, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mColorSeq:Ljava/lang/String;

    .line 34
    .line 35
    sput-object p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mCamera:Landroid/hardware/Camera;

    .line 36
    .line 37
    new-array v6, v1, [J

    .line 38
    .line 39
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

    .line 40
    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    const-string p0, "On reflection start failed:mReflectListener is null"

    .line 44
    .line 45
    invoke-static {v0, p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

    .line 49
    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    invoke-interface {p0}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;->onGetAppBrightness()F

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    :goto_0
    move v7, p0

    .line 57
    goto :goto_1

    .line 58
    :cond_3
    const/high16 p0, -0x40800000    # -1.0f

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :goto_1
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->getInstance()Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAGSettings:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;

    .line 66
    .line 67
    iget v5, p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->safetylevel:I

    .line 68
    .line 69
    const/4 v3, 0x0

    .line 70
    move-object v4, p3

    .line 71
    invoke-virtual/range {v2 .. v7}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRInit(ZLjava/lang/String;I[JF)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    new-instance p1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string p2, "output duration ms"

    .line 78
    .line 79
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/4 p2, 0x0

    .line 83
    aget-wide v1, v6, p2

    .line 84
    .line 85
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p3, " "

    .line 89
    .line 90
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const/4 p3, 0x1

    .line 94
    aget-wide v1, v6, p3

    .line 95
    .line 96
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {v0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->nativeLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    if-eqz p0, :cond_6

    .line 107
    .line 108
    const/4 p1, -0x1

    .line 109
    if-eq p0, p1, :cond_5

    .line 110
    .line 111
    const/4 p1, -0x2

    .line 112
    if-eq p0, p1, :cond_5

    .line 113
    .line 114
    const/4 p1, -0x3

    .line 115
    if-ne p0, p1, :cond_4

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_4
    const-string p0, "Reflection Init Error"

    .line 119
    .line 120
    const-string p1, ""

    .line 121
    .line 122
    const/16 p2, 0x190

    .line 123
    .line 124
    invoke-interface {p4, p2, p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;->onFailed(ILjava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_5
    :goto_2
    const-string p0, "Color Data Error"

    .line 129
    .line 130
    const-string p1, "Check Color Data Format"

    .line 131
    .line 132
    const/16 p2, 0x1f4

    .line 133
    .line 134
    invoke-interface {p4, p2, p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;->onFailed(ILjava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_6
    sget-object p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mReflectListener:Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;

    .line 139
    .line 140
    if-eqz p0, :cond_7

    .line 141
    .line 142
    aget-wide p1, v6, p2

    .line 143
    .line 144
    invoke-interface {p0, p1, p2}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;->onReflectStart(J)V

    .line 145
    .line 146
    .line 147
    :cond_7
    return-void
.end method
