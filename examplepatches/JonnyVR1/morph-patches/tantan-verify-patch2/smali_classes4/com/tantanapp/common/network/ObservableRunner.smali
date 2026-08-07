.class final Lcom/tantanapp/common/network/ObservableRunner;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;,
        Lcom/tantanapp/common/network/ObservableRunner$Req;,
        Lcom/tantanapp/common/network/ObservableRunner$Batch;,
        Lcom/tantanapp/common/network/ObservableRunner$OTypeEnum;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "ObservableRunner"


# instance fields
.field private final batches:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/common/network/ObservableRunner$Batch;",
            ">;"
        }
    .end annotation
.end field

.field call:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final executes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;",
            ">;"
        }
    .end annotation
.end field

.field private final executesList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;",
            ">;"
        }
    .end annotation
.end field

.field private volatile stopped:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 17
    .line 18
    new-instance v0, Ljava/util/LinkedList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->executesList:Ljava/util/LinkedList;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->stopped:Z

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/network/ObservableRunner;Ljava/lang/String;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;Lrx/Notification;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 2
    .line 3
    monitor-enter p3

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->executesList:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :goto_0
    monitor-exit p3

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$Req;Lrx/Notification;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->done:Z

    .line 5
    .line 6
    if-nez p2, :cond_1

    .line 7
    .line 8
    iget-object p2, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 9
    .line 10
    monitor-enter p2

    .line 11
    :try_start_0
    iget-boolean v0, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->done:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->done:Z

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->clearDoneRequests()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->tryTopBatch()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    monitor-exit p2

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0

    .line 31
    :cond_1
    return-void
.end method

