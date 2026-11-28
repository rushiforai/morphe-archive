.class public final Lcom/google/common/math/Quantiles$ScaleAndIndexes;
.super Ljava/lang/Object;
.source "Quantiles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/math/Quantiles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ScaleAndIndexes"
.end annotation


# instance fields
.field private final indexes:[I

.field private final scale:I


# direct methods
.method private constructor <init>(I[I)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "scale",
            "indexes"
        }
    .end annotation

    .line 326
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    array-length v0, p2

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    aget v3, p2, v2

    .line 328
    # invokes: Lcom/google/common/math/Quantiles;->checkIndex(II)V
    invoke-static {v3, p1}, Lcom/google/common/math/Quantiles;->access$300(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 330
    :cond_0
    array-length v0, p2

    if-lez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    const-string v0, "Indexes must be a non empty array"

    invoke-static {v1, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 331
    iput p1, p0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->scale:I

    .line 332
    iput-object p2, p0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->indexes:[I

    return-void
.end method

.method synthetic constructor <init>(I[ILcom/google/common/math/Quantiles$1;)V
    .registers 4

    .line 321
    invoke-direct {p0, p1, p2}, Lcom/google/common/math/Quantiles$ScaleAndIndexes;-><init>(I[I)V

    return-void
.end method


# virtual methods
.method public compute(Ljava/util/Collection;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/lang/Number;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 347
    invoke-static {p1}, Lcom/google/common/primitives/Doubles;->toArray(Ljava/util/Collection;)[D

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->computeInPlace([D)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public varargs compute([D)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([D)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 361
    invoke-virtual {p1}, [D->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [D

    invoke-virtual {p0, p1}, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->computeInPlace([D)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public varargs compute([I)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 390
    # invokes: Lcom/google/common/math/Quantiles;->intsToDoubles([I)[D
    invoke-static {p1}, Lcom/google/common/math/Quantiles;->access$500([I)[D

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->computeInPlace([D)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public varargs compute([J)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([J)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 376
    # invokes: Lcom/google/common/math/Quantiles;->longsToDoubles([J)[D
    invoke-static {p1}, Lcom/google/common/math/Quantiles;->access$400([J)[D

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->computeInPlace([D)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public varargs computeInPlace([D)Ljava/util/Map;
    .registers 20
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([D)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    .line 404
    array-length v1, v4

    const/4 v7, 0x0

    const/4 v2, 0x1

    if-lez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v7

    :goto_0
    const-string v3, "Cannot calculate quantiles of an empty dataset"

    invoke-static {v1, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 405
    # invokes: Lcom/google/common/math/Quantiles;->containsNaN([D)Z
    invoke-static {v4}, Lcom/google/common/math/Quantiles;->access$600([D)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 406
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 407
    iget-object v0, v0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->indexes:[I

    array-length v2, v0

    :goto_1
    if-ge v7, v2, :cond_1

    aget v3, v0, v7

    .line 408
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-wide/high16 v4, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 410
    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 418
    :cond_2
    iget-object v1, v0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->indexes:[I

    array-length v3, v1

    new-array v8, v3, [I

    .line 419
    array-length v3, v1

    new-array v9, v3, [I

    .line 421
    array-length v1, v1

    shl-int/2addr v1, v2

    new-array v1, v1, [I

    move v3, v7

    move v5, v3

    .line 423
    :goto_2
    iget-object v6, v0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->indexes:[I

    array-length v10, v6

    if-ge v3, v10, :cond_4

    .line 426
    aget v6, v6, v3

    int-to-long v10, v6

    array-length v6, v4

    sub-int/2addr v6, v2

    int-to-long v12, v6

    mul-long/2addr v10, v12

    .line 431
    iget v6, v0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->scale:I

    int-to-long v12, v6

    sget-object v6, Ljava/math/RoundingMode;->DOWN:Ljava/math/RoundingMode;

    invoke-static {v10, v11, v12, v13, v6}, Lcom/google/common/math/LongMath;->divide(JJLjava/math/RoundingMode;)J

    move-result-wide v12

    long-to-int v6, v12

    int-to-long v12, v6

    .line 432
    iget v14, v0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->scale:I

    int-to-long v14, v14

    mul-long/2addr v12, v14

    sub-long/2addr v10, v12

    long-to-int v10, v10

    .line 433
    aput v6, v8, v3

    .line 434
    aput v10, v9, v3

    .line 435
    aput v6, v1, v5

    add-int/lit8 v11, v5, 0x1

    if-eqz v10, :cond_3

    add-int/lit8 v6, v6, 0x1

    .line 438
    aput v6, v1, v11

    add-int/lit8 v5, v5, 0x2

    goto :goto_3

    :cond_3
    move v5, v11

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 442
    :cond_4
    invoke-static {v1, v7, v5}, Ljava/util/Arrays;->sort([III)V

    add-int/lit8 v3, v5, -0x1

    .line 443
    array-length v5, v4

    add-int/lit8 v6, v5, -0x1

    const/4 v2, 0x0

    const/4 v5, 0x0

    # invokes: Lcom/google/common/math/Quantiles;->selectAllInPlace([III[DII)V
    invoke-static/range {v1 .. v6}, Lcom/google/common/math/Quantiles;->access$900([III[DII)V

    .line 445
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 446
    :goto_4
    iget-object v2, v0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->indexes:[I

    array-length v3, v2

    if-ge v7, v3, :cond_6

    .line 447
    aget v3, v8, v7

    .line 448
    aget v4, v9, v7

    if-nez v4, :cond_5

    .line 450
    aget v2, v2, v7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aget-wide v3, p1, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 452
    :cond_5
    aget v2, v2, v7

    .line 453
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aget-wide v10, p1, v3

    add-int/lit8 v3, v3, 0x1

    aget-wide v12, p1, v3

    int-to-double v14, v4

    iget v3, v0, Lcom/google/common/math/Quantiles$ScaleAndIndexes;->scale:I

    int-to-double v3, v3

    move-wide/from16 v16, v3

    # invokes: Lcom/google/common/math/Quantiles;->interpolate(DDDD)D
    invoke-static/range {v10 .. v17}, Lcom/google/common/math/Quantiles;->access$800(DDDD)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 452
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 456
    :cond_6
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
