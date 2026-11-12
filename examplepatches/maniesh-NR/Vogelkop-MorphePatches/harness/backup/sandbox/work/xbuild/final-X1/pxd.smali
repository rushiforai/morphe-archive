.class public final Lpxd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li16;

.field public final b:Lqb7;

.field public final c:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lqb7;)V
    .registers 5

    new-instance v0, Li16;

    const/16 v1, 0x18

    invoke-direct {v0, p1, v1}, Li16;-><init>(Landroid/content/Context;B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lpxd;->c:Ljava/util/HashMap;

    iput-object v0, p0, Lpxd;->a:Li16;

    iput-object p2, p0, Lpxd;->b:Lqb7;

    return-void
.end method


# virtual methods
.method public final declared-synchronized a(Ljava/lang/String;)Lo5m;
    .registers 7

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lpxd;->c:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lpxd;->c:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lo5m;
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_3e

    monitor-exit p0

    return-object p1

    :cond_13
    :try_start_13
    iget-object v0, p0, Lpxd;->a:Li16;

    invoke-virtual {v0, p1}, Li16;->p(Ljava/lang/String;)Lcom/google/android/datatransport/cct/CctBackendFactory;

    move-result-object v0
    :try_end_19
    .catchall {:try_start_13 .. :try_end_19} :catchall_3e

    if-nez v0, :cond_1e

    monitor-exit p0

    const/4 p0, 0x0

    return-object p0

    :cond_1e
    :try_start_1e
    iget-object v1, p0, Lpxd;->b:Lqb7;

    iget-object v2, v1, Lqb7;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v3, v1, Lqb7;->b:Ljava/lang/Object;

    check-cast v3, Lt55;

    iget-object v1, v1, Lqb7;->c:Ljava/lang/Object;

    check-cast v1, Lt55;

    new-instance v4, Lbn2;

    invoke-direct {v4, v2, v3, v1, p1}, Lbn2;-><init>(Landroid/content/Context;Lt55;Lt55;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/google/android/datatransport/cct/CctBackendFactory;->create(Lc06;)Lo5m;

    move-result-object v0

    iget-object v1, p0, Lpxd;->c:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a
    .catchall {:try_start_1e .. :try_end_3a} :catchall_3e

    monitor-exit p0

    return-object v0

    :goto_3c
    :try_start_3c
    monitor-exit p0
    :try_end_3d
    .catchall {:try_start_3c .. :try_end_3d} :catchall_3e

    throw p1

    :catchall_3e
    move-exception p1

    goto :goto_3c
.end method
