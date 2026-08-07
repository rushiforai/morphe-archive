.class public final Lrx/internal/operators/OperatorReplay$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorReplay;->j(Ll/pcj;Ll/qcj;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/pcj;

.field public final synthetic b:Ll/qcj;


# direct methods
.method public constructor <init>(Ll/pcj;Ll/qcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$b;->a:Ll/pcj;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/operators/OperatorReplay$b;->b:Ll/qcj;

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
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$b;->a:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ax5;

    .line 8
    .line 9
    iget-object v1, p0, Lrx/internal/operators/OperatorReplay$b;->b:Ll/qcj;

    .line 10
    .line 11
    invoke-interface {v1, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    new-instance v1, Lrx/internal/operators/OperatorReplay$b$a;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lrx/internal/operators/OperatorReplay$b$a;-><init>(Lrx/internal/operators/OperatorReplay$b;Ll/gcg0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/ax5;->c(Ll/y20;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    invoke-static {p0, p1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorReplay$b;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
