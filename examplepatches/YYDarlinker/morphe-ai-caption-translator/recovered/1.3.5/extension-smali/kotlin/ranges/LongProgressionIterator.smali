.class public final Lkotlin/ranges/LongProgressionIterator;
.super Lkotlin/collections/LongIterator;
.source "ProgressionIterators.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B!\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\n\u0010\u000b\u001a\u00020\u000cH\u0096\u0082\u0004J\n\u0010\u000e\u001a\u00020\u0003H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u000f\u0010\n\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000b\u001a\u00020\u000cX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\r\u001a\u00020\u0003X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Lkotlin/ranges/LongProgressionIterator;",
        "Lkotlin/collections/LongIterator;",
        "first",
        "",
        "last",
        "step",
        "<init>",
        "(JJJ)V",
        "getStep",
        "()J",
        "finalElement",
        "hasNext",
        "",
        "next",
        "nextLong",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final finalElement:J

.field private hasNext:Z

.field private next:J

.field private final step:J


# direct methods
.method public constructor <init>(JJJ)V
    .registers 9

    .line 64
    invoke-direct {p0}, Lkotlin/collections/LongIterator;-><init>()V

    iput-wide p5, p0, Lkotlin/ranges/LongProgressionIterator;->step:J

    .line 65
    iput-wide p3, p0, Lkotlin/ranges/LongProgressionIterator;->finalElement:J

    const-wide/16 v0, 0x0

    cmp-long p5, p5, v0

    const/4 p6, 0x1

    const/4 v0, 0x0

    if-lez p5, :cond_14

    cmp-long p5, p1, p3

    if-gtz p5, :cond_19

    goto :goto_1a

    :cond_14
    cmp-long p5, p1, p3

    if-ltz p5, :cond_19

    goto :goto_1a

    :cond_19
    move p6, v0

    .line 66
    :goto_1a
    iput-boolean p6, p0, Lkotlin/ranges/LongProgressionIterator;->hasNext:Z

    if-eqz p6, :cond_1f

    goto :goto_20

    :cond_1f
    move-wide p1, p3

    .line 67
    :goto_20
    iput-wide p1, p0, Lkotlin/ranges/LongProgressionIterator;->next:J

    return-void
.end method


# virtual methods
.method public final getStep()J
    .registers 3

    .line 64
    iget-wide v0, p0, Lkotlin/ranges/LongProgressionIterator;->step:J

    return-wide v0
.end method

.method public hasNext()Z
    .registers 1

    .line 69
    iget-boolean p0, p0, Lkotlin/ranges/LongProgressionIterator;->hasNext:Z

    return p0
.end method

.method public nextLong()J
    .registers 5

    .line 72
    iget-wide v0, p0, Lkotlin/ranges/LongProgressionIterator;->next:J

    .line 73
    iget-wide v2, p0, Lkotlin/ranges/LongProgressionIterator;->finalElement:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_16

    .line 74
    iget-boolean v2, p0, Lkotlin/ranges/LongProgressionIterator;->hasNext:Z

    if-eqz v2, :cond_10

    const/4 v2, 0x0

    .line 75
    iput-boolean v2, p0, Lkotlin/ranges/LongProgressionIterator;->hasNext:Z

    return-wide v0

    .line 74
    :cond_10
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0

    .line 78
    :cond_16
    iget-wide v2, p0, Lkotlin/ranges/LongProgressionIterator;->step:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lkotlin/ranges/LongProgressionIterator;->next:J

    return-wide v0
.end method
