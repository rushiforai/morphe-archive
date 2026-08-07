.class public Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager$a;,
        Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager$DisCardException;
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:Z

.field public volatile d:Z

.field public e:Ll/e7m;

.field public f:Z

.field public g:Ll/f2e0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1f4

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->a:J

    .line 7
    .line 8
    const-wide/16 v0, 0xf

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->b:J

    .line 11
    .line 12
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->g:Ll/f2e0;

    .line 21
    .line 22
    return-void
.end method

.method public static b()Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager$a;->a()Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a()Ll/e7m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->e:Ll/e7m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "\u9700\u8981setIOThreadPool"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->f:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->a()Ll/e7m;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/oxh0;->n(Ll/e7m;)Ll/qcj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/hrd0;->r(Ll/qcj;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public f(Ll/e7m;)Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->e:Ll/e7m;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->e()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public g(Z)Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public i(J)Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;->a:J

    .line 2
    .line 3
    return-object p0
.end method
