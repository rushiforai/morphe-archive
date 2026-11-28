.class final Lcom/google/common/cache/LongAdder;
.super Lcom/google/common/cache/Striped64;
.source "LongAdder.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lcom/google/common/cache/LongAddable;


# static fields
.field private static final serialVersionUID:J = 0x6499de12a37d0a3dL


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 55
    invoke-direct {p0}, Lcom/google/common/cache/Striped64;-><init>()V

    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 191
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    const/4 v0, 0x0

    .line 192
    iput v0, p0, Lcom/google/common/cache/LongAdder;->busy:I

    const/4 v0, 0x0

    .line 193
    iput-object v0, p0, Lcom/google/common/cache/LongAdder;->cells:[Lcom/google/common/cache/Striped64$Cell;

    .line 194
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/common/cache/LongAdder;->base:J

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 186
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 187
    invoke-virtual {p0}, Lcom/google/common/cache/LongAdder;->sum()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    return-void
.end method


# virtual methods
.method public add(J)V
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "x"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/google/common/cache/LongAdder;->cells:[Lcom/google/common/cache/Striped64$Cell;

    if-nez v0, :cond_0

    iget-wide v1, p0, Lcom/google/common/cache/LongAdder;->base:J

    add-long v3, v1, p1

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/google/common/cache/LongAdder;->casBase(JJ)Z

    move-result v1

    if-nez v1, :cond_1

    .line 72
    :cond_0
    sget-object v1, Lcom/google/common/cache/LongAdder;->threadHashCode:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    array-length v3, v0

    if-lt v3, v2, :cond_2

    sub-int/2addr v3, v2

    const/4 v4, 0x0

    aget v4, v1, v4

    and-int/2addr v3, v4

    aget-object v0, v0, v3

    if-eqz v0, :cond_2

    iget-wide v2, v0, Lcom/google/common/cache/Striped64$Cell;->value:J

    add-long v4, v2, p1

    .line 76
    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/google/common/cache/Striped64$Cell;->cas(JJ)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    return-void

    :cond_2
    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/common/cache/LongAdder;->retryUpdate(J[IZ)V

    return-void
.end method

.method public decrement()V
    .registers 3

    const-wide/16 v0, -0x1

    .line 88
    invoke-virtual {p0, v0, v1}, Lcom/google/common/cache/LongAdder;->add(J)V

    return-void
.end method

.method public doubleValue()D
    .registers 3

    .line 182
    invoke-virtual {p0}, Lcom/google/common/cache/LongAdder;->sum()J

    move-result-wide v0

    long-to-double v0, v0

    return-wide v0
.end method

.method public floatValue()F
    .registers 3

    .line 176
    invoke-virtual {p0}, Lcom/google/common/cache/LongAdder;->sum()J

    move-result-wide v0

    long-to-float p0, v0

    return p0
.end method

.method final fn(JJ)J
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "v",
            "x"
        }
    .end annotation

    add-long/2addr p1, p3

    return-wide p1
.end method

.method public increment()V
    .registers 3

    const-wide/16 v0, 0x1

    .line 83
    invoke-virtual {p0, v0, v1}, Lcom/google/common/cache/LongAdder;->add(J)V

    return-void
.end method

.method public intValue()I
    .registers 3

    .line 170
    invoke-virtual {p0}, Lcom/google/common/cache/LongAdder;->sum()J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public longValue()J
    .registers 3

    .line 164
    invoke-virtual {p0}, Lcom/google/common/cache/LongAdder;->sum()J

    move-result-wide v0

    return-wide v0
.end method

.method public reset()V
    .registers 3

    const-wide/16 v0, 0x0

    .line 119
    invoke-virtual {p0, v0, v1}, Lcom/google/common/cache/LongAdder;->internalReset(J)V

    return-void
.end method

.method public sum()J
    .registers 7

    .line 100
    iget-wide v0, p0, Lcom/google/common/cache/LongAdder;->base:J

    .line 101
    iget-object p0, p0, Lcom/google/common/cache/LongAdder;->cells:[Lcom/google/common/cache/Striped64$Cell;

    if-eqz p0, :cond_1

    .line 103
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    .line 105
    aget-object v4, p0, v3

    if-eqz v4, :cond_0

    .line 106
    iget-wide v4, v4, Lcom/google/common/cache/Striped64$Cell;->value:J

    add-long/2addr v0, v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-wide v0
.end method

.method public sumThenReset()J
    .registers 10

    .line 131
    iget-wide v0, p0, Lcom/google/common/cache/LongAdder;->base:J

    .line 132
    iget-object v2, p0, Lcom/google/common/cache/LongAdder;->cells:[Lcom/google/common/cache/Striped64$Cell;

    const-wide/16 v3, 0x0

    .line 133
    iput-wide v3, p0, Lcom/google/common/cache/LongAdder;->base:J

    if-eqz v2, :cond_1

    .line 135
    array-length p0, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, p0, :cond_1

    .line 137
    aget-object v6, v2, v5

    if-eqz v6, :cond_0

    .line 139
    iget-wide v7, v6, Lcom/google/common/cache/Striped64$Cell;->value:J

    add-long/2addr v0, v7

    .line 140
    iput-wide v3, v6, Lcom/google/common/cache/Striped64$Cell;->value:J

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 154
    invoke-virtual {p0}, Lcom/google/common/cache/LongAdder;->sum()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
