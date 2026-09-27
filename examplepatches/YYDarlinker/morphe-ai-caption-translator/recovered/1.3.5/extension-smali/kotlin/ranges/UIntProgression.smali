.class public Lkotlin/ranges/UIntProgression;
.super Ljava/lang/Object;
.source "UIntRange.kt"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/ranges/UIntProgression$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lkotlin/UInt;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0010(\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0017\u0018\u0000 \u001a2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u001aB!\u0008@\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0010\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0011H\u0086\u0082\u0004J\n\u0010\u0012\u001a\u00020\u0013H\u0096\u0080\u0004J\u0014\u0010\u0014\u001a\u00020\u00132\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u0096\u0082\u0004J\n\u0010\u0017\u001a\u00020\u0006H\u0096\u0080\u0004J\n\u0010\u0018\u001a\u00020\u0019H\u0096\u0080\u0004R\u0017\u0010\t\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\u000c\u001a\u0004\u0008\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\u0002X\u0086\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\u000c\u001a\u0004\u0008\u000e\u0010\u000bR\u0015\u0010\u0005\u001a\u00020\u0006X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000b\u00ca\u0001\u000c\u0008\u001c\u0012\u0008\u0008\u001d\u0012\u0004\u0008\u0008(\u001e\u00a8\u0006\u001b"
    }
    d2 = {
        "Lkotlin/ranges/UIntProgression;",
        "",
        "Lkotlin/UInt;",
        "start",
        "endInclusive",
        "step",
        "",
        "<init>",
        "(IIILkotlin/jvm/internal/DefaultConstructorMarker;)V",
        "first",
        "getFirst-pVg5ArA",
        "()I",
        "I",
        "last",
        "getLast-pVg5ArA",
        "getStep",
        "iterator",
        "",
        "isEmpty",
        "",
        "equals",
        "other",
        "",
        "hashCode",
        "toString",
        "",
        "Companion",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.5"
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
.field public static final Companion:Lkotlin/ranges/UIntProgression$Companion;


# instance fields
.field private final first:I

.field private final last:I

.field private final step:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/ranges/UIntProgression$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/ranges/UIntProgression$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/ranges/UIntProgression;->Companion:Lkotlin/ranges/UIntProgression$Companion;

    return-void
.end method

.method private constructor <init>(III)V
    .registers 5

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p3, :cond_1c

    const/high16 v0, -0x80000000

    if-eq p3, v0, :cond_14

    .line 74
    iput p1, p0, Lkotlin/ranges/UIntProgression;->first:I

    .line 79
    invoke-static {p1, p2, p3}, Lkotlin/internal/UProgressionUtilKt;->getProgressionLastElement-Nkh28Cs(III)I

    move-result p1

    iput p1, p0, Lkotlin/ranges/UIntProgression;->last:I

    .line 84
    iput p3, p0, Lkotlin/ranges/UIntProgression;->step:I

    return-void

    .line 68
    :cond_14
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be greater than Int.MIN_VALUE to avoid overflow on negation."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 67
    :cond_1c
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step must be non-zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public synthetic constructor <init>(IIILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lkotlin/ranges/UIntProgression;-><init>(III)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 97
    instance-of v0, p1, Lkotlin/ranges/UIntProgression;

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Lkotlin/ranges/UIntProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lkotlin/ranges/UIntProgression;

    invoke-virtual {v0}, Lkotlin/ranges/UIntProgression;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_27

    .line 98
    :cond_13
    iget v0, p0, Lkotlin/ranges/UIntProgression;->first:I

    check-cast p1, Lkotlin/ranges/UIntProgression;

    iget v1, p1, Lkotlin/ranges/UIntProgression;->first:I

    if-ne v0, v1, :cond_29

    iget v0, p0, Lkotlin/ranges/UIntProgression;->last:I

    iget v1, p1, Lkotlin/ranges/UIntProgression;->last:I

    if-ne v0, v1, :cond_29

    iget p0, p0, Lkotlin/ranges/UIntProgression;->step:I

    iget p1, p1, Lkotlin/ranges/UIntProgression;->step:I

    if-ne p0, p1, :cond_29

    :cond_27
    const/4 p0, 0x1

    return p0

    :cond_29
    const/4 p0, 0x0

    return p0
.end method

.method public final getFirst-pVg5ArA()I
    .registers 1

    .line 74
    iget p0, p0, Lkotlin/ranges/UIntProgression;->first:I

    return p0
.end method

.method public final getLast-pVg5ArA()I
    .registers 1

    .line 79
    iget p0, p0, Lkotlin/ranges/UIntProgression;->last:I

    return p0
.end method

.method public final getStep()I
    .registers 1

    .line 84
    iget p0, p0, Lkotlin/ranges/UIntProgression;->step:I

    return p0
.end method

.method public hashCode()I
    .registers 3

    .line 101
    invoke-virtual {p0}, Lkotlin/ranges/UIntProgression;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    iget v0, p0, Lkotlin/ranges/UIntProgression;->first:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lkotlin/ranges/UIntProgression;->last:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lkotlin/ranges/UIntProgression;->step:I

    add-int/2addr v0, p0

    return v0
.end method

.method public isEmpty()Z
    .registers 5

    .line 94
    iget v0, p0, Lkotlin/ranges/UIntProgression;->step:I

    iget v1, p0, Lkotlin/ranges/UIntProgression;->first:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget p0, p0, Lkotlin/ranges/UIntProgression;->last:I

    if-lez v0, :cond_12

    invoke-static {v1, p0}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result p0

    if-lez p0, :cond_11

    return v2

    :cond_11
    return v3

    :cond_12
    invoke-static {v1, p0}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result p0

    if-gez p0, :cond_19

    return v2

    :cond_19
    return v3
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lkotlin/UInt;",
            ">;"
        }
    .end annotation

    .line 86
    new-instance v0, Lkotlin/ranges/UIntProgressionIterator;

    iget v1, p0, Lkotlin/ranges/UIntProgression;->first:I

    iget v2, p0, Lkotlin/ranges/UIntProgression;->last:I

    iget p0, p0, Lkotlin/ranges/UIntProgression;->step:I

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, p0, v3}, Lkotlin/ranges/UIntProgressionIterator;-><init>(IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v0, Ljava/util/Iterator;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 103
    iget v0, p0, Lkotlin/ranges/UIntProgression;->step:I

    iget v1, p0, Lkotlin/ranges/UIntProgression;->first:I

    const-string v2, " step "

    if-lez v0, :cond_2f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lkotlin/UInt;->toString-impl(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lkotlin/ranges/UIntProgression;->last:I

    invoke-static {v1}, Lkotlin/UInt;->toString-impl(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lkotlin/ranges/UIntProgression;->step:I

    :goto_27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lkotlin/UInt;->toString-impl(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " downTo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lkotlin/ranges/UIntProgression;->last:I

    invoke-static {v1}, Lkotlin/UInt;->toString-impl(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lkotlin/ranges/UIntProgression;->step:I

    neg-int p0, p0

    goto :goto_27
.end method
