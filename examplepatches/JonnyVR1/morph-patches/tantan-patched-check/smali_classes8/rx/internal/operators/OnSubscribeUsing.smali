.class public final Lrx/internal/operators/OnSubscribeUsing;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OnSubscribeUsing$DisposeAction;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "Resource:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "TResource;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TResource;+",
            "Lrx/c<",
            "+TT;>;>;"
        }
    .end annotation
.end field

.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "-TResource;>;"
        }
    .end annotation
.end field

.field public final d:Z


# direct methods
.method public constructor <init>(Ll/pcj;Ll/qcj;Ll/y20;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "TResource;>;",
            "Ll/qcj<",
            "-TResource;+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/y20<",
            "-TResource;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeUsing;->a:Ll/pcj;

    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/operators/OnSubscribeUsing;->b:Ll/qcj;

    .line 7
    .line 8
    iput-object p3, p0, Lrx/internal/operators/OnSubscribeUsing;->c:Ll/y20;

    .line 9
    .line 10
    iput-boolean p4, p0, Lrx/internal/operators/OnSubscribeUsing;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeUsing;->a:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lrx/internal/operators/OnSubscribeUsing$DisposeAction;

    .line 8
    .line 9
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeUsing;->c:Ll/y20;

    .line 10
    .line 11
    invoke-direct {v1, v2, v0}, Lrx/internal/operators/OnSubscribeUsing$DisposeAction;-><init>(Ll/y20;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    :try_start_1
    iget-object v2, p0, Lrx/internal/operators/OnSubscribeUsing;->b:Ll/qcj;

    .line 18
    .line 19
    invoke-interface {v2, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lrx/c;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 24
    .line 25
    :try_start_2
    iget-boolean v2, p0, Lrx/internal/operators/OnSubscribeUsing;->d:Z

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->doOnTerminate(Ll/x20;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {v0, v1}, Lrx/c;->doAfterTerminate(Ll/x20;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 40
    :goto_0
    :try_start_3
    invoke-static {p1}, Ll/icg0;->c(Ll/gcg0;)Ll/gcg0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 45
    .line 46
    .line 47
    goto :goto_2

    .line 48
    :catchall_1
    move-exception v0

    .line 49
    :try_start_4
    invoke-virtual {p0, v1}, Lrx/internal/operators/OnSubscribeUsing;->b(Ll/x20;)Ljava/lang/Throwable;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    if-eqz p0, :cond_1

    .line 60
    .line 61
    new-instance v1, Lrx/exceptions/CompositeException;

    .line 62
    .line 63
    filled-new-array {v0, p0}, [Ljava/lang/Throwable;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-direct {v1, p0}, Lrx/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p1, v1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_1
    invoke-interface {p1, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :catchall_2
    move-exception v0

    .line 79
    invoke-virtual {p0, v1}, Lrx/internal/operators/OnSubscribeUsing;->b(Ll/x20;)Ljava/lang/Throwable;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    new-instance v1, Lrx/exceptions/CompositeException;

    .line 92
    .line 93
    filled-new-array {v0, p0}, [Ljava/lang/Throwable;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-direct {v1, p0}, Lrx/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p1, v1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_2
    invoke-interface {p1, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :goto_1
    invoke-static {p0, p1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 109
    .line 110
    .line 111
    :goto_2
    return-void
.end method

.method public final b(Ll/x20;)Ljava/lang/Throwable;
    .locals 0

    .line 1
    :try_start_0
    invoke-interface {p1}, Ll/x20;->call()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :catchall_0
    move-exception p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OnSubscribeUsing;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
