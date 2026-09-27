.class public Lkotlin/ranges/CharProgression;
.super Ljava/lang/Object;
.source "Progressions.kt"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/ranges/CharProgression$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Ljava/lang/Character;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010\u000c\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0016\u0018\u0000 \u001a2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u001aB!\u0008@\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\n\u0010\u0010\u001a\u00020\u0011H\u0096\u0082\u0004J\n\u0010\u0012\u001a\u00020\u0013H\u0096\u0080\u0004J\u0014\u0010\u0014\u001a\u00020\u00132\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u0096\u0082\u0004J\n\u0010\u0017\u001a\u00020\u0006H\u0096\u0080\u0004J\n\u0010\u0018\u001a\u00020\u0019H\u0096\u0080\u0004R\u0015\u0010\t\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0015\u0010\u000c\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000bR\u0015\u0010\u0005\u001a\u00020\u0006X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u001b"
    }
    d2 = {
        "Lkotlin/ranges/CharProgression;",
        "",
        "",
        "start",
        "endInclusive",
        "step",
        "",
        "<init>",
        "(CCI)V",
        "first",
        "getFirst",
        "()C",
        "last",
        "getLast",
        "getStep",
        "()I",
        "iterator",
        "Lkotlin/collections/CharIterator;",
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
.field public static final Companion:Lkotlin/ranges/CharProgression$Companion;


# instance fields
.field private final first:C

.field private final last:C

.field private final step:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/ranges/CharProgression$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/ranges/CharProgression$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/ranges/CharProgression;->Companion:Lkotlin/ranges/CharProgression$Companion;

    return-void
.end method

.method public constructor <init>(CCI)V
    .registers 5

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p3, :cond_1d

    const/high16 v0, -0x80000000

    if-eq p3, v0, :cond_15

    .line 32
    iput-char p1, p0, Lkotlin/ranges/CharProgression;->first:C

    .line 37
    invoke-static {p1, p2, p3}, Lkotlin/internal/ProgressionUtilKt;->getProgressionLastElement(III)I

    move-result p1

    int-to-char p1, p1

    iput-char p1, p0, Lkotlin/ranges/CharProgression;->last:C

    .line 42
    iput p3, p0, Lkotlin/ranges/CharProgression;->step:I

    return-void

    .line 26
    :cond_15
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be greater than Int.MIN_VALUE to avoid overflow on negation."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 25
    :cond_1d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be non-zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 55
    instance-of v0, p1, Lkotlin/ranges/CharProgression;

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Lkotlin/ranges/CharProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lkotlin/ranges/CharProgression;

    invoke-virtual {v0}, Lkotlin/ranges/CharProgression;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_27

    .line 56
    :cond_13
    iget-char v0, p0, Lkotlin/ranges/CharProgression;->first:C

    check-cast p1, Lkotlin/ranges/CharProgression;

    iget-char v1, p1, Lkotlin/ranges/CharProgression;->first:C

    if-ne v0, v1, :cond_29

    iget-char v0, p0, Lkotlin/ranges/CharProgression;->last:C

    iget-char v1, p1, Lkotlin/ranges/CharProgression;->last:C

    if-ne v0, v1, :cond_29

    iget p0, p0, Lkotlin/ranges/CharProgression;->step:I

    iget p1, p1, Lkotlin/ranges/CharProgression;->step:I

    if-ne p0, p1, :cond_29

    :cond_27
    const/4 p0, 0x1

    return p0

    :cond_29
    const/4 p0, 0x0

    return p0
.end method

.method public final getFirst()C
    .registers 1

    .line 32
    iget-char p0, p0, Lkotlin/ranges/CharProgression;->first:C

    return p0
.end method

.method public final getLast()C
    .registers 1

    .line 37
    iget-char p0, p0, Lkotlin/ranges/CharProgression;->last:C

    return p0
.end method

.method public final getStep()I
    .registers 1

    .line 42
    iget p0, p0, Lkotlin/ranges/CharProgression;->step:I

    return p0
.end method

.method public hashCode()I
    .registers 3

    .line 59
    invoke-virtual {p0}, Lkotlin/ranges/CharProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    iget-char v0, p0, Lkotlin/ranges/CharProgression;->first:C

    mul-int/lit8 v0, v0, 0x1f

    iget-char v1, p0, Lkotlin/ranges/CharProgression;->last:C

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lkotlin/ranges/CharProgression;->step:I

    add-int/2addr v0, p0

    return v0
.end method

.method public isEmpty()Z
    .registers 5

    .line 52
    iget v0, p0, Lkotlin/ranges/CharProgression;->step:I

    iget-char v1, p0, Lkotlin/ranges/CharProgression;->first:C

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-char p0, p0, Lkotlin/ranges/CharProgression;->last:C

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

    .line 17
    invoke-virtual {p0}, Lkotlin/ranges/CharProgression;->iterator()Lkotlin/collections/CharIterator;

    move-result-object p0

    check-cast p0, Ljava/util/Iterator;

    return-object p0
.end method

.method public iterator()Lkotlin/collections/CharIterator;
    .registers 4

    .line 44
    new-instance v0, Lkotlin/ranges/CharProgressionIterator;

    iget-char v1, p0, Lkotlin/ranges/CharProgression;->first:C

    iget-char v2, p0, Lkotlin/ranges/CharProgression;->last:C

    iget p0, p0, Lkotlin/ranges/CharProgression;->step:I

    invoke-direct {v0, v1, v2, p0}, Lkotlin/ranges/CharProgressionIterator;-><init>(CCI)V

    check-cast v0, Lkotlin/collections/CharIterator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 61
    iget v0, p0, Lkotlin/ranges/CharProgression;->step:I

    iget-char v1, p0, Lkotlin/ranges/CharProgression;->first:C

    const-string v2, " step "

    if-lez v0, :cond_27

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-char v1, p0, Lkotlin/ranges/CharProgression;->last:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lkotlin/ranges/CharProgression;->step:I

    :goto_1f
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, " downTo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-char v1, p0, Lkotlin/ranges/CharProgression;->last:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lkotlin/ranges/CharProgression;->step:I

    neg-int p0, p0

    goto :goto_1f
.end method
