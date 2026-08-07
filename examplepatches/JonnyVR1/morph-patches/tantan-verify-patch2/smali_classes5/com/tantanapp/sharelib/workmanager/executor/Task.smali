.class public final Lcom/tantanapp/sharelib/workmanager/executor/Task;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u000bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/executor/Task;",
        "Ljava/lang/Runnable;",
        "Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;",
        "innerExecutor",
        "runnable",
        "<init>",
        "(Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;Ljava/lang/Runnable;)V",
        "",
        "run",
        "()V",
        "a",
        "Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;",
        "b",
        "Ljava/lang/Runnable;",
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


# instance fields
.field public final a:Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;Ljava/lang/Runnable;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/executor/Task;->a:Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/tantanapp/sharelib/workmanager/executor/Task;->b:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/executor/Task;->b:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/executor/Task;->a:Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;->c()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :goto_1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/executor/Task;->a:Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/executor/SerialExecutor;->c()V

    .line 20
    .line 21
    .line 22
    throw v0
.end method
