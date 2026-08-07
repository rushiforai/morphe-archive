.class public Ll/nwd0;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public f:Z


# direct methods
.method public constructor <init>(Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nwd0;->e:Ll/gcg0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ll/nwd0;->e:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Lrx/exceptions/OnErrorNotImplementedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    .line 8
    .line 9
    :try_start_1
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Lrx/exceptions/OnErrorFailedException;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Lrx/exceptions/OnErrorFailedException;-><init>(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    throw p1

    .line 23
    :catchall_1
    move-exception v0

    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :goto_0
    invoke-static {v0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    :try_start_2
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 31
    .line 32
    .line 33
    new-instance p0, Lrx/exceptions/OnErrorFailedException;

    .line 34
    .line 35
    new-instance v1, Lrx/exceptions/CompositeException;

    .line 36
    .line 37
    filled-new-array {p1, v0}, [Ljava/lang/Throwable;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-direct {v1, p1}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    .line 46
    .line 47
    .line 48
    const-string p1, "Error occurred when trying to propagate error to Observer.onError"

    .line 49
    .line 50
    invoke-direct {p0, p1, v1}, Lrx/exceptions/OnErrorFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    throw p0

    .line 54
    :catchall_2
    move-exception p0

    .line 55
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    new-instance v1, Lrx/exceptions/OnErrorFailedException;

    .line 59
    .line 60
    new-instance v2, Lrx/exceptions/CompositeException;

    .line 61
    .line 62
    filled-new-array {p1, v0, p0}, [Ljava/lang/Throwable;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-direct {v2, p0}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    .line 71
    .line 72
    .line 73
    const-string p0, "Error occurred when trying to propagate error to Observer.onError and during unsubscription."

    .line 74
    .line 75
    invoke-direct {v1, p0, v2}, Lrx/exceptions/OnErrorFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    throw v1

    .line 79
    :goto_1
    :try_start_3
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 80
    .line 81
    .line 82
    throw v0

    .line 83
    :catchall_3
    move-exception p0

    .line 84
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Lrx/exceptions/OnErrorNotImplementedException;

    .line 88
    .line 89
    new-instance v1, Lrx/exceptions/CompositeException;

    .line 90
    .line 91
    filled-new-array {p1, p0}, [Ljava/lang/Throwable;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-direct {v1, p0}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    .line 100
    .line 101
    .line 102
    const-string p0, "Observer.onError not implemented and error while unsubscribing."

    .line 103
    .line 104
    invoke-direct {v0, p0, v1}, Lrx/exceptions/OnErrorNotImplementedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    throw v0
.end method

.method public h()Ll/gcg0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nwd0;->e:Ll/gcg0;

    .line 2
    .line 3
    return-object p0
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/nwd0;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/nwd0;->f:Z

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Ll/nwd0;->e:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    .line 13
    :try_start_1
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Lrx/exceptions/UnsubscribeFailedException;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1, p0}, Lrx/exceptions/UnsubscribeFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    throw v0

    .line 31
    :catchall_1
    move-exception v0

    .line 32
    :try_start_2
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Lrx/exceptions/OnCompletedFailedException;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-direct {v1, v2, v0}, Lrx/exceptions/OnCompletedFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 48
    :catchall_2
    move-exception v0

    .line 49
    :try_start_3
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 50
    .line 51
    .line 52
    throw v0

    .line 53
    :catchall_3
    move-exception p0

    .line 54
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lrx/exceptions/UnsubscribeFailedException;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-direct {v0, v1, p0}, Lrx/exceptions/UnsubscribeFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    throw v0

    .line 67
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/nwd0;->f:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/nwd0;->f:Z

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/nwd0;->g(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-boolean v0, p0, Ll/nwd0;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/nwd0;->e:Ll/gcg0;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void

    .line 14
    :goto_0
    invoke-static {p1, p0}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
