.class public final Le2j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loxc;


# instance fields
.field public final a:Ljava/util/ArrayDeque;

.field public b:Landroid/util/Pair;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Le2j;->a:Ljava/util/ArrayDeque;

    return-void
.end method


# virtual methods
.method public final declared-synchronized a()V
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Le2j;->a:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iput-object v0, p0, Le2j;->b:Landroid/util/Pair;

    if-eqz v0, :cond_24

    sget-object v1, Lfe2;->e:Lde2;

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Runnable;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-nez v0, :cond_1e

    const/4 v0, 0x1

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lorg/chromium/base/task/PostTask;->b(ILjava/lang/Runnable;J)V

    goto :goto_24

    :cond_1e
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0
    :try_end_24
    .catchall {:try_start_1 .. :try_end_24} :catchall_28

    :cond_24
    :goto_24
    monitor-exit p0

    return-void

    :goto_26
    :try_start_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_28

    throw v0

    :catchall_28
    move-exception v0

    goto :goto_26
.end method

.method public final declared-synchronized r(Ljava/lang/Runnable;)V
    .registers 6

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Le2j;->a:Ljava/util/ArrayDeque;

    new-instance v1, Landroid/util/Pair;

    new-instance v2, Ljri;

    const/4 v3, 0x7

    invoke-direct {v2, p0, p1, v3}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p1, 0x0

    invoke-direct {v1, v2, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    iget-object p1, p0, Le2j;->b:Landroid/util/Pair;

    if-nez p1, :cond_19

    invoke-virtual {p0}, Le2j;->a()V
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1d

    :cond_19
    monitor-exit p0

    return-void

    :goto_1b
    :try_start_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1d

    throw p1

    :catchall_1d
    move-exception p1

    goto :goto_1b
.end method
