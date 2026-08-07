.class public Lcom/effectsar/labcv/effectsdk/SensorHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;,
        Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;,
        Lcom/effectsar/labcv/effectsdk/SensorHelper$GravityListener;,
        Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;,
        Lcom/effectsar/labcv/effectsdk/SensorHelper$AcceleratorListener;,
        Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;
    }
.end annotation


# static fields
.field private static final BEF_REQUIREMENT_SKY_SEG:I = 0x4000

.field private static final RENDER_MSG_EVENT_DID_SWITCH_EFFECT:I = 0x6

.field private static final RENDER_MSG_TYPE_EFFECT:I = 0x14

.field private static final TAG:Ljava/lang/String; = "SensorHelper"


# instance fields
.field private acceleratorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$AcceleratorListener;

.field private acceleratorSeneor:Landroid/hardware/Sensor;

.field private gravityListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GravityListener;

.field private gravitySensor:Landroid/hardware/Sensor;

.field private gyroscopeListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;

.field private gyroscopeSensor:Landroid/hardware/Sensor;

.field private mAccelerometer:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;

.field private mListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private rotationSensor:Landroid/hardware/Sensor;

.field private rotationSensorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

    .line 5
    .line 6
    const-string p2, "sensor"

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, Landroid/hardware/SensorManager;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 15
    .line 16
    const/4 v0, 0x4

    .line 17
    invoke-virtual {p2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gyroscopeSensor:Landroid/hardware/Sensor;

    .line 22
    .line 23
    iget-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->acceleratorSeneor:Landroid/hardware/Sensor;

    .line 31
    .line 32
    iget-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 33
    .line 34
    const/16 v0, 0x9

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gravitySensor:Landroid/hardware/Sensor;

    .line 41
    .line 42
    iget-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 43
    .line 44
    const/16 v0, 0xf

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->rotationSensor:Landroid/hardware/Sensor;

    .line 51
    .line 52
    if-nez p2, :cond_0

    .line 53
    .line 54
    iget-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 55
    .line 56
    const/16 v0, 0xb

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->rotationSensor:Landroid/hardware/Sensor;

    .line 63
    .line 64
    :cond_0
    new-instance p2, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    invoke-direct {p2, p0, v0}, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;Lcom/effectsar/labcv/effectsdk/SensorHelper$1;)V

    .line 68
    .line 69
    .line 70
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->rotationSensorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;

    .line 71
    .line 72
    new-instance p2, Lcom/effectsar/labcv/effectsdk/SensorHelper$AcceleratorListener;

    .line 73
    .line 74
    invoke-direct {p2, p0, v0}, Lcom/effectsar/labcv/effectsdk/SensorHelper$AcceleratorListener;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;Lcom/effectsar/labcv/effectsdk/SensorHelper$1;)V

    .line 75
    .line 76
    .line 77
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->acceleratorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$AcceleratorListener;

    .line 78
    .line 79
    new-instance p2, Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;

    .line 80
    .line 81
    invoke-direct {p2, p0, v0}, Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;Lcom/effectsar/labcv/effectsdk/SensorHelper$1;)V

    .line 82
    .line 83
    .line 84
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gyroscopeListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;

    .line 85
    .line 86
    new-instance p2, Lcom/effectsar/labcv/effectsdk/SensorHelper$GravityListener;

    .line 87
    .line 88
    invoke-direct {p2, p0, v0}, Lcom/effectsar/labcv/effectsdk/SensorHelper$GravityListener;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;Lcom/effectsar/labcv/effectsdk/SensorHelper$1;)V

    .line 89
    .line 90
    .line 91
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gravityListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GravityListener;

    .line 92
    .line 93
    new-instance p2, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;

    .line 94
    .line 95
    invoke-direct {p2, p0, p1}, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;Landroid/content/Context;)V

    .line 96
    .line 97
    .line 98
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mAccelerometer:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;

    .line 99
    .line 100
    return-void
.end method

.method public static synthetic access$400(Lcom/effectsar/labcv/effectsdk/SensorHelper;)Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/effectsar/labcv/effectsdk/SensorHelper;Landroid/hardware/SensorEvent;)D
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->getTimestamp(Landroid/hardware/SensorEvent;)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic access$600(Lcom/effectsar/labcv/effectsdk/SensorHelper;)Landroid/hardware/SensorManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    return-object p0
.end method

.method private getTimestamp(Landroid/hardware/SensorEvent;)D
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p1, Landroid/hardware/SensorEvent;->timestamp:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    iget-wide p0, p1, Landroid/hardware/SensorEvent;->timestamp:J

    .line 18
    .line 19
    sub-long/2addr v4, p0

    .line 20
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    invoke-static {v2, v3, p0, p1}, Ljava/lang/Math;->min(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    sub-long/2addr v0, p0

    .line 29
    long-to-double p0, v0

    .line 30
    return-wide p0
.end method


# virtual methods
.method public registerSensor()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->acceleratorSeneor:Landroid/hardware/Sensor;

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    move v2, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v2, v1

    .line 14
    :goto_0
    iget-object v4, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gyroscopeSensor:Landroid/hardware/Sensor;

    .line 15
    .line 16
    if-eqz v4, :cond_1

    .line 17
    .line 18
    move v4, v3

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move v4, v1

    .line 21
    :goto_1
    iget-object v5, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gravitySensor:Landroid/hardware/Sensor;

    .line 22
    .line 23
    if-eqz v5, :cond_2

    .line 24
    .line 25
    move v5, v3

    .line 26
    goto :goto_2

    .line 27
    :cond_2
    move v5, v1

    .line 28
    :goto_2
    iget-object v6, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->rotationSensor:Landroid/hardware/Sensor;

    .line 29
    .line 30
    if-eqz v6, :cond_3

    .line 31
    .line 32
    goto :goto_3

    .line 33
    :cond_3
    move v3, v1

    .line 34
    :goto_3
    invoke-interface {v0, v2, v4, v5, v3}, Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;->deviceConfig(ZZZZ)V

    .line 35
    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->rotationSensorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->rotationSensor:Landroid/hardware/Sensor;

    .line 42
    .line 43
    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->acceleratorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$AcceleratorListener;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->acceleratorSeneor:Landroid/hardware/Sensor;

    .line 51
    .line 52
    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 56
    .line 57
    iget-object v2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gyroscopeListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;

    .line 58
    .line 59
    iget-object v3, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gyroscopeSensor:Landroid/hardware/Sensor;

    .line 60
    .line 61
    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gravityListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GravityListener;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gravitySensor:Landroid/hardware/Sensor;

    .line 69
    .line 70
    invoke-virtual {v0, v2, p0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public unRegisterSensor()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->rotationSensorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->acceleratorListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$AcceleratorListener;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gyroscopeListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->mSensorManager:Landroid/hardware/SensorManager;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper;->gravityListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$GravityListener;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
