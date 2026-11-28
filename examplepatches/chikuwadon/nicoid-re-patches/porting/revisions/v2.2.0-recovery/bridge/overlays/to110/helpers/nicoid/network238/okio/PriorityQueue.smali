.class public final Lnicoid/network238/okio/PriorityQueue;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0008\u0008\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\n\u001a\u0004\u0018\u00010\u0008J\u000e\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0008J\u000e\u0010\u000e\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0008J\u0018\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0008H\u0002J\u0018\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0008H\u0002J\u0015\u0010\u0012\u001a\u00020\u0005*\u00020\u00082\u0006\u0010\u0013\u001a\u00020\u0008H\u0082\nR\u0012\u0010\u0004\u001a\u00020\u00058\u0000@\u0000X\u0081\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00080\u00078\u0000@\u0000X\u0081\u000e\u00a2\u0006\u0004\n\u0002\u0010\t\u00a8\u0006\u0014"
    }
    d2 = {
        "Lnicoid/network238/okio/PriorityQueue;",
        "",
        "<init>",
        "()V",
        "size",
        "",
        "array",
        "",
        "Lnicoid/network238/okio/AsyncTimeout;",
        "[Lnicoid/network238/okio/AsyncTimeout;",
        "first",
        "add",
        "",
        "node",
        "remove",
        "heapifyUp",
        "vacantIndex",
        "heapifyDown",
        "compareTo",
        "other",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public array:[Lnicoid/network238/okio/AsyncTimeout;

.field public size:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 381
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 386
    const/16 v0, 0x8

    new-array v0, v0, [Lnicoid/network238/okio/AsyncTimeout;

    iput-object v0, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    return-void
.end method

.method private final compareTo(Lnicoid/network238/okio/AsyncTimeout;Lnicoid/network238/okio/AsyncTimeout;)I
    .registers 12
    .param p1, "$this$compareTo"    # Lnicoid/network238/okio/AsyncTimeout;
    .param p2, "other"    # Lnicoid/network238/okio/AsyncTimeout;

    const-string v0, "<this>"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 509
    .local v0, "$i$f$compareTo":I
    invoke-virtual {p1}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v1

    .line 510
    .local v1, "a":J
    invoke-virtual {p2}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v3

    .line 511
    .local v3, "b":J
    const-wide/16 v5, 0x0

    sub-long v7, v3, v1

    invoke-static {v5, v6, v7, v8}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(JJ)I

    move-result v5

    return v5
.end method

.method private final heapifyDown(ILnicoid/network238/okio/AsyncTimeout;)V
    .registers 12

    :goto_0
    shl-int/lit8 v0, p1, 0x1

    add-int/lit8 v1, v0, 0x1

    .line 477
    iget v2, p0, Lnicoid/network238/okio/PriorityQueue;->size:I

    const-wide/16 v3, 0x0

    if-gt v1, v2, :cond_0

    .line 478
    iget-object v2, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aget-object v0, v2, v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 479
    iget-object v2, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aget-object v1, v2, v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 521
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v5

    .line 522
    invoke-virtual {v1}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v7

    sub-long/2addr v7, v5

    .line 523
    invoke-static {v3, v4, v7, v8}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(JJ)I

    move-result v2

    if-ltz v2, :cond_1

    move-object v0, v1

    goto :goto_1

    :cond_0
    if-gt v0, v2, :cond_2

    .line 486
    iget-object v1, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aget-object v0, v1, v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 524
    :cond_1
    :goto_1
    invoke-virtual {p2}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v1

    .line 525
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v5

    sub-long/2addr v5, v1

    .line 526
    invoke-static {v3, v4, v5, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(JJ)I

    move-result v1

    if-lez v1, :cond_2

    .line 494
    iget v1, v0, Lnicoid/network238/okio/AsyncTimeout;->index:I

    .line 495
    iput p1, v0, Lnicoid/network238/okio/AsyncTimeout;->index:I

    .line 496
    iget-object v2, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aput-object v0, v2, p1

    move p1, v1

    goto :goto_0

    .line 500
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aput-object p2, v0, p1

    .line 501
    iput p1, p2, Lnicoid/network238/okio/AsyncTimeout;->index:I

    return-void
.end method

.method private final heapifyUp(ILnicoid/network238/okio/AsyncTimeout;)V
    .registers 9

    :goto_0
    shr-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    .line 447
    iget-object v1, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 518
    invoke-virtual {v1}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v2

    .line 519
    invoke-virtual {p2}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v4

    sub-long/2addr v4, v2

    .line 520
    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v4, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(JJ)I

    move-result v2

    if-lez v2, :cond_0

    .line 451
    iput p1, v1, Lnicoid/network238/okio/AsyncTimeout;->index:I

    .line 452
    iget-object v2, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aput-object v1, v2, p1

    move p1, v0

    goto :goto_0

    .line 456
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aput-object p2, v0, p1

    .line 457
    iput p1, p2, Lnicoid/network238/okio/AsyncTimeout;->index:I

    return-void
.end method


# virtual methods
.method public final add(Lnicoid/network238/okio/AsyncTimeout;)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 391
    iget v0, p0, Lnicoid/network238/okio/PriorityQueue;->size:I

    add-int/lit8 v0, v0, 0x1

    .line 392
    iput v0, p0, Lnicoid/network238/okio/PriorityQueue;->size:I

    .line 393
    iget-object v1, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    array-length v2, v1

    if-ne v0, v2, :cond_0

    shl-int/lit8 v2, v0, 0x1

    .line 394
    new-array v2, v2, [Lnicoid/network238/okio/AsyncTimeout;

    .line 395
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0xe

    const/4 v7, 0x0

    invoke-static/range {v1 .. v7}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto$default([Ljava/lang/Object;[Ljava/lang/Object;IIIILjava/lang/Object;)[Ljava/lang/Object;

    .line 396
    iput-object v2, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    .line 399
    :cond_0
    invoke-direct {p0, v0, p1}, Lnicoid/network238/okio/PriorityQueue;->heapifyUp(ILnicoid/network238/okio/AsyncTimeout;)V

    return-void
.end method

.method public final first()Lnicoid/network238/okio/AsyncTimeout;
    .registers 3

    .line 388
    iget-object v0, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public final remove(Lnicoid/network238/okio/AsyncTimeout;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 403
    iget v0, p1, Lnicoid/network238/okio/AsyncTimeout;->index:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    .line 404
    iget v2, p0, Lnicoid/network238/okio/PriorityQueue;->size:I

    .line 408
    iget-object v3, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 409
    iput v1, p1, Lnicoid/network238/okio/AsyncTimeout;->index:I

    .line 410
    iget-object v1, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    const/4 v4, 0x0

    aput-object v4, v1, v2

    add-int/lit8 v2, v2, -0x1

    .line 411
    iput v2, p0, Lnicoid/network238/okio/PriorityQueue;->size:I

    if-ne p1, v3, :cond_0

    return-void

    .line 515
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v1

    .line 516
    invoke-virtual {v3}, Lnicoid/network238/okio/AsyncTimeout;->getTimeoutAt$okio()J

    move-result-wide v4

    sub-long/2addr v4, v1

    .line 517
    const-wide/16 v1, 0x0

    invoke-static {v1, v2, v4, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(JJ)I

    move-result p1

    if-nez p1, :cond_1

    .line 419
    iget-object p1, p0, Lnicoid/network238/okio/PriorityQueue;->array:[Lnicoid/network238/okio/AsyncTimeout;

    aput-object v3, p1, v0

    .line 420
    iput v0, v3, Lnicoid/network238/okio/AsyncTimeout;->index:I

    return-void

    :cond_1
    if-gez p1, :cond_2

    .line 424
    invoke-direct {p0, v0, v3}, Lnicoid/network238/okio/PriorityQueue;->heapifyDown(ILnicoid/network238/okio/AsyncTimeout;)V

    return-void

    .line 427
    :cond_2
    invoke-direct {p0, v0, v3}, Lnicoid/network238/okio/PriorityQueue;->heapifyUp(ILnicoid/network238/okio/AsyncTimeout;)V

    return-void

    .line 403
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
