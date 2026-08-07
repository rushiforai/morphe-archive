.class public final Ll/y360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y360$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;",
        "Lrx/c<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/rcj;
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


# direct methods
.method public constructor <init>(Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y360;->a:Ll/rcj;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-virtual {p1, v4}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    new-instance v5, Ll/wqe0;

    .line 13
    .line 14
    invoke-direct {v5}, Ll/wqe0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v5}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    new-instance v6, Ll/xk90;

    .line 21
    .line 22
    invoke-direct {v6}, Ll/xk90;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v6}, Ll/gcg0;->f(Ll/vk90;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/y360$a;

    .line 29
    .line 30
    iget-object v3, p0, Ll/y360;->a:Ll/rcj;

    .line 31
    .line 32
    move-object v2, p1

    .line 33
    invoke-direct/range {v1 .. v6}, Ll/y360$a;-><init>(Ll/gcg0;Ll/rcj;Ll/f2e0$a;Ll/wqe0;Ll/xk90;)V

    .line 34
    .line 35
    .line 36
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
