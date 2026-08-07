.class final Lrx/internal/operators/OperatorBufferWithSize$BufferSkip$BufferSkipProducer;
.super Ljava/util/concurrent/atomic/AtomicBoolean;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "BufferSkipProducer"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2f9355307bc4d2b2L


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip$BufferSkipProducer;->this$0:Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 7

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip$BufferSkipProducer;->this$0:Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget p0, v0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->f:I

    .line 26
    .line 27
    int-to-long v1, p0

    .line 28
    invoke-static {p1, p2, v1, v2}, Ll/rc2;->c(JJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    iget p0, v0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->g:I

    .line 33
    .line 34
    iget v3, v0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->f:I

    .line 35
    .line 36
    sub-int/2addr p0, v3

    .line 37
    int-to-long v3, p0

    .line 38
    const-wide/16 v5, 0x1

    .line 39
    .line 40
    sub-long/2addr p1, v5

    .line 41
    invoke-static {v3, v4, p1, p2}, Ll/rc2;->c(JJ)J

    .line 42
    .line 43
    .line 44
    move-result-wide p0

    .line 45
    invoke-static {v1, v2, p0, p1}, Ll/rc2;->a(JJ)J

    .line 46
    .line 47
    .line 48
    move-result-wide p0

    .line 49
    invoke-static {v0, p0, p1}, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->g(Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;J)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget p0, v0, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->g:I

    .line 54
    .line 55
    int-to-long v1, p0

    .line 56
    invoke-static {p1, p2, v1, v2}, Ll/rc2;->c(JJ)J

    .line 57
    .line 58
    .line 59
    move-result-wide p0

    .line 60
    invoke-static {v0, p0, p1}, Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;->h(Lrx/internal/operators/OperatorBufferWithSize$BufferSkip;J)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void

    .line 64
    :cond_2
    const-string p0, "n >= 0 required but it was "

    .line 65
    .line 66
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
