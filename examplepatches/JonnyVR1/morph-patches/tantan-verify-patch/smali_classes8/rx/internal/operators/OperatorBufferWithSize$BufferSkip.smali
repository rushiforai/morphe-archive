.class public final Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorBufferWithSize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BufferSkip"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorBufferWithSize$BufferSkip$BufferSkipProducer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final f:I

.field public final g:I

.field public h:J

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "TT;>;>;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->e:Ll/gcg0;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->f:I

    .line 7
    .line 8
    iput p3, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->g:I

    .line 9
    .line 10
    const-wide/16 p1, 0x0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic g(Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public i()Ll/vk90;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip$BufferSkipProducer;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip$BufferSkipProducer;-><init>(Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->i:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->i:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->e:Ll/gcg0;

    .line 9
    .line 10
    invoke-interface {v1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->e:Ll/gcg0;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->i:Ljava/util/List;

    .line 3
    .line 4
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->e:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->h:J

    .line 2
    .line 3
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->i:Ljava/util/List;

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v5, v0, v3

    .line 8
    .line 9
    if-nez v5, :cond_0

    .line 10
    .line 11
    new-instance v2, Ljava/util/ArrayList;

    .line 12
    .line 13
    iget v5, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->f:I

    .line 14
    .line 15
    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->i:Ljava/util/List;

    .line 19
    .line 20
    :cond_0
    const-wide/16 v5, 0x1

    .line 21
    .line 22
    add-long/2addr v0, v5

    .line 23
    iget v5, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->g:I

    .line 24
    .line 25
    int-to-long v5, v5

    .line 26
    cmp-long v5, v0, v5

    .line 27
    .line 28
    if-nez v5, :cond_1

    .line 29
    .line 30
    iput-wide v3, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->h:J

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iput-wide v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->h:J

    .line 34
    .line 35
    :goto_0
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iget v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->f:I

    .line 45
    .line 46
    if-ne p1, v0, :cond_2

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->i:Ljava/util/List;

    .line 50
    .line 51
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->e:Ll/gcg0;

    .line 52
    .line 53
    invoke-interface {p0, v2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method
