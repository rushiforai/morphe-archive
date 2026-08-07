.class public final Ll/y360$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/y360;
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
        "Lrx/c<",
        "TT;>;>;"
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

.field public final f:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ll/f2e0$a;

.field public final h:Ll/wqe0;

.field public final i:Ll/xk90;

.field public final j:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ll/gcg0;Ll/rcj;Ll/f2e0$a;Ll/wqe0;Ll/xk90;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;",
            "Ll/rcj<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/f2e0$a;",
            "Ll/wqe0;",
            "Ll/xk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/y360$a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    iput-object p1, p0, Ll/y360$a;->e:Ll/gcg0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/y360$a;->f:Ll/rcj;

    .line 14
    .line 15
    iput-object p3, p0, Ll/y360$a;->g:Ll/f2e0$a;

    .line 16
    .line 17
    iput-object p4, p0, Ll/y360$a;->h:Ll/wqe0;

    .line 18
    .line 19
    iput-object p5, p0, Ll/y360$a;->i:Ll/xk90;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public g(Lrx/c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/y360$a;->g:Ll/f2e0$a;

    .line 2
    .line 3
    new-instance v1, Ll/y360$a$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/y360$a$a;-><init>(Ll/y360$a;Lrx/c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y360$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y360$a;->g(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
