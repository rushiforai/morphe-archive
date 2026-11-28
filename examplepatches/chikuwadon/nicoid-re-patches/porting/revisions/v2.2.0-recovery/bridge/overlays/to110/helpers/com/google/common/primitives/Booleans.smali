.class public final Lcom/google/common/primitives/Booleans;
.super Ljava/lang/Object;
.source "Booleans.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/primitives/Booleans$BooleanComparator;,
        Lcom/google/common/primitives/Booleans$LexicographicalComparator;,
        Lcom/google/common/primitives/Booleans$BooleanArrayAsList;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000([ZZII)I
    .registers 4

    .line 49
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/primitives/Booleans;->indexOf([ZZII)I

    move-result p0

    return p0
.end method

.method static synthetic access$100([ZZII)I
    .registers 4

    .line 49
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/primitives/Booleans;->lastIndexOf([ZZII)I

    move-result p0

    return p0
.end method

.method public static varargs asList([Z)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backingArray"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([Z)",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 386
    array-length v0, p0

    if-nez v0, :cond_0

    .line 387
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    .line 389
    :cond_0
    new-instance v0, Lcom/google/common/primitives/Booleans$BooleanArrayAsList;

    invoke-direct {v0, p0}, Lcom/google/common/primitives/Booleans$BooleanArrayAsList;-><init>([Z)V

    return-object v0
.end method

.method private static checkNoOverflow(J)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    long-to-int v0, p0

    int-to-long v1, v0

    cmp-long v1, p0, v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 253
    :goto_0
    const-string v2, "the total number of elements (%s) in the arrays must fit in an int"

    invoke-static {v1, v2, p0, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    return v0
.end method

.method public static compare(ZZ)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .line 129
    invoke-static {p0, p1}, Ljava/lang/Boolean;->compare(ZZ)I

    move-result p0

    return p0
.end method

.method public static varargs concat([[Z)[Z
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "arrays"
        }
    .end annotation

    .line 240
    array-length v0, p0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v0, :cond_0

    aget-object v5, p0, v4

    .line 241
    array-length v5, v5

    int-to-long v5, v5

    add-long/2addr v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 243
    :cond_0
    invoke-static {v1, v2}, Lcom/google/common/primitives/Booleans;->checkNoOverflow(J)I

    move-result v0

    new-array v0, v0, [Z

    .line 245
    array-length v1, p0

    move v2, v3

    move v4, v2

    :goto_1
    if-ge v2, v1, :cond_1

    aget-object v5, p0, v2

    .line 246
    array-length v6, v5

    invoke-static {v5, v3, v0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 247
    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-object v0
.end method

.method public static contains([ZZ)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "target"
        }
    .end annotation

    .line 144
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-boolean v3, p0, v2

    if-ne v3, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static varargs countTrue([Z)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .line 528
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_1

    aget-boolean v3, p0, v1

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static ensureCapacity([ZII)[Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "array",
            "minLength",
            "padding"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 274
    :goto_0
    const-string v3, "Invalid minLength: %s"

    invoke-static {v2, v3, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    if-gez p2, :cond_1

    move v0, v1

    .line 275
    :cond_1
    const-string v1, "Invalid padding: %s"

    invoke-static {v0, v1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 276
    array-length v0, p0

    if-ge v0, p1, :cond_2

    add-int/2addr p1, p2

    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([ZI)[Z

    move-result-object p0

    :cond_2
    return-object p0
.end method

.method public static falseFirst()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 99
    sget-object v0, Lcom/google/common/primitives/Booleans$BooleanComparator;->FALSE_FIRST:Lcom/google/common/primitives/Booleans$BooleanComparator;

    return-object v0
.end method

.method public static hashCode(Z)I
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 111
    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    return p0
.end method

.method public static indexOf([ZZ)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "target"
        }
    .end annotation

    const/4 v0, 0x0

    .line 164
    array-length v1, p0

    invoke-static {p0, p1, v0, v1}, Lcom/google/common/primitives/Booleans;->indexOf([ZZII)I

    move-result p0

    return p0
.end method

.method private static indexOf([ZZII)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "array",
            "target",
            "start",
            "end"
        }
    .end annotation

    :goto_0
    if-ge p2, p3, :cond_1

    .line 170
    aget-boolean v0, p0, p2

    if-ne v0, p1, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static indexOf([Z[Z)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "target"
        }
    .end annotation

    .line 188
    const-string v0, "array"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    const-string v0, "target"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    array-length v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    .line 195
    :goto_0
    array-length v2, p0

    array-length v3, p1

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    if-ge v0, v2, :cond_3

    move v2, v1

    .line 196
    :goto_1
    array-length v3, p1

    if-ge v2, v3, :cond_2

    add-int v3, v0, v2

    .line 197
    aget-boolean v3, p0, v3

    aget-boolean v4, p1, v2

    if-eq v3, v4, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return v0

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method public static varargs join(Ljava/lang/String;[Z)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "separator",
            "array"
        }
    .end annotation

    .line 289
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    array-length v0, p1

    if-nez v0, :cond_0

    .line 291
    const-string p0, ""

    return-object p0

    .line 295
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p1

    mul-int/lit8 v1, v1, 0x7

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    .line 296
    aget-boolean v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    .line 297
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 298
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-boolean v2, p1, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 300
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static lastIndexOf([ZZ)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "target"
        }
    .end annotation

    const/4 v0, 0x0

    .line 215
    array-length v1, p0

    invoke-static {p0, p1, v0, v1}, Lcom/google/common/primitives/Booleans;->lastIndexOf([ZZII)I

    move-result p0

    return p0
.end method

.method private static lastIndexOf([ZZII)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "array",
            "target",
            "start",
            "end"
        }
    .end annotation

    add-int/lit8 p3, p3, -0x1

    :goto_0
    if-lt p3, p2, :cond_1

    .line 221
    aget-boolean v0, p0, p3

    if-ne v0, p1, :cond_0

    return p3

    :cond_0
    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static lexicographicalComparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "[Z>;"
        }
    .end annotation

    .line 317
    sget-object v0, Lcom/google/common/primitives/Booleans$LexicographicalComparator;->INSTANCE:Lcom/google/common/primitives/Booleans$LexicographicalComparator;

    return-object v0
.end method

.method public static reverse([Z)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "array"
        }
    .end annotation

    .line 543
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 544
    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/google/common/primitives/Booleans;->reverse([ZII)V

    return-void
.end method

.method public static reverse([ZII)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "array",
            "fromIndex",
            "toIndex"
        }
    .end annotation

    .line 558
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    array-length v0, p0

    invoke-static {p1, p2, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    add-int/lit8 p2, p2, -0x1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 561
    aget-boolean v0, p0, p1

    .line 562
    aget-boolean v1, p0, p2

    aput-boolean v1, p0, p1

    .line 563
    aput-boolean v0, p0, p2

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static rotate([ZI)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "distance"
        }
    .end annotation

    const/4 v0, 0x0

    .line 578
    array-length v1, p0

    invoke-static {p0, p1, v0, v1}, Lcom/google/common/primitives/Booleans;->rotate([ZIII)V

    return-void
.end method

.method public static rotate([ZIII)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "array",
            "distance",
            "fromIndex",
            "toIndex"
        }
    .end annotation

    .line 595
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    array-length v0, p0

    invoke-static {p2, p3, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    sub-int v0, p3, p2

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 603
    invoke-static {p1, v0}, Ljava/lang/Math;->floorMod(II)I

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    sub-int p1, p3, p1

    .line 610
    invoke-static {p0, p2, p1}, Lcom/google/common/primitives/Booleans;->reverse([ZII)V

    .line 611
    invoke-static {p0, p1, p3}, Lcom/google/common/primitives/Booleans;->reverse([ZII)V

    .line 612
    invoke-static {p0, p2, p3}, Lcom/google/common/primitives/Booleans;->reverse([ZII)V

    return-void
.end method

.method public static toArray(Ljava/util/Collection;)[Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "collection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Boolean;",
            ">;)[Z"
        }
    .end annotation

    .line 358
    instance-of v0, p0, Lcom/google/common/primitives/Booleans$BooleanArrayAsList;

    if-eqz v0, :cond_0

    .line 359
    check-cast p0, Lcom/google/common/primitives/Booleans$BooleanArrayAsList;

    invoke-virtual {p0}, Lcom/google/common/primitives/Booleans$BooleanArrayAsList;->toBooleanArray()[Z

    move-result-object p0

    return-object p0

    .line 362
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object p0

    .line 363
    array-length v0, p0

    .line 364
    new-array v1, v0, [Z

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 367
    aget-object v3, p0, v2

    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    aput-boolean v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public static trueFirst()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 87
    sget-object v0, Lcom/google/common/primitives/Booleans$BooleanComparator;->TRUE_FIRST:Lcom/google/common/primitives/Booleans$BooleanComparator;

    return-object v0
.end method
