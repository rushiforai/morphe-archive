.class public final Lrx/internal/operators/OperatorBufferWithSize;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;,
        Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;,
        Lrx/internal/operators/OperatorBufferWithSize$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Ljava/util/List<",
        "TT;>;TT;>;"
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
    if-lez p1, :cond_1

    .line 5
    .line 6
    if-lez p2, :cond_0

    .line 7
    .line 8
    iput p1, p0, Lrx/internal/operators/OperatorBufferWithSize;->a:I

    .line 9
    .line 10
    iput p2, p0, Lrx/internal/operators/OperatorBufferWithSize;->b:I

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "skip must be greater than 0"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0

    .line 20
    :cond_1
    const-string p0, "count must be greater than 0"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    throw p0
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "TT;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lrx/internal/operators/OperatorBufferWithSize;->b:I

    .line 2
    .line 3
    iget p0, p0, Lrx/internal/operators/OperatorBufferWithSize;->a:I

    .line 4
    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lrx/internal/operators/OperatorBufferWithSize$a;

    .line 8
    .line 9
    invoke-direct {v0, p1, p0}, Lrx/internal/operators/OperatorBufferWithSize$a;-><init>(Ll/gcg0;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Lrx/internal/operators/OperatorBufferWithSize$a;->h()Ll/vk90;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    if-le v0, p0, :cond_1

    .line 24
    .line 25
    new-instance v1, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;

    .line 26
    .line 27
    invoke-direct {v1, p1, p0, v0}, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;-><init>(Ll/gcg0;II)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->i()Ll/vk90;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 38
    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_1
    new-instance v1, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;

    .line 42
    .line 43
    invoke-direct {v1, p1, p0, v0}, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;-><init>(Ll/gcg0;II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i()Ll/vk90;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 54
    .line 55
    .line 56
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorBufferWithSize;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