.method public static synthetic c(Lcom/tantanapp/common/network/ObservableRunner;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->stopped:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;ILcom/tantanapp/common/network/ObservableRunner$Req;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Lcom/tantanapp/common/network/ObservableRunner$Req;->idempotent(Ljava/lang/String;I)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$Req;Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->handleError:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->call:Ll/qcj;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Throwable;

    .line 17
    .line 18
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-static {p2}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic f(Lcom/tantanapp/common/network/ObservableRunner;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->stopped:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->handleError:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->call:Ll/qcj;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Throwable;

    .line 17
    .line 18
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-static {p2}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method


# virtual methods
.method public clearDoneRequests()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 7
    .line 8
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_3

    .line 13
    .line 14
    iget-object v3, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 21
    .line 22
    move v4, v1

    .line 23
    :goto_1
    iget-object v5, v3, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    iget-object v6, v3, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 30
    .line 31
    if-ge v4, v5, :cond_1

    .line 32
    .line 33
    :try_start_1
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Lcom/tantanapp/common/network/ObservableRunner$Req;

    .line 38
    .line 39
    iget-boolean v5, v5, Lcom/tantanapp/common/network/ObservableRunner$Req;->done:Z

    .line 40
    .line 41
    if-eqz v5, :cond_0

    .line 42
    .line 43
    iget-object v5, v3, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v5, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    add-int/lit8 v4, v4, -0x1

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_3

    .line 53
    :cond_0
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    iget-object v3, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 63
    .line 64
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    add-int/lit8 v2, v2, -0x1

    .line 68
    .line 69
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    monitor-exit v0

    .line 73
    return-void

    .line 74
    :goto_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    throw p0
.end method

.method public clearRequests(Ljava/lang/String;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_3

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/tantanapp/common/network/ObservableRunner$Req;

    .line 39
    .line 40
    iget-object v4, v3, Lcom/tantanapp/common/network/ObservableRunner$Req;->id:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    iget v4, v3, Lcom/tantanapp/common/network/ObservableRunner$Req;->type:I

    .line 51
    .line 52
    if-ne v4, p2, :cond_1

    .line 53
    .line 54
    iget-object v4, v3, Lcom/tantanapp/common/network/ObservableRunner$Req;->subs:Ll/kcg0;

    .line 55
    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    invoke-interface {v4}, Ll/kcg0;->unsubscribe()V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    :goto_1
    const/4 v4, 0x1

    .line 65
    iput-boolean v4, v3, Lcom/tantanapp/common/network/ObservableRunner$Req;->done:Z

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->clearDoneRequests()V

    .line 69
    .line 70
    .line 71
    monitor-exit v0

    .line 72
    return-void

    .line 73
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    throw p0
.end method

.method public clearRequestsAndStop()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->stopped:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 5
    .line 6
    monitor-enter v1

    .line 7
    :try_start_0
    iget-object v2, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_2

    .line 18
    .line 19
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lcom/tantanapp/common/network/ObservableRunner$Req;

    .line 42
    .line 43
    iget-object v5, v4, Lcom/tantanapp/common/network/ObservableRunner$Req;->subs:Ll/kcg0;

    .line 44
    .line 45
    if-eqz v5, :cond_1

    .line 46
    .line 47
    invoke-interface {v5}, Ll/kcg0;->unsubscribe()V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_5

    .line 53
    :cond_1
    :goto_1
    iput-boolean v0, v4, Lcom/tantanapp/common/network/ObservableRunner$Req;->done:Z

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->clearDoneRequests()V

    .line 57
    .line 58
    .line 59
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    iget-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 61
    .line 62
    monitor-enter v0

    .line 63
    :try_start_1
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ljava/util/Map$Entry;

    .line 84
    .line 85
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    check-cast v3, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    .line 90
    .line 91
    iget-object v3, v3, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->subs:Ll/kcg0;

    .line 92
    .line 93
    if-eqz v3, :cond_3

    .line 94
    .line 95
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->subs:Ll/kcg0;

    .line 102
    .line 103
    invoke-interface {v2}, Ll/kcg0;->unsubscribe()V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :catchall_1
    move-exception p0

    .line 108
    goto :goto_4

    .line 109
    :cond_4
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->executesList:Ljava/util/LinkedList;

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-eqz v2, :cond_5

    .line 120
    .line 121
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    check-cast v2, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    .line 126
    .line 127
    iget-object v2, v2, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->subs:Ll/kcg0;

    .line 128
    .line 129
    invoke-interface {v2}, Ll/kcg0;->unsubscribe()V

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_5
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->executesList:Ljava/util/LinkedList;

    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 141
    .line 142
    .line 143
    monitor-exit v0

    .line 144
    return-void

    .line 145
    :goto_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 146
    throw p0

    .line 147
    :goto_5
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    throw p0
.end method

.method public findRequest(Ljava/lang/String;I)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "TK;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/tantanapp/common/network/ObservableRunner$Req;

    .line 39
    .line 40
    iget-object v3, v2, Lcom/tantanapp/common/network/ObservableRunner$Req;->id:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    iget v3, v2, Lcom/tantanapp/common/network/ObservableRunner$Req;->type:I

    .line 51
    .line 52
    if-ne v3, p2, :cond_1

    .line 53
    .line 54
    iget-object p0, v2, Lcom/tantanapp/common/network/ObservableRunner$Req;->notifier:Lrx/subjects/a;

    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return-object p0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const/4 p0, 0x0

    .line 61
    monitor-exit v0

    .line 62
    return-object p0

    .line 63
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    throw p0
.end method

.method public just()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/tantanapp/common/network/ObservableRunner;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public now(Ljava/lang/String;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 p1, 0x0

    const/4 v0, 0x1

    .line 90
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/ObservableRunner;->now(Ljava/lang/String;Lrx/c;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public now(Ljava/lang/String;Lrx/c;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lrx/c<",
            "TT;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->notifier:Lrx/subjects/a;

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-object p0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    new-instance v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;

    .line 23
    .line 24
    invoke-direct {v1, p1, p2, p3}, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;-><init>(Ljava/lang/String;Lrx/c;Z)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iput-object p2, v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->notifier:Lrx/subjects/a;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p2, p0, Lcom/tantanapp/common/network/ObservableRunner;->executes:Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-virtual {p2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object p2, p0, Lcom/tantanapp/common/network/ObservableRunner;->executesList:Ljava/util/LinkedList;

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object p2, v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->obs:Lrx/c;

    .line 47
    .line 48
    new-instance p3, Lcom/tantanapp/common/network/c;

    .line 49
    .line 50
    invoke-direct {p3, p0, p1, v1}, Lcom/tantanapp/common/network/c;-><init>(Lcom/tantanapp/common/network/ObservableRunner;Ljava/lang/String;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p3}, Lrx/c;->doOnEach(Ll/y20;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance p2, Lcom/tantanapp/common/network/d;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Lcom/tantanapp/common/network/d;-><init>(Lcom/tantanapp/common/network/ObservableRunner;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Lcom/tantanapp/common/network/e;

    .line 67
    .line 68
    invoke-direct {p2, p0, v1}, Lcom/tantanapp/common/network/e;-><init>(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p2}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p1, v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->notifier:Lrx/subjects/a;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iput-object p0, v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->subs:Ll/kcg0;

    .line 82
    .line 83
    iget-object p0, v1, Lcom/tantanapp/common/network/ObservableRunner$ReqForNow;->notifier:Lrx/subjects/a;

    .line 84
    .line 85
    monitor-exit v0

    .line 86
    return-object p0

    .line 87
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    throw p0
.end method

.method public now(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 89
    invoke-virtual {p0, v0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public runnerStart()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->stopped:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->tryTopBatch()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public runnerStop()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->stopped:Z

    .line 3
    .line 4
    return-void
.end method

.method public scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 137
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/tantanapp/common/network/ObservableRunner;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "scheduled id should not be null"

    .line 6
    .line 7
    invoke-static {p1, v0}, Ll/u11;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    if-nez p2, :cond_2

    .line 14
    .line 15
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 34
    .line 35
    new-instance v3, Lcom/tantanapp/common/network/b;

    .line 36
    .line 37
    invoke-direct {v3, p1, p2}, Lcom/tantanapp/common/network/b;-><init>(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/tantanapp/common/network/ObservableRunner$Req;

    .line 45
    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    sget-object p0, Ll/kmk0;->a:Ljava/lang/String;

    .line 49
    .line 50
    iget-object p0, v2, Lcom/tantanapp/common/network/ObservableRunner$Req;->notifier:Lrx/subjects/a;

    .line 51
    .line 52
    monitor-exit v0

    .line 53
    return-object p0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_2

    .line 56
    :cond_2
    new-instance v1, Lcom/tantanapp/common/network/ObservableRunner$Req;

    .line 57
    .line 58
    invoke-direct {v1, p1, p2, p3, p4}, Lcom/tantanapp/common/network/ObservableRunner$Req;-><init>(Ljava/lang/String;ILl/pcj;Z)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, v1, Lcom/tantanapp/common/network/ObservableRunner$Req;->notifier:Lrx/subjects/a;

    .line 66
    .line 67
    iget p1, v1, Lcom/tantanapp/common/network/ObservableRunner$Req;->type:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    .line 69
    iget-object p3, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 70
    .line 71
    const/4 p4, -0x1

    .line 72
    if-ne p1, p4, :cond_3

    .line 73
    .line 74
    :try_start_1
    new-instance p1, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 75
    .line 76
    invoke-direct {p1, v1, p2}, Lcom/tantanapp/common/network/ObservableRunner$Batch;-><init>(Lcom/tantanapp/common/network/ObservableRunner$Req;I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    invoke-virtual {p3}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_5

    .line 88
    .line 89
    iget-object p1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 96
    .line 97
    invoke-static {p1}, Lcom/tantanapp/common/network/ObservableRunner$Batch;->access$000(Lcom/tantanapp/common/network/ObservableRunner$Batch;)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eq p1, p2, :cond_4

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    iget-object p1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    check-cast p1, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 119
    .line 120
    new-instance p3, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 121
    .line 122
    invoke-direct {p3, v1, p2}, Lcom/tantanapp/common/network/ObservableRunner$Batch;-><init>(Lcom/tantanapp/common/network/ObservableRunner$Req;I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, p3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    :goto_1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->tryTopBatch()V

    .line 129
    .line 130
    .line 131
    iget-object p0, v1, Lcom/tantanapp/common/network/ObservableRunner$Req;->notifier:Lrx/subjects/a;

    .line 132
    .line 133
    monitor-exit v0

    .line 134
    return-object p0

    .line 135
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 136
    throw p0
.end method

.method public setErrorHandler(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/ObservableRunner;->call:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public tryRequest(Lcom/tantanapp/common/network/ObservableRunner$Req;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/network/ObservableRunner$Req<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->subs:Ll/kcg0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->done:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->request:Ll/pcj;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lrx/c;

    .line 18
    .line 19
    new-instance v1, Lcom/tantanapp/common/network/f;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Lcom/tantanapp/common/network/f;-><init>(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$Req;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->doOnEach(Ll/y20;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Lcom/tantanapp/common/network/g;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/tantanapp/common/network/g;-><init>(Lcom/tantanapp/common/network/ObservableRunner;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Lcom/tantanapp/common/network/h;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Lcom/tantanapp/common/network/h;-><init>(Lcom/tantanapp/common/network/ObservableRunner;Lcom/tantanapp/common/network/ObservableRunner$Req;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object v0, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->notifier:Lrx/subjects/a;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iput-object p0, p1, Lcom/tantanapp/common/network/ObservableRunner$Req;->subs:Ll/kcg0;

    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public tryTopBatch()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->stopped:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/tantanapp/common/network/ObservableRunner;->batches:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/tantanapp/common/network/ObservableRunner$Batch;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/tantanapp/common/network/ObservableRunner$Req;

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Lcom/tantanapp/common/network/ObservableRunner;->tryRequest(Lcom/tantanapp/common/network/ObservableRunner$Req;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    monitor-exit v0

    .line 49
    return-void

    .line 50
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0
.end method

.method public wait(Ljava/lang/String;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/ObservableRunner;->findRequest(Ljava/lang/String;I)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Lcom/tantanapp/common/network/a;

    .line 23
    .line 24
    invoke-direct {p1}, Lcom/tantanapp/common/network/a;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
