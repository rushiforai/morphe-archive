.class public final Lmsl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final f:Lmsl;


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Loml;

.field public c:J

.field public d:Z

.field public e:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lmsl;

    invoke-direct {v0}, Lmsl;-><init>()V

    sput-object v0, Lmsl;->f:Lmsl;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmsl;->a:Ljava/lang/Object;

    const-wide/32 v0, 0x9c40

    iput-wide v0, p0, Lmsl;->e:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 9

    iget-object v1, p0, Lmsl;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lmsl;->d:Z

    if-eqz v0, :cond_9

    monitor-exit v1

    return-void

    :cond_9
    iget-object v0, p0, Lmsl;->b:Loml;

    if-eqz v0, :cond_f

    monitor-exit v1

    return-void

    :cond_f
    iget-wide v2, p0, Lmsl;->e:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_33

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lmsl;->c:J

    sget-object v0, Lvml;->d:Lumi;

    invoke-interface {v0, p0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v2, Loml;

    invoke-direct {v2, v0}, Loml;-><init>(Lnml;)V

    iput-object v2, p0, Lmsl;->b:Loml;

    iget-wide v4, p0, Lmsl;->e:J

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v7, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v2 .. v7}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_33
    monitor-exit v1

    return-void

    :goto_35
    monitor-exit v1
    :try_end_36
    .catchall {:try_start_3 .. :try_end_36} :catchall_37

    throw p0

    :catchall_37
    move-exception v0

    move-object p0, v0

    goto :goto_35
.end method

.method public final b(Z)V
    .registers 7

    iget-object v0, p0, Lmsl;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lmsl;->b:Loml;

    if-nez v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lmsl;->c:J

    sub-long/2addr v1, v3

    iget-wide v3, p0, Lmsl;->e:J

    sub-long/2addr v3, v1

    iget-object v1, p0, Lmsl;->b:Loml;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Loml;->cancel(Z)Z

    const/4 v1, 0x0

    if-eqz p1, :cond_26

    iput-object v1, p0, Lmsl;->b:Loml;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lmsl;->d:Z

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lmsl;->e:J

    goto :goto_2c

    :cond_26
    iput-object v1, p0, Lmsl;->b:Loml;

    iput-boolean v2, p0, Lmsl;->d:Z

    iput-wide v3, p0, Lmsl;->e:J

    :goto_2c
    monitor-exit v0

    return-void

    :goto_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_3 .. :try_end_2f} :catchall_30

    throw p0

    :catchall_30
    move-exception p0

    goto :goto_2e
.end method

.method public final run()V
    .registers 5

    iget-object v0, p0, Lmsl;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lmsl;->b:Loml;

    if-nez v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    const/4 v1, 0x0

    iput-object v1, p0, Lmsl;->b:Loml;

    const/4 v2, 0x1

    iput-boolean v2, p0, Lmsl;->d:Z

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lmsl;->e:J

    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_1c

    const-string p0, "TooLongLoading[WelcomeFragment]"

    invoke-static {p0, v1}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :goto_1a
    :try_start_1a
    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_1c

    throw p0

    :catchall_1c
    move-exception p0

    goto :goto_1a
.end method
