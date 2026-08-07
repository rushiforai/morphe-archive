.class public Ll/urd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# static fields
.field public static final e:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static f:I

.field public static final g:I

.field public static final h:Ll/f950;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/f950<",
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final i:Ll/f950;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/f950<",
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final b:I

.field public final c:Ll/f950;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/f950<",
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public volatile d:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/urd0;->e:Lrx/internal/operators/NotificationLite;

    .line 6
    .line 7
    const/16 v0, 0x80

    .line 8
    .line 9
    sput v0, Ll/urd0;->f:I

    .line 10
    .line 11
    invoke-static {}, Ll/cd80;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/16 v0, 0x10

    .line 18
    .line 19
    sput v0, Ll/urd0;->f:I

    .line 20
    .line 21
    :cond_0
    const-string v0, "rx.ring-buffer.size"

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sput v1, Ll/urd0;->f:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catch_0
    move-exception v1

    .line 37
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 38
    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v4, "Failed to set \'rx.buffer.size\' with value "

    .line 42
    .line 43
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, " => "

    .line 50
    .line 51
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_0
    sget v0, Ll/urd0;->f:I

    .line 69
    .line 70
    sput v0, Ll/urd0;->g:I

    .line 71
    .line 72
    new-instance v0, Ll/urd0$a;

    .line 73
    .line 74
    invoke-direct {v0}, Ll/urd0$a;-><init>()V

    .line 75
    .line 76
    .line 77
    sput-object v0, Ll/urd0;->h:Ll/f950;

    .line 78
    .line 79
    new-instance v0, Ll/urd0$b;

    .line 80
    .line 81
    invoke-direct {v0}, Ll/urd0$b;-><init>()V

    .line 82
    .line 83
    .line 84
    sput-object v0, Ll/urd0;->i:Ll/f950;

    .line 85
    .line 86
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 21
    new-instance v0, Ll/poh0;

    sget v1, Ll/urd0;->g:I

    invoke-direct {v0, v1}, Ll/poh0;-><init>(I)V

    invoke-direct {p0, v0, v1}, Ll/urd0;-><init>(Ljava/util/Queue;I)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Queue;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;I)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Ll/urd0;->a:Ljava/util/Queue;

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Ll/urd0;->c:Ll/f950;

    .line 20
    iput p2, p0, Ll/urd0;->b:I

    return-void
.end method

.method public constructor <init>(Ll/f950;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f950<",
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/urd0;->c:Ll/f950;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/f950;->a()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ljava/util/Queue;

    .line 11
    .line 12
    iput-object p1, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 13
    .line 14
    iput p2, p0, Ll/urd0;->b:I

    .line 15
    .line 16
    return-void
.end method

.method public static a()Ll/urd0;
    .locals 3

    .line 1
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/urd0;

    .line 8
    .line 9
    sget-object v1, Ll/urd0;->i:Ll/f950;

    .line 10
    .line 11
    sget v2, Ll/urd0;->g:I

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/urd0;-><init>(Ll/f950;I)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    new-instance v0, Ll/urd0;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/urd0;-><init>()V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public static b()Ll/urd0;
    .locals 3

    .line 1
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/urd0;

    .line 8
    .line 9
    sget-object v1, Ll/urd0;->h:Ll/f950;

    .line 10
    .line 11
    sget v2, Ll/urd0;->g:I

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/urd0;-><init>(Ll/f950;I)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    new-instance v0, Ll/urd0;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/urd0;-><init>()V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method


# virtual methods
.method public c(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Ll/urd0;->e:Lrx/internal/operators/NotificationLite;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/urd0;->e:Lrx/internal/operators/NotificationLite;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/NotificationLite;->g(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/urd0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/urd0;->e:Lrx/internal/operators/NotificationLite;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/internal/operators/NotificationLite;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/urd0;->d:Ljava/lang/Object;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public g(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lrx/exceptions/MissingBackpressureException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v3, Ll/urd0;->e:Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    invoke-virtual {v3, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    xor-int/2addr p1, v1

    .line 19
    move v1, v2

    .line 20
    move v2, p1

    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    new-instance p0, Lrx/exceptions/MissingBackpressureException;

    .line 31
    .line 32
    invoke-direct {p0}, Lrx/exceptions/MissingBackpressureException;-><init>()V

    .line 33
    .line 34
    .line 35
    throw p0

    .line 36
    :cond_2
    const-string p0, "This instance has been unsubscribed and the queue is no longer usable."

    .line 37
    .line 38
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p1
.end method

.method public h()Ljava/lang/Object;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    monitor-exit p0

    .line 8
    return-object v0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Ll/urd0;->d:Ljava/lang/Object;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    move-object v1, v2

    .line 28
    :cond_1
    monitor-exit p0

    .line 29
    return-object v1

    .line 30
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw v0
.end method

.method public i()Ljava/lang/Object;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-object v1

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, p0, Ll/urd0;->d:Ljava/lang/Object;

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iput-object v1, p0, Ll/urd0;->d:Ljava/lang/Object;

    .line 28
    .line 29
    move-object v2, v3

    .line 30
    :cond_1
    monitor-exit p0

    .line 31
    return-object v2

    .line 32
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw v0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public declared-synchronized j()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 3
    .line 4
    iget-object v1, p0, Ll/urd0;->c:Ll/f950;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    iput-object v2, p0, Ll/urd0;->a:Ljava/util/Queue;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ll/f950;->d(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method

.method public unsubscribe()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/urd0;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
