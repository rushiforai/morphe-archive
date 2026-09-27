.class public Lkotlin/ranges/IntProgression;
.super Ljava/lang/Object;
.source "Progressions.kt"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/ranges/IntProgression$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Ljava/lang/Integer;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010\u0008\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0016\u0018\u0000 \u00182\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0018B!\u0008@\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\n\u0010\u000e\u001a\u00020\u000fH\u0096\u0082\u0004J\n\u0010\u0010\u001a\u00020\u0011H\u0096\u0080\u0004J\u0014\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0096\u0082\u0004J\n\u0010\u0015\u001a\u00020\u0002H\u0096\u0080\u0004J\n\u0010\u0016\u001a\u00020\u0017H\u0096\u0080\u0004R\u0015\u0010\u0008\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0015\u0010\u000b\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\nR\u0015\u0010\u0005\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\n\u00a8\u0006\u0019"
    }
    d2 = {
        "Lkotlin/ranges/IntProgression;",
        "",
        "",
        "start",
        "endInclusive",
        "step",
        "<init>",
        "(III)V",
        "first",
        "getFirst",
        "()I",
        "last",
        "getLast",
        "getStep",
        "iterator",
        "Lkotlin/collections/IntIterator;",
        "isEmpty",
        "",
        "equals",
        "other",
        "",
        "hashCode",
        "toString",
        "",
        "Companion",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lkotlin/ranges/IntProgression$Companion;


# instance fields
.field private final first:I

.field private final last:I

.field private final step:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/ranges/IntProgression$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/ranges/IntProgression$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/ranges/IntProgression;->Companion:Lkotlin/ranges/IntProgression$Companion;

    return-void
.end method

.method public constructor <init>(III)V
    .registers 5

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p3, :cond_1c

    const/high16 v0, -0x80000000

    if-eq p3, v0, :cond_14

    .line 94
    iput p1, p0, Lkotlin/ranges/IntProgression;->first:I

    .line 99
    invoke-static {p1, p2, p3}, Lkotlin/internal/ProgressionUtilKt;->getProgressionLastElement(III)I

    move-result p1

    iput p1, p0, Lkotlin/ranges/IntProgression;->last:I

    .line 104
    iput p3, p0, Lkotlin/ranges/IntProgression;->step:I

    return-void

    .line 88
    :cond_14
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be greater than Int.MIN_VALUE to avoid overflow on negation."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 87
    :cond_1c
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be non-zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 117
    instance-of v0, p1, Lkotlin/ranges/IntProgression;

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Lkotlin/ranges/IntProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lkotlin/ranges/IntProgression;

    invoke-virtual {v0}, Lkotlin/ranges/IntProgression;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_27

    .line 118
    :cond_13
    iget v0, p0, Lkotlin/ranges/IntProgression;->first:I

    check-cast p1, Lkotlin/ranges/IntProgression;

    iget v1, p1, Lkotlin/ranges/IntProgression;->first:I

    if-ne v0, v1, :cond_29

    iget v0, p0, Lkotlin/ranges/IntProgression;->last:I

    iget v1, p1, Lkotlin/ranges/IntProgression;->last:I

    if-ne v0, v1, :cond_29

    iget p0, p0, Lkotlin/ranges/IntProgression;->step:I

    iget p1, p1, Lkotlin/ranges/IntProgression;->step:I

    if-ne p0, p1, :cond_29

    :cond_27
    const/4 p0, 0x1

    return p0

    :cond_29
    const/4 p0, 0x0

    return p0
.end method

.method public final getFirst()I
    .registers 1

    .line 94
    iget p0, p0, Lkotlin/ranges/IntProgression;->first:I

    return p0
.end method

.method public final getLast()I
    .registers 1

    .line 99
    iget p0, p0, Lkotlin/ranges/IntProgression;->last:I

    return p0
.end method

.method public final getStep()I
    .registers 1

    .line 104
    iget p0, p0, Lkotlin/ranges/IntProgression;->step:I

    return p0
.end method

.method public hashCode()I
    .registers 3

    .line 121
    invoke-virtual {p0}, Lkotlin/ranges/IntProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    iget v0, p0, Lkotlin/ranges/IntProgression;->first:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lkotlin/ranges/IntProgression;->last:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lkotlin/ranges/IntProgression;->step:I

    add-int/2addr v0, p0

    return v0
.end method

.method public isEmpty()Z
    .registers 5

    .line 114
    iget v0, p0, Lkotlin/ranges/IntProgression;->step:I

    iget v1, p0, Lkotlin/ranges/IntProgression;->first:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget p0, p0, Lkotlin/ranges/IntProgression;->last:I

    if-lez v0, :cond_e

    if-le v1, p0, :cond_d

    return v2

    :cond_d
    return v3

    :cond_e
    if-ge v1, p0, :cond_11

    return v2

    :cond_11
    return v3
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 79
    invoke-virtual {p0}, Lkotlin/ranges/IntProgression;->iterator()Lkotlin/collections/IntIterator;

    move-result-object p0

    check-cast p0, Ljava/util/Iterator;

    return-object p0
.end method

.method public iterator()Lkotlin/collections/IntIterator;
    .registers 4

    .line 106
    new-instance v0, Lkotlin/ranges/IntProgressionIterator;

    iget v1, p0, Lkotlin/ranges/IntProgression;->first:I

    iget v2, p0, Lkotlin/ranges/IntProgression;->last:I

    iget p0, p0, Lkotlin/ranges/IntProgression;->step:I

    invoke-direct {v0, v1, v2, p0}, Lkotlin/ranges/IntProgressionIterator;-><init>(III)V

    check-cast v0, Lkotlin/collections/IntIterator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 123
    iget v0, p0, Lkotlin/ranges/IntProgression;->step:I

    iget v1, p0, Lkotlin/ranges/IntProgression;->first:I

    const-string v2, " step "

    if-lez v0, :cond_27

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lkotlin/ranges/IntProgression;->last:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lkotlin/ranges/IntProgression;->step:I

    :goto_1f
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " downTo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lkotlin/ranges/IntProgression;->last:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lkotlin/ranges/IntProgression;->step:I

    neg-int p0, p0

    goto :goto_1f
.end method
