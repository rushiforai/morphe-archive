.class Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/SensorHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RotationSensorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;


# direct methods
.method private constructor <init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;Lcom/effectsar/labcv/effectsdk/SensorHelper$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;)V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->access$400(Lcom/effectsar/labcv/effectsdk/SensorHelper;)Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->access$500(Lcom/effectsar/labcv/effectsdk/SensorHelper;Landroid/hardware/SensorEvent;)D

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const/16 v2, 0x9

    .line 17
    .line 18
    new-array v3, v2, [F

    .line 19
    .line 20
    iget-object v4, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 21
    .line 22
    invoke-static {v4}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->access$600(Lcom/effectsar/labcv/effectsdk/SensorHelper;)Landroid/hardware/SensorManager;

    .line 23
    .line 24
    .line 25
    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 26
    .line 27
    invoke-static {v3, v4}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    .line 28
    .line 29
    .line 30
    new-array v4, v2, [D

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    move v6, v5

    .line 34
    :goto_0
    if-ge v6, v2, :cond_1

    .line 35
    .line 36
    aget v7, v3, v6

    .line 37
    .line 38
    float-to-double v7, v7

    .line 39
    aput-wide v7, v4, v6

    .line 40
    .line 41
    add-int/lit8 v6, v6, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object v3, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 45
    .line 46
    invoke-static {v3}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->access$400(Lcom/effectsar/labcv/effectsdk/SensorHelper;)Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-wide v6, 0x41cdcd6500000000L    # 1.0E9

    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    div-double/2addr v0, v6

    .line 56
    invoke-interface {v3, v4, v2, v0, v1}, Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;->onOrientationChanged([DID)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 60
    .line 61
    aget v0, p1, v5

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    aget v2, p1, v1

    .line 65
    .line 66
    const/4 v3, 0x2

    .line 67
    aget v4, p1, v3

    .line 68
    .line 69
    const/4 v6, 0x3

    .line 70
    aget p1, p1, v6

    .line 71
    .line 72
    const/4 v7, 0x4

    .line 73
    new-array v7, v7, [F

    .line 74
    .line 75
    aput v0, v7, v5

    .line 76
    .line 77
    aput v2, v7, v1

    .line 78
    .line 79
    aput v4, v7, v3

    .line 80
    .line 81
    aput p1, v7, v6

    .line 82
    .line 83
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$RotationSensorListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 84
    .line 85
    invoke-static {p0}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->access$400(Lcom/effectsar/labcv/effectsdk/SensorHelper;)Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-interface {p0, v7}, Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;->setDeviceRotation([F)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
