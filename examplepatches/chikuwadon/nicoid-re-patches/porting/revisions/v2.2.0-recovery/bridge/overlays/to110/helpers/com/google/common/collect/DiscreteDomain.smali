.class public abstract Lcom/google/common/collect/DiscreteDomain;
.super Ljava/lang/Object;
.source "DiscreteDomain.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/DiscreteDomain$IntegerDomain;,
        Lcom/google/common/collect/DiscreteDomain$LongDomain;,
        Lcom/google/common/collect/DiscreteDomain$BigIntegerDomain;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Ljava/lang/Comparable;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final supportsFastOffset:Z


# direct methods
.method protected constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 251
    invoke-direct {p0, v0}, Lcom/google/common/collect/DiscreteDomain;-><init>(Z)V

    return-void
.end method

.method private constructor <init>(Z)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "supportsFastOffset"
        }
    .end annotation

    .line 255
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 256
    iput-boolean p1, p0, Lcom/google/common/collect/DiscreteDomain;->supportsFastOffset:Z

    return-void
.end method

.method synthetic constructor <init>(ZLcom/google/common/collect/DiscreteDomain$1;)V
    .registers 3

    .line 50
    invoke-direct {p0, p1}, Lcom/google/common/collect/DiscreteDomain;-><init>(Z)V

    return-void
.end method

.method public static bigIntegers()Lcom/google/common/collect/DiscreteDomain;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/DiscreteDomain<",
            "Ljava/math/BigInteger;",
            ">;"
        }
    .end annotation

    .line 200
    # getter for: Lcom/google/common/collect/DiscreteDomain$BigIntegerDomain;->INSTANCE:Lcom/google/common/collect/DiscreteDomain$BigIntegerDomain;
    invoke-static {}, Lcom/google/common/collect/DiscreteDomain$BigIntegerDomain;->access$300()Lcom/google/common/collect/DiscreteDomain$BigIntegerDomain;

    move-result-object v0

    return-object v0
.end method

.method public static integers()Lcom/google/common/collect/DiscreteDomain;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/DiscreteDomain<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 61
    # getter for: Lcom/google/common/collect/DiscreteDomain$IntegerDomain;->INSTANCE:Lcom/google/common/collect/DiscreteDomain$IntegerDomain;
    invoke-static {}, Lcom/google/common/collect/DiscreteDomain$IntegerDomain;->access$000()Lcom/google/common/collect/DiscreteDomain$IntegerDomain;

    move-result-object v0

    return-object v0
.end method

.method public static longs()Lcom/google/common/collect/DiscreteDomain;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/DiscreteDomain<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 125
    # getter for: Lcom/google/common/collect/DiscreteDomain$LongDomain;->INSTANCE:Lcom/google/common/collect/DiscreteDomain$LongDomain;
    invoke-static {}, Lcom/google/common/collect/DiscreteDomain$LongDomain;->access$200()Lcom/google/common/collect/DiscreteDomain$LongDomain;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract distance(Ljava/lang/Comparable;Ljava/lang/Comparable;)J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "start",
            "end"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;TC;)J"
        }
    .end annotation
.end method

.method public maxValue()Ljava/lang/Comparable;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TC;"
        }
    .end annotation

    .line 338
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public minValue()Ljava/lang/Comparable;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TC;"
        }
    .end annotation

    .line 322
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public abstract next(Ljava/lang/Comparable;)Ljava/lang/Comparable;
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
            "(TC;)TC;"
        }
    .end annotation
.end method

.method offset(Ljava/lang/Comparable;J)Ljava/lang/Comparable;
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "origin",
            "distance"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;J)TC;"
        }
    .end annotation

    .line 265
    const-string v0, "distance"

    invoke-static {p2, p3, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(JLjava/lang/String;)J

    const-wide/16 v0, 0x0

    move-object v2, p1

    :goto_0
    cmp-long v3, v0, p2

    if-gez v3, :cond_1

    .line 267
    invoke-virtual {p0, v2}, Lcom/google/common/collect/DiscreteDomain;->next(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    if-eqz v2, :cond_0

    const-wide/16 v3, 0x1

    add-long/2addr v0, v3

    goto :goto_0

    .line 269
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "overflowed computing offset("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    return-object v2
.end method

.method public abstract previous(Ljava/lang/Comparable;)Ljava/lang/Comparable;
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
            "(TC;)TC;"
        }
    .end annotation
.end method
