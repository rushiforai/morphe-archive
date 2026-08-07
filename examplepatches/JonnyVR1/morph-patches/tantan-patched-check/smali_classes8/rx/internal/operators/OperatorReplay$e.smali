.class public final Lrx/internal/operators/OperatorReplay$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorReplay;->f(Lrx/c;I)Ll/ax5;
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


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lrx/internal/operators/OperatorReplay$e;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lrx/internal/operators/OperatorReplay$h;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/internal/operators/OperatorReplay$h<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorReplay$SizeBoundReplayBuffer;

    .line 2
    .line 3
    iget p0, p0, Lrx/internal/operators/OperatorReplay$e;->a:I

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorReplay$SizeBoundReplayBuffer;-><init>(I)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$e;->a()Lrx/internal/operators/OperatorReplay$h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
