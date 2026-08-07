.class public final Lrx/internal/operators/OperatorEagerConcatMap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorEagerConcatMap$a;,
        Lrx/internal/operators/OperatorEagerConcatMap$b;,
        Lrx/internal/operators/OperatorEagerConcatMap$EagerOuterProducer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TR;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;"
        }
    .end annotation
.end field

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(Ll/qcj;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap;->a:Ll/qcj;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorEagerConcatMap;->b:I

    .line 7
    .line 8
    iput p3, p0, Lrx/internal/operators/OperatorEagerConcatMap;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorEagerConcatMap;->a:Ll/qcj;

    .line 4
    .line 5
    iget v2, p0, Lrx/internal/operators/OperatorEagerConcatMap;->b:I

    .line 6
    .line 7
    iget p0, p0, Lrx/internal/operators/OperatorEagerConcatMap;->c:I

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0, p1}, Lrx/internal/operators/OperatorEagerConcatMap$b;-><init>(Ll/qcj;IILl/gcg0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->i()V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorEagerConcatMap;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
