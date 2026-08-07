.class public final Lrx/internal/operators/OperatorReplay$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorReplay;->i(Lrx/c;Ll/pcj;)Ll/ax5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic b:Ll/pcj;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;Ll/pcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$g;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/operators/OperatorReplay$g;->b:Ll/pcj;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
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
    :goto_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$g;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lrx/internal/operators/OperatorReplay$i;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    new-instance v1, Lrx/internal/operators/OperatorReplay$i;

    .line 12
    .line 13
    iget-object v2, p0, Lrx/internal/operators/OperatorReplay$g;->b:Ll/pcj;

    .line 14
    .line 15
    invoke-interface {v2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lrx/internal/operators/OperatorReplay$h;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Lrx/internal/operators/OperatorReplay$i;-><init>(Lrx/internal/operators/OperatorReplay$h;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Lrx/internal/operators/OperatorReplay$i;->i()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lrx/internal/operators/OperatorReplay$g;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 28
    .line 29
    invoke-static {v2, v0, v1}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v0, v1

    .line 37
    :cond_1
    new-instance p0, Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 38
    .line 39
    invoke-direct {p0, v0, p1}, Lrx/internal/operators/OperatorReplay$InnerProducer;-><init>(Lrx/internal/operators/OperatorReplay$i;Ll/gcg0;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lrx/internal/operators/OperatorReplay$i;->g(Lrx/internal/operators/OperatorReplay$InnerProducer;)Z

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, v0, Lrx/internal/operators/OperatorReplay$i;->e:Lrx/internal/operators/OperatorReplay$h;

    .line 49
    .line 50
    invoke-interface {v0, p0}, Lrx/internal/operators/OperatorReplay$h;->replay(Lrx/internal/operators/OperatorReplay$InnerProducer;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorReplay$g;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
