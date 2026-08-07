.class public final Lrx/internal/operators/OperatorEagerConcatMap$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorEagerConcatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

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
.field public final e:Lrx/internal/operators/OperatorEagerConcatMap$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorEagerConcatMap$b<",
            "*TT;>;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public volatile h:Z

.field public i:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorEagerConcatMap$b;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorEagerConcatMap$b<",
            "*TT;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->e:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 5
    .line 6
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance p1, Lrx/internal/util/unsafe/SpscArrayQueue;

    .line 13
    .line 14
    invoke-direct {p1, p2}, Lrx/internal/util/unsafe/SpscArrayQueue;-><init>(I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p1, Ll/ozf0;

    .line 19
    .line 20
    invoke-direct {p1, p2}, Ll/ozf0;-><init>(I)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->f:Ljava/util/Queue;

    .line 24
    .line 25
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->g:Lrx/internal/operators/NotificationLite;

    .line 30
    .line 31
    int-to-long p1, p2

    .line 32
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public g(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->h:Z

    .line 3
    .line 4
    iget-object p0, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->e:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 5
    .line 6
    invoke-virtual {p0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->i:Ljava/lang/Throwable;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->h:Z

    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->e:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 7
    .line 8
    invoke-virtual {p0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->h()V

    .line 9
    .line 10
    .line 11
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
    iget-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->f:Ljava/util/Queue;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->g:Lrx/internal/operators/NotificationLite;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lrx/internal/operators/OperatorEagerConcatMap$a;->e:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 13
    .line 14
    invoke-virtual {p0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->h()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
