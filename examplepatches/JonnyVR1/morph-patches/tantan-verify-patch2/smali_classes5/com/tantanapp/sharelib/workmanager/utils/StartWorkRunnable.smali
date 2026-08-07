.class public final Lcom/tantanapp/sharelib/workmanager/utils/StartWorkRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004R\u0014\u0010\u0008\u001a\u00020\u00058\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0006\u0010\u0007R\u001a\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\n0\t8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/utils/StartWorkRunnable;",
        "Ljava/lang/Runnable;",
        "",
        "run",
        "()V",
        "Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;",
        "a",
        "Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;",
        "workManagerImpl",
        "",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "b",
        "Ljava/util/List;",
        "workerList",
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
.field public final a:Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/sharelib/workmanager/Worker;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/utils/StartWorkRunnable;->b:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Iterable;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/tantanapp/sharelib/workmanager/Worker;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/tantanapp/sharelib/workmanager/utils/StartWorkRunnable;->a:Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v2, v3}, Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;->b(Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/Worker;->startWork()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method
