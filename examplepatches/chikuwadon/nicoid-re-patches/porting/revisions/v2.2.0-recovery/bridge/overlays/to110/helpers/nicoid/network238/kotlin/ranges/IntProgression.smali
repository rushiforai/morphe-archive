.class public Lnicoid/network238/kotlin/ranges/IntProgression;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/ranges/IntProgression$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/ranges/IntProgression$Companion;


# instance fields
.field private final first:I

.field private final last:I

.field private final step:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/ranges/IntProgression$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/ranges/IntProgression$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/ranges/IntProgression;->Companion:Lnicoid/network238/kotlin/ranges/IntProgression$Companion;

    return-void
.end method

.method public constructor <init>(III)V
    .registers 5

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p3, :cond_1

    const/high16 v0, -0x80000000

    if-eq p3, v0, :cond_0

    .line 93
    iput p1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    .line 98
    invoke-static {p1, p2, p3}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->getProgressionLastElement(III)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    .line 103
    iput p3, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    return-void

    .line 87
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Step must be greater than Int.MIN_VALUE to avoid overflow on negation."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 86
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Step must be non-zero."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 116
    instance-of v0, p1, Lnicoid/network238/kotlin/ranges/IntProgression;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lnicoid/network238/kotlin/ranges/IntProgression;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/ranges/IntProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    check-cast p1, Lnicoid/network238/kotlin/ranges/IntProgression;

    iget v1, p1, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    if-ne v0, v1, :cond_1

    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    iget v1, p1, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    if-ne v0, v1, :cond_1

    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    iget p1, p1, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    if-ne v0, p1, :cond_1

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public final getFirst()I
    .registers 2

    .line 93
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    return v0
.end method

.method public final getLast()I
    .registers 2

    .line 98
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    return v0
.end method

.method public final getStep()I
    .registers 2

    .line 103
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .line 120
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    add-int/2addr v0, v1

    return v0
.end method

.method public isEmpty()Z
    .registers 3

    .line 113
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    if-lez v0, :cond_0

    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    if-le v1, v0, :cond_1

    goto :goto_0

    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    if-ge v1, v0, :cond_1

    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 2

    .line 78
    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->iterator()Lnicoid/network238/kotlin/collections/IntIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lnicoid/network238/kotlin/collections/IntIterator;
    .registers 5

    .line 105
    new-instance v0, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    iget v2, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    iget v3, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    invoke-direct {v0, v1, v2, v3}, Lnicoid/network238/kotlin/ranges/IntProgressionIterator;-><init>(III)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 122
    iget v0, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->first:I

    const-string v2, " step "

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " downTo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->last:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/kotlin/ranges/IntProgression;->step:I

    neg-int v1, v1

    goto :goto_0
.end method
