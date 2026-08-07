.class public Ll/lwk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lwk$b;
    }
.end annotation


# instance fields
.field private final a:Landroid/hardware/SensorManager;

.field private final b:Landroid/hardware/Sensor;

.field private final c:[F

.field private d:F

.field private final e:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/lwk$b;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Landroid/hardware/SensorEventListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Ll/lwk;->c:[F

    .line 8
    .line 9
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 15
    .line 16
    new-instance v0, Ll/lwk$a;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/lwk$a;-><init>(Ll/lwk;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/lwk;->f:Landroid/hardware/SensorEventListener;

    .line 22
    .line 23
    const-string v0, "Gyro"

    .line 24
    .line 25
    invoke-static {v0, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    const-string v0, "sensor"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/hardware/SensorManager;

    .line 37
    .line 38
    iput-object p1, p0, Ll/lwk;->a:Landroid/hardware/SensorManager;

    .line 39
    .line 40
    const/4 v0, 0x4

    .line 41
    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Ll/lwk;->b:Landroid/hardware/Sensor;

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Ll/lwk;->a:Landroid/hardware/SensorManager;

    .line 50
    .line 51
    iput-object p1, p0, Ll/lwk;->b:Landroid/hardware/Sensor;

    .line 52
    .line 53
    const-string p0, "Gyro init failed, no context"

    .line 54
    .line 55
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static synthetic a(Ll/lwk;)F
    .locals 0

    .line 1
    iget p0, p0, Ll/lwk;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/lwk;F)F
    .locals 0

    .line 1
    iput p1, p0, Ll/lwk;->d:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/lwk;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lwk;->c:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/lwk;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/lwk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lwk;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    const-string v0, "Gyro"

    .line 2
    .line 3
    const-string v1, "clearAngle"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/lwk;->c:[F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    aput v1, p0, v0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    aput v1, p0, v0

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    aput v1, p0, v0

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public g()V
    .locals 2

    .line 1
    const-string v0, "Gyro"

    .line 2
    .line 3
    const-string v1, "destroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/lwk;->f()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/lwk;->a:Landroid/hardware/SensorManager;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Ll/lwk;->f:Landroid/hardware/SensorEventListener;

    .line 21
    .line 22
    iget-object p0, p0, Ll/lwk;->b:Landroid/hardware/Sensor;

    .line 23
    .line 24
    invoke-virtual {v0, v1, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public h(Ll/lwk$b;Landroid/os/Handler;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/lwk;->a:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    const-string v0, "register"

    .line 16
    .line 17
    const-string v1, "Gyro"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v2, 0x1

    .line 34
    if-ne v0, v2, :cond_2

    .line 35
    .line 36
    :try_start_0
    iget-object v0, p0, Ll/lwk;->a:Landroid/hardware/SensorManager;

    .line 37
    .line 38
    iget-object v2, p0, Ll/lwk;->f:Landroid/hardware/SensorEventListener;

    .line 39
    .line 40
    iget-object v3, p0, Ll/lwk;->b:Landroid/hardware/Sensor;

    .line 41
    .line 42
    const/4 v4, 0x3

    .line 43
    invoke-virtual {v0, v2, v3, v4, p2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catch_0
    move-exception p2

    .line 48
    const-string v0, "sensorManager register listener exception occurred."

    .line 49
    .line 50
    invoke-static {v1, v0, p2}, Lcom/ss/android/ttvecamera/g;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :goto_1
    const-string p1, "sensorManager register listener"

    .line 59
    .line 60
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-direct {p0}, Ll/lwk;->f()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public i(Ll/lwk$b;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lwk;->a:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "unregister"

    .line 7
    .line 8
    const-string v1, "Gyro"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/lwk;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Ll/lwk;->a:Landroid/hardware/SensorManager;

    .line 27
    .line 28
    iget-object v0, p0, Ll/lwk;->f:Landroid/hardware/SensorEventListener;

    .line 29
    .line 30
    iget-object v2, p0, Ll/lwk;->b:Landroid/hardware/Sensor;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 33
    .line 34
    .line 35
    const-string p1, "sensorManager unregister listener"

    .line 36
    .line 37
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-direct {p0}, Ll/lwk;->f()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
