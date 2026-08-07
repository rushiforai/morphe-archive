.class public final Lcom/momo/xeengine/xnative/XEMotionManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private final mListener:Landroid/hardware/SensorEventListener;

.field private final mRMatrix:[F

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private final viewMatrix:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mRMatrix:[F

    .line 12
    .line 13
    new-instance v1, Lcom/momo/xeengine/xnative/XEMotionManager$1;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/momo/xeengine/xnative/XEMotionManager$1;-><init>(Lcom/momo/xeengine/xnative/XEMotionManager;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mListener:Landroid/hardware/SensorEventListener;

    .line 19
    .line 20
    new-array v0, v0, [F

    .line 21
    .line 22
    iput-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->viewMatrix:[F

    .line 23
    .line 24
    return-void

    .line 25
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic access$000(Lcom/momo/xeengine/xnative/XEMotionManager;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mRMatrix:[F

    .line 2
    .line 3
    return-object p0
.end method

.method private getSensorManager()Landroid/hardware/SensorManager;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "sensor"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/hardware/SensorManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "getSensorManager: "

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "[XENGINE]"

    .line 30
    .line 31
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method private printMatrix([F)V
    .locals 17

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v0, p1, v0

    .line 3
    .line 4
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v0, 0x1

    .line 9
    aget v0, p1, v0

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v0, 0x2

    .line 16
    aget v0, p1, v0

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const/4 v0, 0x3

    .line 23
    aget v0, p1, v0

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const/4 v0, 0x4

    .line 30
    aget v0, p1, v0

    .line 31
    .line 32
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const/4 v0, 0x5

    .line 37
    aget v0, p1, v0

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    const/4 v0, 0x6

    .line 44
    aget v0, p1, v0

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    const/4 v0, 0x7

    .line 51
    aget v0, p1, v0

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    const/16 v0, 0x8

    .line 58
    .line 59
    aget v0, p1, v0

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    const/16 v0, 0x9

    .line 66
    .line 67
    aget v0, p1, v0

    .line 68
    .line 69
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    const/16 v0, 0xa

    .line 74
    .line 75
    aget v0, p1, v0

    .line 76
    .line 77
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 78
    .line 79
    .line 80
    move-result-object v11

    .line 81
    const/16 v0, 0xb

    .line 82
    .line 83
    aget v0, p1, v0

    .line 84
    .line 85
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 86
    .line 87
    .line 88
    move-result-object v12

    .line 89
    const/16 v0, 0xc

    .line 90
    .line 91
    aget v0, p1, v0

    .line 92
    .line 93
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 94
    .line 95
    .line 96
    move-result-object v13

    .line 97
    const/16 v0, 0xd

    .line 98
    .line 99
    aget v0, p1, v0

    .line 100
    .line 101
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 102
    .line 103
    .line 104
    move-result-object v14

    .line 105
    const/16 v0, 0xe

    .line 106
    .line 107
    aget v0, p1, v0

    .line 108
    .line 109
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 110
    .line 111
    .line 112
    move-result-object v15

    .line 113
    const/16 v0, 0xf

    .line 114
    .line 115
    aget v0, p1, v0

    .line 116
    .line 117
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 118
    .line 119
    .line 120
    move-result-object v16

    .line 121
    filled-new-array/range {v1 .. v16}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v1, "\u77e9\u9635:\n[%f,%f,%f,%f]\n[%f,%f,%f,%f]\n[%f,%f,%f,%f]\n[%f,%f,%f,%f]"

    .line 126
    .line 127
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method private registerListener(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mListener:Landroid/hardware/SensorEventListener;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, p0, p1, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mListener:Landroid/hardware/SensorEventListener;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public getAcceleration()[F
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDeviceMotion()[F
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRotation()[F
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getViewMatrix()[F
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mRMatrix:[F

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mRMatrix:[F

    .line 5
    .line 6
    iget-object v2, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->viewMatrix:[F

    .line 7
    .line 8
    const/16 v3, 0x10

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->viewMatrix:[F

    .line 16
    .line 17
    return-object p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p0
.end method

.method public open()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XEMotionManager;->getSensorManager()Landroid/hardware/SensorManager;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/xnative/XEMotionManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v0, 0xf

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/momo/xeengine/xnative/XEMotionManager;->registerListener(I)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method
