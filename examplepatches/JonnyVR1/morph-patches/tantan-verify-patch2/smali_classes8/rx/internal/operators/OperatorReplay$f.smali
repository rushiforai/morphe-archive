.class public final Lrx/internal/operators/OperatorReplay$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorReplay;->h(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;I)Ll/ax5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/pcj<",
        "Lrx/internal/operators/OperatorReplay$h<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:J

.field public final synthetic c:Ll/f2e0;


# direct methods
.method public constructor <init>(IJLl/f2e0;)V
    .locals 0

    .line 1
    iput p1, p0, Lrx/internal/operators/OperatorReplay$f;->a:I

    .line 2
    .line 3
    iput-wide p2, p0, Lrx/internal/operators/OperatorReplay$f;->b:J

    .line 4
    .line 5
    iput-object p4, p0, Lrx/internal/operators/OperatorReplay$f;->c:Ll/f2e0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Lrx/internal/operators/OperatorReplay$h;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/operators/OperatorReplay$h<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorReplay$SizeAndTimeBoundReplayBuffer;

    .line 2
    .line 3
    iget v1, p0, Lrx/internal/operators/OperatorReplay$f;->a:I

    .line 4
    .line 5
    iget-wide v2, p0, Lrx/internal/operators/OperatorReplay$f;->b:J

    .line 6
    .line 7
    iget-object p0, p0, Lrx/internal/operators/OperatorReplay$f;->c:Ll/f2e0;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3, p0}, Lrx/internal/operators/OperatorReplay$SizeAndTimeBoundReplayBuffer;-><init>(IJLl/f2e0;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$f;->a()Lrx/internal/operators/OperatorReplay$h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
