.class public final Lnicoid/network238/okio/SegmentPool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0011\u001a\u00020\tH\u0007J\u0010\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\tH\u0007J\u0010\u0010\u0015\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\rH\u0002R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u000b\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\r0\u000cX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000eR\u0011\u0010\u000f\u001a\u00020\u00058F\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0007\u00a8\u0006\u0016"
    }
    d2 = {
        "Lnicoid/network238/okio/SegmentPool;",
        "",
        "<init>",
        "()V",
        "MAX_SIZE",
        "",
        "getMAX_SIZE",
        "()I",
        "LOCK",
        "Lnicoid/network238/okio/Segment;",
        "HASH_BUCKET_COUNT",
        "hashBuckets",
        "",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "[Ljava/util/concurrent/atomic/AtomicReference;",
        "byteCount",
        "getByteCount",
        "take",
        "recycle",
        "",
        "segment",
        "firstRef",
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


# static fields
.field private static final HASH_BUCKET_COUNT:I

.field public static final INSTANCE:Lnicoid/network238/okio/SegmentPool;

.field private static final LOCK:Lnicoid/network238/okio/Segment;

.field private static final MAX_SIZE:I

.field private static final hashBuckets:[Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okio/Segment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lnicoid/network238/okio/SegmentPool;

    invoke-direct {v0}, Lnicoid/network238/okio/SegmentPool;-><init>()V

    sput-object v0, Lnicoid/network238/okio/SegmentPool;->INSTANCE:Lnicoid/network238/okio/SegmentPool;

    .line 47
    const/high16 v0, 0x10000

    sput v0, Lnicoid/network238/okio/SegmentPool;->MAX_SIZE:I

    .line 50
    new-instance v1, Lnicoid/network238/okio/Segment;

    const/4 v0, 0x0

    new-array v2, v0, [B

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v6}, Lnicoid/network238/okio/Segment;-><init>([BIIZZ)V

    sput-object v1, Lnicoid/network238/okio/SegmentPool;->LOCK:Lnicoid/network238/okio/Segment;

    .line 58
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v1

    shl-int/lit8 v1, v1, 0x1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v1

    sput v1, Lnicoid/network238/okio/SegmentPool;->HASH_BUCKET_COUNT:I

    .line 67
    new-array v2, v1, [Ljava/util/concurrent/atomic/AtomicReference;

    :goto_0
    if-ge v0, v1, :cond_0

    .line 68
    new-instance v3, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 67
    :cond_0
    sput-object v2, Lnicoid/network238/okio/SegmentPool;->hashBuckets:[Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final firstRef()Ljava/util/concurrent/atomic/AtomicReference;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okio/Segment;",
            ">;"
        }
    .end annotation

    .line 126
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    sget v2, Lnicoid/network238/okio/SegmentPool;->HASH_BUCKET_COUNT:I

    int-to-long v2, v2

    const-wide/16 v4, 0x1

    sub-long/2addr v2, v4

    and-long/2addr v0, v2

    long-to-int v0, v0

    .line 127
    sget-object v1, Lnicoid/network238/okio/SegmentPool;->hashBuckets:[Ljava/util/concurrent/atomic/AtomicReference;

    aget-object v0, v1, v0

    return-object v0
.end method

.method public static final recycle(Lnicoid/network238/okio/Segment;)V
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    iget-object v0, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    if-nez v0, :cond_4

    iget-object v0, p0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    if-nez v0, :cond_4

    .line 105
    iget-boolean v0, p0, Lnicoid/network238/okio/Segment;->shared:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    sget-object v0, Lnicoid/network238/okio/SegmentPool;->INSTANCE:Lnicoid/network238/okio/SegmentPool;

    invoke-direct {v0}, Lnicoid/network238/okio/SegmentPool;->firstRef()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    .line 109
    sget-object v1, Lnicoid/network238/okio/SegmentPool;->LOCK:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/Segment;

    if-ne v2, v1, :cond_1

    :goto_0
    return-void

    :cond_1
    const/4 v1, 0x0

    if-eqz v2, :cond_2

    .line 111
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    goto :goto_1

    :cond_2
    move v3, v1

    .line 112
    :goto_1
    sget v4, Lnicoid/network238/okio/SegmentPool;->MAX_SIZE:I

    if-lt v3, v4, :cond_3

    .line 113
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void

    .line 117
    :cond_3
    iput-object v2, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 118
    iput v1, p0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/lit16 v3, v3, 0x2000

    .line 119
    iput v3, p0, Lnicoid/network238/okio/Segment;->limit:I

    .line 121
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void

    .line 104
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final take()Lnicoid/network238/okio/Segment;
    .registers 4

    .line 79
    sget-object v0, Lnicoid/network238/okio/SegmentPool;->INSTANCE:Lnicoid/network238/okio/SegmentPool;

    invoke-direct {v0}, Lnicoid/network238/okio/SegmentPool;->firstRef()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    .line 81
    sget-object v1, Lnicoid/network238/okio/SegmentPool;->LOCK:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okio/Segment;

    if-ne v2, v1, :cond_0

    .line 85
    new-instance v0, Lnicoid/network238/okio/Segment;

    invoke-direct {v0}, Lnicoid/network238/okio/Segment;-><init>()V

    return-object v0

    :cond_0
    const/4 v1, 0x0

    if-nez v2, :cond_1

    .line 89
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 90
    new-instance v0, Lnicoid/network238/okio/Segment;

    invoke-direct {v0}, Lnicoid/network238/okio/Segment;-><init>()V

    return-object v0

    .line 94
    :cond_1
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 95
    iput-object v1, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 96
    const/4 v0, 0x0

    iput v0, v2, Lnicoid/network238/okio/Segment;->limit:I

    return-object v2
.end method


# virtual methods
.method public final getByteCount()I
    .registers 2

    .line 73
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentPool;->firstRef()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okio/Segment;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 74
    :cond_0
    iget v0, v0, Lnicoid/network238/okio/Segment;->limit:I

    return v0
.end method

.method public final getMAX_SIZE()I
    .registers 2

    .line 47
    sget v0, Lnicoid/network238/okio/SegmentPool;->MAX_SIZE:I

    return v0
.end method
