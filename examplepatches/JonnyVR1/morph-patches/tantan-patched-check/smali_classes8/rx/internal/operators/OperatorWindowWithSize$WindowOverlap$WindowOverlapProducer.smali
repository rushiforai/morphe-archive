.class final Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap$WindowOverlapProducer;
.super Ljava/util/concurrent/atomic/AtomicBoolean;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "WindowOverlapProducer"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x40322bd5c2bb9bacL


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap$WindowOverlapProducer;->this$0:Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;

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
    .locals 5

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
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap$WindowOverlapProducer;->this$0:Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;

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
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget p0, v0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->g:I

    .line 26
    .line 27
    int-to-long v1, p0

    .line 28
    const-wide/16 v3, 0x1

    .line 29
    .line 30
    sub-long v3, p1, v3

    .line 31
    .line 32
    invoke-static {v1, v2, v3, v4}, Ll/rc2;->c(JJ)J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    iget p0, v0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->f:I

    .line 37
    .line 38
    int-to-long v3, p0

    .line 39
    invoke-static {v1, v2, v3, v4}, Ll/rc2;->a(JJ)J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    invoke-static {v0, v1, v2}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->g(Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;J)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget v1, v0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->g:I

    .line 48
    .line 49
    int-to-long v1, v1

    .line 50
    invoke-static {v1, v2, p1, p2}, Ll/rc2;->c(JJ)J

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    iget-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap$WindowOverlapProducer;->this$0:Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;

    .line 55
    .line 56
    invoke-static {p0, v1, v2}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->h(Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;J)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object p0, v0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 60
    .line 61
    invoke-static {p0, p1, p2}, Ll/rc2;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void

    .line 68
    :cond_2
    const-string p0, "n >= 0 required but it was "

    .line 69
    .line 70
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 71
    .line 72
    .line 73
    return-void
.end method
