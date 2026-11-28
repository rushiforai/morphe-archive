.class public final Lcom/google/common/math/Stats;
.super Ljava/lang/Object;
.source "Stats.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static final BYTES:I = 0x28

.field private static final serialVersionUID:J


# instance fields
.field private final count:J

.field private final max:D

.field private final mean:D

.field private final min:D

.field private final sumOfSquaresOfDeltas:D


# direct methods
.method constructor <init>(JDDDD)V
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "count",
            "mean",
            "sumOfSquaresOfDeltas",
            "min",
            "max"
        }
    .end annotation

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-wide p1, p0, Lcom/google/common/math/Stats;->count:J

    .line 91
    iput-wide p3, p0, Lcom/google/common/math/Stats;->mean:D

    .line 92
    iput-wide p5, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    .line 93
    iput-wide p7, p0, Lcom/google/common/math/Stats;->min:D

    .line 94
    iput-wide p9, p0, Lcom/google/common/math/Stats;->max:D

    return-void
.end method

.method public static fromByteArray([B)Lcom/google/common/math/Stats;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "byteArray"
        }
    .end annotation

    .line 632
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    array-length v0, p0

    const/16 v1, 0x28

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "Expected Stats.BYTES = %s remaining , got %s"

    array-length v3, p0

    invoke-static {v0, v2, v1, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;II)V

    .line 638
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/math/Stats;->readFrom(Ljava/nio/ByteBuffer;)Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$toStats$0(Lcom/google/common/math/StatsAccumulator;Ljava/lang/Number;)V
    .registers 4

    .line 223
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/google/common/math/StatsAccumulator;->add(D)V

    return-void
.end method

.method static synthetic lambda$toStats$1(Lcom/google/common/math/StatsAccumulator;Lcom/google/common/math/StatsAccumulator;)Lcom/google/common/math/StatsAccumulator;
    .registers 2

    .line 225
    invoke-virtual {p0, p1}, Lcom/google/common/math/StatsAccumulator;->addAll(Lcom/google/common/math/StatsAccumulator;)V

    return-object p0
.end method

.method public static meanOf(Ljava/lang/Iterable;)D
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Number;",
            ">;)D"
        }
    .end annotation

    .line 479
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/math/Stats;->meanOf(Ljava/util/Iterator;)D

    move-result-wide v0

    return-wide v0
.end method

.method public static meanOf(Ljava/util/Iterator;)D
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+",
            "Ljava/lang/Number;",
            ">;)D"
        }
    .end annotation

    .line 493
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 495
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    const-wide/16 v2, 0x1

    move-wide v4, v2

    .line 496
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 497
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    add-long/2addr v4, v2

    .line 499
    invoke-static {v6, v7}, Ljava/lang/Double;->isFinite(D)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Double;->isFinite(D)Z

    move-result v8

    if-eqz v8, :cond_0

    sub-double/2addr v6, v0

    long-to-double v8, v4

    div-double/2addr v6, v8

    add-double/2addr v0, v6

    goto :goto_0

    .line 503
    :cond_0
    invoke-static {v0, v1, v6, v7}, Lcom/google/common/math/StatsAccumulator;->calculateNewMeanNonFinite(DD)D

    move-result-wide v0

    goto :goto_0

    :cond_1
    return-wide v0
.end method

