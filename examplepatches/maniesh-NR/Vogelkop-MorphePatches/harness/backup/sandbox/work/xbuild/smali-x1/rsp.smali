.class public final Lrsp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljup;

.field public final b:Lerp;

.field public final c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljup;Lerp;Landroid/content/Context;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lrsp;->a:Ljup;

    iput-object p2, p0, Lrsp;->b:Lerp;

    iput-object p3, p0, Lrsp;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final declared-synchronized a(Le89;)V
    .registers 6

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lrsp;->b:Lerp;

    monitor-enter v0
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_1f

    :try_start_4
    iget-object v1, v0, Lerp;->a:Lr40;

    const-string v2, "registerListener"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lr40;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, v0, Lerp;->d:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lerp;->a()V
    :try_end_16
    .catchall {:try_start_4 .. :try_end_16} :catchall_1b

    :try_start_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_1f

    monitor-exit p0

    return-void

    :goto_19
    :try_start_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_1b

    :try_start_1a
    throw p1

    :catchall_1b
    move-exception p1

    goto :goto_19

    :goto_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1a .. :try_end_1e} :catchall_1f

    throw p1

    :catchall_1f
    move-exception p1

    goto :goto_1d
.end method
