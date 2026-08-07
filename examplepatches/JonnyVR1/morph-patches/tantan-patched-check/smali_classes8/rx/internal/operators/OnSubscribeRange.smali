.class public final Lrx/internal/operators/OnSubscribeRange;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OnSubscribeRange$RangeProducer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lrx/internal/operators/OnSubscribeRange;->a:I

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OnSubscribeRange;->b:I

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
            "-",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OnSubscribeRange$RangeProducer;

    .line 2
    .line 3
    iget v1, p0, Lrx/internal/operators/OnSubscribeRange;->a:I

    .line 4
    .line 5
    iget p0, p0, Lrx/internal/operators/OnSubscribeRange;->b:I

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, p0}, Lrx/internal/operators/OnSubscribeRange$RangeProducer;-><init>(Ll/gcg0;II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OnSubscribeRange;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
