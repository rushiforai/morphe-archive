.class public final Lrx/internal/operators/BufferUntilSubscriber;
.super Ll/wbg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/BufferUntilSubscriber$b;,
        Lrx/internal/operators/BufferUntilSubscriber$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/wbg0<",
        "TT;TT;>;"
    }
.end annotation


# static fields
.field public static final c:Ll/bb50;


# instance fields
.field public final a:Lrx/internal/operators/BufferUntilSubscriber$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/BufferUntilSubscriber$State<",
            "TT;>;"
        }
    .end annotation
.end field

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/BufferUntilSubscriber$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lrx/internal/operators/BufferUntilSubscriber$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lrx/internal/operators/BufferUntilSubscriber;->c:Ll/bb50;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lrx/internal/operators/BufferUntilSubscriber$State;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/BufferUntilSubscriber$State<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/BufferUntilSubscriber$b;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lrx/internal/operators/BufferUntilSubscriber$b;-><init>(Lrx/internal/operators/BufferUntilSubscriber$State;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/wbg0;-><init>(Lrx/c$a;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 10
    .line 11
    return-void
.end method

.method public static b()Lrx/internal/operators/BufferUntilSubscriber;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/internal/operators/BufferUntilSubscriber<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 2
    .line 3
    invoke-direct {v0}, Lrx/internal/operators/BufferUntilSubscriber$State;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lrx/internal/operators/BufferUntilSubscriber;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lrx/internal/operators/BufferUntilSubscriber;-><init>(Lrx/internal/operators/BufferUntilSubscriber$State;)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method


# virtual methods
.method public final c(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 2
    .line 3
    iget-object v0, v0, Lrx/internal/operators/BufferUntilSubscriber$State;->guard:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 7
    .line 8
    iget-object v1, v1, Lrx/internal/operators/BufferUntilSubscriber$State;->buffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 22
    .line 23
    iget-boolean v1, p1, Lrx/internal/operators/BufferUntilSubscriber$State;->emitting:Z

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Lrx/internal/operators/BufferUntilSubscriber;->b:Z

    .line 29
    .line 30
    iput-boolean v1, p1, Lrx/internal/operators/BufferUntilSubscriber$State;->emitting:Z

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_2

    .line 35
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    iget-boolean p1, p0, Lrx/internal/operators/BufferUntilSubscriber;->b:Z

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    :goto_1
    iget-object p1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 41
    .line 42
    iget-object p1, p1, Lrx/internal/operators/BufferUntilSubscriber$State;->buffer:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 51
    .line 52
    iget-object v1, v0, Lrx/internal/operators/BufferUntilSubscriber$State;->nl:Lrx/internal/operators/NotificationLite;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/bb50;

    .line 59
    .line 60
    invoke-virtual {v1, v0, p1}, Lrx/internal/operators/NotificationLite;->a(Ll/bb50;Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    return-void

    .line 65
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    throw p0
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/BufferUntilSubscriber;->b:Z

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/bb50;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, v1, Lrx/internal/operators/BufferUntilSubscriber$State;->nl:Lrx/internal/operators/NotificationLite;

    .line 18
    .line 19
    invoke-virtual {v0}, Lrx/internal/operators/NotificationLite;->b()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lrx/internal/operators/BufferUntilSubscriber;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/BufferUntilSubscriber;->b:Z

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/bb50;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, v1, Lrx/internal/operators/BufferUntilSubscriber$State;->nl:Lrx/internal/operators/NotificationLite;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lrx/internal/operators/NotificationLite;->c(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/internal/operators/BufferUntilSubscriber;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/BufferUntilSubscriber;->b:Z

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/BufferUntilSubscriber;->a:Lrx/internal/operators/BufferUntilSubscriber$State;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/bb50;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, v1, Lrx/internal/operators/BufferUntilSubscriber$State;->nl:Lrx/internal/operators/NotificationLite;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/internal/operators/BufferUntilSubscriber;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
