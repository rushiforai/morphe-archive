.class public final Ll/yet0;
.super Ll/flw0;
.source "SourceFile"


# instance fields
.field public final b:Landroid/hardware/SensorManager;

.field public final c:Ljava/lang/Object;

.field public final d:Landroid/view/Display;

.field public final e:[F

.field public final f:[F

.field public g:[F

.field public h:Landroid/os/Handler;

.field public i:Ll/xet0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "OrientationMonitor"

    .line 2
    .line 3
    const-string v1, "ads"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Ll/flw0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "sensor"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/hardware/SensorManager;

    .line 15
    .line 16
    iput-object v0, p0, Ll/yet0;->b:Landroid/hardware/SensorManager;

    .line 17
    .line 18
    const-string v0, "window"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Landroid/view/WindowManager;

    .line 25
    .line 26
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/yet0;->d:Landroid/view/Display;

    .line 31
    .line 32
    const/16 p1, 0x9

    .line 33
    .line 34
    new-array v0, p1, [F

    .line 35
    .line 36
    iput-object v0, p0, Ll/yet0;->e:[F

    .line 37
    .line 38
    new-array p1, p1, [F

    .line 39
    .line 40
    iput-object p1, p0, Ll/yet0;->f:[F

    .line 41
    .line 42
    new-instance p1, Ljava/lang/Object;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Ll/yet0;->c:Ljava/lang/Object;

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final a(Landroid/hardware/SensorEvent;)V
    .locals 8

    .line 1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p1, v0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    cmpl-float v1, v1, v2

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    const/4 v4, 0x1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    aget v1, p1, v4

    .line 14
    .line 15
    cmpl-float v1, v1, v2

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    aget v1, p1, v3

    .line 20
    .line 21
    cmpl-float v1, v1, v2

    .line 22
    .line 23
    if-eqz v1, :cond_5

    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Ll/yet0;->c:Ljava/lang/Object;

    .line 26
    .line 27
    monitor-enter v1

    .line 28
    :try_start_0
    iget-object v2, p0, Ll/yet0;->g:[F

    .line 29
    .line 30
    const/16 v5, 0x9

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    new-array v2, v5, [F

    .line 35
    .line 36
    iput-object v2, p0, Ll/yet0;->g:[F

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_2

    .line 41
    :cond_1
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    iget-object v1, p0, Ll/yet0;->e:[F

    .line 43
    .line 44
    invoke-static {v1, p1}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/yet0;->d:Landroid/view/Display;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    const/16 v1, 0x81

    .line 54
    .line 55
    const/4 v2, 0x3

    .line 56
    if-eq p1, v4, :cond_4

    .line 57
    .line 58
    const/16 v6, 0x82

    .line 59
    .line 60
    if-eq p1, v3, :cond_3

    .line 61
    .line 62
    iget-object v1, p0, Ll/yet0;->e:[F

    .line 63
    .line 64
    if-eq p1, v2, :cond_2

    .line 65
    .line 66
    iget-object p1, p0, Ll/yet0;->f:[F

    .line 67
    .line 68
    invoke-static {v1, v0, p1, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    iget-object p1, p0, Ll/yet0;->f:[F

    .line 73
    .line 74
    invoke-static {v1, v6, v4, p1}, Landroid/hardware/SensorManager;->remapCoordinateSystem([FII[F)Z

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    iget-object p1, p0, Ll/yet0;->e:[F

    .line 79
    .line 80
    iget-object v7, p0, Ll/yet0;->f:[F

    .line 81
    .line 82
    invoke-static {p1, v1, v6, v7}, Landroid/hardware/SensorManager;->remapCoordinateSystem([FII[F)Z

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_4
    iget-object p1, p0, Ll/yet0;->e:[F

    .line 87
    .line 88
    iget-object v6, p0, Ll/yet0;->f:[F

    .line 89
    .line 90
    invoke-static {p1, v3, v1, v6}, Landroid/hardware/SensorManager;->remapCoordinateSystem([FII[F)Z

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-object p1, p0, Ll/yet0;->f:[F

    .line 94
    .line 95
    aget v1, p1, v4

    .line 96
    .line 97
    aget v6, p1, v2

    .line 98
    .line 99
    aput v6, p1, v4

    .line 100
    .line 101
    aput v1, p1, v2

    .line 102
    .line 103
    aget v1, p1, v3

    .line 104
    .line 105
    const/4 v2, 0x6

    .line 106
    aget v4, p1, v2

    .line 107
    .line 108
    aput v4, p1, v3

    .line 109
    .line 110
    aput v1, p1, v2

    .line 111
    .line 112
    const/4 v1, 0x5

    .line 113
    aget v2, p1, v1

    .line 114
    .line 115
    const/4 v3, 0x7

    .line 116
    aget v4, p1, v3

    .line 117
    .line 118
    aput v4, p1, v1

    .line 119
    .line 120
    aput v2, p1, v3

    .line 121
    .line 122
    iget-object p1, p0, Ll/yet0;->c:Ljava/lang/Object;

    .line 123
    .line 124
    monitor-enter p1

    .line 125
    :try_start_1
    iget-object v1, p0, Ll/yet0;->f:[F

    .line 126
    .line 127
    iget-object v2, p0, Ll/yet0;->g:[F

    .line 128
    .line 129
    invoke-static {v1, v0, v2, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    .line 131
    .line 132
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 133
    iget-object p0, p0, Ll/yet0;->i:Ll/xet0;

    .line 134
    .line 135
    if-eqz p0, :cond_5

    .line 136
    .line 137
    invoke-interface {p0}, Ll/xet0;->zza()V

    .line 138
    .line 139
    .line 140
    :cond_5
    return-void

    .line 141
    :catchall_1
    move-exception p0

    .line 142
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 143
    throw p0

    .line 144
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 145
    throw p0
.end method

.method public final b(Ll/xet0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yet0;->i:Ll/xet0;

    .line 2
    .line 3
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yet0;->h:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/yet0;->b:Landroid/hardware/SensorManager;

    .line 7
    .line 8
    const/16 v1, 0xb

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string p0, "No Sensor of TYPE_ROTATION_VECTOR"

    .line 17
    .line 18
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    new-instance v1, Landroid/os/HandlerThread;

    .line 23
    .line 24
    const-string v2, "OrientationMonitor"

    .line 25
    .line 26
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/ukw0;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-direct {v2, v1}, Ll/ukw0;-><init>(Landroid/os/Looper;)V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Ll/yet0;->h:Landroid/os/Handler;

    .line 42
    .line 43
    iget-object v1, p0, Ll/yet0;->b:Landroid/hardware/SensorManager;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {v1, p0, v0, v3, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    const-string v0, "SensorManager.registerListener failed."

    .line 53
    .line 54
    invoke-static {v0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/yet0;->d()V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yet0;->h:Landroid/os/Handler;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/yet0;->b:Landroid/hardware/SensorManager;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/yet0;->h:Landroid/os/Handler;

    .line 12
    .line 13
    new-instance v1, Ll/wet0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wet0;-><init>(Ll/yet0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Ll/yet0;->h:Landroid/os/Handler;

    .line 23
    .line 24
    return-void
.end method

.method public final e([F)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yet0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/yet0;->g:[F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return v1

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/16 v2, 0x9

    .line 14
    .line 15
    invoke-static {p0, v1, p1, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    monitor-exit v0

    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method
