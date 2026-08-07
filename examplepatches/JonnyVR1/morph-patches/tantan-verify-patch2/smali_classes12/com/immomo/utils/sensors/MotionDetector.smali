.class public Lcom/immomo/utils/sensors/MotionDetector;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;
    }
.end annotation


# instance fields
.field private final a:Landroid/hardware/SensorManager;

.field private final b:Landroid/hardware/Sensor;

.field private c:J

.field private volatile d:Z

.field private volatile e:Z

.field private volatile f:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

.field private final g:Ljava/lang/Object;

.field private h:F

.field private i:F

.field private j:F

.field private k:I

.field private final l:Landroid/hardware/SensorEventListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->d:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/immomo/utils/sensors/MotionDetector;->e:Z

    .line 9
    .line 10
    sget-object v2, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->UNKNOWN:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 11
    .line 12
    iput-object v2, p0, Lcom/immomo/utils/sensors/MotionDetector;->f:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 13
    .line 14
    new-instance v2, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v2, p0, Lcom/immomo/utils/sensors/MotionDetector;->g:Ljava/lang/Object;

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->k:I

    .line 22
    .line 23
    new-instance v0, Lcom/immomo/utils/sensors/MotionDetector$a;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Lcom/immomo/utils/sensors/MotionDetector$a;-><init>(Lcom/immomo/utils/sensors/MotionDetector;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->l:Landroid/hardware/SensorEventListener;

    .line 29
    .line 30
    const/4 v0, 0x6

    .line 31
    new-array v0, v0, [B

    .line 32
    .line 33
    fill-array-data v0, :array_0

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroid/hardware/SensorManager;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->a:Landroid/hardware/SensorManager;

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const/4 p1, 0x0

    .line 56
    :goto_0
    iput-object p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->b:Landroid/hardware/Sensor;

    .line 57
    .line 58
    return-void

    .line 59
    :array_0
    .array-data 1
        0x43t
        0x3t
        0x5ft
        0x44t
        0xet
        0x14t
    .end array-data
.end method

.method public static synthetic a(Lcom/immomo/utils/sensors/MotionDetector;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/MotionDetector;->g:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/immomo/utils/sensors/MotionDetector;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/utils/sensors/MotionDetector;->f:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/immomo/utils/sensors/MotionDetector;Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->f:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic d(Lcom/immomo/utils/sensors/MotionDetector;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/utils/sensors/MotionDetector;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/immomo/utils/sensors/MotionDetector;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->e:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Lcom/immomo/utils/sensors/MotionDetector;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/utils/sensors/MotionDetector;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/immomo/utils/sensors/MotionDetector;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->h:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic h(Lcom/immomo/utils/sensors/MotionDetector;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/utils/sensors/MotionDetector;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Lcom/immomo/utils/sensors/MotionDetector;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->i:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j(Lcom/immomo/utils/sensors/MotionDetector;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/utils/sensors/MotionDetector;->j:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Lcom/immomo/utils/sensors/MotionDetector;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->j:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic l(Lcom/immomo/utils/sensors/MotionDetector;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/utils/sensors/MotionDetector;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m(Lcom/immomo/utils/sensors/MotionDetector;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/utils/sensors/MotionDetector;->k:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic n(Lcom/immomo/utils/sensors/MotionDetector;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->k:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/immomo/utils/sensors/MotionDetector;->k:I

    .line 6
    .line 7
    return v0
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->a:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/immomo/utils/sensors/MotionDetector;->l:Landroid/hardware/SensorEventListener;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->d:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public o()Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->UNKNOWN:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget-wide v2, p0, Lcom/immomo/utils/sensors/MotionDetector;->c:J

    .line 13
    .line 14
    sub-long/2addr v0, v2

    .line 15
    const-wide/16 v2, 0x7d0

    .line 16
    .line 17
    :goto_0
    sub-long v0, v2, v0

    .line 18
    .line 19
    const-wide/16 v4, 0x0

    .line 20
    .line 21
    cmp-long v4, v0, v4

    .line 22
    .line 23
    if-lez v4, :cond_1

    .line 24
    .line 25
    iget-object v4, p0, Lcom/immomo/utils/sensors/MotionDetector;->f:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 26
    .line 27
    sget-object v5, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->MOVING:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 28
    .line 29
    if-eq v4, v5, :cond_1

    .line 30
    .line 31
    const-wide/16 v4, 0x64

    .line 32
    .line 33
    :try_start_0
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iget-wide v4, p0, Lcom/immomo/utils/sensors/MotionDetector;->c:J

    .line 45
    .line 46
    sub-long/2addr v0, v4

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->g:Ljava/lang/Object;

    .line 49
    .line 50
    monitor-enter v0

    .line 51
    :try_start_1
    iget-object v1, p0, Lcom/immomo/utils/sensors/MotionDetector;->f:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 52
    .line 53
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    invoke-direct {p0}, Lcom/immomo/utils/sensors/MotionDetector;->r()V

    .line 55
    .line 56
    .line 57
    return-object v1

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    throw p0
.end method

.method public p()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/utils/sensors/MotionDetector;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->a:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->b:Landroid/hardware/Sensor;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->d:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/immomo/utils/sensors/MotionDetector;->r()V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->g:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v0

    .line 20
    :try_start_0
    sget-object v1, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->UNKNOWN:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/immomo/utils/sensors/MotionDetector;->f:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    iput-boolean v1, p0, Lcom/immomo/utils/sensors/MotionDetector;->e:Z

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    iput v2, p0, Lcom/immomo/utils/sensors/MotionDetector;->k:I

    .line 29
    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    iget-object v0, p0, Lcom/immomo/utils/sensors/MotionDetector;->a:Landroid/hardware/SensorManager;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/immomo/utils/sensors/MotionDetector;->l:Landroid/hardware/SensorEventListener;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/immomo/utils/sensors/MotionDetector;->b:Landroid/hardware/Sensor;

    .line 36
    .line 37
    const/4 v4, 0x3

    .line 38
    invoke-virtual {v0, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    iput-wide v2, p0, Lcom/immomo/utils/sensors/MotionDetector;->c:J

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/immomo/utils/sensors/MotionDetector;->d:Z

    .line 51
    .line 52
    return-void

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw p0

    .line 56
    :cond_2
    :goto_0
    return-void
.end method
