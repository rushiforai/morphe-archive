.class public Lcom/tantanapp/common/utils/ThreadUtil$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/utils/ThreadUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/concurrent/PriorityBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/PriorityBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/PriorityBlockingQueue;

    .line 19
    .line 20
    new-instance v1, Ll/jyi0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/jyi0;-><init>(Lcom/tantanapp/common/utils/ThreadUtil$b;)V

    .line 23
    .line 24
    .line 25
    const/16 v2, 0xb

    .line 26
    .line 27
    invoke-direct {v0, v2, v1}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>(ILjava/util/Comparator;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->c:Ljava/util/concurrent/PriorityBlockingQueue;

    .line 31
    .line 32
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantanapp/common/utils/ThreadUtil$a;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/tantanapp/common/utils/ThreadUtil$b;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/utils/ThreadUtil$b;Ljava/lang/Runnable;Ljava/lang/Runnable;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    instance-of v1, p2, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;

    .line 14
    .line 15
    move-object v1, p2

    .line 16
    check-cast v1, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;->b(Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object p0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    :goto_0
    sub-int/2addr p1, p0

    .line 37
    return p1

    .line 38
    :cond_0
    return v0

    .line 39
    :cond_1
    if-eqz v0, :cond_2

    .line 40
    .line 41
    check-cast p1, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;->a(Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;)Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;->access$200(Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    add-int/lit8 p0, p0, -0x1

    .line 52
    .line 53
    return p0

    .line 54
    :cond_2
    instance-of v0, p2, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    check-cast p2, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;

    .line 59
    .line 60
    invoke-static {p2}, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;->a(Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;)Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;->access$200(Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    rsub-int/lit8 p0, p0, 0x1

    .line 69
    .line 70
    return p0

    .line 71
    :cond_3
    iget-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iget-object p0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 78
    .line 79
    invoke-virtual {p0, p2}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized b(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    instance-of v0, p1, Lcom/tantanapp/common/utils/ThreadUtil$c;

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lcom/tantanapp/common/utils/ThreadUtil$c;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/common/utils/ThreadUtil$c;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/tantanapp/common/utils/ThreadUtil$c;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->c:Ljava/util/concurrent/PriorityBlockingQueue;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/util/concurrent/PriorityBlockingQueue;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->a:Ljava/util/Map;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/tantanapp/common/utils/ThreadUtil$c;->a()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->c:Ljava/util/concurrent/PriorityBlockingQueue;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/util/concurrent/PriorityBlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    monitor-exit p0

    .line 56
    return-void

    .line 57
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw p1
.end method

.method public declared-synchronized c()Ljava/lang/Runnable;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->c:Ljava/util/concurrent/PriorityBlockingQueue;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/PriorityBlockingQueue;->poll()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljava/lang/Runnable;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->b:Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    instance-of v1, v0, Lcom/tantanapp/common/utils/ThreadUtil$c;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    move-object v1, v0

    .line 22
    check-cast v1, Lcom/tantanapp/common/utils/ThreadUtil$c;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->a:Ljava/util/Map;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantanapp/common/utils/ThreadUtil$c;->a()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    monitor-exit p0

    .line 37
    return-object v0

    .line 38
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw v0
.end method

.method public declared-synchronized d()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/common/utils/ThreadUtil$b;->c:Ljava/util/concurrent/PriorityBlockingQueue;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/PriorityBlockingQueue;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method
