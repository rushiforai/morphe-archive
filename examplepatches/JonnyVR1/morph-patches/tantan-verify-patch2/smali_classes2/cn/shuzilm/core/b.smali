.class Lcn/shuzilm/core/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Landroid/hardware/SensorManager;

.field final synthetic c:Lcn/shuzilm/core/DUHelper;


# direct methods
.method public constructor <init>(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;Landroid/hardware/SensorManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/b;->c:Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcn/shuzilm/core/b;->a:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcn/shuzilm/core/b;->b:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2
    .line 3
    iget-object v1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/hardware/Sensor;->getType()I

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    array-length v2, v0

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    aget v2, v0, v1

    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-object v0, p0, Lcn/shuzilm/core/b;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {v0, p1}, Lcn/shuzilm/core/DUHelper;->a(Landroid/content/Context;Landroid/hardware/SensorEvent;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_2

    .line 25
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    :goto_2
    iget-object p1, p0, Lcn/shuzilm/core/b;->b:Landroid/hardware/SensorManager;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
