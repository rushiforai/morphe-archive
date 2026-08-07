.class public Ll/fyh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fyh0$b;,
        Ll/fyh0$c;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/ExecutorService;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:I

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fyh0$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fyh0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fyh0$a;-><init>(Ll/fyh0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/fyh0;->a:Ljava/util/concurrent/ExecutorService;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/Object;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/fyh0;->b:Ljava/lang/Object;

    .line 21
    .line 22
    new-instance v0, Ljava/lang/Object;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/fyh0;->c:Ljava/lang/Object;

    .line 28
    .line 29
    new-instance v0, Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/fyh0;->e:Ljava/util/List;

    .line 35
    .line 36
    return-void
.end method

.method public synthetic constructor <init>(Ll/gyh0;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ll/fyh0;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/fyh0;Ll/dyh0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fyh0;->f(Ll/dyh0;)V

    return-void
.end method

.method public static d()Ll/fyh0;
    .locals 1

    .line 1
    invoke-static {}, Ll/fyh0$b;->a()Ll/fyh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final b()Ll/fyh0$c;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fyh0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/fyh0;->d:I

    .line 5
    .line 6
    const/4 v2, 0x3

    .line 7
    if-ge v1, v2, :cond_0

    .line 8
    .line 9
    add-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    iput v1, p0, Ll/fyh0;->d:I

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/fyh0;->c(I)Ll/fyh0$c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    monitor-exit v0

    .line 18
    return-object p0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    iget-object v1, p0, Ll/fyh0;->c:Ljava/lang/Object;

    .line 23
    .line 24
    monitor-enter v1

    .line 25
    :try_start_1
    iget-object v0, p0, Ll/fyh0;->e:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-lez v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/fyh0;->e:Ljava/util/List;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/fyh0$c;

    .line 41
    .line 42
    iget v0, p0, Ll/fyh0$c;->b:I

    .line 43
    .line 44
    monitor-exit v1

    .line 45
    return-object p0

    .line 46
    :catchall_1
    move-exception p0

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 49
    iget-object v0, p0, Ll/fyh0;->b:Ljava/lang/Object;

    .line 50
    .line 51
    monitor-enter v0

    .line 52
    :try_start_2
    iget v1, p0, Ll/fyh0;->d:I

    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    iput v1, p0, Ll/fyh0;->d:I

    .line 57
    .line 58
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 59
    invoke-virtual {p0, v1}, Ll/fyh0;->c(I)Ll/fyh0$c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :catchall_2
    move-exception p0

    .line 65
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 66
    throw p0

    .line 67
    :goto_0
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 68
    throw p0

    .line 69
    :goto_1
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 70
    throw p0
.end method

.method public final c(I)Ll/fyh0$c;
    .locals 0

    .line 1
    new-instance p0, Ll/fyh0$c;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/fyh0$c;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e()Ll/dyh0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fyh0;->b()Ll/fyh0$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic f(Ll/dyh0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fyh0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/dyh0;->reset()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/fyh0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    iget-object v1, p0, Ll/fyh0;->e:Ljava/util/List;

    .line 17
    .line 18
    move-object v2, p1

    .line 19
    check-cast v2, Ll/fyh0$c;

    .line 20
    .line 21
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    check-cast p1, Ll/fyh0$c;

    .line 26
    .line 27
    iget-object p0, p0, Ll/fyh0;->e:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p0

    .line 36
    :cond_0
    invoke-virtual {p1}, Ll/dyh0;->release()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public g(Ll/dyh0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fyh0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/fyh0;->d:I

    .line 5
    .line 6
    add-int/lit8 v1, v1, -0x1

    .line 7
    .line 8
    iput v1, p0, Ll/fyh0;->d:I

    .line 9
    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    iget-object v1, p0, Ll/fyh0;->c:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v1

    .line 14
    :try_start_1
    iget-object p0, p0, Ll/fyh0;->e:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    monitor-exit v1

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p0

    .line 24
    :catchall_1
    move-exception p0

    .line 25
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 26
    throw p0
.end method

.method public h(Ll/dyh0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fyh0;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/eyh0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/eyh0;-><init>(Ll/fyh0;Ll/dyh0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 9
    .line 10
    .line 11
    return-void
.end method
