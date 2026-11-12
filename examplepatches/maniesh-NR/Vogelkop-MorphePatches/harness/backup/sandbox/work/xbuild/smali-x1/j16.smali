.class public final Lj16;
.super Ln1;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final c:Ljava/lang/Object;

.field public d:Ljava/util/Collection;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Ln1;-><init>(Landroid/content/Context;Lumi;)V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj16;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-object v0, p0, Lj16;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v1, Li16;

    invoke-virtual {v1}, Li16;->q()Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lj16;->d:Ljava/util/Collection;

    iget-object p0, p0, Lj16;->c:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :goto_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method
