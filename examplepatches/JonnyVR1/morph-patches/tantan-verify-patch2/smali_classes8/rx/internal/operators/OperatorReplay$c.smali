.class public final Lrx/internal/operators/OperatorReplay$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorReplay;->k(Ll/ax5;Ll/f2e0;)Ll/ax5;
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
.field public final synthetic a:Lrx/c;


# direct methods
.method public constructor <init>(Lrx/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$c;->a:Lrx/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$c;->a:Lrx/c;

    .line 2
    .line 3
    new-instance v1, Lrx/internal/operators/OperatorReplay$c$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p1}, Lrx/internal/operators/OperatorReplay$c$a;-><init>(Lrx/internal/operators/OperatorReplay$c;Ll/gcg0;Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorReplay$c;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
