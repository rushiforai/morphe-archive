.class public final Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;
.super Lcom/tantanapp/sharelib/workmanager/WorkContinuation;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001J\u0015\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\u0017\u0010\u000c\u001a\u00020\u00078\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\n\u0010\u000bR\u001d\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u000f\u0010\u0011R\u001f\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u0000\u0018\u00010\r8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0010\u001a\u0004\u0008\u0008\u0010\u0011\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;",
        "Lcom/tantanapp/sharelib/workmanager/WorkContinuation;",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "info",
        "",
        "c",
        "(Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;",
        "a",
        "Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;",
        "getWorkManagerImpl",
        "()Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;",
        "workManagerImpl",
        "",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "b",
        "Ljava/util/List;",
        "()Ljava/util/List;",
        "workerList",
        "parents",
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

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# virtual methods
.method public final a()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/sharelib/workmanager/Worker;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/WorkInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/impl/WorkContinuationImpl;->a:Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/impl/WorkManagerImpl;->b(Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