.method public static varargs meanOf([D)D
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 519
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 520
    aget-wide v0, p0, v1

    .line 521
    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 522
    aget-wide v3, p0, v2

    .line 523
    invoke-static {v3, v4}, Ljava/lang/Double;->isFinite(D)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {v0, v1}, Ljava/lang/Double;->isFinite(D)Z

    move-result v5

    if-eqz v5, :cond_1

    sub-double/2addr v3, v0

    add-int/lit8 v5, v2, 0x1

    int-to-double v5, v5

    div-double/2addr v3, v5

    add-double/2addr v0, v3

    goto :goto_2

    .line 527
    :cond_1
    invoke-static {v0, v1, v3, v4}, Lcom/google/common/math/StatsAccumulator;->calculateNewMeanNonFinite(DD)D

    move-result-wide v0

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-wide v0
.end method

.method public static varargs meanOf([I)D
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 543
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 544
    aget v0, p0, v1

    int-to-double v0, v0

    .line 545
    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 546
    aget v3, p0, v2

    int-to-double v3, v3

    .line 547
    invoke-static {v3, v4}, Ljava/lang/Double;->isFinite(D)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {v0, v1}, Ljava/lang/Double;->isFinite(D)Z

    move-result v5

    if-eqz v5, :cond_1

    sub-double/2addr v3, v0

    add-int/lit8 v5, v2, 0x1

    int-to-double v5, v5

    div-double/2addr v3, v5

    add-double/2addr v0, v3

    goto :goto_2

    .line 551
    :cond_1
    invoke-static {v0, v1, v3, v4}, Lcom/google/common/math/StatsAccumulator;->calculateNewMeanNonFinite(DD)D

    move-result-wide v0

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-wide v0
.end method

.method public static varargs meanOf([J)D
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 568
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 569
    aget-wide v0, p0, v1

    long-to-double v0, v0

    .line 570
    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 571
    aget-wide v3, p0, v2

    long-to-double v3, v3

    .line 572
    invoke-static {v3, v4}, Ljava/lang/Double;->isFinite(D)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-static {v0, v1}, Ljava/lang/Double;->isFinite(D)Z

    move-result v5

    if-eqz v5, :cond_1

    sub-double/2addr v3, v0

    add-int/lit8 v5, v2, 0x1

    int-to-double v5, v5

    div-double/2addr v3, v5

    add-double/2addr v0, v3

    goto :goto_2

    .line 576
    :cond_1
    invoke-static {v0, v1, v3, v4}, Lcom/google/common/math/StatsAccumulator;->calculateNewMeanNonFinite(DD)D

    move-result-wide v0

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-wide v0
.end method

.method public static of(Ljava/lang/Iterable;)Lcom/google/common/math/Stats;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Number;",
            ">;)",
            "Lcom/google/common/math/Stats;"
        }
    .end annotation

    .line 104
    new-instance v0, Lcom/google/common/math/StatsAccumulator;

    invoke-direct {v0}, Lcom/google/common/math/StatsAccumulator;-><init>()V

    .line 105
    invoke-virtual {v0, p0}, Lcom/google/common/math/StatsAccumulator;->addAll(Ljava/lang/Iterable;)V

    .line 106
    invoke-virtual {v0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/util/Iterator;)Lcom/google/common/math/Stats;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+",
            "Ljava/lang/Number;",
            ">;)",
            "Lcom/google/common/math/Stats;"
        }
    .end annotation

    .line 117
    new-instance v0, Lcom/google/common/math/StatsAccumulator;

    invoke-direct {v0}, Lcom/google/common/math/StatsAccumulator;-><init>()V

    .line 118
    invoke-virtual {v0, p0}, Lcom/google/common/math/StatsAccumulator;->addAll(Ljava/util/Iterator;)V

    .line 119
    invoke-virtual {v0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/util/stream/DoubleStream;)Lcom/google/common/math/Stats;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 168
    new-instance v0, Lcom/google/common/math/Stats$0;

    invoke-direct {v0}, Lcom/google/common/math/Stats$0;-><init>()V

    new-instance v1, Lcom/google/common/math/Stats$4;

    invoke-direct {v1}, Lcom/google/common/math/Stats$4;-><init>()V

    new-instance v2, Lcom/google/common/math/Stats$2;

    invoke-direct {v2}, Lcom/google/common/math/Stats$2;-><init>()V

    .line 169
    invoke-interface {p0, v0, v1, v2}, Ljava/util/stream/DoubleStream;->collect(Ljava/util/function/Supplier;Ljava/util/function/ObjDoubleConsumer;Ljava/util/function/BiConsumer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/math/StatsAccumulator;

    .line 170
    invoke-virtual {p0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/util/stream/IntStream;)Lcom/google/common/math/Stats;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 185
    new-instance v0, Lcom/google/common/math/Stats$0;

    invoke-direct {v0}, Lcom/google/common/math/Stats$0;-><init>()V

    new-instance v1, Lcom/google/common/math/Stats$3;

    invoke-direct {v1}, Lcom/google/common/math/Stats$3;-><init>()V

    new-instance v2, Lcom/google/common/math/Stats$2;

    invoke-direct {v2}, Lcom/google/common/math/Stats$2;-><init>()V

    .line 186
    invoke-interface {p0, v0, v1, v2}, Ljava/util/stream/IntStream;->collect(Ljava/util/function/Supplier;Ljava/util/function/ObjIntConsumer;Ljava/util/function/BiConsumer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/math/StatsAccumulator;

    .line 187
    invoke-virtual {p0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/util/stream/LongStream;)Lcom/google/common/math/Stats;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 203
    new-instance v0, Lcom/google/common/math/Stats$0;

    invoke-direct {v0}, Lcom/google/common/math/Stats$0;-><init>()V

    new-instance v1, Lcom/google/common/math/Stats$1;

    invoke-direct {v1}, Lcom/google/common/math/Stats$1;-><init>()V

    new-instance v2, Lcom/google/common/math/Stats$2;

    invoke-direct {v2}, Lcom/google/common/math/Stats$2;-><init>()V

    .line 204
    invoke-interface {p0, v0, v1, v2}, Ljava/util/stream/LongStream;->collect(Ljava/util/function/Supplier;Ljava/util/function/ObjLongConsumer;Ljava/util/function/BiConsumer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/math/StatsAccumulator;

    .line 205
    invoke-virtual {p0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method public static varargs of([D)Lcom/google/common/math/Stats;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 128
    new-instance v0, Lcom/google/common/math/StatsAccumulator;

    invoke-direct {v0}, Lcom/google/common/math/StatsAccumulator;-><init>()V

    .line 129
    invoke-virtual {v0, p0}, Lcom/google/common/math/StatsAccumulator;->addAll([D)V

    .line 130
    invoke-virtual {v0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method public static varargs of([I)Lcom/google/common/math/Stats;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 139
    new-instance v0, Lcom/google/common/math/StatsAccumulator;

    invoke-direct {v0}, Lcom/google/common/math/StatsAccumulator;-><init>()V

    .line 140
    invoke-virtual {v0, p0}, Lcom/google/common/math/StatsAccumulator;->addAll([I)V

    .line 141
    invoke-virtual {v0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method public static varargs of([J)Lcom/google/common/math/Stats;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 151
    new-instance v0, Lcom/google/common/math/StatsAccumulator;

    invoke-direct {v0}, Lcom/google/common/math/StatsAccumulator;-><init>()V

    .line 152
    invoke-virtual {v0, p0}, Lcom/google/common/math/StatsAccumulator;->addAll([J)V

    .line 153
    invoke-virtual {v0}, Lcom/google/common/math/StatsAccumulator;->snapshot()Lcom/google/common/math/Stats;

    move-result-object p0

    return-object p0
.end method

.method static readFrom(Ljava/nio/ByteBuffer;)Lcom/google/common/math/Stats;
    .registers 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 652
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x28

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "Expected at least Stats.BYTES = %s remaining , got %s"

    .line 657
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 653
    invoke-static {v0, v2, v1, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;II)V

    .line 658
    new-instance v4, Lcom/google/common/math/Stats;

    .line 659
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v5

    .line 660
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v7

    .line 661
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v9

    .line 662
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v11

    .line 663
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v13

    invoke-direct/range {v4 .. v14}, Lcom/google/common/math/Stats;-><init>(JDDDD)V

    return-object v4
.end method

.method public static toStats()Ljava/util/stream/Collector;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/stream/Collector<",
            "Ljava/lang/Number;",
            "Lcom/google/common/math/StatsAccumulator;",
            "Lcom/google/common/math/Stats;",
            ">;"
        }
    .end annotation

    .line 221
    new-instance v0, Lcom/google/common/math/Stats$0;

    invoke-direct {v0}, Lcom/google/common/math/Stats$0;-><init>()V

    new-instance v1, Lcom/google/common/math/Stats$5;

    invoke-direct {v1}, Lcom/google/common/math/Stats$5;-><init>()V

    new-instance v2, Lcom/google/common/math/Stats$6;

    invoke-direct {v2}, Lcom/google/common/math/Stats$6;-><init>()V

    new-instance v3, Lcom/google/common/math/Stats$7;

    invoke-direct {v3}, Lcom/google/common/math/Stats$7;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/util/stream/Collector$Characteristics;

    const/4 v5, 0x0

    sget-object v6, Ljava/util/stream/Collector$Characteristics;->UNORDERED:Ljava/util/stream/Collector$Characteristics;

    aput-object v6, v4, v5

    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/stream/Collector;->of(Ljava/util/function/Supplier;Ljava/util/function/BiConsumer;Ljava/util/function/BinaryOperator;Ljava/util/function/Function;[Ljava/util/stream/Collector$Characteristics;)Ljava/util/stream/Collector;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public count()J
    .registers 3

    .line 234
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 427
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    return v0

    .line 430
    :cond_1
    check-cast p1, Lcom/google/common/math/Stats;

    .line 431
    iget-wide v1, p0, Lcom/google/common/math/Stats;->count:J

    iget-wide v3, p1, Lcom/google/common/math/Stats;->count:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    iget-wide v1, p0, Lcom/google/common/math/Stats;->mean:D

    .line 432
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    iget-wide v3, p1, Lcom/google/common/math/Stats;->mean:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    iget-wide v1, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    .line 433
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    iget-wide v3, p1, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    iget-wide v1, p0, Lcom/google/common/math/Stats;->min:D

    .line 434
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    iget-wide v3, p1, Lcom/google/common/math/Stats;->min:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    iget-wide v1, p0, Lcom/google/common/math/Stats;->max:D

    .line 435
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    iget-wide p0, p1, Lcom/google/common/math/Stats;->max:D

    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide p0

    cmp-long p0, v1, p0

    if-nez p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method public hashCode()I
    .registers 7

    .line 446
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/common/math/Stats;->mean:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/common/math/Stats;->min:D

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iget-wide v4, p0, Lcom/google/common/math/Stats;->max:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public max()D
    .registers 5

    .line 403
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 404
    iget-wide v0, p0, Lcom/google/common/math/Stats;->max:D

    return-wide v0
.end method

.method public mean()D
    .registers 5

    .line 259
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 260
    iget-wide v0, p0, Lcom/google/common/math/Stats;->mean:D

    return-wide v0
.end method

.method public min()D
    .registers 5

    .line 385
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 386
    iget-wide v0, p0, Lcom/google/common/math/Stats;->min:D

    return-wide v0
.end method

.method public populationStandardDeviation()D
    .registers 3

    .line 322
    invoke-virtual {p0}, Lcom/google/common/math/Stats;->populationVariance()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public populationVariance()D
    .registers 5

    .line 295
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 296
    iget-wide v0, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    return-wide v0

    .line 299
    :cond_1
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    const-wide/16 v0, 0x0

    return-wide v0

    .line 302
    :cond_2
    iget-wide v0, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    invoke-static {v0, v1}, Lcom/google/common/math/DoubleUtils;->ensureNonNegative(D)D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/common/math/Stats;->count()J

    move-result-wide v2

    long-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public sampleStandardDeviation()D
    .registers 3

    .line 368
    invoke-virtual {p0}, Lcom/google/common/math/Stats;->sampleVariance()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public sampleVariance()D
    .registers 7

    .line 342
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 343
    iget-wide v0, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    return-wide v0

    .line 346
    :cond_1
    iget-wide v0, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    invoke-static {v0, v1}, Lcom/google/common/math/DoubleUtils;->ensureNonNegative(D)D

    move-result-wide v0

    iget-wide v4, p0, Lcom/google/common/math/Stats;->count:J

    sub-long/2addr v4, v2

    long-to-double v2, v4

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public sum()D
    .registers 5

    .line 276
    iget-wide v0, p0, Lcom/google/common/math/Stats;->mean:D

    iget-wide v2, p0, Lcom/google/common/math/Stats;->count:J

    long-to-double v2, v2

    mul-double/2addr v0, v2

    return-wide v0
.end method

.method sumOfSquaresOfDeltas()D
    .registers 3

    .line 465
    iget-wide v0, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    return-wide v0
.end method

.method public toByteArray()[B
    .registers 3

    const/16 v0, 0x28

    .line 594
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 595
    invoke-virtual {p0, v0}, Lcom/google/common/math/Stats;->writeTo(Ljava/nio/ByteBuffer;)V

    .line 596
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 451
    invoke-virtual {p0}, Lcom/google/common/math/Stats;->count()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const-string v1, "count"

    if-lez v0, :cond_0

    .line 452
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/common/math/Stats;->count:J

    .line 453
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "mean"

    iget-wide v2, p0, Lcom/google/common/math/Stats;->mean:D

    .line 454
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;D)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "populationStandardDeviation"

    .line 455
    invoke-virtual {p0}, Lcom/google/common/math/Stats;->populationStandardDeviation()D

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;D)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "min"

    iget-wide v2, p0, Lcom/google/common/math/Stats;->min:D

    .line 456
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;D)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    const-string v1, "max"

    iget-wide v2, p0, Lcom/google/common/math/Stats;->max:D

    .line 457
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;D)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object p0

    .line 458
    invoke-virtual {p0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 460
    :cond_0
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/common/math/Stats;->count:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method writeTo(Ljava/nio/ByteBuffer;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 610
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x28

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "Expected at least Stats.BYTES = %s remaining , got %s"

    .line 615
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 611
    invoke-static {v0, v2, v1, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;II)V

    .line 616
    iget-wide v0, p0, Lcom/google/common/math/Stats;->count:J

    .line 617
    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object p1

    iget-wide v0, p0, Lcom/google/common/math/Stats;->mean:D

    .line 618
    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    move-result-object p1

    iget-wide v0, p0, Lcom/google/common/math/Stats;->sumOfSquaresOfDeltas:D

    .line 619
    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    move-result-object p1

    iget-wide v0, p0, Lcom/google/common/math/Stats;->min:D

    .line 620
    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    move-result-object p1

    iget-wide v0, p0, Lcom/google/common/math/Stats;->max:D

    .line 621
    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    return-void
.end method
