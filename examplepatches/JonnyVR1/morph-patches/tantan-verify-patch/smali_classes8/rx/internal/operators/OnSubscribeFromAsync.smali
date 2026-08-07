.class public final Lrx/internal/operators/OnSubscribeFromAsync;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OnSubscribeFromAsync$LatestAsyncEmitter;,
        Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;,
        Lrx/internal/operators/OnSubscribeFromAsync$ErrorAsyncEmitter;,
        Lrx/internal/operators/OnSubscribeFromAsync$DropAsyncEmitter;,
        Lrx/internal/operators/OnSubscribeFromAsync$NoOverflowBaseAsyncEmitter;,
        Lrx/internal/operators/OnSubscribeFromAsync$NoneAsyncEmitter;,
        Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;,
        Lrx/internal/operators/OnSubscribeFromAsync$CancellableSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lrx/AsyncEmitter<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final b:Lrx/AsyncEmitter$BackpressureMode;


# direct methods
.method public constructor <init>(Ll/y20;Lrx/AsyncEmitter$BackpressureMode;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lrx/AsyncEmitter<",
            "TT;>;>;",
            "Lrx/AsyncEmitter$BackpressureMode;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeFromAsync;->a:Ll/y20;

    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/operators/OnSubscribeFromAsync;->b:Lrx/AsyncEmitter$BackpressureMode;

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
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lrx/internal/operators/OnSubscribeFromAsync$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeFromAsync;->b:Lrx/AsyncEmitter$BackpressureMode;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_3

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    new-instance v0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;

    .line 24
    .line 25
    sget v1, Ll/urd0;->g:I

    .line 26
    .line 27
    invoke-direct {v0, p1, v1}, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;-><init>(Ll/gcg0;I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    new-instance v0, Lrx/internal/operators/OnSubscribeFromAsync$LatestAsyncEmitter;

    .line 32
    .line 33
    invoke-direct {v0, p1}, Lrx/internal/operators/OnSubscribeFromAsync$LatestAsyncEmitter;-><init>(Ll/gcg0;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    new-instance v0, Lrx/internal/operators/OnSubscribeFromAsync$DropAsyncEmitter;

    .line 38
    .line 39
    invoke-direct {v0, p1}, Lrx/internal/operators/OnSubscribeFromAsync$DropAsyncEmitter;-><init>(Ll/gcg0;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    new-instance v0, Lrx/internal/operators/OnSubscribeFromAsync$ErrorAsyncEmitter;

    .line 44
    .line 45
    invoke-direct {v0, p1}, Lrx/internal/operators/OnSubscribeFromAsync$ErrorAsyncEmitter;-><init>(Ll/gcg0;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    new-instance v0, Lrx/internal/operators/OnSubscribeFromAsync$NoneAsyncEmitter;

    .line 50
    .line 51
    invoke-direct {v0, p1}, Lrx/internal/operators/OnSubscribeFromAsync$NoneAsyncEmitter;-><init>(Ll/gcg0;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lrx/internal/operators/OnSubscribeFromAsync;->a:Ll/y20;

    .line 61
    .line 62
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OnSubscribeFromAsync;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
