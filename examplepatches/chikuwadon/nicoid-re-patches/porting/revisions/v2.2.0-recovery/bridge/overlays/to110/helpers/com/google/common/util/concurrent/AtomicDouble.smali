.class public Lcom/google/common/util/concurrent/AtomicDouble;
.super Ljava/lang/Number;
.source "AtomicDouble.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private transient value:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method public constructor <init>()V
    .registers 3

    const-wide/16 v0, 0x0

    .line 72
    invoke-direct {p0, v0, v1}, Lcom/google/common/util/concurrent/AtomicDouble;-><init>(D)V

    return-void
.end method

.method public constructor <init>(D)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "initialValue"
        }
    .end annotation

    .line 66
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 67
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    invoke-direct {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

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

    .line 240
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 241
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    .line 242
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readDouble()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/AtomicDouble;->set(D)V

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

    .line 233
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 235
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AtomicDouble;->get()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeDouble(D)V

    return-void
.end method


# virtual methods
.method public final addAndGet(D)D
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delta"
        }
    .end annotation

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 175
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    add-double/2addr v2, p1

    .line 177
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v4

    .line 178
    iget-object v6, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v6, v0, v1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    return-wide v2
.end method

.method public final compareAndSet(DD)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "expect",
            "update"
        }
    .end annotation

    .line 125
    iget-object p0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    invoke-static {p3, p4}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p3

    invoke-virtual {p0, p1, p2, p3, p4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result p0

    return p0
.end method

.method public doubleValue()D
    .registers 3

    .line 224
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AtomicDouble;->get()D

    move-result-wide v0

    return-wide v0
.end method

.method public floatValue()F
    .registers 3

    .line 218
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AtomicDouble;->get()D

    move-result-wide v0

    double-to-float p0, v0

    return p0
.end method

.method public final get()D
    .registers 3

    .line 81
    iget-object p0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public final getAndAdd(D)D
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delta"
        }
    .end annotation

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 155
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    add-double v4, v2, p1

    .line 157
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v4

    .line 158
    iget-object v6, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v6, v0, v1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    return-wide v2
.end method

.method public final getAndSet(D)D
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newValue"
        }
    .end annotation

    .line 111
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    .line 112
    iget-object p0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide p0

    return-wide p0
.end method

.method public intValue()I
    .registers 3

    .line 200
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AtomicDouble;->get()D

    move-result-wide v0

    double-to-int p0, v0

    return p0
.end method

.method public final lazySet(D)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newValue"
        }
    .end annotation

    .line 100
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    .line 101
    iget-object p0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->lazySet(J)V

    return-void
.end method

.method public longValue()J
    .registers 3

    .line 209
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AtomicDouble;->get()D

    move-result-wide v0

    double-to-long v0, v0

    return-wide v0
.end method

.method public final set(D)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newValue"
        }
    .end annotation

    .line 90
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    .line 91
    iget-object p0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 191
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AtomicDouble;->get()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final weakCompareAndSet(DD)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "expect",
            "update"
        }
    .end annotation

    .line 142
    iget-object p0, p0, Lcom/google/common/util/concurrent/AtomicDouble;->value:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    invoke-static {p3, p4}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p3

    invoke-virtual {p0, p1, p2, p3, p4}, Ljava/util/concurrent/atomic/AtomicLong;->weakCompareAndSet(JJ)Z

    move-result p0

    return p0
.end method
