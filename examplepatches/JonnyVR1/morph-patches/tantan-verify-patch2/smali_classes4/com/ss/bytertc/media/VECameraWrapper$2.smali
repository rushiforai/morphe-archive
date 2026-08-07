.class Lcom/ss/bytertc/media/VECameraWrapper$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/media/VECameraWrapper;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$2;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

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
    const-wide/high16 v5, 0x4018000000000000L    # 6.0

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
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$2;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 39
    .line 40
    if-ltz p1, :cond_1

    .line 41
    .line 42
    invoke-static {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2900(Lcom/ss/bytertc/media/VECameraWrapper;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object p1, Lcom/ss/bytertc/engine/UIDeviceOrientation;->LandscapeRight:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-static {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2900(Lcom/ss/bytertc/media/VECameraWrapper;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    sget-object p1, Lcom/ss/bytertc/engine/UIDeviceOrientation;->LandscapeLeft:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    cmpl-float p1, p1, v2

    .line 71
    .line 72
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$2;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 73
    .line 74
    if-ltz p1, :cond_3

    .line 75
    .line 76
    invoke-static {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2900(Lcom/ss/bytertc/media/VECameraWrapper;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget-object p1, Lcom/ss/bytertc/engine/UIDeviceOrientation;->Portrait:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    invoke-static {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2900(Lcom/ss/bytertc/media/VECameraWrapper;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object p1, Lcom/ss/bytertc/engine/UIDeviceOrientation;->PortraitUpsidedown:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
