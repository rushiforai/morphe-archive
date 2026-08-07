.class Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;
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
    name = "GyroscopeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;


# direct methods
.method private constructor <init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;)V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

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
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->access$500(Lcom/effectsar/labcv/effectsdk/SensorHelper;Landroid/hardware/SensorEvent;)D

    .line 13
    .line 14
    .line 15
    move-result-wide v8

    .line 16
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$GyroscopeListener;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/effectsar/labcv/effectsdk/SensorHelper;->access$400(Lcom/effectsar/labcv/effectsdk/SensorHelper;)Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object p0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    aget p1, p0, p1

    .line 26
    .line 27
    float-to-double v2, p1

    .line 28
    const/4 p1, 0x1

    .line 29
    aget p1, p0, p1

    .line 30
    .line 31
    float-to-double v4, p1

    .line 32
    const/4 p1, 0x2

    .line 33
    aget p0, p0, p1

    .line 34
    .line 35
    float-to-double v6, p0

    .line 36
    invoke-interface/range {v1 .. v9}, Lcom/effectsar/labcv/effectsdk/SensorHelper$ISensorListener;->onGyroscopeChanged(DDDD)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
