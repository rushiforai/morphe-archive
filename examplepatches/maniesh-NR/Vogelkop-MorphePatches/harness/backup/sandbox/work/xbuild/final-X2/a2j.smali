.class public final La2j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# static fields
.field public static final f:Ljava/util/logging/Logger;


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ljava/util/ArrayDeque;

.field public c:I

.field public d:J

.field public final e:Lwr9;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, La2j;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, La2j;->f:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, La2j;->b:Ljava/util/ArrayDeque;

    const/4 v0, 0x1

    iput v0, p0, La2j;->c:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, La2j;->d:J

    new-instance v0, Lwr9;

    invoke-direct {v0, p0}, Lwr9;-><init>(La2j;)V

    iput-object v0, p0, La2j;->e:Lwr9;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    iput-object p1, p0, La2j;->a:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .registers 9

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, La2j;->b:Ljava/util/ArrayDeque;

    monitor-enter v0

    :try_start_6
    iget v1, p0, La2j;->c:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_60

    const/4 v2, 0x3

    if-eq v1, v2, :cond_60

    iget-wide v3, p0, La2j;->d:J

    new-instance v1, Lgg;

    const/4 v5, 0x5

    invoke-direct {v1, p1, v5}, Lgg;-><init>(Ljava/lang/Runnable;B)V

    iget-object p1, p0, La2j;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p1, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x2

    iput p1, p0, La2j;->c:I

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_6 .. :try_end_1f} :catchall_69

    :try_start_1f
    iget-object v0, p0, La2j;->a:Ljava/util/concurrent/Executor;

    iget-object v5, p0, La2j;->e:Lwr9;

    invoke-interface {v0, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_26
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_26} :catch_3f
    .catch Ljava/lang/Error; {:try_start_1f .. :try_end_26} :catch_3f

    iget v0, p0, La2j;->c:I

    if-ne v0, p1, :cond_5a

    iget-object v0, p0, La2j;->b:Ljava/util/ArrayDeque;

    monitor-enter v0

    :try_start_2d
    iget-wide v5, p0, La2j;->d:J

    cmp-long v1, v5, v3

    if-nez v1, :cond_39

    iget v1, p0, La2j;->c:I

    if-ne v1, p1, :cond_39

    iput v2, p0, La2j;->c:I

    :cond_39
    monitor-exit v0

    return-void

    :goto_3b
    monitor-exit v0
    :try_end_3c
    .catchall {:try_start_2d .. :try_end_3c} :catchall_3d

    throw p0

    :catchall_3d
    move-exception p0

    goto :goto_3b

    :catch_3f
    move-exception v0

    iget-object v2, p0, La2j;->b:Ljava/util/ArrayDeque;

    monitor-enter v2

    :try_start_43
    iget v3, p0, La2j;->c:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_4a

    if-ne v3, p1, :cond_52

    :cond_4a
    iget-object p0, p0, La2j;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p0, v1}, Ljava/util/ArrayDeque;->removeLastOccurrence(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    :cond_52
    const/4 v4, 0x0

    :cond_53
    instance-of p0, v0, Ljava/util/concurrent/RejectedExecutionException;

    if-eqz p0, :cond_5b

    if-nez v4, :cond_5b

    monitor-exit v2

    :cond_5a
    return-void

    :cond_5b
    throw v0

    :goto_5c
    monitor-exit v2
    :try_end_5d
    .catchall {:try_start_43 .. :try_end_5d} :catchall_5e

    throw p0

    :catchall_5e
    move-exception p0

    goto :goto_5c

    :cond_60
    :try_start_60
    iget-object p0, p0, La2j;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_67
    monitor-exit v0
    :try_end_68
    .catchall {:try_start_60 .. :try_end_68} :catchall_69

    throw p0

    :catchall_69
    move-exception p0

    goto :goto_67
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SequentialExecutor@"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, La2j;->a:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
