.class final Lcom/google/common/collect/Cut$AboveValue;
.super Lcom/google/common/collect/Cut;
.source "Cut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Cut;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AboveValue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Ljava/lang/Comparable;",
        ">",
        "Lcom/google/common/collect/Cut<",
        "TC;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method constructor <init>(Ljava/lang/Comparable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "endpoint"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation

    .line 396
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Comparable;

    invoke-direct {p0, p1}, Lcom/google/common/collect/Cut;-><init>(Ljava/lang/Comparable;)V

    return-void
.end method


# virtual methods
.method canonical(Lcom/google/common/collect/DiscreteDomain;)Lcom/google/common/collect/Cut;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "domain"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/DiscreteDomain<",
            "TC;>;)",
            "Lcom/google/common/collect/Cut<",
            "TC;>;"
        }
    .end annotation

    .line 460
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Cut$AboveValue;->leastValueAbove(Lcom/google/common/collect/DiscreteDomain;)Ljava/lang/Comparable;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 461
    invoke-static {p0}, Lcom/google/common/collect/Cut$AboveValue;->belowValue(Ljava/lang/Comparable;)Lcom/google/common/collect/Cut;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {}, Lcom/google/common/collect/Cut;->aboveAll()Lcom/google/common/collect/Cut;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "that"
        }
    .end annotation

    .line 394
    check-cast p1, Lcom/google/common/collect/Cut;

    invoke-super {p0, p1}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result p0

    return p0
.end method

.method describeAsLowerBound(Ljava/lang/StringBuilder;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sb"
        }
    .end annotation

    const/16 v0, 0x28

    .line 440
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    return-void
.end method

.method describeAsUpperBound(Ljava/lang/StringBuilder;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sb"
        }
    .end annotation

    .line 445
    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x5d

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method greatestValueBelow(Lcom/google/common/collect/DiscreteDomain;)Ljava/lang/Comparable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "domain"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/DiscreteDomain<",
            "TC;>;)TC;"
        }
    .end annotation

    .line 455
    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    return-object p0
.end method

.method public hashCode()I
    .registers 1

    .line 466
    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    not-int p0, p0

    return p0
.end method

.method isLessThan(Ljava/lang/Comparable;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)Z"
        }
    .end annotation

    .line 401
    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-static {p0, p1}, Lcom/google/common/collect/Range;->compareOrThrow(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p0

    if-gez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method leastValueAbove(Lcom/google/common/collect/DiscreteDomain;)Ljava/lang/Comparable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "domain"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/DiscreteDomain<",
            "TC;>;)TC;"
        }
    .end annotation

    .line 450
    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-virtual {p1, p0}, Lcom/google/common/collect/DiscreteDomain;->next(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 471
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "\\"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method typeAsLowerBound()Lcom/google/common/collect/BoundType;
    .registers 1

    .line 406
    sget-object p0, Lcom/google/common/collect/BoundType;->OPEN:Lcom/google/common/collect/BoundType;

    return-object p0
.end method

.method typeAsUpperBound()Lcom/google/common/collect/BoundType;
    .registers 1

    .line 411
    sget-object p0, Lcom/google/common/collect/BoundType;->CLOSED:Lcom/google/common/collect/BoundType;

    return-object p0
.end method

.method withLowerBoundType(Lcom/google/common/collect/BoundType;Lcom/google/common/collect/DiscreteDomain;)Lcom/google/common/collect/Cut;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "boundType",
            "domain"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BoundType;",
            "Lcom/google/common/collect/DiscreteDomain<",
            "TC;>;)",
            "Lcom/google/common/collect/Cut<",
            "TC;>;"
        }
    .end annotation

    .line 416
    sget-object v0, Lcom/google/common/collect/Cut$1;->$SwitchMap$com$google$common$collect$BoundType:[I

    invoke-virtual {p1}, Lcom/google/common/collect/BoundType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_0

    return-object p0

    .line 423
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 420
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-virtual {p2, p0}, Lcom/google/common/collect/DiscreteDomain;->next(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object p0

    if-nez p0, :cond_2

    .line 421
    invoke-static {}, Lcom/google/common/collect/Cut;->belowAll()Lcom/google/common/collect/Cut;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p0}, Lcom/google/common/collect/Cut$AboveValue;->belowValue(Ljava/lang/Comparable;)Lcom/google/common/collect/Cut;

    move-result-object p0

    return-object p0
.end method

.method withUpperBoundType(Lcom/google/common/collect/BoundType;Lcom/google/common/collect/DiscreteDomain;)Lcom/google/common/collect/Cut;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "boundType",
            "domain"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BoundType;",
            "Lcom/google/common/collect/DiscreteDomain<",
            "TC;>;)",
            "Lcom/google/common/collect/Cut<",
            "TC;>;"
        }
    .end annotation

    .line 428
    sget-object v0, Lcom/google/common/collect/Cut$1;->$SwitchMap$com$google$common$collect$BoundType:[I

    invoke-virtual {p1}, Lcom/google/common/collect/BoundType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 430
    iget-object p0, p0, Lcom/google/common/collect/Cut$AboveValue;->endpoint:Ljava/lang/Comparable;

    invoke-virtual {p2, p0}, Lcom/google/common/collect/DiscreteDomain;->next(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object p0

    if-nez p0, :cond_0

    .line 431
    invoke-static {}, Lcom/google/common/collect/Cut;->aboveAll()Lcom/google/common/collect/Cut;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/google/common/collect/Cut$AboveValue;->belowValue(Ljava/lang/Comparable;)Lcom/google/common/collect/Cut;

    move-result-object p0

    return-object p0

    .line 435
    :cond_1
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    :cond_2
    return-object p0
.end method
