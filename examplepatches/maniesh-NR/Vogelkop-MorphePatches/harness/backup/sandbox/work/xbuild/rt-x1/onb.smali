.class public final Lonb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final a:Ljnb;

.field public final b:Ldnb;

.field public final c:Ljava/util/ArrayDeque;

.field public d:Z


# direct methods
.method public constructor <init>(Ljnb;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ldnb;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Ldnb;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lonb;->b:Ldnb;

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lonb;->c:Ljava/util/ArrayDeque;

    iput-object p1, p0, Lonb;->a:Ljnb;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .registers 4

    iget-object v0, p0, Lonb;->c:Ljava/util/ArrayDeque;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lonb;->c:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_19

    :try_start_8
    iget-object p1, p0, Lonb;->a:Ljnb;

    iget-object v1, p0, Lonb;->b:Ldnb;

    invoke-virtual {p1, v1}, Ljnb;->execute(Ljava/lang/Runnable;)V
    :try_end_f
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_8 .. :try_end_f} :catch_10
    .catchall {:try_start_8 .. :try_end_f} :catchall_19

    goto :goto_15

    :catch_10
    :try_start_10
    iget-object p0, p0, Lonb;->c:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    :goto_15
    monitor-exit v0

    return-void

    :goto_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_19

    throw p0

    :catchall_19
    move-exception p0

    goto :goto_17
.end method
