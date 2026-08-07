.class Lcom/ss/bytertc/base/media/camera/Camera1Session$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/Camera1Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$1;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7

    .line 1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v0, p1, v0

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget p1, p1, v1

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sub-float v3, v1, v2

    .line 18
    .line 19
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    float-to-double v3, v3

    .line 24
    const-wide/high16 v5, 0x4010000000000000L    # 4.0

    .line 25
    .line 26
    cmpg-double v3, v3, v5

    .line 27
    .line 28
    if-gez v3, :cond_0

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    cmpl-float v1, v1, v2

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    if-ltz v1, :cond_2

    .line 35
    .line 36
    cmpl-float p1, v0, v2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$1;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 39
    .line 40
    if-ltz p1, :cond_1

    .line 41
    .line 42
    sget-object p1, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->LandscapeRight:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$002(Lcom/ss/bytertc/base/media/camera/Camera1Session;I)I

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    sget-object p1, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->LandscapeLeft:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$002(Lcom/ss/bytertc/base/media/camera/Camera1Session;I)I

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    cmpl-float p1, p1, v2

    .line 63
    .line 64
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$1;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 65
    .line 66
    if-ltz p1, :cond_3

    .line 67
    .line 68
    sget-object p1, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->Portrait:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$002(Lcom/ss/bytertc/base/media/camera/Camera1Session;I)I

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    sget-object p1, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->PortraitUpsideDown:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$002(Lcom/ss/bytertc/base/media/camera/Camera1Session;I)I

    .line 85
    .line 86
    .line 87
    return-void
.end method
