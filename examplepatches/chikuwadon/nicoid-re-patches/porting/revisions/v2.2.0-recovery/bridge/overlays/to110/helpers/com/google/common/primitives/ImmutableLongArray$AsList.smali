.class final Lcom/google/common/primitives/ImmutableLongArray$AsList;
.super Ljava/util/AbstractList;
.source "ImmutableLongArray.java"

# interfaces
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/primitives/ImmutableLongArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AsList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Ljava/lang/Long;",
        ">;",
        "Ljava/util/RandomAccess;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2e928dd6214c64f5L


# instance fields
.field private final parent:Lcom/google/common/primitives/ImmutableLongArray;


# direct methods
.method private constructor <init>(Lcom/google/common/primitives/ImmutableLongArray;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parent"
        }
    .end annotation

    .line 495
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 496
    iput-object p1, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/primitives/ImmutableLongArray;Lcom/google/common/primitives/ImmutableLongArray$1;)V
    .registers 3

    .line 491
    invoke-direct {p0, p1}, Lcom/google/common/primitives/ImmutableLongArray$AsList;-><init>(Lcom/google/common/primitives/ImmutableLongArray;)V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 513
    invoke-virtual {p0, p1}, Lcom/google/common/primitives/ImmutableLongArray$AsList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 543
    instance-of v0, p1, Lcom/google/common/primitives/ImmutableLongArray$AsList;

    if-eqz v0, :cond_0

    .line 544
    check-cast p1, Lcom/google/common/primitives/ImmutableLongArray$AsList;

    .line 545
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    iget-object p1, p1, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    invoke-virtual {p0, p1}, Lcom/google/common/primitives/ImmutableLongArray;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 548
    :cond_0
    instance-of v0, p1, Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 551
    :cond_1
    check-cast p1, Ljava/util/List;

    .line 552
    invoke-virtual {p0}, Lcom/google/common/primitives/ImmutableLongArray$AsList;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_2

    return v1

    .line 555
    :cond_2
    iget-object v0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    # getter for: Lcom/google/common/primitives/ImmutableLongArray;->start:I
    invoke-static {v0}, Lcom/google/common/primitives/ImmutableLongArray;->access$100(Lcom/google/common/primitives/ImmutableLongArray;)I

    move-result v0

    .line 557
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 558
    instance-of v3, v2, Ljava/lang/Long;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    # getter for: Lcom/google/common/primitives/ImmutableLongArray;->array:[J
    invoke-static {v3}, Lcom/google/common/primitives/ImmutableLongArray;->access$000(Lcom/google/common/primitives/ImmutableLongArray;)[J

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    aget-wide v5, v3, v0

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v0, v5, v2

    if-nez v0, :cond_3

    move v0, v4

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    const/4 p0, 0x1

    return p0
.end method

.method public get(I)Ljava/lang/Long;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 508
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    invoke-virtual {p0, p1}, Lcom/google/common/primitives/ImmutableLongArray;->get(I)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "index"
        }
    .end annotation

    .line 491
    invoke-virtual {p0, p1}, Lcom/google/common/primitives/ImmutableLongArray$AsList;->get(I)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public hashCode()I
    .registers 1

    .line 568
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    invoke-virtual {p0}, Lcom/google/common/primitives/ImmutableLongArray;->hashCode()I

    move-result p0

    return p0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 518
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/google/common/primitives/ImmutableLongArray;->indexOf(J)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .line 523
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/google/common/primitives/ImmutableLongArray;->lastIndexOf(J)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public size()I
    .registers 1

    .line 503
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    invoke-virtual {p0}, Lcom/google/common/primitives/ImmutableLongArray;->length()I

    move-result p0

    return p0
.end method

.method public spliterator()Ljava/util/Spliterator$OfLong;
    .registers 1

    .line 538
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    invoke-virtual {p0}, Lcom/google/common/primitives/ImmutableLongArray;->spliterator()Ljava/util/Spliterator$OfLong;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic spliterator()Ljava/util/Spliterator;
    .registers 1

    .line 491
    invoke-virtual {p0}, Lcom/google/common/primitives/ImmutableLongArray$AsList;->spliterator()Ljava/util/Spliterator$OfLong;

    move-result-object p0

    return-object p0
.end method

.method public subList(II)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromIndex",
            "toIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 528
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/primitives/ImmutableLongArray;->subArray(II)Lcom/google/common/primitives/ImmutableLongArray;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/primitives/ImmutableLongArray;->asList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 573
    iget-object p0, p0, Lcom/google/common/primitives/ImmutableLongArray$AsList;->parent:Lcom/google/common/primitives/ImmutableLongArray;

    invoke-virtual {p0}, Lcom/google/common/primitives/ImmutableLongArray;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
