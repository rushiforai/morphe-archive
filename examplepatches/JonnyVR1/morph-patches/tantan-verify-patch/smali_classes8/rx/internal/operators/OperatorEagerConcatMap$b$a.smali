.class public Lrx/internal/operators/OperatorEagerConcatMap$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorEagerConcatMap$b;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/internal/operators/OperatorEagerConcatMap$b;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorEagerConcatMap$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b$a;->a:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b$a;->a:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->k:Z

    .line 5
    .line 6
    iget-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b$a;->a:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 7
    .line 8
    iget-object v0, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b$a;->a:Lrx/internal/operators/OperatorEagerConcatMap$b;

    .line 17
    .line 18
    invoke-virtual {p0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->g()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
