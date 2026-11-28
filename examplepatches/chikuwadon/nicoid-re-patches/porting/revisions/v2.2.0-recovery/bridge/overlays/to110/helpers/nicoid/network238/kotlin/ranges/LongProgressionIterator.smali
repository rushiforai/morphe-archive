.class public final Lnicoid/network238/kotlin/ranges/LongProgressionIterator;
.super Lnicoid/network238/kotlin/collections/LongIterator;
.source "SourceFile"


# instance fields
.field private final finalElement:J

.field private hasNext:Z

.field private next:J

.field private final step:J


# direct methods
.method public constructor <init>(JJJ)V
    .registers 9

    .line 63
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/LongIterator;-><init>()V

    iput-wide p5, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->step:J

    .line 64
    iput-wide p3, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->finalElement:J

    const-wide/16 v0, 0x0

    cmp-long p5, p5, v0

    if-lez p5, :cond_0

    cmp-long p5, p1, p3

    if-gtz p5, :cond_1

    goto :goto_0

    :cond_0
    cmp-long p5, p1, p3

    if-ltz p5, :cond_1

    :goto_0
    const/4 p5, 0x1

    goto :goto_1

    :cond_1
    const/4 p5, 0x0

    .line 65
    :goto_1
    iput-boolean p5, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->hasNext:Z

    if-nez p5, :cond_2

    move-wide p1, p3

    .line 66
    :cond_2
    iput-wide p1, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->next:J

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .line 68
    iget-boolean v0, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->hasNext:Z

    return v0
.end method

.method public nextLong()J
    .registers 5

    .line 71
    iget-wide v0, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->next:J

    .line 72
    iget-wide v2, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->finalElement:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    .line 73
    iget-boolean v2, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->hasNext:Z

    if-eqz v2, :cond_0

    .line 74
    const/4 v2, 0x0

    iput-boolean v2, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->hasNext:Z

    return-wide v0

    .line 73
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 77
    :cond_1
    iget-wide v2, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->step:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lnicoid/network238/kotlin/ranges/LongProgressionIterator;->next:J

    return-wide v0
.end method
