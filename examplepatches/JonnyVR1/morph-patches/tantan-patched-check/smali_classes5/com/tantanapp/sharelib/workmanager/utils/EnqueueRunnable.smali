.class public final Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0017\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0005H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000b\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0011\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u000cR\u0014\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0012R\u0016\u0010\u0015\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0014R\u0016\u0010\u0018\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;",
        "Ljava/lang/Runnable;",
        "",
        "run",
        "()V",
        "Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;",
        "workContinuation",
        "d",
        "(Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;)V",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "worker",
        "e",
        "(Lcom/tantanapp/sharelib/workmanager/Worker;)V",
        "c",
        "Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "a",
        "(Lcom/tantanapp/sharelib/workmanager/Worker;)Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "b",
        "Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;",
        "Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;",
        "Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;",
        "realResult",
        "",
        "Z",
        "interrupted",
        "workmanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Z


# virtual methods
.method public final a(Lcom/tantanapp/sharelib/workmanager/Worker;)Lcom/tantanapp/sharelib/workmanager/Constraints;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final b(Lcom/tantanapp/sharelib/workmanager/Worker;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->b:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->b()Lcom/tantanapp/sharelib/workmanager/Result;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    check-cast p0, Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Result$Failure;->b()Ljava/lang/Throwable;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    new-instance p0, Ljava/lang/Exception;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v2, "Worker "

    .line 27
    .line 28
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->d()Ljava/util/Set;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p1, " get exception"

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {v0, p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final c(Lcom/tantanapp/sharelib/workmanager/Worker;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->a(Lcom/tantanapp/sharelib/workmanager/Worker;)Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Constraints;->b()Lkotlin/jvm/functions/Function1;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->startWork()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->b:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->b()Lcom/tantanapp/sharelib/workmanager/Result;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v0, v0, Lcom/tantanapp/sharelib/workmanager/Result$Retry;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->c(Lcom/tantanapp/sharelib/workmanager/Worker;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->b:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->b()Lcom/tantanapp/sharelib/workmanager/Result;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v0, v0, Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->b(Lcom/tantanapp/sharelib/workmanager/Worker;)V

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->c:Z

    .line 55
    .line 56
    :cond_2
    :goto_0
    return-void
.end method

.method public final d(Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;->a()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v1, v0

    .line 8
    check-cast v1, Ljava/util/Collection;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    check-cast v0, Ljava/lang/Iterable;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->d(Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;->b()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/Iterable;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/tantanapp/sharelib/workmanager/Worker;

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->a(Lcom/tantanapp/sharelib/workmanager/Worker;)Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/tantanapp/sharelib/workmanager/Constraints;->a()Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_1

    .line 69
    .line 70
    iget-boolean v2, p0, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->c:Z

    .line 71
    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_1
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {p1, v2}, Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;->c(Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v1}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->e(Lcom/tantanapp/sharelib/workmanager/Worker;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    :goto_2
    return-void
.end method

.method public final e(Lcom/tantanapp/sharelib/workmanager/Worker;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->markEnqueue()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->b:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->f(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->c(Lcom/tantanapp/sharelib/workmanager/Worker;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->a:Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tantanapp/sharelib/workmanager/utils/EnqueueRunnable;->d(Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
