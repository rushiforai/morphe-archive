.class public Ll/yxi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zy0$a;


# instance fields
.field public a:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Z)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/yxi0;->a:J

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-wide v0, p0, Ll/yxi0;->a:J

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long p1, v0, v2

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iget-wide p0, p0, Ll/yxi0;->a:J

    .line 23
    .line 24
    sub-long/2addr v0, p0

    .line 25
    const-wide/32 p0, 0x493e0

    .line 26
    .line 27
    .line 28
    cmp-long p0, v0, p0

    .line 29
    .line 30
    if-lez p0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->b()Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 p1, 0x1

    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->h(Z)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public c(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    mul-int/lit8 v1, p0, 0x2

    .line 10
    .line 11
    mul-int/lit8 v2, p0, 0x3

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->b()Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->g(Z)Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-wide/16 v3, 0xc8

    .line 23
    .line 24
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->i(J)Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    invoke-static {}, Ll/whi0;->i()Ll/whi0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    mul-int/lit8 p0, p0, 0x6

    .line 33
    .line 34
    const/16 v3, 0x14

    .line 35
    .line 36
    invoke-static {p0, v3}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    const/4 v6, 0x1

    .line 41
    const-wide/16 v3, 0xf

    .line 42
    .line 43
    invoke-virtual/range {v0 .. v6}, Ll/whi0;->h(IIJIZ)Ll/whi0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v7, p0}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->f(Ll/e7m;)Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method
