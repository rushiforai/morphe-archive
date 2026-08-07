.class public Ll/vv$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Ll/vv;


# direct methods
.method public constructor <init>(Ll/vv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vv$c;->a:Ll/vv;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/vv;Ll/wv;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/vv$c;-><init>(Ll/vv;)V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6

    .line 1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p1, v0

    .line 5
    .line 6
    neg-float v1, v1

    .line 7
    const/4 v2, 0x1

    .line 8
    aget v2, p1, v2

    .line 9
    .line 10
    neg-float v2, v2

    .line 11
    const/4 v3, 0x2

    .line 12
    aget p1, p1, v3

    .line 13
    .line 14
    neg-float p1, p1

    .line 15
    mul-float v3, v1, v1

    .line 16
    .line 17
    mul-float v4, v2, v2

    .line 18
    .line 19
    add-float/2addr v3, v4

    .line 20
    const/high16 v4, 0x40800000    # 4.0f

    .line 21
    .line 22
    mul-float/2addr v3, v4

    .line 23
    mul-float/2addr p1, p1

    .line 24
    cmpl-float p1, v3, p1

    .line 25
    .line 26
    if-ltz p1, :cond_1

    .line 27
    .line 28
    neg-float p1, v2

    .line 29
    float-to-double v2, p1

    .line 30
    float-to-double v4, v1

    .line 31
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    const-wide v3, 0x404ca5dc1a63c1f8L    # 57.29577951308232

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    mul-double/2addr v1, v3

    .line 41
    const-wide/16 v3, 0x5a

    .line 42
    .line 43
    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    sub-long/2addr v3, v1

    .line 48
    long-to-int p1, v3

    .line 49
    :goto_0
    const/16 v1, 0x168

    .line 50
    .line 51
    if-lt p1, v1, :cond_0

    .line 52
    .line 53
    add-int/lit16 p1, p1, -0x168

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    :goto_1
    if-gez p1, :cond_2

    .line 57
    .line 58
    add-int/lit16 p1, p1, 0x168

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move p1, v0

    .line 62
    :cond_2
    iget-object v1, p0, Ll/vv$c;->a:Ll/vv;

    .line 63
    .line 64
    invoke-static {v1}, Ll/vv;->b(Ll/vv;)Ll/vv$b;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Ll/vv$c;->a:Ll/vv;

    .line 75
    .line 76
    invoke-static {p0}, Ll/vv;->b(Ll/vv;)Ll/vv$b;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const/16 v1, 0x11

    .line 81
    .line 82
    invoke-virtual {p0, v1, p1, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method
