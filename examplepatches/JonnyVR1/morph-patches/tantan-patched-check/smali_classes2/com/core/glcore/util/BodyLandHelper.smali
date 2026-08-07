.class public Lcom/core/glcore/util/BodyLandHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark; = null

.field private static exitOpenCL:I = -0x1

.field private static volatile isWhiteList:Z = false

.field private static modelPath:Ljava/lang/String; = null

.field private static qualcommCPU:I = -0x1

.field private static volatile useBodyLand:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static synthetic access$002(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/core/glcore/util/BodyLandHelper;->useBodyLand:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->releaseBodyLandmark()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getModelPath()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/BodyLandHelper;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static isUseBodyLand()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/core/glcore/util/BodyLandHelper;->useBodyLand:Z

    .line 2
    .line 3
    return v0
.end method

.method public static declared-synchronized process(Ll/umw;Ll/lnw;Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V
    .locals 3

    .line 1
    const-class v0, Lcom/core/glcore/util/BodyLandHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/core/glcore/util/BodyLandHelper;->modelPath:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v1, :cond_3

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    sget-object v1, Lcom/core/glcore/util/BodyLandHelper;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Lcom/momocv/bodylandmark/BodyLandmark;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/momocv/bodylandmark/BodyLandmark;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/core/glcore/util/BodyLandHelper;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 21
    .line 22
    sget-object v2, Lcom/core/glcore/util/BodyLandHelper;->modelPath:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Lcom/momocv/bodylandmark/BodyLandmark;->LoadModel(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_2

    .line 30
    :cond_1
    :goto_0
    sget-object v1, Lcom/core/glcore/util/BodyLandHelper;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 43
    .line 44
    invoke-virtual {v1, p0, p1, p2}, Lcom/momocv/bodylandmark/BodyLandmark;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/bodylandmark/BodyLandmarkParams;Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    :cond_2
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :cond_3
    :goto_1
    :try_start_1
    const-string p0, "ImageProcess"

    .line 50
    .line 51
    const-string p1, "The BodyLand modelPath is null or bodyLandmarkPostInfo is null !!!"

    .line 52
    .line 53
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 59
    throw p0
.end method

.method public static declared-synchronized release()V
    .locals 3

    .line 1
    const-class v0, Lcom/core/glcore/util/BodyLandHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->releaseBodyLandmark()V

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    sput-object v1, Lcom/core/glcore/util/BodyLandHelper;->modelPath:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    sput-boolean v1, Lcom/core/glcore/util/BodyLandHelper;->useBodyLand:Z

    .line 12
    .line 13
    sput-boolean v1, Lcom/core/glcore/util/BodyLandHelper;->isWhiteList:Z

    .line 14
    .line 15
    const-string v1, "ImageProcess"

    .line 16
    .line 17
    const-string v2, "The BodyLandHelper release !!!"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    monitor-exit v0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception v1

    .line 25
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v1
.end method

.method private static declared-synchronized releaseBodyLandmark()V
    .locals 2

    .line 1
    const-class v0, Lcom/core/glcore/util/BodyLandHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/core/glcore/util/BodyLandHelper;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/momocv/bodylandmark/BodyLandmark;->Release()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    sput-object v1, Lcom/core/glcore/util/BodyLandHelper;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v1
.end method

.method public static rightHardware()Z
    .locals 6

    .line 1
    sget v0, Lcom/core/glcore/util/BodyLandHelper;->exitOpenCL:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_8

    .line 5
    .line 6
    sget v2, Lcom/core/glcore/util/BodyLandHelper;->qualcommCPU:I

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    const/4 v2, -0x1

    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    const-string v0, "/system/vendor/lib/libOpenCL.so"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sput v0, Lcom/core/glcore/util/BodyLandHelper;->exitOpenCL:I

    .line 22
    .line 23
    :cond_1
    sget v0, Lcom/core/glcore/util/BodyLandHelper;->qualcommCPU:I

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    if-ne v0, v2, :cond_7

    .line 27
    .line 28
    const-string v0, "/proc/cpuinfo"

    .line 29
    .line 30
    invoke-static {v0}, Lcom/core/glcore/util/FileUtil;->readString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const-string v4, "qcom"

    .line 39
    .line 40
    const-string v5, "qualcomm"

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    sput v1, Lcom/core/glcore/util/BodyLandHelper;->qualcommCPU:I

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_4

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    move v0, v1

    .line 69
    goto :goto_1

    .line 70
    :cond_4
    :goto_0
    move v0, v3

    .line 71
    :goto_1
    sput v0, Lcom/core/glcore/util/BodyLandHelper;->qualcommCPU:I

    .line 72
    .line 73
    :goto_2
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 74
    .line 75
    sget v2, Lcom/core/glcore/util/BodyLandHelper;->qualcommCPU:I

    .line 76
    .line 77
    if-nez v2, :cond_7

    .line 78
    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_7

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_6

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_5

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    move v0, v1

    .line 107
    goto :goto_4

    .line 108
    :cond_6
    :goto_3
    move v0, v3

    .line 109
    :goto_4
    sput v0, Lcom/core/glcore/util/BodyLandHelper;->qualcommCPU:I

    .line 110
    .line 111
    :cond_7
    sget v0, Lcom/core/glcore/util/BodyLandHelper;->exitOpenCL:I

    .line 112
    .line 113
    if-ne v0, v3, :cond_8

    .line 114
    .line 115
    sget v0, Lcom/core/glcore/util/BodyLandHelper;->qualcommCPU:I

    .line 116
    .line 117
    if-ne v0, v3, :cond_8

    .line 118
    .line 119
    return v3

    .line 120
    :cond_8
    :goto_5
    return v1
.end method

.method public static setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    invoke-static {v0}, Lcom/core/glcore/util/XEEngineHelper;->setBodyInfos(Ljava/util/ArrayList;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    invoke-static {v0}, Lcom/core/glcore/util/XEEngineHelper;->setBodyInfos(Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    array-length v0, p0

    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 20
    .line 21
    .line 22
    array-length v0, p0

    .line 23
    const/4 v2, 0x0

    .line 24
    move v3, v2

    .line 25
    :goto_0
    if-ge v3, v0, :cond_4

    .line 26
    .line 27
    aget-object v4, p0, v3

    .line 28
    .line 29
    array-length v5, v4

    .line 30
    new-instance v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;

    .line 31
    .line 32
    invoke-direct {v6}, Lcom/momo/xeengine/cv/bean/CVBodyInfo;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v7, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v7, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 38
    .line 39
    .line 40
    iput-object v7, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 41
    .line 42
    array-length v5, v4

    .line 43
    move v7, v2

    .line 44
    :goto_1
    if-ge v7, v5, :cond_3

    .line 45
    .line 46
    aget-object v8, v4, v7

    .line 47
    .line 48
    if-nez v8, :cond_2

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    new-instance v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;

    .line 52
    .line 53
    invoke-direct {v9}, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;-><init>()V

    .line 54
    .line 55
    .line 56
    iget v10, v8, Lcom/momocv/MMPoint;->x_:I

    .line 57
    .line 58
    int-to-float v10, v10

    .line 59
    iput v10, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->x:F

    .line 60
    .line 61
    iget v10, v8, Lcom/momocv/MMPoint;->y_:I

    .line 62
    .line 63
    int-to-float v10, v10

    .line 64
    iput v10, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->y:F

    .line 65
    .line 66
    iget v8, v8, Lcom/momocv/MMJoint;->score_:F

    .line 67
    .line 68
    iput v8, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->score:F

    .line 69
    .line 70
    iget-object v8, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :goto_2
    add-int/lit8 v7, v7, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    add-int/lit8 v3, v3, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    invoke-static {v1}, Lcom/core/glcore/util/XEEngineHelper;->setBodyInfos(Ljava/util/ArrayList;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static declared-synchronized setModelTypeAndPath(ZLjava/lang/String;)V
    .locals 2

    .line 1
    const-class v0, Lcom/core/glcore/util/BodyLandHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/core/glcore/util/BodyLandHelper;->isWhiteList:Z

    .line 5
    .line 6
    if-ne v1, p0, :cond_0

    .line 7
    .line 8
    sget-object v1, Lcom/core/glcore/util/BodyLandHelper;->modelPath:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    if-ne v1, p1, :cond_0

    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    :try_start_1
    invoke-static {p1}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    sget-object v1, Lcom/core/glcore/util/BodyLandHelper;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/momocv/bodylandmark/BodyLandmark;->Release()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    sput-object v1, Lcom/core/glcore/util/BodyLandHelper;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 31
    .line 32
    :cond_1
    sput-object p1, Lcom/core/glcore/util/BodyLandHelper;->modelPath:Ljava/lang/String;

    .line 33
    .line 34
    sput-boolean p0, Lcom/core/glcore/util/BodyLandHelper;->isWhiteList:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    :cond_2
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 39
    throw p0
.end method

.method public static declared-synchronized setUseBodyLand(Z)V
    .locals 3

    .line 1
    const-class v0, Lcom/core/glcore/util/BodyLandHelper;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/16 v1, 0x2ef

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    :try_start_0
    sput-boolean p0, Lcom/core/glcore/util/BodyLandHelper;->useBodyLand:Z

    .line 10
    .line 11
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->cancelRelease(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v2, Lcom/core/glcore/util/BodyLandHelper$1;

    .line 26
    .line 27
    invoke-direct {v2}, Lcom/core/glcore/util/BodyLandHelper$1;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v1, v2}, Lcom/core/glcore/util/DetectDelayStopHelper;->delayRelease(ILjava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    :goto_0
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p0
.end method
