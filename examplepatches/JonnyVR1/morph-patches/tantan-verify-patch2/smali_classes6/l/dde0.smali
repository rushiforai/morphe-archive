.class public Ll/dde0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dde0$b;,
        Ll/dde0$c;,
        Ll/dde0$a;
    }
.end annotation


# static fields
.field public static volatile g:Ll/dde0;


# instance fields
.field public a:Landroid/hardware/SensorManager;

.field public b:Landroid/hardware/Sensor;

.field public c:Landroid/hardware/SensorEventListener;

.field public d:Ll/dde0$b;

.field public e:Ll/dde0$a;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/dde0;->f:Z

    .line 6
    .line 7
    const-string v0, "sensor"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/hardware/SensorManager;

    .line 14
    .line 15
    iput-object p1, p0, Ll/dde0;->a:Landroid/hardware/SensorManager;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/dde0;->b:Landroid/hardware/Sensor;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_1
    new-instance p1, Ll/dde0$b;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-direct {p1, p0, v0}, Ll/dde0$b;-><init>(Ll/dde0;Ll/ede0;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/dde0;->d:Ll/dde0$b;

    .line 37
    .line 38
    new-instance p1, Ll/dde0$c;

    .line 39
    .line 40
    invoke-direct {p1, p0, v0}, Ll/dde0$c;-><init>(Ll/dde0;Ll/ede0;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/dde0;->c:Landroid/hardware/SensorEventListener;

    .line 44
    .line 45
    return-void
.end method

.method public static bridge synthetic a(Ll/dde0;)Ll/dde0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dde0;->e:Ll/dde0$a;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/dde0;)Ll/dde0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dde0;->d:Ll/dde0$b;

    return-object p0
.end method

.method public static c(Landroid/content/Context;)Ll/dde0;
    .locals 2

    .line 1
    sget-object v0, Ll/dde0;->g:Ll/dde0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/dde0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/dde0;->g:Ll/dde0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/dde0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/dde0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/dde0;->g:Ll/dde0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Ll/dde0;->g:Ll/dde0;

    .line 27
    .line 28
    return-object p0
.end method

.method public static e()V
    .locals 1

    .line 1
    sget-object v0, Ll/dde0;->g:Ll/dde0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/dde0;->g:Ll/dde0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dde0;->f()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dde0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized f()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/dde0;->i()V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/dde0;->a:Landroid/hardware/SensorManager;

    .line 7
    .line 8
    iput-object v0, p0, Ll/dde0;->c:Landroid/hardware/SensorEventListener;

    .line 9
    .line 10
    iput-object v0, p0, Ll/dde0;->b:Landroid/hardware/Sensor;

    .line 11
    .line 12
    iput-object v0, p0, Ll/dde0;->d:Ll/dde0$b;

    .line 13
    .line 14
    iput-object v0, p0, Ll/dde0;->e:Ll/dde0$a;

    .line 15
    .line 16
    sput-object v0, Ll/dde0;->g:Ll/dde0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public g(Ll/dde0$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dde0;->b:Landroid/hardware/Sensor;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/dde0;->a:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-object p1, p0, Ll/dde0;->e:Ll/dde0$a;

    .line 11
    .line 12
    :cond_1
    :goto_0
    return-void
.end method

.method public h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dde0;->b:Landroid/hardware/Sensor;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/dde0;->a:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v2, 0x1

    .line 11
    iput-boolean v2, p0, Ll/dde0;->f:Z

    .line 12
    .line 13
    iget-object p0, p0, Ll/dde0;->c:Landroid/hardware/SensorEventListener;

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    invoke-virtual {v1, p0, v0, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dde0;->b:Landroid/hardware/Sensor;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/dde0;->a:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Ll/dde0;->f:Z

    .line 12
    .line 13
    iget-object p0, p0, Ll/dde0;->c:Landroid/hardware/SensorEventListener;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method
